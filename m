Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F06E31A94CE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12EC6E8D3;
	Wed, 15 Apr 2020 07:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07E589113
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:26 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i10so17863998wrv.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YF7jJSPkbBuyXOdtSAhkgBRsVNG/twSf98zfsqftH+Y=;
 b=kT/RPBFqhQxp8V1tvv3z21ZyN3yqNCxatU7q3DO0afN0XbWVr8UVE77IjTacD664de
 g+DI8DUWxzm8sKGMYhnEF+8KBXZhapRlfyR09trq1RW1llzUr2lYQGQJTxtggOPYP/T/
 z/trtwFkDaogoO/AmVMVNzPOOqc8w+Zpxf5nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YF7jJSPkbBuyXOdtSAhkgBRsVNG/twSf98zfsqftH+Y=;
 b=aHpHJOhF4ayrDIuwbAcRrcztibxJl6g68MkHOjonEE4Uc/pwiR5nB+5FoU6xU3V4WE
 8u38rVCk4mdewwpYfGIe5yIb8kVf9C7B31EaygomUrOQjFdqqRRIgeecyDaXTvMijVwT
 lw+SCQRKKOtUvS6/jQfEHq8y7MhDPcP9UEHmaPzWHc2zm33/pemXk+1p+V/7KYr+ewN9
 lucoASksvMBLx5jne7pDhwimEnI9llY46xgRrLRObwiFVjysvOb519hUk/CQhKI+f8Ca
 CVHypwMqNzxghP/Db5n7NNR6DdAZCeh0y5Xk1pueWjeSXLCKC8IDobhdy41fpMFZVTYy
 O7Cw==
X-Gm-Message-State: AGi0Pua5WzzYvbmZM4vceZGn88yInoFmNxhhkc3eApyU9u3skrFegEFb
 2RQu3kwtcU3yayPYLo3mL3Ahzg==
X-Google-Smtp-Source: APiQypLb95tlY/oUTot+wPETIr6SgQH7du8JdQipcusLh6ZQK5qAcm8rj2+MSGUXVQMNPgkL40XNgw==
X-Received: by 2002:adf:fe03:: with SMTP id n3mr26846405wrr.315.1586936485469; 
 Wed, 15 Apr 2020 00:41:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:24 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 43/59] drm/arc: Embedd a drm_connector for sim case
Date: Wed, 15 Apr 2020 09:40:18 +0200
Message-Id: <20200415074034.175360-44-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
