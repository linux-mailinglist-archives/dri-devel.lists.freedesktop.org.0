Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1062181B4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E670E6E89F;
	Wed,  8 Jul 2020 07:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2466E89E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 07:49:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4AD58AEC9;
 Wed,  8 Jul 2020 07:49:14 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, noralf@tronnes.org,
 emil.l.velikov@gmail.com, yc_chen@aspeedtech.com
Subject: [PATCH 3/6] drm/ast: Use managed VRAM-helper initialization
Date: Wed,  8 Jul 2020 09:49:09 +0200
Message-Id: <20200708074912.25422-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708074912.25422-1-tzimmermann@suse.de>
References: <20200708074912.25422-1-tzimmermann@suse.de>
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

As a first step to managed MM code in ast, switch over VRAM MM helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index 9c3788a4c1c5..c0bbcfed9c43 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -39,9 +39,8 @@ int ast_mm_init(struct ast_private *ast)
 	int ret;
 	struct drm_device *dev = ast->dev;
 
-	vmm = drm_vram_helper_alloc_mm(
-		dev, pci_resource_start(dev->pdev, 0),
-		ast->vram_size);
+	vmm = drmm_vram_helper_alloc_mm(dev, pci_resource_start(dev->pdev, 0),
+					ast->vram_size);
 	if (IS_ERR(vmm)) {
 		ret = PTR_ERR(vmm);
 		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
@@ -60,8 +59,6 @@ void ast_mm_fini(struct ast_private *ast)
 {
 	struct drm_device *dev = ast->dev;
 
-	drm_vram_helper_release_mm(dev);
-
 	arch_phys_wc_del(ast->fb_mtrr);
 	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
 				pci_resource_len(dev->pdev, 0));
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
