Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA31336F58
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 10:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3426E4D0;
	Thu, 11 Mar 2021 09:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204E6E4D0;
 Thu, 11 Mar 2021 09:54:39 +0000 (UTC)
IronPort-SDR: IsoIATqdXdy9kZYkG6ExJu3o87DVC55S3Ou4Xbp+Zg91s2fnmYB/5VTUnDkfR4liQnzR2EzOgH
 8UXLVb0Pcdpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="250008697"
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="250008697"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 01:54:38 -0800
IronPort-SDR: qhJZOWF+1LcHpSdvE7Iej0rGZwWB6+W8gqRPnAyyFOls8yagSunLLblhijslZtlD1i3decdDqv
 GfW/5ygnQ2nA==
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="509976052"
Received: from rbustenx-mobl1.ger.corp.intel.com (HELO [10.214.193.155])
 ([10.214.193.155])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 01:54:35 -0800
Subject: Re: [Intel-gfx] [PATCH] i915: Drop relocation support on all new
 hardware (v3)
To: Jason Ekstrand <jason@jlekstrand.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210310212606.766121-1-jason@jlekstrand.net>
 <20210310215007.782649-1-jason@jlekstrand.net>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <a4afba25-ce50-8d5f-f7b7-e6738660308e@linux.intel.com>
Date: Thu, 11 Mar 2021 09:54:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310215007.782649-1-jason@jlekstrand.net>
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
Cc: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/03/2021 21:50, Jason Ekstrand wrote:
> The Vulkan driver in Mesa for Intel hardware never uses relocations if
> it's running on a version of i915 that supports at least softpin which
> all versions of i915 supporting Gen12 do.  On the OpenGL side, Gen12+ is
> only supported by iris which never uses relocations.  The older i965
> driver in Mesa does use relocations but it only supports Intel hardware
> through Gen11 and has been deprecated for all hardware Gen9+.  The
> compute driver also never uses relocations.  This only leaves the media
> driver which is supposed to be switching to softpin going forward.

How does "supposed to be" translates to actually being ready? Cc someone 
from media so they can ack?

> Making softpin a requirement for all future hardware seems reasonable.
> 
> Rejecting relocations starting with Gen12 has the benefit that we don't
> have to bother supporting it on platforms with local memory.  Given how
> much CPU touching of memory is required for relocations, not having to
> do so on platforms where not all memory is directly CPU-accessible
> carries significant advantages.
> 
> v2 (Jason Ekstrand):
>   - Allow TGL-LP platforms as they've already shipped
> 
> v3 (Jason Ekstrand):
>   - WARN_ON platforms with LMEM support in case the check is wrong
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 99772f37bff60..b02dbd16bfa03 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1764,7 +1764,8 @@ eb_relocate_vma_slow(struct i915_execbuffer *eb, struct eb_vma *ev)
>   	return err;
>   }
>   
> -static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
> +static int check_relocations(const struct i915_execbuffer *eb,
> +			     const struct drm_i915_gem_exec_object2 *entry)
>   {
>   	const char __user *addr, *end;
>   	unsigned long size;
> @@ -1774,6 +1775,14 @@ static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
>   	if (size == 0)
>   		return 0;
>   
> +	/* Relocations are disallowed for all platforms after TGL-LP */
> +	if (INTEL_GEN(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
> +		return -EINVAL;
> +
> +	/* All discrete memory platforms are Gen12 or above */
> +	if (WARN_ON(HAS_LMEM(eb->i915)))
> +		return -EINVAL;

Maybe ENODEV as our more typical "this platform does not support this" 
instead of "you are using it wrong".

Regards,

Tvrtko

> +
>   	if (size > N_RELOC(ULONG_MAX))
>   		return -EINVAL;
>   
> @@ -1807,7 +1816,7 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
>   		if (nreloc == 0)
>   			continue;
>   
> -		err = check_relocations(&eb->exec[i]);
> +		err = check_relocations(eb, &eb->exec[i]);
>   		if (err)
>   			goto err;
>   
> @@ -1880,7 +1889,7 @@ static int eb_prefault_relocations(const struct i915_execbuffer *eb)
>   	for (i = 0; i < count; i++) {
>   		int err;
>   
> -		err = check_relocations(&eb->exec[i]);
> +		err = check_relocations(eb, &eb->exec[i]);
>   		if (err)
>   			return err;
>   	}
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
