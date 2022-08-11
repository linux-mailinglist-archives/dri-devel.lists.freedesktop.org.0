Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ABE5901FD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35E1954BB;
	Thu, 11 Aug 2022 16:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A506510EAAE;
 Thu, 11 Aug 2022 16:03:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4703AB82182;
 Thu, 11 Aug 2022 16:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E12C433C1;
 Thu, 11 Aug 2022 16:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660233807;
 bh=DETJOHCyZk9uMEeFcuyCR2LyeCUrvN5IBA3ErPll1DM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QiMV67ZjMWjx9hdll8K/GSuAHwPGbe9M87/9/+9NPSDmp/OiOTBDmud3i6t9nGEPA
 MQmTpO1pAREapvIIfs7APcM3iTuQVr2uLXhmb2pobbFUxxAVO89DvaDHNRVeELn4wN
 sCTVh1aLX+qp+222AzIy8GIMDJ7Zd7BpIucIcnSAUIoY8ezCBC2h/zvg88kkxXK7gB
 wEtfrLCb0uUDT8Vav36HTgmE922SwDtyiLioOCEjdErx9ZGqWSkWzjN8m5PYrHXKon
 T6Mogqrv1mR4iYuPcXwu/gZGVvvbm7uKxKJSOdFthfIjpsoORWdfuE6FljUJJVKqD2
 NtmcwIE5iF1Tg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 60/69] drm/amdkfd: Correct mmu_notifier_get
 failure handling
Date: Thu, 11 Aug 2022 11:56:09 -0400
Message-Id: <20220811155632.1536867-60-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811155632.1536867-1-sashal@kernel.org>
References: <20220811155632.1536867-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 airlied@linux.ie, Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit 0593ad215359d51514c1e6c81ce28ea598efed6b ]

If process has signal pending, mmu_notifier_get_locked fails and calls
ops->free_notifier, kfd_process_free_notifier will schedule
kfd_process_wq_release as process refcount is 1, but process structure
is already freed. This use after free bug causes system crash with
different backtrace.

The fix is to increase process refcount and then decrease the refcount
after mmu_notifier_get success.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 21ec8a18cad2..bc502c378281 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1340,6 +1340,11 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	hash_add_rcu(kfd_processes_table, &process->kfd_processes,
 			(uintptr_t)process->mm);
 
+	/* Avoid free_notifier to start kfd_process_wq_release if
+	 * mmu_notifier_get failed because of pending signal.
+	 */
+	kref_get(&process->ref);
+
 	/* MMU notifier registration must be the last call that can fail
 	 * because after this point we cannot unwind the process creation.
 	 * After this point, mmu_notifier_put will trigger the cleanup by
@@ -1352,6 +1357,7 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	}
 	BUG_ON(mn != &process->mmu_notifier);
 
+	kfd_unref_process(process);
 	get_task_struct(process->lead_thread);
 
 	return process;
-- 
2.35.1

