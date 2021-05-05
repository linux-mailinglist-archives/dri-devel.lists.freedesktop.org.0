Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEE6373837
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 11:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950DD6E13C;
	Wed,  5 May 2021 09:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EB56E13C;
 Wed,  5 May 2021 09:56:53 +0000 (UTC)
IronPort-SDR: 5zuLk1uxn8bj58/M0icSfu5TamFXE3rAU73yu7x2aCWMSDuFd6BRcik9Gjiw7cVfN+t3Z4OPoZ
 y8zmA5E5MJ6Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="185642219"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="185642219"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 02:56:52 -0700
IronPort-SDR: lFR/lqjagyLsJEeBDvKhoEqEuSWUnCfEPP6j+1ElszXJsulmTG8c8HGVPztl21e2x7zDc6ry9f
 ofac6bBn2/DQ==
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="463798192"
Received: from pgcarton-mobl1.ger.corp.intel.com (HELO [10.213.195.12])
 ([10.213.195.12])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 02:56:51 -0700
Subject: Re: [Intel-gfx] [PATCH 12/27] drm/i915/gem: Disallow creating
 contexts with too many engines
To: Jason Ekstrand <jason@jlekstrand.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-13-jason@jlekstrand.net>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <3a4fa1f0-f5e2-3f71-8d69-2908382d82ba@linux.intel.com>
Date: Wed, 5 May 2021 10:56:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503155748.1961781-13-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/05/2021 16:57, Jason Ekstrand wrote:
> There's no sense in allowing userspace to create more engines than it
> can possibly access via execbuf.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

FWIW, again for the record, my advice is not to land this one. It makes 
no sense and it is actively disruptive for no benefit.

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index be42dc918ef6f..8e254d83d65f2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1640,11 +1640,11 @@ set_engines(struct i915_gem_context *ctx,
>   		return -EINVAL;
>   	}
>   
> -	/*
> -	 * Note that I915_EXEC_RING_MASK limits execbuf to only using the
> -	 * first 64 engines defined here.
> -	 */
>   	num_engines = (args->size - sizeof(*user)) / sizeof(*user->engines);
> +	/* RING_MASK has no shift so we can use it directly here */
> +	if (num_engines > I915_EXEC_RING_MASK + 1)
> +		return -EINVAL;
> +
>   	set.engines = alloc_engines(num_engines);
>   	if (!set.engines)
>   		return -ENOMEM;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
