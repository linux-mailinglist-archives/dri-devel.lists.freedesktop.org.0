Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A0A9502DE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3C710E2ED;
	Tue, 13 Aug 2024 10:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HKgnAhzp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC86110E2EE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:46 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42816ca782dso40961405e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546305; x=1724151105; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KWE8rKtVdiKUJxK18Sz+dZAuEs9UiARix9m9SAPeTeE=;
 b=HKgnAhzprphU3NGxZoWlix1OIiogZcmAxfAr2SC9sa9M2ifT/9CNPJzy4oQ8RSTdTW
 UNkUezcEljQSjqJyYzXGBTp4GR/TxIncmtdjGST1AexMkRqsIL8LBiq9APHPq9SwvI+B
 c8MNZxq1xfp2yeYHK+ugU7nZV8Cs6u4M6+9MeuP5pxv5SwL4ZnQSo73bs1GuWtU68dbb
 i0kNlNNTJUaHb3KEVssT1c2HiSHr4LcB0oTf1UZ7RWeexRcOQug+vbVT8smqaOunf4KA
 AJrgQGIWs4T+IoWmYnRt3JBrya0s6R40EizJ/b+XmiWEMTyt/fSPXdtsh2E/11o48bPq
 Bc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546305; x=1724151105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KWE8rKtVdiKUJxK18Sz+dZAuEs9UiARix9m9SAPeTeE=;
 b=IonIr30ZuezlQbLNrWj0lPCUDF3vb4Chew6UyA16dLix37iMyLzpfIOWxV176KBkiw
 0aLwQJSa2vUDWKI1jB/9NwDtR6qN83Q2Ig2K/zXfELoEChMSeVuymgT7qlxVgbkhhqxK
 uRjrseMtQ05KE8DOIXuTP0NfMYICYpuEjOgvrG48xctBa86pdLZr0947szj/kRxOMPSH
 yUXVAQkC/X0UaBl/xYthm9oaHjSwB6Jh1Mk8lmf14lk//lk1huBpovggJCqgKmizOyVo
 H0wbCfQeOTp/UFknbWJqVaxzfG2hyZrA2WJBXCdCX0+L1MFP1KBmjPf3ld9L9C2seZXo
 ECQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKMEDaDgVF6lka7IAsG5jpME0XbSkyw2MGMtXNo2xvyq4dp99navIjMQE/mQDcm+87iqea4Hb7TE1vFNvMsTFDZHOKL+EPOmWPRn1iYxNJ
X-Gm-Message-State: AOJu0Yzagp+fwcIcwsq4qoPZACO6zv7OVXEISazt43CjGtf0tHm+qjkI
 jEFG/yzWksJPtz8HnmXtd+8EdANU2PoiWPAk7BYHyT+4Wwz9ZzqN
X-Google-Smtp-Source: AGHT+IEOoGiAX7Jk7kFX/Cpb+81DazihuxVSJAl0cnfxJtAI3Kt5FKlL5DDzE+cNeO48UflBpAHuFQ==
X-Received: by 2002:a05:600c:5246:b0:426:5b21:9801 with SMTP id
 5b1f17b1804b1-429d486ec8amr25687205e9.27.1723546304967; 
 Tue, 13 Aug 2024 03:51:44 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:44 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 05/17] drm/vkms: Use managed memory to create encoders
Date: Tue, 13 Aug 2024 12:44:16 +0200
Message-ID: <20240813105134.17439-6-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240813105134.17439-1-jose.exposito89@gmail.com>
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A future patch will allow to create multiple encoders. Use managed
memory to simplify the code.

Refactor, no functional changes.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h    |  1 -
 drivers/gpu/drm/vkms/vkms_output.c | 45 ++++++++++++++++++++----------
 2 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 3156ff896c33..2466e8b0231f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -122,7 +122,6 @@ struct vkms_crtc {
 struct vkms_config;
 
 struct vkms_output {
-	struct drm_encoder encoder;
 	struct drm_connector connector;
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index dcd32bc30e17..15f0b72af325 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -4,6 +4,7 @@
 #include "vkms_drv.h"
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
 static const struct drm_connector_funcs vkms_connector_funcs = {
@@ -14,10 +15,6 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static const struct drm_encoder_funcs vkms_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int vkms_conn_get_modes(struct drm_connector *connector)
 {
 	int count;
@@ -32,6 +29,31 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.get_modes    = vkms_conn_get_modes,
 };
 
+static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device,
+					     uint32_t possible_crtcs)
+{
+	struct drm_encoder *encoder;
+	int ret;
+
+	encoder = drmm_kzalloc(&vkms_device->drm, sizeof(*encoder), GFP_KERNEL);
+	if (!encoder) {
+		DRM_ERROR("Failed to allocate encoder\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	ret = drmm_encoder_init(&vkms_device->drm, encoder, NULL,
+				DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret) {
+		DRM_ERROR("Failed to init encoder\n");
+		kfree(encoder);
+		return ERR_PTR(ret);
+	}
+
+	encoder->possible_crtcs = possible_crtcs;
+
+	return encoder;
+}
+
 static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index)
 {
 	struct vkms_plane *overlay;
@@ -51,7 +73,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector = &output->connector;
-	struct drm_encoder *encoder = &output->encoder;
+	struct drm_encoder *encoder;
 	struct vkms_crtc *vkms_crtc;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_plane *primary, *cursor = NULL;
@@ -101,13 +123,9 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
-	ret = drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret) {
-		DRM_ERROR("Failed to init encoder\n");
-		goto err_encoder;
-	}
-	encoder->possible_crtcs = 1;
+	encoder = vkms_encoder_init(vkmsdev, BIT(0));
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
@@ -120,9 +138,6 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	return 0;
 
 err_attach:
-	drm_encoder_cleanup(encoder);
-
-err_encoder:
 	drm_connector_cleanup(connector);
 
 	return ret;
-- 
2.46.0

