Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3114F1A2F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 22:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D9E10E32C;
	Mon,  4 Apr 2022 20:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FD210E3AF
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 20:45:50 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id w141so8731458qkb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 13:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GUzR+2DPSGzM5YgqBFG0KC88b46KfBlk69CytI60tPo=;
 b=jPkzo9VVmvSjGsSjouBzcrNwQRIhAjxKAJrwmTdcUSwHrZuKPMb92MNTPhzT4/WTIr
 P7PZd1tIXjW0sXehUstJNN2KRIGpXKvodqiAfuQA3TpYsDNE059Sz+Z4kqE7OEb7AC1l
 QbHKYCLTUJf3sehjSaKaDjv4BvfE2GPJq5xBMHe8/WN2ofupajR9V3BcJoEyJBPNoG7N
 zAM1Mkxnq4Z5W1+uwZvmfxbgA95OwAdQphr8+xihSyK1wG0q8wBq/dIGen5TYPKyaPlp
 0fAoe6+UD/JedHWDRr6df6+WQByPq4cI1idDxSlaOz6PnZCVrFUGUWQjcRKczl2f4H68
 xkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GUzR+2DPSGzM5YgqBFG0KC88b46KfBlk69CytI60tPo=;
 b=yCyxVUGGDOm2tzE+JYLwoMoDUABO5wveTkeL8N6ByFRKiftqMo2m23GFf8+jP4I/ve
 AHxhCnDlF9j2q8YfBehYkhPxYFZ2uOwcoCcduajZ4RhVU+NnCGsLsEh/dKBKIiHGWICa
 y6eNDQUIxtJQACpXlUABFzuQaxRQVGBn7TFIL/ufk4UdHVxgAgaWXbUR4aA0fnPLqyQu
 OHW4GquBor5dqKoOAZkrNiFvi5lLxJKnGCEqn5iDcUPl7GjyW4V+30NkLbtRoyaxiVrA
 p7fSwFiHU370rGscra+CcOboN+TThABWGuf1mxXT4AM7r1KTfyg9US2gZ/1cF4dIO9tS
 vSDA==
X-Gm-Message-State: AOAM530eGZA8M/2iYjMDWTtI4XzAmEDP4RAs4dSkRVb2ur2/uJXDXGJi
 l7tL8/AhvfWwbsm8AgZozN0=
X-Google-Smtp-Source: ABdhPJxDmBlqc1NQqLV6GCG2Z5EMEIbrXTRJ1weg2DHVooOAI7eo3ghYon84y5TCiggTpFkKn7QxMw==
X-Received: by 2002:a05:620a:25cc:b0:699:c303:83f5 with SMTP id
 y12-20020a05620a25cc00b00699c30383f5mr52701qko.345.1649105149648; 
 Mon, 04 Apr 2022 13:45:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:7cc:26a1:e446:de76:c0b8])
 by smtp.googlemail.com with ESMTPSA id
 m10-20020a05622a054a00b002eb965bbc3esm9630548qtx.93.2022.04.04.13.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 13:45:49 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v5 4/9] drm: drm_atomic_helper: Add a new helper to deal with
 the writeback connector validation
Date: Mon,  4 Apr 2022 17:45:10 -0300
Message-Id: <20220404204515.42144-5-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404204515.42144-1-igormtorrente@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht, Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper function to validate the connector configuration receive in
the encoder atomic_check by the drivers.

So the drivers don't need do these common validations themselves.

V2: Move the format verification to a new helper at the drm_atomic_helper.c
    (Thomas Zimmermann).
V3: Format check improvements (Leandro Ribeiro).
    Minor improvements(Thomas Zimmermann).

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
index 8694227f555f..746cb0abc6ec 100644
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

