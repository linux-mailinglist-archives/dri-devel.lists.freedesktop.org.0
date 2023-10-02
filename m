Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8B7B5566
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 16:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046F010E2CA;
	Mon,  2 Oct 2023 14:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C94310E2CA;
 Mon,  2 Oct 2023 14:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696257788; x=1727793788;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KYCaU6y2EnSrhCGhchgzf8LukcTFtTU33DDRVpcZKJ4=;
 b=OkyG773ZQnLZfi1seEqylqMJOVpowPrdQEyxSijxYs45oYlOyer28Yqx
 zRuXsWA7P4MTBAUVmL5igXBI43u5gARdJepimAbGnQQwe6xDrwB80tfhS
 vwo/awfw7P13xtF6sh64i7ql5NRzQMp6MYaR97+HkFqxTtrUCIgK5uo4q
 7fIQCjaGnun0c7GM92Jxcxv43Vg1FvZU21zFFcN2yUciH7qoTfudcR6Fu
 4IOlztrfd+prZgF9BEIb6N6OPtc3Oz+tWIAhR/eiSOBjYyxCs9aVXg961
 ckehmR73pqwWU39TfsADUFuz6FTmKLMswAhnFo9i0c8Js9SCNRUrD4+MJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="386527169"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="386527169"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 07:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="841006979"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="841006979"
Received: from tcopilu-mobl.ger.corp.intel.com (HELO [10.252.55.117])
 ([10.252.55.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 07:42:53 -0700
Message-ID: <869a0a2b-fdae-769f-4e1d-08b35633463a@linux.intel.com>
Date: Mon, 2 Oct 2023 16:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Invalidate the TLBs on each GT
Content-Language: en-US
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20231002140742.933530-1-jonathan.cavitt@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20231002140742.933530-1-jonathan.cavitt@intel.com>
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
Cc: matthew.d.roper@intel.com, chris.p.wilson@linux.intel.com,
 andi.shyti@intel.com, dri-devel <dri-devel@lists.freedesktop.org>,
 saurabhg.gupta@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+dri-devel

On 10/2/2023 4:07 PM, Jonathan Cavitt wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
>
> With multi-GT devices, the object may have been bound on each GT and so
> we need to invalidate the TLBs across all GT before releasing the pages
> back to the system.
>
> Fixes: d6c531ab4820 ("drm/i915: Invalidate the TLBs on each GT")
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> CC: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Can't find it in dri-devel but if you didn't then Cc to 
dri-devel@lists.freedesktop.org for change that touches gt/gem files.


Regards,

Nirmoy

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index 6b6d22c194110..0ba955611dfb5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -198,7 +198,7 @@ static void flush_tlb_invalidate(struct drm_i915_gem_object *obj)
>   
>   	for_each_gt(gt, i915, id) {
>   		if (!obj->mm.tlb[id])
> -			return;
> +			continue;
>   
>   		intel_gt_invalidate_tlb_full(gt, obj->mm.tlb[id]);
>   		obj->mm.tlb[id] = 0;
