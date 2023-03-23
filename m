Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2526C61E2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 09:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D6410E341;
	Thu, 23 Mar 2023 08:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-29.mta1.migadu.com (out-29.mta1.migadu.com [95.215.58.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF5910E341
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 08:35:59 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1679560557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=sR3yPTtRDVj1xoPJWPkU1xtU6p71nBTQtzFAzgAXTAM=;
 b=aPn5X1CDLNGicO++xOTkolNf/4Uw7IjGooBgYaR1whX2aspiUAaolHbmudZtyPshdQLFP0
 fJY3I+uyqublkl7FC6ehPI+9HsohOvYbxM+ecTX/IZ19buHUPFHHCR1ZiqHI5Dl8iYRip1
 fJBODkoL2vICZ6cHnXb92wg9orz9H3w=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Subject: [PATCH] accel/habanalabs: Remove redundant pci_clear_master
Date: Thu, 23 Mar 2023 16:35:49 +0800
Message-Id: <20230323083553.16864-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Oded Gabbay <ogabbay@kernel.org>, Tomer Tayar <ttayar@habana.ai>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove pci_clear_master to simplify the code,
the bus-mastering is also cleared in do_pci_disable_device,
like this:
./drivers/pci/pci.c:2197
static void do_pci_disable_device(struct pci_dev *dev)
{
	u16 pci_command;

	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
	if (pci_command & PCI_COMMAND_MASTER) {
		pci_command &= ~PCI_COMMAND_MASTER;
		pci_write_config_word(dev, PCI_COMMAND, pci_command);
	}

	pcibios_disable_device(dev);
}.
And dev->is_busmaster is set to 0 in pci_disable_device.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 drivers/accel/habanalabs/common/device.c  | 1 -
 drivers/accel/habanalabs/common/pci/pci.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 713005998cbc..2fb1e2ec3a83 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1271,7 +1271,6 @@ int hl_device_resume(struct hl_device *hdev)
 	return 0;
 
 disable_device:
-	pci_clear_master(hdev->pdev);
 	pci_disable_device(hdev->pdev);
 
 	return rc;
diff --git a/drivers/accel/habanalabs/common/pci/pci.c b/drivers/accel/habanalabs/common/pci/pci.c
index d1f4c695baf2..191e0e3cf3a5 100644
--- a/drivers/accel/habanalabs/common/pci/pci.c
+++ b/drivers/accel/habanalabs/common/pci/pci.c
@@ -420,7 +420,6 @@ int hl_pci_init(struct hl_device *hdev)
 unmap_pci_bars:
 	hl_pci_bars_unmap(hdev);
 disable_device:
-	pci_clear_master(pdev);
 	pci_disable_device(pdev);
 
 	return rc;
@@ -436,6 +435,5 @@ void hl_pci_fini(struct hl_device *hdev)
 {
 	hl_pci_bars_unmap(hdev);
 
-	pci_clear_master(hdev->pdev);
 	pci_disable_device(hdev->pdev);
 }
-- 
2.34.1

