Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103C652CDCA
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 10:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9AA11AF89;
	Thu, 19 May 2022 08:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00F711AF88;
 Thu, 19 May 2022 08:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652947340; x=1684483340;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=not50aQK6RnBtyTWyA+nfAHtvi3ZMcB688IM/wM7jO8=;
 b=XZ8e0rB/Rx1hUojmv0kzvngOgZnq3u+QPFarc/vRyb8JuWA93XLq722j
 3MAXn2Mw/JHXHeZLcGnHKhroEWkSK13omtYnM3PM/l6nmER9al/+87A52
 S/tjJHxVWrFXxoYE1DFohl5IfglhHJOo6k9ByowRoDT6qrSGwz/rhWF16
 OD2hPEhI0sudwFRPoc5QJsLgX0sndFEk3zzYpWssORHVLtB7eR2Fe7auI
 qrUzHLbKX16zBYZM7tShpF/KMorWdR6d/79BpiOC1n5yZ+mK4Fp6+oJ7M
 hKHyFwhQlOlaeGuqd4/hpViIKqbgGkY02VD2tWqBB1Sz+tOOh9zLRv1wP w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="272211502"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="272211502"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 01:02:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="523962371"
Received: from tszulist-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.146.157])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 01:02:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yipeng Zou <zouyipeng@huawei.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, alan.previn.teres.alexis@intel.com,
 vinay.belgaumkar@intel.com
Subject: Re: [PATCH -next] drm/i915: Fix some integer constant macro to
 unsigned type
In-Reply-To: <20220519030423.169981-1-zouyipeng@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220519030423.169981-1-zouyipeng@huawei.com>
Date: Thu, 19 May 2022 11:02:12 +0300
Message-ID: <87zgjec5mj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: zouyipeng@huawei.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 May 2022, Yipeng Zou <zouyipeng@huawei.com> wrote:
> Build Kernel with gcc 7.5.0 or older, will get some error message:
>
> drivers/gpu/drm/i915/display/intel_ddi.c:1915:2: error: case label does not reduce to an integer constant
>   case PORT_CLK_SEL_WRPLL1:
>   ^~~~
> ......
>
> Look here : https://lore.kernel.org/r/YkwQ6%2BtIH8GQpuct@zn.tnic
> for the details why it happends.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>

