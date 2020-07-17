Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB592237BA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F316A6ED74;
	Fri, 17 Jul 2020 09:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E290B6ED78
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:53 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z2so10234723wrp.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+PgYCTE9+86LL8hmpo3wNDvQ3MAJhOxmPWFQosNnkp0=;
 b=kge1RFcNb3MA3gqeJzyuV24hUc8Wuu5d52T2gwyiKPKlVVFuua5swyDy6DIhvkNK5V
 O7aHOHvHI2g+W6rPUxi9EK/wSmgHDfpELQi/FWldTxF4LA5hKnx2XUn/hJYTg+GvKjKs
 0ppARKzGJPOZVBBk6nxakp5DLfoTkaBi9D+gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+PgYCTE9+86LL8hmpo3wNDvQ3MAJhOxmPWFQosNnkp0=;
 b=tCpy4lpvLQMPfd1hnb7io0Td4oUOtH7xrRxPUkuw7Bp/DKVE4jyECxqiHBV0t18bai
 rJf72S9SDKyYfX5t2I/d0BjGsFScp2SYMK6V+KgwK6ih869K7FGs6UGY8fmWggPopXp+
 PxasiZGy6E7UHNKw3uI55Mw4WaGrxQ85tujUhbUynuX7GwVOCrVATZqsZuWGhWUX2/Qf
 lyMbfsiMRJEjyqpH+1xckuFZNDeEMW9ZiOe7u3rrcdMSV3PIPzHZRsfShTO57KVwrsfQ
 a4Enk2QjMyu2pustVZFf9f68clC9xraLa9lCT6NAnXCWanaPlFNri+t2OkMMTn/gpUYa
 l0AQ==
X-Gm-Message-State: AOAM531acrCYX7XRf61FBjrICer+b+Pz6j/daMWWoNTvbxw6ca3bFBIb
 zRWZjWVCeM1DdY5RPqplBWcdF/3z0WE=
X-Google-Smtp-Source: ABdhPJy+91Soji71zWg4yMwSROun4xr6l/lazz9FI4nvDy4dRbGGruyC/WVVdgCNY4lq5iOhkRtW/w==
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr9095443wrs.36.1594976692331; 
 Fri, 17 Jul 2020 02:04:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:51 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 18/18] drm/aspeed: Use managed drmm_mode_config_cleanup
Date: Fri, 17 Jul 2020 11:04:30 +0200
Message-Id: <20200717090430.1146256-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
References: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Joel Stanley <joel@jms.id.au>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since aspeed doesn't use devm_kzalloc anymore we can use the managed
mode config cleanup.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 903f4f304647..0e19523f2a06 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -63,15 +63,15 @@ static const struct drm_mode_config_funcs aspeed_gfx_mode_config_funcs = {
 	.atomic_commit		= drm_atomic_helper_commit,
 };
 
-static void aspeed_gfx_setup_mode_config(struct drm_device *drm)
+static int aspeed_gfx_setup_mode_config(struct drm_device *drm)
 {
-	drm_mode_config_init(drm);
-
 	drm->mode_config.min_width = 0;
 	drm->mode_config.min_height = 0;
 	drm->mode_config.max_width = 800;
 	drm->mode_config.max_height = 600;
 	drm->mode_config.funcs = &aspeed_gfx_mode_config_funcs;
+
+	return drmm_mode_config_init(drm);
 }
 
 static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
@@ -144,7 +144,9 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	writel(0, priv->base + CRT_CTRL1);
 	writel(0, priv->base + CRT_CTRL2);
 
-	aspeed_gfx_setup_mode_config(drm);
+	ret = aspeed_gfx_setup_mode_config(drm);
+	if (ret < 0)
+		return ret;
 
 	ret = drm_vblank_init(drm, 1);
 	if (ret < 0) {
@@ -179,7 +181,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
 static void aspeed_gfx_unload(struct drm_device *drm)
 {
 	drm_kms_helper_poll_fini(drm);
-	drm_mode_config_cleanup(drm);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(fops);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
