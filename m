Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 650F165A69D
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 21:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3744910E14D;
	Sat, 31 Dec 2022 20:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE9610E0AC;
 Sat, 31 Dec 2022 20:05:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9A76CB8090B;
 Sat, 31 Dec 2022 20:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CA7C433D2;
 Sat, 31 Dec 2022 20:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672517098;
 bh=SLnJY5TbJnCeT5slXbEhQc1RHJ85vV2RtaZO0EawmyA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SS2GWx12O8GfAmpbtKl6hS/DXwTthXL2egu4BrbZmXGar45jyvwjLMvGrEiIZuPR9
 /ZySQEg8cwv1oXtIbqwJUXGPIXMgoCplwDv+tS9zj51PdKkFpZuaJobF2KaTpuhwHA
 UZdisf5m3Rtwu1a1CWP4rbLoqGEHPbXTVV8N04LSpRa6LzBMAAd5qvkV/1GhXhQgdk
 mHtHjg9yLob67lSMEB2u673qQ6F24c0UYW1mGUbX+GxzMys3CdhMEMtv1eQ9JaNKdu
 U0fxGUZ55tQv0Jq2rEDmkO/Tj4dJrbTHXhYIsJKiTPD/DJYtKJDY5hKv9qXAcNPG9W
 nIdZAzRbUfpYw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 5/7] drm/amdgpu: Fix size validation for
 non-exclusive domains (v4)
Date: Sat, 31 Dec 2022 15:04:37 -0500
Message-Id: <20221231200439.1748686-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221231200439.1748686-1-sashal@kernel.org>
References: <20221231200439.1748686-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Philip.Yang@amd.com, guchun.chen@amd.com,
 sunpeng.li@amd.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 rajneesh.bhardwaj@amd.com, AMD Graphics <amd-gfx@lists.freedesktop.org>,
 michael.j.ruhl@intel.com, Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Yuliang.Shi@amd.com,
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
index 2e8f6cd7a729..33e266433e9b 100644
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

