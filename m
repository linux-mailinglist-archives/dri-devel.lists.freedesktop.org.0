Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFDF48CA31
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 18:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807C910E72E;
	Wed, 12 Jan 2022 17:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED7C110E72E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 17:46:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; d="scan'208";a="106270377"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4A2C04005E1F;
 Thu, 13 Jan 2022 02:46:49 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC 13/28] drm: rcar-du: Add RCAR_DU_FEATURE_PLANE feature bit
Date: Wed, 12 Jan 2022 17:45:57 +0000
Message-Id: <20220112174612.10773-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DU plane registers are available on R-Car, but it is not present
on RZ/G2L. Add RCAR_DU_FEATURE_PLANE feature bit to support
later SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 51 ++++++++++++++++++---------
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  1 +
 2 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 7a492323afb3..2c1454731df4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -40,7 +40,8 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -66,7 +67,8 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -91,7 +93,8 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -122,7 +125,8 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(2) | BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -155,7 +159,8 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(3) | BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -186,7 +191,8 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
 	.gen = 3,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
-		  | RCAR_DU_FEATURE_VSP1_SOURCE,
+		  | RCAR_DU_FEATURE_VSP1_SOURCE
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -218,7 +224,8 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(3) | BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -273,7 +280,8 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.quirks = RCAR_DU_QUIRK_ALIGN_128B,
 	.channels_mask = BIT(2) | BIT(1) | BIT(0),
 	.routes = {
@@ -307,7 +315,8 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -334,7 +343,8 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/* R8A7792 has two RGB outputs. */
@@ -357,7 +367,8 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -384,7 +395,8 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -421,7 +433,8 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(2) | BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -454,7 +467,8 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(3) | BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -487,7 +501,8 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(0),
 	.routes = {
 		/*
@@ -513,7 +528,8 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 	.gen = 3,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
-		  | RCAR_DU_FEATURE_VSP1_SOURCE,
+		  | RCAR_DU_FEATURE_VSP1_SOURCE
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/*
@@ -543,7 +559,8 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
 	.gen = 3,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
-		  | RCAR_DU_FEATURE_VSP1_SOURCE,
+		  | RCAR_DU_FEATURE_VSP1_SOURCE
+		  | RCAR_DU_FEATURE_PLANE,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
 		/* R8A779A0 has two MIPI DSI outputs. */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 2f0ccc9e67d1..020814e80f50 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -31,6 +31,7 @@ struct rcar_du_device;
 #define RCAR_DU_FEATURE_VSP1_SOURCE	BIT(2)	/* Has inputs from VSP1 */
 #define RCAR_DU_FEATURE_INTERLACED	BIT(3)	/* HW supports interlaced */
 #define RCAR_DU_FEATURE_TVM_SYNC	BIT(4)	/* Has TV switch/sync modes */
+#define RCAR_DU_FEATURE_PLANE		BIT(5)	/* HW supports DU planes */
 
 #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
 
-- 
2.17.1

