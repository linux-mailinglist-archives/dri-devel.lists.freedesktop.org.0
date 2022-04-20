Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F5A508746
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 13:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDBC10E3EC;
	Wed, 20 Apr 2022 11:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00AF10E5E3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 11:45:40 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id r19so1032316wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 04:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vxAaLTkBoUBaCL/O3581iu7gQKfuo3i9c87P/ALffLw=;
 b=glNX7oyFIiDjUhuM/RiuAr+tK3D1huhhvWxzoQlzfMk8Gksi5NXqlb2Y3BJdneoA6J
 UsCP2Sfbwc5F++EVTRcrOae335Zwn+ngDNnD0cGmaan2pOGxdcv9QitSYBBkWVsovkGm
 0jxZGGPGbk5sxYXjX8fqVegGG2sXm/pJuDZmkAB3BBSRDB3MwBFpnim4fwcIH8OsHlB+
 Ipuhq1cRD4TJKuuJYCu2j7k/C9VDTGQv2ozoUdurNkmSINkMjrNb7sxaGP6egzkZl+j7
 uv/Ntefi1ZY6rOEFU7netp0P+Ta/cF9NHNx66RJEDoKMAcg79VFlIhuZ6OKW903nHptM
 xuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vxAaLTkBoUBaCL/O3581iu7gQKfuo3i9c87P/ALffLw=;
 b=mZT5sK6oK9aQWh3Ov27uEFonmy3x7HGp//CLkV+yru6LigXMrpn4HugJsr8OFdgPT3
 RNZtL9jVeqvYsifkZDslvh6PO1qigm1SIt0T1VHj4YklaZsG3H3ztrncF3g8dJlNSPbN
 XQsv0E8jrx5EjQ3z2d+HcGIOoAe9M5HskwxJrnOch1VHDTIbEuNcUH0zsdSoAyyyfIZH
 I7P1o9Y7ifQfp1TeKeeHZLrYqzHL0AmMG6pZs7UMgNLf75HcPyqmMgv22NEaz0nSpUXv
 D+kXP53M8Z6tpclGH4tqzKgzdQTf+72x12RACPC0sLFT+I2Drw4zAEBGzlmmr2DaOx+T
 Zmcg==
X-Gm-Message-State: AOAM531vUlSIbV6Ib6Iol8+OIhc/A9gHT9W+QsqcpiKUwcl1nUGMje5p
 /phb5NzVQ23FLebA1AXoujY=
X-Google-Smtp-Source: ABdhPJxyCesVNQOMZOE2I3so6+MUSyrfDzSvRYyfLFcfGCB8v9AzI2UMpkSbtsil4zNu5fGHiuiIJw==
X-Received: by 2002:a05:600c:1f11:b0:392:aaf8:df7c with SMTP id
 bd17-20020a05600c1f1100b00392aaf8df7cmr3128422wmb.148.1650455139381; 
 Wed, 20 Apr 2022 04:45:39 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
 by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm17798204wri.0.2022.04.20.04.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 04:45:39 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: emma@anholt.net
Subject: [PATCH v3 1/2] drm/vc4: hdmi: Replace drm_detect_hdmi_monitor() with
 is_hdmi
Date: Wed, 20 Apr 2022 13:44:59 +0200
Message-Id: <20220420114500.187664-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420114500.187664-1-jose.exposito89@gmail.com>
References: <20220420114500.187664-1-jose.exposito89@gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Once EDID is parsed, the monitor HDMI support information is cached in
drm_display_info.is_hdmi by drm_parse_hdmi_vsdb_video().

This driver calls drm_detect_hdmi_monitor() to receive the same
information and stores its own cached value in
vc4_hdmi_encoder.hdmi_monitor, which is less efficient.

Avoid calling drm_detect_hdmi_monitor() and use drm_display_info.is_hdmi
instead. This also allows to remove vc4_hdmi_encoder.hdmi_monitor.

