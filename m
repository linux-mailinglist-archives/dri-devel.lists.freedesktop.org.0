Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586168585B2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 19:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C52B10E082;
	Fri, 16 Feb 2024 18:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="TJRY9CNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627EE10E082
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 18:49:30 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51197ca63f5so1485763e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1708109368; x=1708714168;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8UiwuDn6wK4mPDjZ7FcH6ttJwRecMiCcgmgCfq3GA8o=;
 b=TJRY9CNmMiW5XqkWomAOZd0yJEVaQF5MZCC8xt76MkNrgxgIXZe2BKFh/SS/HUlv2a
 upnzmXAkrt5QwMLZSCP4Fa+Sl8ZTAmERj42aSV2uyaWvkkA9gKJ57xEnxhjNjfMh0xUV
 6d5EOXOjupoDMwLJ2OB4b0MSj3RnHbzprPOTadQPSsd5lfIvOUZnRkx2DxnDitDwPmJW
 6k7ZaRukkpu9ZDGYjbJGnLJyUlWWSMN5Z+y9Jn39e+2ukWeUBCY/tO4+VBdN5qCWESvB
 2Z9D1uJF2vmdLVOx/8ZWJYsb6Wx4cDc2YeFycypUt4kKKg1KF9omfOvXKQJuH+RwR+CO
 4DUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708109368; x=1708714168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8UiwuDn6wK4mPDjZ7FcH6ttJwRecMiCcgmgCfq3GA8o=;
 b=ve2rUWFP28RpucRn1jHUPkzuvDwa9uYi5lxH5aUWozHC7EeCZDqXsVJSSShXr038pJ
 EZoj7vie2vw3MSiBXtDgspbSvC4PkCKXbfrYcv2TLGhBZ+i4aydFb8brdp3C67akGqbJ
 9oYvK5ms6SpEjSOwHaA82rhySqHFe6mD20brDe4PJEyiNzEk+6jniX9qam7PBfcwCw47
 IOsfLlBY4mktg9j6wFMhR6TW3R6lNZfLpPtRp3Y/oQPRIkaCrSpXvXArMMq/1KcbzAht
 AGdmdjXxCvSUtXXObSsRCEw1MRCKdE89tUof7gvp9Rq6di67mZaGWb31QsVOrpq3HeTY
 zzJQ==
X-Gm-Message-State: AOJu0Yx5P3tc9s6k6lKshA0hDHLtKt9P7tmtPYmLU0zc89Aj/sCvORhr
 QCEUXjHBLZvcNqQRwzfUS31An5DitoNtWVQ3JQhHslChgWHIt05uBPm2J6MSbjlC3uV5PraBzED
 v
X-Google-Smtp-Source: AGHT+IF/Ndr2i8UoMAV09KY7KS1b+ZBv9aFNhatIIAclddTyZvfiY4cbLKw6qRwEtT+c44PGLUm+CA==
X-Received: by 2002:a19:650e:0:b0:511:79ee:5f98 with SMTP id
 z14-20020a19650e000000b0051179ee5f98mr4190742lfb.18.1708109367977; 
 Fri, 16 Feb 2024 10:49:27 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([188.39.149.98])
 by smtp.googlemail.com with ESMTPSA id
 tj1-20020a170907c24100b00a3d1b3c5f1esm235108ejc.77.2024.02.16.10.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 10:49:27 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Date: Fri, 16 Feb 2024 18:48:55 +0000
Message-Id: <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
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

From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>

Add this as a value for enum_drm_connector_tv_mode, represented
by the string "Mono", to generate video with no colour encoding
or bursts. Define it to have no pedestal (since only NTSC-M calls
for a pedestal).

Change default mode creation to acommodate the new tv_mode value
which comprises both 525-line and 625-line formats.

Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/drm_connector.c    | 7 +++++++
 drivers/gpu/drm/drm_modes.c        | 5 ++++-
 drivers/gpu/drm/drm_probe_helper.c | 5 +++--
 include/drm/drm_connector.h        | 7 +++++++
 4 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b0516505f7ae..fe05d27f3404 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1005,6 +1005,7 @@ static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
 	{ DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
 	{ DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
 	{ DRM_MODE_TV_MODE_SECAM, "SECAM" },
+	{ DRM_MODE_TV_MODE_MONOCHROME, "Mono" },
 };
 DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)
 
@@ -1697,6 +1698,12 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
  *		TV Mode is CCIR System B (aka 625-lines) together with
  *		the SECAM Color Encoding.
  *
+ *	Mono:
+ *
+ *		Use timings appropriate to the DRM mode, including
+ *		equalizing pulses for a 525-line or 625-line mode,
+ *		with no pedestal or color encoding.
+ *
  *	Drivers can set up this property by calling
  *	drm_mode_create_tv_properties().
  */
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index c4f88c3a93b7..d274e7b00b79 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -530,7 +530,8 @@ static int fill_analog_mode(struct drm_device *dev,
  * @interlace: whether to compute an interlaced mode
  *
  * This function creates a struct drm_display_mode instance suited for
- * an analog TV output, for one of the usual analog TV mode.
+ * an analog TV output, for one of the usual analog TV modes. Where
+ * this is DRM_MODE_TV_MODE_MONOCHROME, a 625-line mode will be created.
  *
  * Note that @hdisplay is larger than the usual constraints for the PAL
  * and NTSC timings, and we'll choose to ignore most timings constraints
@@ -568,6 +569,8 @@ struct drm_display_mode *drm_analog_tv_mode(struct drm_device *dev,
 	case DRM_MODE_TV_MODE_PAL_N:
 		fallthrough;
 	case DRM_MODE_TV_MODE_SECAM:
+		fallthrough;
+	case DRM_MODE_TV_MODE_MONOCHROME:
 		analog = DRM_MODE_ANALOG_PAL;
 		break;
 
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index d1e1ade66f81..9254dc2af873 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -1211,8 +1211,9 @@ int drm_connector_helper_tv_get_modes(struct drm_connector *connector)
 	for (i = 0; i < tv_mode_property->num_values; i++)
 		supported_tv_modes |= BIT(tv_mode_property->values[i]);
 
-	if ((supported_tv_modes & ntsc_modes) &&
-	    (supported_tv_modes & pal_modes)) {
+	if (((supported_tv_modes & ntsc_modes) &&
+	     (supported_tv_modes & pal_modes)) ||
+	    (supported_tv_modes & BIT(DRM_MODE_TV_MODE_MONOCHROME))) {
 		uint64_t default_mode;
 
 		if (drm_object_property_get_default_value(&connector->base,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fe88d7fc6b8f..90fd0ea0ca09 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -200,6 +200,13 @@ enum drm_connector_tv_mode {
 	 */
 	DRM_MODE_TV_MODE_SECAM,
 
+	/**
+	 * @DRM_MODE_TV_MODE_MONOCHROME: Use timings appropriate to
+	 * the DRM mode, including equalizing pulses for a 525-line
+	 * or 625-line mode, with no pedestal or color encoding.
+	 */
+	DRM_MODE_TV_MODE_MONOCHROME,
+
 	/**
 	 * @DRM_MODE_TV_MODE_MAX: Number of analog TV output modes.
 	 *
-- 
2.25.1

