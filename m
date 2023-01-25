Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21C767B9B3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 19:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0F710E10B;
	Wed, 25 Jan 2023 18:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C3A10E10B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 18:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674672159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z+BBIerRTFgcd1PQmeAjWnPoawpkV/Pm3EMJIWf956I=;
 b=VHJW6ZUawe/EfJduqrS1gNEbJKlsgLz1BdB7vHEOR2Nu8koTsEzb7vn38yi5SksTN154Uy
 KddtwMINtS785xy371aVQySYkbyLiMAFZE/vpuGtuhJnCHr/Kd/l2YXs0+lclHdl9wuiy8
 RpeUmtX6/Q40VcGevfeFGlB4JlrTpAo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-49-_0FncMdKOlqbrTm2d22dyQ-1; Wed, 25 Jan 2023 13:42:36 -0500
X-MC-Unique: _0FncMdKOlqbrTm2d22dyQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 e37-20020a5d5965000000b002bfb4cab735so884588wri.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 10:42:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z+BBIerRTFgcd1PQmeAjWnPoawpkV/Pm3EMJIWf956I=;
 b=JPQL4GpT4ZUO1lP1f1YwbiQm2eIArsmlOitojU8wUG3/cvkliEl7auVeDlje6h1qWu
 fo+TbXQl7c9JSL1E8SGAXF2321iPtxKXCRQMG9+8v5DnlgBCpXPrgQDReITiJudvCM14
 Xz/6isyj27lRWhYTdecRmJ6Fgdr+Lw1ig1Dj2SI9Uc4NNU/TUB+LL1pLVickhOvKwJCk
 hm4p+pCmNaiNuDJwVllGkgYV+3nuhyyzmgHvhl1G8Gaf0kci1U+emuwFSSPObne4kn9d
 VKrm1G8ovG0a67xyMcr1qMkAGCv1RzvjjF9UKBrwAJum1eUv+OjnVPWQdKVR2r88o9jU
 VAqg==
X-Gm-Message-State: AFqh2kof1ULR9HU1EGUlY/VRJUv2OglSjy/89oqn4t1tjEjT/gwgGr10
 Bac1srnAMG/g5MpgSlMKUHTybcyH/y/GIa4Q3Dgfq3RO4T84IupyZPKc+MoJlz8RxlNz7nSj6+8
 VRaxPq5C5gHQVQAZ1VJ6AmjNTB6cT
X-Received: by 2002:a05:600c:4689:b0:3d6:80b5:f948 with SMTP id
 p9-20020a05600c468900b003d680b5f948mr31078739wmo.39.1674672155027; 
 Wed, 25 Jan 2023 10:42:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvu7swuc3fCODlAmXzO3G98ZhFibsWBg+iJ5cK7WtNewYD33+Ngij/lMSQGu6CJfOf+hA1LVQ==
X-Received: by 2002:a05:600c:4689:b0:3d6:80b5:f948 with SMTP id
 p9-20020a05600c468900b003d680b5f948mr31078734wmo.39.1674672154864; 
 Wed, 25 Jan 2023 10:42:34 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x26-20020a1c7c1a000000b003db01178b62sm2524197wmc.40.2023.01.25.10.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 10:42:34 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Init display before the SSD130X_DISPLAY_ON
 command
Date: Wed, 25 Jan 2023 19:42:30 +0100
Message-Id: <20230125184230.3343206-1-javierm@redhat.com>
X-Mailer: git-send-email 2.39.0
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
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 622113b9f11f ("drm/ssd130x: Replace simple display helpers with the
atomic helpers") changed the driver to just use the atomic helpers instead
of the simple KMS abstraction layer.

But the commit also made a subtle change on the display power sequence and
initialization order, by moving the ssd130x_power_on() call to the encoder
.atomic_enable handler and the ssd130x_init() call to CRTC .reset handler.

Before this change, both ssd130x_power_on() and ssd130x_init() were called
in the simple display pipeline .enable handler, so the display was already
initialized by the time the SSD130X_DISPLAY_ON command was sent.

For some reasons, it only made the ssd130x SPI driver to fail but the I2C
was still working. That is the reason why the bug was not noticed before.

To revert to the old driver behavior, move the ssd130x_init() call to the
encoder .atomic_enable as well. Besides fixing the panel not being turned
on when using SPI, it also gets rid of the custom CRTC .reset callback.

Fixes: 622113b9f11f ("drm/ssd130x: Replace simple display helpers with the atomic helpers")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index b16330a8b624..8cbf5aa66e19 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -663,18 +663,8 @@ static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs = {
 	.atomic_check = drm_crtc_helper_atomic_check,
 };
 
-static void ssd130x_crtc_reset(struct drm_crtc *crtc)
-{
-	struct drm_device *drm = crtc->dev;
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
-
-	ssd130x_init(ssd130x);
-
-	drm_atomic_helper_crtc_reset(crtc);
-}
-
 static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
-	.reset = ssd130x_crtc_reset,
+	.reset = drm_atomic_helper_crtc_reset,
 	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
@@ -693,6 +683,12 @@ static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 	if (ret)
 		return;
 
+	ret = ssd130x_init(ssd130x);
+	if (ret) {
+		ssd130x_power_off(ssd130x);
+		return;
+	}
+
 	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
 
 	backlight_enable(ssd130x->bl_dev);
-- 
2.39.0

