Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390CAE70C4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 22:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2BF10E12E;
	Tue, 24 Jun 2025 20:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ahNBv4yX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B894110E126
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 20:31:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 989B3A52178;
 Tue, 24 Jun 2025 20:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E727DC4CEE3;
 Tue, 24 Jun 2025 20:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750797061;
 bh=IOGKTg8m2lLVk2BGnUQp473zWXZ7OF1rNECuXqPIWig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ahNBv4yX8EO99vKJpAvNS+O2urY2tr2R8zWfMAqNbjwnPVYnrZdWc/dwGv0x9pLbb
 X885lJNW7lnzd876SwCUVLV42FqkMym+ZPtzLIaf3IY/4LoiRGEEqtJs5o6O71+0f4
 gHKzrQZH2svf6dvve/GvThIwwx/TVS0MAZfXoqnfUq03mo/70wSdRq7eNnm/HpC9hc
 3o80ZxiOQ78TbRUELULMbqa3nELmCMyE9k/qnyc+aDzCsh1uwLBsbKk+Cx1BvvAw1U
 zu6VO57pGDjHaIFWB/FRxW6ZvoMdk7Fsq8Ia2EzhpBCemyFocEHS1DLVrtwuvxqCOj
 UJfebQuJX8xnQ==
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
 Takashi Iwai <tiwai@suse.de>, Simona Vetter <simona.vetter@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v5 5/9] ALSA: hda: Use pci_is_display()
Date: Tue, 24 Jun 2025 15:30:38 -0500
Message-ID: <20250624203042.1102346-6-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624203042.1102346-1-superm1@kernel.org>
References: <20250624203042.1102346-1-superm1@kernel.org>
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

The inline pci_is_display() helper does the same thing.  Use it.

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Daniel Dadap <ddadap@nvidia.com>
Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/hda/hdac_i915.c     | 2 +-
 sound/pci/hda/hda_intel.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index e9425213320ea..44438c799f957 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -155,7 +155,7 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
 
 	for_each_pci_dev(display_dev) {
 		if (display_dev->vendor != PCI_VENDOR_ID_INTEL ||
-		    (display_dev->class >> 16) != PCI_BASE_CLASS_DISPLAY)
+		    !pci_is_display(display_dev))
 			continue;
 
 		if (pci_match_id(denylist, display_dev))
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 439cf1bda6e66..75badb5c69b8e 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1465,7 +1465,7 @@ static struct pci_dev *get_bound_vga(struct pci_dev *pci)
 				 * the dGPU is the one who is involved in
 				 * vgaswitcheroo.
 				 */
-				if (((p->class >> 16) == PCI_BASE_CLASS_DISPLAY) &&
+				if (pci_is_display(p) &&
 				    (atpx_present() || apple_gmux_detect(NULL, NULL)))
 					return p;
 				pci_dev_put(p);
@@ -1477,7 +1477,7 @@ static struct pci_dev *get_bound_vga(struct pci_dev *pci)
 			p = pci_get_domain_bus_and_slot(pci_domain_nr(pci->bus),
 							pci->bus->number, 0);
 			if (p) {
-				if ((p->class >> 16) == PCI_BASE_CLASS_DISPLAY)
+				if (pci_is_display(p))
 					return p;
 				pci_dev_put(p);
 			}
-- 
2.43.0

