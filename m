Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC95A54853D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D1710E76B;
	Mon, 13 Jun 2022 12:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343A810E75A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:58 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id s6so8562525lfo.13
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HvgBZ/wxFTMRsoozfmjp5r8bkC3aSM+z2+YcZ7FnUIA=;
 b=RybLK0fOrAEOD+lS5CLeGjqF6OQ3AlmOpnnUTdxUpbhYb5n+IrqT8xm2/e1T0++Kzz
 UWpcnt33VliZkKsHoSB6A+75H7ICSEJP4o+1+vlpZu+UR2G3I3JdK0ah8ica/6Tjy9zB
 /2tIm+iN4PbSVXML2UOccVWoJfM+N4a21LL890nXtqeOLWL7bBjJDv6pgzZt7nabICrn
 hyW64rpakYcPngdhgOluZbl4vApFLWx9BF+52ci7Lugp5Z5uDDc7JnPARbBf2l++uGc+
 CNrIzBO+iv4JSt2fcf1p+GLtPjuGIYL6hdu3BWKpTlmxDKFfG5qXvLl77P4pmm8Y+4SS
 vRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HvgBZ/wxFTMRsoozfmjp5r8bkC3aSM+z2+YcZ7FnUIA=;
 b=Tm+rmW4M8MoCqgRND+0LhV87WlI1MqzqzqlCntNlhp4/Szd9n8MArLlvdYqkbiZg0b
 kh1M696Y8Qgf2FXUNLa7TRquuJuKZyLZWJB/Qi7uRehd9VUB8athuydwkcT/mH6AUEtq
 rW/aIXneQGRiJCXCZhMwDPuTQEBnrLY+7zxVnbLQCNh9NEaFoI4xvikaXP5I5TPNxqw8
 /x4SGEkz2Usrci2Q9T3WaP1YxY0c6u1UdQBz+Xo30hW/LrIFlS3mfyRwOru0PoEfMFP/
 VKYDNUYG6EBOlX5GUJh5A6bnonLyZ55VQ8LTiyU+Cs7it3LVXnXpReCLv1Uh60CF335r
 mXBg==
X-Gm-Message-State: AOAM531qXNrEmboleO6GlmfTJzbqRp65eUkn/myI43/WWldU82G6RU9v
 E67yOIGIpiRclsQLuM7Jv6na2mZ6Js0=
X-Google-Smtp-Source: ABdhPJw+iR7CainHc9HyEk/eEjaEdIKuJDF8zFYnlMmIoSYXAnBONAPEJ45blrIkavmFblV3F2ulnA==
X-Received: by 2002:a05:6512:c1b:b0:479:150b:c7c9 with SMTP id
 z27-20020a0565120c1b00b00479150bc7c9mr31077178lfu.574.1655123696115; 
 Mon, 13 Jun 2022 05:34:56 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:55 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/19] drm/gma500: Unify struct *_intel_lvds_helper_funcs
Date: Mon, 13 Jun 2022 14:34:30 +0200
Message-Id: <20220613123436.15185-14-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These now only contains generic gma functions so create
gma_lvds_helper_funcs that both PSB and CDV can use. Oaktrail still
needs the modeset callback refactored to align with PSB and CDV.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 11 +----------
 drivers/gpu/drm/gma500/gma_lvds.c       | 14 +++++++++++---
 drivers/gpu/drm/gma500/gma_lvds.h       |  5 ++---
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 10 +---------
 4 files changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index ddfb976b6059..80ccc00c47e5 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -136,15 +136,6 @@ static int cdv_intel_lvds_set_property(struct drm_connector *connector,
 	return 0;
 }
 
-static const struct drm_encoder_helper_funcs
-					cdv_intel_lvds_helper_funcs = {
-	.dpms = gma_lvds_encoder_dpms,
-	.mode_fixup = gma_lvds_mode_fixup,
-	.prepare = gma_lvds_prepare,
-	.mode_set = gma_lvds_mode_set,
-	.commit = gma_lvds_commit,
-};
-
 static const struct drm_connector_helper_funcs
 				cdv_intel_lvds_connector_helper_funcs = {
 	.get_modes = cdv_intel_lvds_get_modes,
@@ -286,7 +277,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 	gma_encoder->type = INTEL_OUTPUT_LVDS;
 
-	drm_encoder_helper_add(encoder, &cdv_intel_lvds_helper_funcs);
+	drm_encoder_helper_add(encoder, &gma_lvds_helper_funcs);
 	drm_connector_helper_add(connector,
 				 &cdv_intel_lvds_connector_helper_funcs);
 	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index 215bf8f7d41f..bf9fa5ebdbd3 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -299,9 +299,9 @@ void gma_lvds_commit(struct drm_encoder *encoder)
 	gma_lvds_set_power(dev, true);
 }
 
-void gma_lvds_mode_set(struct drm_encoder *encoder,
-		       struct drm_display_mode *mode,
-		       struct drm_display_mode *adjusted_mode)
+static void gma_lvds_mode_set(struct drm_encoder *encoder,
+			      struct drm_display_mode *mode,
+			      struct drm_display_mode *adjusted_mode)
 {
 	struct drm_device *dev = encoder->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
@@ -334,3 +334,11 @@ void gma_lvds_mode_set(struct drm_encoder *encoder,
 	REG_WRITE(PFIT_CONTROL, pfit_control);
 }
 
+const struct drm_encoder_helper_funcs gma_lvds_helper_funcs = {
+	.dpms = gma_lvds_encoder_dpms,
+	.mode_fixup = gma_lvds_mode_fixup,
+	.prepare = gma_lvds_prepare,
+	.mode_set = gma_lvds_mode_set,
+	.commit = gma_lvds_commit,
+};
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index ebba869a25b7..3c47bea859ad 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -34,8 +34,7 @@ bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
 			 struct drm_display_mode *adjusted_mode);
 void gma_lvds_prepare(struct drm_encoder *encoder);
 void gma_lvds_commit(struct drm_encoder *encoder);
-void gma_lvds_mode_set(struct drm_encoder *encoder,
-		       struct drm_display_mode *mode,
-		       struct drm_display_mode *adjusted_mode);
+
+extern const struct drm_encoder_helper_funcs gma_lvds_helper_funcs;
 
 #endif
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 553f6cb5f322..29a9b4ea5803 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -236,14 +236,6 @@ int psb_intel_lvds_set_property(struct drm_connector *connector,
 	return -1;
 }
 
-static const struct drm_encoder_helper_funcs psb_intel_lvds_helper_funcs = {
-	.dpms = gma_lvds_encoder_dpms,
-	.mode_fixup = gma_lvds_mode_fixup,
-	.prepare = gma_lvds_prepare,
-	.mode_set = gma_lvds_mode_set,
-	.commit = gma_lvds_commit,
-};
-
 const struct drm_connector_helper_funcs
 				psb_intel_lvds_connector_helper_funcs = {
 	.get_modes = psb_intel_lvds_get_modes,
@@ -329,7 +321,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 	gma_encoder->type = INTEL_OUTPUT_LVDS;
 
-	drm_encoder_helper_add(encoder, &psb_intel_lvds_helper_funcs);
+	drm_encoder_helper_add(encoder, &gma_lvds_helper_funcs);
 	drm_connector_helper_add(connector,
 				 &psb_intel_lvds_connector_helper_funcs);
 	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
-- 
2.36.1

