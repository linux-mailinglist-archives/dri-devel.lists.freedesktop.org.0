Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C126D4435
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 14:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CAD10E16A;
	Mon,  3 Apr 2023 12:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA2F10E16A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 12:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680524189; x=1712060189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=whNP+0koM8deNDJey5OeUVBeeth6de3kWBBSNYmIzFA=;
 b=JkoYkMahciA3PwIfvEgA4vkUn7eqgCCoj34tLF7yt/u70k1h0KcntN8q
 y/dYdZDoUT3H+1NEkciLFxLkrdQGeZI6CLMWphG+95NB396JpSvpmDDGY
 bkFSTix0IYZ+cjn4wGsDxL665ZmcN+1mc5xh9Xo7sP9o/yRWi1/++iK2/
 N9Q5C0ykwVCjxZ9NVIlZ2eXjTG/+SYq5aObNX/078sAzJXacdcAg/7ml5
 i7CiGwNk7HTyPOWzexS5KdaHR+5K4nP8Rms+jOfueKUAWVbDthKPoxsym
 VrDI+aTlBtIznQO6eeXRF8Y7zdOQ/8g2k/w8wsCsWTqCuxzLt3LfqX3xB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="330452336"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="330452336"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 05:16:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="718529676"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="718529676"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 05:16:26 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] accel/ivpu: Remove D3hot delay for Meteorlake
Date: Mon,  3 Apr 2023 14:15:45 +0200
Message-Id: <20230403121545.2995279-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-pci@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

VPU on MTL has hardware optimizations and does not require 10ms
D0 - D3hot transition delay imposed by PCI specification (PCIe
r6.0, sec 5.9.) .

The delay removal is traditionally done by adding PCI ID to
quirk_remove_d3hot_delay() in drivers/pci/quirks.c . But since
we do not need that optimization before driver probe and we
can better specify in the ivpu driver on what (future) hardware
use the optimization, we do not use quirk_remove_d3hot_delay()
for that.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
v2: improve commit log message

 drivers/accel/ivpu/ivpu_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 3be4a5a2b07a..cf9925c0a8ad 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -442,6 +442,10 @@ static int ivpu_pci_init(struct ivpu_device *vdev)
 	/* Clear any pending errors */
 	pcie_capability_clear_word(pdev, PCI_EXP_DEVSTA, 0x3f);
 
+	/* VPU MTL does not require PCI spec 10m D3hot delay */
+	if (ivpu_is_mtl(vdev))
+		pdev->d3hot_delay = 0;
+
 	ret = pcim_enable_device(pdev);
 	if (ret) {
 		ivpu_err(vdev, "Failed to enable PCI device: %d\n", ret);
-- 
2.25.1

