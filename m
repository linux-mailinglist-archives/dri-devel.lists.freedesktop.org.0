Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03224BDB20
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 18:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C16C10E46E;
	Mon, 21 Feb 2022 17:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043AF10E6FB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 17:13:57 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14DD2993;
 Mon, 21 Feb 2022 18:13:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645463635;
 bh=TilVVpq2XojcrwNSeLxSeORLbVKOAAbOi/O8iL25oPA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gy90b3Qc27Khyu0scuwi535HfD7cmP0f5VJwLy9vND70hrJZ1oPEDWoUAs6JCTD+o
 urOmAJqKFzvcHfZQbclVI6WFWwgrS1EZeej1hGjrk5kd4aEFPuAPjw0aUYL/pX7rjw
 YkUk8goF1Jr+Rg0aJb5OOo4RNASKUXoESmB9Zpsw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: rcar-du: Don't restart group when enabling plane on
 Gen3
Date: Mon, 21 Feb 2022 19:13:40 +0200
Message-Id: <20220221171340.11113-3-laurent.pinchart+renesas@ideasonboard.com>
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

On Gen3 hardware enabling a VSP plane doesn't change any register that
requires DRES to take effect. Avoid a group restart in that case.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 9 ---------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 9b058d6cb032..22aeeb1cc1fb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -560,6 +560,12 @@ void __rcar_du_plane_setup(struct rcar_du_group *rgrp,
 		if (rcdu->vspd1_sink != vspd1_sink) {
 			rcdu->vspd1_sink = vspd1_sink;
 			rcar_du_set_dpad0_vsp1_routing(rcdu);
+
+			/*
+			 * Changes to the VSP1 sink take effect on DRES and thus
+			 * need a restart of the group.
+			 */
+			rgrp->need_restart = true;
 		}
 	}
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index b7fc5b069cbc..32530d698e75 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -84,15 +84,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 
 	__rcar_du_plane_setup(crtc->group, &state);
 
-	/*
-	 * Ensure that the plane source configuration takes effect by requesting
-	 * a restart of the group. See rcar_du_plane_atomic_update() for a more
-	 * detailed explanation.
-	 *
-	 * TODO: Check whether this is still needed on Gen3.
-	 */
-	crtc->group->need_restart = true;
-
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
-- 
Regards,

Laurent Pinchart

