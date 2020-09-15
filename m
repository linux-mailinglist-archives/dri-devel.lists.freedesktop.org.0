Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B178A26B52C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 01:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B175F6E258;
	Tue, 15 Sep 2020 23:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADD96E258
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 23:39:07 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D102FD8;
 Wed, 16 Sep 2020 01:39:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600213145;
 bh=oiifi9xsZl4JM+3W82GS6oFCV5VVyFiziyYzLsUVFMA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nWwTchFVx9CAH6RIi25F6Y6odO0qXjLyElA2+vfnxFIhlEDd+n/m1CRKqgBhVAsEL
 kLySIhyeMgpHg4tm5+k6KyaMRoiIo46O5l2hinyP8hEdxKZpLn7+LaessSp0piRXcg
 kLJXeSpK12VvP33kqgH0WwGCNYESnWVvq+7dN2cU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Put reference to VSP device
Date: Wed, 16 Sep 2020 02:38:32 +0300
Message-Id: <20200915233832.19769-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200915233004.GD14954@pendragon.ideasonboard.com>
References: <20200915233004.GD14954@pendragon.ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, Yu Kuai <yukuai3@huawei.com>,
 kieran.bingham+renesas@ideasonboard.com, yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reference to the VSP device acquired with of_find_device_by_node()
in rcar_du_vsp_init() is never released. Fix it with a drmm action,
which gets run both in the probe error path and in the remove path.

Fixes: 6d62ef3ac30b ("drm: rcar-du: Expose the VSP1 compositor through KMS planes")
Reported-by: Yu Kuai <yukuai3@huawei.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index f1a81c9b184d..fa09b3ae8b9d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -13,6 +13,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -341,6 +342,13 @@ static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
 	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
 };
 
+static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
+{
+	struct rcar_du_vsp *vsp = res;
+
+	put_device(vsp->vsp);
+}
+
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		     unsigned int crtcs)
 {
@@ -357,6 +365,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 
 	vsp->vsp = &pdev->dev;
 
+	ret = drmm_add_action(rcdu->ddev, rcar_du_vsp_cleanup, vsp);
+	if (ret < 0)
+		return ret;
+
 	ret = vsp1_du_init(vsp->vsp);
 	if (ret < 0)
 		return ret;
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
