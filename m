Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926D25AD963
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9C210E4B6;
	Mon,  5 Sep 2022 19:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD74510E4B0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:08:38 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11f34610d4aso23240837fac.9
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aVLiZHccG4RUjmvUIKUIKDCs5A8zCFnulBujFIRRAx0=;
 b=UXmD7gIilmrVktfXuHTsynELIhu2IYtohnLLJKViXRCc/LPz+fEfTiXH4fuDGY5iuZ
 1usvTlBtmeYKyLDIB5Sc4WcCApUP6ePxt7Ot29+8LDluJw7Gy6f3rHBRQTABcAmcb58Y
 uLaUI6Z42XM1rkVfMynWi+9GeJCaIcX5oa0JXewJgNDqz4k84QqZ+99+/zSqtVvk/ZMA
 Mu38JClguNatGwafVGplN39pxlARHdTpwD9y8qbVlItkwlGcOfJiozayWyqPPtq564K1
 sVfuyDk8ll6cOb5w4sI50n/L7xfZmXgbCG3ylfdT+ceHyr04NXzLmqDWhZhZQYt4sIp0
 qolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aVLiZHccG4RUjmvUIKUIKDCs5A8zCFnulBujFIRRAx0=;
 b=Od1qy09RGdO0s0IQ6VxkI3CHzzAuY2tobLx7uDFXYXh+9ccChkJCtIwhgrnM7QyxSH
 H0/EIjl9L2XROzRv8s+RIVR4EfH+tIhPW4hjQkUkRuUNTzaEx6pEcECpgXtjxLOHJ54p
 6EdEqiIguNvahdvKrZHqWp1BzyLQb9TtgUtteBKkC3iKH90bOiVadizS6vYfegM5mZw3
 2Qft3/l+VxwkxgmhEyiCYcMFwWp5Bi/7HiyaI/IgVX5HiiY8lHrvDi0GhEgSGjvZrrjb
 mV39x9rRxi92Yk1VQLfiD/+S0iCkeOV1T7u5jro7D/d+W432gJkRS7C13ECryAzG8zdg
 WKTA==
X-Gm-Message-State: ACgBeo3jm26CKjckSQWycC4BVpCBkBctG5Mpx55fUQOiv1ve25dEyJkw
 uDvybP9fzjqou6wovjxEiPo=
X-Google-Smtp-Source: AA6agR6WTb15hx8ufqCYd+Kd1CCf7Z6TTA0KS2nyuSGqAxz3wgEyhSZP/A2RqB2clsohL4z2sG0T8g==
X-Received: by 2002:a05:6870:218e:b0:126:9dc3:9666 with SMTP id
 l14-20020a056870218e00b001269dc39666mr5251321oae.73.1662404917938; 
 Mon, 05 Sep 2022 12:08:37 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:21c0:3f1:e4fc:3866:255e])
 by smtp.googlemail.com with ESMTPSA id
 z6-20020a4a9846000000b0044b61af8816sm3328465ooi.41.2022.09.05.12.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:08:37 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v7 3/9] drm: drm_atomic_helper: Add a new helper to deal with
 the writeback connector validation
Date: Mon,  5 Sep 2022 16:08:05 -0300
Message-Id: <20220905190811.25024-4-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220905190811.25024-1-igormtorrente@gmail.com>
References: <20220905190811.25024-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper function to validate the connector configuration received in
the encoder atomic_check by the drivers.

So the drivers don't need to do these common validations themselves.

V2: Move the format verification to a new helper at the drm_atomic_helper.c
    (Thomas Zimmermann).
V3: Format check improvements (Leandro Ribeiro).
    Minor improvements(Thomas Zimmermann).
V5: Fix some grammar issues in the commit message (André Almeida).

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/drm_atomic_helper.c   | 39 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_writeback.c |  9 +++----
 include/drm/drm_atomic_helper.h       |  3 +++
 3 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d36720f419f7..ee5fea48b5cb 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -785,6 +785,45 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
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
index 3b3c1e757ab4..d427b6c52d03 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -31,6 +31,7 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 {
 	struct drm_framebuffer *fb;
 	const struct drm_display_mode *mode = &crtc_state->mode;
+	int ret;
 
 	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
 		return 0;
@@ -42,11 +43,9 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
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
index 54b321f20d53..06d8902a8097 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -49,6 +49,9 @@ struct drm_private_state;
 
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

