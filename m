Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E24DA230465
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BBC6E1F1;
	Tue, 28 Jul 2020 07:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2531F6E1EC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:44:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39A54AE59;
 Tue, 28 Jul 2020 07:44:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH 04/13] drm/ast: Managed release of I2C adapter
Date: Tue, 28 Jul 2020 09:44:16 +0200
Message-Id: <20200728074425.2749-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728074425.2749-1-tzimmermann@suse.de>
References: <20200728074425.2749-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Managed releases of the device's I2C adapter simplify the connector's
release.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index f421a60d8a96..27eb49bd12b3 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -39,6 +39,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -591,6 +592,14 @@ static void ast_i2c_setsda(void *i2c_priv, int data)
 	}
 }
 
+static void ast_i2c_release(struct drm_device *dev, void *data)
+{
+	struct ast_i2c_chan *i2c = data;
+
+	i2c_del_adapter(&i2c->adapter);
+	i2c->dev = NULL; /* clear to signal absence of I2C support */
+}
+
 static int ast_i2c_init(struct ast_i2c_chan *i2c, struct drm_device *dev)
 {
 	int ret;
@@ -618,7 +627,7 @@ static int ast_i2c_init(struct ast_i2c_chan *i2c, struct drm_device *dev)
 
 	i2c->dev = dev; /* signals presence of I2C support */
 
-	return 0;
+	return drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
 }
 
 static bool ast_i2c_is_initialized(struct ast_i2c_chan *i2c)
@@ -626,14 +635,6 @@ static bool ast_i2c_is_initialized(struct ast_i2c_chan *i2c)
 	return !!i2c->dev;
 }
 
-static void ast_i2c_fini(struct ast_i2c_chan *i2c)
-{
-	if (!ast_i2c_is_initialized(i2c))
-		return;
-	i2c_del_adapter(&i2c->adapter);
-	i2c->dev = NULL; /* clear to signal absence of I2C support */
-}
-
 /*
  * Primary plane
  */
@@ -1139,8 +1140,6 @@ static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
 
 static void ast_connector_destroy(struct drm_connector *connector)
 {
-	struct ast_connector *ast_connector = to_ast_connector(connector);
-	ast_i2c_fini(&ast_connector->i2c);
 	drm_connector_cleanup(connector);
 	kfree(connector);
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
