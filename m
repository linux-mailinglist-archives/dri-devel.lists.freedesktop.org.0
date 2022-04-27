Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C96F8511C7C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 19:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2CF10E087;
	Wed, 27 Apr 2022 17:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAD610E087;
 Wed, 27 Apr 2022 17:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651079388; x=1682615388;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=H2F/blZMGChoUPoGwThBsMAnVLZXou0E1i9kkdnR178=;
 b=BTO5+InwK/m9SGtzW3QSF7pcsDm1/kdrOauihkqk2lrfzwlp06n3go0j
 IltPem7GSIwiNgt4gS5KhD3Psn67QXZY+sn0SubmViALS7N8+w08yrfpW
 8Ntvh5XASef0Gjz6wtzRRnDviQu2ebdGR9echDTo1Ir2Qy4CzUsxfPJPD
 apqE7t90GtjKubtgMnmPwqp54tMuCqj32r2X21Sw9nErV3yxRJijzbv7/
 id91zvL2WE3h/go6eaT7G1MbqY57Joa2um85BQxn/K2EfnJ0fn33lkk3f
 j1qQFqNAOrCnVVkIR7zAPCWyPcA0hvq31Fr0c9uXtgcIwi6lFBuTJRpgK w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="246565727"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="246565727"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 10:09:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="680902654"
Received: from konishi-mobl.gar.corp.intel.com (HELO [10.252.6.183])
 ([10.252.6.183])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 10:09:28 -0700
Message-ID: <baf3af1f-7699-9de6-8605-95e5c1b93737@intel.com>
Date: Wed, 27 Apr 2022 18:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/4] uapi/drm/i915: Document memory residency and
 Flat-CCS capability of obj
Content-Language: en-GB
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220425162430.28844-1-ramalingam.c@intel.com>
 <20220425162430.28844-5-ramalingam.c@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220425162430.28844-5-ramalingam.c@intel.com>
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
> Capture the impact of memory region preference list of an object, on
> their memory residency and Flat-CCS capability of the objects.
> 
> v2:
>    Fix the Flat-CCS capability of an obj with {lmem, smem} preference
>    list [Thomas]
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Matthew Auld <matthew.auld@intel.com>
> cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> ---
>   include/uapi/drm/i915_drm.h | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 35ca528803fd..ad191ed6547c 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3393,6 +3393,24 @@ struct drm_i915_gem_create_ext {
>    * At which point we get the object handle in &drm_i915_gem_create_ext.handle,
>    * along with the final object size in &drm_i915_gem_create_ext.size, which
>    * should account for any rounding up, if required.
> + *
> + * Objects with multiple memory regions in the preference list will be backed
> + * by one of the memory regions mentioned in the preference list. Though I915
> + * tries to honour the order of the memory regions in the preference list,
> + * based on the memory pressure of the regions, objects' backing region
> + * will be selected.
> + *
> + * Userspace has no means of knowing the backing region for such objects.

"Note that userspace has no means of knowing the current backing region 
for objects where @num_regions is larger than one. The kernel will only 
ensure that the priority order of the @regions array is honoured, either 
when initially placing the object, or when moving memory around due to 
memory pressure."

> + *
> + * On Flat-CCS capable HW, compression is supported for the objects residing
> + * in I915_MEMORY_CLASS_DEVICE. When such objects (compressed) has other
> + * memory class in preference list and migrated (by I915, due to memory
> + * constrain) to the non I915_MEMORY_CLASS_DEVICE region, then I915 needs to
> + * decompress the content. But I915 dont have the required information to

"doesn't", also prefer @regions etc instead of "preference list"

Anyway,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> + * decompress the userspace compressed objects.
> + *
> + * So I915 supports Flat-CCS, only on the objects which can reside only on
> + * I915_MEMORY_CLASS_DEVICE regions. >    */
>   struct drm_i915_gem_create_ext_memory_regions {
>   	/** @base: Extension link. See struct i915_user_extension. */