drm_detect_hdmi_monitor() is called in vc4_hdmi_connector_detect() and
vc4_hdmi_connector_get_modes(). In both cases it is safe to rely on
drm_display_info.is_hdmi as shown by ftrace:

$ sudo trace-cmd record -p function_graph -l "vc4_hdmi_*" -l "drm_*"

vc4_hdmi_connector_detect:

    vc4_hdmi_connector_detect() {
      drm_get_edid() {
        drm_connector_update_edid_property() {
          drm_add_display_info() {
            drm_reset_display_info();
            drm_for_each_detailed_block.part.0();
            drm_parse_cea_ext() {
              drm_find_cea_extension();
              drm_parse_hdmi_vsdb_video();
              /* drm_display_info.is_hdmi is cached here */
            }
          }
        }
      }
      /* drm_display_info.is_hdmi is used here */
    }

vc4_hdmi_connector_get_modes:

    vc4_hdmi_connector_get_modes() {
      drm_get_edid() {
        drm_connector_update_edid_property() {
          drm_add_display_info() {
            drm_reset_display_info();
            drm_for_each_detailed_block.part.0();
            drm_parse_cea_ext() {
              drm_find_cea_extension();
              drm_parse_hdmi_vsdb_video();
              /* drm_display_info.is_hdmi is cached here */
            }
          }
        }
      }
      /* drm_display_info.is_hdmi is used here */
      drm_connector_update_edid_property();
    }

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 ++++++-----------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 -
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 6c58b0fd13fb..9c73a211ae80 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -107,9 +107,9 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode)
 static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
 				       const struct drm_display_mode *mode)
 {
-	struct vc4_hdmi_encoder *vc4_encoder = &vc4_hdmi->encoder;
+	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 
-	return !vc4_encoder->hdmi_monitor ||
+	return !display->is_hdmi ||
 		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
 }
 
@@ -216,7 +216,6 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 			if (edid) {
 				cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
-				vc4_hdmi->encoder.hdmi_monitor = drm_detect_hdmi_monitor(edid);
 				kfree(edid);
 			}
 		}
@@ -242,7 +241,6 @@ static void vc4_hdmi_connector_destroy(struct drm_connector *connector)
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
-	struct vc4_hdmi_encoder *vc4_encoder = &vc4_hdmi->encoder;
 	int ret = 0;
 	struct edid *edid;
 
@@ -255,8 +253,6 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		goto out;
 	}
 
-	vc4_encoder->hdmi_monitor = drm_detect_hdmi_monitor(edid);
-
 	drm_connector_update_edid_property(connector, edid);
 	ret = drm_add_edid_modes(connector, edid);
 	kfree(edid);
@@ -578,13 +574,12 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
 					 struct drm_display_mode *mode)
 {
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
-	if (!vc4_encoder->hdmi_monitor)
+	if (!display->is_hdmi)
 		return false;
 
 	if (!display->hdmi.scdc.supported ||
@@ -1147,7 +1142,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
+	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	unsigned long flags;
@@ -1168,7 +1163,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_BLANKPIX);
 
-	if (vc4_encoder->hdmi_monitor) {
+	if (display->is_hdmi) {
 		HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
 			   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
 			   VC4_HDMI_SCHEDULER_CONTROL_MODE_HDMI);
@@ -1195,7 +1190,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 			  "!VC4_HDMI_SCHEDULER_CONTROL_HDMI_ACTIVE\n");
 	}
 
-	if (vc4_encoder->hdmi_monitor) {
+	if (display->is_hdmi) {
 		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 		WARN_ON(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 1076faeab616..44977002445f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -11,7 +11,6 @@
 /* VC4 HDMI encoder KMS struct */
 struct vc4_hdmi_encoder {
 	struct vc4_encoder base;
-	bool hdmi_monitor;
 };
 
 static inline struct vc4_hdmi_encoder *
-- 
2.25.1

