Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4DE2B4CD1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D409689C63;
	Mon, 16 Nov 2020 17:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A153189C63
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:29:35 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB5072223D;
 Mon, 16 Nov 2020 17:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605547775;
 bh=rRbhSW5IWNFop10zkff/cj7ERW/yFvU7Opef4Q4Hk6w=;
 h=Subject:To:Cc:From:Date:From;
 b=Nm4vvGj5wAoesdPRwyPOk8BBR1ar8j0fZQ29WhT347UbIlJfz6JUlJOycNTj0vXH+
 PIXbao/iYB1RVxrjvGFI9nBXTo31S/kgugamxRnHzUBtcovbM2hs949xRiWQcUR7su
 acsxW4Mhi5mdXB9q/ueeU4R0ho5lsm5cUkMHRJMo=
Subject: Patch "drm/gma500: Fix out-of-bounds access to struct
 drm_device.vblank[]" has been added to the 5.9-stable tree
To: airlied@redhat.com, alan@linux.intel.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 patrik.r.jakobsson@gmail.com, tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Mon, 16 Nov 2020 18:30:08 +0100
Message-ID: <160554780817249@kroah.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/gma500: Fix out-of-bounds access to struct drm_device.vblank[]

to the 5.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-gma500-fix-out-of-bounds-access-to-struct-drm_device.vblank.patch
and it can be found in the queue-5.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 06ad8d339524bf94b89859047822c31df6ace239 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 5 Nov 2020 20:02:56 +0100
Subject: drm/gma500: Fix out-of-bounds access to struct drm_device.vblank[]

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 06ad8d339524bf94b89859047822c31df6ace239 upstream.

The gma500 driver expects 3 pipelines in several it's IRQ functions.
Accessing struct drm_device.vblank[], this fails with devices that only
have 2 pipelines. An example KASAN report is shown below.

  [   62.267688] ==================================================================
  [   62.268856] BUG: KASAN: slab-out-of-bounds in psb_irq_postinstall+0x250/0x3c0 [gma500_gfx]
  [   62.269450] Read of size 1 at addr ffff8880012bc6d0 by task systemd-udevd/285
  [   62.269949]
  [   62.270192] CPU: 0 PID: 285 Comm: systemd-udevd Tainted: G            E     5.10.0-rc1-1-default+ #572
  [   62.270807] Hardware name:  /DN2800MT, BIOS MTCDT10N.86A.0164.2012.1213.1024 12/13/2012
  [   62.271366] Call Trace:
  [   62.271705]  dump_stack+0xae/0xe5
  [   62.272180]  print_address_description.constprop.0+0x17/0xf0
  [   62.272987]  ? psb_irq_postinstall+0x250/0x3c0 [gma500_gfx]
  [   62.273474]  __kasan_report.cold+0x20/0x38
  [   62.273989]  ? psb_irq_postinstall+0x250/0x3c0 [gma500_gfx]
  [   62.274460]  kasan_report+0x3a/0x50
  [   62.274891]  psb_irq_postinstall+0x250/0x3c0 [gma500_gfx]
  [   62.275380]  drm_irq_install+0x131/0x1f0
  <...>
  [   62.300751] Allocated by task 285:
  [   62.301223]  kasan_save_stack+0x1b/0x40
  [   62.301731]  __kasan_kmalloc.constprop.0+0xbf/0xd0
  [   62.302293]  drmm_kmalloc+0x55/0x100
  [   62.302773]  drm_vblank_init+0x77/0x210

Resolve the issue by only handling vblank entries up to the number of
CRTCs.

I'm adding a Fixes tag for reference, although the bug has been present
since the driver's initial commit.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Fixes: 5c49fd3aa0ab ("gma500: Add the core DRM files and headers")
Cc: Alan Cox <alan@linux.intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org#v3.3+
Link: https://patchwork.freedesktop.org/patch/msgid/20201105190256.3893-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/gpu/drm/gma500/psb_irq.c |   34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -347,6 +347,7 @@ int psb_irq_postinstall(struct drm_devic
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	unsigned long irqflags;
+	unsigned int i;
 
 	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
 
@@ -359,20 +360,12 @@ int psb_irq_postinstall(struct drm_devic
 	PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
 	PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
 
-	if (dev->vblank[0].enabled)
-		psb_enable_pipestat(dev_priv, 0, PIPE_VBLANK_INTERRUPT_ENABLE);
-	else
-		psb_disable_pipestat(dev_priv, 0, PIPE_VBLANK_INTERRUPT_ENABLE);
-
-	if (dev->vblank[1].enabled)
-		psb_enable_pipestat(dev_priv, 1, PIPE_VBLANK_INTERRUPT_ENABLE);
-	else
-		psb_disable_pipestat(dev_priv, 1, PIPE_VBLANK_INTERRUPT_ENABLE);
-
-	if (dev->vblank[2].enabled)
-		psb_enable_pipestat(dev_priv, 2, PIPE_VBLANK_INTERRUPT_ENABLE);
-	else
-		psb_disable_pipestat(dev_priv, 2, PIPE_VBLANK_INTERRUPT_ENABLE);
+	for (i = 0; i < dev->num_crtcs; ++i) {
+		if (dev->vblank[i].enabled)
+			psb_enable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
+		else
+			psb_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
+	}
 
 	if (dev_priv->ops->hotplug_enable)
 		dev_priv->ops->hotplug_enable(dev, true);
@@ -385,6 +378,7 @@ void psb_irq_uninstall(struct drm_device
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	unsigned long irqflags;
+	unsigned int i;
 
 	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
 
@@ -393,14 +387,10 @@ void psb_irq_uninstall(struct drm_device
 
 	PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
 
-	if (dev->vblank[0].enabled)
-		psb_disable_pipestat(dev_priv, 0, PIPE_VBLANK_INTERRUPT_ENABLE);
-
-	if (dev->vblank[1].enabled)
-		psb_disable_pipestat(dev_priv, 1, PIPE_VBLANK_INTERRUPT_ENABLE);
-
-	if (dev->vblank[2].enabled)
-		psb_disable_pipestat(dev_priv, 2, PIPE_VBLANK_INTERRUPT_ENABLE);
+	for (i = 0; i < dev->num_crtcs; ++i) {
+		if (dev->vblank[i].enabled)
+			psb_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
+	}
 
 	dev_priv->vdc_irq_mask &= _PSB_IRQ_SGX_FLAG |
 				  _PSB_IRQ_MSVDX_FLAG |


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-5.9/drm-gma500-fix-out-of-bounds-access-to-struct-drm_device.vblank.patch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
