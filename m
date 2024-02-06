Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF8984B040
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 09:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FC4112427;
	Tue,  6 Feb 2024 08:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EdpKSXY5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEBC112942
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 05:21:58 +0000 (UTC)
Received: from umang.jain (unknown [103.251.226.97])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A157975;
 Tue,  6 Feb 2024 06:20:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707196831;
 bh=9A41tRMvVT0HRkVDL46qeI1eqNXMwP9Vk2At0gdP17A=;
 h=From:To:Cc:Subject:Date:From;
 b=EdpKSXY54c/nF68oGCaOegx1rI3C4z46fUilCKS0NdFnj6/gLQR8vHCOVSl7yDJKO
 243Kswou8Y+ahqb8rgAVe9O7GN5dxYRbZeCp2+AUSlPfy3/m6gxunRFKZx7fjFzuU/
 E//MjvyYMPac1l9KkpyCM6tsamcFqpQ93E57HOF8=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] drm/imx: Replace of_device.h with explicit includes
Date: Tue,  6 Feb 2024 10:51:46 +0530
Message-ID: <20240206052146.69779-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 06 Feb 2024 08:46:32 +0000
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h.

of_device.h isn't needed, but of.h is for of_node_put().

This fixes the following build errors:
error: implicit declaration of function ‘platform_set_drvdata’ [-Werror=implicit-function-declaration]
error: implicit declaration of function ‘of_node_put’ [-Werror=implicit-function-declaration]

Fixes: 3075f087680b ("drm/imx: add driver for HDMI TX Parallel Video Interface")
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 962779dc539e..8a51a2ac8df1 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -8,9 +8,10 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
+#include <linux/platform_device.h>
 
 #define HTX_PVI_CTL	0x0
 #define  PVI_CTL_OP_VSYNC_POL	BIT(18)
-- 
2.41.0

