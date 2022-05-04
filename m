Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7FB51A9D6
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 19:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9342C10F3D4;
	Wed,  4 May 2022 17:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF5910F1A9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 17:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651684737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3t8epFEjcxVGinupv1KfUngZ1NH7mCjOSa22VqDXFR0=;
 b=X1+4HlfZBhTqWCgP1r5i8asWa5k/8KZqFkILiwIgoa/ebK0fILBDn1kv2Q+C+UexoTywc6
 FBnzZpoeCmKvxJAGs3b46jz3mnI4xhrpKPeTL61tszjksPi2yodu0urO3g+YI27F+F/3Sa
 AyKObawJMjlCsttouj9uXen+WzX3vDo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641--lT5P9USO0G0fmhiPrbyeQ-1; Wed, 04 May 2022 13:18:56 -0400
X-MC-Unique: -lT5P9USO0G0fmhiPrbyeQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 b65-20020a509f47000000b00427b34634d3so1120529edf.20
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 10:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3t8epFEjcxVGinupv1KfUngZ1NH7mCjOSa22VqDXFR0=;
 b=XKxGp6mQbygR7UZxXwwQU6uDPz3rgZcFbu6uiTx/8z3epJchleLnffSndGJE41UdR4
 W/74urLqZw/+4yu+y99+lZ7n2VqeyWrqWWXPBfivUy8bO9f6OuvMEchKrRsXjkRLnktM
 EhR+q+jlLS/WwEXrVWyC2tAGf23V4FEX34vsmoHW09sn1YxPdYr83guxUjyRmV17WrE4
 gD2WMh1naDIykZD7amK5i9u7OVpsbZpAZX4EXW2SLtfw68TX2uWrNz/6ICF1T9X91DWw
 hXccewIPnXG9jYdeEI4mX6angqPIRgkObSdJddB4QAmwf2P5evbtTZdgu2x+QzywQL8G
 TdAw==
X-Gm-Message-State: AOAM533Ak1gRwbuMKZP7b4ru5Y+OdDBF0iY/X4R6N2S7lTZaSen0hYbi
 3/bvGg5yJ1o86gV45yFnHYeALtNKkfXWBCrRo3hLScdHaBB7oE43WswQcQP6QRqu7QXQIC1AnVD
 QFTx2SVG4FEAfq25hGh2TWgCXpxsA
X-Received: by 2002:a17:907:a407:b0:6f4:3f14:7707 with SMTP id
 sg7-20020a170907a40700b006f43f147707mr16222518ejc.351.1651684734978; 
 Wed, 04 May 2022 10:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeNLSEO6aMZEJmeSDZvOrdtsRQbX4QDRaEAbooQf77kraL3riqlGTEh69XjibmoSyspABsDQ==
X-Received: by 2002:a17:907:a407:b0:6f4:3f14:7707 with SMTP id
 sg7-20020a170907a40700b006f43f147707mr16222496ejc.351.1651684734772; 
 Wed, 04 May 2022 10:18:54 -0700 (PDT)
Received: from fedora.nat2.vcit.vutbr.net (nat2.vcit.vutbr.net.
 [185.62.108.68]) by smtp.gmail.com with ESMTPSA id
 bf16-20020a0564021a5000b0042617ba63aesm9492598edb.56.2022.05.04.10.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 10:18:54 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: reorder nouveau_drm_device_fini
Date: Wed,  4 May 2022 19:18:51 +0200
Message-Id: <20220504171851.17188-1-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mmenzyns@redhat.com
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Ben Skeggs <bskeggs@redhat.com>,
 Mark Menzynski <mmenzyns@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resources needed for output poll workers are destroyed in
nouveau_fbcon_fini() before output poll workers are cleared in
nouveau_display_fini(). This means there is a time between fbcon_fini
and display_fini, where if output poll happens, it crashes.

BUG: KASAN: use-after-free in
__drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291
[drm_kms_helper]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 561309d447e0..773efdd20d2f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -588,12 +588,6 @@ nouveau_drm_device_init(struct drm_device *dev)
 	if (ret)
 		goto fail_dispctor;
 
-	if (dev->mode_config.num_crtc) {
-		ret = nouveau_display_init(dev, false, false);
-		if (ret)
-			goto fail_dispinit;
-	}
-
 	nouveau_debugfs_init(drm);
 	nouveau_hwmon_init(dev);
 	nouveau_svm_init(drm);
@@ -601,6 +595,12 @@ nouveau_drm_device_init(struct drm_device *dev)
 	nouveau_fbcon_init(dev);
 	nouveau_led_init(dev);
 
+	if (dev->mode_config.num_crtc) {
+		ret = nouveau_display_init(dev, false, false);
+		if (ret)
+			goto fail_dispinit;
+	}
+
 	if (nouveau_pmops_runtime()) {
 		pm_runtime_use_autosuspend(dev->dev);
 		pm_runtime_set_autosuspend_delay(dev->dev, 5000);
@@ -641,15 +641,14 @@ nouveau_drm_device_fini(struct drm_device *dev)
 		pm_runtime_forbid(dev->dev);
 	}
 
+	if (dev->mode_config.num_crtc)
+		nouveau_display_fini(dev, false, false);
 	nouveau_led_fini(dev);
 	nouveau_fbcon_fini(dev);
 	nouveau_dmem_fini(drm);
 	nouveau_svm_fini(drm);
 	nouveau_hwmon_fini(dev);
 	nouveau_debugfs_fini(drm);
-
-	if (dev->mode_config.num_crtc)
-		nouveau_display_fini(dev, false, false);
 	nouveau_display_destroy(dev);
 
 	nouveau_accel_fini(drm);
-- 
2.32.0

