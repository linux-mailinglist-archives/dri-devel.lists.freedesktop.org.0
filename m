Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41799D39BC0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE5E10E305;
	Mon, 19 Jan 2026 01:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kA1skWMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F51B10E305
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:11:59 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b87677a8a96so75087566b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785118; x=1769389918; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fP5YEeeE3B0IdA9ryOj35W/sze8zh4cUnFXv3GSvmyE=;
 b=kA1skWMGq8O+uUc4sFSTQDfCgi7ji1cI04WCIryNgbULLVR4m7sCuJnzSdcbZjGcn3
 +/8Xi2hM90K7YNuvgrykfEXC5OeeqbAB9MvfeuPJmcU55UpQn1F/gxFjpBmhhk/knXra
 CQ752AJRacbtz0X9O5mroXZbTC8HPpntRkCxdgenctYjqrUJzbaRJSPDt/nTrpl0xfV2
 uBXEs6jcwLVR7YOwXg7wHmoki5Me+T/6pyka2kIOFTR/2TAbCpLYFb/JdKMd8NNrEeWI
 krAKHTbbLeydKQkGXNcsEKQ4w+3whbklt+kSvTaWGeCfn2UY6s89Jm4JL9DiDq7gbHAm
 A4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785118; x=1769389918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fP5YEeeE3B0IdA9ryOj35W/sze8zh4cUnFXv3GSvmyE=;
 b=FdlR4DFtD6TwzsQhE2pe+jkWzwW9xB7D30o3H0vHaImWuE+GmbTTCvnxFDwEwrjEVh
 sLnvnOYK7g5Diki43U+u/tU9Pvh6+1W3JUNBlJEZaWrrlV4PCUwRMTnF94mKpCzy8v/V
 juIhHIu6kXzS18uE/jl6vbKFx9NLrHroYgD9E8Mn3J1MwrT8q643TXPzQQ9qDkv/5mmA
 cqXHrfPU3+wIG/yWtd1FMoVs7ZxHjfOA3eMoTCt1ZF20xsg5jLnAFh+fwiwgS1QwdVg9
 +Id7j3HI/jLWHb19w4cT1E2Zwg7ya1SE7FPu+al4R6gTQHEcFmgSJe27TkGNX1po4tKs
 HEKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMotHbFZ/H/RCdvdx7hb8tYTj5ULGasmyZebAIb4/XR7/2FAq7m8rHLPkFFosNoXImyBAtt7a2ftw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrkwtiRGpft+BXi0P90hsiRD8BnnSqNrGhL8fJzVULvPWIE2oh
 W5JhD3RA0s8jVY7gf4fwxB0d1iQEDSI63lGR3QGz4d0p5mnllKy8z/Q3
X-Gm-Gg: AY/fxX6IqGuWFlUBCgIDkoMvaNCH4O4NBU+jcd64Olm4zRtm4gvYJjeZmTop8kRvYHJ
 Ib0AMPM28hy09BI9vWmFpxsRkBKCt/wc1YmEw5l3IS2d5tr8RdtJVSsjtjPKpnAfHTL59Rah+2o
 9PZE0uM6QglIwoSHiQ/7+a4e+WoygHnCjZZaAnRB6GPS9fWGTNh1k+/USUJKwQT6aApIrRhtRtK
 EvHqvpNogmGToZuakWDbRqExJ0roVUgEP3T9zLdU43WZAkUCYpfo42iSZn5qIC7X1YBF/Sbompp
 PzuZj8G1Tm1K0R7iYZ1pNKbMFYgK68TMzvHNwuPe0Za0PFPKW3OvnC9DB4fhF9v6FDGjBIVMfev
 Y4ZujtMVqRC3qWoIb9u6JlVzhW8VYDFKKu+m0Cr5NKJHYBFPggVb9k2RvrouJ1hp0D96CBVINl0
 IRf5Seu418erJKi9COb51vcrTcNO6IPn2bi+hFbdLn8sesY/XepSy9CxhUOgVHoDU6
X-Received: by 2002:a05:6402:510c:b0:649:b47b:2ef7 with SMTP id
 4fb4d7f45d1cf-65452acc99bmr4627590a12.3.1768785117830; 
 Sun, 18 Jan 2026 17:11:57 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:11:57 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 06/17] drm/amd/display: Add PCON VRR ID check override
