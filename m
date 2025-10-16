Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D3ABE4EF3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4107410E319;
	Thu, 16 Oct 2025 17:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bz1+cNmN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAE510E310
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:56:44 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42568669606so838348f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637403; x=1761242203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3kmKem70jvZ9LoR1TdTHaGoDSxtiVxdO7P0NAM1Dmj4=;
 b=bz1+cNmNNcGxykxQv0uUsXtYNDdxotKfLynCbJeUu9Psc2jBmYg468beYxNQ5SNvUp
 Gd2loxDVxCu3zwryE9QRYg+xIhpOHIttnX9qPfa/c5bl1nCBGWKT0GjQZO5Wy5NAd0Hd
 eIYv9TVKBTNVCFmbjkExLSnWqAEKtJKigNzNfbyRx1Mn71ovK7JTN0o0gWLIHkrQmSKm
 lCx3HjXtYwz/zQncU4bVIAODaa11/VcbbxeAYsf7ShtDTPknmXdg3fAPIetxmejiYNlm
 96Y9ovGCZu44OFKLmlFpfIGIvnw2j+iZ7ITR74xg2l4cRfc2lDERvP63a9SDJatu7nld
 bm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637403; x=1761242203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3kmKem70jvZ9LoR1TdTHaGoDSxtiVxdO7P0NAM1Dmj4=;
 b=kBYon0psiTDCW5mSyxUXUFuRvfsbmWOVk/1yVYyyXAb8sDYCS8Z3ubQdoyR+TDlbrY
 PHAXL7W8n1rOvmna30ADX42ZhVCer8Ejc/ScEom2ju/qvZdnvviciky641+vSCYA7Gve
 oF2OIJA/n5sSoe1bHeFVXyqxr4wZs8/w+iyzy1tuARqQr8FRnUe7+YjKgpSs8JKUC0sX
 BhvvMr2qjJq61kzGSqcjcn2ZIB2xGB06QZfKltBAe2v9w00O6gTzKaEmvncHeApfHhD2
 M0YrLtIsBFHtwJlo4sbsoMKrkEqf9E+Ej40iX/gt3dzFe+PKr2fUS7FJU+/JlnP7/6TP
 efaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkjq0IrfnH18JT+LGMxApAKPzpqDwrubiCrJ0j65tJvTvwDQ41dtS/9uc+Cjj7TEoTLww6Kb9kxbo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7CqxzX9zUB6zZlCVgndqtglqkJKkwEMzpt1xOu9Wu+qdVlMsp
 OpbTrsuzKtCGfijKxCR/pB0j2IYu4nZt+lMruHk0spzvloriPWZ7b+su
X-Gm-Gg: ASbGncu+KhWBDrhPrUVyObiwrCFeKAUiUxLDSDab0zGQPPs3zLGMFbaTf5VTmdryzAy
 9UvaOOv3Q5hFjx+NktT5mXWy8WST13KA2Awd4jSEabdqu1Tx+OCAu6BSeXY41nu4cXCGCYoiEVP
 7bnHuvbiJvSMqYPbM7wrym1iDeDp7DrJrHE+Yof2fZf6udFcfEGyLQs3ICTFDuCeqGnxjbKDfu/
 5Ul+CS39iMTYLss8+1VtOoXn9z7O3E4bB6XX0f+zoVw8rsIZuTIYpC16A9EMXdBcMgSCRvx1l+i
 SSYiWyQrRr9o+tEuQZDI+ZPbrA5gs0M+ytRoEG78584vM4EmhS9H/cmGsG7e6eV8l/dBwkgZbwI
 yRlmKi4BgUsANeXHsGD9l2Vh/AReu1UcuP1zKMZw0c8Po2sZS6/uhJhZqM8zWC9akn18HZUPItB
 o=
X-Google-Smtp-Source: AGHT+IGbJz7x6kWyeAzr1cqOyNqUZQkkfzh9jBeeJgGBUoiQ7xa+MKsRfzCNAV42+zCg/ujXdDEIZA==
X-Received: by 2002:a05:6000:22c5:b0:3f2:b077:94bc with SMTP id
 ffacd0b85a97d-42704d7e9c4mr686747f8f.4.1760637402823; 
 Thu, 16 Oct 2025 10:56:42 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:42 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Mark Yacoub <markyacoub@google.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v7 01/16] drm/vkms: Expose device creation and destruction
Date: Thu, 16 Oct 2025 19:56:03 +0200
Message-ID: <20251016175618.10051-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016175618.10051-1-jose.exposito89@gmail.com>
References: <20251016175618.10051-1-jose.exposito89@gmail.com>
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

In preparation for configfs support, expose vkms_create() and
vkms_destroy().

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c |  4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e8472d9b6e3b..78af37c7bd83 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -146,7 +146,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	return vkms_output_init(vkmsdev);
 }
 
-static int vkms_create(struct vkms_config *config)
+int vkms_create(struct vkms_config *config)
 {
 	int ret;
 	struct faux_device *fdev;
@@ -229,7 +229,7 @@ static int __init vkms_init(void)
 	return 0;
 }
 
-static void vkms_destroy(struct vkms_config *config)
+void vkms_destroy(struct vkms_config *config)
 {
 	struct faux_device *fdev;
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index fb9711e1c6fb..db260df1d4f6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -256,6 +256,26 @@ struct vkms_device {
 #define to_vkms_plane_state(target)\
 	container_of(target, struct vkms_plane_state, base.base)
 
+/**
+ * vkms_create() - Create a device from a configuration
+ * @config: Config used to configure the new device
+ *
+ * A pointer to the created vkms_device is stored in @config
+ *
+ * Returns:
+ * 0 on success or an error.
+ */
+int vkms_create(struct vkms_config *config);
+
+/**
+ * vkms_destroy() - Destroy a device
+ * @config: Config from which the device was created
+ *
+ * The device is completely removed, but the @config is not freed. It can be
+ * reused or destroyed with vkms_config_destroy().
+ */
+void vkms_destroy(struct vkms_config *config);
+
 /**
  * vkms_crtc_init() - Initialize a CRTC for VKMS
  * @dev: DRM device associated with the VKMS buffer
-- 
2.51.0

