Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC3648CD83
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 22:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B054110E6F7;
	Wed, 12 Jan 2022 21:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B164E10E357
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 18:18:42 +0000 (UTC)
Received: by air.basealt.ru (Postfix, from userid 490)
 id 1A6915895D8; Wed, 12 Jan 2022 18:18:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
 sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.1
Received: from localhost (unknown [88.147.173.226])
 by air.basealt.ru (Postfix) with ESMTPSA id B17E458942B;
 Wed, 12 Jan 2022 18:18:35 +0000 (UTC)
Date: Wed, 12 Jan 2022 22:18:29 +0400
From: Alexey Sheplyakov <asheplyakov@basealt.ru>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] drm/panfrost: mmu: improved memory attributes
Message-ID: <Yd8bdQURo51v4SBX@asheplyakov-rocket>
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
 <20211223110616.2589851-2-asheplyakov@basealt.ru>
 <3e52c550-5227-091d-5fd8-35eeb3411848@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e52c550-5227-091d-5fd8-35eeb3411848@arm.com>
X-Mailman-Approved-At: Wed, 12 Jan 2022 21:16:00 +0000
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
Cc: "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Robin,

On Fri, Dec 24, 2021 at 12:56:57PM +0000, Robin Murphy wrote:

> I'd note that panfrost has been working OK - to the extent that Mesa
> supports its older ISA - on the T624 (single core group) in Arm's Juno SoC
> for over a year now since commit 268af50f38b1.
> 
> If you have to force outer non-cacheable to avoid getting translation faults
> and other errors that look like the GPU is inexplicably seeing the wrong
> data, I'd check whether you have the same thing where your integration is
> actually I/O-coherent and you're missing the "dma-coherent" property in your
> DT.

Thanks for a detailed explanation. Indeed adding the "dma-coherent" property
(and the 2nd patch which effectively disables the 2nd core group) is enough
to get panfrost working with T628 on BE-M1000 SoC. Unfortunately the same
trick does NOT work for Exynos 5422. Here I get an Oops as soon as the driver
tries to reset the GPU [1]. My patch does not work for Exynos 5422 either
(but in a different way: GPU locks up in a few seconds).

So the first patch seems to be wrong and I'll drop it.

Best regards,
   Alexey

[1]

