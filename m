Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C22923EBF1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 13:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0941A6E086;
	Fri,  7 Aug 2020 11:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5276E086
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 11:10:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A24F8B6C6;
 Fri,  7 Aug 2020 11:10:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: liviu.dudau@arm.com, brian.starkey@arm.com, airlied@linux.ie,
 daniel@ffwll.ch, emil.velikov@collabora.com
Subject: [PATCH] drm/malidp: Use struct drm_gem_object_funcs.get_sg_table
 internally
Date: Fri,  7 Aug 2020 13:10:22 +0200
Message-Id: <20200807111022.12117-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
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
Cc: malidp@foss.arm.com, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The malidp driver uses GEM object functions for callbacks. Fix it to
use them internally as well.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: ecdd6474644f ("drm/malidp: Use GEM CMA object functions")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
---
 drivers/gpu/drm/arm/malidp_planes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index ab45ac445045..351a85088d0e 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -346,7 +346,7 @@ static bool malidp_check_pages_threshold(struct malidp_plane_state *ms,
 		if (cma_obj->sgt)
 			sgt = cma_obj->sgt;
 		else
-			sgt = obj->dev->driver->gem_prime_get_sg_table(obj);
+			sgt = obj->funcs->get_sg_table(obj);
 
 		if (!sgt)
 			return false;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
