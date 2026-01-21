Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KH8ZHPlMcGnXXAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 04:50:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D6F50974
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 04:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AA610E202;
	Wed, 21 Jan 2026 03:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A5E10E692;
 Wed, 21 Jan 2026 03:50:08 +0000 (UTC)
Received: from [127.0.0.2] (unknown [210.73.43.101])
 by APP-01 (Coremail) with SMTP id qwCowADXfWnhTHBp_WqTBQ--.5409S2;
 Wed, 21 Jan 2026 11:49:55 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH v2 0/4] PCI/MSI: Generalize no_64bit_msi into msi_addr_mask
Date: Wed, 21 Jan 2026 11:49:36 +0800
Message-Id: <20260121-pci-msi-addr-mask-v2-0-f42593168989@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANBMcGkC/22OSQ6CQBBFr0JqbZHuZgqsvIfBpCkaqRgGu5BoC
 HcXwaXL9/OnBcR5dgJFsIB3MwsP/QbmFAC1tr855HpjMMok2pgIR2LshNHWtcfOyh1NnaWJzVw
 V5Qq23Ohdw6+981Ie7N3juVVPhwiVFYc0dB1PRTCnoc7Rk74uK3z9Lcs0+Pd+adZ74Lce/1mfN
 SpUiU0bquIqJnVmISuhpZB6KNd1/QAm7Bi95AAAAA==
X-Change-ID: 20251223-pci-msi-addr-mask-2d765a7eb390
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
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev
X-Mailer: b4 0.14.3
X-CM-TRANSID: qwCowADXfWnhTHBp_WqTBQ--.5409S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFy3ZFy7CrWxur4kZryrZwb_yoWrCFWkpF
 W5GayagF48tryxKa9rAw47ZF4ayan5ta4fKr1DK3sa9an0vFy8XrnxtrW5X347Xr4xJw40
 qr9rW3WkuaykuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjTRM6wCDUUUU
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
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangruikang@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 10D6F50974
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Sophgo SG2042 is a cursed machine in more ways than one.

The one way relevant to this patch series is that its PCIe controller
has neither INTx nor a low-address MSI doorbell wired up. Instead, the
only usable MSI doorbell is a SoC one at 0x7030010300, which is above
32-bit space.

Currently, the no_64bit_msi flag on a PCI device declares that a device
needs a 32-bit MSI address. Since no more precise indication is
possible, devices supporting less than 64 bits of MSI addresses are all
lumped into one "need 32-bit MSI address" bucket. This of course
prevents these devices from working with MSI enabled on SG2042 because a
32-bit MSI doorbell address is not possible. Combined with a lack of
INTx, some of them have trouble working on SG2042 at all.

There were previous dirtier attempts to allow overriding no_64bit_msi
for radeon [1] and hda/intel [2].

To fix this, generalize the single bit no_64bit_msi into a full address
mask msi_addr_mask to more precisely describe the restriction. The
existing DMA masks seems insufficient, as for e.g. radeon the
msi_addr_mask and coherent_dma_mask seems to be different on more recent
devices.

The patches are structured as follows:

- Patch 1 conservatively introduces msi_addr_mask, without introducing
  any functional changes (hopefully, if I've done everything right), by
  only using DMA_BIT_MASK(32) and DMA_BIT_MASK(64).
- The rest of the series actually make use of intermediate values of
  msi_addr_mask, and should be independently appliable. Patch 2 relaxes
  msi_verify_entries() to allow intermediate values of msi_addr_mask.
  Patch 3 onwards raises msi_addr_mask in individual device drivers.

I still believe this safe approach is the way to go, since we don't know
the MSI addressing limitations of *every single* PCI(e) device out
there. Brett's comment from v1 [3] indicates at least the *possibility*
of MSI mask being larger than DMA mask, so let's play it safe for now
and not randomly disable some other device's MSI just because of this
one cursed platform.

Tested on SG2042 with a Radeon R5 220 which makes use of radeon and
hda/intel. PPC changes and pensanto/ionic changes are compile-tested
only, since I do not have the hardware.

I would appreciate if driver maintainers can take a look and see whether
the masks I've set makes sense, although I believe they shouldn't cause
problems on existing platforms. I'm also not familiar with PPC enough to
touch the arch/powerpc firmware calls further - help would be
appreciated.

My intention is that the first two patches are taken up by PCI
maintainers, and the rest go through the maintainers of individual
drivers since they could use more device-specific testing and review. If
this is not convenient I'll be happy to split it up or something.

[1]: https://lore.kernel.org/all/20251220163338.3852399-1-gaohan@iscas.ac.cn/
[2]: https://lore.kernel.org/all/20251220170501.3972438-1-gaohan@iscas.ac.cn/
[3]: https://lore.kernel.org/all/970e6955-d345-48e3-8ea5-83c577ecc563@amd.com/

---
Changes in v2:
- Patch 3: Fix the mask for radeon (Christian)
- Drop what was patch 5, keep the behavior for pensando unchanged for now
- Add Cc for linux-riscv and sophgo. Oops.
- Link to v1: https://lore.kernel.org/r/20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn/

---
Vivian Wang (4):
      PCI/MSI: Conservatively generalize no_64bit_msi into msi_addr_mask
      PCI/MSI: Check msi_addr_mask in msi_verify_entries()
      drm/radeon: Raise msi_addr_mask to dma_bits
      ALSA: hda/intel: Raise msi_addr_mask to dma_bits

 arch/powerpc/platforms/powernv/pci-ioda.c           |  2 +-
 arch/powerpc/platforms/pseries/msi.c                |  4 ++--
 drivers/gpu/drm/radeon/radeon_device.c              |  1 +
 drivers/gpu/drm/radeon/radeon_irq_kms.c             | 10 ----------
 drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c |  2 +-
 drivers/pci/msi/msi.c                               | 11 +++++++----
 drivers/pci/msi/pcidev_msi.c                        |  2 +-
 drivers/pci/probe.c                                 |  7 +++++++
 include/linux/pci.h                                 |  8 +++++++-
 sound/hda/controllers/intel.c                       | 10 +++++-----
 10 files changed, 32 insertions(+), 25 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251223-pci-msi-addr-mask-2d765a7eb390

Best regards,
-- 
Vivian "dramforever" Wang

