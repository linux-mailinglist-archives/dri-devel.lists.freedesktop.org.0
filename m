Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4830227A834
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17B36E3D3;
	Mon, 28 Sep 2020 07:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 541 seconds by postgrey-1.36 at gabe;
 Fri, 25 Sep 2020 22:46:06 UTC
Received: from agrajag.zerfleddert.de (agrajag.zerfleddert.de
 [IPv6:2a01:4f8:bc:1de::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760936ED70
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 22:46:06 +0000 (UTC)
Received: by agrajag.zerfleddert.de (Postfix, from userid 1000)
 id 339E95B2096F; Sat, 26 Sep 2020 00:37:00 +0200 (CEST)
Date: Sat, 26 Sep 2020 00:37:00 +0200
From: Tobias Jordan <kernel@cdqe.de>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: of: fix leak of port_node
Message-ID: <20200925223700.GA26659@agrajag.zerfleddert.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The for_each_child_of_node loop in drm_of_lvds_get_remote_pixels_type
bails out in two occasions. Originally, both were calling of_node_put to
clean up, but (probably a typo) for the wrong variable.

One of these typos was fixed in commit 4ee48cc5586b ("drm: of: Fix
double-free bug"), but that missed the leak of the original port_node
and also the first error path which was obviously wrong as well.

Fix the leak of port_node in the error paths by calling of_node_put on
it.

Fixes: 6529007522de ("drm: of: Add drm_of_lvds_get_dual_link_pixel_order")
Signed-off-by: Tobias Jordan <kernel@cdqe.de>
---
 drivers/gpu/drm/drm_of.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index ca04c34e8251..5c136bd5a671 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -315,7 +315,7 @@ static int drm_of_lvds_get_remote_pixels_type(
 
 		remote_port = of_graph_get_remote_port(endpoint);
 		if (!remote_port) {
-			of_node_put(remote_port);
+			of_node_put(port_node);
 			return -EPIPE;
 		}
 
@@ -331,8 +331,10 @@ static int drm_of_lvds_get_remote_pixels_type(
 		 * configurations by passing the endpoints explicitly to
 		 * drm_of_lvds_get_dual_link_pixel_order().
 		 */
-		if (!current_pt || pixels_type != current_pt)
+		if (!current_pt || pixels_type != current_pt) {
+			of_node_put(port_node);
 			return -EINVAL;
+		}
 	}
 
 	return pixels_type;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
