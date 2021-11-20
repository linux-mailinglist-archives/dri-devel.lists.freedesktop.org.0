Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FC3457C1D
	for <lists+dri-devel@lfdr.de>; Sat, 20 Nov 2021 08:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119C96EC1C;
	Sat, 20 Nov 2021 07:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626826EC1C;
 Sat, 20 Nov 2021 07:30:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D79260E94;
 Sat, 20 Nov 2021 07:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637393442;
 bh=+5RvHa5Ai/YCF3S6v0KXmQzd9HmqMFiM+R60ANhXvZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JqvOpFaZvSiSg05ffnTxgeAZVbDsDpJrweaUkeyC6+XBKPN5ci3EXmvgsoZHv9cQy
 Fk/ZnChWBlOf77zrFwtMS1zvKe9cneahfXEkC4Qg92gPpmch5Zs3qSnRoElzZrCuB5
 LULBq5hscr8gzsHs4OufNfI+k450KbRCVrm8YJWRjGzGCP+CuDzuyIHz1bewAcdgUU
 0tdJcfyL9BGIfLFU+jLaIMr3oFsMpklzeQwsrZWNVd1RclHR8HX6V5SNp3UusagnQ/
 ZdDeyfgaarZAxmMsHQPUNsNApUNdCUnhd5Nh3dyUnrM/0s0pr6X+dnnSIOSa7T6+8d
 KNG4buY68v6Mw==
Date: Sat, 20 Nov 2021 15:30:11 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH bpf] treewide: add missing includes masked by cgroup ->
 bpf dependency
Message-ID: <20211120073011.GA36650@Peter>
References: <20211120035253.72074-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211120035253.72074-1-kuba@kernel.org>
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
Cc: kw@linux.com, songliubraving@fb.com, kafai@fb.com, airlied@linux.ie,
 linux-pci@vger.kernel.org, ast@kernel.org, dri-devel@lists.freedesktop.org,
 andrii@kernel.org, a-govindraju@ti.com, ray.huang@amd.com, sbhatta@marvell.com,
 lorenzo.pieralisi@arm.com, daniel@iogearbox.net,
 krzysztof.kozlowski@canonical.com, john.fastabend@gmail.com,
 geert@linux-m68k.org, matthew.auld@intel.com, yhs@fb.com, sgoutham@marvell.com,
 thomas.hellstrom@linux.intel.com, pawell@cadence.com, tzimmermann@suse.de,
 mani@kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, kpsingh@kernel.org, rogerq@kernel.org,
 linux-samsung-soc@vger.kernel.org, rodrigo.vivi@intel.com, bhelgaas@google.com,
 sean@poorly.run, akpm@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, axboe@kernel.dk,
 linux-block@vger.kernel.org, sj@kernel.org, lima@lists.freedesktop.org,
 linux-mm@kvack.org, jingoohan1@gmail.com, linux-usb@vger.kernel.org,
 christian.koenig@amd.com, hkelam@marvell.com, yuq825@gmail.com,
 gregkh@linuxfoundation.org, bpf@vger.kernel.org, colin.king@intel.com,
 freedreno@lists.freedesktop.org, gakula@marvell.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21-11-19 19:52:53, Jakub Kicinski wrote:
> cgroup.h (therefore swap.h, therefore half of the universe)
> includes bpf.h which in turn includes module.h and slab.h.
> Since we're about to get rid of that dependency we need
> to clean things up.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  static inline struct inode *bdev_file_inode(struct file *file)
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 7b9f69f21f1e..bca0de92802e 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -9,6 +9,7 @@
>  #include <linux/shmem_fs.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> +#include <linux/module.h>
>  
>  #ifdef CONFIG_X86
>  #include <asm/set_memory.h>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 67d14afa6623..b67f620c3d93 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -6,6 +6,7 @@
>  #include <linux/slab.h> /* fault-inject.h is not standalone! */
>  
>  #include <linux/fault-inject.h>
> +#include <linux/sched/mm.h>
>  
>  #include "gem/i915_gem_lmem.h"
>  #include "i915_trace.h"
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 820a1f38b271..89cccefeea63 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -29,6 +29,7 @@
>  #include <linux/sched.h>
>  #include <linux/sched/clock.h>
>  #include <linux/sched/signal.h>
> +#include <linux/sched/mm.h>
>  
>  #include "gem/i915_gem_context.h"
>  #include "gt/intel_breadcrumbs.h"
> diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
> index 65fdca366e41..f74f8048af8f 100644
> --- a/drivers/gpu/drm/lima/lima_device.c
> +++ b/drivers/gpu/drm/lima/lima_device.c
> @@ -4,6 +4,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/clk.h>
> +#include <linux/slab.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/platform_device.h>
>  
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index 4a1420b05e97..086dacf2f26a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/vmalloc.h>
> +#include <linux/sched/mm.h>
>  
>  #include "msm_drv.h"
>  #include "msm_gem.h"
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 7e83c00a3f48..79c870a3bef8 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -34,6 +34,7 @@
>  #include <linux/sched.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/file.h>
> +#include <linux/module.h>
>  #include <drm/drm_cache.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  
> diff --git a/drivers/net/ethernet/huawei/hinic/hinic_sriov.c b/drivers/net/ethernet/huawei/hinic/hinic_sriov.c
> index a78c398bf5b2..01e7d3c0b68e 100644
> --- a/drivers/net/ethernet/huawei/hinic/hinic_sriov.c
> +++ b/drivers/net/ethernet/huawei/hinic/hinic_sriov.c
> @@ -8,6 +8,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/etherdevice.h>
>  #include <linux/netdevice.h>
> +#include <linux/module.h>
>  
>  #include "hinic_hw_dev.h"
>  #include "hinic_dev.h"
> diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ptp.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ptp.c
> index 0ef68fdd1f26..61c20907315f 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ptp.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ptp.c
> @@ -5,6 +5,8 @@
>   *
>   */
>  
> +#include <linux/module.h>
> +
>  #include "otx2_common.h"
>  #include "otx2_ptp.h"
>  
> diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
> index c24dab383654..722dacdd5a17 100644
> --- a/drivers/pci/controller/dwc/pci-exynos.c
> +++ b/drivers/pci/controller/dwc/pci-exynos.c
> @@ -19,6 +19,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/module.h>
>  
>  #include "pcie-designware.h"
>  
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 7b17da2f9b3f..cfe66bf04c1d 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -18,6 +18,7 @@
>  #include <linux/pm_domain.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> +#include <linux/module.h>
>  
>  #include "pcie-designware.h"
>  
> diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
> index 84dadfa726aa..9643b905e2d8 100644
> --- a/drivers/usb/cdns3/host.c
> +++ b/drivers/usb/cdns3/host.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <linux/platform_device.h>
> +#include <linux/slab.h>

Should be "#include <linux/module.h>"?

-- 

Thanks,
Peter Chen

