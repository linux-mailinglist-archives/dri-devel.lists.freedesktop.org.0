Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4E7836671
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01C210F226;
	Mon, 22 Jan 2024 15:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4661010F2CC;
 Mon, 22 Jan 2024 15:01:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BD552B80E85;
 Mon, 22 Jan 2024 15:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD97CC43601;
 Mon, 22 Jan 2024 15:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935714;
 bh=ZHkEk0P2qTHLw9XhIeAWPfwmeaiiIL9Ljn+A83HLoEo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sNSnL7Tu8mRiE8Hr9dZlmr09mhht4QFDvrfdZ3OMr3jsKwyzFzupd06zxXfc1SPbL
 xymGxDQ1RcNkQ29KmSONnxQt8PBTguUzfHCGfE3idRbhSNBLHr9HOe4oU9CfMoKrHv
 UMMNKBDy36lSjYmyQnbs1EKFBJf33u+6Ge4EYYrxeaOkFYrbHYi7lgis7Z+v4arsaJ
 UOKUg1fWUA6FpekXOb3V/WYPNGCOAJuAjNaxc8rGVd37ZOO5m/PPMw9v4seYlt3wO8
 RxnxtUQPN+e5DPQJRSTBUyWYndWtGhy0geXWD2D/cuO0X6XD4GrV8FXphhH57XuQd6
 iVrw9Br52n+wA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 79/88] drm/amdgpu: Fix variable 'mca_funcs'
 dereferenced before NULL check in 'amdgpu_mca_smu_get_mca_entry()'
Date: Mon, 22 Jan 2024 09:51:52 -0500
Message-ID: <20240122145608.990137-79-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: Sasha Levin <sashal@kernel.org>, lijo.lazar@amd.com,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, YiPeng.Chai@amd.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit 4f32504a2f85a7b40fe149436881381f48e9c0c0 ]

Fixes the below:

drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c:377 amdgpu_mca_smu_get_mca_entry() warn: variable dereferenced before check 'mca_funcs' (see line 368)

357 int amdgpu_mca_smu_get_mca_entry(struct amdgpu_device *adev,
				     enum amdgpu_mca_error_type type,
358                                  int idx, struct mca_bank_entry *entry)
359 {
360         const struct amdgpu_mca_smu_funcs *mca_funcs =
						adev->mca.mca_funcs;
361         int count;
362
363         switch (type) {
364         case AMDGPU_MCA_ERROR_TYPE_UE:
365                 count = mca_funcs->max_ue_count;

mca_funcs is dereferenced here.

366                 break;
367         case AMDGPU_MCA_ERROR_TYPE_CE:
368                 count = mca_funcs->max_ce_count;

mca_funcs is dereferenced here.

369                 break;
370         default:
371                 return -EINVAL;
372         }
373
374         if (idx >= count)
375                 return -EINVAL;
376
377         if (mca_funcs && mca_funcs->mca_get_mca_entry)
	        ^^^^^^^^^

Checked too late!

Cc: Yang Wang <kevinyang.wang@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Yang Wang <kevinyang.wang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
index cf33eb219e25..061d88f4480d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
@@ -351,6 +351,9 @@ int amdgpu_mca_smu_get_mca_entry(struct amdgpu_device *adev, enum amdgpu_mca_err
 	const struct amdgpu_mca_smu_funcs *mca_funcs = adev->mca.mca_funcs;
 	int count;
 
+	if (!mca_funcs || !mca_funcs->mca_get_mca_entry)
+		return -EOPNOTSUPP;
+
 	switch (type) {
 	case AMDGPU_MCA_ERROR_TYPE_UE:
 		count = mca_funcs->max_ue_count;
@@ -365,10 +368,7 @@ int amdgpu_mca_smu_get_mca_entry(struct amdgpu_device *adev, enum amdgpu_mca_err
 	if (idx >= count)
 		return -EINVAL;
 
-	if (mca_funcs && mca_funcs->mca_get_mca_entry)
-		return mca_funcs->mca_get_mca_entry(adev, type, idx, entry);
-
-	return -EOPNOTSUPP;
+	return mca_funcs->mca_get_mca_entry(adev, type, idx, entry);
 }
 
 #if defined(CONFIG_DEBUG_FS)
-- 
2.43.0

