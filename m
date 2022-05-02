Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E7516FAC
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 14:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED73C10EA6A;
	Mon,  2 May 2022 12:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34F310E6B1;
 Mon,  2 May 2022 12:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651495203; x=1683031203;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X1ivxEkQnI4EoiZmcAQSklX5iLRSFagKyHj82/dEO2w=;
 b=mPKog/bLzAmq22ghdPowj5PdHZRbcnDYA340iBcVPI3rBfiZmDoQB7T9
 0CiVu2J0RbraaV7l66JKhTQpAdlOYZ7CaDLIvybghQWSl5grpeY81ZJ84
 Coy6LdCRVDgTmE5zXLrrH1PFniZTpIBiR+0Odkjhvkw0XqnI+ihCs9QH/
 20XkT7+bJnJk809pNbmyjUcIXdeEUpwajQAsU+ZPmeAs/NB3u8COOrZo5
 ZxtPO2a+vn0gAtXEb4TvHbEvl6P71OleVI1zKpuyEwInl/3Vo89RQZ9tE
 T5+YFNw+uB4SwwHtTB7WQ7nbOTli6+pS5mMBIzPFijdto+WsFbCHV2cyE Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="327740602"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="327740602"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 05:40:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="583676390"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 05:40:00 -0700
Date: Mon, 2 May 2022 18:11:02 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>
Subject: Re: [PATCH v4 1/4] drm/i915/gt: Explicitly clear BB_OFFSET for new
 contexts
Message-ID: <20220502124101.GF31513@intel.com>
References: <20220502111003.32397-1-ramalingam.c@intel.com>
 <20220502111003.32397-2-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220502111003.32397-2-ramalingam.c@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-02 at 16:40:00 +0530, Ramalingam C wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Even though the initial protocontext we load onto HW has the register
> cleared, by the time we save it into the default image, BB_OFFSET has
> had the enable bit set. Reclear BB_OFFSET for each new context.
> 
> Testcase: igt/i915_selftests/gt_lrc
> 
> v2:
>   Extend it for gen8.
> v3:
>   BB_OFFSET is recorded per engine from Gen9 onwards
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Thomas,

Could you please reconfirm your R-b for v3? This R-b was given for v1.

Ram
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_regs.h |  1 +
>  drivers/gpu/drm/i915/gt/intel_lrc.c         | 20 ++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/selftest_lrc.c      |  5 +++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_regs.h b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
> index 75a0c55c5aa5..8c65f3a7acfb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
> @@ -109,6 +109,7 @@
>  #define RING_SBBSTATE(base)			_MMIO((base) + 0x118) /* hsw+ */
>  #define RING_SBBADDR_UDW(base)			_MMIO((base) + 0x11c) /* gen8+ */
>  #define RING_BBADDR(base)			_MMIO((base) + 0x140)
> +#define RING_BB_OFFSET(base)			_MMIO((base) + 0x158)
>  #define RING_BBADDR_UDW(base)			_MMIO((base) + 0x168) /* gen8+ */
>  #define CCID(base)				_MMIO((base) + 0x180)
>  #define   CCID_EN				BIT(0)
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index eec73c66406c..ee8ab7470a62 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -662,6 +662,21 @@ static int lrc_ring_mi_mode(const struct intel_engine_cs *engine)
>  		return -1;
>  }
>  
> +static int lrc_ring_bb_offset(const struct intel_engine_cs *engine)
> +{
> +	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
> +		return 0x80;
> +	else if (GRAPHICS_VER(engine->i915) >= 12)
> +		return 0x70;
> +	else if (GRAPHICS_VER(engine->i915) >= 9)
> +		return 0x64;
> +	else if (GRAPHICS_VER(engine->i915) >= 8 &&
> +		 engine->class == RENDER_CLASS)
> +		return 0xc4;
> +	else
> +		return -1;
> +}
> +
>  static int lrc_ring_gpr0(const struct intel_engine_cs *engine)
>  {
>  	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
> @@ -768,6 +783,7 @@ static void init_common_regs(u32 * const regs,
>  			     bool inhibit)
>  {
>  	u32 ctl;
> +	int loc;
>  
>  	ctl = _MASKED_BIT_ENABLE(CTX_CTRL_INHIBIT_SYN_CTX_SWITCH);
>  	ctl |= _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT);
> @@ -779,6 +795,10 @@ static void init_common_regs(u32 * const regs,
>  	regs[CTX_CONTEXT_CONTROL] = ctl;
>  
>  	regs[CTX_TIMESTAMP] = ce->stats.runtime.last;
> +
> +	loc = lrc_ring_bb_offset(engine);
> +	if (loc != -1)
> +		regs[loc + 1] = 0;
>  }
>  
>  static void init_wa_bb_regs(u32 * const regs,
> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> index 8b2c11dbe354..c4bd4e1ac5ef 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> @@ -357,6 +357,11 @@ static int live_lrc_fixed(void *arg)
>  				lrc_ring_cmd_buf_cctl(engine),
>  				"RING_CMD_BUF_CCTL"
>  			},
> +			{
> +				i915_mmio_reg_offset(RING_BB_OFFSET(engine->mmio_base)),
> +				lrc_ring_bb_offset(engine),
> +				"RING_BB_OFFSET"
> +			},
>  			{ },
>  		}, *t;
>  		u32 *hw;
> -- 
> 2.20.1
> 
