Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 005395F866D
	for <lists+dri-devel@lfdr.de>; Sat,  8 Oct 2022 20:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC49F10E32C;
	Sat,  8 Oct 2022 18:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E4310E32C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Oct 2022 18:05:57 +0000 (UTC)
Received: from [192.168.1.101] (95.49.30.238.neoplus.adsl.tpnet.pl
 [95.49.30.238])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 431C43F1EA;
 Sat,  8 Oct 2022 20:05:51 +0200 (CEST)
Message-ID: <cb6b177a-0507-4b82-211b-00923cfe3c8c@somainline.org>
Date: Sat, 8 Oct 2022 20:05:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [DNM RFC PATCH] drm/msm: Use lowercase hex for !defines
Content-Language: en-US
To: ~postmarketos/upstreaming@lists.sr.ht, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20221008174306.248310-1-konrad.dybcio@somainline.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221008174306.248310-1-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: marijn.suijten@somainline.org, martin.botka@somainline.org,
 jamipkettunen@somainline.org, angelogioacchino.delregno@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8.10.2022 19:43, Konrad Dybcio wrote:
> drm/msm capitalizes hex numbers rather randomly. Try to unify it.
> 
> Generated with:
> 
> grep -rEl "\s0x\w*[A-Z]+*\w*" drivers/gpu/drm/msm | \
> xargs sed -i '/define/! s/\s0x\w*[A-Z]+*\w*/\L&/g'
> ---
> I could not find any strict hex capitalization rules for Linux, so
> I'm sending this very loosely, without an S-o-b and as a DNM RFC.
> Funnily enough, this patch somehow broke get_maintainer.pl
> 

