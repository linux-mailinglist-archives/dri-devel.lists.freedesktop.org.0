Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C60A23F430
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 23:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6BD6E1A8;
	Fri,  7 Aug 2020 21:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56BC6E1A8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 21:22:43 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B9E954E;
 Fri,  7 Aug 2020 23:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1596835358;
 bh=PjQnxLstR8J/Vin/vZzG15w+dOZJXyHi4qOTh0mZ0uI=;
 h=From:To:Cc:Subject:Date:From;
 b=vZ9AMhkg3eKN4sy5DCc6tpjatHI7TBcoPKOACbSqEL6t+eVIzjjUNDLc1jZuR/XlW
 TvaAWtZlK+YqW2WFEKoSQepgXSsoIERJwSS7N0T6VEhDyUhEtDafnYBXDj8L91OHxt
 v2i9QDNbrfVDVGz0hRKT+ZnEepaWmVoQIG8WI9VM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Fix crash when enabling a non-visible plane
Date: Sat,  8 Aug 2020 00:22:18 +0300
Message-Id: <20200807212218.24773-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DU driver handles non-visible planes (fully clipped by the display's
boundaries) by considering them as disabled. It thus disables the plane
at the hardware level when the plane if moved off-screen. However, if
the plane was previously disabled and is non-visible when it gets
enabled, the attempt to disable it crashes, ad the plane wasn't
previously enabled. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index f1a81c9b184d..ff233a7b398d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -279,7 +279,7 @@ static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
 
 	if (plane->state->visible)
 		rcar_du_vsp_plane_setup(rplane);
-	else
+	else if (old_state->crtc)
 		vsp1_du_atomic_update(rplane->vsp->vsp, crtc->vsp_pipe,
 				      rplane->index, NULL);
 }
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
