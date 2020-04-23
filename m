Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195431B55DF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E3C6E2E2;
	Thu, 23 Apr 2020 07:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBC36E14B;
 Thu, 23 Apr 2020 06:24:06 +0000 (UTC)
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1jRVHG-0000u2-Ic; Thu, 23 Apr 2020 06:24:03 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bskeggs@redhat.com
Subject: [PATCH 1/1] drm/nouveau: Use generic helper to check _PR3 presence
Date: Thu, 23 Apr 2020 14:23:58 +0800
Message-Id: <20200423062358.1810-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace nouveau_pr3_present() in favor of a more generic one,
pci_pr3_present().

Also the presence of upstream bridge _PR3 doesn't need to go hand in
hand with device's _DSM, so check _PR3 before _DSM.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/gpu/drm/nouveau/nouveau_acpi.c | 44 ++++++--------------------
 1 file changed, 10 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index fe3a10255c36..b84dff1b0f28 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -212,37 +212,6 @@ static const struct vga_switcheroo_handler nouveau_dsm_handler = {
 	.get_client_id = nouveau_dsm_get_client_id,
 };
 
-/*
- * Firmware supporting Windows 8 or later do not use _DSM to put the device into
- * D3cold, they instead rely on disabling power resources on the parent.
- */
-static bool nouveau_pr3_present(struct pci_dev *pdev)
-{
-	struct pci_dev *parent_pdev = pci_upstream_bridge(pdev);
-	struct acpi_device *parent_adev;
-
-	if (!parent_pdev)
-		return false;
-
-	if (!parent_pdev->bridge_d3) {
-		/*
-		 * Parent PCI bridge is currently not power managed.
-		 * Since userspace can change these afterwards to be on
-		 * the safe side we stick with _DSM and prevent usage of
-		 * _PR3 from the bridge.
-		 */
-		pci_d3cold_disable(pdev);
-		return false;
-	}
-
-	parent_adev = ACPI_COMPANION(&parent_pdev->dev);
-	if (!parent_adev)
-		return false;
-
-	return parent_adev->power.flags.power_resources &&
-		acpi_has_method(parent_adev->handle, "_PR3");
-}
-
 static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out,
 				  bool *has_mux, bool *has_opt,
 				  bool *has_opt_flags, bool *has_pr3)
@@ -250,6 +219,16 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
 	acpi_handle dhandle;
 	bool supports_mux;
 	int optimus_funcs;
+	struct pci_dev *parent_pdev;
+
+	*has_pr3 = false;
+	parent_pdev = pci_upstream_bridge(pdev);
+	if (parent_pdev) {
+		if (parent_pdev->bridge_d3)
+			*has_pr3 = pci_pr3_present(parent_pdev);
+		else
+			pci_d3cold_disable(pdev);
+	}
 
 	dhandle = ACPI_HANDLE(&pdev->dev);
 	if (!dhandle)
@@ -270,7 +249,6 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
 	*has_mux = supports_mux;
 	*has_opt = !!optimus_funcs;
 	*has_opt_flags = optimus_funcs & (1 << NOUVEAU_DSM_OPTIMUS_FLAGS);
-	*has_pr3 = false;
 
 	if (optimus_funcs) {
 		uint32_t result;
@@ -280,8 +258,6 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
 			 (result & OPTIMUS_ENABLED) ? "enabled" : "disabled",
 			 (result & OPTIMUS_DYNAMIC_PWR_CAP) ? "dynamic power, " : "",
 			 (result & OPTIMUS_HDA_CODEC_MASK) ? "hda bios codec supported" : "");
-
-		*has_pr3 = nouveau_pr3_present(pdev);
 	}
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
