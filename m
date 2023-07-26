Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8533763452
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 12:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE5410E456;
	Wed, 26 Jul 2023 10:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB51010E456
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 10:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690368901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tfHzE8mqv6PAsMGXTnVJTu2nJA1vsdj//P7y8dVLEok=;
 b=Zs+Z+rRICc+S4TNVvTIDPH4cXlwblHFKo0Y4twhFVddz3vJrjT4S3rUW52JDy2bXSNq2ha
 mFC0znO2qs1OkqQYk3IHTbhGzYW5HUvtcNbj2HJWdf8Qh4/LYjgEhK18TFv1KMSIBKGx6l
 TEPBv/2IE/XbE9coTwpDRxe26JhOAoU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-xAdqMun7NHe0J5rXb1FJ0Q-1; Wed, 26 Jul 2023 06:55:00 -0400
X-MC-Unique: xAdqMun7NHe0J5rXb1FJ0Q-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4fbcdca9080so5976460e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 03:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690368899; x=1690973699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tfHzE8mqv6PAsMGXTnVJTu2nJA1vsdj//P7y8dVLEok=;
 b=PJYeovOpnomf+bAexw7Hqv41B97pNikOuBDaPxXJ9kcRaQngbv9vaS/TADfPurNUEK
 EfQPBNLaLp9GUkz9AvShy6g+/c+hmyLal6ey4JAbflfuBHdkoUVDrc92tGc65ET9/TVm
 28e5UPMgZPQoXvye3F4VDeG+PboIHYHY6RVGiKKIguqyd0GmY4uajnc3VFB4hw3tV0Je
 Ue4WCTFF7SZkJLjb15MJVE0pvGnzU7a3zGDvNjEm5JEGOt0OruE0V3EFjqr2OENA7MFB
 Aa8NQCD1pJxmO4Zsff/F2i+fM6oqhRTFZLKOLv4NbI+i3ObgXLbGNO2ctjG8hbYSF8V/
 T5Lw==
X-Gm-Message-State: ABy/qLbwoOByOngg1TsFAcfd7RsUB9stCju96wt/kIGEgs5eHIBXw4+E
 VG7Jc59oA8anh8iqTl575MrZGPbt6wYRs37kS5pGP0DCPzO1QRvQJd2eZRlRdi+mTQ29JPjjLlF
 v1bXbDQ3ih0kKydnLRLZovLiQxPd+
X-Received: by 2002:a05:6512:34cd:b0:4fb:9d61:db44 with SMTP id
 w13-20020a05651234cd00b004fb9d61db44mr1036697lfr.12.1690368899170; 
 Wed, 26 Jul 2023 03:54:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG4M6oiarh0Xm/7HopC7xRqk6r+6luRSOyTY/5/GDWP27gAFA5v2BnpBh3YFnDiAKxMpFWZ9A==
X-Received: by 2002:a05:6512:34cd:b0:4fb:9d61:db44 with SMTP id
 w13-20020a05651234cd00b004fb9d61db44mr1036676lfr.12.1690368898825; 
 Wed, 26 Jul 2023 03:54:58 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n7-20020adffe07000000b003176c6e87b1sm4894703wrr.81.2023.07.26.03.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 03:54:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] drm/ssd130x: Inline the ssd130x_buf_{alloc,
 free}() function helpers
Date: Wed, 26 Jul 2023 12:54:27 +0200
Message-ID: <20230726105433.389740-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is only a single caller for both helper functions and these don't do
much other than allocate and free two buffers, so let's just inline them.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/solomon/ssd130x.c | 55 +++++++++++--------------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index b4c376962629..51472a184ef9 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -146,38 +146,6 @@ static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
 	return container_of(drm, struct ssd130x_device, drm);
 }
 
-static int ssd130x_buf_alloc(struct ssd130x_device *ssd130x)
-{
-	unsigned int page_height = ssd130x->device_info->page_height;
-	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
-	const struct drm_format_info *fi;
-	unsigned int pitch;
-
-	fi = drm_format_info(DRM_FORMAT_R1);
-	if (!fi)
-		return -EINVAL;
-
-	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
-
-	ssd130x->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
-	if (!ssd130x->buffer)
-		return -ENOMEM;
-
-	ssd130x->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
-	if (!ssd130x->data_array) {
-		kfree(ssd130x->buffer);
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
-static void ssd130x_buf_free(struct ssd130x_device *ssd130x)
-{
-	kfree(ssd130x->data_array);
-	kfree(ssd130x->buffer);
-}
-
 /*
  * Helper to write data (SSD130X_DATA) to the device.
  */
@@ -709,6 +677,10 @@ static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 {
 	struct drm_device *drm = encoder->dev;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	unsigned int page_height = ssd130x->device_info->page_height;
+	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
+	const struct drm_format_info *fi;
+	unsigned int pitch;
 	int ret;
 
 	ret = ssd130x_power_on(ssd130x);
@@ -719,9 +691,21 @@ static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 	if (ret)
 		goto power_off;
 
-	ret = ssd130x_buf_alloc(ssd130x);
-	if (ret)
+	fi = drm_format_info(DRM_FORMAT_R1);
+	if (!fi)
+		goto power_off;
+
+	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
+
+	ssd130x->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
+	if (!ssd130x->buffer)
+		goto power_off;
+
+	ssd130x->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
+	if (!ssd130x->data_array) {
+		kfree(ssd130x->buffer);
 		goto power_off;
+	}
 
 	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
 
@@ -744,7 +728,8 @@ static void ssd130x_encoder_helper_atomic_disable(struct drm_encoder *encoder,
 
 	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_OFF);
 
-	ssd130x_buf_free(ssd130x);
+	kfree(ssd130x->data_array);
+	kfree(ssd130x->buffer);
 
 	ssd130x_power_off(ssd130x);
 }
-- 
2.41.0

