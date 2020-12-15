Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 289592DB48A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 20:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1D289A32;
	Tue, 15 Dec 2020 19:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516D589A16
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 19:38:08 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5573D95;
 Tue, 15 Dec 2020 20:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608061086;
 bh=tXfPRqvRXn23qE7xShK+IblkqWeftsSn2vbY/MfL7qA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U5ie4ah8x+YCvtrwRaSCLd2Z2M//tsQIdO4cFQ5Mikvz+dYscG0xQqkZkQjcPn+z6
 8a6f4vV03vXVr1zARlvxP/UcdGDqhLjaK+bD4OvWrKvMguJ+dgbGSCBg4izieKHlN+
 qH/taQDmIc4d9J688QEbkqTi9OOvGVjZCivEZtck=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm: vc4: Remove unnecessary drm_plane_cleanup() wrapper
Date: Tue, 15 Dec 2020 21:37:54 +0200
Message-Id: <20201215193755.26160-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201215193755.26160-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201215193755.26160-1-laurent.pinchart+renesas@ideasonboard.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the drm_plane_cleanup() function directly as the drm_plane_funcs
.destroy() handler without creating an unnecessary wrapper around it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 6b39cc2ca18d..6bd8260aa9f2 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1268,11 +1268,6 @@ static const struct drm_plane_helper_funcs vc4_plane_helper_funcs = {
 	.atomic_async_update = vc4_plane_atomic_async_update,
 };
 
-static void vc4_plane_destroy(struct drm_plane *plane)
-{
-	drm_plane_cleanup(plane);
-}
-
 static bool vc4_format_mod_supported(struct drm_plane *plane,
 				     uint32_t format,
 				     uint64_t modifier)
@@ -1323,7 +1318,7 @@ static bool vc4_format_mod_supported(struct drm_plane *plane,
 static const struct drm_plane_funcs vc4_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = vc4_plane_destroy,
+	.destroy = drm_plane_cleanup,
 	.set_property = NULL,
 	.reset = vc4_plane_reset,
 	.atomic_duplicate_state = vc4_plane_duplicate_state,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
