Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5069502EA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FF010E2F8;
	Tue, 13 Aug 2024 10:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KDwUk2pI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA32B10E2F8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:59 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-427fc97a88cso41139515e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546318; x=1724151118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDXFx9oyQqvcOYhB99pL1IoGdV1beOFs/38ZJyCSxSU=;
 b=KDwUk2pIKgGY1bQma+jqD01FDEObrih0490LO2dQfJezR2V/ijoEbzagLXoo+nSFTr
 AOq32bWO4HeSA9v8laYORG8Pu9k+7sL7Vn4E8Ye4KkXJwtBAEfpSnQ45c4TLUI3i8sWz
 fXizdmXFyiH10s6hG2R89HEgw/Xpeh9E+LVdUxZiEAeOWhABWrboQSS2SGe0l3XvjbLf
 aOjcXC9z09vvQWofvyWslAaAC++S59h0nxpuwbgsYpghxWqqu7a1HnRcnNPUKxt1pRkN
 3CF3pc7oft605aOUYlnk3Cowh7TEs4dfx2pzZ4JLCn0odBwmdtk1FFjp8ozYXBfuY8HK
 4PoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546318; x=1724151118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDXFx9oyQqvcOYhB99pL1IoGdV1beOFs/38ZJyCSxSU=;
 b=oAA6vyVgNmec4phy9/uDfwzDrM6CdeSl90UV/hy5OFCNMmTX4V3Mic3wJOubjQdkyO
 CLxsJDbQ+0YVHlIyY/oXLuXo4c4XDHsl65YRzyEw2QNDNEf7vtH26F1vHAR7z7/tptfl
 f8w8cTmFtHYFZ6Dch93+78DasO3sNWeRYvnAYr2A9fMKsdQTUgbWrKJxqG8mI967eZ/r
 5BOERHJ4DVp01kbTsNQA3dPaYVoaNwZXxQE94uD9S9ouZN6TzZAZB/0JDb4XAmS5MIGB
 G8HObDgHjo/pEQpdDEZUnZz0fUB8KV3q5d42qrZsiT6U18l5pRnlpYCgwCsdB4KXfnMo
 +BYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURauPvQKhvYlUphZeACh3/FcFufODzWO1KpYDPbbJh2Z6JjyLBxaNg05c4V1tTLQggH98N4HSMzja9iXkEHqWlwNZZ4fsJzFiYp1CJzym1
X-Gm-Message-State: AOJu0Yw3RBWm2gzdYQbX67X3ggO8Qz1Y4PfARv3pbao8vOek0PzHECft
 yszKGH67xwzXco9nHyittgbwghQ1ZibXnPLH+5/EsQI9OGLc5881
X-Google-Smtp-Source: AGHT+IHLXkMedbpCr6hlAG1DdMuIvHHufBsDrmGhHYgCZ8y3pi5ipgfYN1AcQBwWX1VrGZkNd/p4RA==
X-Received: by 2002:a05:600c:450d:b0:428:6f4:57ff with SMTP id
 5b1f17b1804b1-429d48952demr21162335e9.35.1723546318022; 
 Tue, 13 Aug 2024 03:51:58 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:57 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 16/17] drm/vkms: Allow to configure the default device
 creation
Date: Tue, 13 Aug 2024 12:44:27 +0200
Message-ID: <20240813105134.17439-17-jose.exposito89@gmail.com>
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

Add a new module param to allow to create or not the default VKMS
instance. Useful when combined with configfs to avoid having additional
VKMS instances.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index f524a9550017..248cb7166256 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -50,6 +50,10 @@ static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
 MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
+static bool create_default_dev = true;
+module_param_named(create_default_dev, create_default_dev, bool, 0444);
+MODULE_PARM_DESC(create_default_dev, "Create or not the default VKMS device");
+
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_release(struct drm_device *dev)
@@ -230,9 +234,11 @@ static int __init vkms_init(void)
 
 	default_config = config;
 
-	ret = vkms_create(config);
-	if (ret)
-		goto err_kfree;
+	if (create_default_dev) {
+		ret = vkms_create(config);
+		if (ret)
+			goto err_kfree;
+	}
 
 	ret = vkms_configfs_register();
 	if (ret)
-- 
2.46.0

