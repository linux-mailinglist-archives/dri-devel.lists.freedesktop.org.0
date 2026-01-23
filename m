Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBoHLDkQc2klsAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 07:07:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E90C70BAE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 07:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED3A10E24E;
	Fri, 23 Jan 2026 06:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2990310E230;
 Fri, 23 Jan 2026 06:07:44 +0000 (UTC)
Received: from [127.0.0.2] (unknown [210.73.43.101])
 by APP-05 (Coremail) with SMTP id zQCowACnPBAiEHNp9tMuBg--.1678S3;
 Fri, 23 Jan 2026 14:07:32 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Fri, 23 Jan 2026 14:07:28 +0800
Subject: [PATCH v3 1/4] PCI/MSI: Conservatively generalize no_64bit_msi
 into msi_addr_mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-pci-msi-addr-mask-v3-1-9f9baa048524@iscas.ac.cn>
References: <20260123-pci-msi-addr-mask-v3-0-9f9baa048524@iscas.ac.cn>
In-Reply-To: <20260123-pci-msi-addr-mask-v3-0-9f9baa048524@iscas.ac.cn>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "Creeley, Brett" <bcreeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Thomas Gleixner <tglx@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
 Takashi Iwai <tiwai@suse.de>
X-Mailer: b4 0.14.3
X-CM-TRANSID: zQCowACnPBAiEHNp9tMuBg--.1678S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtF17JryDZw4UKrykKr15Jwb_yoW3Wr45pa
 yDCFWfKrWrK3yUJayqy3WUuF13Xan093yfWrWUK3sa93ZIvFyUXFn7try7Jwn7XrsrCF1a
 vFyUKw4UWFnxX3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
 v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
 6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
 AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
 2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
 vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
 vjDU0xZFpf9x0pRVOJOUUUUU=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[iscas.ac.cn];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangruikang@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: 5E90C70BAE
X-Rspamd-Action: no action

Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
implement less than 64 address bits. This breaks on platforms where such
a device is assigned an MSI address higher than what's reachable.

Currently, we deal with this with a single no_64bit_msi flag, and
(notably on powerpc) forces 32-bit MSI address for these devices.
However, on some platforms the MSI doorbell address is above 32-bit but
within device ability.

As a first step to enabling MSI on those combinations of devices and
platforms, conservatively generalize the single-bit flag no_64bit_msi
into msi_addr_mask. (The name msi_addr_mask is chosen to avoid confusion
with msi_mask.)

The translation is essentially:

- no_64bit_msi = 1    ->    msi_addr_mask = DMA_BIT_MASK(32)
- no_64bit_msi = 0    ->    msi_addr_mask = DMA_BIT_MASK(64)
- if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))

Since no values other than DMA_BIT_MASK(32) and DMA_BIT_MASK(64) is
used, no functional change is intended. Future patches that make use of
intermediate values of msi_addr_mask will follow, allowing devices that
cannot use full 64-bit addresses for MSI to work on platforms with MSI
doorbell above 32-bit address space.

Acked-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
v3: Add Acked-by, no code changes

