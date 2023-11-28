Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8024B7FB0E1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 05:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB9F10E083;
	Tue, 28 Nov 2023 04:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0D810E083;
 Tue, 28 Nov 2023 04:20:39 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AFDAE6602F24;
 Tue, 28 Nov 2023 04:20:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701145238;
 bh=7fSxGDZnsW945OhHzdjD18pn6g61ZX1COA3nPM0NjiM=;
 h=From:To:Cc:Subject:Date:From;
 b=C5yI5L+1A3s+ANaTjlz99sBe5M4MdamPv7frzOVtYF88ed02w+MlGFfbRmM7I9Otp
 Wj3/6y4U8wZRyF0JowkRmUCM/kAFWUMTlFyWwwEAHVm5oVUR7geeP4df2yZXNlg2c3
 A/8kN5ADGf/nHDMMkCLVygU8iDqvTqotquY0Ogcf3/HFa0AsBycBTYr+ePkQoGfoFn
 GGs6ns4UFim+o/ZISQkpU+S/RQDZ4G2ZdXopvAleHNKh5nEOMobKzlz5xn2mncB5zQ
 N4k/APQQTKwsjeuixlKsAXUWTzGDeieE3wDs0tT9aKSYVLjQsYEW1zsK1eDMbiTMD5
 Rv2EvAnrJcxuA==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] PCI: qcom: Fix compile error
Date: Tue, 28 Nov 2023 09:50:26 +0530
Message-Id: <20231128042026.130442-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
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
Cc: linux-pci@vger.kernel.org, helen.koike@collabora.com, daniels@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit a2458d8f618a ("PCI/ASPM: pci_enable_link_state: Add argument
to acquire bus lock") has added an argument to acquire bus lock
in pci_enable_link_state, but qcom_pcie_enable_aspm calls it
without this argument, resulting in below build error.

drivers/pci/controller/dwc/pcie-qcom.c:973:9: error: too few arguments to function 'pci_enable_link_state'

This commit fixes the compilation error by passing the sem argument
to pci_enable_link_state in the qcom_pcie_enable_aspm function.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 6902e97719d1..e846e3531d8e 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -970,7 +970,7 @@ static int qcom_pcie_enable_aspm(struct pci_dev *pdev, void *userdata)
 {
 	/* Downstream devices need to be in D0 state before enabling PCI PM substates */
 	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_link_state(pdev, PCIE_LINK_STATE_ALL);
+	pci_enable_link_state(pdev, PCIE_LINK_STATE_ALL, false);
 
 	return 0;
 }
-- 
2.40.1

