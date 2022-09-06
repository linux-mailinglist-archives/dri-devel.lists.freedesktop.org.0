Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18625AE41B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 11:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC53C10E60A;
	Tue,  6 Sep 2022 09:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A945010E5FF;
 Tue,  6 Sep 2022 09:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662456430; x=1693992430;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6BTHSoXRfOuZ3Qbwjw9pSgeo4IcuoP2fqSrf7+dY5Mw=;
 b=KhktnqwKjOPXLbLwcJOrG2o0HvY3XxNOYD/73YQ5BA8UsNrj+N9V+9zN
 22LmE5fo/Wt39R/XfNmFgIg+W892VPXxi1iOjASnN4U/cXRBv4pzPyckv
 FG4axTF2TVeG7YIgiskqdTvvyz/vDDxQjGqLT2tKN1rmdhkiNvW1c447D
 GD5l6XIV3GCVlZ1eAGXCcqGhb3cK/Wa9oAZEQN/oFCp4Ob5Zxxt6zhU6v
 cts7LI+2RwW3C+JS/sJXiiHsBDd19Mb54HEc1NkX4WADtkudW+isu0rBj
 HcMUKAF2vhiI99Awzw+49K4Iem+gWJ1+2ng0xl4xCRWlBDL3g8BYzquP8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="296549121"
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; d="scan'208";a="296549121"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 02:27:09 -0700
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; d="scan'208";a="644091217"
Received: from holmesda-mobl.ger.corp.intel.com (HELO [10.213.204.21])
 ([10.213.204.21])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 02:27:07 -0700
Message-ID: <48b5773c-c6b8-fc69-c393-6b455e1bee97@linux.intel.com>
Date: Tue, 6 Sep 2022 10:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] drm/i915: prevent integer overflow in query_engine_info()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <YxDSAj6tIrTZv5Y5@kili>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YxDSAj6tIrTZv5Y5@kili>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dan,

On 01/09/2022 16:38, Dan Carpenter wrote:
> This code uses struct_size() but it stores the result in an int so the
> integer overflow checks are not effective.  Record the types as size_t
> to prevent the size from being truncated.
> 
> Fixes: bf3c50837506 ("drm/i915/query: Use struct_size() helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I do not know if the integer overflow can happen.  This is a hardenning
> patch just like the conversion to struct_size().

It can't since num_uabi_engines in "len = struct_size(query_ptr, 
engines, num_uabi_engines);" is max double digits and sizeof(struct 
drm_i915_engine_info) is 56 bytes on a glance.

Nevertheless hardening is almost always beneficial so no fundamental 
complaints. Just that this patch I think leaves some parts unresolved. 
Mostly that copy_query_item now can implicitly truncate in "return 
total_length" and likewise query_engine_info in "return ret;".

Maybe we could add, on top of your patch, something like:

  static int copy_query_item(void *query_hdr, size_t query_sz,
-                          u32 total_length,
+                          size_t total_length,
                            struct drm_i915_query_item *query_item)
  {
+       if (overflows_type(query_sz, query_item->length) ||
+           overflows_type(total_length, query_item->length))
+               return -ERANGE; /* ??? */
+

(query->item_length is s32 so matches the int return type.)

And change all variables holding result of copy_query_item to size_t.

Don't know, it could be it's an overkill. More opinions?

Regards,

Tvrtko

> 
>   drivers/gpu/drm/i915/i915_query.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 6ec9c9fb7b0d..43a499fbdc8d 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -13,7 +13,7 @@
>   #include <uapi/drm/i915_drm.h>
>   
>   static int copy_query_item(void *query_hdr, size_t query_sz,
> -			   u32 total_length,
> +			   size_t total_length,
>   			   struct drm_i915_query_item *query_item)
>   {
>   	if (query_item->length == 0)
> @@ -135,7 +135,8 @@ query_engine_info(struct drm_i915_private *i915,
>   	struct drm_i915_engine_info info = { };
>   	unsigned int num_uabi_engines = 0;
>   	struct intel_engine_cs *engine;
> -	int len, ret;
> +	size_t len;
> +	int ret;
>   
>   	if (query_item->flags)
>   		return -EINVAL;
