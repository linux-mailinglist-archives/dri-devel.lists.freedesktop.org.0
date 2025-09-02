Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A684B47804
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED7B10E403;
	Sat,  6 Sep 2025 22:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ke24/hBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014CE10E667
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:21:39 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-7723cf6e4b6so2070894b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756812099; x=1757416899; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1peIzucQT9u+8mHdz0lvrHZdBPLJn2LftndnROMFbg=;
 b=ke24/hBvUqRr/w2Zmfz/FP7WtQ9ROowfaRVYnQp23O6P5Z4fyLCo3EPDwnSfUuFwoo
 z085Cv78QQGDUOeIKM6oOBWWHgpDb74cytFmEiq0M0jwv/h9dA9dF5SRhBInqx0/QnXG
 E1f9s4UTVR+gxW8VtiWf8iwTEnN7vaTNEdOK+C9656GA+AWlHvmkn5T58TYt60ubbtz7
 jC3SrNIiuBgJ2/40xsnLIkn96g7X1eTMYE8tUmSHfWcTHUNZ8U49sFjswo91d2op8NJx
 Ue5LbARmZdNCLeQYoshJncrqFTksubx8feqrMTedNaMcExUt1lqoErtjQhcmBbD+zrdW
 Nd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756812099; x=1757416899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C1peIzucQT9u+8mHdz0lvrHZdBPLJn2LftndnROMFbg=;
 b=rGlQp8Rmqb1HCmH8g0C+4SI8NepgjqfVbBBjP5xHmY2SESgZbnTxyMKcbQ9iRaoWwH
 O2tav5WRcdCEbexmvN0yhAJdSMUCbER716BfDSX6sv9aK0BNNnuthdqndb375vwtSQoF
 3sA/GJa1fQsIIntMvdDDIYv8A55zvQ6TDR7wi9W4F2JXIQq2Ci/GTHB3TFM0h/PNnRGa
 eVUY5H/1FUGD5MAxJxkLeypBz47xWhxQfN+YPVG99UHFH+WM7Yl/Q4/KYnYKZNXDoIIA
 Jy8QaUXoh3exUr/FRH9DHe9BaOsDNvSZM225EeHcD+7ptJrJyegLpEwrzIzenSU0XMLf
 FtnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXLHz7mdR7nMfEyex+8lUYU1GD/fGGwWeTy9JruvomJaHMyCGJdA18fq1QgpuOxuiara5oion/XFg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXieWjIldtUA9PalDSsCxCks/cS/YNVvOc65WfZRp92Pt0+giK
 IPmeNsJEyPm1jPqPlLa/rEMwX0xZXWrpOAF5KslY67YqaPeDXcYacB5zBg0jKgqz
X-Gm-Gg: ASbGncteBj2vOmv5fFfhVYbkhL/iVa+weVew6GtS7YecLCQJpqlD7WdVKb4X8nkF7O7
 Sv4WXe/FJCAkZ2tc/RNfoGrtusOgFQX9b0JQXRCoPzPNt5Natkiav27ymjwMG2jSBrl1BfoKyVa
 zC1XAtsz3oJnkjkRYVD1LDFqxLSLCJ7t1deN34a6jK2x+/n0OruoZkKsNGgwX6g4aWjKU8HnaPV
 1dbidf6rgVmT5T0xwRG0TCri8klMLf6h0hBe8ITVqPnzKA0YW37H3DiRWSK8AOmSrkKXfk58whc
 cn7GtR+/bL5s+ImX9rCl9DFsWj72O8lpFZqMWqQndkt5J/hRO18/vpQ3ltACbkU6qcv9AVTL072
 BVy+xcQkRP6C5EzfOkWesstVoz1TL4ixmzHHyyRYQUmVzqL9rt3M2t7MEPUWJ
X-Google-Smtp-Source: AGHT+IHYpnAEN97dhppR5gZj3bV2/ORfp7nw4JDDkTPmEAt+EIglpgn6hekUrxJELxqoV+MTc9dF5A==
X-Received: by 2002:a05:6a00:14d6:b0:76b:c9b9:a11b with SMTP id
 d2e1a72fcca58-7723e21e594mr12353303b3a.3.1756812099412; 
 Tue, 02 Sep 2025 04:21:39 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a4e27d1sm13140645b3a.81.2025.09.02.04.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:21:39 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: krzk@kernel.org, alim.akhtar@samsung.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, aha310510@gmail.com
Subject: [PATCH 1/3] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in
 vidi_connection_ioctl()
Date: Tue,  2 Sep 2025 20:20:41 +0900
Message-Id: <20250902112043.3525123-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902112043.3525123-1-aha310510@gmail.com>
References: <20250902112043.3525123-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:44:18 +0000
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

vidi_connection_ioctl() retrieves the driver_data from drm_dev->dev to
obtain a struct vidi_context pointer. However, drm_dev->dev is the
exynos-drm master device, and the driver_data contained therein is not
the vidi component device, but a completely different device.

This can lead to various bugs, ranging from null pointer dereferences and
garbage value accesses to, in unlucky cases, out-of-bounds errors,
use-after-free errors, and more.

To resolve this issue, we need to store/delete the vidi device pointer in
exynos_drm_private->vidi_dev during bind/unbind, and then read this
exynos_drm_private->vidi_dev within ioctl() to obtain the correct
struct vidi_context pointer.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 23646e55f142..06c29ff2aac0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -199,6 +199,7 @@ struct drm_exynos_file_private {
 struct exynos_drm_private {
 	struct device *g2d_dev;
 	struct device *dma_dev;
+	struct device *vidi_dev;
 	void *mapping;
 
 	/* for atomic commit */
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index e094b8bbc0f1..1fe297d512e7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -223,9 +223,14 @@ ATTRIBUTE_GROUPS(vidi);
 int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 				struct drm_file *file_priv)
 {
-	struct vidi_context *ctx = dev_get_drvdata(drm_dev->dev);
+	struct exynos_drm_private *priv = drm_dev->dev_private;
+	struct device *dev = priv ? priv->vidi_dev : NULL;
+	struct vidi_context *ctx = dev ? dev_get_drvdata(dev) : NULL;
 	struct drm_exynos_vidi_connection *vidi = data;
 
+	if (!ctx)
+		return -ENODEV;
+
 	if (!vidi) {
 		DRM_DEV_DEBUG_KMS(ctx->dev,
 				  "user data for vidi is null.\n");
@@ -371,6 +376,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct drm_encoder *encoder = &ctx->encoder;
 	struct exynos_drm_plane *exynos_plane;
 	struct exynos_drm_plane_config plane_config = { 0 };
@@ -378,6 +384,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 
 	ctx->drm_dev = drm_dev;
+	if (priv)
+		priv->vidi_dev = dev;
 
 	plane_config.pixel_formats = formats;
 	plane_config.num_pixel_formats = ARRAY_SIZE(formats);
@@ -423,8 +431,12 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 static void vidi_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 
 	timer_delete_sync(&ctx->timer);
+	if (priv)
+		priv->vidi_dev = NULL;
 }
 
 static const struct component_ops vidi_component_ops = {
--
