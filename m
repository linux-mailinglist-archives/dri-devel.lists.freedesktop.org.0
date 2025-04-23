Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8B7A98929
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 14:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D9510E669;
	Wed, 23 Apr 2025 12:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s9qhlLWo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5AE10E669
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:06:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D5ED5C617E;
 Wed, 23 Apr 2025 12:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED06BC4CEEC;
 Wed, 23 Apr 2025 12:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745410012;
 bh=b791/nYAahqeXzyXJRKzK+9LdRgB3iieYFC/tmDGx0c=;
 h=From:To:Cc:Subject:Date:From;
 b=s9qhlLWoCEiFJ0aCLkLpm0gOc16IkO9mGEsWkvKEvTSnPhFy8k+gnh4rM5GILJ6Xb
 Bf4vjnBZEMSFxyqe4bgRy28MFE72bqiZMMak88e41yJdvWP3Kx9xn7c22eJb2kFWIr
 QSkNvhYE559gfgIL3BIDfthVvv0ZXC7VMJrFuuLTMtbUhSIgdodS6ks53eEYacSHdJ
 ZCohu/RveW0Dv7Kl3XlPsXepHCmlOFLfLb0UhI6IavRl72ZNcHjdlCU3XzOmoB8sRY
 8VlJYayljpfE/Cw+cgxWDfqm3d0sHrJ6mrq1CC2HmYSIf8qDaCklq6mlr4Bd8nAwdi
 LVbYt6/4X4bVg==
From: Philipp Stanner <phasta@kernel.org>
To: Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2] drm/vmgfx: Use non-hybrid PCI devres API
Date: Wed, 23 Apr 2025 14:06:44 +0200
Message-ID: <20250423120643.66814-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
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

vmgfx enables its PCI device with pcim_enable_device(). This,
implicitly, switches the function pci_request_regions() into managed
mode, where it becomes a devres function.

The PCI subsystem wants to remove this hybrid nature from its
interfaces. To do so, users of the aforementioned combination of
functions must be ported to non-hybrid functions.

Moreover, since both functions are already managed in this driver, the
calls to pci_release_regions() are unnecessary.

Remove the calls to pci_release_regions().

Replace the call to sometimes-managed pci_request_regions() with one to
the always-managed pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Fix unused variable error.
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 0f32471c8533..1e3ebace32ae 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -733,7 +733,7 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 
 	pci_set_master(pdev);
 
-	ret = pci_request_regions(pdev, "vmwgfx probe");
+	ret = pcim_request_all_regions(pdev, "vmwgfx probe");
 	if (ret)
 		return ret;
 
@@ -753,7 +753,6 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		if (!dev->rmmio) {
 			drm_err(&dev->drm,
 				"Failed mapping registers mmio memory.\n");
-			pci_release_regions(pdev);
 			return -ENOMEM;
 		}
 	} else if (pci_id == VMWGFX_PCI_ID_SVGA2) {
@@ -774,11 +773,9 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
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
 
@@ -856,7 +853,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	int ret;
 	enum vmw_res_type i;
 	bool refuse_dma = false;
-	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	vmw_sw_context_init(dev_priv);
 
@@ -872,7 +868,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		return ret;
 	ret = vmw_detect_version(dev_priv);
 	if (ret)
-		goto out_no_pci_or_version;
+		return ret;
 
 
 	for (i = vmw_res_context; i < vmw_res_max; ++i) {
@@ -1172,15 +1168,13 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 
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
@@ -1216,8 +1210,6 @@ static void vmw_driver_unload(struct drm_device *dev)
 		idr_destroy(&dev_priv->res_idr[i]);
 
 	vmw_mksstat_remove_all(dev_priv);
-
-	pci_release_regions(pdev);
 }
 
 static void vmw_postclose(struct drm_device *dev,
-- 
2.48.1

