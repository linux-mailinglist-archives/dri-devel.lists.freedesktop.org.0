Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD0eISiec2lqxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F75D783B1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC7E10EB40;
	Fri, 23 Jan 2026 16:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bMlJHsMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89B510EB40
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:13:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DCCE71A2A54;
 Fri, 23 Jan 2026 16:13:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B13876070A;
 Fri, 23 Jan 2026 16:13:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6537119A87DD; Fri, 23 Jan 2026 17:13:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769184798; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xKMRSlk+kSO+I85v8aEyssRs5j3tcpi0RUOAjUjTJUw=;
 b=bMlJHsMnz7RYbTDu2KpVjQQfaNWIJglS9isVIQ1ufAWWXSMAQOSoa7izYi2zBncVf8nEcy
 k8IDE4CezWmZs33+bfA5OjoIdtlnabs/t/17JKDlTNdOlTpUdabSj61qN5d8vZpZw1FYLR
 LXuURxPM5YszK9ulF88rKSElJg7nRKlezBV1Btxgfy7+YoE49uS2MqLi3FnqYGUVkFg3yo
 ckI/7K3wFBnEmc9Gz543jt709wSPVzimg9r1aFi73J/lHmkQHWrbewt3WIqjorXBttG198
 X1MItY4u0OR1G7LdGTAu20ySInC7vnNpp64VzEDg8xXJG6/4EVDm0cn5H6Ekgw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 23 Jan 2026 17:12:31 +0100
Subject: [PATCH v5 13/25] drm/tilcdc: Remove the useless module list
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-feature_tilcdc-v5-13-5a44d2aa3f6f@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
In-Reply-To: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:brgl@bgdev.pl,m:tony@atomide.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:msp@baylibre.com,m:praneeth@ti.com,m:luca.ceresoli@bootlin.com,m:louis.chauvet@bootlin.com,m:thomas.petazzoni@bootlin.com,m:miguel.gazquez@bootlin.com,m:herve.codina@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-omap@vger.kernel.org,m:kory.maincent@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,armlinux.org.uk,bgdev.pl,atomide.com,intel.com,linaro.org,kwiboo.se];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.983];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,ti.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1F75D783B1
X-Rspamd-Action: no action

The tilcdc driver previously supported a sub-module system where
external display drivers (panels, encoders) could register themselves
through tilcdc_module_init() and be automatically initialized through
a module list. This infrastructure became unused after the component
framework support and panel driver was removed.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v3:
- Move the removal of module_init/exit in a following patch.
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 29 -----------------------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h | 27 ---------------------------
 2 files changed, 56 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index d0503778b5f6f..20f93240b335c 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -7,7 +7,6 @@
 /* LCDC DRM driver, based on da8xx-fb */
 
 #include <linux/mod_devicetable.h>
-#include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -34,8 +33,6 @@ enum tilcdc_variant {
 	DA850_TILCDC,
 };
 
-static LIST_HEAD(module_list);
-
 static const u32 tilcdc_rev1_formats[] = { DRM_FORMAT_RGB565 };
 
 static const u32 tilcdc_straight_formats[] = { DRM_FORMAT_RGB565,
@@ -50,20 +47,6 @@ static const u32 tilcdc_legacy_formats[] = { DRM_FORMAT_RGB565,
 					     DRM_FORMAT_RGB888,
 					     DRM_FORMAT_XRGB8888 };
 
-void tilcdc_module_init(struct tilcdc_module *mod, const char *name,
-		const struct tilcdc_module_ops *funcs)
-{
-	mod->name = name;
-	mod->funcs = funcs;
-	INIT_LIST_HEAD(&mod->list);
-	list_add(&mod->list, &module_list);
-}
-
-void tilcdc_module_cleanup(struct tilcdc_module *mod)
-{
-	list_del(&mod->list);
-}
-
 static int tilcdc_atomic_check(struct drm_device *dev,
 			       struct drm_atomic_state *state)
 {
@@ -97,12 +80,6 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 static void modeset_init(struct drm_device *dev)
 {
 	struct tilcdc_drm_private *priv = dev->dev_private;
-	struct tilcdc_module *mod;
-
-	list_for_each_entry(mod, &module_list, list) {
-		DBG("loading module: %s", mod->name);
-		mod->funcs->modeset_init(mod, dev);
-	}
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
@@ -465,15 +442,9 @@ static struct drm_info_list tilcdc_debugfs_list[] = {
 
 static void tilcdc_debugfs_init(struct drm_minor *minor)
 {
-	struct tilcdc_module *mod;
-
 	drm_debugfs_create_files(tilcdc_debugfs_list,
 				 ARRAY_SIZE(tilcdc_debugfs_list),
 				 minor->debugfs_root, minor);
-
-	list_for_each_entry(mod, &module_list, list)
-		if (mod->funcs->debugfs_init)
-			mod->funcs->debugfs_init(mod, minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index dafb00908d1d4..60e85e29b1063 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -81,33 +81,6 @@ struct tilcdc_drm_private {
 	bool irq_enabled;
 };
 
-/* Sub-module for display.  Since we don't know at compile time what panels
- * or display adapter(s) might be present (for ex, off chip dvi/tfp410,
- * hdmi encoder, various lcd panels), the connector/encoder(s) are split into
- * separate drivers.  If they are probed and found to be present, they
- * register themselves with tilcdc_register_module().
- */
-struct tilcdc_module;
-
-struct tilcdc_module_ops {
-	/* create appropriate encoders/connectors: */
-	int (*modeset_init)(struct tilcdc_module *mod, struct drm_device *dev);
-#ifdef CONFIG_DEBUG_FS
-	/* create debugfs nodes (can be NULL): */
-	int (*debugfs_init)(struct tilcdc_module *mod, struct drm_minor *minor);
-#endif
-};
-
-struct tilcdc_module {
-	const char *name;
-	struct list_head list;
-	const struct tilcdc_module_ops *funcs;
-};
-
-void tilcdc_module_init(struct tilcdc_module *mod, const char *name,
-		const struct tilcdc_module_ops *funcs);
-void tilcdc_module_cleanup(struct tilcdc_module *mod);
-
 #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
 
 int tilcdc_crtc_create(struct drm_device *dev);

-- 
2.43.0

