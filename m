Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EF7204C20
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 10:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264246E977;
	Tue, 23 Jun 2020 08:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E546E97B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 08:19:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57B62B023;
 Tue, 23 Jun 2020 08:19:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH 12/14] drm/ast: Replace struct ast_crtc with struct drm_crtc
Date: Tue, 23 Jun 2020 10:18:59 +0200
Message-Id: <20200623081901.10667-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623081901.10667-1-tzimmermann@suse.de>
References: <20200623081901.10667-1-tzimmermann@suse.de>
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

Struct ast_crtc has been cleaned up and it's now a wrapper around the
DRM CRTC structure struct drm_crtc. This patch converts the driver to
struct drm_crtc and removes struct ast_crtc.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  5 -----
 drivers/gpu/drm/ast/ast_mode.c | 11 ++++++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ea4de3dce2c4..77226e2fd7c0 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -238,11 +238,6 @@ struct ast_connector {
 	struct ast_i2c_chan *i2c;
 };
 
-struct ast_crtc {
-	struct drm_crtc base;
-};
-
-#define to_ast_crtc(x) container_of(x, struct ast_crtc, base)
 #define to_ast_connector(x) container_of(x, struct ast_connector, base)
 
 struct ast_vbios_stdtable {
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 89d9ee0a9e81..43c9686ba0f7 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -881,21 +881,22 @@ static const struct drm_crtc_funcs ast_crtc_funcs = {
 static int ast_crtc_init(struct drm_device *dev)
 {
 	struct ast_private *ast = to_ast_private(dev);
-	struct ast_crtc *crtc;
+	struct drm_crtc *crtc;
 	int ret;
 
-	crtc = kzalloc(sizeof(struct ast_crtc), GFP_KERNEL);
+	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
 	if (!crtc)
 		return -ENOMEM;
 
-	ret = drm_crtc_init_with_planes(dev, &crtc->base, &ast->primary_plane,
+	ret = drm_crtc_init_with_planes(dev, crtc, &ast->primary_plane,
 					&ast->cursor_plane, &ast_crtc_funcs,
 					NULL);
 	if (ret)
 		goto err_kfree;
 
-	drm_mode_crtc_set_gamma_size(&crtc->base, 256);
-	drm_crtc_helper_add(&crtc->base, &ast_crtc_helper_funcs);
+	drm_mode_crtc_set_gamma_size(crtc, 256);
+	drm_crtc_helper_add(crtc, &ast_crtc_helper_funcs);
+
 	return 0;
 
 err_kfree:
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
