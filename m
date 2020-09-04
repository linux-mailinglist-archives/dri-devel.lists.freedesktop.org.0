Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6017625DBF3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2F36EBFB;
	Fri,  4 Sep 2020 14:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C86C6EBED
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:39:55 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s13so6281680wmh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 07:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jVoidh4eK5SMWwvVdGvcbPkxD3QsnFfymSXNjak7xmE=;
 b=OOfQuuEjKv7K7JE/iEfPadM7YeVbvi5x5/nRiuZ6Tiu4JjvAjZGDTsrz58t4W/Q186
 sia+cMjtDK6YHVoR3S9fGguTewDkrDaHcwW/icau3G6FNw5SWLBqlNWPg0qLRt7QOOCF
 J3VwzJUi2cBNzOJF6tXyipqqGGXF3Xs0YBwA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jVoidh4eK5SMWwvVdGvcbPkxD3QsnFfymSXNjak7xmE=;
 b=sXySCiz3iSIIjqzS3LJPpQEygoZc1WEohmHCMYqw/0t1zWPJjLl0tKNFgBVd9JrcWA
 kyR8mqk2HHfHw4NOy07A6tOTl83fG2kuIMbzNOBqySY8tu27uvHogDmRC0IKRACbv0cu
 HJoFmOfhT1qf7uY4NrPm/8/hX00xA6Lo4epzzquqeBK+9+okgK6OLNTU9bFbt/xm2EJ2
 xg/nNTpLRTBFZylPyHrsDfiuCcE+6oK1Q1rRPsqRYYQ+pNUZkotnj6xyV8cxQAdYgHP+
 LsfBVHF2NTdcPMpteL4GpYjIVwl+GfFSdfJh34HDX8auKF3ljxbploRu8B49vWFh+NyU
 e3CA==
X-Gm-Message-State: AOAM532JONKa5BB2dx7oKNHmQDphra8kYoD6aDbkTmABFqSkH8X01d4u
 HfNE/OPjjmNL+oTXCoWdd+VUO+8Kmigeubgw
X-Google-Smtp-Source: ABdhPJwXq6NOrlxpVN3brn1Ux/H7QK48bMhmZeY6MRyKCSG1l5Ra/JAtR0LL2xfsumSS1k1GSsxlxg==
X-Received: by 2002:a1c:2d95:: with SMTP id t143mr7665997wmt.44.1599230393790; 
 Fri, 04 Sep 2020 07:39:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:39:53 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/24] drm/aspeed: Use managed drmm_mode_config_cleanup
Date: Fri,  4 Sep 2020 16:39:20 +0200
Message-Id: <20200904143941.110665-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Joel Stanley <joel@jms.id.au>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since aspeed doesn't use devm_kzalloc anymore we can use the managed
mode config cleanup.

v2: Keep call order as suggested by Sam.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 903f4f304647..2b424b2b85cc 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -63,15 +63,21 @@ static const struct drm_mode_config_funcs aspeed_gfx_mode_config_funcs = {
 	.atomic_commit		= drm_atomic_helper_commit,
 };
 
-static void aspeed_gfx_setup_mode_config(struct drm_device *drm)
+static int aspeed_gfx_setup_mode_config(struct drm_device *drm)
 {
-	drm_mode_config_init(drm);
+	int ret;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
 
 	drm->mode_config.min_width = 0;
 	drm->mode_config.min_height = 0;
 	drm->mode_config.max_width = 800;
 	drm->mode_config.max_height = 600;
 	drm->mode_config.funcs = &aspeed_gfx_mode_config_funcs;
+
+	return ret;
 }
 
 static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
@@ -144,7 +150,9 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	writel(0, priv->base + CRT_CTRL1);
 	writel(0, priv->base + CRT_CTRL2);
 
-	aspeed_gfx_setup_mode_config(drm);
+	ret = aspeed_gfx_setup_mode_config(drm);
+	if (ret < 0)
+		return ret;
 
 	ret = drm_vblank_init(drm, 1);
 	if (ret < 0) {
@@ -179,7 +187,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
 static void aspeed_gfx_unload(struct drm_device *drm)
 {
 	drm_kms_helper_poll_fini(drm);
-	drm_mode_config_cleanup(drm);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(fops);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
