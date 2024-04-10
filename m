Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC4A8A01CF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 23:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A34E892D3;
	Wed, 10 Apr 2024 21:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lu2CMGfL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B8310E832
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 20:45:53 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d485886545so125798271fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712781951; x=1713386751; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qsGqX3KEMe0tMFWNo37D5kyKHEthzUhLzdIDt7eGccA=;
 b=lu2CMGfLvoinUFP53Ux6XMVTCzSpmqOF3kj5Kn0ADTLdmn2NZ30aRPhB4xw9vKwOsG
 hXqnD9b2wVQGty2OJdPHAUMquDJUtk61KxsxmlOyl9hgXj5gb+WNfuUYqaX5alozjhKA
 lN8MxFzWTj47Y99mCpEMXTH1GaLwqxX4EXOzS0pJzIW6W9cRjQ4jMmEsrchJGPFSFyrh
 WOLJx4TlOxUvDYX+23pUVzf71TPDKJehnTE/3dFMtaDYtHBZpgUYxRoEnqljvDHCj7uh
 bAQeMRtvb88m4bIWtKdvMFr7iQXnducS69ZGn7H5D190ByyNklOpic1FAtX4d60+UskT
 gjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712781951; x=1713386751;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qsGqX3KEMe0tMFWNo37D5kyKHEthzUhLzdIDt7eGccA=;
 b=F6L1JkxiLokxpKIFmc3Rnh8nOcOvPAjkmNLQQGV0d4kE0bhxkxxJHFEDERMEtQUBvT
 dF9KH/B58tOEiuvPtjjQxQyz8Wjqz0CQB2y9nUWpXps0VYKapCP+kMOKlHfup6Bi6rmb
 74LETAcvzV3JBTA9AC73rIg2GJBWGndlJA0My/qKJKIk+H8su7qoM57gM70pk+Hp/FRV
 IYGtGDFrBtYSiuk6e7+q3Ynm8gWPn4iI5UNT0DXHpr59BVR2sDHt/RBOt8mh1Gdd6mzR
 bOGCLUTiY0KRP21MfdCOph2jXcP5FnzfmzTz68amw1c5qncbTqT+5gmaXM6pFGAp6D8X
 PNKg==
X-Gm-Message-State: AOJu0YwoVP9+0zjQNrIBAlSkUsJyUrGc04JoOfWRSTuHfLoHVm5nP6ja
 +tLEL01amoangZvjC1XWdT9wxaHya7PiN5Z/YNGe/ce0jQj4Ip7w
X-Google-Smtp-Source: AGHT+IH3QYbCsvLH7JDF0/52kyHq3vwRp8DboQ3O3yhv+yJaWJs1M0Qq+jeH4ZaKHY74WkJWalcKnw==
X-Received: by 2002:a2e:9645:0:b0:2d8:8fb6:a53d with SMTP id
 z5-20020a2e9645000000b002d88fb6a53dmr3057039ljh.42.1712781951058; 
 Wed, 10 Apr 2024 13:45:51 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-64.cable.dynamic.surfer.at.
 [84.115.213.64]) by smtp.gmail.com with ESMTPSA id
 jo12-20020a170906f6cc00b00a51e004de4asm43200ejb.11.2024.04.10.13.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 13:45:50 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 10 Apr 2024 22:45:43 +0200
Subject: [PATCH] drm/kmb: Replace of_node_put() with automatic cleanup handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-kmb_of_node_put-v1-1-4d802add6a89@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHb6FmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDE0MD3ezcpPj8tPi8/JTU+ILSEt3ExDTDZHPzFEszQwMloK6CotS0zAq
 widGxtbUATO4l52EAAAA=
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Julia Lawall <julia.lawall@inria.fr>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712781949; l=3721;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=bMzjQWQMtB75ExL7Mufx5SJbm3fyIcSyleJcxUjqv6A=;
 b=4x42bRafiDixZIvr/1GV+80+RHyrDLGKz29TWe8GX6b0FFhb0v8RSSPpd7pYQWtKbR4sh1t58
 +Olbpp/kpnqBnbdraSQpOzSQURkqny+9MH7QKG9qU0kRfSUtrmPgrzJ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Wed, 10 Apr 2024 21:13:19 +0000
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

