Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D1B2DB487
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 20:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5218489A20;
	Tue, 15 Dec 2020 19:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41A6894D7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 19:38:06 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1889C593;
 Tue, 15 Dec 2020 20:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608061085;
 bh=JvESZ4RsdWJV/2wziQyp46J7Jr76jG9a3EfHuLJJNHs=;
 h=From:To:Cc:Subject:Date:From;
 b=tDZ7iQuUdAA3crOki0LDWvAydM9kQ8XPtdf5BdcO1yr3VTMt3ss/5+7YYaq37c7SE
 6cpptFxhrZ2w8qYIdY2e6aEZx1LlwGQri+kJD2qSE0agN7avczv9Y22hRCTMHHOzLE
 0tynXAXC1pYab2qBS8v+JeOaYs3Bq/jONRhHXl4U=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm: arc: Remove unnecessary drm_plane_cleanup() wrapper
Date: Tue, 15 Dec 2020 21:37:52 +0200
Message-Id: <20201215193755.26160-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the drm_plane_cleanup() function directly as the drm_plane_funcs
.destroy() handler without creating an unnecessary wrapper around it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 042d7b54a6de..895cdd991af6 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -162,15 +162,10 @@ static const struct drm_plane_helper_funcs arc_pgu_plane_helper_funcs = {
 	.atomic_update = arc_pgu_plane_atomic_update,
 };
 
-static void arc_pgu_plane_destroy(struct drm_plane *plane)
-{
-	drm_plane_cleanup(plane);
-}
-
 static const struct drm_plane_funcs arc_pgu_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
-	.destroy		= arc_pgu_plane_destroy,
+	.destroy		= drm_plane_cleanup,
 	.reset			= drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
@@ -213,7 +208,7 @@ int arc_pgu_setup_crtc(struct drm_device *drm)
 	ret = drm_crtc_init_with_planes(drm, &arcpgu->crtc, primary, NULL,
 					&arc_pgu_crtc_funcs, NULL);
 	if (ret) {
-		arc_pgu_plane_destroy(primary);
+		drm_plane_cleanup(primary);
 		return ret;
 	}
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
