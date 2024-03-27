Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5639288DD21
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08B010FA6A;
	Wed, 27 Mar 2024 12:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hlhbx/M9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5846110FA6A;
 Wed, 27 Mar 2024 12:06:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C98B861529;
 Wed, 27 Mar 2024 12:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8205FC43390;
 Wed, 27 Mar 2024 12:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541215;
 bh=+J7ERlUOqwzi8/rVnchw03P5BC09HJILEOn2wX+hlzc=;
 h=From:To:Cc:Subject:Date:From;
 b=hlhbx/M9AVnSW+gQHForzSHGIEoK+QxP1Me/6Bo5HK6saz9NgaXJxxsIF2f+FUwZO
 NNsniJjlY8Z/AT/ULn6rv6QX8w0TCNv9Vj0DPRs/HOBijQYxVOcuSftvmY2LEwalfV
 Oeav1fTmuUzRVRLjMcoHcnvct65/juDoxLIkFE7qqxAzCSYShmudIYkdcdFP9JiLIV
 A5XA5Jjj8m0ybY31bgafg8SCspTOP54JPE40BpLz6HzSkxjPmKlwewjbjQP6bCQpu3
 KZ17cPyM1bfWjiSYfAch5M682FF6dQ+ZAFmocaFsETSrMm9sZEEvuxjm4A6yk7l+4h
 c4pzq/3/xITCw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	corngood@gmail.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd: Don't init MEC2 firmware when it fails to
 load" failed to apply to 6.8-stable tree
Date: Wed, 27 Mar 2024 08:06:53 -0400
Message-ID: <20240327120653.2824861-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch below does not apply to the 6.8-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From c3ec8c4f9a470c026066ac7b2e4bac898bc7ff02 Mon Sep 17 00:00:00 2001
From: David McFarland <corngood@gmail.com>
Date: Mon, 29 Jan 2024 18:18:22 -0400
Subject: [PATCH] drm/amd: Don't init MEC2 firmware when it fails to load

The same calls are made directly above, but conditional on the firmware
loading and validating successfully.

Cc: stable@vger.kernel.org
Fixes: 9931b67690cf ("drm/amd: Load GFX10 microcode during early_init")
Signed-off-by: David McFarland <corngood@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index be4d5c1e826f3..b02d63328f1cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4027,8 +4027,6 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 		err = 0;
 		adev->gfx.mec2_fw = NULL;
 	}
-	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
-	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
 
 	gfx_v10_0_check_fw_write_wait(adev);
 out:
-- 
2.43.0




