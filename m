Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63075B3232
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 10:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C26E10EC1F;
	Fri,  9 Sep 2022 08:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D424A10EC1F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 08:48:12 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oWZgF-0006UH-T4; Fri, 09 Sep 2022 10:48:07 +0200
Message-ID: <95370d0f87b698017da49be083f436d9b91a76b5.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] drm/etnaviv: fix power register offset on GC300
From: Lucas Stach <l.stach@pengutronix.de>
To: Doug Brown <doug@schmorgal.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 09 Sep 2022 10:48:06 +0200
In-Reply-To: <20220907024719.36478-3-doug@schmorgal.com>
References: <20220907024719.36478-1-doug@schmorgal.com>
 <20220907024719.36478-3-doug@schmorgal.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, dem 06.09.2022 um 19:47 -0700 schrieb Doug Brown:
> Older GC300 revisions have their power registers at an offset of 0x200
> rather than 0x100. Add new gpu_read_power and gpu_write_power functions
> to encapsulate accesses to the power addresses and fix the addresses.
> 
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_dump.c |  9 +++++++--
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 20 ++++++++++----------
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 21 +++++++++++++++++++++
>  3 files changed, 38 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> index f418e0b75772..df07a3c8f16a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> @@ -83,10 +83,15 @@ static void etnaviv_core_dump_registers(struct core_dump_iterator *iter,
>  {
>  	struct etnaviv_dump_registers *reg = iter->data;
>  	unsigned int i;
> +	u32 addr;
>  
>  	for (i = 0; i < ARRAY_SIZE(etnaviv_dump_registers); i++, reg++) {
> -		reg->reg = cpu_to_le32(etnaviv_dump_registers[i]);
> -		reg->value = cpu_to_le32(gpu_read(gpu, etnaviv_dump_registers[i]));
> +		addr = etnaviv_dump_registers[i];
> +		if (addr >= VIVS_PM_POWER_CONTROLS &&
> +		    addr <= VIVS_PM_PULSE_EATER)
> +			addr = gpu_fix_power_address(gpu, addr);
> +		reg->reg = cpu_to_le32(addr);

As the dumpdecoder tool would then need to reverse this address offset,
I think it would be preferable to keep writing the canonical (not fixed
up) register address into the dump. That way only the kernel needs to
know about this special offset on GC300.

> +		reg->value = cpu_to_le32(gpu_read(gpu, addr));
>  	}
>  
>  	etnaviv_core_dump_header(iter, ETDUMP_BUF_REG, reg);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index f667e7906d1f..f6d08f556cf4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -590,7 +590,7 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
>  	u32 pmc, ppc;
>  
>  	/* enable clock gating */
> -	ppc = gpu_read(gpu, VIVS_PM_POWER_CONTROLS);
> +	ppc = gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
>  	ppc |= VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
>  
>  	/* Disable stall module clock gating for 4.3.0.1 and 4.3.0.2 revs */
> @@ -598,9 +598,9 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
>  	    gpu->identity.revision == 0x4302)
>  		ppc |= VIVS_PM_POWER_CONTROLS_DISABLE_STALL_MODULE_CLOCK_GATING;
>  
> -	gpu_write(gpu, VIVS_PM_POWER_CONTROLS, ppc);
> +	gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, ppc);
>  
> -	pmc = gpu_read(gpu, VIVS_PM_MODULE_CONTROLS);
> +	pmc = gpu_read_power(gpu, VIVS_PM_MODULE_CONTROLS);
>  
>  	/* Disable PA clock gating for GC400+ without bugfix except for GC420 */
>  	if (gpu->identity.model >= chipModel_GC400 &&
> @@ -635,7 +635,7 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
>  	pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_HZ;
>  	pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_EZ;
>  
> -	gpu_write(gpu, VIVS_PM_MODULE_CONTROLS, pmc);
> +	gpu_write_power(gpu, VIVS_PM_MODULE_CONTROLS, pmc);
>  }
>  
>  void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch)
> @@ -695,11 +695,11 @@ static void etnaviv_gpu_setup_pulse_eater(struct etnaviv_gpu *gpu)
>  	    (gpu->identity.features & chipFeatures_PIPE_3D))
>  	{
>  		/* Performance fix: disable internal DFS */
> -		pulse_eater = gpu_read(gpu, VIVS_PM_PULSE_EATER);
> +		pulse_eater = gpu_read_power(gpu, VIVS_PM_PULSE_EATER);
>  		pulse_eater |= BIT(18);
>  	}
>  
> -	gpu_write(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> +	gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>  }
>  
>  static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
> @@ -1301,9 +1301,9 @@ static void sync_point_perfmon_sample_pre(struct etnaviv_gpu *gpu,
>  	u32 val;
>  
>  	/* disable clock gating */
> -	val = gpu_read(gpu, VIVS_PM_POWER_CONTROLS);
> +	val = gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
>  	val &= ~VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
> -	gpu_write(gpu, VIVS_PM_POWER_CONTROLS, val);
> +	gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, val);
>  
>  	/* enable debug register */
>  	val = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
> @@ -1334,9 +1334,9 @@ static void sync_point_perfmon_sample_post(struct etnaviv_gpu *gpu,
>  	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
>  
>  	/* enable clock gating */
> -	val = gpu_read(gpu, VIVS_PM_POWER_CONTROLS);
> +	val = gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
>  	val |= VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
> -	gpu_write(gpu, VIVS_PM_POWER_CONTROLS, val);
> +	gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, val);
>  }
>  
>  
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> index 85eddd492774..d4d139e88942 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -10,6 +10,8 @@
>  #include "etnaviv_gem.h"
>  #include "etnaviv_mmu.h"
>  #include "etnaviv_drv.h"
> +#include "common.xml.h"
> +#include "state_hi.xml.h"

I think you don't need the state_hi.xml.h include anymore, as you are
not checking for a register range in this version of the patch.

>  
>  struct etnaviv_gem_submit;
>  struct etnaviv_vram_mapping;
> @@ -159,6 +161,25 @@ static inline u32 gpu_read(struct etnaviv_gpu *gpu, u32 reg)
>  	return readl(gpu->mmio + reg);
>  }
>  
> +static inline u32 gpu_fix_power_address(struct etnaviv_gpu *gpu, u32 reg)
> +{
> +	/* Power registers in GC300 < 2.0 are offset by 0x100 */
> +	if (gpu->identity.model == chipModel_GC300 &&
> +	    gpu->identity.revision < 0x2000)
> +		reg += 0x100;

Add a newline here before the return, please.

Regards,
Lucas

> +	return reg;
> +}
> +
> +static inline void gpu_write_power(struct etnaviv_gpu *gpu, u32 reg, u32 data)
> +{
> +	writel(data, gpu->mmio + gpu_fix_power_address(gpu, reg));
> +}
> +
> +static inline u32 gpu_read_power(struct etnaviv_gpu *gpu, u32 reg)
> +{
> +	return readl(gpu->mmio + gpu_fix_power_address(gpu, reg));
> +}
> +
>  int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value);
>  
>  int etnaviv_gpu_init(struct etnaviv_gpu *gpu);


