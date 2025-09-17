Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F4B81FD0
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 23:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC4010E59A;
	Wed, 17 Sep 2025 21:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M81DRi0n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA2710E598
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 21:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758145073; x=1789681073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/iMfp8vig0mHKZAxlSf/u9heZ6hDxMUA6/Hx0ZTiPiQ=;
 b=M81DRi0ndSy1E+S/rGZqXlczcbPogyz+rseJpFlUkzIdaDL/1IH5/qfm
 oSoFbHXaDct0gddjEJBCPoly15f/CZ3ud/vYvEh1f1lNwU8yRcAVePIEx
 FdnmZOGLDuPwD8m4T1NfkU2Gw+H7w6WScPAxtMDyOZA5UQ87CIEW+Uu56
 Pv5xLULIkY7KGL3eNxqCHLKumW1ibhyfxmbiQYl8LVyE9efUbKVsOEHrV
 4pBBdi3T0IoDc7hfGM4m7abv0MoyuMjYKFivK9jIhdVFSrhvfuDWT7YOh
 ZJKbn4MGaqDQv0XbanX58tIr3fPoEdS0XvViXztRbjDUBaCcVEFv4jam6 Q==;
X-CSE-ConnectionGUID: H00fXPDWQoeZ6EMw47d7BA==
X-CSE-MsgGUID: dcGLZaoLT2SAPtBsAYdrXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60522748"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60522748"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 14:37:52 -0700
X-CSE-ConnectionGUID: 9fkasHJuSRGIKizPq+iZIw==
X-CSE-MsgGUID: LdqgF4PBQ5SC9hf53RAd3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; d="scan'208";a="179643054"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 14:37:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 1/3] PCI: Release BAR0 of an integrated bridge to allow GPU
 BAR resize
Date: Wed, 17 Sep 2025 14:37:30 -0700
Message-ID: <20250917-xe-pci-rebar-2-v1-1-005daa7c19be@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
References: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Resizing BAR to a larger size has to release upstream bridge windows in
order make the bridge windows larger as well (and to potential relocate
them into a larger free block within iomem space). Some GPUs have an
integrated PCI switch that has BAR0. The resource allocation assigns
space for that BAR0 as it does for any resource.

An extra resource on a bridge will pin its upstream bridge window in
place which prevents BAR resize for anything beneath that bridge.

Nothing in the pcieport driver provided by PCI core, which typically is
the driver bound to these bridges, requires that BAR0. Because of that,
releasing the extra BAR does not seem to have notable downsides but
comes with a clear upside.

Therefore, release BAR0 of such switches using a quirk and clear its
flags to prevent any new invocation of the resource assignment
algorithm from assigning the resource again.

Due to other siblings within the PCI hierarchy of all the devices
integrated into the GPU, some other devices may still have to be
manually removed before the resize is free of any bridge window pins.
Such siblings can be released through sysfs to unpin windows while
leaving access to GPU's sysfs entries required for initiating the
resize operation, whereas removing the topmost bridge this quirk
targets would result in removing the GPU device as well so no manual
workaround for this problem exists.

Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # 6.12+
Link: https://lore.kernel.org/linux-pci/fl6tx5ztvttg7txmz2ps7oyd745wg3lwcp3h7esmvnyg26n44y@owo2ojiu2mov/
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/pci/quirks.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index d97335a401930..98a4f0a1285be 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -6338,3 +6338,23 @@ static void pci_mask_replay_timer_timeout(struct pci_dev *pdev)
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9750, pci_mask_replay_timer_timeout);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9755, pci_mask_replay_timer_timeout);
 #endif
+
+/*
+ * PCI switches integrated into some GPUs have BAR0 that prevents resizing
+ * the BARs of the GPU device due to that bridge BAR0 pinning the bridge
+ * window it's under in place. Nothing in pcieport requires that BAR0.
+ *
+ * Release and disable BAR0 permanently by clearing its flags to prevent
+ * anything from assigning it again.
+ */
+static void pci_release_bar0(struct pci_dev *pdev)
+{
+	struct resource *res = pci_resource_n(pdev, 0);
+
+	if (!res->parent)
+		return;
+
+	pci_release_resource(pdev, 0);
+	res->flags = 0;
+}
+DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0xe2ff, pci_release_bar0);

-- 
2.50.1

