Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114CF54A412
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 04:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0776010FFA1;
	Tue, 14 Jun 2022 02:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EAD10FFA0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 02:06:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7319760A56;
 Tue, 14 Jun 2022 02:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC72C3411B;
 Tue, 14 Jun 2022 02:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172371;
 bh=/MVMVifA0yL1pxv5yJnNl8Fq3u5w5hZsm4kWk3zvpio=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Khw2TLfyjrgCZX59GbJw6t5w5NqpLzoEG0dOoehtCEEB7fONvzjTTuOfeQoVtGWPQ
 ClaLdlrBFQPc7ljQlA5RXrnmpI/h1etW5IAC5B8HiF2I6PZfnw0pF0OYjmILDFexTZ
 Ri0RubEcipVTv7FF8y40PiYMt1TM+Kv0GDsCl4bA6tBdTjA48zvwCoQbSdoUjnHR8a
 83Svn8h0Kw0kRzSsG1JbueRJ7f+LU3NYOKpZxnvH3DzGMtBJnqX27n8K3c9aTLzTNV
 /nCIzONRaJDxdiGW5BjThmnAZX/OQfBXUsBQIQ+YOTWkTppm/IKVRoJs/5CnZ02+lU
 2wPmrKIHhEkmA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 05/43] drm/amdkfd: Use mmget_not_zero in MMU
 notifier
Date: Mon, 13 Jun 2022 22:05:24 -0400
Message-Id: <20220614020602.1098943-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020602.1098943-1-sashal@kernel.org>
References: <20220614020602.1098943-1-sashal@kernel.org>
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
Cc: Philip Yang <Philip.Yang@amd.com>, Sasha Levin <sashal@kernel.org>,
 airlied@linux.ie, Felix Kuehling <Felix.Kuehling@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit fa582c6f3684ac0098a9d02ddf0ed52a02b37127 ]

MMU notifier callback may pass in mm with mm->mm_users==0 when process
is exiting, use mmget_no_zero to avoid accessing invalid mm in deferred
list work after mm is gone.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index ffec25e642e2..ace8f84918b3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2281,6 +2281,8 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 
 	if (range->event == MMU_NOTIFY_RELEASE)
 		return true;
+	if (!mmget_not_zero(mni->mm))
+		return true;
 
 	start = mni->interval_tree.start;
 	last = mni->interval_tree.last;
@@ -2307,6 +2309,7 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 	}
 
 	svm_range_unlock(prange);
+	mmput(mni->mm);
 
 	return true;
 }
-- 
2.35.1

