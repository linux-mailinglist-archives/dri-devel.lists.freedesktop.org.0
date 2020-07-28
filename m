Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30781230464
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9389A6E1EC;
	Tue, 28 Jul 2020 07:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F036E207
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:44:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48F4CAFD5;
 Tue, 28 Jul 2020 07:44:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH 12/13] drm/ast: Manage release of firmware backup memory
Date: Tue, 28 Jul 2020 09:44:24 +0200
Message-Id: <20200728074425.2749-13-tzimmermann@suse.de>
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

The ast driver keeps a backup copy of the DP501 encoder's firmware. This
patch adds managed release of the allocated memory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index e3b7748335a3..67e20727d82d 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -33,6 +33,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_managed.h>
 
 #include "ast_drv.h"
 
@@ -231,11 +232,11 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 			ast->tx_chip_type = AST_TX_SIL164;
 			break;
 		case 0x08:
-			ast->dp501_fw_addr = kzalloc(32*1024, GFP_KERNEL);
+			ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
 			if (ast->dp501_fw_addr) {
 				/* backup firmware */
 				if (ast_backup_fw(dev, ast->dp501_fw_addr, 32*1024)) {
-					kfree(ast->dp501_fw_addr);
+					drmm_kfree(dev, ast->dp501_fw_addr);
 					ast->dp501_fw_addr = NULL;
 				}
 			}
@@ -444,6 +445,4 @@ void ast_device_destroy(struct ast_private *ast)
 {
 	/* enable standard VGA decode */
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
-
-	kfree(ast->dp501_fw_addr);
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
