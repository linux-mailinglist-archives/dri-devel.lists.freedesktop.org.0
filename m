Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9FF517F62
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 10:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F4910E560;
	Tue,  3 May 2022 08:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D6210E560;
 Tue,  3 May 2022 08:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651565159; x=1683101159;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=quCvxIx3xfCRGSUQyX8I/KSf0GKtBO7eteq13fyTLGA=;
 b=l/VTKSpMJ7u+oGD+HN7qRu3H1hxI8REy/tVN712mDrg6kBlsCmHf/pmW
 zOfd/yeVDa6TetRnHet66Gy64Fn/TV4C4zkTcSSJAdCD7hMIXhoELQp8X
 pTwJ5y5veWqMvS2aSDjG1lxp2OMiQtEVaNWoXNnINmXkTBIDBW58RtvrJ
 Y3eH3QEoDH7T5tOv2TPuynE0q477/EL95KoCw8QyebfyBJBsxCSWzfZXX
 hmqewcXDTsE2oxiRHLLVoaGMNzcDhbkeBpizhTCJpq04hWq6OWg/7LrBM
 Xqu8cuz555gMNTPoNvU6VZe7tIPVcTIU7PMONygtZFuC15qnRisUSqFuu g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="292609610"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="292609610"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 01:05:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="562123480"
Received: from doshaugh-mobl.ger.corp.intel.com (HELO [10.213.236.211])
 ([10.213.236.211])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 01:05:57 -0700
