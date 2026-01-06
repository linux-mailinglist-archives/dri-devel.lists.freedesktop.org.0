Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CE3CF7470
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C990710E4AA;
	Tue,  6 Jan 2026 08:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECA110E082;
 Tue,  6 Jan 2026 07:42:24 +0000 (UTC)
Received: from [192.168.0.114] (unknown [114.241.82.145])
 by APP-05 (Coremail) with SMTP id zQCowABX6AvAvFxpa_ebAw--.32437S2;
 Tue, 06 Jan 2026 15:41:52 +0800 (CST)
Message-ID: <c652e45c-fedc-4bcd-9310-fc428e0e6c57@iscas.ac.cn>
Date: Tue, 6 Jan 2026 15:41:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] PCI/MSI: Conservatively generalize no_64bit_msi into
 msi_addr_mask
To: "Creeley, Brett" <bcreeley@amd.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org
References: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
 <20251224-pci-msi-addr-mask-v1-1-05a6fcb4b4c0@iscas.ac.cn>
 <641c55d4-5c18-4b81-be04-404e6bb3fbb1@amd.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <641c55d4-5c18-4b81-be04-404e6bb3fbb1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: zQCowABX6AvAvFxpa_ebAw--.32437S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtF17AF4DGF4UKr1ruF43trb_yoWxAw4fpa
 ykGFWSyFW8K3yUta9Fy3WUZF1Yva1qgrWrWrW7K3sa93ZIvFy8JFnayry3Gwn7Xr4kCF40
 qr1jgw1jgFnIk3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
 04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
 nxnUUI43ZEXa7sRidbbtUUUUU==
X-Originating-IP: [114.241.82.145]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Mailman-Approved-At: Tue, 06 Jan 2026 08:21:36 +0000
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

On 1/6/26 02:05, Creeley, Brett wrote:
> On 12/23/2025 7:10 PM, Vivian Wang wrote:
>> Caution: This message originated from an External Source. Use proper c=
aution when opening attachments, clicking links, or responding.
>>
>>
>> Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
>> implement less than 64 address bits. This breaks on platforms where su=
ch
>> a device is assigned an MSI address higher than what's reachable.
>>
>> Currently, we deal with this with a single no_64bit_msi flag, and
>> (notably on powerpc) use 32-bit MSI address for these devices. However=
,
>> on some platforms the MSI doorbell address is above 32-bit but within
>> device ability.
>>
>> As a first step, conservatively generalize the single-bit flag
>> no_64bit_msi into msi_addr_mask. (The name msi_addr_mask is chosen to
>> avoid confusion with msi_mask.)
>>
>> The translation is essentially:
>>
>> - no_64bit_msi =3D 1    ->    msi_addr_mask =3D DMA_BIT_MASK(32)
>> - no_64bit_msi =3D 0    ->    msi_addr_mask =3D DMA_BIT_MASK(64)
>> - if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))
>>
>> Since no values other than DMA_BIT_MASK(32) and DMA_BIT_MASK(64) is
>> used, no functional change is intended. Future patches that make use o=
f
>> intermediate values of msi_addr_mask will follow, allowing devices tha=
t
>> cannot use full 64-bit addresses for MSI to work on platforms with MSI=

