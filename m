Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4F46D949F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B15B10EB57;
	Thu,  6 Apr 2023 11:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EAA10EB57
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680778975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W9PADBV7kdrsYwkgT7yvWF1gcrM9r8sRUlyu8sOkzqE=;
 b=MDvAhGyBkcudqNTJtkfNA3aNK6aIq1ctKkCATFHeqXa5NMHyQ65Qi+8kHMElt60e4ekOWC
 qfyc6bOMPUv2cfDh1hNJGTqNGcer32bXur9YKkSHZ5TCJbdx5IgmVeaHv2tJ1n5WPq+kAZ
 P4+rCaXUylarblOnZz7OLQpeRePWCSg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-snyZeDCLOzeeFsQZ3irOkw-1; Thu, 06 Apr 2023 07:02:54 -0400
X-MC-Unique: snyZeDCLOzeeFsQZ3irOkw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d5-20020adfa345000000b002d716fc080fso4899807wrb.22
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 04:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680778973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W9PADBV7kdrsYwkgT7yvWF1gcrM9r8sRUlyu8sOkzqE=;
 b=8IWvgdV8DvsN/GuGCGVFKgqjNnukjpFTunReXovtat92+cl70mov0O3gUHyO6pbVvK
 dBUo/eD635DzfvnpH6xUwgzeY3oDG+Mp5MDc8J4DeolNbNQ78YvQih4ij4GvRmzrAGlp
 xvLMpO+Adv4tW5ldbzV9ZYEPknO59gtdOY/AKofgzKELjCbl2mRIcz1CfgZBc9Qbdt87
 eDLd/Gxe4gXWPSH5pEVwI4Avq7otqsoH5gXOdszCKd0DGMlVUp9DkxIXfYtA6f1h/L4b
 ps0effGyUnWv0BoxGMmv3IOK4qjS0ZEug0Ce+nIrg8iJbLhj+GxmEwcYGv9FyCwthPZk
 7ZZg==
X-Gm-Message-State: AAQBX9e4ug/mzKVLn9jD5EabRGzD09m5pB9+1YmDPKIl9kcBUlgewSc9
 f4XPlD83y/KtH47bClsq2OJJNFMsqohO65pNAYjQhNZLaFIvMoze8WSqiMpMFkuGH9uPBELJL6O
 G/GT4WdZ8IXaqTnekGWRuN6Bvbwqd
X-Received: by 2002:adf:f44d:0:b0:2d2:3ca:8c43 with SMTP id
 f13-20020adff44d000000b002d203ca8c43mr7623952wrp.31.1680778973630; 
 Thu, 06 Apr 2023 04:02:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350b6JKhqw/6XDyaEayJzxte+WOAAroTJ4RHjeRqTghA3qFfh8cm9uXUn7uG9fUuRMoP4XtdxlA==
X-Received: by 2002:adf:f44d:0:b0:2d2:3ca:8c43 with SMTP id
 f13-20020adff44d000000b002d203ca8c43mr7623929wrp.31.1680778973292; 
 Thu, 06 Apr 2023 04:02:53 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b6-20020a05600010c600b002d8566128e5sm1472401wrx.25.2023.04.06.04.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 04:02:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/vkms: Remove <drm/drm_simple_kms_helper.h> include
Date: Thu,  6 Apr 2023 13:02:35 +0200
Message-Id: <20230406110235.3092055-3-javierm@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406110235.3092055-1-javierm@redhat.com>
References: <20230406110235.3092055-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>, Marius Vlad <marius.vlad@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver doesn't use simple-KMS helpers to set a simple display pipeline
but it only uses the drm_simple_encoder_init() helper from simple-KMS that
initializes and encoder.

That helper is just a wrapper of drm_encoder_init(), but passing a struct
drm_encoder_funcs that sets the .destroy handler to drm_encoder_cleanup().

Since the <drm/drm_simple_kms_helper.h> header is only included for this
helper and because the connector is initialized with drm_connector_init()
as well, do the same for the encoder and drop the header include.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/vkms/vkms_output.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 4de6f8ae38be..5ce70dd946aa 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -4,7 +4,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 static const struct drm_connector_funcs vkms_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -14,6 +13,10 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static const struct drm_encoder_funcs vkms_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int vkms_conn_get_modes(struct drm_connector *connector)
 {
 	int count;
@@ -86,7 +89,8 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
+	ret = drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
 		goto err_encoder;
-- 
2.40.0