[...]
>  	return msm_gem_address_space_create(mmu,
> -		"gpu", 0x100000000ULL,
> +		"gpu", 0x100000000ull,
Well this is an immediate issue if this patch was even to be considered.

Konrad
>  		adreno_private_address_space_size(gpu));
>  }
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index ab853f61db63..6bd24c9f15e9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -43,7 +43,7 @@ struct a6xx_gpu {
>   */
>  #define A6XX_PROTECT_NORDWR(_reg, _len) \
>  	((1 << 31) | \
> -	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> +	(((_len) & 0x3fff) << 18) | ((_reg) & 0x3ffff))
>  
>  /*
>   * Same as above, but allow reads over the range. For areas of mixed use (such
> @@ -51,7 +51,7 @@ struct a6xx_gpu {
>   * single register
>   */
>  #define A6XX_PROTECT_RDONLY(_reg, _len) \
> -	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> +	((((_len) & 0x3fff) << 18) | ((_reg) & 0x3ffff))
>  
>  static inline bool a6xx_has_gbif(struct adreno_gpu *gpu)
>  {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 55f443328d8e..a0538533bf2c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -344,7 +344,7 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
>  	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_3, 0);
>  
>  	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_0, 0x76543210);
> -	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_1, 0xFEDCBA98);
> +	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_1, 0xfedcba98);
>  
>  	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_0, 0);
>  	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> @@ -375,7 +375,7 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
>  		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_0,
>  			0x76543210);
>  		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1,
> -			0xFEDCBA98);
> +			0xfedcba98);
>  
>  		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_0, 0);
>  		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> index 2fb58b7098e4..741291ebb99f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> @@ -308,7 +308,7 @@ static const u32 a6xx_vbif_registers[] = {
>  };
>  
>  static const u32 a6xx_gbif_registers[] = {
> -	0x3C00, 0X3C0B, 0X3C40, 0X3C47, 0X3CC0, 0X3CD1, 0xE3A, 0xE3A,
> +	0x3c00, 0X3C0B, 0X3C40, 0X3C47, 0X3CC0, 0X3CD1, 0xe3a, 0xe3a,
>  };
>  
>  static const struct a6xx_registers a6xx_ahb_reglist[] = {
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e7adc5c632d0..ed3ac60c832e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -354,7 +354,7 @@ static inline void
>  OUT_PKT0(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
>  {
>  	adreno_wait_ring(ring, cnt+1);
> -	OUT_RING(ring, CP_TYPE0_PKT | ((cnt-1) << 16) | (regindx & 0x7FFF));
> +	OUT_RING(ring, CP_TYPE0_PKT | ((cnt-1) << 16) | (regindx & 0x7fff));
>  }
>  
>  /* no-op packet: */
> @@ -369,7 +369,7 @@ static inline void
>  OUT_PKT3(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>  {
>  	adreno_wait_ring(ring, cnt+1);
> -	OUT_RING(ring, CP_TYPE3_PKT | ((cnt-1) << 16) | ((opcode & 0xFF) << 8));
> +	OUT_RING(ring, CP_TYPE3_PKT | ((cnt-1) << 16) | ((opcode & 0xff) << 8));
>  }
>  
>  static inline u32 PM4_PARITY(u32 val)
> @@ -385,7 +385,7 @@ static inline u32 PM4_PARITY(u32 val)
>  
>  #define PKT4(_reg, _cnt) \
>  	(CP_TYPE4_PKT | ((_cnt) << 0) | (PM4_PARITY((_cnt)) << 7) | \
> -	 (((_reg) & 0x3FFFF) << 8) | (PM4_PARITY((_reg)) << 27))
> +	 (((_reg) & 0x3ffff) << 8) | (PM4_PARITY((_reg)) << 27))
>  
>  static inline void
>  OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
> @@ -399,7 +399,7 @@ OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>  {
>  	adreno_wait_ring(ring, cnt + 1);
>  	OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
> -		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
> +		((opcode & 0x7f) << 16) | (PM4_PARITY(opcode) << 23));
>  }
>  
>  struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
> @@ -426,7 +426,7 @@ static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
>   */
>  #define ADRENO_PROTECT_RW(_reg, _len) \
>  	((1 << 30) | (1 << 29) | \
> -	((ilog2((_len)) & 0x1F) << 24) | (((_reg) << 2) & 0xFFFFF))
> +	((ilog2((_len)) & 0x1f) << 24) | (((_reg) << 2) & 0xfffff))
>  
>  /*
>   * Same as above, but allow reads over the range. For areas of mixed use (such
> @@ -435,7 +435,7 @@ static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
>   */
>  #define ADRENO_PROTECT_RDONLY(_reg, _len) \
>  	((1 << 29) \
> -	((ilog2((_len)) & 0x1F) << 24) | (((_reg) << 2) & 0xFFFFF))
> +	((ilog2((_len)) & 0x1f) << 24) | (((_reg) << 2) & 0xfffff))
>  
>  
>  #define gpu_poll_timeout(gpu, addr, val, cond, interval, timeout) \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 27f029fdc682..bca45c99d0d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -383,50 +383,50 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
>  	.features = 0,
>  	.highest_bank_bit = 0x2,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -			.reg_off = 0x2AC, .bit_off = 0},
> +			.reg_off = 0x2ac, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> -			.reg_off = 0x2B4, .bit_off = 0},
> +			.reg_off = 0x2b4, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> -			.reg_off = 0x2BC, .bit_off = 0},
> +			.reg_off = 0x2bc, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> -			.reg_off = 0x2C4, .bit_off = 0},
> +			.reg_off = 0x2c4, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -			.reg_off = 0x2AC, .bit_off = 8},
> +			.reg_off = 0x2ac, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -			.reg_off = 0x2B4, .bit_off = 8},
> +			.reg_off = 0x2b4, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
> -			.reg_off = 0x2C4, .bit_off = 8},
> +			.reg_off = 0x2c4, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
> -			.reg_off = 0x2C4, .bit_off = 12},
> +			.reg_off = 0x2c4, .bit_off = 12},
>  	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -			.reg_off = 0x3A8, .bit_off = 15},
> +			.reg_off = 0x3a8, .bit_off = 15},
>  	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> -			.reg_off = 0x3B0, .bit_off = 15},
> +			.reg_off = 0x3b0, .bit_off = 15},
>  	},
>  };
>  
>  static const struct dpu_mdp_cfg sdm845_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x45C,
> +	.base = 0x0, .len = 0x45c,
>  	.features = BIT(DPU_MDP_AUDIO_SELECT),
>  	.highest_bank_bit = 0x2,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -			.reg_off = 0x2AC, .bit_off = 0},
> +			.reg_off = 0x2ac, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> -			.reg_off = 0x2B4, .bit_off = 0},
> +			.reg_off = 0x2b4, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> -			.reg_off = 0x2BC, .bit_off = 0},
> +			.reg_off = 0x2bc, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> -			.reg_off = 0x2C4, .bit_off = 0},
> +			.reg_off = 0x2c4, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -			.reg_off = 0x2AC, .bit_off = 8},
> +			.reg_off = 0x2ac, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -			.reg_off = 0x2B4, .bit_off = 8},
> +			.reg_off = 0x2b4, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -			.reg_off = 0x2BC, .bit_off = 8},
> +			.reg_off = 0x2bc, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> -			.reg_off = 0x2C4, .bit_off = 8},
> +			.reg_off = 0x2c4, .bit_off = 8},
>  	},
>  };
>  
> @@ -437,38 +437,38 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
>  	.features = 0,
>  	.highest_bank_bit = 0x3,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -		.reg_off = 0x2AC, .bit_off = 0},
> +		.reg_off = 0x2ac, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -		.reg_off = 0x2AC, .bit_off = 8},
> +		.reg_off = 0x2ac, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -		.reg_off = 0x2B4, .bit_off = 8},
> +		.reg_off = 0x2b4, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> -		.reg_off = 0x2C4, .bit_off = 8},
> +		.reg_off = 0x2c4, .bit_off = 8},
>  	},
>  };
>  
>  static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x45C,
> +	.base = 0x0, .len = 0x45c,
>  	.features = 0,
>  	.highest_bank_bit = 0x3,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -			.reg_off = 0x2AC, .bit_off = 0},
> +			.reg_off = 0x2ac, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> -			.reg_off = 0x2B4, .bit_off = 0},
> +			.reg_off = 0x2b4, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> -			.reg_off = 0x2BC, .bit_off = 0},
> +			.reg_off = 0x2bc, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> -			.reg_off = 0x2C4, .bit_off = 0},
> +			.reg_off = 0x2c4, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -			.reg_off = 0x2AC, .bit_off = 8},
> +			.reg_off = 0x2ac, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -			.reg_off = 0x2B4, .bit_off = 8},
> +			.reg_off = 0x2b4, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -			.reg_off = 0x2BC, .bit_off = 8},
> +			.reg_off = 0x2bc, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> -			.reg_off = 0x2C4, .bit_off = 8},
> +			.reg_off = 0x2c4, .bit_off = 8},
>  	},
>  };
>  
> @@ -479,25 +479,25 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>  	.features = 0,
>  	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -			.reg_off = 0x2AC, .bit_off = 0},
> +			.reg_off = 0x2ac, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> -			.reg_off = 0x2B4, .bit_off = 0},
> +			.reg_off = 0x2b4, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> -			.reg_off = 0x2BC, .bit_off = 0},
> +			.reg_off = 0x2bc, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> -			.reg_off = 0x2C4, .bit_off = 0},
> +			.reg_off = 0x2c4, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -			.reg_off = 0x2AC, .bit_off = 8},
> +			.reg_off = 0x2ac, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -			.reg_off = 0x2B4, .bit_off = 8},
> +			.reg_off = 0x2b4, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -			.reg_off = 0x2BC, .bit_off = 8},
> +			.reg_off = 0x2bc, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> -			.reg_off = 0x2C4, .bit_off = 8},
> +			.reg_off = 0x2c4, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
> -			.reg_off = 0x2BC, .bit_off = 20},
> +			.reg_off = 0x2bc, .bit_off = 20},
>  	.clk_ctrls[DPU_CLK_CTRL_WB2] = {
> -			.reg_off = 0x3B8, .bit_off = 24},
> +			.reg_off = 0x3b8, .bit_off = 24},
>  	},
>  };
>  
> @@ -507,13 +507,13 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
>  	.base = 0x0, .len = 0x2014,
>  	.highest_bank_bit = 0x1,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -		.reg_off = 0x2AC, .bit_off = 0},
> +		.reg_off = 0x2ac, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -		.reg_off = 0x2AC, .bit_off = 8},
> +		.reg_off = 0x2ac, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -		.reg_off = 0x2B4, .bit_off = 8},
> +		.reg_off = 0x2b4, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> -		.reg_off = 0x2C4, .bit_off = 8},
> +		.reg_off = 0x2c4, .bit_off = 8},
>  	},
>  };
>  
> @@ -524,9 +524,9 @@ static const struct dpu_mdp_cfg qcm2290_mdp[] = {
>  	.features = 0,
>  	.highest_bank_bit = 0x2,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -		.reg_off = 0x2AC, .bit_off = 0},
> +		.reg_off = 0x2ac, .bit_off = 0},
>  	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -		.reg_off = 0x2AC, .bit_off = 8},
> +		.reg_off = 0x2ac, .bit_off = 8},
>  	},
>  };
>  
> @@ -569,31 +569,31 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
>  static const struct dpu_ctl_cfg sdm845_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
> -	.base = 0x1000, .len = 0xE4,
> +	.base = 0x1000, .len = 0xe4,
>  	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
> -	.base = 0x1200, .len = 0xE4,
> +	.base = 0x1200, .len = 0xe4,
>  	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
> -	.base = 0x1400, .len = 0xE4,
> +	.base = 0x1400, .len = 0xe4,
>  	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
> -	.base = 0x1600, .len = 0xE4,
> +	.base = 0x1600, .len = 0xe4,
>  	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
> -	.base = 0x1800, .len = 0xE4,
> +	.base = 0x1800, .len = 0xe4,
>  	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
> @@ -602,19 +602,19 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
>  static const struct dpu_ctl_cfg sc7180_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
> -	.base = 0x1000, .len = 0xE4,
> +	.base = 0x1000, .len = 0xe4,
>  	.features = BIT(DPU_CTL_ACTIVE_CFG),
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
> -	.base = 0x1200, .len = 0xE4,
> +	.base = 0x1200, .len = 0xe4,
>  	.features = BIT(DPU_CTL_ACTIVE_CFG),
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
> -	.base = 0x1400, .len = 0xE4,
> +	.base = 0x1400, .len = 0xe4,
>  	.features = BIT(DPU_CTL_ACTIVE_CFG),
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
> @@ -662,25 +662,25 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
>  static const struct dpu_ctl_cfg sc7280_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
> -	.base = 0x15000, .len = 0x1E8,
> +	.base = 0x15000, .len = 0x1e8,
>  	.features = CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
> -	.base = 0x16000, .len = 0x1E8,
> +	.base = 0x16000, .len = 0x1e8,
>  	.features = CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
> -	.base = 0x17000, .len = 0x1E8,
> +	.base = 0x17000, .len = 0x1e8,
>  	.features = CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
> -	.base = 0x18000, .len = 0x1E8,
> +	.base = 0x18000, .len = 0x1e8,
>  	.features = CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
> @@ -1238,29 +1238,29 @@ static struct dpu_dsc_cfg sdm845_dsc[] = {
>  	}
>  
>  static const struct dpu_intf_cfg msm8998_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6b000, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x6b800, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>  
>  static const struct dpu_intf_cfg sdm845_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6b000, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x6b800, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>  
>  static const struct dpu_intf_cfg sc7180_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>  };
>  
>  static const struct dpu_intf_cfg sm8150_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6b000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x6b800, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>  
>  static const struct dpu_intf_cfg sc7280_intf[] = {
> @@ -1270,18 +1270,18 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>  };
>  
>  static const struct dpu_intf_cfg sc8180x_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6b000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>  	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> -	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> -	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_3", INTF_3, 0x6b800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_4", INTF_4, 0x6c000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> +	INTF_BLK("intf_5", INTF_5, 0x6c800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>  };
>  
>  static const struct dpu_intf_cfg qcm2290_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>  };
>  
>  /*************************************************************
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 38aa38ab1568..4e3fd67e32df 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -20,8 +20,8 @@
>  #define MAX_BLOCKS    12
>  
>  #define DPU_HW_VER(MAJOR, MINOR, STEP) (((MAJOR & 0xF) << 28)    |\
> -		((MINOR & 0xFFF) << 16)  |\
> -		(STEP & 0xFFFF))
> +		((MINOR & 0xfff) << 16)  |\
> +		(STEP & 0xffff))
>  
>  #define DPU_HW_MAJOR(rev)		((rev) >> 28)
>  #define DPU_HW_MINOR(rev)		(((rev) >> 16) & 0xFFF)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index a35ecb6676c8..de7d21553aa2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -414,7 +414,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>  			switch (stage_cfg->stage[i][j]) {
>  			case SSPP_VIG0:
>  				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= ((i + 1) & 0xF) << 0;
> +					mixercfg_ext3 |= ((i + 1) & 0xf) << 0;
>  				} else {
>  					mixercfg |= mix << 0;
>  					mixercfg_ext |= ext << 0;
> @@ -422,7 +422,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>  				break;
>  			case SSPP_VIG1:
>  				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= ((i + 1) & 0xF) << 4;
> +					mixercfg_ext3 |= ((i + 1) & 0xf) << 4;
>  				} else {
>  					mixercfg |= mix << 3;
>  					mixercfg_ext |= ext << 2;
> @@ -430,7 +430,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>  				break;
>  			case SSPP_VIG2:
>  				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= ((i + 1) & 0xF) << 8;
> +					mixercfg_ext3 |= ((i + 1) & 0xf) << 8;
>  				} else {
>  					mixercfg |= mix << 6;
>  					mixercfg_ext |= ext << 4;
> @@ -438,7 +438,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>  				break;
>  			case SSPP_VIG3:
>  				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= ((i + 1) & 0xF) << 12;
> +					mixercfg_ext3 |= ((i + 1) & 0xf) << 12;
>  				} else {
>  					mixercfg |= mix << 26;
>  					mixercfg_ext |= ext << 6;
> @@ -462,7 +462,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>  				break;
>  			case SSPP_DMA0:
>  				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= ((i + 1) & 0xF) << 8;
> +					mixercfg_ext2 |= ((i + 1) & 0xf) << 8;
>  				} else {
>  					mixercfg |= mix << 18;
>  					mixercfg_ext |= ext << 16;
> @@ -470,7 +470,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>  				break;
>  			case SSPP_DMA1:
>  				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= ((i + 1) & 0xF) << 12;
> +					mixercfg_ext2 |= ((i + 1) & 0xf) << 12;
>  				} else {
>  					mixercfg |= mix << 21;
>  					mixercfg_ext |= ext << 18;
> @@ -478,25 +478,25 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>  				break;
>  			case SSPP_DMA2:
>  				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= ((i + 1) & 0xF) << 16;
> +					mixercfg_ext2 |= ((i + 1) & 0xf) << 16;
>  				} else {
> -					mix |= (i + 1) & 0xF;
> +					mix |= (i + 1) & 0xf;
>  					mixercfg_ext2 |= mix << 0;
>  				}
>  				break;
>  			case SSPP_DMA3:
>  				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= ((i + 1) & 0xF) << 20;
> +					mixercfg_ext2 |= ((i + 1) & 0xf) << 20;
>  				} else {
> -					mix |= (i + 1) & 0xF;
> +					mix |= (i + 1) & 0xf;
>  					mixercfg_ext2 |= mix << 4;
>  				}
>  				break;
>  			case SSPP_CURSOR0:
> -				mixercfg_ext |= ((i + 1) & 0xF) << 20;
> +				mixercfg_ext |= ((i + 1) & 0xf) << 20;
>  				break;
>  			case SSPP_CURSOR1:
> -				mixercfg_ext |= ((i + 1) & 0xF) << 26;
> +				mixercfg_ext |= ((i + 1) & 0xf) << 26;
>  				break;
>  			default:
>  				break;
> @@ -561,7 +561,7 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>  	struct dpu_hw_blk_reg_map *c = &ctx->hw;
>  	u32 intf_cfg = 0;
>  
> -	intf_cfg |= (cfg->intf & 0xF) << 4;
> +	intf_cfg |= (cfg->intf & 0xf) << 4;
>  
>  	if (cfg->mode_3d) {
>  		intf_cfg |= BIT(19);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index f5120ea91ede..6653abe8301a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -91,11 +91,11 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>  
>  	if (border_en) {
>  		DPU_REG_WRITE(c, LM_BORDER_COLOR_0,
> -			(color->color_0 & 0xFFF) |
> -			((color->color_1 & 0xFFF) << 0x10));
> +			(color->color_0 & 0xfff) |
> +			((color->color_1 & 0xfff) << 0x10));
>  		DPU_REG_WRITE(c, LM_BORDER_COLOR_1,
> -			(color->color_2 & 0xFFF) |
> -			((color->color_3 & 0xFFF) << 0x10));
> +			(color->color_2 & 0xfff) |
> +			((color->color_3 & 0xfff) << 0x10));
>  	}
>  }
>  
> @@ -123,7 +123,7 @@ static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx
>  	if (WARN_ON(stage_off < 0))
>  		return;
>  
> -	const_alpha = (bg_alpha & 0xFF) | ((fg_alpha & 0xFF) << 16);
> +	const_alpha = (bg_alpha & 0xff) | ((fg_alpha & 0xff) << 16);
>  	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA + stage_off, const_alpha);
>  	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 0fcad9760b6f..97c5523b927c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -223,19 +223,19 @@ static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
>  {
>  	struct dpu_hw_blk_reg_map *c = &pp->hw;
>  	u32 height, init;
> -	u32 line = 0xFFFF;
> +	u32 line = 0xffff;
>  
>  	if (!pp)
>  		return 0;
>  	c = &pp->hw;
>  
> -	init = DPU_REG_READ(c, PP_VSYNC_INIT_VAL) & 0xFFFF;
> -	height = DPU_REG_READ(c, PP_SYNC_CONFIG_HEIGHT) & 0xFFFF;
> +	init = DPU_REG_READ(c, PP_VSYNC_INIT_VAL) & 0xffff;
> +	height = DPU_REG_READ(c, PP_SYNC_CONFIG_HEIGHT) & 0xffff;
>  
>  	if (height < init)
>  		return line;
>  
> -	line = DPU_REG_READ(c, PP_INT_COUNT_VAL) & 0xFFFF;
> +	line = DPU_REG_READ(c, PP_INT_COUNT_VAL) & 0xffff;
>  
>  	if (line < init)
>  		line += (0xFFFF - init);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 691c471b08c2..f182c1ce704c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -488,17 +488,17 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
>  		ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
>  
>  		if (rect_index == DPU_SSPP_RECT_0) {
> -			ystride0 = (ystride0 & 0xFFFF0000) |
> -				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
> -			ystride1 = (ystride1 & 0xFFFF0000)|
> -				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
> +			ystride0 = (ystride0 & 0xffff0000) |
> +				(cfg->layout.plane_pitch[0] & 0x0000ffff);
> +			ystride1 = (ystride1 & 0xffff0000)|
> +				(cfg->layout.plane_pitch[2] & 0x0000ffff);
>  		} else {
> -			ystride0 = (ystride0 & 0x0000FFFF) |
> +			ystride0 = (ystride0 & 0x0000ffff) |
>  				((cfg->layout.plane_pitch[0] << 16) &
> -				 0xFFFF0000);
> -			ystride1 = (ystride1 & 0x0000FFFF) |
> +				 0xffff0000);
> +			ystride1 = (ystride1 & 0x0000ffff) |
>  				((cfg->layout.plane_pitch[2] << 16) &
> -				 0xFFFF0000);
> +				 0xffff0000);
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index 8062228eada6..699ea66b459e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -105,8 +105,8 @@ static void _dpu_hw_setup_scaler3_lut(struct dpu_hw_blk_reg_map *c,
>  	u32 lut_addr, lut_offset, lut_len;
>  	u32 *lut[QSEED3_FILTERS] = {NULL, NULL, NULL, NULL, NULL};
>  	static const uint32_t off_tbl[QSEED3_FILTERS][QSEED3_LUT_REGIONS][2] = {
> -		{{18, 0x000}, {12, 0x120}, {12, 0x1E0}, {8, 0x2A0} },
> -		{{6, 0x320}, {3, 0x3E0}, {3, 0x440}, {3, 0x4A0} },
> +		{{18, 0x000}, {12, 0x120}, {12, 0x1e0}, {8, 0x2a0} },
> +		{{6, 0x320}, {3, 0x3e0}, {3, 0x440}, {3, 0x4a0} },
>  		{{6, 0x500}, {3, 0x5c0}, {3, 0x620}, {3, 0x680} },
>  		{{6, 0x380}, {3, 0x410}, {3, 0x470}, {3, 0x4d0} },
>  		{{6, 0x560}, {3, 0x5f0}, {3, 0x650}, {3, 0x6b0} },
> @@ -231,30 +231,30 @@ static void _dpu_hw_setup_scaler3_de(struct dpu_hw_blk_reg_map *c,
>  	if (!de_cfg->enable)
>  		return;
>  
> -	sharp_lvl = (de_cfg->sharpen_level1 & 0x1FF) |
> -		((de_cfg->sharpen_level2 & 0x1FF) << 16);
> +	sharp_lvl = (de_cfg->sharpen_level1 & 0x1ff) |
> +		((de_cfg->sharpen_level2 & 0x1ff) << 16);
>  
> -	sharp_ctl = ((de_cfg->limit & 0xF) << 9) |
> +	sharp_ctl = ((de_cfg->limit & 0xf) << 9) |
>  		((de_cfg->prec_shift & 0x7) << 13) |
>  		((de_cfg->clip & 0x7) << 16);
>  
> -	shape_ctl = (de_cfg->thr_quiet & 0xFF) |
> -		((de_cfg->thr_dieout & 0x3FF) << 16);
> +	shape_ctl = (de_cfg->thr_quiet & 0xff) |
> +		((de_cfg->thr_dieout & 0x3ff) << 16);
>  
> -	de_thr = (de_cfg->thr_low & 0x3FF) |
> -		((de_cfg->thr_high & 0x3FF) << 16);
> +	de_thr = (de_cfg->thr_low & 0x3ff) |
> +		((de_cfg->thr_high & 0x3ff) << 16);
>  
> -	adjust_a = (de_cfg->adjust_a[0] & 0x3FF) |
> -		((de_cfg->adjust_a[1] & 0x3FF) << 10) |
> -		((de_cfg->adjust_a[2] & 0x3FF) << 20);
> +	adjust_a = (de_cfg->adjust_a[0] & 0x3ff) |
> +		((de_cfg->adjust_a[1] & 0x3ff) << 10) |
> +		((de_cfg->adjust_a[2] & 0x3ff) << 20);
>  
> -	adjust_b = (de_cfg->adjust_b[0] & 0x3FF) |
> -		((de_cfg->adjust_b[1] & 0x3FF) << 10) |
> -		((de_cfg->adjust_b[2] & 0x3FF) << 20);
> +	adjust_b = (de_cfg->adjust_b[0] & 0x3ff) |
> +		((de_cfg->adjust_b[1] & 0x3ff) << 10) |
> +		((de_cfg->adjust_b[2] & 0x3ff) << 20);
>  
> -	adjust_c = (de_cfg->adjust_c[0] & 0x3FF) |
> -		((de_cfg->adjust_c[1] & 0x3FF) << 10) |
> -		((de_cfg->adjust_c[2] & 0x3FF) << 20);
> +	adjust_c = (de_cfg->adjust_c[0] & 0x3ff) |
> +		((de_cfg->adjust_c[1] & 0x3ff) << 10) |
> +		((de_cfg->adjust_c[2] & 0x3ff) << 20);
>  
>  	DPU_REG_WRITE(c, QSEED3_DE_SHARPEN + offset, sharp_lvl);
>  	DPU_REG_WRITE(c, QSEED3_DE_SHARPEN_CTL + offset, sharp_ctl);
> @@ -289,19 +289,19 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
>  	op_mode |= (scaler3_cfg->dir_en) ? BIT(4) : 0;
>  
>  	preload =
> -		((scaler3_cfg->preload_x[0] & 0x7F) << 0) |
> -		((scaler3_cfg->preload_y[0] & 0x7F) << 8) |
> -		((scaler3_cfg->preload_x[1] & 0x7F) << 16) |
> -		((scaler3_cfg->preload_y[1] & 0x7F) << 24);
> +		((scaler3_cfg->preload_x[0] & 0x7f) << 0) |
> +		((scaler3_cfg->preload_y[0] & 0x7f) << 8) |
> +		((scaler3_cfg->preload_x[1] & 0x7f) << 16) |
> +		((scaler3_cfg->preload_y[1] & 0x7f) << 24);
>  
> -	src_y_rgb = (scaler3_cfg->src_width[0] & 0x1FFFF) |
> -		((scaler3_cfg->src_height[0] & 0x1FFFF) << 16);
> +	src_y_rgb = (scaler3_cfg->src_width[0] & 0x1ffff) |
> +		((scaler3_cfg->src_height[0] & 0x1ffff) << 16);
>  
> -	src_uv = (scaler3_cfg->src_width[1] & 0x1FFFF) |
> -		((scaler3_cfg->src_height[1] & 0x1FFFF) << 16);
> +	src_uv = (scaler3_cfg->src_width[1] & 0x1ffff) |
> +		((scaler3_cfg->src_height[1] & 0x1ffff) << 16);
>  
> -	dst = (scaler3_cfg->dst_width & 0x1FFFF) |
> -		((scaler3_cfg->dst_height & 0x1FFFF) << 16);
> +	dst = (scaler3_cfg->dst_width & 0x1ffff) |
> +		((scaler3_cfg->dst_height & 0x1ffff) << 16);
>  
>  	if (scaler3_cfg->de.enable) {
>  		_dpu_hw_setup_scaler3_de(c, &scaler3_cfg->de, scaler_offset);
> @@ -317,33 +317,33 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
>  
>  	if (scaler_version == 0x1002) {
>  		phase_init =
> -			((scaler3_cfg->init_phase_x[0] & 0x3F) << 0) |
> -			((scaler3_cfg->init_phase_y[0] & 0x3F) << 8) |
> -			((scaler3_cfg->init_phase_x[1] & 0x3F) << 16) |
> -			((scaler3_cfg->init_phase_y[1] & 0x3F) << 24);
> +			((scaler3_cfg->init_phase_x[0] & 0x3f) << 0) |
> +			((scaler3_cfg->init_phase_y[0] & 0x3f) << 8) |
> +			((scaler3_cfg->init_phase_x[1] & 0x3f) << 16) |
> +			((scaler3_cfg->init_phase_y[1] & 0x3f) << 24);
>  		DPU_REG_WRITE(c, QSEED3_PHASE_INIT + scaler_offset, phase_init);
>  	} else {
>  		DPU_REG_WRITE(c, QSEED3_PHASE_INIT_Y_H + scaler_offset,
> -			scaler3_cfg->init_phase_x[0] & 0x1FFFFF);
> +			scaler3_cfg->init_phase_x[0] & 0x1fffff);
>  		DPU_REG_WRITE(c, QSEED3_PHASE_INIT_Y_V + scaler_offset,
> -			scaler3_cfg->init_phase_y[0] & 0x1FFFFF);
> +			scaler3_cfg->init_phase_y[0] & 0x1fffff);
>  		DPU_REG_WRITE(c, QSEED3_PHASE_INIT_UV_H + scaler_offset,
> -			scaler3_cfg->init_phase_x[1] & 0x1FFFFF);
> +			scaler3_cfg->init_phase_x[1] & 0x1fffff);
>  		DPU_REG_WRITE(c, QSEED3_PHASE_INIT_UV_V + scaler_offset,
> -			scaler3_cfg->init_phase_y[1] & 0x1FFFFF);
> +			scaler3_cfg->init_phase_y[1] & 0x1fffff);
>  	}
>  
>  	DPU_REG_WRITE(c, QSEED3_PHASE_STEP_Y_H + scaler_offset,
> -		scaler3_cfg->phase_step_x[0] & 0xFFFFFF);
> +		scaler3_cfg->phase_step_x[0] & 0xffffff);
>  
>  	DPU_REG_WRITE(c, QSEED3_PHASE_STEP_Y_V + scaler_offset,
> -		scaler3_cfg->phase_step_y[0] & 0xFFFFFF);
> +		scaler3_cfg->phase_step_y[0] & 0xffffff);
>  
>  	DPU_REG_WRITE(c, QSEED3_PHASE_STEP_UV_H + scaler_offset,
> -		scaler3_cfg->phase_step_x[1] & 0xFFFFFF);
> +		scaler3_cfg->phase_step_x[1] & 0xffffff);
>  
>  	DPU_REG_WRITE(c, QSEED3_PHASE_STEP_UV_V + scaler_offset,
> -		scaler3_cfg->phase_step_y[1] & 0xFFFFFF);
> +		scaler3_cfg->phase_step_y[1] & 0xffffff);
>  
>  	DPU_REG_WRITE(c, QSEED3_PRELOAD + scaler_offset, preload);
>  
> @@ -383,19 +383,19 @@ void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map *c,
>  	u32 val;
>  
>  	/* matrix coeff - convert S15.16 to S4.9 */
> -	val = ((data->csc_mv[0] >> matrix_shift) & 0x1FFF) |
> -		(((data->csc_mv[1] >> matrix_shift) & 0x1FFF) << 16);
> +	val = ((data->csc_mv[0] >> matrix_shift) & 0x1fff) |
> +		(((data->csc_mv[1] >> matrix_shift) & 0x1fff) << 16);
>  	DPU_REG_WRITE(c, csc_reg_off, val);
> -	val = ((data->csc_mv[2] >> matrix_shift) & 0x1FFF) |
> -		(((data->csc_mv[3] >> matrix_shift) & 0x1FFF) << 16);
> +	val = ((data->csc_mv[2] >> matrix_shift) & 0x1fff) |
> +		(((data->csc_mv[3] >> matrix_shift) & 0x1fff) << 16);
>  	DPU_REG_WRITE(c, csc_reg_off + 0x4, val);
> -	val = ((data->csc_mv[4] >> matrix_shift) & 0x1FFF) |
> -		(((data->csc_mv[5] >> matrix_shift) & 0x1FFF) << 16);
> +	val = ((data->csc_mv[4] >> matrix_shift) & 0x1fff) |
> +		(((data->csc_mv[5] >> matrix_shift) & 0x1fff) << 16);
>  	DPU_REG_WRITE(c, csc_reg_off + 0x8, val);
> -	val = ((data->csc_mv[6] >> matrix_shift) & 0x1FFF) |
> -		(((data->csc_mv[7] >> matrix_shift) & 0x1FFF) << 16);
> +	val = ((data->csc_mv[6] >> matrix_shift) & 0x1fff) |
> +		(((data->csc_mv[7] >> matrix_shift) & 0x1fff) << 16);
>  	DPU_REG_WRITE(c, csc_reg_off + 0xc, val);
> -	val = (data->csc_mv[8] >> matrix_shift) & 0x1FFF;
> +	val = (data->csc_mv[8] >> matrix_shift) & 0x1fff;
>  	DPU_REG_WRITE(c, csc_reg_off + 0x10, val);
>  
>  	/* Pre clamp */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> index 16c56e240706..e9991cf00d8a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> @@ -120,7 +120,7 @@ static u32 dpu_hw_get_limit_conf(struct dpu_hw_vbif *vbif,
>  	reg_off += (xin_id / 4) * 4;
>  	bit_off = (xin_id % 4) * 8;
>  	reg_val = DPU_REG_READ(c, reg_off);
> -	limit = (reg_val >> bit_off) & 0xFF;
> +	limit = (reg_val >> bit_off) & 0xff;
>  
>  	return limit;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index 2d28afdf860e..0b998717c8fc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -124,7 +124,7 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
>  	else
>  		outsize = (data->dest.height << 16) | data->dest.width;
>  
> -	DPU_REG_WRITE(c, WB_ALPHA_X_VALUE, 0xFF);
> +	DPU_REG_WRITE(c, WB_ALPHA_X_VALUE, 0xff);
>  	DPU_REG_WRITE(c, WB_DST_FORMAT, dst_format);
>  	DPU_REG_WRITE(c, WB_DST_OP_MODE, opmode);
>  	DPU_REG_WRITE(c, WB_DST_PACK_PATTERN, pattern);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 5e6e2626151e..aeb82817e852 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -207,9 +207,9 @@ static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
>  	base = dpu_kms->mmio + regset->offset;
>  
>  	/* insert padding spaces, if needed */
> -	if (regset->offset & 0xF) {
> +	if (regset->offset & 0xf) {
>  		seq_printf(s, "[%x]", regset->offset & ~0xF);
> -		for (i = 0; i < (regset->offset & 0xF); i += 4)
> +		for (i = 0; i < (regset->offset & 0xf); i += 4)
>  			seq_puts(s, "         ");
>  	}
>  
> @@ -218,7 +218,7 @@ static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
>  	/* main register output */
>  	for (i = 0; i < regset->blk_len; i += 4) {
>  		addr = regset->offset + i;
> -		if ((addr & 0xF) == 0x0)
> +		if ((addr & 0xf) == 0x0)
>  			seq_printf(s, i ? "\n[%x]" : "[%x]", addr);
>  		seq_printf(s, " %08x", readl_relaxed(base + i));
>  	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 658005f609f4..9b4dc08ddd5b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -578,9 +578,9 @@ static void _dpu_plane_setup_pixel_ext(struct dpu_hw_scaler3_cfg *scale_cfg,
>  static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
>  	{
>  		/* S15.16 format */
> -		0x00012A00, 0x00000000, 0x00019880,
> -		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
> -		0x00012A00, 0x00020480, 0x00000000,
> +		0x00012a00, 0x00000000, 0x00019880,
> +		0x00012a00, 0xffff9b80, 0xffff3000,
> +		0x00012a00, 0x00020480, 0x00000000,
>  	},
>  	/* signed bias */
>  	{ 0xfff0, 0xff80, 0xff80,},
> @@ -593,9 +593,9 @@ static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
>  static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
>  	{
>  		/* S15.16 format */
> -		0x00012A00, 0x00000000, 0x00019880,
> -		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
> -		0x00012A00, 0x00020480, 0x00000000,
> +		0x00012a00, 0x00000000, 0x00019880,
> +		0x00012a00, 0xffff9b80, 0xffff3000,
> +		0x00012a00, 0x00020480, 0x00000000,
>  		},
>  	/* signed bias */
>  	{ 0xffc0, 0xfe00, 0xfe00,},
> @@ -702,7 +702,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>  	/* update sspp */
>  	if (fmt && pdpu->pipe_hw->ops.setup_solidfill) {
>  		pdpu->pipe_hw->ops.setup_solidfill(pdpu->pipe_hw,
> -				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24),
> +				(color & 0xffffff) | ((alpha & 0xff) << 24),
>  				pstate->multirect_index);
>  
>  		/* override scaler/decimation if solid fill */
> @@ -1083,10 +1083,10 @@ void dpu_plane_flush(struct drm_plane *plane)
>  	 */
>  	if (pdpu->is_error)
>  		/* force white frame with 100% alpha pipe output on error */
> -		_dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
> +		_dpu_plane_color_fill(pdpu, 0xffffff, 0xff);
>  	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>  		/* force 100% alpha */
> -		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> +		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xff);
>  	else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
>  		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
>  		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> index 1305e250b71e..cf24eeadd1b6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> @@ -192,7 +192,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
>  	if (vbif->ops.set_write_gather_en && !params->rd)
>  		vbif->ops.set_write_gather_en(vbif, params->xin_id);
>  
> -	ot_lim = _dpu_vbif_get_ot_limit(vbif, params) & 0xFF;
> +	ot_lim = _dpu_vbif_get_ot_limit(vbif, params) & 0xff;
>  
>  	if (ot_lim == 0)
>  		return;
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index 1f1555aa02d2..fb3c4a620517 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -76,7 +76,7 @@ static const struct mdp5_cfg_hw msm8x74v1_config = {
>  			     },
>  		.nb_stages = 5,
>  		.max_width = 2048,
> -		.max_height = 0xFFFF,
> +		.max_height = 0xffff,
>  	},
>  	.dspp = {
>  		.count = 3,
> @@ -159,7 +159,7 @@ static const struct mdp5_cfg_hw msm8x74v2_config = {
>  			     },
>  		.nb_stages = 5,
>  		.max_width = 2048,
> -		.max_height = 0xFFFF,
> +		.max_height = 0xffff,
>  	},
>  	.dspp = {
>  		.count = 3,
> @@ -258,7 +258,7 @@ static const struct mdp5_cfg_hw apq8084_config = {
>  			     },
>  		.nb_stages = 5,
>  		.max_width = 2048,
> -		.max_height = 0xFFFF,
> +		.max_height = 0xffff,
>  	},
>  	.dspp = {
>  		.count = 4,
> @@ -340,7 +340,7 @@ static const struct mdp5_cfg_hw msm8x16_config = {
>  			     },
>  		.nb_stages = 8,
>  		.max_width = 2048,
> -		.max_height = 0xFFFF,
> +		.max_height = 0xffff,
>  	},
>  	.dspp = {
>  		.count = 1,
> @@ -412,7 +412,7 @@ static const struct mdp5_cfg_hw msm8x36_config = {
>  				},
>  		.nb_stages = 8,
>  		.max_width = 2560,
> -		.max_height = 0xFFFF,
> +		.max_height = 0xffff,
>  	},
>  	.pp = {
>  		.count = 1,
> @@ -510,7 +510,7 @@ static const struct mdp5_cfg_hw msm8x94_config = {
>  			     },
>  		.nb_stages = 8,
>  		.max_width = 2048,
> -		.max_height = 0xFFFF,
> +		.max_height = 0xffff,
>  	},
>  	.dspp = {
>  		.count = 4,
> @@ -616,7 +616,7 @@ static const struct mdp5_cfg_hw msm8x96_config = {
>  			     },
>  		.nb_stages = 8,
>  		.max_width = 2560,
> -		.max_height = 0xFFFF,
> +		.max_height = 0xffff,
>  	},
>  	.dspp = {
>  		.count = 2,
> @@ -708,7 +708,7 @@ const struct mdp5_cfg_hw msm8x76_config = {
>  	},
>  	.pipe_cursor = {
>  		.count = 1,
> -		.base = { 0x440DC },
> +		.base = { 0x440dc },
>  		.caps = MDP_PIPE_CAP_HFLIP	|
>  			MDP_PIPE_CAP_VFLIP	|
>  			MDP_PIPE_CAP_SW_PIX_EXT	|
> @@ -726,7 +726,7 @@ const struct mdp5_cfg_hw msm8x76_config = {
>  			     },
>  		.nb_stages = 8,
>  		.max_width = 2560,
> -		.max_height = 0xFFFF,
> +		.max_height = 0xffff,
>  	},
>  	.dspp = {
>  		.count = 1,
> @@ -814,7 +814,7 @@ static const struct mdp5_cfg_hw msm8x53_config = {
>  			     },
>  		.nb_stages = 5,
>  		.max_width = 2048,
> -		.max_height = 0xFFFF,
> +		.max_height = 0xffff,
>  	},
>  	.dspp = {
>  		.count = 1,
> @@ -905,7 +905,7 @@ static const struct mdp5_cfg_hw msm8917_config = {
>  			     },
>  		.nb_stages = 8,
>  		.max_width = 2048,
> -		.max_height = 0xFFFF,
> +		.max_height = 0xffff,
>  	},
>  	.dspp = {
>  		.count = 1,
> @@ -1004,7 +1004,7 @@ static const struct mdp5_cfg_hw msm8998_config = {
>  			     },
>  		.nb_stages = 8,
>  		.max_width = 2560,
> -		.max_height = 0xFFFF,
> +		.max_height = 0xffff,
>  	},
>  	.dspp = {
>  		.count = 2,
> @@ -1102,7 +1102,7 @@ static const struct mdp5_cfg_hw sdm630_config = {
>  				},
>  		.nb_stages = 8,
>  		.max_width = 2048,
> -		.max_height = 0xFFFF,
> +		.max_height = 0xffff,
>  	},
>  	.dspp = {
>  		.count = 1,
> @@ -1200,7 +1200,7 @@ static const struct mdp5_cfg_hw sdm660_config = {
>  				},
>  		.nb_stages = 8,
>  		.max_width = 2560,
> -		.max_height = 0xFFFF,
> +		.max_height = 0xffff,
>  	},
>  	.dspp = {
>  		.count = 2,
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index e86421c69bd1..7ca78adcdeb4 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -293,7 +293,7 @@ static void blend_setup(struct drm_crtc *crtc)
>  		blend_op = MDP5_LM_BLEND_OP_MODE_FG_ALPHA(FG_CONST) |
>  			MDP5_LM_BLEND_OP_MODE_BG_ALPHA(BG_CONST);
>  		fg_alpha = pstates[i]->base.alpha >> 8;
> -		bg_alpha = 0xFF - fg_alpha;
> +		bg_alpha = 0xff - fg_alpha;
>  
>  		if (!format->alpha_enable && bg_alpha_enabled)
>  			mixer_op_mode = 0;
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
> index 79d67c495780..eeba31ed993e 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
> @@ -70,11 +70,11 @@ static void mdp5_vid_encoder_mode_set(struct drm_encoder *encoder,
>  				format |= 0x15;
>  				break;
>  			case 6:
> -				format |= 0x2A;
> +				format |= 0x2a;
>  				break;
>  			case 8:
>  			default:
> -				format |= 0x3F;
> +				format |= 0x3f;
>  				break;
>  			}
>  			break;
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index 6666783e1468..ff7f1620c3fb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -86,10 +86,10 @@ static u8 dp_audio_calculate_parity(u32 data)
>  	u8 iData = 0;
>  	u8 i = 0;
>  	u8 parity_byte;
> -	u8 num_byte = (data & 0xFF00) > 0 ? 8 : 2;
> +	u8 num_byte = (data & 0xff00) > 0 ? 8 : 2;
>  
>  	for (i = 0; i < num_byte; i++) {
> -		iData = (data >> i*4) & 0xF;
> +		iData = (data >> i*4) & 0xf;
>  
>  		ci = iData ^ x1;
>  		x1 = x0 ^ dp_audio_get_g1_value(ci);
> @@ -295,7 +295,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
>  	value = dp_audio_get_header(catalog,
>  			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
>  
> -	new_value = 0x0F;
> +	new_value = 0x0f;
>  	parity_byte = dp_audio_calculate_parity(new_value);
>  	value |= ((new_value << HEADER_BYTE_2_BIT)
>  			| (parity_byte << PARITY_BYTE_2_BIT));
> @@ -344,7 +344,7 @@ static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
>  	value = dp_audio_get_header(catalog,
>  			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
>  
> -	new_value = 0x0F;
> +	new_value = 0x0f;
>  	parity_byte = dp_audio_calculate_parity(new_value);
>  	value |= ((new_value << HEADER_BYTE_2_BIT)
>  			| (parity_byte << PARITY_BYTE_2_BIT));
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index d030a93a08c3..4ed7286ea813 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -154,7 +154,7 @@ static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
>  		data = dp_catalog_aux_read_data(aux->catalog);
>  		*dp++ = (u8)((data >> DP_AUX_DATA_OFFSET) & 0xff);
>  
> -		actual_i = (data >> DP_AUX_DATA_INDEX_OFFSET) & 0xFF;
> +		actual_i = (data >> DP_AUX_DATA_INDEX_OFFSET) & 0xff;
>  		if (i != actual_i)
>  			break;
>  	}
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 676279d0ca8d..49b3070f6b41 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -445,12 +445,12 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>  			(unsigned long)(1 << 16) - 1, &den, &num);
>  
>  	den = ~(den - num);
> -	den = den & 0xFFFF;
> +	den = den & 0xffff;
>  	pixel_m = num;
>  	pixel_n = den;
>  
> -	mvid = (pixel_m & 0xFFFF) * 5;
> -	nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
> +	mvid = (pixel_m & 0xffff) * 5;
> +	nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xffff);
>  
>  	if (nvid < nvid_fixed) {
>  		u32 temp;
> @@ -728,13 +728,13 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
>  				DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
>  		/* 00111110000011111000001111100000 */
>  		dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
> -				0x3E0F83E0);
> +				0x3e0f83e0);
>  		/* 00001111100000111110000011111000 */
>  		dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
> -				0x0F83E0F8);
> +				0x0f83e0f8);
>  		/* 1111100000111110 */
>  		dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
> -				0x0000F83E);
> +				0x0000f83e);
>  		break;
>  	case DP_PHY_TEST_PATTERN_CP2520:
>  		value = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> @@ -1085,7 +1085,7 @@ void dp_catalog_audio_sfe_level(struct dp_catalog *dp_catalog)
>  
>  	safe_to_exit_level = dp_catalog->audio_data;
>  	mainlink_levels = dp_read_link(catalog, REG_DP_MAINLINK_LEVELS);
> -	mainlink_levels &= 0xFE0;
> +	mainlink_levels &= 0xfe0;
>  	mainlink_levels |= safe_to_exit_level;
>  
>  	drm_dbg_dp(catalog->drm_dev,
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 3854c9f1f7e9..14f245d33ee2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -421,7 +421,7 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
>  	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
>  	temp2_fp = drm_fixp_div(temp1_fp, tu->average_valid2_fp);
>  	tu->n_tus = drm_fixp2int(temp2_fp);
> -	if ((temp2_fp & 0xFFFFFFFF) > 0xFFFFF000)
> +	if ((temp2_fp & 0xffffffff) > 0xfffff000)
>  		tu->n_tus += 1;
>  
>  	temp1_fp = drm_fixp_from_fraction(tu->n_tus, 1);
> @@ -720,7 +720,7 @@ static void _dp_ctrl_calc_tu(struct dp_ctrl_private *ctrl,
>  	temp1_fp = drm_fixp_from_fraction(tu->valid_boundary_link, 1);
>  	temp2_fp = drm_fixp_div(temp2_fp, temp1_fp);
>  	tu->n_tus = drm_fixp2int(temp2_fp);
> -	if ((temp2_fp & 0xFFFFFFFF) > 0xFFFFF000)
> +	if ((temp2_fp & 0xffffffff) > 0xfffff000)
>  		tu->n_tus += 1;
>  
>  	tu->even_distribution_legacy = tu->n_tus % tu->nlanes == 0 ? 1 : 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bfd0aeff3f0d..063f7ac79cfd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1202,7 +1202,7 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
>  
>  	hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
>  
> -	if (hpd_isr_status & 0x0F) {
> +	if (hpd_isr_status & 0x0f) {
>  		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
>  			dp->dp_display.connector_type, hpd_isr_status);
>  		/* hpd related interrupts */
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 36bb6191d2f0..e584f783a2e3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -97,7 +97,7 @@ static int dp_link_get_period(struct dp_link_private *link, int const addr)
>  {
>  	int ret = 0;
>  	u8 data;
> -	u32 const max_audio_period = 0xA;
> +	u32 const max_audio_period = 0xa;
>  
>  	/* TEST_AUDIO_PERIOD_CH_XX */
>  	if (drm_dp_dpcd_readb(link->aux, addr, &data) < 0) {
> @@ -107,7 +107,7 @@ static int dp_link_get_period(struct dp_link_private *link, int const addr)
>  	}
>  
>  	/* Period - Bits 3:0 */
> -	data = data & 0xF;
> +	data = data & 0xf;
>  	if ((int)data > max_audio_period) {
>  		DRM_ERROR("invalid test_audio_period_ch_1 = 0x%x\n", data);
>  		ret = -EINVAL;
> @@ -228,7 +228,7 @@ static int dp_link_parse_audio_mode(struct dp_link_private *link)
>  	}
>  
>  	/* Sampling Rate - Bits 3:0 */
> -	sampling_rate = data & 0xF;
> +	sampling_rate = data & 0xf;
>  	if (sampling_rate > max_audio_sampling_rate) {
>  		DRM_ERROR("sampling rate (0x%x) greater than max (0x%x)\n",
>  				sampling_rate, max_audio_sampling_rate);
> @@ -237,7 +237,7 @@ static int dp_link_parse_audio_mode(struct dp_link_private *link)
>  	}
>  
>  	/* Channel Count - Bits 7:4 */
> -	channel_count = ((data & 0xF0) >> 4) + 1;
> +	channel_count = ((data & 0xf0) >> 4) + 1;
>  	if (channel_count > max_audio_channel_count) {
>  		DRM_ERROR("channel_count (0x%x) greater than max (0x%x)\n",
>  				channel_count, max_audio_channel_count);
> @@ -343,7 +343,7 @@ static int dp_link_parse_timing_params2(struct dp_link_private *link,
>  	}
>  
>  	*val1 = (bp[0] & BIT(7)) >> 7;
> -	*val2 = bp[1] | ((bp[0] & 0x7F) << 8);
> +	*val2 = bp[1] | ((bp[0] & 0x7f) << 8);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 27b592c776a3..1a2519ef881f 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -885,9 +885,9 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
>  	data = dsi_phy_read(base + REG_DSI_10nm_PHY_CMN_CTRL_0);
>  
>  	/* TODO: only power up lanes that are used */
> -	data |= 0x1F;
> +	data |= 0x1f;
>  	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_0, data);
> -	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CTRL0, 0x1F);
> +	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CTRL0, 0x1f);
>  
>  	/* Select full-rate mode */
>  	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_2, 0x40);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 9e7fa7d88ead..92c345bc2800 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -870,7 +870,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  		glbl_str_swi_cal_sel_ctrl = 0x00;
>  		glbl_hstx_str_ctrl_0 = 0x88;
>  	} else {
> -		vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
> +		vreg_ctrl_0 = less_than_1500_mhz ? 0x5b : 0x59;
>  		if (phy->cphy_mode) {
>  			glbl_str_swi_cal_sel_ctrl = 0x03;
>  			glbl_hstx_str_ctrl_0 = 0x66;
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 93fe61b86967..d2d36f66a4d2 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -434,12 +434,12 @@ static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
>  		break;
>  	case 6:
>  		/* RR, RL, FC, LFE, FR and FL speakers */
> -		channel_allocation  = 0x0B;
> +		channel_allocation  = 0x0b;
>  		chan = MSM_HDMI_AUDIO_CHANNEL_6;
>  		break;
>  	case 8:
>  		/* FRC, FLC, RR, RL, FC, LFE, FR and FL speakers */
> -		channel_allocation  = 0x1F;
> +		channel_allocation  = 0x1f;
>  		chan = MSM_HDMI_AUDIO_CHANNEL_8;
>  		break;
>  	default:
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c b/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
> index e7748461cffc..2e13ca7e7acb 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
> @@ -494,8 +494,8 @@ static int msm_hdmi_hdcp_auth_prepare(struct hdmi_hdcp_ctrl *hdcp_ctrl)
>  	 * HDCP setup prior to enabling HDCP_CTRL.
>  	 * Setup seed values for random number An.
>  	 */
> -	hdmi_write(hdmi, REG_HDMI_HDCP_ENTROPY_CTRL0, 0xB1FFB0FF);
> -	hdmi_write(hdmi, REG_HDMI_HDCP_ENTROPY_CTRL1, 0xF00DFACE);
> +	hdmi_write(hdmi, REG_HDMI_HDCP_ENTROPY_CTRL0, 0xb1ffb0ff);
> +	hdmi_write(hdmi, REG_HDMI_HDCP_ENTROPY_CTRL1, 0xf00dface);
>  
>  	/* Disable the RngCipher state */
>  	reg_val = hdmi_read(hdmi, REG_HDMI_HDCP_DEBUG_CTRL);
> @@ -660,11 +660,11 @@ static int msm_hdmi_hdcp_send_aksv_an(struct hdmi_hdcp_ctrl *hdcp_ctrl)
>  
>  	DBG("Link ASKV=%08x%08x", link0_aksv_0, link0_aksv_1);
>  	/* Copy An and AKSV to byte arrays for transmission */
> -	aksv[0] =  link0_aksv_0        & 0xFF;
> -	aksv[1] = (link0_aksv_0 >> 8)  & 0xFF;
> -	aksv[2] = (link0_aksv_0 >> 16) & 0xFF;
> -	aksv[3] = (link0_aksv_0 >> 24) & 0xFF;
> -	aksv[4] =  link0_aksv_1        & 0xFF;
> +	aksv[0] =  link0_aksv_0        & 0xff;
> +	aksv[1] = (link0_aksv_0 >> 8)  & 0xff;
> +	aksv[2] = (link0_aksv_0 >> 16) & 0xff;
> +	aksv[3] = (link0_aksv_0 >> 24) & 0xff;
> +	aksv[4] =  link0_aksv_1        & 0xff;
>  
>  	/* Write An to offset 0x18 */
>  	rc = msm_hdmi_ddc_write(hdmi, HDCP_PORT_ADDR, 0x18, (u8 *)link0_an,
> @@ -681,7 +681,7 @@ static int msm_hdmi_hdcp_send_aksv_an(struct hdmi_hdcp_ctrl *hdcp_ctrl)
>  		pr_err("%s:AKSV write failed\n", __func__);
>  		return rc;
>  	}
> -	DBG("Link0-AKSV=%02x%08x", link0_aksv_1 & 0xFF, link0_aksv_0);
> +	DBG("Link0-AKSV=%02x%08x", link0_aksv_1 & 0xff, link0_aksv_0);
>  
>  	return 0;
>  }
> @@ -879,7 +879,7 @@ static int msm_hdmi_hdcp_recv_check_bstatus(struct hdmi_hdcp_ctrl *hdcp_ctrl,
>  	*pbstatus = bstatus = (buf[1] << 8) | buf[0];
>  
>  
> -	down_stream_devices = bstatus & 0x7F;
> +	down_stream_devices = bstatus & 0x7f;
>  	repeater_cascade_depth = (bstatus >> 8) & 0x7;
>  	max_devs_exceeded = (bstatus & BIT(7)) ? true : false;
>  	max_cascade_exceeded = (bstatus & BIT(11)) ? true : false;
> @@ -996,7 +996,7 @@ static int msm_hdmi_hdcp_transfer_v_h(struct hdmi_hdcp_ctrl *hdcp_ctrl)
>  		{REG_HDMI_HDCP_RCVPORT_DATA7,  0x20, "V' H0"},
>  		{REG_HDMI_HDCP_RCVPORT_DATA8,  0x24, "V' H1"},
>  		{REG_HDMI_HDCP_RCVPORT_DATA9,  0x28, "V' H2"},
> -		{REG_HDMI_HDCP_RCVPORT_DATA10, 0x2C, "V' H3"},
> +		{REG_HDMI_HDCP_RCVPORT_DATA10, 0x2c, "V' H3"},
>  		{REG_HDMI_HDCP_RCVPORT_DATA11, 0x30, "V' H4"},
>  	};
>  	struct hdmi_hdcp_reg_data *rd;
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> index 4dd055416620..3845e2e7ea4c 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> @@ -335,7 +335,7 @@ static int pll_calculate(unsigned long pix_clk, unsigned long ref_clk,
>  
>  		cfg->tx_lx_vmode_ctrl2[0] =
>  			cfg->tx_lx_vmode_ctrl2[1] =
> -			cfg->tx_lx_vmode_ctrl2[2] = 0x0D;
> +			cfg->tx_lx_vmode_ctrl2[2] = 0x0d;
>  
>  		cfg->tx_lx_vmode_ctrl2[3] = 0x00;
>  	} else if (bclk > HDMI_MID_FREQ_BIT_CLK_THRESHOLD) {
> @@ -347,14 +347,14 @@ static int pll_calculate(unsigned long pix_clk, unsigned long ref_clk,
>  
>  		cfg->tx_lx_vmode_ctrl2[0] =
>  			cfg->tx_lx_vmode_ctrl2[1] =
> -			cfg->tx_lx_vmode_ctrl2[2] = 0x0D;
> +			cfg->tx_lx_vmode_ctrl2[2] = 0x0d;
>  		cfg->tx_lx_vmode_ctrl2[3] = 0x00;
>  	} else {
>  		for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
>  			cfg->tx_lx_tx_drv_lvl[i] = 0x20;
>  			cfg->tx_lx_tx_emp_post1_lvl[i] = 0x20;
>  			cfg->tx_lx_vmode_ctrl1[i] = 0x00;
> -			cfg->tx_lx_vmode_ctrl2[i] = 0x0E;
> +			cfg->tx_lx_vmode_ctrl2[i] = 0x0e;
>  		}
>  	}
>  
> @@ -418,8 +418,8 @@ static int hdmi_8996_pll_set_clk_rate(struct clk_hw *hw, unsigned long rate,
>  
>  	hdmi_phy_write(phy, REG_HDMI_8996_PHY_PD_CTL, 0x1);
>  	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_RESETSM_CNTRL, 0x20);
> -	hdmi_phy_write(phy, REG_HDMI_8996_PHY_TX0_TX1_LANE_CTL, 0x0F);
> -	hdmi_phy_write(phy, REG_HDMI_8996_PHY_TX2_TX3_LANE_CTL, 0x0F);
> +	hdmi_phy_write(phy, REG_HDMI_8996_PHY_TX0_TX1_LANE_CTL, 0x0f);
> +	hdmi_phy_write(phy, REG_HDMI_8996_PHY_TX2_TX3_LANE_CTL, 0x0f);
>  
>  	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
>  		hdmi_tx_chan_write(pll, i,
> @@ -438,18 +438,18 @@ static int hdmi_8996_pll_set_clk_rate(struct clk_hw *hw, unsigned long rate,
>  	hdmi_tx_chan_write(pll, 2, REG_HDMI_PHY_QSERDES_TX_LX_LANE_MODE,
>  			   cfg.tx_lx_lane_mode[2]);
>  
> -	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SYSCLK_BUF_ENABLE, 0x1E);
> +	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SYSCLK_BUF_ENABLE, 0x1e);
>  	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x07);
>  	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SYSCLK_EN_SEL, 0x37);
>  	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SYS_CLK_CTRL, 0x02);
> -	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_CLK_ENABLE1, 0x0E);
> +	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_CLK_ENABLE1, 0x0e);
>  
>  	/* Bypass VCO calibration */
>  	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SVS_MODE_CLK_SEL,
>  		       cfg.com_svs_mode_clk_sel);
>  
> -	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_BG_TRIM, 0x0F);
> -	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_PLL_IVCO, 0x0F);
> +	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_BG_TRIM, 0x0f);
> +	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_PLL_IVCO, 0x0f);
>  	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_VCO_TUNE_CTRL,
>  		       cfg.com_vco_tune_ctrl);
>  
> @@ -529,7 +529,7 @@ static int hdmi_8996_pll_set_clk_rate(struct clk_hw *hw, unsigned long rate,
>  	}
>  
>  	hdmi_phy_write(phy, REG_HDMI_8996_PHY_MODE, cfg.phy_mode);
> -	hdmi_phy_write(phy, REG_HDMI_8996_PHY_PD_CTL, 0x1F);
> +	hdmi_phy_write(phy, REG_HDMI_8996_PHY_PD_CTL, 0x1f);
>  
>  	/*
>  	 * Ensure that vco configuration gets flushed to hardware before
> @@ -608,7 +608,7 @@ static int hdmi_8996_pll_prepare(struct clk_hw *hw)
>  	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++)
>  		hdmi_tx_chan_write(pll, i,
>  			REG_HDMI_PHY_QSERDES_TX_LX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN,
> -			0x6F);
> +			0x6f);
>  
>  	/* Disable SSC */
>  	hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_PER1, 0x0);