>> doorbell above 32-bit address space.
>>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>>
>> ---
>>
>> checkpatch complains about the comment include/linux/pci.h, which I ha=
ve
>> formatted similarly with other comments in the vicinity.
>> ---
>>   arch/powerpc/platforms/powernv/pci-ioda.c           | 2 +-
>>   arch/powerpc/platforms/pseries/msi.c                | 4 ++--
>>   drivers/gpu/drm/radeon/radeon_irq_kms.c             | 2 +-
>>   drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c | 2 +-
>>   drivers/pci/msi/msi.c                               | 2 +-
>>   drivers/pci/msi/pcidev_msi.c                        | 2 +-
>>   drivers/pci/probe.c                                 | 7 +++++++
>>   include/linux/pci.h                                 | 8 +++++++-
>>   sound/hda/controllers/intel.c                       | 2 +-
>>   9 files changed, 22 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/=
platforms/powernv/pci-ioda.c
>> index b0c1d9d16fb5..1c78fdfb7b03 100644
>> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
>> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
>> @@ -1666,7 +1666,7 @@ static int __pnv_pci_ioda_msi_setup(struct pnv_p=
hb *phb, struct pci_dev *dev,
>>                  return -ENXIO;
>>
>>          /* Force 32-bit MSI on some broken devices */
>> -       if (dev->no_64bit_msi)
>> +       if (dev->msi_addr_mask < DMA_BIT_MASK(64))
>>                  is_64 =3D 0;
>>
>>          /* Assign XIVE to PE */
>> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platf=
orms/pseries/msi.c
>> index a82aaa786e9e..7473c7ca1db0 100644
>> --- a/arch/powerpc/platforms/pseries/msi.c
>> +++ b/arch/powerpc/platforms/pseries/msi.c
>> @@ -383,7 +383,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *p=
dev, int nvec_in, int type,
>>           */
>>   again:
>>          if (type =3D=3D PCI_CAP_ID_MSI) {
>> -               if (pdev->no_64bit_msi) {
>> +               if (pdev->msi_addr_mask < DMA_BIT_MASK(64)) {
>>                          rc =3D rtas_change_msi(pdn, RTAS_CHANGE_32MSI=
_FN, nvec);
>>                          if (rc < 0) {
>>                                  /*
>> @@ -409,7 +409,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *p=
dev, int nvec_in, int type,
>>                  if (use_32bit_msi_hack && rc > 0)
>>                          rtas_hack_32bit_msi_gen2(pdev);
>>          } else {
>> -               if (pdev->no_64bit_msi)
>> +               if (pdev->msi_addr_mask < DMA_BIT_MASK(64))
>>                          rc =3D rtas_change_msi(pdn, RTAS_CHANGE_32MSI=
X_FN, nvec);
>>                  else
>>                          rc =3D rtas_change_msi(pdn, RTAS_CHANGE_MSIX_=
FN, nvec);
>> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm=
/radeon/radeon_irq_kms.c
>> index 9961251b44ba..d550554a6f3f 100644
>> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
>> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>> @@ -252,7 +252,7 @@ static bool radeon_msi_ok(struct radeon_device *rd=
ev)
>>           */
>>          if (rdev->family < CHIP_BONAIRE) {
>>                  dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n"=
);
>> -               rdev->pdev->no_64bit_msi =3D 1;
>> +               rdev->pdev->msi_addr_mask =3D DMA_BIT_MASK(32);
>>          }
>>
>>          /* force MSI on */
>> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/dri=
vers/net/ethernet/pensando/ionic/ionic_bus_pci.c
>> index 70d86c5f52fb..0671deae9a28 100644
>> --- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
>> +++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
>> @@ -331,7 +331,7 @@ static int ionic_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
>>
>>   #ifdef CONFIG_PPC64
>>          /* Ensure MSI/MSI-X interrupts lie within addressable physica=
l memory */
>> -       pdev->no_64bit_msi =3D 1;
>> +       pdev->msi_addr_mask =3D DMA_BIT_MASK(32);
> I know this is just an intermediate commit in the series, but does this=

> retain the original intent?
I do believe so, yes. The no_64bit_msi bit's meaning is the negation of
this bit found in the MSI capability:

=C2=A0 =C2=A0 #define=C2=A0 PCI_MSI_FLAGS_64BIT=C2=A0 =C2=A0 0x0080=C2=A0=
 =C2=A0 /* 64-bit addresses allowed */

PCI_MSI_FLAGS_64BIT is set if this function handles PCI_MSI_ADDRESS_HI
and cleared if doesn't handle=C2=A0PCI_MSI_ADDRESS_HI. So=C2=A0with "no 6=
4bit",
only PCI_MSI_ADDRESS_LO is usable, and MSI is limited to 32 bits. See
also old handling here:

>> diff --git a/drivers/pci/msi/pcidev_msi.c b/drivers/pci/msi/pcidev_msi=
=2Ec
>> index 5520aff53b56..0b0346813092 100644
>> --- a/drivers/pci/msi/pcidev_msi.c
>> +++ b/drivers/pci/msi/pcidev_msi.c
>> @@ -24,7 +24,7 @@ void pci_msi_init(struct pci_dev *dev)
>>          }
>>
>>          if (!(ctrl & PCI_MSI_FLAGS_64BIT))
>> -               dev->no_64bit_msi =3D 1;
>> +               dev->msi_addr_mask =3D DMA_BIT_MASK(32);
>>   }
>>
>>   void pci_msix_init(struct pci_dev *dev)
=2E.. and the old definition of the flag here, where the comment
explicitly says no_64bit_msi means 32-bit:
>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>> index 41183aed8f5d..a2bff57176a3 100644
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
>>
>> [...]
>>
>> @@ -441,7 +448,6 @@ struct pci_dev {
>>
>>          unsigned int    is_busmaster:1;         /* Is busmaster */
>>          unsigned int    no_msi:1;               /* May not use MSI */=

>> -       unsigned int    no_64bit_msi:1;         /* May only use 32-bit=
 MSIs */
>>          unsigned int    block_cfg_access:1;     /* Config space acces=
s blocked */
>>          unsigned int    broken_parity_status:1; /* Generates false po=
sitive parity */
>>          unsigned int    irq_reroute_variant:2;  /* Needs IRQ reroutin=
g variant */
Vivian "dramforever" Wang

