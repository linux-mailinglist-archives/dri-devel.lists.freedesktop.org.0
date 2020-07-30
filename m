Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3989623336E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 15:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FCD6E8FB;
	Thu, 30 Jul 2020 13:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897256E8F2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 13:52:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8CF3B128;
 Thu, 30 Jul 2020 13:52:20 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH v2 5/9] drm/ast: Don't use ast->dev if dev is available
Date: Thu, 30 Jul 2020 15:52:02 +0200
Message-Id: <20200730135206.30239-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730135206.30239-1-tzimmermann@suse.de>
References: <20200730135206.30239-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several places in ast use ast->dev, when a dev pointer is already
available within the function. Remove the extra indirection. No
functional changes made.

This is just a small cleanup before embedding the DRM device instance
in struct ast_private.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/ast/ast_mode.c | 2 +-
 drivers/gpu/drm/ast/ast_post.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index cdbdf3489dee..897a1ad2541e 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1079,7 +1079,7 @@ int ast_mode_config_init(struct ast_private *ast)
 	dev->mode_config.min_height = 0;
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.prefer_shadow = 1;
-	dev->mode_config.fb_base = pci_resource_start(ast->dev->pdev, 0);
+	dev->mode_config.fb_base = pci_resource_start(dev->pdev, 0);
 
 	if (ast->chip == AST2100 ||
 	    ast->chip == AST2200 ||
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index c043fe717553..b1d42a639ece 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -368,9 +368,9 @@ void ast_post_gpu(struct drm_device *dev)
 	u32 reg;
 	struct ast_private *ast = to_ast_private(dev);
 
-	pci_read_config_dword(ast->dev->pdev, 0x04, &reg);
+	pci_read_config_dword(dev->pdev, 0x04, &reg);
 	reg |= 0x3;
-	pci_write_config_dword(ast->dev->pdev, 0x04, reg);
+	pci_write_config_dword(dev->pdev, 0x04, reg);
 
 	ast_enable_vga(dev);
 	ast_open_key(ast);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
