Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9AC2F2A34
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7126E135;
	Tue, 12 Jan 2021 08:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD7D6E138
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:44:11 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id c124so1128747wma.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hwt4AB2JWY86IunM0AWLSvbyBuewQfXW6vEAYIE1lOA=;
 b=EFZrltydiKz5xO2UgLrKHuA54SsRrXfh7aFAGWa5K3wNaJ67eo2YZctUebnTqxniBv
 5gsGQRqNhjT7WJxoe2bV8LJVf2J8xTZ165gG6huV1zYOIPs2aT1GtkqEmtS58rbA84rr
 9z7d35tl7Nrj2HVRLsJ/vaZCI3YDkoVuB48Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hwt4AB2JWY86IunM0AWLSvbyBuewQfXW6vEAYIE1lOA=;
 b=bzZa5cGdxZ90K9JHeqIAuJluUBVBxUYzakGdOnv8kKlWRYQ3vYcdeiKz2wHKauWILY
 V9GEEtDLcp+mW0kWCsv+lp5Sqw8/C5Rg4Zh0h4JbOSUPOU1wQaEgUG52fJbeeu+oCSEQ
 h+q20btJUM41wxN7Hy9nbQsomCeWeHvKBwaRr+4CthCnR3bzBwov9mjcenZdzO+BUsNQ
 NPtUtrmA+f1pADwRwyJfnqznZ+BFxBJDIQfACwIj5wkt8waMMrUBi4XIApD9tdsTRkbs
 x3924SWfgfznzciC1AyruQ5Kdgn8DwvjTypGxGxrb6ujo/cpNGbLl+Oi+RJUoqUjyWm3
 gYTw==
X-Gm-Message-State: AOAM533yQe4Zj43CxWaUoEP2X0UJLz6Y17PIg2OoY6KGvLea02aMP2Ur
 04xg7vh7ysSzRHm0GCod93QEWCfrxoX9MjMn
X-Google-Smtp-Source: ABdhPJxlnFFcuesC+lscDeZm7ujL6/Tg9pqnI2Z5lMP5/elBPeJ8+mtyVk4KCS3edw9G0Rr1TzGwoQ==
X-Received: by 2002:a7b:c10e:: with SMTP id w14mr2419107wmi.161.1610441050156; 
 Tue, 12 Jan 2021 00:44:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm3707017wrr.85.2021.01.12.00.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:44:09 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/15] drm/arc: Embedd a drm_connector for sim case
Date: Tue, 12 Jan 2021 09:43:48 +0100
Message-Id: <20210112084358.2771527-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, tiantao6@hisilicon.com,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removes the last devm_kzalloc, which means we're now prepared to use
drmm_mode_config_cleanup!

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
