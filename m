Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF3B168FC0
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66416E953;
	Sat, 22 Feb 2020 15:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89BF6E94E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:24:57 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A84EFAE6;
 Sat, 22 Feb 2020 16:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582385096;
 bh=cnpcPVJOg7EpceXMdtmuTlioFZV8kgO3xiCHg6PmZ/Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=My+t7NjHo6zI01tdxByimT+xrr46TAG74vi5SQm4JWw04jgDLNKemOW/wda3CFTuZ
 i6YZs/YO/MygjVP9xhr6E509dJRXuAq5BCnFRZM7dgXDwMX/IvoemImOIDjjLh5qmU
 Qj48RKigb8qRv4kDL//tR8BgG1xEQWoEVApvWbMk=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH/RFC 3/3] drm: rcar_du: Constify drm_driver
Date: Sat, 22 Feb 2020 17:24:30 +0200
Message-Id: <20200222152430.2984-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222152430.2984-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200222152430.2984-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_driver structure is never modified, make it const. The improves
security by avoiding writable function pointers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 654e2dd08146..039eee3ef661 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -474,7 +474,7 @@ MODULE_DEVICE_TABLE(of, rcar_du_of_table);
 
 DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
 
-static struct drm_driver rcar_du_driver = {
+static const struct drm_driver rcar_du_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.gem_free_object_unlocked = drm_gem_cma_free_object,
 	.gem_vm_ops		= &drm_gem_cma_vm_ops,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
