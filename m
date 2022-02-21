Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BED4C4BDB1F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 18:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464A010E719;
	Mon, 21 Feb 2022 17:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2348A10E6FB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 17:13:56 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 250DA484;
 Mon, 21 Feb 2022 18:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645463634;
 bh=8uVdwcIdzkcXbXDLonFcwLYb96Gj/nV6lHspa8jiTxI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XuVWxbvbcIfa2+2Qtx+L2i5a+9rl92iPtPdcN+tbQcEpaS5qNPT2TtjiHBkmdnp/Q
 qL0bLe3VW2P04th+boCV69euNJRf7AVn/qWBAdDvcOMxYOOQQxF/LitOdin5J5IdlN
 OA+hb7lvHWgGQYMIL182rwDzQiYz7D4E+wj7et3A=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: rcar-du: Don't select VSP1 sink on Gen3
Date: Mon, 21 Feb 2022 19:13:39 +0200
Message-Id: <20220221171340.11113-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220221171340.11113-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220221171340.11113-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: efriedrich@de.adit-jv.com, michael@rodin.online,
 Michael Rodin <mrodin@de.adit-jv.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 erosca@de.adit-jv.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VSP1 sink selection through register DEFR8 is only available on Gen2
hardware. Skip it on Gen3.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 862197be1e01..9b058d6cb032 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -549,8 +549,10 @@ void __rcar_du_plane_setup(struct rcar_du_group *rgrp,
 		rcar_du_plane_setup_format(rgrp, (state->hwindex + 1) % 8,
 					   state);
 
-	if (rcdu->info->gen < 3)
-		rcar_du_plane_setup_scanout(rgrp, state);
+	if (rcdu->info->gen >= 3)
+		return;
+
+	rcar_du_plane_setup_scanout(rgrp, state);
 
 	if (state->source == RCAR_DU_PLANE_VSPD1) {
 		unsigned int vspd1_sink = rgrp->index ? 2 : 0;
-- 
Regards,

Laurent Pinchart

