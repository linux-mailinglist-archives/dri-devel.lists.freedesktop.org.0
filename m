Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40074820EA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 00:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6738610EBC3;
	Thu, 30 Dec 2021 23:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B55410EBC3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 23:56:17 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id o30so13986549wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 15:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HquMs86R/2fSeMwrKiFYntNswT/jyW+k3LeVZxsjHFc=;
 b=aimcO/TVd9nLXP7KRWG9TSbEhFtB8BJ5Ypa/LerWNZpYC2h0L6iZj56Qz+jlNG/BSg
 sM2L9k0hfACJB+f7Ajp5KiZ1YrA5/8Vmq0Kc5vaw8oGvx9aLt2yogvggS3NTJG49fFG6
 jmAJdNj6c2tAIwVzkLMd3J/HbVaaXrywKXtbBgYY6xxuptnuO8Bn+ydOZALpWnwADh7m
 ch5pyVOD5DK4H3c2OpUu0WNBzzb8I5KyjOnu1nLuN/1daBe4GCq3bF2vvZ6p3JUQGPv4
 uglLVhg+sEbUcUJ+BAEA1RpeqORqdNISz3VL764tRkg7+WpbzedShoj/K++apOlwPiJ5
 EQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HquMs86R/2fSeMwrKiFYntNswT/jyW+k3LeVZxsjHFc=;
 b=u0N5fV2ek8npxMLbVSufzq8FJj8PWPIApQOgwqNRQdaaZMJqmyvePwHACXWypLBu2Z
 0lLE34kud8/xRZ91lBZZsBBTdxrwY2dPyvCy1gUrok10cB7xq9DOVoxkfZljVMK4rAUP
 1wzbfwfRnBqOwsr3LVNpp1XaJygn1LI6iAGFHj0wzVBaUpO/BGR+6cacJ4xbG3yHkz2r
 XVbJZPEa/OpM27lDNV8i4WRxqHrv9KTAzxyoF7O5f88yCf2M/0TR4T3aWEpsVhecxrPX
 Bal5eD7PG3pl+JWP/kGmRFatotLq8+I/Os0RP84K/af/WZn239cSytAF4W4k87SzoLh0
 /bNg==
X-Gm-Message-State: AOAM532QJINWEGwCZA6jiQKQY1LB3I4WMh9tKEdlQwVr1EUEgHhpEive
 XLiAodxiHczGne2Bls6oZfE=
X-Google-Smtp-Source: ABdhPJxsbq3CsAbIef75T6kasQUgh1BPtxbFzJI3LjtCD4VpZZEwaW683xGiB2wbopwaPfTSrv4Kcg==
X-Received: by 2002:a05:600c:4ed1:: with SMTP id
 g17mr19264564wmq.112.1640908575690; 
 Thu, 30 Dec 2021 15:56:15 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c015-2400-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c015:2400:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id f16sm35137581wmg.27.2021.12.30.15.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 15:56:15 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH 2/2] drm/meson: Fix error handling when afbcd.ops->init fails
Date: Fri, 31 Dec 2021 00:55:15 +0100
Message-Id: <20211230235515.1627522-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211230235515.1627522-1-martin.blumenstingl@googlemail.com>
References: <20211230235515.1627522-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When afbcd.ops->init fails we need to free the struct drm_device. Also
all errors which come after afbcd.ops->init was successful need to exit
the AFBCD, just like meson_drv_unbind() does.

Fixes: d1b5e41e13a7e9 ("drm/meson: Add AFBCD module driver")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index b919271a6e50..26aeaf0ab86e 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -302,42 +302,42 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (priv->afbcd.ops) {
 		ret = priv->afbcd.ops->init(priv);
 		if (ret)
-			return ret;
+			goto free_drm;
 	}
 
 	/* Encoder Initialization */
 
 	ret = meson_encoder_cvbs_init(priv);
 	if (ret)
-		goto free_drm;
+		goto exit_afbcd;
 
 	if (has_components) {
 		ret = component_bind_all(drm->dev, drm);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't bind all components\n");
-			goto free_drm;
+			goto exit_afbcd;
 		}
 	}
 
 	ret = meson_encoder_hdmi_init(priv);
 	if (ret)
-		goto free_drm;
+		goto exit_afbcd;
 
 	ret = meson_plane_create(priv);
 	if (ret)
-		goto free_drm;
+		goto exit_afbcd;
 
 	ret = meson_overlay_create(priv);
 	if (ret)
-		goto free_drm;
+		goto exit_afbcd;
 
 	ret = meson_crtc_create(priv);
 	if (ret)
-		goto free_drm;
+		goto exit_afbcd;
 
 	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
 	if (ret)
-		goto free_drm;
+		goto exit_afbcd;
 
 	drm_mode_config_reset(drm);
 
@@ -355,6 +355,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 uninstall_irq:
 	free_irq(priv->vsync_irq, drm);
+exit_afbcd:
+	if (priv->afbcd.ops)
+		priv->afbcd.ops->exit(priv);
 free_drm:
 	drm_dev_put(drm);
 
-- 
2.34.1