[   73.061941] panfrost 11800000.gpu: AS_ACTIVE bit stuck
[   73.065671] 8<--- cut here ---
[   73.067015] Power domain G3D disable failed
[   73.068637] Unhandled fault: external abort on non-linefetch (0x1008) at 0xf09d0020
[   73.080424] pgd = f347788b
[   73.083108] [f09d0020] *pgd=414eb811, *pte=11800653, *ppte=11800453
[   73.089352] Internal error: : 1008 [#1] PREEMPT SMP ARM
[   73.094549] Modules linked in: xfrm_user l2tp_ppp l2tp_netlink l2tp_core ip6_udp_tunnel udp_tunnel pppox ppp_generic slhc rfkill loop zstd input_leds panfrost lzo_rle gpu_sched evdev uio_pdrv_genirq uio exynos_gpiomem zram sch_fq_codel ip_tables ipv6 btrfs blake2b_generic xor xor_neon zstd_compress lzo_compress zlib_deflate raid6_pq libcrc32c usbhid gpio_keys
[   73.126264] CPU: 3 PID: 130 Comm: kworker/u16:3 Not tainted 5.15.8-00057-g5ecb31848317 #1
[   73.134407] Hardware name: Hardkernel ODROID-XU4
[   73.139001] Workqueue: panfrost-reset panfrost_reset_work [panfrost]
[   73.145325] PC is at panfrost_gpu_soft_reset+0xa0/0x104 [panfrost]
[   73.151477] LR is at schedule_hrtimeout_range_clock+0x114/0x240
[   73.157370] pc : [<bf2c092c>]    lr : [<c0bca590>]    psr: 600e0013
[   73.163609] sp : c16f3e88  ip : 00004710  fp : c16f3ea4
[   73.168809] r10: c1255220  r9 : c5982a88  r8 : c5982a88
[   73.174007] r7 : c5982a7c  r6 : 00000011  r5 : 0364a751  r4 : c5982840
[   73.180506] r3 : f09d0000  r2 : 00000000  r1 : 00000000  r0 : 00000000
[   73.187006] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[   73.194112] Control: 10c5387d  Table: 45d5c06a  DAC: 00000051
[   73.199830] Register r0 information: NULL pointer
[   73.204509] Register r1 information: NULL pointer
[   73.209189] Register r2 information: NULL pointer
[   73.213868] Register r3 information: 0-page vmalloc region starting at 0xf09d0000 allocated at __devm_ioremap_resource+0x170/0x1e8
[   73.225566] Register r4 information: slab kmalloc-1k start c5982800 pointer offset 64 size 1024
[   73.234232] Register r5 information: non-paged memory
[   73.239258] Register r6 information: non-paged memory
[   73.244284] Register r7 information: slab kmalloc-1k start c5982800 pointer offset 636 size 1024
[   73.253036] Register r8 information: slab kmalloc-1k start c5982800 pointer offset 648 size 1024
[   73.261788] Register r9 information: slab kmalloc-1k start c5982800 pointer offset 648 size 1024
[   73.270540] Register r10 information: non-slab/vmalloc memory
[   73.276259] Register r11 information: non-slab/vmalloc memory
[   73.281978] Register r12 information: non-paged memory
[   73.287091] Process kworker/u16:3 (pid: 130, stack limit = 0x6da5c776)
[   73.293591] Stack: (0xc16f3e88 to 0xc16f4000)
[   73.297926] 3e80:                   c5982840 00000000 00000000 c5982a7c c16f3ebc c16f3ea8
[   73.306072] 3ea0: bf2bf65c bf2c0898 c5982840 00000000 c16f3ef4 c16f3ec0 bf2c278c bf2bf64c
[   73.314218] 3ec0: c16f3ef4 c16f3ed0 c015cf28 c5982aa4 c44ba900 c1410a00 c1e9c400 00000000
[   73.322363] 3ee0: c1e9c405 c1255220 c16f3f04 c16f3ef8 bf2c29cc bf2c2538 c16f3f44 c16f3f08
[   73.330509] 3f00: c014b3ac bf2c29b8 c1410a00 c1410a00 c1410a00 c1410a00 c1410a00 c44ba900
[   73.338654] 3f20: c1410a00 c44ba918 c1410a18 c1103d00 00000088 c1410a00 c16f3f7c c16f3f48
[   73.346800] 3f40: c014bc18 c014b1c0 c127b138 c16f2000 c0151004 c44bb880 c3747500 c014bbb4
[   73.354945] 3f60: c44ba900 c16f2000 c35e5e8c c3747520 c16f3fac c16f3f80 c0152ee8 c014bbc0
[   73.363091] 3f80: 00000000 c44bb880 c0152d7c 00000000 00000000 00000000 00000000 00000000
[   73.371236] 3fa0: 00000000 c16f3fb0 c01000fc c0152d88 00000000 00000000 00000000 00000000
[   73.379381] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   73.387526] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[   73.395669] Backtrace: 
[   73.398096] [<bf2c088c>] (panfrost_gpu_soft_reset [panfrost]) from [<bf2bf65c>] (panfrost_device_reset+0x1c/0x38 [panfrost])
[   73.409278]  r7:c5982a7c r6:00000000 r5:00000000 r4:c5982840
[   73.414906] [<bf2bf640>] (panfrost_device_reset [panfrost]) from [<bf2c278c>] (panfrost_reset+0x260/0x378 [panfrost])
[   73.425479]  r5:00000000 r4:c5982840
[   73.429031] [<bf2c252c>] (panfrost_reset [panfrost]) from [<bf2c29cc>] (panfrost_reset_work+0x20/0x24 [panfrost])
[   73.439260]  r10:c1255220 r9:c1e9c405 r8:00000000 r7:c1e9c400 r6:c1410a00 r5:c44ba900
[   73.447055]  r4:c5982aa4
[   73.449568] [<bf2c29ac>] (panfrost_reset_work [panfrost]) from [<c014b3ac>] (process_one_work+0x1f8/0x5c0)
[   73.459186] [<c014b1b4>] (process_one_work) from [<c014bc18>] (worker_thread+0x64/0x580)
[   73.467250]  r10:c1410a00 r9:00000088 r8:c1103d00 r7:c1410a18 r6:c44ba918 r5:c1410a00
[   73.475045]  r4:c44ba900
[   73.477557] [<c014bbb4>] (worker_thread) from [<c0152ee8>] (kthread+0x16c/0x1a0)
[   73.484927]  r10:c3747520 r9:c35e5e8c r8:c16f2000 r7:c44ba900 r6:c014bbb4 r5:c3747500
[   73.492722]  r4:c44bb880
[   73.495234] [<c0152d7c>] (kthread) from [<c01000fc>] (ret_from_fork+0x14/0x38)
[   73.502427] Exception stack(0xc16f3fb0 to 0xc16f3ff8)
[   73.507454] 3fa0:                                     00000000 00000000 00000000 00000000
[   73.515601] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   73.523746] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   73.530334]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0152d7c
[   73.538129]  r4:c44bb880 r3:00000000
[   73.541685] Code: e3a0001a ba000010 eb64253c e594300c (e5933020) 
[   73.547753] ---[ end trace 1af2dce52aebcc96 ]---

