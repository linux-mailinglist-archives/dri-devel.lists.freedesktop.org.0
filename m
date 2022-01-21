Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C33496767
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B755B10E469;
	Fri, 21 Jan 2022 21:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FBF10E465
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:39:18 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id y4so19308597uad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SQcpHZmaJt1czigYjiMAKZUcGqofvOPOM7GXfzCxagM=;
 b=cdkSE1suaC2oHhSzhHi0Jg1Vcp0wQL84IFUFQywG65DB7nNkP+Mel0kSQHITA0vEjP
 6dF/g1SIdqrxtC1YNkOQfdWJ9tjVoMwm8UfWl3P+f2vQfPhdxWg8N1hcsWkOQsnXCvLo
 ISWUw4unzUBVRePbTZ0LgPm9YPEl69tkpLx+a6DwDVViKNqLpIhlh1a9JOzk8cE1ZfTf
 8VGLDqTVqqm6xMfuj/9e2lN7PhrWMGmlHOMXs+v5M+6VT0f5W2da2NF7vVdVdoUpQShV
 AKxxFclTw0okTAbo7wa06Qa2lhmscLJ++a+wEKqxQj9xGKUqbona/9h46ul6i3YnVnk9
 7a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SQcpHZmaJt1czigYjiMAKZUcGqofvOPOM7GXfzCxagM=;
 b=tR9/RGMR1Bk6eUPDXTpIs+NTVQrzx0zbrXse6F6DagViKsfrbvt47JVySEujrYQeBW
 y+KM3Y1kgDmSu7aSDkN+jWaAMMzo+PSHOePalI2gclgm7w7IdHbbaL2pymoBKdYZGtaU
 q3kKk668FjRj34FSZDbEDs7HnepC3XIeKPRXuiCtegLhL/NdtNtBeQIIcMa5W0XgBapp
 ftzghUivKJbFQvtfh2ylYvwm2rFftXTrebv9qlEPKBX58Dje/oIHw8mxVh3jaPtXVKg5
 yAk6csOZlTZRwlGjqmWIKpRJdsSE8vRT98FmlUQhQmNHduf1KIiZk+gkBcohF7aYUtiu
 JvoA==
X-Gm-Message-State: AOAM5316VBUiHSQc7uNWlHExHyrmDSQiy4fuAZMngNfx3lRLEgqRl6nf
 jBp4AY39fskgKJ07nD17I44=
X-Google-Smtp-Source: ABdhPJwNOvs/iSlmdQghhbb4PZev2uKvSZGPGHW6IpzVYb2jQ86BU3nJ3k6Dh/yEArMXUFz7QlVOWQ==
X-Received: by 2002:a05:6102:b02:: with SMTP id
 b2mr2622760vst.52.1642801157606; 
 Fri, 21 Jan 2022 13:39:17 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:2d80:9427:7267:dbaf:8ccf])
 by smtp.googlemail.com with ESMTPSA id 29sm1633844vki.25.2022.01.21.13.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:39:17 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v4 6/9] drm: drm_atomic_helper: Add a new helper to deal with
 the writeback connector validation
Date: Fri, 21 Jan 2022 18:38:28 -0300
Message-Id: <20220121213831.47229-7-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121213831.47229-1-igormtorrente@gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 ~lkcamp/patches@lists.sr.ht, Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper function to validate the connector configuration receive in
the encoder atomic_check by the drivers.

So the drivers don't need do these common validations themselves.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
V2: Move the format verification to a new helper at the drm_atomic_helper.c
    (Thomas Zimmermann).

V3: Format check improvements (Leandro Ribeiro).
    Minor improvements(Thomas Zimmermann).
---
 drivers/gpu/drm/drm_atomic_helper.c   | 39 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_writeback.c |  9 +++----
 include/drm/drm_atomic_helper.h       |  3 +++
 3 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index a7a05e1e26bb..ccb6e62bf80a 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -776,6 +776,45 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
 
+/**
+ * drm_atomic_helper_check_wb_connector_state() - Check writeback encoder state
+ * @encoder: encoder state to check
+ * @conn_state: connector state to check
+ *
+ * Checks if the writeback connector state is valid, and returns an error if it
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
+	struct drm_framebuffer *fb;
+	size_t i, nformats;
+	u32 *formats;
+
+	if (!wb_job || !wb_job->fb)
+		return 0;
+
+	pixel_format_blob = wb_job->connector->pixel_formats_blob_ptr;
+	nformats = pixel_format_blob->length / sizeof(u32);
+	formats = pixel_format_blob->data;
+	fb = wb_job->fb;
+
+	for (i = 0; i < nformats; i++)
+		if (fb->format->format == formats[i])
+			return 0;
+
+	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
+
 /**
  * drm_atomic_helper_check_plane_state() - Check plane state for validity
  * @plane_state: plane state to check
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index de379331b236..ad4bb1fb37ca 100644
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

