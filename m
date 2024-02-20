Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9501C85D225
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA0110E648;
	Wed, 21 Feb 2024 08:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AJMQjjM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BBC10E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 21:13:34 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7872614af89so507132785a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 13:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708463613; x=1709068413;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LFUM0XDK0ZVTj4kCTskFg/BdpgZIKaoWZSjy/zINkgc=;
 b=AJMQjjM9LnlVWQ9TEUBqTijfUUShL09P+Z9+OeLAlQpgsz3TDAPf5lxlO0/3a3qAUH
 2hlGUlZdYYeLIYcuw3FuDwOIQ2r3jtGOsaY6lI/9CpQi2r9HTyb66uGrHkVuh0oI3Wda
 FUuk5YYAbrAFReByvfoxeWF4gj6kH24JgjweA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708463613; x=1709068413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LFUM0XDK0ZVTj4kCTskFg/BdpgZIKaoWZSjy/zINkgc=;
 b=KZ1PTGQGGkyi1OVm39RMNI7BLUt7bZlEGQDCFiBqLTNfQ6EBptFLr7CJMR12fSRYf8
 EFHVwwupFUekoDnjd4uiaAwt3tx1lDkd3GjWBr8zBLCXCtfzutE+IHdu/A97KY9Ea+MO
 zuWrLHIBPVaAE/0Zft/ZidCKugMSygASXI7TmR/kE7bYrTCX//xx7ssrO9AIZom0zfs5
 ImRWSujMorWs/Lw+KYmhrLfExac/g5IH8l45mxCuMGpaHNfSKxRDzn3Tt4cmwKL5qecq
 VBF/2HafzyTsk2slpOoAqbTb5HWCxqNy9JyXvNUeolADCcZPZKC+ZLSrzz41+U3iJ9i6
 6y2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNvdhlt8A9AArsfzTNrgBNctogom+3SJUIDJ1p3+yMUSmYWWKPfd25v0gQ91+suKO3OZMnd0GRdBUF9iseSBiqc8UTkhbR3SmyI+2miGUV
X-Gm-Message-State: AOJu0YxM4EvYqfOTmttm8P0bg8iN/7SNHVio08N8KDtnBIBGpIX1/+M6
 trW65/e8KSASR+Ndv6r3R9qrT3apA15E69h2O+Tdymm3r7u2CIpvUDA2heIpRw==
X-Google-Smtp-Source: AGHT+IGb3TRgQ5pvEKeyUOQD9tS5jn+SqfoEY02pd04BL8Wl35Z1DguYO4ZJspag7M1nm0GQDt/d2Q==
X-Received: by 2002:a05:620a:e8b:b0:787:38a4:7bdd with SMTP id
 w11-20020a05620a0e8b00b0078738a47bddmr22892813qkm.2.1708463613174; 
 Tue, 20 Feb 2024 13:13:33 -0800 (PST)
Received: from kramasub2.cros.corp.google.com ([100.107.108.189])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a05620a134100b0078726621376sm3701207qkl.118.2024.02.20.13.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 13:13:32 -0800 (PST)
From: Karthikeyan Ramasubramanian <kramasub@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Karthikeyan Ramasubramanian <kramasub@chromium.org>,
 stable@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v1] drivers/i915/intel_bios: Fix parsing backlight BDB data
Date: Tue, 20 Feb 2024 14:12:57 -0700
Message-ID: <20240220141256.v1.1.I0690aa3e96a83a43b3fc33f50395d334b2981826@changeid>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 21 Feb 2024 08:08:40 +0000
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

Starting BDB version 239, hdr_dpcd_refresh_timeout is introduced to
backlight BDB data. Commit 700034566d68 ("drm/i915/bios: Define more BDB
contents") updated the backlight BDB data accordingly. This broke the
parsing of backlight BDB data in VBT for versions 236 - 238 (both
inclusive) and hence the backlight controls are not responding on units
with the concerned BDB version.

backlight_control information has been present in backlight BDB data
from at least BDB version 191 onwards, if not before. Hence this patch
extracts the backlight_control information if the block size of
backlight BDB is >= version 191 backlight BDB block size.
Tested on Chromebooks using Jasperlake SoC (reports bdb->version = 236).
Tested on Chromebooks using Raptorlake SoC (reports bdb->version = 251).

Fixes: 700034566d68 ("drm/i915/bios: Define more BDB contents")
Cc: stable@vger.kernel.org
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Karthikeyan Ramasubramanian <kramasub@chromium.org>
---

 drivers/gpu/drm/i915/display/intel_bios.c     | 22 +++++--------------
 drivers/gpu/drm/i915/display/intel_vbt_defs.h |  2 --
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index aa169b0055e97..4ec50903b9e64 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1041,23 +1041,13 @@ parse_lfp_backlight(struct drm_i915_private *i915,
 
 	panel->vbt.backlight.type = INTEL_BACKLIGHT_DISPLAY_DDI;
 	panel->vbt.backlight.controller = 0;
-	if (i915->display.vbt.version >= 191) {
-		size_t exp_size;
+	if (i915->display.vbt.version >= 191 &&
+	    get_blocksize(backlight_data) >= EXP_BDB_LFP_BL_DATA_SIZE_REV_191) {
+		const struct lfp_backlight_control_method *method;
 
-		if (i915->display.vbt.version >= 236)
-			exp_size = sizeof(struct bdb_lfp_backlight_data);
-		else if (i915->display.vbt.version >= 234)
-			exp_size = EXP_BDB_LFP_BL_DATA_SIZE_REV_234;
-		else
-			exp_size = EXP_BDB_LFP_BL_DATA_SIZE_REV_191;
-
-		if (get_blocksize(backlight_data) >= exp_size) {
-			const struct lfp_backlight_control_method *method;
-
-			method = &backlight_data->backlight_control[panel_type];
-			panel->vbt.backlight.type = method->type;
-			panel->vbt.backlight.controller = method->controller;
-		}
+		method = &backlight_data->backlight_control[panel_type];
+		panel->vbt.backlight.type = method->type;
+		panel->vbt.backlight.controller = method->controller;
 	}
 
 	panel->vbt.backlight.pwm_freq_hz = entry->pwm_freq_hz;
diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
index a9f44abfc9fc2..aeea5635a37ff 100644
--- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
@@ -899,8 +899,6 @@ struct lfp_brightness_level {
 
 #define EXP_BDB_LFP_BL_DATA_SIZE_REV_191 \
 	offsetof(struct bdb_lfp_backlight_data, brightness_level)
-#define EXP_BDB_LFP_BL_DATA_SIZE_REV_234 \
-	offsetof(struct bdb_lfp_backlight_data, brightness_precision_bits)
 
 struct bdb_lfp_backlight_data {
 	u8 entry_size;
-- 
2.44.0.rc0.258.g7320e95886-goog

