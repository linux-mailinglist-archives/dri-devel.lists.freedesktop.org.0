Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDDE3CA53C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCD16E899;
	Thu, 15 Jul 2021 18:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16F26E899
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 18:17:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49ECB61396;
 Thu, 15 Jul 2021 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626373073;
 bh=fpDhl2U4QQnsR9Xf8dlruBqdKtnD76+H9Ch3Dp1TISs=;
 h=Subject:To:Cc:From:Date:From;
 b=mCNm3MgIzDtQnB7e0slfniUPloU+uJVurxcrSX7JMl2uW5cf/Nty/RqX7Sycgg+sv
 h4TnmmhdPvJ6RRtGdiNS/Y7ZtkGnz2E2paKVt9dlIsAlEBpDimlm7AeiiipEdRd33S
 EN+Qxp+5PJLO23NYbd8YmRlNXE83UnxJApmvQBBE=
Subject: Patch "drm/ast: Remove reference to struct drm_device.pdev" has been
 added to the 5.10-stable tree
To: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, kuohsiang_chou@aspeedtech.com, lkp@intel.com,
 michael.j.ruhl@intel.com, tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Thu, 15 Jul 2021 20:17:32 +0200
Message-ID: <1626373052253229@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/ast: Remove reference to struct drm_device.pdev

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ast-remove-reference-to-struct-drm_device.pdev.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 0ecb51824e838372e01330752503ddf9c0430ef7 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 29 Apr 2021 12:50:57 +0200
Subject: drm/ast: Remove reference to struct drm_device.pdev

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 0ecb51824e838372e01330752503ddf9c0430ef7 upstream.

Using struct drm_device.pdev is deprecated. Upcast with to_pci_dev()
from struct drm_device.dev to get the PCI device structure.

v9:
	* fix remaining pdev references

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Fixes: ba4e0339a6a3 ("drm/ast: Fixed CVE for DP501")
Cc: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
Cc: kernel test robot <lkp@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Link: https://patchwork.freedesktop.org/patch/msgid/20210429105101.25667-2-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_main.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -406,7 +406,6 @@ struct ast_private *ast_device_create(st
 		return ast;
 	dev = &ast->base;
 
-	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 
 	ast->regs = pcim_iomap(pdev, 1, 0);
@@ -448,8 +447,8 @@ struct ast_private *ast_device_create(st
 
 	/* map reserved buffer */
 	ast->dp501_fw_buf = NULL;
-	if (dev->vram_mm->vram_size < pci_resource_len(dev->pdev, 0)) {
-		ast->dp501_fw_buf = pci_iomap_range(dev->pdev, 0, dev->vram_mm->vram_size, 0);
+	if (dev->vram_mm->vram_size < pci_resource_len(pdev, 0)) {
+		ast->dp501_fw_buf = pci_iomap_range(pdev, 0, dev->vram_mm->vram_size, 0);
 		if (!ast->dp501_fw_buf)
 			drm_info(dev, "failed to map reserved buffer!\n");
 	}


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-5.10/drm-mxsfb-don-t-select-drm_kms_fb_helper.patch
queue-5.10/drm-ast-remove-reference-to-struct-drm_device.pdev.patch
queue-5.10/drm-vc4-crtc-skip-the-txp.patch
queue-5.10/drm-zte-don-t-select-drm_kms_fb_helper.patch
queue-5.10/drm-ast-fixed-cve-for-dp501.patch
queue-5.10/drm-vc4-txp-properly-set-the-possible_crtcs-mask.patch
