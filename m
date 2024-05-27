Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FA18D01A4
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 15:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC1610E0D6;
	Mon, 27 May 2024 13:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7317510E0D6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 13:35:52 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by riemann.telenet-ops.be (Postfix) with ESMTPS id 4VnxVb0BP8z4x1gq
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:35:51 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c993:5573:f894:7353])
 by andre.telenet-ops.be with bizsmtp
 id UDbq2C00T2nC7mg01DbqjB; Mon, 27 May 2024 15:35:50 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sBaV2-00CmUx-Oo;
 Mon, 27 May 2024 15:35:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sBaVy-003xeh-G3;
 Mon, 27 May 2024 15:35:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: renesas: rcar-du: Add drm_panic support for non-vsp
Date: Mon, 27 May 2024 15:35:49 +0200
Message-Id: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

Add support for the drm_panic module for DU variants not using the
VSP-compositor, to display a message on the screen when a kernel panic
occurs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on Koelsch (R-Car M2-W).

Support for DU variants using the VSP-compositor is more convoluted,
and left to the DU experts.
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
index e445fac8e0b46c21..c546ab0805d656f6 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
@@ -680,6 +680,12 @@ static const struct drm_plane_helper_funcs rcar_du_plane_helper_funcs = {
 	.atomic_update = rcar_du_plane_atomic_update,
 };
 
+static const struct drm_plane_helper_funcs rcar_du_primary_plane_helper_funcs = {
+	.atomic_check = rcar_du_plane_atomic_check,
+	.atomic_update = rcar_du_plane_atomic_update,
+	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
+};
+
 static struct drm_plane_state *
 rcar_du_plane_atomic_duplicate_state(struct drm_plane *plane)
 {
@@ -812,8 +818,12 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
 		if (ret < 0)
 			return ret;
 
-		drm_plane_helper_add(&plane->plane,
-				     &rcar_du_plane_helper_funcs);
+		if (type == DRM_PLANE_TYPE_PRIMARY)
+			drm_plane_helper_add(&plane->plane,
+					     &rcar_du_primary_plane_helper_funcs);
+		else
+			drm_plane_helper_add(&plane->plane,
+					     &rcar_du_plane_helper_funcs);
 
 		drm_plane_create_alpha_property(&plane->plane);
 
-- 
2.34.1

