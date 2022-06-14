Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 078BD54A300
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 02:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D861A10FD12;
	Tue, 14 Jun 2022 00:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0093010FD11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 00:02:43 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so10501772fac.12
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtXHWdMatL5evDQdd/0Xz5lOzFoyZ+/NU/2jUgvAefc=;
 b=jlE+Th5K+egVW1O3Wd7MrHyyyBq1C/SCW2w3aWVT8KkpWanhqEh41/Z4ALHvm+Ojwj
 MCsqmKzQUhoQvpnqMvt12Vk2WXJXtuJYblLAVgB/rMbi3Vhd1KWY3TBZnljHvTo7VJG8
 R+W8Zt3y8AwI7Y2/Z3ikimUX8EBODuiEwhf5mh+OiArHd5fgSIljvzZG7QhmjSD+wNy6
 tEfGSVAxOxmlpkkAyWyvnNaBElufSrfElDibfR7kNeyEiwK3nd7GTtFL3T92OyDHnZcm
 K1p+xU1rA4LaRcX5JFK8DabymPaIn9eg1JEw82OncWpsZGD6H/ohN/yV3srLzMweqXQV
 xCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtXHWdMatL5evDQdd/0Xz5lOzFoyZ+/NU/2jUgvAefc=;
 b=bpw6F3zANpBVa7ThV1qTNpHuwj24gcsbVUKwHf/ELxRfc95fp1eJqkEg8y7hA6bQJT
 E5hk95iH4z7XKsHi+goRw7IiolbESdTCq9CeohlJfXpl78d3eOhqEfq0Z5fv5HN+wIGd
 tyzNZb0qJIdWkPGBFUj6Aqat0zChcVb8n1PUTUe9J5RYfEQBh2dE1Ax6pPnCp0Mizfw0
 xNcSZ/C1uzyjdzARY7DL+iLp4YZU4TmGuzDJvdnOr7iz+yBz1uouR68eN4nSAqaa/Qy6
 W3Iue+cy4CJErQFHCMKXQvK0sA1ArZ9xwDaukDNldXxPJ/sKjDUuVcD4p6OplAWRGDso
 ZPJQ==
X-Gm-Message-State: AJIora/b6h/Kirt/rhWQq9x4HXhkNa1b2es6T88hF1jrH58N9BYuLb3o
 MQ48naTt3dWgURumxzQbd0c=
X-Google-Smtp-Source: AGRyM1smgzaPD10nOPifKlQyRKCHKubJQEjYw49y9QHo7jqd4w156kOj6jQ7ruIH+sIeACELXfc9DA==
X-Received: by 2002:a05:6870:b683:b0:e6:87cd:d6ae with SMTP id
 cy3-20020a056870b68300b000e687cdd6aemr776720oab.161.1655164963152; 
 Mon, 13 Jun 2022 17:02:43 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:a472:4c3:87f9:70d2:df2e])
 by smtp.googlemail.com with ESMTPSA id
 y23-20020a056808061700b0032b99637366sm3831232oih.25.2022.06.13.17.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:02:42 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v6 3/9] drm: drm_atomic_helper: Add a new helper to deal with
 the writeback connector validation
Date: Mon, 13 Jun 2022 21:02:20 -0300
Message-Id: <20220614000226.93297-4-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614000226.93297-1-igormtorrente@gmail.com>
References: <20220614000226.93297-1-igormtorrente@gmail.com>
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

