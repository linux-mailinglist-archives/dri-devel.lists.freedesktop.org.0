Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC475511C5C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 18:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B2F10E0F5;
	Wed, 27 Apr 2022 16:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CA410E0F5;
 Wed, 27 Apr 2022 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651076971; x=1682612971;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pgAtQIHKgQvms1790Zb68KHmRMOlx1KWZAco7KvWs64=;
 b=U62Jb4fHehxcZlPPZwrX1cTIAHZv0uppFgtBB3wXEAbDP8w2VyeC8Chi
 dWnYfrf9w23jz1FYb/VN56BervYXFmeldDXIZGy7gCFlXbUDytmeo/O7l
 8mSiePe3BLGEhUXmiy0IJFT9PrjllUt/3NmelWxyj/R/fZAUSd4GZwFY8
 tYhMluw8e0KFnkeijzwEGkRIIlOjfIofWlvfBMI/6fRDODeV+1wVEragp
 pRef98AkWlhWR23w67/kL19HsI03G9ZUAV9xsmUyTvIl1ulCuoi3rp3WB
 WmD+pLYDYBjp+4qRNIosDTCEGNIsrkT8+/NjEXcINfksCpsrt1evkeQJP w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="352428667"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="352428667"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 09:29:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="680886278"
Received: from konishi-mobl.gar.corp.intel.com (HELO [10.252.6.183])
 ([10.252.6.183])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 09:29:29 -0700
Message-ID: <c866374b-46cc-87fb-4529-7aa1f2dfb130@intel.com>
Date: Wed, 27 Apr 2022 17:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/4] drm/i915/gt: Document the eviction of the Flat-CCS
 objects
Content-Language: en-GB
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220425162430.28844-1-ramalingam.c@intel.com>
 <20220425162430.28844-4-ramalingam.c@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220425162430.28844-4-ramalingam.c@intel.com>
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
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/04/2022 17:24, Ramalingam C wrote:
> Capture the eviction details for Flat-CCS capable, lmem objects.
> 
> v2:
>    Fix the Flat-ccs capbility of lmem obj with smem residency
>    possibility [Thomas]
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> cc: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_migrate.c | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 463a6a14b5f9..930e0fd9795f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -485,16 +485,21 @@ static bool wa_1209644611_applies(int ver, u32 size)
>    * And CCS data can be copied in and out of CCS region through
>    * XY_CTRL_SURF_COPY_BLT. CPU can't access the CCS data directly.
>    *
> - * When we exhaust the lmem, if the object's placements support smem, then we can
> - * directly decompress the compressed lmem object into smem and start using it
> - * from smem itself.
> + * I915 supports Flat-CCS on lmem only objects. When an objects has the smem in

"When an object has smem in"

> + * its preference list, on memory pressure, i915 needs to migarte the lmem

"migrate"

> + * content into smem. If the lmem object is Flat-CCS compressed by userspace,
> + * then i915 needs to decompress it. But I915 lack the required information
> + * for such decompression. Hence I915 supports Flat-CCS only on lmem only objects.
>    *
> - * But when we need to swapout the compressed lmem object into a smem region
> - * though objects' placement doesn't support smem, then we copy the lmem content
> - * as it is into smem region along with ccs data (using XY_CTRL_SURF_COPY_BLT).
> - * When the object is referred, lmem content will be swaped in along with
> - * restoration of the CCS data (using XY_CTRL_SURF_COPY_BLT) at corresponding
> - * location.
> + * when we exhaust the lmem, Flat-CCS capable objects' lmem backing memory can

"When"

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> + * be temporarily evicted to smem, along with the auxiliary CCS state, where
> + * it can be potentially swapped-out at a later point, if required.
> + * If userspace later touches the evicted pages, then we always move
> + * the backing memory back to lmem, which includes restoring the saved CCS state,
> + * and potentially performing any required swap-in.
> + *
> + * For the migration of the lmem objects with smem in placement list, such as
> + * {lmem, smem}, objects are treated as non Flat-CCS capable objects.
>    */
>   
>   static inline u32 *i915_flush_dw(u32 *cmd, u32 flags)
