Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1723E4F987B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 16:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069A710F298;
	Fri,  8 Apr 2022 14:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C113910F1C7;
 Fri,  8 Apr 2022 14:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649429122; x=1680965122;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jCMSA/I74N7u788r7IZ6m+yFl211QRy1vWRL/QafB4E=;
 b=DXvyDrWwGrCCVEsw1QGPRk6RaFSqgtOsEWGGT+k2qMPsvQmM59C0Ipr3
 /d/lOfkpAIcmiziHNr/yIiRPk+AbsAWY5nFSWJyDT/DaEmyXfepedByLo
 Fm83nqEZWNLCVS5qvC84ucDFz8GrEp/7nJibVb72CTkVV7n42ZKZODnLD
 b2uU1zP3ICEpPxVpqvGghKHQmp5EFaKsauqLsGFwVbzfXNCCRreLaGG/n
 r9otjQMSy5zF7YzrIidphcpquH0rMwIHtubS/TLbFlS2YbW2qxxyU3E05
 Min6LH7K8cpZvTIod3b9wthlAwlllB18zDZVj+Oqyl8VPY4F5b8QMOGcG g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="259205953"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="259205953"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 07:45:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="571509457"
Received: from khupperx-mobl2.ger.corp.intel.com (HELO [10.249.254.37])
 ([10.249.254.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 07:45:20 -0700
Message-ID: <f4b2507d-b89e-00c2-891d-c0ee95a0989f@linux.intel.com>
Date: Fri, 8 Apr 2022 16:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915/gt: Explicitly clear BB_OFFSET
 for new contexts
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220314182005.17071-1-ramalingam.c@intel.com>
 <20220314182005.17071-2-ramalingam.c@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220314182005.17071-2-ramalingam.c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/14/22 19:20, Ramalingam C wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
>
> Even though the initial protocontext we load onto HW has the register
> cleared, by the time we save it into the default image, BB_OFFSET has
> had the enable bit set. Reclear BB_OFFSET for each new context.
>
> Testcase: igt/i915_selftests/gt_lrc
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



> ---
>   drivers/gpu/drm/i915/gt/intel_engine_regs.h |  1 +
>   drivers/gpu/drm/i915/gt/intel_lrc.c         | 17 +++++++++++++++++
>   drivers/gpu/drm/i915/gt/selftest_lrc.c      |  5 +++++
>   3 files changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_regs.h b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
> index 0bf8b45c9319..d6da3bbf66f8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
> @@ -109,6 +109,7 @@
>   #define RING_SBBSTATE(base)			_MMIO((base) + 0x118) /* hsw+ */
>   #define RING_SBBADDR_UDW(base)			_MMIO((base) + 0x11c) /* gen8+ */
>   #define RING_BBADDR(base)			_MMIO((base) + 0x140)
> +#define RING_BB_OFFSET(base)			_MMIO((base) + 0x158)
>   #define RING_BBADDR_UDW(base)			_MMIO((base) + 0x168) /* gen8+ */
>   #define CCID(base)				_MMIO((base) + 0x180)
>   #define   CCID_EN				BIT(0)
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 07bef7128fdb..f673bae97a03 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -662,6 +662,18 @@ static int lrc_ring_mi_mode(const struct intel_engine_cs *engine)
>   		return -1;
>   }
>   
> +static int lrc_ring_bb_offset(const struct intel_engine_cs *engine)
> +{
> +	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
> +		return 0x80;
> +	else if (GRAPHICS_VER(engine->i915) >= 12)
> +		return 0x70;
> +	else if (GRAPHICS_VER(engine->i915) >= 9)
> +		return 0x64;
> +	else
> +		return -1;
> +}
> +
>   static int lrc_ring_gpr0(const struct intel_engine_cs *engine)
>   {
>   	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
> @@ -768,6 +780,7 @@ static void init_common_regs(u32 * const regs,
>   			     bool inhibit)
>   {
>   	u32 ctl;
> +	int loc;
>   
>   	ctl = _MASKED_BIT_ENABLE(CTX_CTRL_INHIBIT_SYN_CTX_SWITCH);
>   	ctl |= _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT);
> @@ -779,6 +792,10 @@ static void init_common_regs(u32 * const regs,
>   	regs[CTX_CONTEXT_CONTROL] = ctl;
>   
>   	regs[CTX_TIMESTAMP] = ce->runtime.last;
> +
> +	loc = lrc_ring_bb_offset(engine);
> +	if  (loc != -1)
> +		regs[loc + 1] = 0;
>   }
>   
>   static void init_wa_bb_regs(u32 * const regs,
> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> index 21c29d315cc0..13f57c7c4224 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> @@ -323,6 +323,11 @@ static int live_lrc_fixed(void *arg)
>   				lrc_ring_cmd_buf_cctl(engine),
>   				"RING_CMD_BUF_CCTL"
>   			},
> +			{
> +				i915_mmio_reg_offset(RING_BB_OFFSET(engine->mmio_base)),
> +				lrc_ring_bb_offset(engine),
> +				"RING_BB_OFFSET"
> +			},
>   			{ },
>   		}, *t;
>   		u32 *hw;
