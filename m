Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F409DB931E8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 21:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED7710E4F4;
	Mon, 22 Sep 2025 19:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZJULduDu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9F910E3E1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 14:44:24 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-33ca74c62acso41366501fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758552262; x=1759157062; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X13cIlFTvAxBl+tOf4PGIxbGkobbYOGLrZfNc3Etiw4=;
 b=ZJULduDujnfXkXOZEhVwEUExjk6P4Wow0H2l8NI9Wy3tdO/MhrDmigwe1JuebdW7VA
 4JjfSEybJd6Ot5N9Nr286KHZf21EPFviPMFSLMWB6BWgu2gkYTGArvKBvzPc/4zgfmaD
 djeBzv2cCxgNHgzTidnc4pbOhT+vIr5tT3Rwz6lVcacPaECN3HQSGqf1J6P0DO0dQ25a
 fU73QZwD3ZtoP0eMvtnhhdVncmYKZt477r4Z2nn7GvXFAaM0YD5JXIg5KOvljk5L4r2h
 2+Cb1isq5IXvMPQLt/j+gk0GdHp2b7EHxqCwhETccylNP5u9P141pPhYuHb0DIKayDUH
 WAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758552262; x=1759157062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X13cIlFTvAxBl+tOf4PGIxbGkobbYOGLrZfNc3Etiw4=;
 b=meq60ld2xoHIsC+Z8u3kcLikuHjCJUAaLzcDTVmnoKdOhK3l/oL0HpKV8zcYqYIQam
 TO1Ro5VUW2lVQxm201DcWlv/jZ1SPz3sQnGrZ/4TT2nwQPQw7Z9E3rMl7plExBQTW4se
 4+B7SkPDtTCou4gFYSFvksGoIfvortNmG49LYeUcPc0+fKD6shGxhznb6eryJkAH8ykz
 41Ujytw5tEgaxzSWDnWP4fnpuOzChAjNY1LwRUHKi1BFSZ95Cg4GDOVOPCZ4mwkQYF+j
 YEyoia3Ge98kMs+cAEU4dMGhcMiriQzlzSDpHJI2DY4Y/Woh08S0h0bB9wMGKYmW4oDN
 cAmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCKYZRdqFgpTJJpdcw6IpQX669hmPfsPyIz/28jq46y/Xhlue9W7ZOJMTnCtJLHoCteZCSxmZaP3s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaX6qc7fvVoKPJScJhb/kuQZXD8y5xCyqofUdf6FB/Sj58PyWI
 AinpTwhvCEvSD91UlcjQTUPKANLWAW8HpfB2h80XCw8hbBTazcYIkwRS
X-Gm-Gg: ASbGncu8NpH/7tqKuFbVcqzin2tzEkD/S+X2ucVK2CwJgSZUq0aqz1nM0+R6GPtehHg
 KV24VyBx9pyKLAlk2TTmp4uASuHKh+uV3j6irmRdMTY+0Kn7/8iRhDEZzxrL7/zhRjnoNZUz02h
 jAhpX85q2z+bXr0+DOKuwGLCFraB608ven+k8YHq9vG9GoSiSa39Zke/mKTBkYp0yWhY+HFH8gV
 Oyv4jrFgtqsxk9fqJUGJRFHqH4pu8NJ4j2+LbcxE78DSdhqs48q8iGlIFZxLrSfAGEqQFJGQWZt
 Zz2v+AlMQ42MfAPHdU9xgOli7a8RQtiDy+sLxiHH8Ia/z0TB+Q3keCixSJN1zYkYSOabJCw73O7
 aUbqZxcObqMzJ9xJw/fuvlYKYHUmzw20RSAkWzYvKB0V7HB+xeYByKVsNORF3kDzkAlwK3C1XDk
 z2ojK/zHk6vjETOWVr
X-Google-Smtp-Source: AGHT+IFBWwEOq3lIzOIm0ZMJkCph7Cxz3rME74SktJraASmJ9clEOIZJfSRHzAxaW3f19H0CEY3msA==
X-Received: by 2002:a2e:bc06:0:b0:336:ba05:b07f with SMTP id
 38308e7fff4ca-3641afb9821mr41441221fa.21.1758552262175; 
 Mon, 22 Sep 2025 07:44:22 -0700 (PDT)
Received: from localhost.localdomain
 (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361aa1a1041sm31416821fa.60.2025.09.22.07.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 07:44:21 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10] gpu/drm/virtio: fix error return in vgdev_output_init()
Date: Mon, 22 Sep 2025 17:44:13 +0300
Message-ID: <20250922144418.41-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 Sep 2025 19:47:43 +0000
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

From: Alexandr Sapozhnikov <alsp705@gmail.com>

Return value of function drm_crtc_init_with_planes(), 
called at virtgpu_display.c:276, is not checked, 
but it is usually checked for this function

Found by Linux Verification Center (linuxtesting.org) with SVACE.
Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index ad924a8502e9..59b652e8a630 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -253,6 +253,7 @@ static const struct drm_connector_funcs virtio_gpu_connector_funcs = {
 
 static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 {
+	int ret;
 	struct drm_device *dev = vgdev->ddev;
 	struct virtio_gpu_output *output = vgdev->outputs + index;
 	struct drm_connector *connector = &output->conn;
@@ -273,8 +274,10 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 	cursor = virtio_gpu_plane_init(vgdev, DRM_PLANE_TYPE_CURSOR, index);
 	if (IS_ERR(cursor))
 		return PTR_ERR(cursor);
-	drm_crtc_init_with_planes(dev, crtc, primary, cursor,
+	ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
 				  &virtio_gpu_crtc_funcs, NULL);
+	if (ret)
+		return ret;
 	drm_crtc_helper_add(crtc, &virtio_gpu_crtc_helper_funcs);
 
 	drm_connector_init(dev, connector, &virtio_gpu_connector_funcs,
-- 
2.43.0

