Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F9290D930
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 18:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EBD10E6CA;
	Tue, 18 Jun 2024 16:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 357 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jun 2024 16:26:18 UTC
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB63A10E6CA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:26:18 +0000 (UTC)
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id A4EC720787;
 Tue, 18 Jun 2024 18:20:18 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id 9408D201FD;
 Tue, 18 Jun 2024 18:20:18 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Date: Tue, 18 Jun 2024 18:19:59 +0200
Subject: [PATCH] drm: bridge: simple-bridge: use devm_drm_bridge_add in probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-devm-simple-bridge-v1-1-c7ed8a09fcc5@freebox.fr>
X-B4-Tracking: v=1; b=H4sIAK6zcWYC/x2MQQqAIBQFryJ/nZAWUl0lWpQ+60OZKEQQ3T1pO
 TAzD2UkRqZBPJRwceYzFFCVILvNYYVkV5h0rdvaqE46XIfMfMQdcknsitFDmcbDQvWaShgTPN/
 /dJze9wNCC2PrZAAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0
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

simple_bridge_probe() calls drm_bridge_add()
Thus, drm_bridge_remove() must be called in the remove() callback.

If we call devm_drm_bridge_add() instead, then drm_bridge_remove()
will be called automatically at device release, and the remove()
callback is no longer required.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
This patch was proposed in an abandoned patch series,
but it makes sense by itself. Submit now.
https://lore.kernel.org/r/20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr
---
 drivers/gpu/drm/bridge/simple-bridge.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 5813a2c4fc5ee..dbe58f5707f08 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -175,7 +175,6 @@ static int simple_bridge_probe(struct platform_device *pdev)
 	sbridge = devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL);
 	if (!sbridge)
 		return -ENOMEM;
-	platform_set_drvdata(pdev, sbridge);
 
 	sbridge->info = of_device_get_match_data(&pdev->dev);
 
@@ -213,16 +212,7 @@ static int simple_bridge_probe(struct platform_device *pdev)
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
-	drm_bridge_add(&sbridge->bridge);
-
-	return 0;
-}
-
-static void simple_bridge_remove(struct platform_device *pdev)
-{
-	struct simple_bridge *sbridge = platform_get_drvdata(pdev);
-
-	drm_bridge_remove(&sbridge->bridge);
+	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
 }
 
 /*
@@ -299,7 +289,6 @@ MODULE_DEVICE_TABLE(of, simple_bridge_match);
 
 static struct platform_driver simple_bridge_driver = {
 	.probe	= simple_bridge_probe,
-	.remove_new = simple_bridge_remove,
 	.driver		= {
 		.name		= "simple-bridge",
 		.of_match_table	= simple_bridge_match,

---
base-commit: 17b591a4a192a8a11faad30520b8f6a9137ac514
change-id: 20240618-devm-simple-bridge-9e163fece192

Best regards,
-- 
Marc Gonzalez <mgonzalez@freebox.fr>

