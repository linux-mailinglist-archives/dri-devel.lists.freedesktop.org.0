Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2F0D13A9F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 16:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84583890EB;
	Mon, 12 Jan 2026 15:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lpg9efCT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0674890EB;
 Mon, 12 Jan 2026 15:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768231741;
 bh=2EBOUlFdg3MszkEBGNlnfrYy2xczDbjzxVzmkBS+tt8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lpg9efCTjL9dEcFCNwqHaMJbX0lZhj+F9+dNTVXtFuT1nb0YzDRn8IIa2LqU85lwE
 xcZ/fg/UcpNjWs/DHM3prQFyQhpdYwLVYpKUDpHWgzAKBZwVMsGtNS2e+PbXBtokI8
 GQtKXxQVh+/TYoAPM2+/Z/bT44afLkB0rtdDLDqYmhDhHII93Ttpv2tuCWZp07UNPm
 xVHKS+BGltaLFfs1JEu/qxmkW9zchhWn6lokjh67RixNh8nfqabSH0TYWzvj/pf3rP
 UZsgc2E36Hy6SMcv0ypJjNGAVn84pZVmtWGvyrRabqA/ucQyG10LHYqF1e3FTjr1k5
 SpxLSw9a9vhAw==
Received: from nemo.lan (unknown [IPv6:2a07:244:40:6b00::646])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vivek)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E938917E13F1;
 Mon, 12 Jan 2026 16:29:00 +0100 (CET)
From: Vivek Das Mohapatra <vivek@collabora.com>
To: superm1@kernel.org
Cc: airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com,
 kernel@collabora.com, linux-kernel@vger.kernel.org, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, vivek@collabora.com
Subject: [PATCH v2] drm/amd/display: Initialise backlight level values from hw
Date: Mon, 12 Jan 2026 15:28:56 +0000
Message-Id: <20260112152856.2616532-1-vivek@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <7ec7b4ae-6186-4961-a857-f97afcfc3ded@kernel.org>
References: <7ec7b4ae-6186-4961-a857-f97afcfc3ded@kernel.org>
MIME-Version: 1.0
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

Internal backlight levels are initialised from ACPI but the values
are sometimes out of sync with the levels in effect until there has
been a read from hardware (eg triggered by reading from sysfs).

This means that the first drm_commit can cause the levels to be set
to a different value than the actual starting one, which results in
a sudden change in brightness.

This path shows the problem (when the values are out of sync):

   amdgpu_dm_atomic_commit_tail()
   -> amdgpu_dm_commit_streams()
   -> amdgpu_dm_backlight_set_level(..., dm->brightness[n])

This patch calls the backlight ops get_brightness explicitly
at the end of backlight registration to make sure dm->brightness[n]
is in sync with the actual hardware levels.

Signed-off-by: Vivek Das Mohapatra <vivek@collabora.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 354e359c4507..9e8cbfeee915 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5258,6 +5258,8 @@ amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
 	struct amdgpu_dm_backlight_caps *caps;
 	char bl_name[16];
 	int min, max;
+	int real_brightness;
+	int init_brightness;
 
 	if (aconnector->bl_idx == -1)
 		return;
@@ -5282,6 +5284,8 @@ amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
 	} else
 		props.brightness = props.max_brightness = MAX_BACKLIGHT_LEVEL;
 
+	init_brightness = props.brightness;
+
 	if (caps->data_points && !(amdgpu_dc_debug_mask & DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE)) {
 		drm_info(drm, "Using custom brightness curve\n");
 		props.scale = BACKLIGHT_SCALE_NON_LINEAR;
@@ -5300,8 +5304,20 @@ amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
 	if (IS_ERR(dm->backlight_dev[aconnector->bl_idx])) {
 		drm_err(drm, "DM: Backlight registration failed!\n");
 		dm->backlight_dev[aconnector->bl_idx] = NULL;
-	} else
+	} else {
+		/*
+		 * dm->brightness[x] can be inconsistent just after startup until
+		 * ops.get_brightness is called.
+		 */
+		real_brightness =
+			amdgpu_dm_backlight_ops.get_brightness(dm->backlight_dev[aconnector->bl_idx]);
+
+		if (real_brightness != init_brightness) {
+			dm->actual_brightness[aconnector->bl_idx] = real_brightness;
+			dm->brightness[aconnector->bl_idx] = real_brightness;
+		}
 		drm_dbg_driver(drm, "DM: Registered Backlight device: %s\n", bl_name);
+	}
 }
 
 static int initialize_plane(struct amdgpu_display_manager *dm,
-- 
2.39.5

