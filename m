Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75458AB646E
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 09:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50BC10E26E;
	Wed, 14 May 2025 07:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TckigEK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E692710E26E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 07:31:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E13C261155;
 Wed, 14 May 2025 07:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DFCC4CEE9;
 Wed, 14 May 2025 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747207909;
 bh=Mn5HbuWyqJ7C2JVqgyygApgDsStKx1RO3AbkQziNxxk=;
 h=From:To:Cc:Subject:Date:From;
 b=TckigEK1BxIipXvIYkFynkipGEYWAr5NqeRY1R2x5o3+8hRLcdZf/xhiLCXWj/uQU
 XOXpkgqTPZP5I67KS26pxRB0+zjJnk0VVoLL3Kfjd+xZS01gL6HQx8tPTwwWtjq+h+
 LjqMtjNmfJg/yznQaSeBXDhEGRQm90/C4k3YvUVa1P6F1+wfwlPT0c4UYpbfvfSEqr
 7XIUUXo1iBgMe9uiITCoWFLvuNxnwZPcxIQFHY3jCA8/4lxlv1RYhYd3O6NaDDVptK
 40YyjLO61TGEtLH5eSzNrkzbHCG2ajTLZHYv6hcprNiZK4LZxstZ+HXFO8zaNhHqVo
 0RZ7SOwQVzw/A==
From: Philipp Stanner <phasta@kernel.org>
To: Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v3] drm/vmwgfx: Use non-hybrid PCI devres API
Date: Wed, 14 May 2025 09:31:27 +0200
Message-ID: <20250514073126.85443-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
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

vmwgfx enables its PCI device with pcim_enable_device(). This,
implicitly, switches the function pci_request_regions() into managed
mode, where it becomes a devres function.

The PCI subsystem wants to remove this hybrid nature from its
interfaces. To do so, users of the aforementioned combination of
functions must be ported to non-hybrid functions.

Moreover, since both functions are already managed in this driver, the
calls to pci_release_regions() are unnecessary.

Remove the calls to pci_release_regions().

Replace the call to sometimes-managed pci_request_regions() with one to
always-managed pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
---
Changes in v3:
  - Use the correct driver name in the commit message. (Zack)

Changes in v2:
  - Fix unused variable error.
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 0695a342b1ef..37b832e552a4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -713,7 +713,7 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 
 	pci_set_master(pdev);
 
-	ret = pci_request_regions(pdev, "vmwgfx probe");
+	ret = pcim_request_all_regions(pdev, "vmwgfx probe");
 	if (ret)
 		return ret;
 
@@ -733,7 +733,6 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		if (!dev->rmmio) {
 			drm_err(&dev->drm,
 				"Failed mapping registers mmio memory.\n");
-			pci_release_regions(pdev);
 			return -ENOMEM;
 		}
 	} else if (pci_id == VMWGFX_PCI_ID_SVGA2) {
@@ -754,11 +753,9 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		if (IS_ERR(dev->fifo_mem)) {
 			drm_err(&dev->drm,
 				  "Failed mapping FIFO memory.\n");
-			pci_release_regions(pdev);
 			return PTR_ERR(dev->fifo_mem);
 		}
 	} else {
-		pci_release_regions(pdev);
 		return -EINVAL;
 	}
 
@@ -836,7 +833,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	int ret;
 	enum vmw_res_type i;
 	bool refuse_dma = false;
-	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	vmw_sw_context_init(dev_priv);
 
@@ -852,7 +848,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		return ret;
 	ret = vmw_detect_version(dev_priv);
 	if (ret)
-		goto out_no_pci_or_version;
+		return ret;
 
 
 	for (i = vmw_res_context; i < vmw_res_max; ++i) {
@@ -1152,15 +1148,13 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 
 	if (dev_priv->ctx.staged_bindings)
 		vmw_binding_state_free(dev_priv->ctx.staged_bindings);
-out_no_pci_or_version:
-	pci_release_regions(pdev);
+
 	return ret;
 }
 
 static void vmw_driver_unload(struct drm_device *dev)
 {
 	struct vmw_private *dev_priv = vmw_priv(dev);
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	enum vmw_res_type i;
 
 	unregister_pm_notifier(&dev_priv->pm_nb);
@@ -1196,8 +1190,6 @@ static void vmw_driver_unload(struct drm_device *dev)
 		idr_destroy(&dev_priv->res_idr[i]);
 
 	vmw_mksstat_remove_all(dev_priv);
-
-	pci_release_regions(pdev);
 }
 
 static void vmw_postclose(struct drm_device *dev,
-- 
2.49.0

