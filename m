Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD46D65A6A1
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 21:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1668210E29D;
	Sat, 31 Dec 2022 20:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFB710E297;
 Sat, 31 Dec 2022 20:05:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8FEC5B80906;
 Sat, 31 Dec 2022 20:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC65C433D2;
 Sat, 31 Dec 2022 20:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672517140;
 bh=vPjXtMkTjZo8i1uEvZ9hNs9r/5PNZTCV+uUHAufChzE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f9enGUiAgX9VaO7IVuk1b2blZaaVvxJYu/SLkZ5ml61Var+2IDGPlilL7qr1MdxeU
 qjqUE2h4VfyS+JCPhZGkjwXqlvojHvb6QAxZ/8hl8//zNR6lRUe1B9SZ6ODa75blmo
 s4rLduQctkdwALjPKktHTyWxdTtLy7vinqWCMcgb2OIr6g+O3koVSRYMSYPJUTs16n
 3cJ337PA36IUe7Hqx4XWZ1cc9l0pry+sW4Qpg9coADMssLXzFOB9Q1rjr9QxjjZd1V
 kx1pw9BIDn7FiKlPZo+XondsffcO7xUTPTFBP6Jlh62i7FWe58y+XFCt/NZRR0Uiwq
 Q1pdsq+JqrY9w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 5/7] drm/amdgpu: Fix size validation for
 non-exclusive domains (v4)
Date: Sat, 31 Dec 2022 15:05:00 -0500
Message-Id: <20221231200502.1748784-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221231200502.1748784-1-sashal@kernel.org>
References: <20221231200502.1748784-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, Philip.Yang@amd.com,
 dri-devel@lists.freedesktop.org, sunpeng.li@amd.com, Felix.Kuehling@amd.com,
 Xinhui.Pan@amd.com, rajneesh.bhardwaj@amd.com,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, matthew.auld@intel.com,
 Alex Deucher <alexander.deucher@amd.com>, Yuliang.Shi@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luben Tuikov <luben.tuikov@amd.com>

[ Upstream commit 7554886daa31eacc8e7fac9e15bbce67d10b8f1f ]

Fix amdgpu_bo_validate_size() to check whether the TTM domain manager for the
requested memory exists, else we get a kernel oops when dereferencing "man".

v2: Make the patch standalone, i.e. not dependent on local patches.
v3: Preserve old behaviour and just check that the manager pointer is not
    NULL.
v4: Complain if GTT domain requested and it is uninitialized--most likely a
    bug.

Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 4570ad449390..eb2fa63d93d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -446,27 +446,24 @@ static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
 
 	/*
 	 * If GTT is part of requested domains the check must succeed to
-	 * allow fall back to GTT
+	 * allow fall back to GTT.
 	 */
 	if (domain & AMDGPU_GEM_DOMAIN_GTT) {
 		man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 
-		if (size < man->size)
+		if (man && size < man->size)
 			return true;
-		else
-			goto fail;
-	}
-
-	if (domain & AMDGPU_GEM_DOMAIN_VRAM) {
+		else if (!man)
+			WARN_ON_ONCE("GTT domain requested but GTT mem manager uninitialized");
+		goto fail;
+	} else if (domain & AMDGPU_GEM_DOMAIN_VRAM) {
 		man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 
-		if (size < man->size)
+		if (man && size < man->size)
 			return true;
-		else
-			goto fail;
+		goto fail;
 	}
 
-
 	/* TODO add more domains checks, such as AMDGPU_GEM_DOMAIN_CPU */
 	return true;
 
-- 
2.35.1

