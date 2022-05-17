Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7F752AE61
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 01:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788C5113BCD;
	Tue, 17 May 2022 23:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABA7113BCD;
 Tue, 17 May 2022 23:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=piTVpL+EgRF0+LYEUQ5kkEfL1vSIzB3sfEWYQjLexdg=; b=nsqM4YF+8oKWtRaaWARS/1f6Fg
 i7SizxaScgumuK6EAWKZmnMEBjLsbnKdI6va42+ZFhApmFpoihSltt7qo6+FxdYsoGo1LN3PEQzM4
 qnJK9hefhPzCCRY0EtiuB2cci0M9id+0gchSBsyx8yLf/uYqo/BrPZq5hqUJE7R8LVJgSXH0AOWAg
 hECfVTW4JjBjh5wkw7Er6qwhHw7AQDTHn5JDNPNWAvEUm3x5RNlwkVqvVO/RHcUuCcL/+4VmnK9+/
 lS15wT3W5NnP/775lLUA/6AbV0ycTPJ5uTz2r0fsZnSkM8PEaLccz1ufLw5zIS3djOlfbsNhnoA0b
 hAjF+mDw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr6GG-001N06-1o; Tue, 17 May 2022 23:05:52 +0000
Message-ID: <78e67e42-7e1e-e9fa-036d-441168100731@infradead.org>
Date: Tue, 17 May 2022 16:05:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 11/11] drm/i915: Fix undefined behavior due to shift
 overflowing the constant
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, LKML <linux-kernel@vger.kernel.org>
References: <20220405151517.29753-1-bp@alien8.de>
 <20220405151517.29753-12-bp@alien8.de>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220405151517.29753-12-bp@alien8.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/5/22 08:15, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> Fix:
> 
>   In file included from <command-line>:0:0:
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c: In function ‘intel_guc_send_mmio’:
>   ././include/linux/compiler_types.h:352:38: error: call to ‘__compiletime_assert_1047’ \
>   declared with attribute error: FIELD_PREP: mask is not constant
>     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> 
> and other build errors due to shift overflowing values.
> 
> See https://lore.kernel.org/r/YkwQ6%2BtIH8GQpuct@zn.tnic for the gory
> details as to why it triggers with older gccs only.
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Is this merged anywhere?
It could/should at least be in linux-next so that other people
don't waste time on it.

thanks.

> Signed-off-by: Borislav Petkov <bp@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |  2 +-
>  .../i915/gt/uc/abi/guc_communication_ctb_abi.h |  2 +-
>  .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h  |  2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h     |  2 +-
>  drivers/gpu/drm/i915/i915_reg.h                | 18 +++++++++---------
>  5 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> index 7afdadc7656f..e835f28c0020 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> @@ -50,7 +50,7 @@
>  
>  #define HOST2GUC_SELF_CFG_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 3u)
>  #define HOST2GUC_SELF_CFG_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> -#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_KEY		(0xffff << 16)
> +#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_KEY		(0xffffU << 16)
>  #define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_LEN		(0xffff << 0)
>  #define HOST2GUC_SELF_CFG_REQUEST_MSG_2_VALUE32		GUC_HXG_REQUEST_MSG_n_DATAn
>  #define HOST2GUC_SELF_CFG_REQUEST_MSG_3_VALUE64		GUC_HXG_REQUEST_MSG_n_DATAn
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> index c9086a600bce..df83c1cc7c7a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> @@ -82,7 +82,7 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>  #define GUC_CTB_HDR_LEN				1u
>  #define GUC_CTB_MSG_MIN_LEN			GUC_CTB_HDR_LEN
>  #define GUC_CTB_MSG_MAX_LEN			256u
> -#define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
> +#define GUC_CTB_MSG_0_FENCE			(0xffffU << 16)
>  #define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
>  #define   GUC_CTB_FORMAT_HXG			0u
>  #define GUC_CTB_MSG_0_RESERVED			(0xf << 8)
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> index 29ac823acd4c..7d5ba4d97d70 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> @@ -40,7 +40,7 @@
>   */
>  
>  #define GUC_HXG_MSG_MIN_LEN			1u
> -#define GUC_HXG_MSG_0_ORIGIN			(0x1 << 31)
> +#define GUC_HXG_MSG_0_ORIGIN			(0x1U << 31)
>  #define   GUC_HXG_ORIGIN_HOST			0u
>  #define   GUC_HXG_ORIGIN_GUC			1u
>  #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> index 66027a42cda9..ad570fa002a6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> @@ -28,7 +28,7 @@
>  #define   GS_MIA_HALT_REQUESTED		  (0x02 << GS_MIA_SHIFT)
>  #define   GS_MIA_ISR_ENTRY		  (0x04 << GS_MIA_SHIFT)
>  #define   GS_AUTH_STATUS_SHIFT		30
> -#define   GS_AUTH_STATUS_MASK		  (0x03 << GS_AUTH_STATUS_SHIFT)
> +#define   GS_AUTH_STATUS_MASK		  (0x03U << GS_AUTH_STATUS_SHIFT)
>  #define   GS_AUTH_STATUS_BAD		  (0x01 << GS_AUTH_STATUS_SHIFT)
>  #define   GS_AUTH_STATUS_GOOD		  (0x02 << GS_AUTH_STATUS_SHIFT)
>  
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 3c87d77d2cf6..f3ba3d0a430b 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7555,19 +7555,19 @@ enum skl_power_gate {
>  #define  PORT_CLK_SEL_LCPLL_810		(2 << 29)
>  #define  PORT_CLK_SEL_SPLL		(3 << 29)
>  #define  PORT_CLK_SEL_WRPLL(pll)	(((pll) + 4) << 29)
> -#define  PORT_CLK_SEL_WRPLL1		(4 << 29)
> -#define  PORT_CLK_SEL_WRPLL2		(5 << 29)
> -#define  PORT_CLK_SEL_NONE		(7 << 29)
> -#define  PORT_CLK_SEL_MASK		(7 << 29)
> +#define  PORT_CLK_SEL_WRPLL1		(4U << 29)
> +#define  PORT_CLK_SEL_WRPLL2		(5U << 29)
> +#define  PORT_CLK_SEL_NONE		(7U << 29)
> +#define  PORT_CLK_SEL_MASK		(7U << 29)
>  
>  /* On ICL+ this is the same as PORT_CLK_SEL, but all bits change. */
>  #define DDI_CLK_SEL(port)		PORT_CLK_SEL(port)
>  #define  DDI_CLK_SEL_NONE		(0x0 << 28)
> -#define  DDI_CLK_SEL_MG			(0x8 << 28)
> -#define  DDI_CLK_SEL_TBT_162		(0xC << 28)
> -#define  DDI_CLK_SEL_TBT_270		(0xD << 28)
> -#define  DDI_CLK_SEL_TBT_540		(0xE << 28)
> -#define  DDI_CLK_SEL_TBT_810		(0xF << 28)
> +#define  DDI_CLK_SEL_MG			(0x8U << 28)
> +#define  DDI_CLK_SEL_TBT_162		(0xCU << 28)
> +#define  DDI_CLK_SEL_TBT_270		(0xDU << 28)
> +#define  DDI_CLK_SEL_TBT_540		(0xEU << 28)
> +#define  DDI_CLK_SEL_TBT_810		(0xFU << 28)
>  #define  DDI_CLK_SEL_MASK		(0xF << 28)
>  
>  /* Transcoder clock selection */

-- 
~Randy