However my patch does not work for Exynos
5422 either, so I'll drop the first patch.

> 
> Thanks,
> Robin.
> 
> > Signed-off-by: Alexey Sheplyakov <asheplyakov@basealt.ru>
> > Signed-off-by: Vadim V. Vlasov <vadim.vlasov@elpitech.ru>
> > 
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > Cc: Vadim V. Vlasov <vadim.vlasov@elpitech.ru>
> > ---
> >   drivers/gpu/drm/panfrost/panfrost_mmu.c |  3 ---
> >   drivers/iommu/io-pgtable-arm.c          | 16 ++++++++++++----
> >   2 files changed, 12 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > index 39562f2d11a4..2f4f8a17bc82 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > @@ -133,9 +133,6 @@ static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_m
> >   	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
> >   	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
> > -	/* Need to revisit mem attrs.
> > -	 * NC is the default, Mali driver is inner WT.
> > -	 */
> >   	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
> >   	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > index dd9e47189d0d..15b39c337e20 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -122,13 +122,17 @@
> >   #define ARM_LPAE_MAIR_ATTR_IDX_CACHE	1
> >   #define ARM_LPAE_MAIR_ATTR_IDX_DEV	2
> >   #define ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE	3
> > +#define ARM_LPAE_MAIR_ATTR_IDX_OUTER_WA 4
> >   #define ARM_MALI_LPAE_TTBR_ADRMODE_TABLE (3u << 0)
> >   #define ARM_MALI_LPAE_TTBR_READ_INNER	BIT(2)
> >   #define ARM_MALI_LPAE_TTBR_SHARE_OUTER	BIT(4)
> > -#define ARM_MALI_LPAE_MEMATTR_IMP_DEF	0x88ULL
> > -#define ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC 0x8DULL
> > +#define ARM_MALI_LPAE_MEMATTR_IMP_DEF	0x48ULL
> > +#define ARM_MALI_LPAE_MEMATTR_FORCE_CACHE_ALL 0x4FULL
> > +#define ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC 0x4DULL
> > +#define ARM_MALI_LPAE_MEMATTR_OUTER_IMP_DEF 0x88ULL
> > +#define ARM_MALI_LPAE_MEMATTR_OUTER_WA 0x8DULL
> >   #define APPLE_DART_PTE_PROT_NO_WRITE (1<<7)
> >   #define APPLE_DART_PTE_PROT_NO_READ (1<<8)
> > @@ -1080,10 +1084,14 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
> >   	cfg->arm_mali_lpae_cfg.memattr =
> >   		(ARM_MALI_LPAE_MEMATTR_IMP_DEF
> >   		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_NC)) |
> > +		(ARM_MALI_LPAE_MEMATTR_FORCE_CACHE_ALL
> > +		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_CACHE)) |
> >   		(ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC
> >   		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_CACHE)) |
> > -		(ARM_MALI_LPAE_MEMATTR_IMP_DEF
> > -		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV));
> > +		(ARM_MALI_LPAE_MEMATTR_OUTER_IMP_DEF
> > +		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV)) |
> > +		(ARM_MALI_LPAE_MEMATTR_OUTER_WA
> > +		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_OUTER_WA));
> >   	data->pgd = __arm_lpae_alloc_pages(ARM_LPAE_PGD_SIZE(data), GFP_KERNEL,
> >   					   cfg);
