Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5875ECCF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 09:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFE710E1C1;
	Mon, 24 Jul 2023 07:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC44B10E1C1;
 Mon, 24 Jul 2023 07:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690185226; x=1721721226;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YPOzK2QaaDE88dNMHK6O6dkcH8rwv8kGLGsvcA6oi2M=;
 b=MufiI36wy9CDXaQYuKRuFSVwlaqJlGxH77N+gZSt4qTIDUqLYgmNTZSY
 IeeDj+jdFtHH1U+M2LZ3L4EZbCvx16fU8vZYhBG7mvXB7YjcVy1TQa3ed
 F79vytuZmauWEnKzPbDsdBTZzCLUOr+isTStPhRS1Yulw6QB2RViVL2wu
 Hf+a+hbt2dMYG0q+VouRi8kqvd8DsUAvqUT80F0JyHDFPbV3jJLVA74oS
 UXfLDF6qmqh76tWF1BQzRWFtdBI6YJVioVJbFDYAu1oWEA1fmIUzE2pXy
 6Peo9BU7JkHCtlW/kGuwUyPyQdSlnVelQ8vP+zW9Pdv0rmGCDFy5lOpw/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="352273577"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="352273577"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 00:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="790878465"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="790878465"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.14.115])
 ([10.213.14.115])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 00:53:39 -0700
Message-ID: <24c74886-1e61-db9b-f7ee-16dc8d97e5ba@intel.com>
Date: Mon, 24 Jul 2023 09:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v8 5/9] drm/i915/gt: Enable the CCS_FLUSH bit in the pipe
 control
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
 <20230721161514.818895-6-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230721161514.818895-6-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>,
 dri-evel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21.07.2023 18:15, Andi Shyti wrote:
> Enable the CCS_FLUSH bit 13 in the control pipe for render and
> compute engines in platforms starting from Meteor Lake (BSPEC
> 43904 and 47112).
>
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 7 +++++++
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 1 +
>   2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 5d2175e918dd2..139a7e69f5c4d 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -230,6 +230,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   
>   		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>   
> +		/*
> +		 * When required, in MTL and beyond platforms we
> +		 * need to set the CCS_FLUSH bit in the pipe control
> +		 */
> +		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> +			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> +
>   		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>   		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>   		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 5d143e2a8db03..5df7cce23197c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -299,6 +299,7 @@
>   #define   PIPE_CONTROL_QW_WRITE				(1<<14)
>   #define   PIPE_CONTROL_POST_SYNC_OP_MASK                (3<<14)
>   #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
> +#define   PIPE_CONTROL_CCS_FLUSH			(1<<13) /* MTL+ */
>   #define   PIPE_CONTROL_WRITE_FLUSH			(1<<12)
>   #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12) /* gen6+ */
>   #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11) /* MBZ on ILK */

