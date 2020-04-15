Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A01A94F9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76E36E8E2;
	Wed, 15 Apr 2020 07:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDAA6E8AA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:38 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t14so4650037wrw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bgyl8gwEhgw+1DWHG2zt0So6E/0SeXCV3Ne1xirJ9SU=;
 b=RnzWg22wpo2WhG14fxwTjDsLx7d+MMOUoe/Y5LZwI0RpQXNu2jriSG9MlQGXielvTq
 RNl6hIdqqy6crc11kcuQR1aLPDxagvBeZelPptN5biJLV7s3iRBSi/z9+RmJUdpKfzWf
 zJ5B3Y/k8P0dP/+9t0MxSw2FRViLtuo5BhIZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bgyl8gwEhgw+1DWHG2zt0So6E/0SeXCV3Ne1xirJ9SU=;
 b=Ph03Y15pAv6AeUG+LauO1JTJmatr26VWx28eGuiXTZq1NON/Uwuz+kn4gWNWU4ErIe
 2bMKdz8FW+ZpYdqgfLyBlhZEmE/itLYK57JFGozsrr7u7t54brDlKTA9DK/pOAxJlkre
 JGM6rnnkYIba8oj///ECIeuneFRoFNhSqgQChizECcI5i8CFqe/iuQU4zbJPDtsrz4Y2
 MfoYfhCecPSv3qi8OkoOULj8RouyiDI7sUY/W6xjsyDkrndUZujFoObgWzzZCSyIxfpp
 bge7JYnEM1ny8tSXXRNfCoUmQeV5CkG+2bI+UpturwEoh7LfzptiN3cvzM9rQUMw4SRf
 FjsQ==
X-Gm-Message-State: AGi0PuahZKckBVVYqIg5YRgURuFXl7TSrkqN4WoRYdSZMr4N/HvmqBD8
 tA9B5K9n2dts020NHsCxw6Jteg==
X-Google-Smtp-Source: APiQypLgjeMnycEVi9VU+fR3cGLcz5D+n0wscsSidJIQlXvYlvgFlxboFTZ5TW2dlAug0JuLNGuGeg==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr26353053wrs.4.1586936497587; 
 Wed, 15 Apr 2020 00:41:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 56/59] drm/aspeed: Use managed drmm_mode_config_cleanup
Date: Wed, 15 Apr 2020 09:40:31 +0200
Message-Id: <20200415074034.175360-57-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Joel Stanley <joel@jms.id.au>, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org
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
index 6b27242b9ee3..6e464b84a256 100644
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
@@ -181,7 +183,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
 static void aspeed_gfx_unload(struct drm_device *drm)
 {
 	drm_kms_helper_poll_fini(drm);
-	drm_mode_config_cleanup(drm);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(fops);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
