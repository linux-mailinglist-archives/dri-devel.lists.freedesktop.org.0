Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF12C59A544
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 20:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C0010F5A2;
	Fri, 19 Aug 2022 18:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B456410E289
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 18:24:29 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id b81so2650309vkf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 11:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=UtXHWdMatL5evDQdd/0Xz5lOzFoyZ+/NU/2jUgvAefc=;
 b=K5griqk10QgOLUVy0GpC5ssWEdXuCjnEJkNqvQjpmfMgiz3tOvxsGFpK0xECYR/QRo
 t/gm7qNSmq1YLWkh1BVWAzfXHC7okN0tYOHxfv6Wh3q7caGnL46IJdKDAv+D/tCL+H4d
 kszq84BP+YWFVIHqTDeTw7hs4dxC14+TDPyNX+IlQ0p75i4Ocgg4DkY5+JmWao9Tm2gf
 1guCjI/TnwLuvLPOpCnZYoT3/tTD9IW6qHuzWKJqI1jYg5cEMwPc3uXNKKeZy6pU3XC5
 GshIONdw/0LdUGBb8ZsZZdbUxkmZKNN9jsXM6g5Wl1ho1UqmiUuG1qkTu98ZvlP9lS/W
 U0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=UtXHWdMatL5evDQdd/0Xz5lOzFoyZ+/NU/2jUgvAefc=;
 b=YumEgc3KeuxqSnAdxIzFDrrQDV1FpqLP8o4reMCs7L5R76lX3CPIak5hcwwMLnKl3N
 ILI3ABGihdThm0Z4oGZpyuKL+lajevhRQvRumX0TJBnwwCzKyIM62pnTNgd+9XgLb8Jv
 ZfGOgWDvok8+prt/A8+UbM0fEv7bHxj3fEjgIvVv8T/32RPe18c3LOVhV16sa/5JDeHy
 TINW0hiFj1VZgUc4cdkR59w40Q9yILlG1ASpWM6Jhbh9houw7qDKMsa5fjnrkSk2Hzvx
 2xgUF5LE+MTHaBn18KhL9JFOsq9klW4YFPhu1eCCtUybwkQT3954vkDWfiVwGbToFDU5
 Lecg==
X-Gm-Message-State: ACgBeo2hI/+MH69nInmkntKrLEm5Hm9EzqkNzWD/6gJISwN0CANIMmrX
 qXFjiJ+BhPB0BWEAFdLDWPM=
X-Google-Smtp-Source: AA6agR5NtwoCztRtV1+B5Owkd09MgWQWsPN4yoZPTPp3rt3YnwkAKjPJzjeUAStGDBGgYLe0xnFlOQ==
X-Received: by 2002:a05:6122:221f:b0:343:f3d4:87cb with SMTP id
 bb31-20020a056122221f00b00343f3d487cbmr3700124vkb.13.1660933467903; 
 Fri, 19 Aug 2022 11:24:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:da86:e8a2:466a:a971:9305])
 by smtp.googlemail.com with ESMTPSA id
 i22-20020a67fa16000000b003901ef5d148sm1990349vsq.6.2022.08.19.11.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 11:24:27 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [RESEND v6 3/9] drm: drm_atomic_helper: Add a new helper to deal with
 the writeback connector validation
Date: Fri, 19 Aug 2022 15:24:05 -0300
Message-Id: <20220819182411.20246-4-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819182411.20246-1-igormtorrente@gmail.com>
References: <20220819182411.20246-1-igormtorrente@gmail.com>
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
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht, Igor Torrente <igormtorrente@gmail.com>
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

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/drm_atomic_helper.c   | 39 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_writeback.c |  9 +++----
 include/drm/drm_atomic_helper.h       |  3 +++
 3 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9603193d2fa1..2052e18fa64c 100644
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
index af1604dfbbaf..250e509a298f 100644
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

