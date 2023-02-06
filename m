Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EB868B8E2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 10:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC9710E354;
	Mon,  6 Feb 2023 09:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB0010E352;
 Mon,  6 Feb 2023 09:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675676716; x=1707212716;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hPsWrNl0e4B6gbmEyflkO0IZqCRbH7g6geB8jiNZ3F8=;
 b=aQ32nUL3dOcndfZTmwQ2tK7GevLOqUiA12vOsvuhCZxa5kd/q7GptscT
 7rDOBqr4VRPYzmZXjHuGrE1z10OSVexwy2fFbZ8hyQJV+MQNNGajSPAF9
 Wq3rQBFnI8f49MplPp5WTRhbt+ettTGLFEvnw6xtBpRpGVj5otKi+YwtF
 XJfdB6G2XR/9oZxXZrjhZEXzbGqza4HAJqkSRh5VzkO88GZjPBdsXwyQW
 wdsOkyAchGo7xD3Dx1o3LP4uqMRrPBgnH0niYqnGBovMUwlRIc1gwNyca
 lOlJLcInLoXIFP7zv0aaOI4xu3d0h0vknfM5GZ44NVTsmIQji2eufasXO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="317177737"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="317177737"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 01:45:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="666432858"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="666432858"
Received: from kgurski-mobl3.ger.corp.intel.com (HELO [10.213.203.226])
 ([10.213.203.226])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 01:45:12 -0800
Message-ID: <d58fff32-edad-4a7f-7409-7e57593df3ed@linux.intel.com>
Date: Mon, 6 Feb 2023 09:45:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915/gt: Avoid redundant pointer validity check
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>
References: <Y91g081OauhQNxMe@ubun2204.myguest.virtualbox.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y91g081OauhQNxMe@ubun2204.myguest.virtualbox.org>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

Adding Matt & Thomas as potential candidates to review.

Regards,

Tvrtko

On 03/02/2023 19:30, Deepak R Varma wrote:
> The macro definition of gen6_for_all_pdes() expands to a for loop such
> that it breaks when the page table is null. Hence there is no need to
> again test validity of the page table entry pointers in the pde list.
> This change is identified using itnull.cocci semantic patch.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Please note: Proposed change is compile tested only.
> 
>   drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> index 5aaacc53fa4c..787b9e6d9f59 100644
> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> @@ -258,8 +258,7 @@ static void gen6_ppgtt_free_pd(struct gen6_ppgtt *ppgtt)
>   	u32 pde;
>   
>   	gen6_for_all_pdes(pt, pd, pde)
> -		if (pt)
> -			free_pt(&ppgtt->base.vm, pt);
> +		free_pt(&ppgtt->base.vm, pt);
>   }
>   
>   static void gen6_ppgtt_cleanup(struct i915_address_space *vm)
> @@ -304,7 +303,7 @@ static void pd_vma_unbind(struct i915_address_space *vm,
>   
>   	/* Free all no longer used page tables */
>   	gen6_for_all_pdes(pt, ppgtt->base.pd, pde) {
> -		if (!pt || atomic_read(&pt->used))
> +		if (atomic_read(&pt->used))
>   			continue;
>   
>   		free_pt(&ppgtt->base.vm, pt);
