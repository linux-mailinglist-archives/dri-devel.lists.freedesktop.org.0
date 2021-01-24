Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68361301B55
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jan 2021 12:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866B889E33;
	Sun, 24 Jan 2021 11:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F306E04E
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 08:56:26 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 3/4] drm/ingenic: Register devm action to cleanup encoders
Date: Sun, 24 Jan 2021 08:55:51 +0000
Message-Id: <20210124085552.29146-4-paul@crapouillou.net>
In-Reply-To: <20210124085552.29146-1-paul@crapouillou.net>
References: <20210124085552.29146-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 24 Jan 2021 11:04:21 +0000
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the encoders have been devm-allocated, they will be freed way
before drm_mode_config_cleanup() is called. To avoid use-after-free
conditions, we then must ensure that drm_encoder_cleanup() is called
before the encoders are freed.

v2: Use the new __drmm_simple_encoder_alloc() function

v3: Use the new drmm_plain_simple_encoder_alloc() macro

Fixes: c369cb27c267 ("drm/ingenic: Support multiple panels/bridges")
Cc: <stable@vger.kernel.org> # 5.8+
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    Use the V1 of this patch to fix v5.11 and older kernels. This V3 only
    applies on the current drm-misc-next branch.

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 7bb31fbee29d..b23011c1c5d9 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1014,20 +1014,17 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 			bridge = devm_drm_panel_bridge_add_typed(dev, panel,
 								 DRM_MODE_CONNECTOR_DPI);
 
-		encoder = devm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
-		if (!encoder)
-			return -ENOMEM;
+		encoder = drmm_plain_simple_encoder_alloc(drm, DRM_MODE_ENCODER_DPI);
+		if (IS_ERR(encoder)) {
+			ret = PTR_ERR(encoder);
+			dev_err(dev, "Failed to init encoder: %d\n", ret);
+			return ret;
+		}
 
 		encoder->possible_crtcs = 1;
 
 		drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
 
-		ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DPI);
-		if (ret) {
-			dev_err(dev, "Failed to init encoder: %d\n", ret);
-			return ret;
-		}
-
 		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 		if (ret) {
 			dev_err(dev, "Unable to attach bridge\n");
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
