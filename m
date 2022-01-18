Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9DF49175D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 03:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E724311290A;
	Tue, 18 Jan 2022 02:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7856F11290A;
 Tue, 18 Jan 2022 02:41:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0F03612BD;
 Tue, 18 Jan 2022 02:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B871CC36AEB;
 Tue, 18 Jan 2022 02:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473689;
 bh=ZE5dsaoNj8qyo4ImDQroynSx3KZtWAsOjL0c8M5iZPY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=grLHJfSDiAyQ8iH48U8OF4hksVkKdmpn9ep9nn8joLskVj4tdgIq9Sg9AXBGU72Gv
 vUhNkALhW8OpqkQTdVdfwfWEk/kNkSwUdgoU3fFBNldx9+ckKK1dGaLQr+b6WvWSfY
 K+JRJDukdZDsuYhTHsORqXasf9o5BFkybgWn2oZK8+UtYtPz3TKiFO8axGcTw/4g/N
 y0J5UhOGkDg7ufaa4VfmuseurLszBww5dl6W5m+u8rWOtQvWEfm7/vXA2Ymo8OHgTm
 OVNgzFgdzBgtKTMvx+d6QHi5xI1qvi2TiE7E5bSlZjDCGDrbKntGVaWjeDtPxzUNm5
 w7B6zdllDznGw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 023/116] drm/amdgpu/display: set
 vblank_disable_immediate for DC
Date: Mon, 17 Jan 2022 21:38:34 -0500
Message-Id: <20220118024007.1950576-23-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118024007.1950576-1-sashal@kernel.org>
References: <20220118024007.1950576-1-sashal@kernel.org>
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
Cc: Yong.Zhao@amd.com, Philip.Yang@amd.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 aurabindo.pillai@amd.com, qingqing.zhuo@amd.com, Anson.Jacob@amd.com,
 nikola.cornij@amd.com, Emily.Deng@amd.com, shenshih@amd.com,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, Roman.Li@amd.com,
 christian.koenig@amd.com, tzimmermann@suse.de, Wayne.Lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, nicholas.kazlauskas@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 92020e81ddbeac351ea4a19bcf01743f32b9c800 ]

Disable vblanks immediately to save power.  I think this was
missed when we merged DC support.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1781
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c           | 1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 2f70fdd6104f2..582055136cdbf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -267,7 +267,6 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
 	if (!amdgpu_device_has_dc_support(adev)) {
 		if (!adev->enable_virtual_display)
 			/* Disable vblank IRQs aggressively for power-saving */
-			/* XXX: can this be enabled for DC? */
 			adev_to_drm(adev)->vblank_disable_immediate = true;
 
 		r = drm_vblank_init(adev_to_drm(adev), adev->mode_info.num_crtc);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a5b6f36fe1d72..6c8f141103da4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1069,6 +1069,9 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 	adev_to_drm(adev)->mode_config.cursor_width = adev->dm.dc->caps.max_cursor_size;
 	adev_to_drm(adev)->mode_config.cursor_height = adev->dm.dc->caps.max_cursor_size;
 
+	/* Disable vblank IRQs aggressively for power-saving */
+	adev_to_drm(adev)->vblank_disable_immediate = true;
+
 	if (drm_vblank_init(adev_to_drm(adev), adev->dm.display_indexes_num)) {
 		DRM_ERROR(
 		"amdgpu: failed to initialize sw for display support.\n");
-- 
2.34.1