Message-ID: <472e2679-abc5-8881-6f93-f64ec1feb365@linux.intel.com>
Date: Tue, 3 May 2022 09:05:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH 07/11] drm/i915/pvc: Engines definitions for
 new copy engines
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-8-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220502163417.2635462-8-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Zhi Wang <zhi.a.wang@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/05/2022 17:34, Matt Roper wrote:
> This patch adds the basic definitions needed to support
> new copy engines. Also updating the cmd_info to accommodate
> new engines, as the engine id's of legacy engines have been
> changed.
> 
> Original-author: CQ Tang
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 56 ++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_engine_types.h | 10 +++-
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h      |  8 +++
>   drivers/gpu/drm/i915/gvt/cmd_parser.c        |  2 +-
>   drivers/gpu/drm/i915/i915_reg.h              |  8 +++
>   5 files changed, 82 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 14c6ddbbfde8..4532c3ea9ace 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -71,6 +71,62 @@ static const struct engine_info intel_engines[] = {
>   			{ .graphics_ver = 6, .base = BLT_RING_BASE }
>   		},
>   	},
> +	[BCS1] = {
> +		.class = COPY_ENGINE_CLASS,
> +		.instance = 1,
> +		.mmio_bases = {
> +			{ .graphics_ver = 12, .base = XEHPC_BCS1_RING_BASE }
> +		},
> +	},
> +	[BCS2] = {
> +		.class = COPY_ENGINE_CLASS,
> +		.instance = 2,
> +		.mmio_bases = {
> +			{ .graphics_ver = 12, .base = XEHPC_BCS2_RING_BASE }
> +		},
> +	},
> +	[BCS3] = {
> +		.class = COPY_ENGINE_CLASS,
> +		.instance = 3,
> +		.mmio_bases = {
> +			{ .graphics_ver = 12, .base = XEHPC_BCS3_RING_BASE }
> +		},
> +	},
> +	[BCS4] = {
> +		.class = COPY_ENGINE_CLASS,
> +		.instance = 4,
> +		.mmio_bases = {
> +			{ .graphics_ver = 12, .base = XEHPC_BCS4_RING_BASE }
> +		},
> +	},
> +	[BCS5] = {
> +		.class = COPY_ENGINE_CLASS,
> +		.instance = 5,
> +		.mmio_bases = {
> +			{ .graphics_ver = 12, .base = XEHPC_BCS5_RING_BASE }
> +		},
> +	},
> +	[BCS6] = {
> +		.class = COPY_ENGINE_CLASS,
> +		.instance = 6,
> +		.mmio_bases = {
> +			{ .graphics_ver = 12, .base = XEHPC_BCS6_RING_BASE }
> +		},
> +	},
> +	[BCS7] = {
> +		.class = COPY_ENGINE_CLASS,
> +		.instance = 7,
> +		.mmio_bases = {
> +			{ .graphics_ver = 12, .base = XEHPC_BCS7_RING_BASE }
> +		},
> +	},
> +	[BCS8] = {
> +		.class = COPY_ENGINE_CLASS,
> +		.instance = 8,
> +		.mmio_bases = {
> +			{ .graphics_ver = 12, .base = XEHPC_BCS8_RING_BASE }
> +		},
> +	},
>   	[VCS0] = {
>   		.class = VIDEO_DECODE_CLASS,
>   		.instance = 0,
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 298f2cc7a879..356c15cdccf0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -35,7 +35,7 @@
>   #define OTHER_CLASS		4
>   #define COMPUTE_CLASS		5
>   #define MAX_ENGINE_CLASS	5
> -#define MAX_ENGINE_INSTANCE	7
> +#define MAX_ENGINE_INSTANCE	8
>   
>   #define I915_MAX_SLICES	3
>   #define I915_MAX_SUBSLICES 8
> @@ -107,6 +107,14 @@ struct i915_ctx_workarounds {
>   enum intel_engine_id {
>   	RCS0 = 0,
>   	BCS0,
> +	BCS1,
> +	BCS2,
> +	BCS3,
> +	BCS4,
> +	BCS5,
> +	BCS6,
> +	BCS7,
> +	BCS8,

_BCS(n) macro will not be required?

>   	VCS0,
>   	VCS1,
>   	VCS2,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index a0a49c16babd..aa2c0974b02c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1476,6 +1476,14 @@
>   #define   GEN11_KCR				(19)
>   #define   GEN11_GTPM				(16)
>   #define   GEN11_BCS				(15)
> +#define   XEHPC_BCS1				(14)
> +#define   XEHPC_BCS2				(13)
> +#define   XEHPC_BCS3				(12)
> +#define   XEHPC_BCS4				(11)
> +#define   XEHPC_BCS5				(10)
> +#define   XEHPC_BCS6				(9)
> +#define   XEHPC_BCS7				(8)
> +#define   XEHPC_BCS8				(23)
>   #define   GEN12_CCS3				(7)
>   #define   GEN12_CCS2				(6)
>   #define   GEN12_CCS1				(5)
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> index b9eb75a2b400..0ba2a3455d99 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -428,7 +428,7 @@ struct cmd_info {
>   #define R_VECS	BIT(VECS0)
>   #define R_ALL (R_RCS | R_VCS | R_BCS | R_VECS)
>   	/* rings that support this cmd: BLT/RCS/VCS/VECS */
> -	u16 rings;
> +	intel_engine_mask_t rings;

Looks like mask already overflows u16 even without the blitter engines. 
(When CCS were added.) Meaning maybe there should be a separate patch to 
fix it.

But good question though is GVT supporting CCS and should it be part of 
R_ALL? Or should this patch even be touching GVT since CCS enablement 
did not? Adding Zhi to comment.

Regards,

Tvrtko

>   
>   	/* devices that support this cmd: SNB/IVB/HSW/... */
>   	u16 devices;
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 4a3d7b96ef43..ab64ab4317b3 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -976,6 +976,14 @@
>   #define GEN12_COMPUTE2_RING_BASE	0x1e000
>   #define GEN12_COMPUTE3_RING_BASE	0x26000
>   #define BLT_RING_BASE		0x22000
> +#define XEHPC_BCS1_RING_BASE	0x3e0000
> +#define XEHPC_BCS2_RING_BASE	0x3e2000
> +#define XEHPC_BCS3_RING_BASE	0x3e4000
> +#define XEHPC_BCS4_RING_BASE	0x3e6000
> +#define XEHPC_BCS5_RING_BASE	0x3e8000
> +#define XEHPC_BCS6_RING_BASE	0x3ea000
> +#define XEHPC_BCS7_RING_BASE	0x3ec000
> +#define XEHPC_BCS8_RING_BASE	0x3ee000
>   #define DG1_GSC_HECI1_BASE	0x00258000
>   #define DG1_GSC_HECI2_BASE	0x00259000
>   #define DG2_GSC_HECI1_BASE	0x00373000
