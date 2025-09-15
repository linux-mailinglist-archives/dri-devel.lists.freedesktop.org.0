Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBDAB5715B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 09:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCF310E2DD;
	Mon, 15 Sep 2025 07:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3VjJxQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C909110E2DE;
 Mon, 15 Sep 2025 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757921146; x=1789457146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wf6AmfdZuUm+bu7vdIAmlnLFqbZGHBquu6XMq5py88o=;
 b=T3VjJxQFoQuL1F7m5QMKfQCPLoSnyNCSR/RN/jHcEdZBm1xVQMephQ4S
 i6Zcza82Q0B7wZe3NFkHTQ/DBclzlo/Goox4P1VoVxoGD6XnCu1A5vyZm
 CbKM6l3Oo7MTNnXqDIXRs/mgY8+cbuQ11V3VxBqAvSCj0yrr9emvmIXOJ
 e8HrsK3Og+3ZRqNcl5bWlEwBUU/xnzS+Pofyfod3vGxNtat8JG3MeP+ql
 gOAGfa0zbTXOEO+yIp5e/ItyS5t6H8k2D2eG8qSI6MX4jFnlrc83UZa5u
 qlENNnaD4Y6r3uZhRaXdmKwUJEZHbUSnf6kZqPhshkayTCI026yFSy5hz A==;
X-CSE-ConnectionGUID: nip4sbVERKGQGA+oOj4duw==
X-CSE-MsgGUID: UUIBQ4jjR4+Z0Cv0B10njg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="77619119"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="77619119"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:25:45 -0700
X-CSE-ConnectionGUID: I7VBVupQTsiDaJk+sMvDTA==
X-CSE-MsgGUID: IZzsyGQNSjKqBqZ0WGoraw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="211693865"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:25:46 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 linux-pci@vger.kernel.org
Subject: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Date: Mon, 15 Sep 2025 00:21:05 -0700
Message-ID: <20250915072428.1712837-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
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

Typically, functions of the same PCI device (such as a PF and a VF)
share the same bus and have a common root port and the PF provisions
resources for the VF. Given this model, they can be considered
compatible as far as P2PDMA access is considered.

Currently, although the distance (2) is correctly calculated for
functions of the same device, an ACS check failure prevents P2P DMA
access between them. Therefore, introduce a small function named
pci_devfns_support_p2pdma() to determine if the provider and client
belong to the same device and facilitate P2PDMA between them by
not enforcing the ACS check.

However, since it is hard to determine if the device functions of
any given PCI device are P2PDMA compatible, we only relax the ACS
check enforcement for device functions of Intel GPUs. This is
because the P2PDMA communication between the PF and VF of Intel
GPUs is handled internally and does not typically involve the PCIe
fabric.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Logan Gunthorpe <logang@deltatee.com>
Cc: <linux-pci@vger.kernel.org>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
v1 -> v2:
- Relax the enforcment of ACS check only for Intel GPU functions
  as they are P2PDMA compatible given the way the PF provisions
  the resources among multiple VFs.

v2 -> v3:
- s/pci_devs_are_p2pdma_compatible/pci_devfns_support_p2pdma
- Improve the commit message to explain the reasoning behind
  relaxing the ACS check enforcement only for Intel GPU functions.

v3 -> v4: (Logan)
- Drop the dev_is_pf() hunk as no special handling is needed for PFs
- Besides the provider, also check to see the client is an Intel GPU
---
 drivers/pci/p2pdma.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index da5657a02007..0a1d884cd0ff 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -544,6 +544,19 @@ static unsigned long map_types_idx(struct pci_dev *client)
 	return (pci_domain_nr(client->bus) << 16) | pci_dev_id(client);
 }
 
+static bool pci_devfns_support_p2pdma(struct pci_dev *provider,
+				      struct pci_dev *client)
+{
+	if (provider->vendor == PCI_VENDOR_ID_INTEL &&
+	    client->vendor == PCI_VENDOR_ID_INTEL) {
+		if ((pci_is_vga(provider) && pci_is_vga(client)) ||
+		    (pci_is_display(provider) && pci_is_display(client)))
+			return pci_physfn(provider) == pci_physfn(client);
+	}
+
+	return false;
+}
+
 /*
  * Calculate the P2PDMA mapping type and distance between two PCI devices.
  *
@@ -643,7 +656,7 @@ calc_map_type_and_dist(struct pci_dev *provider, struct pci_dev *client,
 
 	*dist = dist_a + dist_b;
 
-	if (!acs_cnt) {
+	if (!acs_cnt || pci_devfns_support_p2pdma(provider, client)) {
 		map_type = PCI_P2PDMA_MAP_BUS_ADDR;
 		goto done;
 	}
-- 
2.50.1