Date: Mon, 19 Jan 2026 02:11:35 +0100
Message-ID: <20260119011146.62302-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

[Why]
It's currently very hard to test if a random PCON supports VRR and
report it's ID.

[How]
Adds override as part of dc debug mask. Allows faster testing and
reporting of VRR-compatible DP->HDMI adapters.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 6 +++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 8 +++++++-
 drivers/gpu/drm/amd/display/dc/dc.h                       | 1 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h               | 2 +-
 drivers/gpu/drm/amd/include/amd_shared.h                  | 6 ++++++
 5 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 662f51faf949..859e34235769 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2062,6 +2062,9 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 	if (amdgpu_dc_debug_mask & DC_SKIP_DETECTION_LT)
 		adev->dm.dc->debug.skip_detection_link_training = true;
 
+	if (amdgpu_dc_debug_mask & DC_OVERRIDE_PCON_VRR_ID_CHECK)
+		adev->dm.dc->debug.override_pcon_vrr_id_check = true;
+
 	adev->dm.dc->debug.visual_confirm = amdgpu_dc_visual_confirm;
 
 	/* TODO: Remove after DP2 receiver gets proper support of Cable ID feature */
@@ -13279,7 +13282,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (amdgpu_dm_connector->dc_link) {
 		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
 		is_pcon = dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER;
-		pcon_allowed = dm_helpers_is_vrr_pcon_allowed(amdgpu_dm_connector->dc_link);
+		pcon_allowed = dm_helpers_is_vrr_pcon_allowed(
+			amdgpu_dm_connector->dc_link, connector->dev);
 	}
 
 	/* Some eDP panels only have the refresh rate range info in DisplayID */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 76a10fe8d545..2ef515a4e1c4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1375,7 +1375,7 @@ void dm_helpers_dp_mst_update_branch_bandwidth(
 	// TODO
 }
 
-bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link)
+bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link, const struct drm_device *dev)
 {
 	if (link->dpcd_caps.dongle_type != DISPLAY_DONGLE_DP_HDMI_CONVERTER)
 		return false;
@@ -1393,6 +1393,12 @@ bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link)
 		return true;
 	}
 
+	if (link->dc->debug.override_pcon_vrr_id_check) {
+		drm_info(dev, "Overriding VRR PCON check for ID: 0x%06x\n",
+			 link->dpcd_caps.branch_dev_id);
+		return true;
+	}
+
 	return false;
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 4068d5baef21..5be0507f8a27 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1056,6 +1056,7 @@ struct dc_debug_options {
 	bool scl_reset_length10;
 	bool hdmi20_disable;
 	bool skip_detection_link_training;
+	bool override_pcon_vrr_id_check;
 	uint32_t edid_read_retry_times;
 	unsigned int force_odm_combine; //bit vector based on otg inst
 	unsigned int seamless_boot_odm_combine;
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index f8b45a09d680..ea94c52d2b87 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -222,7 +222,7 @@ int dm_helpers_dmub_set_config_sync(struct dc_context *ctx,
 
 enum dc_edid_status dm_helpers_get_sbios_edid(struct dc_link *link, struct dc_edid *edid);
 
-bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link);
+bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link, const struct drm_device *dev);
 bool dm_helpers_is_fullscreen(struct dc_context *ctx, struct dc_stream_state *stream);
 bool dm_helpers_is_hdr_on(struct dc_context *ctx, struct dc_stream_state *stream);
 
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index ac2d3701e2bd..894e1e738ce0 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -412,6 +412,12 @@ enum DC_DEBUG_MASK {
 	 * @DC_SKIP_DETECTION_LT: (0x200000) If set, skip detection link training
 	 */
 	DC_SKIP_DETECTION_LT = 0x200000,
+
+	/**
+	 * @DC_OVERRIDE_PCON_VRR_ID_CHECK: (0x400000) If set, always return true if checking for
+	 * PCON VRR compatibility and print it's ID in kernel log.
+	 */
+	DC_OVERRIDE_PCON_VRR_ID_CHECK = 0x400000,
 };
 
 enum amd_dpm_forced_level;
-- 
2.52.0

