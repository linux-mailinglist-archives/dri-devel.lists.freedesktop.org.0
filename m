Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EE343B14E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427B76E3EC;
	Tue, 26 Oct 2021 11:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6A96E3EC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 11:34:40 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id z24so13124446qtv.9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 04:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aY3LH0lI65RLzOt7MIGcFNyCUGeK9Gvq4WungNdLgNg=;
 b=XKzjMo1lRCpEbEAI/KcFfbLC90MtgRsqNs7LbvSavjixBVTII6kKU/mxlTun+CqYo6
 rBIg2GL1sGR+rZ2HUrAfZlR1rrCRIpgtubnB3K34wxGfByM0lguULHxCNiswQdmY49xS
 0HfXX9N1hFdUkLryuJimQwOVOcC+waWrD2Upx+HV9w6Fafo21CyRV/fHdqUX5MChRrwx
 b2jrkDopZEiy7h2x7TMWGzBOOsunPZjHBSM7gIdhNAxTW7wxrPtWTGyQVno1MGH4wK2f
 DIF1FAcCXDYaxbOCMCmZLgIgAWrDZk3Tha8XaW/h40F+iWXlmD+GFn5PWS6QthdCvwQL
 j6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aY3LH0lI65RLzOt7MIGcFNyCUGeK9Gvq4WungNdLgNg=;
 b=ZbHTR2cC+g3edtRH/Xwv24Xg/S14t3T5V6+/z4MoWuaRDlUkQrYeZX6alxf4pL5sIl
 jKzLPVfcKb2CduCZJz7Xb5HmAG16dwDjcpgR4Cv6iW1JaoqJmyTw0z7Fn2Nw/Bea/cjL
 tChJ1HGLFX2F3H/kMejgjTrymcAMPcYIuhvjMmlEKB3tFr504LnBt6OBS9RU2quWvUAc
 QG5qiE42ASIzOF96pTqIXJlTM2Y5jujSpJtQ7P3Ka9JP+JxREUDrm1zr/NP2GS/uBCct
 xIUOpCNAEdxhEQiQtB2+q3ryOBh6RDYdd+Yb6VyYUhc9T7agr7tsRWYLQqZlp21BRSwG
 J70Q==
X-Gm-Message-State: AOAM530ITGvCZMMVHbbZgZd6EmMCl50c35nFNVCMt+zFS/E5Q0Hvg+0V
 x6uaGZGZtjT8a16DLYNhkjs=
X-Google-Smtp-Source: ABdhPJwDOFoWZjWZ3H1bzviKxHxAUcxuRxi+sdvFTGLdrUSEoA7e/RhfHR9Rt65avdQIX9uxAErB3g==
X-Received: by 2002:a05:622a:449:: with SMTP id
 o9mr24009362qtx.141.1635248079645; 
 Tue, 26 Oct 2021 04:34:39 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:5469:b11e:67b8:49d2:1744])
 by smtp.googlemail.com with ESMTPSA id f3sm11117691qko.32.2021.10.26.04.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:34:39 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Cc: Igor Torrente <igormtorrente@gmail.com>, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, airlied@linux.ie, contact@emersion.fr,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm: drm_atomic_helper: Add a new helper to deal with
 the writeback connector validation
Date: Tue, 26 Oct 2021 08:34:05 -0300
Message-Id: <20211026113409.7242-6-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026113409.7242-1-igormtorrente@gmail.com>
References: <20211026113409.7242-1-igormtorrente@gmail.com>
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

Add a helper function to validate the connector configuration receive in
the encoder atomic_check by the drivers.

So the drivers don't need do these common validations themselves.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
V2: Move the format verification to a new helper at the drm_atomic_helper.c
    (Thomas Zimmermann).
---
 drivers/gpu/drm/drm_atomic_helper.c   | 47 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_writeback.c |  9 +++--
 include/drm/drm_atomic_helper.h       |  3 ++
 3 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 2c0c6ec92820..c2653b9824b5 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -766,6 +766,53 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
 
+/**
+ * drm_atomic_helper_check_wb_connector_state() - Check writeback encoder state
+ * @encoder: encoder state to check
+ * @conn_state: connector state to check
+ *
+ * Checks if the wriback connector state is valid, and returns a erros if it
+ * isn't.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int
+drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
+					 struct drm_connector_state *conn_state)
+{
+	struct drm_writeback_job *wb_job = conn_state->writeback_job;
+	struct drm_property_blob *pixel_format_blob;
+	bool format_supported = false;
+	struct drm_framebuffer *fb;
+	int i, n_formats;
+	u32 *formats;
+
+	if (!wb_job || !wb_job->fb)
+		return 0;
+
+	pixel_format_blob = wb_job->connector->pixel_formats_blob_ptr;
+	n_formats = pixel_format_blob->length / sizeof(u32);
+	formats = pixel_format_blob->data;
+	fb = wb_job->fb;
+
+	for (i = 0; i < n_formats; i++) {
+		if (fb->format->format == formats[i]) {
+			format_supported = true;
+			break;
+		}
+	}
+
+	if (!format_supported) {
+		DRM_DEBUG_KMS("Invalid pixel format %p4cc\n",
+			      &fb->format->format);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
+
 /**
  * drm_atomic_helper_check_plane_state() - Check plane state for validity
  * @plane_state: plane state to check
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 32734cdbf6c2..42f3396c523a 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -30,6 +30,7 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 {
 	struct drm_framebuffer *fb;
 	const struct drm_display_mode *mode = &crtc_state->mode;
+	int ret;
 
 	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
 		return 0;
@@ -41,11 +42,9 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	if (fb->format->format != vkms_wb_formats[0]) {
-		DRM_DEBUG_KMS("Invalid pixel format %p4cc\n",
-			      &fb->format->format);
-		return -EINVAL;
-	}
+	ret = drm_atomic_helper_check_wb_encoder_state(encoder, conn_state);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 4045e2507e11..3fbf695da60f 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -40,6 +40,9 @@ struct drm_private_state;
 
 int drm_atomic_helper_check_modeset(struct drm_device *dev,
 				struct drm_atomic_state *state);
+int
+drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
+					 struct drm_connector_state *conn_state);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					const struct drm_crtc_state *crtc_state,
 					int min_scale,
-- 
2.30.2

