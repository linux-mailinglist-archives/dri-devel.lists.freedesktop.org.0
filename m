Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB9A9A59DE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 07:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD0C10E282;
	Mon, 21 Oct 2024 05:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EeglAzui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82A710E0A1;
 Mon, 21 Oct 2024 05:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729489568; x=1761025568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uV5snUpY10mY+ieUbO0PLEKGL0amDrpA0hEcIDbiYHY=;
 b=EeglAzuiNVpbvlwWacQ/9cxOm0lXxy+Dd1gjxa8XhGeE9LYhNqtJiHdx
 QkPhZkQiDz8qn9qh0Tt4MgVbbqri+shD/sfsRZM1hfQivo/Ux45Es1Oh4
 HlGVLUnKxxydzVEJ++Affw2s10zMPVDcuEZnkE8YKz4fYCepqejrjbJEB
 Ix/SCXBRR+F5hYTWBG5QmDB/QS0iW57/shlB3OjovejEH43BBCiL5uKEG
 lSyoNer8N2oW2iOq+zBJoEJr5MGYWy9pzWgOKQAN9T0TGUEhXpljFK9i/
 pv9C5Unt6mXjXCGwzDWBavFwtk8L+CAxko9AJMmXnqDAsvTiIHvHCMWj/ w==;
X-CSE-ConnectionGUID: a5uH6u7CT/+2v/f1pOCZfg==
X-CSE-MsgGUID: Q8c8ePuQQ2W8tcAbHzzlbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40345940"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40345940"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 22:46:06 -0700
X-CSE-ConnectionGUID: UcI3brXwTsOUey9oPpOkNQ==
X-CSE-MsgGUID: ER72puDBRjKLn/Fy7mxSSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="110180207"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 22:46:05 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 linux-pci@vger.kernel.org
Subject: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions of
 same device
Date: Sun, 20 Oct 2024 22:21:29 -0700
Message-ID: <20241021052236.1820329-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
References: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
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

Functions of the same PCI device (such as a PF and a VF) share the
same bus and have a common root port and typically, the PF provisions
resources for the VF. Therefore, they can be considered compatible
as far as P2P access is considered.

Currently, although the distance (2) is correctly calculated for
functions of the same device, an ACS check failure prevents P2P DMA
access between them. Therefore, introduce a small function named
pci_devs_are_p2pdma_compatible() to determine if the provider and
client belong to the same device and facilitate P2P DMA between
them by not enforcing the ACS check.

v2:
- Relax the enforcment of ACS check only for Intel GPU functions
  as they are P2PDMA compatible given the way the PF provisions
  the resources among multiple VFs.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Logan Gunthorpe <logang@deltatee.com>
Cc: <linux-pci@vger.kernel.org>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/pci/p2pdma.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 4f47a13cb500..a230e661f939 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -535,6 +535,17 @@ static unsigned long map_types_idx(struct pci_dev *client)
 	return (pci_domain_nr(client->bus) << 16) | pci_dev_id(client);
 }
 
+static bool pci_devs_are_p2pdma_compatible(struct pci_dev *provider,
+					   struct pci_dev *client)
+{
+	if (provider->vendor == PCI_VENDOR_ID_INTEL) {
+		if (pci_is_vga(provider) && pci_is_vga(client))
+			return pci_physfn(provider) == pci_physfn(client);
+	}
+
+	return false;
+}
+
 /*
  * Calculate the P2PDMA mapping type and distance between two PCI devices.
  *
@@ -634,7 +645,7 @@ calc_map_type_and_dist(struct pci_dev *provider, struct pci_dev *client,
 
 	*dist = dist_a + dist_b;
 
-	if (!acs_cnt) {
+	if (!acs_cnt || pci_devs_are_p2pdma_compatible(provider, client)) {
 		map_type = PCI_P2PDMA_MAP_BUS_ADDR;
 		goto done;
 	}
@@ -696,7 +707,9 @@ int pci_p2pdma_distance_many(struct pci_dev *provider, struct device **clients,
 		return -1;
 
 	for (i = 0; i < num_clients; i++) {
-		pci_client = find_parent_pci_dev(clients[i]);
+		pci_client = dev_is_pf(clients[i]) ?
+				pci_dev_get(to_pci_dev(clients[i])) :
+				find_parent_pci_dev(clients[i]);
 		if (!pci_client) {
 			if (verbose)
 				dev_warn(clients[i],
-- 
2.45.1

