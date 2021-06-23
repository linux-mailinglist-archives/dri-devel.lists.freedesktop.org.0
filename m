Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E103B1953
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 13:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089BF6E8B9;
	Wed, 23 Jun 2021 11:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D536E8B9;
 Wed, 23 Jun 2021 11:51:34 +0000 (UTC)
IronPort-SDR: vNbiXM7YTx0fP3PCaeEQ1Pvr34fMf7Opo038dYX7JGCK0d7XDDB6viWDFWK2CDbXnwVwWCOwhx
 STMwriT214uQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="186932554"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="186932554"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 04:51:33 -0700
IronPort-SDR: yYn5u8zKIxVdvbaHtMgQPoVazoEaaRNlwtI08bdGqpAB72PoN+CGa+sBFTEEGcVk7UDrsnVlQm
 YQxk9/cAu3ow==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="641958748"
Received: from asortkjx-mobl.ger.corp.intel.com (HELO [10.249.254.136])
 ([10.249.254.136])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 04:51:31 -0700
Subject: Re: [PATCH 3/3] drm/i915/gtt: ignore min_page_size for paging
 structures
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210623112637.266855-1-matthew.auld@intel.com>
 <20210623112637.266855-3-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <a5c0dca7-a586-15b6-6004-09d320b1159e@linux.intel.com>
Date: Wed, 23 Jun 2021 13:51:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210623112637.266855-3-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/23/21 1:26 PM, Matthew Auld wrote:
> The min_page_size is only needed for pages inserted into the GTT, and
> for our paging structures we only need at most 4K bytes, so simply
> ignore the min_page_size restrictions here, otherwise we might see some
> severe overallocation on some devices.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gtt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 084ea65d59c0..61e8a8c25374 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -16,7 +16,7 @@ struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz)
>   {
>   	struct drm_i915_gem_object *obj;
>   
> -	obj = i915_gem_object_create_lmem(vm->i915, sz, 0);
> +	obj = __i915_gem_object_create_lmem_with_ps(vm->i915, sz, sz, 0);
>   	/*
>   	 * Ensure all paging structures for this vm share the same dma-resv
>   	 * object underneath, with the idea that one object_lock() will lock

I think for this one the new gt migration code might break, because 
there we insert even PT pages into the GTT, so it might need a special 
interface? Ram is looking at supporter larger GPU PTE sizes with that code..

/Thomas