checkpatch complains about the comment include/linux/pci.h, which I have
formatted similarly with other comments in the vicinity.
---
 arch/powerpc/platforms/powernv/pci-ioda.c           | 2 +-
 arch/powerpc/platforms/pseries/msi.c                | 4 ++--
 drivers/gpu/drm/radeon/radeon_irq_kms.c             | 2 +-
 drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c | 2 +-
 drivers/pci/msi/msi.c                               | 2 +-
 drivers/pci/msi/pcidev_msi.c                        | 2 +-
 drivers/pci/probe.c                                 | 7 +++++++
 include/linux/pci.h                                 | 8 +++++++-
 sound/hda/controllers/intel.c                       | 2 +-
 9 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index b0c1d9d16fb5..1c78fdfb7b03 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1666,7 +1666,7 @@ static int __pnv_pci_ioda_msi_setup(struct pnv_phb *phb, struct pci_dev *dev,
 		return -ENXIO;
 
 	/* Force 32-bit MSI on some broken devices */
-	if (dev->no_64bit_msi)
+	if (dev->msi_addr_mask < DMA_BIT_MASK(64))
 		is_64 = 0;
 
 	/* Assign XIVE to PE */
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index a82aaa786e9e..7473c7ca1db0 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -383,7 +383,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int type,
 	 */
 again:
 	if (type == PCI_CAP_ID_MSI) {
-		if (pdev->no_64bit_msi) {
+		if (pdev->msi_addr_mask < DMA_BIT_MASK(64)) {
 			rc = rtas_change_msi(pdn, RTAS_CHANGE_32MSI_FN, nvec);
 			if (rc < 0) {
 				/*
@@ -409,7 +409,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int type,
 		if (use_32bit_msi_hack && rc > 0)
 			rtas_hack_32bit_msi_gen2(pdev);
 	} else {
-		if (pdev->no_64bit_msi)
+		if (pdev->msi_addr_mask < DMA_BIT_MASK(64))
 			rc = rtas_change_msi(pdn, RTAS_CHANGE_32MSIX_FN, nvec);
 		else
 			rc = rtas_change_msi(pdn, RTAS_CHANGE_MSIX_FN, nvec);
diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
index 9961251b44ba..d550554a6f3f 100644
--- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
@@ -252,7 +252,7 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
 	 */
 	if (rdev->family < CHIP_BONAIRE) {
 		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
-		rdev->pdev->no_64bit_msi = 1;
+		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(32);
 	}
 
 	/* force MSI on */
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
index 70d86c5f52fb..0671deae9a28 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
@@ -331,7 +331,7 @@ static int ionic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 #ifdef CONFIG_PPC64
 	/* Ensure MSI/MSI-X interrupts lie within addressable physical memory */
-	pdev->no_64bit_msi = 1;
+	pdev->msi_addr_mask = DMA_BIT_MASK(32);
 #endif
 
 	err = ionic_setup_one(ionic);
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 34d664139f48..48f5f03d1479 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -322,7 +322,7 @@ static int msi_verify_entries(struct pci_dev *dev)
 {
 	struct msi_desc *entry;
 
-	if (!dev->no_64bit_msi)
+	if (dev->msi_addr_mask == DMA_BIT_MASK(64))
 		return 0;
 
 	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
diff --git a/drivers/pci/msi/pcidev_msi.c b/drivers/pci/msi/pcidev_msi.c
index 5520aff53b56..0b0346813092 100644
--- a/drivers/pci/msi/pcidev_msi.c
+++ b/drivers/pci/msi/pcidev_msi.c
@@ -24,7 +24,7 @@ void pci_msi_init(struct pci_dev *dev)
 	}
 
 	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
-		dev->no_64bit_msi = 1;
+		dev->msi_addr_mask = DMA_BIT_MASK(32);
 }
 
 void pci_msix_init(struct pci_dev *dev)
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 41183aed8f5d..a2bff57176a3 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2047,6 +2047,13 @@ int pci_setup_device(struct pci_dev *dev)
 	 */
 	dev->dma_mask = 0xffffffff;
 
+	/*
+	 * Assume 64-bit addresses for MSI initially. Will be changed to 32-bit
+	 * if MSI (rather than MSI-X) capability does not have
+	 * PCI_MSI_FLAGS_64BIT. Can also be overridden by driver.
+	 */
+	dev->msi_addr_mask = DMA_BIT_MASK(64);
+
 	dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(dev->bus),
 		     dev->bus->number, PCI_SLOT(dev->devfn),
 		     PCI_FUNC(dev->devfn));
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 864775651c6f..0fe32fef0331 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -377,6 +377,13 @@ struct pci_dev {
 					   0xffffffff.  You only need to change
 					   this if your device has broken DMA
 					   or supports 64-bit transfers.  */
+	u64		msi_addr_mask;	/* Mask of the bits of bus address for
+					   MSI that this device implements.
+					   Normally set based on device
+					   capabilities. You only need to
+					   change this if your device claims
+					   to support 64-bit MSI but implements
+					   fewer than 64 address bits. */
 
 	struct device_dma_parameters dma_parms;
 
@@ -441,7 +448,6 @@ struct pci_dev {
 
 	unsigned int	is_busmaster:1;		/* Is busmaster */
 	unsigned int	no_msi:1;		/* May not use MSI */
-	unsigned int	no_64bit_msi:1;		/* May only use 32-bit MSIs */
 	unsigned int	block_cfg_access:1;	/* Config space access blocked */
 	unsigned int	broken_parity_status:1;	/* Generates false positive parity */
 	unsigned int	irq_reroute_variant:2;	/* Needs IRQ rerouting variant */
diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 1e8e3d61291a..c9542ebdf7e2 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1905,7 +1905,7 @@ static int azx_first_init(struct azx *chip)
 
 	if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
 		dev_dbg(card->dev, "Disabling 64bit MSI\n");
-		pci->no_64bit_msi = true;
+		pci->msi_addr_mask = DMA_BIT_MASK(32);
 	}
 
 	pci_set_master(pci);

-- 
2.52.0

