Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A938554A3FE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 04:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36CC10FF5A;
	Tue, 14 Jun 2022 02:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EE010FF62
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 02:04:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 676B4B81698;
 Tue, 14 Jun 2022 02:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44BBC385A2;
 Tue, 14 Jun 2022 02:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172294;
 bh=osKyJ1+KTbP33abJvrFOEn7PkpMGgyBTQRpahpLYjcc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WlQdejioKkocHT8kSGA0EUYFS61PQDoo98vk1eTTiObUVnGFx+njMSsCDzeJ11/N7
 EAKrQQiAV3tM6yExkoSPAmg/+FlC2xyhyNQkYcRDRc6aRgrOOU1syObUQ7OuSC9oKk
 B6g15L/DJbzAkTT9AKdEeYh7SWjwiWjZq2fHCe8cvPP1dkuOtmW7udt1sLBnV6FOrj
 RLg3ZUqSnYn2KHdRSLOSU6ko/0xBGby+OczzJVa5Zha3n7b9EPjfa3m/5f2CHq3Lik
 XOmJ5GjvXthTItFVuU4ecTVoo22Vk8hDMqleWyHcm3XZ+GYxG1rfM7AcBx82BQrb21
 CroCZy3jZiCnw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 06/47] drm/amdkfd: Use mmget_not_zero in MMU
 notifier
Date: Mon, 13 Jun 2022 22:03:59 -0400
Message-Id: <20220614020441.1098348-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020441.1098348-1-sashal@kernel.org>
References: <20220614020441.1098348-1-sashal@kernel.org>
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
index 3b8856b4cece..5979335d7afd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2286,6 +2286,8 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 
 	if (range->event == MMU_NOTIFY_RELEASE)
 		return true;
+	if (!mmget_not_zero(mni->mm))
+		return true;
 
 	start = mni->interval_tree.start;
 	last = mni->interval_tree.last;
@@ -2312,6 +2314,7 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 	}
 
 	svm_range_unlock(prange);
+	mmput(mni->mm);
 
 	return true;
 }
-- 
2.35.1

