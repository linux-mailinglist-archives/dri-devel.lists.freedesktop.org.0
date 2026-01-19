Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B408ED3AA83
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B462110E465;
	Mon, 19 Jan 2026 13:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fIAlft6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A029510E3C5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:26:05 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2a0d6f647e2so40314625ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768811165; x=1769415965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1peIzucQT9u+8mHdz0lvrHZdBPLJn2LftndnROMFbg=;
 b=fIAlft6Mci0bIyuQXOPHlQq8iclYXwtAcnQsz07V0a9jq3R0nqdurz6jcZ10Ds6EM7
 +Utk9Z3qHkKMrGjiE3NSlD6vKpNsHd+TIfXcGB7DqsnveftDxStqtapuOSdyRkHYgXf1
 CfbPSat2m7m7Nj3LJ1jReJ2fsRyWlEgnUWFyrMhBT3u6BZg86I87/YmccX1bH/7rqn86
 fF4qBlelWHSx0ISXDUKjYQqgqZVTmZO0hXYApNv45fDGdM8nfyZDbgUGNuI9aqZkgVih
 W6pEIF6Z2Pjx0sEeF42D0r1RknXfQPQOFd7Ls8aAimXbq5BOwxpuE5sM1Qg/EyfcD0+s
 BhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768811165; x=1769415965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C1peIzucQT9u+8mHdz0lvrHZdBPLJn2LftndnROMFbg=;
 b=Dy7FU23r0wjGDMsmmmZeMzlOLIU3zzFO/RMAyopZ9HMSwt2tTphCML6pIlfmQfVTen
 1Tmp5Gk/JPtjgW8uoDpN7aQ0FkLKx8PR9eBgN/+6GO8yeZrXWDXkHw83z5jIO4njvlsv
 HpsPcfEZGXeH9L85rAYFbKX42RaFcqWLPRFeBuiE+4YoUSvEo1osHd7bwHrH28T6YGoL
 QnIp+8QC5M+1/+GQpgIOYmj7BjOYQgPlK2LVwamZS3KmGLPHo512M6/wGmfGWBZUQCNq
 EAlGPnQ6ara2EBULZr0/5bitsGTfV46q40Cs7U3i6q+fUFM9XymEtwe5o25z6bWOML6g
 1cyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKgtW3mQfbXR7RXILJSRKhLhboPtvb5Ho24ZMDwjyTWs9Eslnj9ndUJHBB01gPVqiOuWHqZQ5DodU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyv/fJbC1/Jrb6c0E03an3f2n0YSGCDpcpSjP/1ZSzfIMOUZrc6
 2v2aC5jgKCFxIMnb43H47sgxrmdggsnlP+FcmCpoVfW6xw0CRZq94Hik
X-Gm-Gg: AZuq6aJBXWb2/3IjvAq6C1W1dl9G6Jpqp6+7pvBJ5JL61LqeK1xvOi9lBVCiB8g1r4O
 SGT+lYj5leUZaW31WBDdLmFH6SVtdtBnR3M1Yr8Fk7wHcm0I5ofFUFXRH+JReDF9dQRhXpJ/c2m
 8g2GWDa3b21EJ7ywTLNLRc2GikvdFqTb8r1+0XU0DrgZodOYBfaLZLo5flNIG6OW6tFUVLA+Fc1
 LN9zfZOVhIk/UxvF/ga0DWySx5J0DtTdgnNUeYjaHRFZ8i+OqhI9MjsaT9/9q+EfoHM8WQOsOKU
 iIEcteW3EMM6srAXndDX/1h1hg2xlq/yRpPJO2sbhBXjAVn3OZLoAsGTFZXRcO+9qGzwTed48Wf
 CwUy/2sDh2KGAUnTqCEtwK3hCtdtLGcfDwQH5yISQ6RgGcNU2HFj73j7TJifq+FFdWtPOQC4GoB
 leCGIoIkpiVIgONWqqJD3A++1dqFs75fHU3i7pLg==
X-Received: by 2002:a17:903:1ae4:b0:2a0:f828:24a3 with SMTP id
 d9443c01a7336-2a7175cc0f1mr100262275ad.28.1768811165155; 
 Mon, 19 Jan 2026 00:26:05 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7190ce534sm85699645ad.27.2026.01.19.00.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:26:04 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 1/3 RESEND] drm/exynos: vidi: use priv->vidi_dev for ctx
 lookup in vidi_connection_ioctl()
Date: Mon, 19 Jan 2026 17:25:51 +0900
Message-Id: <20260119082553.195181-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119082553.195181-1-aha310510@gmail.com>
References: <20260119082553.195181-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Jan 2026 13:39:11 +0000
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
