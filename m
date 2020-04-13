Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4E01A6E95
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 23:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40CF89AEB;
	Mon, 13 Apr 2020 21:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from saul.pp3345.net (saul.pp3345.net [163.172.111.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D2689ADC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 21:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 dev@pp3345.net)
 by saul.pp3345.net (Postcow) with ESMTPSA id E7CE79A45E9;
 Mon, 13 Apr 2020 23:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pp3345.net; s=saul;
 t=1586814168; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:autocrypt;
 bh=mLQh6rOSSTr8rmQR2noDfKObP5yY0fFQpqQZs6nN01o=;
 b=S3g50iG3NvTpyXkm0fE3BQrytPBc0hVuNOqZqWWZReRhYHDkPpv/AWcOtXAzK+RO2Z9caZ
 niApSpo3IrrnTCrYQGcch+t49uDyopW2VQZz0oBUWTpley6Ndrp/lLwHZNP9/CoydXdtVA
 x9zoiMG/JruBzaD+Wf3oIC89cTG5HA50ZGFWQJBh1/Zp4UFZMEZebvHSIz/WlG71f7BI5D
 MTagjHk5oN8XqAzkmb1abCSp4pRUhmX0XGqrHIg/satzT2ItkZ8S+zLVRkr5XFmMvb8C2U
 4S+vdW4qHMRx7ymW2Ls/HIuAilhsS0rMhyueo5sTCw7RowA+Mbd/TaVNk0af4w==
From: Yussuf Khalil <dev@pp3345.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] drm/modes: Indicate CEA-861 CE modes to user-space
Date: Mon, 13 Apr 2020 23:40:22 +0200
Message-Id: <20200413214024.46500-2-dev@pp3345.net>
In-Reply-To: <20200413214024.46500-1-dev@pp3345.net>
References: <20200413214024.46500-1-dev@pp3345.net>
MIME-Version: 1.0
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
Cc: Yussuf Khalil <dev@pp3345.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new flag to mark modes that are considered a CE mode according to the
CEA-861 specification. Modes without this flag are implicitly considered to
be IT modes.

User-space applications may use this flag to determine possible
implications of using a CE mode (e.g., limited RGB range).

There is no use for this flag inside the kernel, so we set it only when
communicating a mode to user-space.

Signed-off-by: Yussuf Khalil <dev@pp3345.net>
---
 drivers/gpu/drm/drm_modes.c | 14 ++++++++++++++
 include/uapi/drm/drm_mode.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index d4d64518e11b..0d8a032f437d 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1973,6 +1973,14 @@ void drm_mode_convert_to_umode(struct drm_mode_modeinfo *out,
 		break;
 	}
 
+	if (drm_match_cea_mode(in) > 1) {
+		/*
+		 * All modes in CTA-861-G Table 1 are CE modes, except 640x480p
+		 * (VIC 1).
+		 */
+		out->flags |= DRM_MODE_FLAG_CEA_861_CE_MODE;
+	}
+
 	strncpy(out->name, in->name, DRM_DISPLAY_MODE_LEN);
 	out->name[DRM_DISPLAY_MODE_LEN-1] = 0;
 }
@@ -2045,6 +2053,12 @@ int drm_mode_convert_umode(struct drm_device *dev,
 		return -EINVAL;
 	}
 
+	/*
+	 * The CEA-861 CE mode flag is purely informational and intended for
+	 * userspace only.
+	 */
+	out->flags &= ~DRM_MODE_FLAG_CEA_861_CE_MODE;
+
 	out->status = drm_mode_validate_driver(dev, out);
 	if (out->status != MODE_OK)
 		return -EINVAL;
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 735c8cfdaaa1..5e78b350b2e2 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -124,6 +124,8 @@ extern "C" {
 #define  DRM_MODE_FLAG_PIC_AR_256_135 \
 			(DRM_MODE_PICTURE_ASPECT_256_135<<19)
 
+#define DRM_MODE_FLAG_CEA_861_CE_MODE (1<<23)
+
 #define  DRM_MODE_FLAG_ALL	(DRM_MODE_FLAG_PHSYNC |		\
 				 DRM_MODE_FLAG_NHSYNC |		\
 				 DRM_MODE_FLAG_PVSYNC |		\
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
