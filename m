Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF85458E3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 01:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741E710ECAF;
	Thu,  9 Jun 2022 23:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC4010ECAF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 23:55:41 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C615D6CF;
 Fri, 10 Jun 2022 01:55:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1654818939;
 bh=bUAnnkB0+RRerAUlNojTPxGZcNjmTLfHTFwRZ7umC0E=;
 h=From:To:Cc:Subject:Date:From;
 b=Fm/vmoAKEmPA5EIkRyYMB7I/3fx9IruQGPFXA3xqdub5udHaPSzyIblRiQqd9ggHD
 dHdpQXaJTfk959avkOMUG78IIQ8JTU8iPSdSKq3Vg87gRrtka4EVlDH2+A6jQccpQi
 LRhSJn2Ka8LSG/25LURk9B5BR0c1S7x1X8clQez0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Lift z-pos restriction on primary plane for Gen3
Date: Fri, 10 Jun 2022 02:55:29 +0300
Message-Id: <20220609235529.22254-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no reason to require the primary plane to always be at the
bottom of the stack, as the VSP supports arbitrary ordering of planes,
and the KMS API doesn't have such a requirement either. Lift the
restriction.

As the primary plane can now be positioned arbitrarily, enable control
of its alpha channel as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 6b535abd799a..356861de17b0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -431,14 +431,9 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		drm_plane_helper_add(&plane->plane,
 				     &rcar_du_vsp_plane_helper_funcs);
 
-		if (type == DRM_PLANE_TYPE_PRIMARY) {
-			drm_plane_create_zpos_immutable_property(&plane->plane,
-								 0);
-		} else {
-			drm_plane_create_alpha_property(&plane->plane);
-			drm_plane_create_zpos_property(&plane->plane, 1, 1,
-						       num_planes - 1);
-		}
+		drm_plane_create_alpha_property(&plane->plane);
+		drm_plane_create_zpos_property(&plane->plane, i, 0,
+					       num_planes - 1);
 
 		vsp->num_planes++;
 	}

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
Regards,

Laurent Pinchart

