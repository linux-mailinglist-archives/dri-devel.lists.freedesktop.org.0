Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E708EAE113B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 04:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF4210EA84;
	Fri, 20 Jun 2025 02:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S5eMEaVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D938A10EA84
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 02:50:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 827564AD78;
 Fri, 20 Jun 2025 02:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171DFC4CEF0;
 Fri, 20 Jun 2025 02:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750387802;
 bh=dwUS0NNQBo6ioFvBv9MvL8ShjmESObZeByXZvWYMJKk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S5eMEaVxgF6txdm4vtGRsHjfa187clMuzbb7RyDkJvhG9ytlzIHxdMPQMDvaCRMyF
 k3kbmtGJIx/Dw3x6wNYXGQtjOVfa0MJEfjJfKGYLMXpO9sevsDhCzLmWcN5VR09BO7
 Hw5Bq/N+1TUPCaohwxvPbT+cB7D7YvWHCgOnQ1IawQt4WkoqfyLbOnKG2gtRMtr4O1
 1xSDfo4Zqyges6lQDtyHHvqhVJI3mDnZbOmZ+KNMWWjvHmagR3l2sggLK7VOD9RJVZ
 wlA+Ed4ApaqraFxNxpt7ldfKtefWB02TbNb5lh1ldFHWlsoJpZzQm4WYzVXuALKKwp
 VmaGadYzYXC1g==
From: Mario Limonciello <superm1@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 iommu@lists.linux.dev (open list:INTEL IOMMU (VT-d)),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 kvm@vger.kernel.org (open list:VFIO DRIVER),
 linux-sound@vger.kernel.org (open list:SOUND),
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v3 1/7] PCI: Add helper for checking if a PCI device is a
 display controller
Date: Thu, 19 Jun 2025 21:49:37 -0500
Message-ID: <20250620024943.3415685-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620024943.3415685-1-superm1@kernel.org>
References: <20250620024943.3415685-1-superm1@kernel.org>
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

From: Mario Limonciello <mario.limonciello@amd.com>

Several places in the kernel do class shifting to match whether a
PCI device is display class.  Introduce a helper for those places to
use.

Reviewed-by: Daniel Dadap <ddadap@nvidia.com>
Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 include/linux/pci.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 05e68f35f3923..e77754e43c629 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -744,6 +744,21 @@ static inline bool pci_is_vga(struct pci_dev *pdev)
 	return false;
 }
 
+/**
+ * pci_is_display - Check if a PCI device is a display controller
+ * @pdev: Pointer to the PCI device structure
+ *
+ * This function determines whether the given PCI device corresponds
+ * to a display controller. Display controllers are typically used
+ * for graphical output and are identified based on their class code.
+ *
+ * Return: true if the PCI device is a display controller, false otherwise.
+ */
+static inline bool pci_is_display(struct pci_dev *pdev)
+{
+	return (pdev->class >> 16) == PCI_BASE_CLASS_DISPLAY;
+}
+
 #define for_each_pci_bridge(dev, bus)				\
 	list_for_each_entry(dev, &bus->devices, bus_list)	\
 		if (!pci_is_bridge(dev)) {} else
-- 
2.43.0

