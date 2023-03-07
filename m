Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BA96AF6B0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 21:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA9B10E548;
	Tue,  7 Mar 2023 20:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7B410E548
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 20:27:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6E9161544;
 Tue,  7 Mar 2023 20:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E4BC433A4;
 Tue,  7 Mar 2023 20:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678220852;
 bh=vizWD6a5JSdbywtnVxbUOoJJmX8KvhVFdJlgxGmYpX4=;
 h=From:To:Cc:Subject:Date:From;
 b=UhoOPB1btWUDvIf/P8/unvroVvfLmOxbBItIjVp6BKzNZrh4xNvaYT7/aTyfbg+Sm
 /AR6PmyJM+qkC16itywHChLEEuU9pdPG8dkON2fl/ZUBX3T9NG+ogFHTvre/RINMs7
 txWejxi/6r46rn2Am4N7PlJbGCRcz809+oQ8BhNgLKc/ADnap/X6IO6rLOPE+oRe6x
 6npRvmWzNLjvqN73XzIF7iPZA7qGi7eIArBGoJpKXpkrCVfGvWaKoAun9OF9E5HxCz
 H3VG8ddO6f/9xtXSSccmU63hNk+L78JnORk/XuG9ZwvYl2SkmLYOzc6pucFVI6u1hj
 BT6G42gOkZBsA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH] habanalabs: Drop redundant pci_enable_pcie_error_reporting()
Date: Tue,  7 Mar 2023 14:27:29 -0600
Message-Id: <20230307202729.881391-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

pci_enable_pcie_error_reporting() enables the device to send ERR_*
Messages.  Since f26e58bf6f54 ("PCI/AER: Enable error reporting when AER is
native"), the PCI core does this for all devices during enumeration, so the
driver doesn't need to do it itself.

Remove the redundant pci_enable_pcie_error_reporting() call from the
driver.  Also remove the corresponding pci_disable_pcie_error_reporting()
from the driver .remove() path.

Note that this only controls ERR_* Messages from the device.  An ERR_*
Message may cause the Root Port to generate an interrupt, depending on the
AER Root Error Command register managed by the AER service driver.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/accel/habanalabs/common/habanalabs_drv.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index 03dae57dc838..26f65aa21079 100644
--- a/drivers/accel/habanalabs/common/habanalabs_drv.c
+++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
@@ -12,7 +12,6 @@
 #include "../include/hw_ip/pci/pci_general.h"
 
 #include <linux/pci.h>
-#include <linux/aer.h>
 #include <linux/module.h>
 
 #define CREATE_TRACE_POINTS
@@ -550,8 +549,6 @@ static int hl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	pci_set_drvdata(pdev, hdev);
 
-	pci_enable_pcie_error_reporting(pdev);
-
 	rc = hl_device_init(hdev, hl_class);
 	if (rc) {
 		dev_err(&pdev->dev, "Fatal error during habanalabs device init\n");
@@ -562,7 +559,6 @@ static int hl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return 0;
 
 disable_device:
-	pci_disable_pcie_error_reporting(pdev);
 	pci_set_drvdata(pdev, NULL);
 	destroy_hdev(hdev);
 
@@ -585,7 +581,6 @@ static void hl_pci_remove(struct pci_dev *pdev)
 		return;
 
 	hl_device_fini(hdev);
-	pci_disable_pcie_error_reporting(pdev);
 	pci_set_drvdata(pdev, NULL);
 	destroy_hdev(hdev);
 }
-- 
2.25.1

