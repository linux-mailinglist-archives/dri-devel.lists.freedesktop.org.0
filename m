Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1617AAA67
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 09:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C707110E629;
	Fri, 22 Sep 2023 07:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691BD10E62A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 07:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=5/L2thHtWZKVXF
 Yu87PpUqSLgjaKxLn7tKqu43zTTQ0=; b=ESd9dfqP1Gin/0Vqzn+Uvd3nrACKlb
 ooXTPhCJvWIWEHbm5olbEsNLmsBbTAMZiI0/yT252y5quyHLPmxD50iCMUB4ue8h
 iApsVdS1I95nrzeiOyB/8VlDlv8mv3UuzzzN95bo8d1st2RNGaz3CjvGz5HhCrgq
 NhfC9HpXqQUBaEpU1Z3Sr+BK07s3wtNBlw6AxD25ePFXcESxrGUsSdFB876nB101
 pIuPkID6FQiwV7L5YaGgBKq40NgdxOXPSEbZb6aeJaxA+ByNljPLwBNUyEvyJf1d
 uz2OaEqkmci+q02W+okDyj4ysMKta21FP2dTE0XnG6dtEe6AqJ6yBmmA==
Received: (qmail 1299584 invoked from network); 22 Sep 2023 09:37:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 22 Sep 2023 09:37:23 +0200
X-UD-Smtp-Session: l3s3148p1@ENbBre0F5NgujntX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: tilcdc: don't use devm_pinctrl_get_select_default() in
 probe
Date: Fri, 22 Sep 2023 09:37:13 +0200
Message-Id: <20230922073714.6164-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Jyri Sarha <jyri.sarha@iki.fi>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit ab78029ecc34 ("drivers/pinctrl: grab default handles from
device core"), we can rely on device core for setting the default pins.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_panel.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 9aefd010acde..68093d6b6b16 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -6,7 +6,6 @@
 
 #include <linux/backlight.h>
 #include <linux/gpio/consumer.h>
-#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 
 #include <video/display_timing.h>
@@ -308,7 +307,6 @@ static int panel_probe(struct platform_device *pdev)
 	struct backlight_device *backlight;
 	struct panel_module *panel_mod;
 	struct tilcdc_module *mod;
-	struct pinctrl *pinctrl;
 	int ret;
 
 	/* bail out early if no DT data: */
@@ -342,10 +340,6 @@ static int panel_probe(struct platform_device *pdev)
 
 	tilcdc_module_init(mod, "panel", &panel_module_ops);
 
-	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
-	if (IS_ERR(pinctrl))
-		dev_warn(&pdev->dev, "pins are not configured\n");
-
 	panel_mod->timings = of_get_display_timings(node);
 	if (!panel_mod->timings) {
 		dev_err(&pdev->dev, "could not get panel timings\n");
-- 
2.30.2