Make use of the __free() cleanup handler to automatically free nodes
when they get out of scope.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
The patch is based on the latest linux-next tag (next-20240410).
---
 drivers/gpu/drm/kmb/kmb_drv.c | 13 ++++---------
 drivers/gpu/drm/kmb/kmb_dsi.c | 11 ++++-------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 169b83987ce2..1a743840688a 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -480,8 +480,8 @@ static int kmb_probe(struct platform_device *pdev)
 	struct device *dev = get_device(&pdev->dev);
 	struct kmb_drm_private *kmb;
 	int ret = 0;
-	struct device_node *dsi_in;
-	struct device_node *dsi_node;
+	struct device_node *dsi_in __free(device_node) =
+		of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
 	struct platform_device *dsi_pdev;
 
 	/* The bridge (ADV 7535) will return -EPROBE_DEFER until it
@@ -491,28 +491,23 @@ static int kmb_probe(struct platform_device *pdev)
 	 *  and then the rest of the driver initialization can proceed
 	 *  afterwards and the bridge can be successfully attached.
 	 */
-	dsi_in = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
 	if (!dsi_in) {
 		DRM_ERROR("Failed to get dsi_in node info from DT");
 		return -EINVAL;
 	}
-	dsi_node = of_graph_get_remote_port_parent(dsi_in);
+	struct device_node *dsi_node __free(device_node) =
+		of_graph_get_remote_port_parent(dsi_in);
 	if (!dsi_node) {
-		of_node_put(dsi_in);
 		DRM_ERROR("Failed to get dsi node from DT\n");
 		return -EINVAL;
 	}
 
 	dsi_pdev = of_find_device_by_node(dsi_node);
 	if (!dsi_pdev) {
-		of_node_put(dsi_in);
-		of_node_put(dsi_node);
 		DRM_ERROR("Failed to get dsi platform device\n");
 		return -EINVAL;
 	}
 
-	of_node_put(dsi_in);
-	of_node_put(dsi_node);
 	ret = kmb_dsi_host_bridge_init(get_device(&dsi_pdev->dev));
 
 	if (ret == -EPROBE_DEFER) {
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index cf7cf0b07541..61f02462b778 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -216,8 +216,6 @@ static const struct mipi_dsi_host_ops kmb_dsi_host_ops = {
 
 int kmb_dsi_host_bridge_init(struct device *dev)
 {
-	struct device_node *encoder_node, *dsi_out;
-
 	/* Create and register MIPI DSI host */
 	if (!dsi_host) {
 		dsi_host = kzalloc(sizeof(*dsi_host), GFP_KERNEL);
@@ -239,21 +237,20 @@ int kmb_dsi_host_bridge_init(struct device *dev)
 	}
 
 	/* Find ADV7535 node and initialize it */
-	dsi_out = of_graph_get_endpoint_by_regs(dev->of_node, 0, 1);
+	struct device_node *dsi_out __free(device_node) =
+		of_graph_get_endpoint_by_regs(dev->of_node, 0, 1);
 	if (!dsi_out) {
 		DRM_ERROR("Failed to get dsi_out node info from DT\n");
 		return -EINVAL;
 	}
-	encoder_node = of_graph_get_remote_port_parent(dsi_out);
+	struct device_node *encoder_node __free(device_node) =
+		of_graph_get_remote_port_parent(dsi_out);
 	if (!encoder_node) {
-		of_node_put(dsi_out);
 		DRM_ERROR("Failed to get bridge info from DT\n");
 		return -EINVAL;
 	}
 	/* Locate drm bridge from the hdmi encoder DT node */
 	adv_bridge = of_drm_find_bridge(encoder_node);
-	of_node_put(dsi_out);
-	of_node_put(encoder_node);
 	if (!adv_bridge) {
 		DRM_DEBUG("Wait for external bridge driver DT\n");
 		return -EPROBE_DEFER;

---
base-commit: 6ebf211bb11dfc004a2ff73a9de5386fa309c430
change-id: 20240410-kmb_of_node_put-aaf1c77d9610

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