See
https://lore.kernel.org/r/20220518113315.1305027-1-jani.nikula@intel.com

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h |  4 ++--
>  .../i915/gt/uc/abi/guc_communication_ctb_abi.h   |  6 +++---
>  .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h    | 14 +++++++-------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h       | 12 ++++++------
>  drivers/gpu/drm/i915/i915_reg.h                  | 16 ++++++++--------
>  5 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> index be9ac47fa9d0..cb16fd0ba8dd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> @@ -50,8 +50,8 @@
>  
>  #define HOST2GUC_SELF_CFG_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 3u)
>  #define HOST2GUC_SELF_CFG_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> -#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_KEY		(0xffff << 16)
> -#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_LEN		(0xffff << 0)
> +#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_KEY		(0xffffu << 16)
> +#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_LEN		(0xffffu << 0)
>  #define HOST2GUC_SELF_CFG_REQUEST_MSG_2_VALUE32		GUC_HXG_REQUEST_MSG_n_DATAn
>  #define HOST2GUC_SELF_CFG_REQUEST_MSG_3_VALUE64		GUC_HXG_REQUEST_MSG_n_DATAn
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> index c9086a600bce..e5c782283309 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> @@ -82,11 +82,11 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>  #define GUC_CTB_HDR_LEN				1u
>  #define GUC_CTB_MSG_MIN_LEN			GUC_CTB_HDR_LEN
>  #define GUC_CTB_MSG_MAX_LEN			256u
> -#define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
> -#define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
> +#define GUC_CTB_MSG_0_FENCE			(0xffffu << 16)
> +#define GUC_CTB_MSG_0_FORMAT			(0xfu << 12)
>  #define   GUC_CTB_FORMAT_HXG			0u
>  #define GUC_CTB_MSG_0_RESERVED			(0xf << 8)
> -#define GUC_CTB_MSG_0_NUM_DWORDS		(0xff << 0)
> +#define GUC_CTB_MSG_0_NUM_DWORDS		(0xffu << 0)
>  
>  /**
>   * DOC: CTB HXG Message
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> index 29ac823acd4c..30e3cc06b0b7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> @@ -40,17 +40,17 @@
>   */
>  
>  #define GUC_HXG_MSG_MIN_LEN			1u
> -#define GUC_HXG_MSG_0_ORIGIN			(0x1 << 31)
> +#define GUC_HXG_MSG_0_ORIGIN			(0x1u << 31)
>  #define   GUC_HXG_ORIGIN_HOST			0u
>  #define   GUC_HXG_ORIGIN_GUC			1u
> -#define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
> +#define GUC_HXG_MSG_0_TYPE			(0x7u << 28)
>  #define   GUC_HXG_TYPE_REQUEST			0u
>  #define   GUC_HXG_TYPE_EVENT			1u
>  #define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
>  #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
>  #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
>  #define   GUC_HXG_TYPE_RESPONSE_SUCCESS		7u
> -#define GUC_HXG_MSG_0_AUX			(0xfffffff << 0)
> +#define GUC_HXG_MSG_0_AUX			(0xfffffffu << 0)
>  #define GUC_HXG_MSG_n_PAYLOAD			(0xffffffff << 0)
>  
>  /**
> @@ -86,7 +86,7 @@
>  
>  #define GUC_HXG_REQUEST_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
>  #define GUC_HXG_REQUEST_MSG_0_DATA0		(0xfff << 16)
> -#define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffff << 0)
> +#define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffffu << 0)
>  #define GUC_HXG_REQUEST_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
>  
>  /**
> @@ -118,7 +118,7 @@
>  
>  #define GUC_HXG_EVENT_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
>  #define GUC_HXG_EVENT_MSG_0_DATA0		(0xfff << 16)
> -#define GUC_HXG_EVENT_MSG_0_ACTION		(0xffff << 0)
> +#define GUC_HXG_EVENT_MSG_0_ACTION		(0xffffu << 0)
>  #define GUC_HXG_EVENT_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
>  
>  /**
> @@ -188,8 +188,8 @@
>   */
>  
>  #define GUC_HXG_FAILURE_MSG_LEN			GUC_HXG_MSG_MIN_LEN
> -#define GUC_HXG_FAILURE_MSG_0_HINT		(0xfff << 16)
> -#define GUC_HXG_FAILURE_MSG_0_ERROR		(0xffff << 0)
> +#define GUC_HXG_FAILURE_MSG_0_HINT		(0xfffu << 16)
> +#define GUC_HXG_FAILURE_MSG_0_ERROR		(0xffffu << 0)
>  
>  /**
>   * DOC: HXG Response
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> index 66027a42cda9..70154e522c51 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> @@ -15,20 +15,20 @@
>  
>  #define GUC_STATUS			_MMIO(0xc000)
>  #define   GS_RESET_SHIFT		0
> -#define   GS_MIA_IN_RESET		  (0x01 << GS_RESET_SHIFT)
> +#define   GS_MIA_IN_RESET		  (0x01u << GS_RESET_SHIFT)
>  #define   GS_BOOTROM_SHIFT		1
> -#define   GS_BOOTROM_MASK		  (0x7F << GS_BOOTROM_SHIFT)
> -#define   GS_BOOTROM_RSA_FAILED		  (0x50 << GS_BOOTROM_SHIFT)
> +#define   GS_BOOTROM_MASK		  (0x7Fu << GS_BOOTROM_SHIFT)
> +#define   GS_BOOTROM_RSA_FAILED		  (0x50u << GS_BOOTROM_SHIFT)
>  #define   GS_BOOTROM_JUMP_PASSED	  (0x76 << GS_BOOTROM_SHIFT)
>  #define   GS_UKERNEL_SHIFT		8
> -#define   GS_UKERNEL_MASK		  (0xFF << GS_UKERNEL_SHIFT)
> +#define   GS_UKERNEL_MASK		  (0xFFu << GS_UKERNEL_SHIFT)
>  #define   GS_MIA_SHIFT			16
> -#define   GS_MIA_MASK			  (0x07 << GS_MIA_SHIFT)
> +#define   GS_MIA_MASK			  (0x07u << GS_MIA_SHIFT)
>  #define   GS_MIA_CORE_STATE		  (0x01 << GS_MIA_SHIFT)
>  #define   GS_MIA_HALT_REQUESTED		  (0x02 << GS_MIA_SHIFT)
>  #define   GS_MIA_ISR_ENTRY		  (0x04 << GS_MIA_SHIFT)
>  #define   GS_AUTH_STATUS_SHIFT		30
> -#define   GS_AUTH_STATUS_MASK		  (0x03 << GS_AUTH_STATUS_SHIFT)
> +#define   GS_AUTH_STATUS_MASK		  (0x03u << GS_AUTH_STATUS_SHIFT)
>  #define   GS_AUTH_STATUS_BAD		  (0x01 << GS_AUTH_STATUS_SHIFT)
>  #define   GS_AUTH_STATUS_GOOD		  (0x02 << GS_AUTH_STATUS_SHIFT)
>  
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 9ccb67eec1bd..8c10d66561b0 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7566,19 +7566,19 @@ enum skl_power_gate {
>  #define  PORT_CLK_SEL_LCPLL_810		(2 << 29)
>  #define  PORT_CLK_SEL_SPLL		(3 << 29)
>  #define  PORT_CLK_SEL_WRPLL(pll)	(((pll) + 4) << 29)
> -#define  PORT_CLK_SEL_WRPLL1		(4 << 29)
> -#define  PORT_CLK_SEL_WRPLL2		(5 << 29)
> -#define  PORT_CLK_SEL_NONE		(7 << 29)
> +#define  PORT_CLK_SEL_WRPLL1		(4u << 29)
> +#define  PORT_CLK_SEL_WRPLL2		(5u << 29)
> +#define  PORT_CLK_SEL_NONE		(7u << 29)
>  #define  PORT_CLK_SEL_MASK		(7 << 29)
>  
>  /* On ICL+ this is the same as PORT_CLK_SEL, but all bits change. */
>  #define DDI_CLK_SEL(port)		PORT_CLK_SEL(port)
>  #define  DDI_CLK_SEL_NONE		(0x0 << 28)
> -#define  DDI_CLK_SEL_MG			(0x8 << 28)
> -#define  DDI_CLK_SEL_TBT_162		(0xC << 28)
> -#define  DDI_CLK_SEL_TBT_270		(0xD << 28)
> -#define  DDI_CLK_SEL_TBT_540		(0xE << 28)
> -#define  DDI_CLK_SEL_TBT_810		(0xF << 28)
> +#define  DDI_CLK_SEL_MG			(0x8u << 28)
> +#define  DDI_CLK_SEL_TBT_162		(0xCu << 28)
> +#define  DDI_CLK_SEL_TBT_270		(0xDu << 28)
> +#define  DDI_CLK_SEL_TBT_540		(0xEu << 28)
> +#define  DDI_CLK_SEL_TBT_810		(0xFu << 28)
>  #define  DDI_CLK_SEL_MASK		(0xF << 28)
>  
>  /* Transcoder clock selection */

-- 
Jani Nikula, Intel Open Source Graphics Center
