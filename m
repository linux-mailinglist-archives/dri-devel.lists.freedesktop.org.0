Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 223582237A1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10916ED6C;
	Fri, 17 Jul 2020 09:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781CB6ED6C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:43 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a6so6813253wmm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XO1QRsngG69i/SYmBA9xNZevjmrId/N3WszDady8dis=;
 b=MPJaUip5MbgOd1vDHYEymH7+k/uNfp8+4EV1SES09lwdemP7M9QNmoEe85iK7yVFbE
 EluP2J9SYwP1DPHlpCfyq9omcWfQ1uxG/1kJPaHTWXDshdxSNSaRrr98UutZ88rAMjqH
 FX7Xh89NWHCQGoBkwv1JGdY+2aNpIbNVe6Q8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XO1QRsngG69i/SYmBA9xNZevjmrId/N3WszDady8dis=;
 b=cw1Uz62hDf9Ay1hy6Ha2Mzzxkl2EDR7k0oCkLGB7aU/61LsThn1c2iq10hiZHqsNal
 yv5E6BFOiqgzfRuyJIToB/oWx8YTehd3tlfoqz8vbKIUS82vTXZQHa/75R0FiC8QOjMq
 E+71XQQDiam3XQA0bjs2DtaICvoIiamIrV6DBZUDLsRYJkE2ETLpzzr+nKyqlCdUvu+Y
 9q76UVgOW7zXcv+fDjsJ6JfZe4t7+dsU0ovKzLpzitSv9XibWZAEe3YKdBxaoSIN4DYB
 3WeRCVXXSK7aYU9JDW6v/HK+l6hD0D/8NOSLclbxelpTCK9mIgZAIBstvnwdkWakJp2g
 Plbw==
X-Gm-Message-State: AOAM531uI8Hih+f2UajZfMWVIEFXI1qCjWzRKO9bfGWswaySpcGyiO5i
 Yc+IYxep1BJXofTCNQmZZnPnv5spR9w=
X-Google-Smtp-Source: ABdhPJwqaszmiWUrIMH0ASGH2nTT7dqmPzxs1O48vwilwGsGdomVD2e5DED3UF8rbcn0D3Zl4q8hNg==
X-Received: by 2002:a05:600c:2202:: with SMTP id
 z2mr8724238wml.13.1594976682061; 
 Fri, 17 Jul 2020 02:04:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:41 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/18] drm/arc: Embedd a drm_connector for sim case
Date: Fri, 17 Jul 2020 11:04:19 +0200
Message-Id: <20200717090430.1146256-7-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removes the last devm_kzalloc, which means we're now prepared to use
drmm_mode_config_cleanup!

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu.h     |  1 +
 drivers/gpu/drm/arc/arcpgu_sim.c | 14 +-------------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
index 52afd638a4d2..c52cdd2274e1 100644
--- a/drivers/gpu/drm/arc/arcpgu.h
+++ b/drivers/gpu/drm/arc/arcpgu.h
@@ -15,6 +15,7 @@ struct arcpgu_drm_private {
 	void __iomem		*regs;
 	struct clk		*clk;
 	struct drm_simple_display_pipe pipe;
+	struct drm_connector	sim_conn;
 };
 
 #define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
index 134afb9fa625..e42fe5d05a3d 100644
--- a/drivers/gpu/drm/arc/arcpgu_sim.c
+++ b/drivers/gpu/drm/arc/arcpgu_sim.c
@@ -18,10 +18,6 @@
 #define YRES_MAX	8192
 
 
-struct arcpgu_drm_connector {
-	struct drm_connector connector;
-};
-
 static int arcpgu_drm_connector_get_modes(struct drm_connector *connector)
 {
 	int count;
@@ -57,7 +53,6 @@ static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
 int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
 {
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
-	struct arcpgu_drm_connector *arcpgu_connector;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	int ret;
@@ -72,14 +67,7 @@ int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
 	if (ret)
 		return ret;
 
-	arcpgu_connector = devm_kzalloc(drm->dev, sizeof(*arcpgu_connector),
-					GFP_KERNEL);
-	if (!arcpgu_connector) {
-		ret = -ENOMEM;
-		goto error_encoder_cleanup;
-	}
-
-	connector = &arcpgu_connector->connector;
+	connector = &arcpgu->sim_conn;
 	drm_connector_helper_add(connector, &arcpgu_drm_connector_helper_funcs);
 
 	ret = drm_connector_init(drm, connector, &arcpgu_drm_connector_funcs,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
