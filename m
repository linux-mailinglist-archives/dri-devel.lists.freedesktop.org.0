Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCDE2A86AA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 20:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCBC6EDD9;
	Thu,  5 Nov 2020 19:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6556EDD9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 19:03:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E256AB8F;
 Thu,  5 Nov 2020 19:03:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/gma500: Fix out-of-bounds access to struct
 drm_device.vblank[]
Date: Thu,  5 Nov 2020 20:02:56 +0100
Message-Id: <20201105190256.3893-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
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
Cc: Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Alan Cox <alan@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
Fixes: 5c49fd3aa0ab ("gma500: Add the core DRM files and headers")
Cc: Alan Cox <alan@linux.intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org#v3.3+
---
 drivers/gpu/drm/gma500/psb_irq.c | 34 +++++++++++---------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 15eb3770d817..361e3a0c5ab6 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -347,6 +347,7 @@ int psb_irq_postinstall(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	unsigned long irqflags;
+	unsigned int i;
 
 	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
 
@@ -359,20 +360,12 @@ int psb_irq_postinstall(struct drm_device *dev)
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
@@ -385,6 +378,7 @@ void psb_irq_uninstall(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	unsigned long irqflags;
+	unsigned int i;
 
 	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
 
@@ -393,14 +387,10 @@ void psb_irq_uninstall(struct drm_device *dev)
 
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
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
