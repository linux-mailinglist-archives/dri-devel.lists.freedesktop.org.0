Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B53CDBF73
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 11:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C7210EA73;
	Wed, 24 Dec 2025 10:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DA110E32A;
 Wed, 24 Dec 2025 03:11:29 +0000 (UTC)
Received: from [127.0.0.2] (unknown [114.241.82.59])
 by APP-05 (Coremail) with SMTP id zQCowADHXBDPWUtpQzS6AQ--.32153S2;
 Wed, 24 Dec 2025 11:11:11 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH 0/5] PCI/MSI: Generalize no_64bit_msi into msi_addr_mask
Date: Wed, 24 Dec 2025 11:10:48 +0800
Message-Id: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALhZS2kC/yXMWwqDMBCF4a2Eee4UE1HRrRQLMZm2Q4mXiZVCy
 N4b6uN34PwJIglThEElEDo48jIX6IsC97Lzk5B9MZjKNNqYGlfHGCKj9V4w2PhG47u2sR1NdV9
 B+a1CD/7+m7fxtND2Ken9HGGykdAtIfA+qKO96h7F6XvKMOb8A9YopX2TAAAA
X-Change-ID: 20251223-pci-msi-addr-mask-2d765a7eb390
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: zQCowADHXBDPWUtpQzS6AQ--.32153S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFy3ZFy7CrWxur4kCw15urg_yoW5Kw1DpF
 W5GayagF40y34xWFZrAw4UZFWayFs5Ka47KrWDK3sa9an0qry8XrnxtF45X347Wr1xXr40
 qrW7Kw1kWFWkuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0pRHUDLUUUUU=
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Mailman-Approved-At: Wed, 24 Dec 2025 10:21:59 +0000
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

---
Vivian Wang (5):
      PCI/MSI: Conservatively generalize no_64bit_msi into msi_addr_mask
      PCI/MSI: Check msi_addr_mask in msi_verify_entries()
      drm/radeon: Raise msi_addr_mask to 40 bits for pre-Bonaire
      ALSA: hda/intel: Raise msi_addr_mask to dma_bits
      [RFC net-next] net: ionic: Set msi_addr_mask to IONIC_ADDR_LEN-bit everywhere

 arch/powerpc/platforms/powernv/pci-ioda.c           |  2 +-
 arch/powerpc/platforms/pseries/msi.c                |  4 ++--
 drivers/gpu/drm/radeon/radeon_irq_kms.c             |  4 ++--
 drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c |  4 +---
 drivers/pci/msi/msi.c                               | 11 +++++++----
 drivers/pci/msi/pcidev_msi.c                        |  2 +-
 drivers/pci/probe.c                                 |  7 +++++++
 include/linux/pci.h                                 |  8 +++++++-
 sound/hda/controllers/intel.c                       | 10 +++++-----
 9 files changed, 33 insertions(+), 19 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251223-pci-msi-addr-mask-2d765a7eb390

Best regards,
-- 
Vivian "dramforever" Wang

