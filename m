Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640495261E4
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 14:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA4B10FAD9;
	Fri, 13 May 2022 12:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7074C10FAD0;
 Fri, 13 May 2022 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652445066; x=1683981066;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p8mNLUEsri1ddcLBB/uzvSFjyNl3p+Jqy9usZYjWXAY=;
 b=mplLcxb2bTD8HwBWl4cd6ZzNFyxZGdFTeCXIF1JjBzHbtNySy2XjdZza
 ERLcrRbmFZdZk8dmMALl7cfPR4lH0kSoxgc+7f8PHrTXtx7EhA7K8IW2f
 DRk2J0nWFxyGFHlD/iYTw9KjFzw4QWrZR6sYTJBpwWmDgNdIrB8NSXtDh
 GmLfw2v4SnbjKNiC8RP+u9JbL+KRWSjE6IyUfXitx5u4BktShHmdBhXgx
 eBSZZ+PBQ3px/BEZG8B7PPVNWyvfJriYZpyxmg+fXnpM2bDA6ac5Cr11e
 yT1oYXEdZxmUj/QEMmf2MEBHnH9QXASeacEY+rAbuHJQwW8hhu1eAU/cs w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="267887517"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="267887517"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 05:31:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="624849747"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 13 May 2022 05:31:05 -0700
Received: from [10.249.145.163] (unknown [10.249.145.163])
 by linux.intel.com (Postfix) with ESMTP id DB043580A88;
 Fri, 13 May 2022 05:31:01 -0700 (PDT)
Message-ID: <08039c07-a32e-7725-bc98-db49eefb3e86@intel.com>
Date: Fri, 13 May 2022 15:31:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] uapi/drm/i915: Document memory residency and Flat-CCS
 capability of obj
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220502141508.2327-1-ramalingam.c@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220502141508.2327-1-ramalingam.c@intel.com>
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
Cc: Tony Ye <tony.ye@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Nanley Chery <nanley.g.chery@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/05/2022 17:15, Ramalingam C wrote:
> Capture the impact of memory region preference list of the objects, on
> their memory residency and Flat-CCS capability.
>
> v2:
>    Fix the Flat-CCS capability of an obj with {lmem, smem} preference
>    list [Thomas]
> v3:
>    Reworded the doc [Matt]
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Matthew Auld <matthew.auld@intel.com>
> cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> cc: Jon Bloomfield <jon.bloomfield@intel.com>
> cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> cc: Kenneth Graunke <kenneth@whitecape.org>
> cc: mesa-dev@lists.freedesktop.org
> cc: Jordan Justen <jordan.l.justen@intel.com>
> cc: Tony Ye <tony.ye@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   include/uapi/drm/i915_drm.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index a2def7b27009..b7e1c2fe08dc 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3443,6 +3443,22 @@ struct drm_i915_gem_create_ext {
>    * At which point we get the object handle in &drm_i915_gem_create_ext.handle,
>    * along with the final object size in &drm_i915_gem_create_ext.size, which
>    * should account for any rounding up, if required.
> + *
> + * Note that userspace has no means of knowing the current backing region
> + * for objects where @num_regions is larger than one. The kernel will only
> + * ensure that the priority order of the @regions array is honoured, either
> + * when initially placing the object, or when moving memory around due to
> + * memory pressure
> + *
> + * On Flat-CCS capable HW, compression is supported for the objects residing
> + * in I915_MEMORY_CLASS_DEVICE. When such objects (compressed) has other
> + * memory class in @regions and migrated (by I915, due to memory
> + * constrain) to the non I915_MEMORY_CLASS_DEVICE region, then I915 needs to
> + * decompress the content. But I915 dosen't have the required information to
> + * decompress the userspace compressed objects.
> + *
> + * So I915 supports Flat-CCS, only on the objects which can reside only on
> + * I915_MEMORY_CLASS_DEVICE regions.


I think it's fine to assume Flat-CSS surface will always be in lmem.

I see no issue for the Anv Vulkan driver.


Maybe Nanley or Ken can speak for the Iris GL driver?


-Lionel


>    */
>   struct drm_i915_gem_create_ext_memory_regions {
>   	/** @base: Extension link. See struct i915_user_extension. */


