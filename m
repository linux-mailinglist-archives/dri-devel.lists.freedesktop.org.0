Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBED415427
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 01:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CD66E088;
	Wed, 22 Sep 2021 23:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7376E086
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 23:47:34 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1913E18BE;
 Thu, 23 Sep 2021 01:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632354453;
 bh=Fzy27IdoPwcukHiyhCLxoNPiCMd2sik0YLrO2Kg2TsA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GrmZuIgb3ZVPe8ofakqd/Q2Hd0soWEOf5Up9rEjBdPyys7EIWqj02wD8uAzc5g1Z5
 xZ8YYopiN9Qy8RzQIYJHrk7NpYnywIyH4GJdoafO0rLk0fK6thFX1GedYr8+A6vXKO
 pbz3b2YtQL+ADRRbv0IxjvFUf78fHcslgQ+0WgVc=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 5/6] drm: rcar-du: Split CRTC IRQ and Clock features
Date: Thu, 23 Sep 2021 00:47:25 +0100
Message-Id: <20210922234726.3337265-6-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922234726.3337265-1-kieran.bingham@ideasonboard.com>
References: <20210922234726.3337265-1-kieran.bingham@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not all platforms require both per-crtc IRQ and per-crtc clock
management. In preparation for suppporting such platforms, split the
feature macro to be able to specify both features independently.

The other features are incremented accordingly, to keep the two crtc
features adjacent.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---
v2:
 - New patch

v3:
 - Collect tag

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c |  4 +--
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 48 +++++++++++++++++---------
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  9 ++---
 3 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index a0f837e8243a..5672830ca184 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -1206,7 +1206,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 	int ret;
 
 	/* Get the CRTC clock and the optional external clock. */
-	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CRTC_IRQ_CLOCK)) {
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CRTC_CLOCK)) {
 		sprintf(clk_name, "du.%u", hwindex);
 		name = clk_name;
 	} else {
@@ -1272,7 +1272,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
 
 	/* Register the interrupt handler. */
-	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CRTC_IRQ_CLOCK)) {
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CRTC_IRQ)) {
 		/* The IRQ's are associated with the CRTC (sw)index. */
 		irq = platform_get_irq(pdev, swindex);
 		irqflags = 0;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 4ac26d08ebb4..8a094d5b9c77 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -36,7 +36,8 @@
 
 static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 	.gen = 2,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
 	.channels_mask = BIT(1) | BIT(0),
@@ -58,7 +59,8 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 
 static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 	.gen = 2,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
 	.channels_mask = BIT(1) | BIT(0),
@@ -79,7 +81,8 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 
 static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
 	.gen = 2,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
 	.channels_mask = BIT(1) | BIT(0),
@@ -105,7 +108,8 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
 
 static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
 	.gen = 3,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
@@ -134,7 +138,8 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
 
 static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
 	.gen = 3,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
@@ -163,7 +168,8 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
 
 static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
 	.gen = 3,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
@@ -189,7 +195,8 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
 
 static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
 	.gen = 3,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
@@ -239,7 +246,8 @@ static const struct rcar_du_device_info rcar_du_r8a7779_info = {
 
 static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 	.gen = 2,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
 	.quirks = RCAR_DU_QUIRK_ALIGN_128B,
@@ -269,7 +277,8 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 /* M2-W (r8a7791) and M2-N (r8a7793) are identical */
 static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 	.gen = 2,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
 	.channels_mask = BIT(1) | BIT(0),
@@ -292,7 +301,8 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 
 static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 	.gen = 2,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
 	.channels_mask = BIT(1) | BIT(0),
@@ -311,7 +321,8 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 
 static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 	.gen = 2,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
 	.channels_mask = BIT(1) | BIT(0),
@@ -333,7 +344,8 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 
 static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	.gen = 3,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
@@ -366,7 +378,8 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 
 static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 	.gen = 3,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
@@ -395,7 +408,8 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 
 static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 	.gen = 3,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
@@ -424,7 +438,8 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 
 static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 	.gen = 3,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC,
@@ -448,7 +463,8 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 
 static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 	.gen = 3,
-	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 02ca2d0e1b55..5fe9152454ff 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -26,10 +26,11 @@ struct drm_bridge;
 struct drm_property;
 struct rcar_du_device;
 
-#define RCAR_DU_FEATURE_CRTC_IRQ_CLOCK	BIT(0)	/* Per-CRTC IRQ and clock */
-#define RCAR_DU_FEATURE_VSP1_SOURCE	BIT(1)	/* Has inputs from VSP1 */
-#define RCAR_DU_FEATURE_INTERLACED	BIT(2)	/* HW supports interlaced */
-#define RCAR_DU_FEATURE_TVM_SYNC	BIT(3)	/* Has TV switch/sync modes */
+#define RCAR_DU_FEATURE_CRTC_IRQ	BIT(0)	/* Per-CRTC IRQ */
+#define RCAR_DU_FEATURE_CRTC_CLOCK	BIT(1)	/* Per-CRTC clock */
+#define RCAR_DU_FEATURE_VSP1_SOURCE	BIT(2)	/* Has inputs from VSP1 */
+#define RCAR_DU_FEATURE_INTERLACED	BIT(3)	/* HW supports interlaced */
+#define RCAR_DU_FEATURE_TVM_SYNC	BIT(4)	/* Has TV switch/sync modes */
 
 #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
 
-- 
2.30.2

