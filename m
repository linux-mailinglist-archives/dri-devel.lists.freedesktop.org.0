Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91811212295
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 13:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A186EAD4;
	Thu,  2 Jul 2020 11:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B152B6EACD
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 11:50:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 517FABD83;
 Thu,  2 Jul 2020 11:50:33 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH v2 13/14] drm/ast: Use managed mode-config init
Date: Thu,  2 Jul 2020 13:50:28 +0200
Message-Id: <20200702115029.5281-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702115029.5281-1-tzimmermann@suse.de>
References: <20200702115029.5281-1-tzimmermann@suse.de>
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

Using drmm_mode_config_init() sets up managed release of modesetting
resources. The existing modesetting's finalizer is empty, so remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  | 1 -
 drivers/gpu/drm/ast/ast_main.c | 6 +++---
 drivers/gpu/drm/ast/ast_mode.c | 4 ----
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 77226e2fd7c0..ad1d0b14ef12 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -287,7 +287,6 @@ struct ast_crtc_state {
 #define to_ast_crtc_state(state) container_of(state, struct ast_crtc_state, base)
 
 extern int ast_mode_init(struct drm_device *dev);
-extern void ast_mode_fini(struct drm_device *dev);
 
 #define AST_MM_ALIGN_SHIFT 4
 #define AST_MM_ALIGN_MASK ((1 << AST_MM_ALIGN_SHIFT) - 1)
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 2eab19a9056f..2642e6d0152b 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -473,7 +473,9 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto out_free;
 
-	drm_mode_config_init(dev);
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		goto out_free;
 
 	dev->mode_config.funcs = (void *)&ast_mode_funcs;
 	dev->mode_config.min_width = 0;
@@ -516,8 +518,6 @@ void ast_driver_unload(struct drm_device *dev)
 
 	ast_release_firmware(dev);
 	kfree(ast->dp501_fw_addr);
-	ast_mode_fini(dev);
-	drm_mode_config_cleanup(dev);
 
 	ast_mm_fini(ast);
 	kfree(ast);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 43c9686ba0f7..33b4b6f3e394 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1110,10 +1110,6 @@ int ast_mode_init(struct drm_device *dev)
 	return 0;
 }
 
-void ast_mode_fini(struct drm_device *dev)
-{
-}
-
 static int get_clock(void *i2c_priv)
 {
 	struct ast_i2c_chan *i2c = i2c_priv;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
