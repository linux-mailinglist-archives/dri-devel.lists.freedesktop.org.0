Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9949EC3FA47
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E610810EA91;
	Fri,  7 Nov 2025 11:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GeTP1ru1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C9010EA91;
 Fri,  7 Nov 2025 11:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762513540; x=1794049540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FFBfUEbO6TFdZQYJIefc7/YwMpbTMMt9IH/uHM+K+LA=;
 b=GeTP1ru1GvQSSHoGJ9C/6eLQZc4vwrpBm2F+oq4546SszjYbRa1yRjRA
 tv4Xgpm/j5+vpkVHmYqLnYsrMLP3dB6PB1ApmxwI8GroiZ4GxjLwmJuxI
 t3mksuG2OQnmb9jAoYjHVOZW4MzHHm5olz3uKtKmrsDfgaOJvAD4vhYck
 DNm+1gqZ4JPWQfOrGuBkKRhV1dKBXREfrnU4kxeEAjfx3sdD5huhmpV5o
 ArMgrX9+hV6DgTWoPqw4X1IdXAMoCtIW0XPGQRG23YcpztsGIbPj3O8BB
 fjQaoTgmp1q6YacHGlnFnfANzdo70t0fYRDKwD4mcD5TUHosDBMAJQGNm A==;
X-CSE-ConnectionGUID: 4L1jsB/eQiqngioJctNLcQ==
X-CSE-MsgGUID: wvNd6WNCTlejG/IR7l2zSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="68309507"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="68309507"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:39 -0800
X-CSE-ConnectionGUID: mj4+DHArSlij/x27w5nNcw==
X-CSE-MsgGUID: NDwKTKl/RimUUiB0g/L5pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="187738959"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.124])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 6/6] drm/gma500: use drm_crtc_vblank_crtc()
Date: Fri,  7 Nov 2025 13:05:00 +0200
Message-ID: <27b2c6772c68120d0d5ec28477db0d993743e955.1762513240.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762513240.git.jani.nikula@intel.com>
References: <cover.1762513240.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have drm_crtc_vblank_crtc() to get the struct drm_vblank_crtc pointer
for a crtc. Use it instead of poking at dev->vblank[] directly.

However, we also need to get the crtc to start with. We could use
drm_crtc_from_index(), but refactor to use drm_for_each_crtc() instead.

This is all a bit tedious, and perhaps the driver shouldn't be poking at
vblank->enabled directly in the first place. But at least hide away the
dev->vblank[] access in drm_vblank.c where it belongs.

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/gma500/psb_irq.c | 36 ++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index c224c7ff353c..3a946b472064 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -250,6 +250,7 @@ static irqreturn_t gma_irq_handler(int irq, void *arg)
 void gma_irq_preinstall(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct drm_crtc *crtc;
 	unsigned long irqflags;
 
 	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
@@ -260,10 +261,15 @@ void gma_irq_preinstall(struct drm_device *dev)
 	PSB_WSGX32(0x00000000, PSB_CR_EVENT_HOST_ENABLE);
 	PSB_RSGX32(PSB_CR_EVENT_HOST_ENABLE);
 
-	if (dev->vblank[0].enabled)
-		dev_priv->vdc_irq_mask |= _PSB_VSYNC_PIPEA_FLAG;
-	if (dev->vblank[1].enabled)
-		dev_priv->vdc_irq_mask |= _PSB_VSYNC_PIPEB_FLAG;
+	drm_for_each_crtc(crtc, dev) {
+		struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+
+		if (vblank->enabled) {
+			u32 mask = drm_crtc_index(crtc) ? _PSB_VSYNC_PIPEB_FLAG :
+				_PSB_VSYNC_PIPEA_FLAG;
+			dev_priv->vdc_irq_mask |= mask;
+		}
+	}
 
 	/* Revisit this area - want per device masks ? */
 	if (dev_priv->ops->hotplug)
@@ -278,8 +284,8 @@ void gma_irq_preinstall(struct drm_device *dev)
 void gma_irq_postinstall(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct drm_crtc *crtc;
 	unsigned long irqflags;
-	unsigned int i;
 
 	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
 
@@ -292,11 +298,13 @@ void gma_irq_postinstall(struct drm_device *dev)
 	PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
 	PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
 
-	for (i = 0; i < dev->num_crtcs; ++i) {
-		if (dev->vblank[i].enabled)
-			gma_enable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
+	drm_for_each_crtc(crtc, dev) {
+		struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+
+		if (vblank->enabled)
+			gma_enable_pipestat(dev_priv, drm_crtc_index(crtc), PIPE_VBLANK_INTERRUPT_ENABLE);
 		else
-			gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
+			gma_disable_pipestat(dev_priv, drm_crtc_index(crtc), PIPE_VBLANK_INTERRUPT_ENABLE);
 	}
 
 	if (dev_priv->ops->hotplug_enable)
@@ -337,8 +345,8 @@ void gma_irq_uninstall(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	struct drm_crtc *crtc;
 	unsigned long irqflags;
-	unsigned int i;
 
 	if (!dev_priv->irq_enabled)
 		return;
@@ -350,9 +358,11 @@ void gma_irq_uninstall(struct drm_device *dev)
 
 	PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
 
-	for (i = 0; i < dev->num_crtcs; ++i) {
-		if (dev->vblank[i].enabled)
-			gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
+	drm_for_each_crtc(crtc, dev) {
+		struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+
+		if (vblank->enabled)
+			gma_disable_pipestat(dev_priv, drm_crtc_index(crtc), PIPE_VBLANK_INTERRUPT_ENABLE);
 	}
 
 	dev_priv->vdc_irq_mask &= _PSB_IRQ_SGX_FLAG |
-- 
2.47.3

