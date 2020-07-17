Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15402237A7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07ED06ED70;
	Fri, 17 Jul 2020 09:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71B96ED6A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c80so13896522wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xkOaolMH5Qi3O60vwtcPWTDOfZCMHTuou9vC5C8u3bI=;
 b=ZIr2fwQylnZ1p+YQ+YFCS4/mwUSiEIq56wgN7xlqD7QSlYX6SPfmkvCw+bKU8ztB69
 6+xWPLXiz/Qcxi/egAR6uezDteNv4Vs60Rou2sc7fqPZdvqCyO9CY6zXkhXizmmyet5/
 kBpjuZGOX7K5XvfmsYoGeZDuzmyXPdqGdFT5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xkOaolMH5Qi3O60vwtcPWTDOfZCMHTuou9vC5C8u3bI=;
 b=dRQlIz4UDbeWEyDTjd0xTgk1pEoorSgnjq84lJDonLPPIy7vnG4T4FDo36sbgyJ7FB
 B16tN/oFSMB3LJlh9Y5Ga9Qmc0Iy7d/ss6y4f0JlRxPaCuCY97Jjf87/s0ezPl12A6Rx
 GZe8W7k6lovWU3mJJzFmRBsiQmPTzZyZuUa+B6MrRBLcdX7hJuZA5GWq7mmYFNK+nlIL
 gpfh6fvOzjdsvX15p/22FWQcMoK2p6/yjgzJhhJm+UK3RHNi0DDvq0lrxzaJ5F2diUHd
 wztE+mfx/Zq5m6olyKOnjKH7J6XXntZHBcAv4zqR3oiY56E2KjwfTEwEdfui84hPoRN1
 +RBA==
X-Gm-Message-State: AOAM530+IC7nqkMTG7dG8vzpRQtiIs/B1aNsjHSkX9SzAhHcfar67zfT
 QxkXuKkRjde9ooblr/pL/qlJtWp6qqQ=
X-Google-Smtp-Source: ABdhPJyLNIvlvp+c/92PIVYY+vkrwayTyczswSCcqQZlvFWS8fbucNBXiHPTUgJKdjTpiYRorW6lIQ==
X-Received: by 2002:a1c:7fd7:: with SMTP id a206mr8282351wmd.104.1594976681124; 
 Fri, 17 Jul 2020 02:04:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/18] drm/arc: Embedded a drm_simple_display_pipe
Date: Fri, 17 Jul 2020 11:04:18 +0200
Message-Id: <20200717090430.1146256-6-daniel.vetter@ffwll.ch>
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

This is a prep step to convert arc over to the simple kms helpers, for
now we just use this as an embedding container to drop all the various
allocations. Big change is the removal of the various devm_kzalloc,
which have the wrong lifetimes anyway.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu.h      | 7 ++++---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 9 +++------
 drivers/gpu/drm/arc/arcpgu_drv.c  | 2 +-
 drivers/gpu/drm/arc/arcpgu_hdmi.c | 5 ++---
 drivers/gpu/drm/arc/arcpgu_sim.c  | 5 ++---
 5 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
index ed77dd5dd5cb..52afd638a4d2 100644
--- a/drivers/gpu/drm/arc/arcpgu.h
+++ b/drivers/gpu/drm/arc/arcpgu.h
@@ -8,17 +8,18 @@
 #ifndef _ARCPGU_H_
 #define _ARCPGU_H_
 
+#include <drm/drm_simple_kms_helper.h>
+
 struct arcpgu_drm_private {
 	struct drm_device	drm;
 	void __iomem		*regs;
 	struct clk		*clk;
-	struct drm_crtc		crtc;
-	struct drm_plane	*plane;
+	struct drm_simple_display_pipe pipe;
 };
 
 #define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
 
-#define crtc_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, crtc)
+#define crtc_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, pipe.crtc)
 
 static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
 				 unsigned int reg, u32 value)
diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index ba796a216244..88ba2e284fc0 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -182,9 +182,7 @@ static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
 	struct drm_plane *plane = NULL;
 	int ret;
 
-	plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
-	if (!plane)
-		return ERR_PTR(-ENOMEM);
+	plane = &arcpgu->pipe.plane;
 
 	ret = drm_universal_plane_init(drm, plane, 0xff, &arc_pgu_plane_funcs,
 				       arc_pgu_supported_formats,
@@ -195,7 +193,6 @@ static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
 		return ERR_PTR(ret);
 
 	drm_plane_helper_add(plane, &arc_pgu_plane_helper_funcs);
-	arcpgu->plane = plane;
 
 	return plane;
 }
@@ -210,13 +207,13 @@ int arc_pgu_setup_crtc(struct drm_device *drm)
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
-	ret = drm_crtc_init_with_planes(drm, &arcpgu->crtc, primary, NULL,
+	ret = drm_crtc_init_with_planes(drm, &arcpgu->pipe.crtc, primary, NULL,
 					&arc_pgu_crtc_funcs, NULL);
 	if (ret) {
 		arc_pgu_plane_destroy(primary);
 		return ret;
 	}
 
-	drm_crtc_helper_add(&arcpgu->crtc, &arc_pgu_crtc_helper_funcs);
+	drm_crtc_helper_add(&arcpgu->pipe.crtc, &arc_pgu_crtc_helper_funcs);
 	return 0;
 }
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index c6a8deb56b0f..9020352816fa 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -120,7 +120,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 	struct drm_device *drm = node->minor->dev;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
-	unsigned long mode_clock = arcpgu->crtc.mode.crtc_clock * 1000;
+	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
 
 	seq_printf(m, "hw  : %lu\n", clkrate);
 	seq_printf(m, "mode: %lu\n", mode_clock);
diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
index 52839934f2fb..dbad2c9237fe 100644
--- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
+++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
@@ -18,14 +18,13 @@ static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
 
 int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
 {
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	struct drm_encoder *encoder;
 	struct drm_bridge *bridge;
 
 	int ret = 0;
 
-	encoder = devm_kzalloc(drm->dev, sizeof(*encoder), GFP_KERNEL);
-	if (encoder == NULL)
-		return -ENOMEM;
+	encoder = &arcpgu->pipe.encoder;
 
 	/* Locate drm bridge from the hdmi encoder DT node */
 	bridge = of_drm_find_bridge(np);
diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
index 37d961668dfe..134afb9fa625 100644
--- a/drivers/gpu/drm/arc/arcpgu_sim.c
+++ b/drivers/gpu/drm/arc/arcpgu_sim.c
@@ -56,14 +56,13 @@ static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
 
 int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
 {
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	struct arcpgu_drm_connector *arcpgu_connector;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	int ret;
 
-	encoder = devm_kzalloc(drm->dev, sizeof(*encoder), GFP_KERNEL);
-	if (encoder == NULL)
-		return -ENOMEM;
+	encoder = &arcpgu->pipe.encoder;
 
 	encoder->possible_crtcs = 1;
 	encoder->possible_clones = 0;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
