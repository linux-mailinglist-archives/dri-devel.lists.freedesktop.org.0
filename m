Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF573670DC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 19:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142FA6E1F5;
	Wed, 21 Apr 2021 17:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223F16E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 17:05:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8C1CFAE72;
 Wed, 21 Apr 2021 17:05:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/ast: Fix missing conversions to managed API
Date: Wed, 21 Apr 2021 19:04:58 +0200
Message-Id: <20210421170458.21178-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit 7cbb93d89838 ("drm/ast: Use managed pci functions")
converted a few PCI accessors to the managed API and dropped the
manual pci_iounmap() calls, but it seems to have forgotten converting
pci_iomap() to the managed one.  It resulted in the leftover resources
after the driver unbind.  Let's fix them.

Fixes: 7cbb93d89838 ("drm/ast: Use managed pci functions")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 0ac3c2039c4b..c29cc7f19863 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -413,7 +413,7 @@ struct ast_private *ast_device_create(const struct drm_driver *drv,
 
 	pci_set_drvdata(pdev, dev);
 
-	ast->regs = pci_iomap(pdev, 1, 0);
+	ast->regs = pcim_iomap(pdev, 1, 0);
 	if (!ast->regs)
 		return ERR_PTR(-EIO);
 
@@ -429,7 +429,7 @@ struct ast_private *ast_device_create(const struct drm_driver *drv,
 
 	/* "map" IO regs if the above hasn't done so already */
 	if (!ast->ioregs) {
-		ast->ioregs = pci_iomap(pdev, 2, 0);
+		ast->ioregs = pcim_iomap(pdev, 2, 0);
 		if (!ast->ioregs)
 			return ERR_PTR(-EIO);
 	}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
