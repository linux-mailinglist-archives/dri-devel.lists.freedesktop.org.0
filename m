Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91019580B4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 10:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6067810E4F7;
	Tue, 20 Aug 2024 08:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Av3x07uB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58CD10E4F4;
 Tue, 20 Aug 2024 08:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724141918; x=1755677918;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pARHPjrBcidff86LLgR0vu89T7TtLF/a6H7UzJ/qRNY=;
 b=Av3x07uBJnsH20vSj1c/4f16e8po+HV3jx33Cu5/3EMEyeO1B1a/yZFA
 Wh3Z8hwIs7vmScVDRX/l70z2oC62sxcPAXSZv2TvJCKdXKLaRk4UFvwny
 yukTlLKOogkU3ldhzrsUPqRbQAgYU6kvo9vxQvB2HmCqi932+7YAnvhQD
 GlPsRczRe2mxLX19CfcTwJWDZZ8q54pXw9N3bN8sZAzN1IEWcx/ak5z73
 ZZkC8ahP7aBfdbR7lBQmWl4GS+uL6DSaNFvEj809ZTC/W231VN7weQ9N4
 as6rjydz3si8cwXGb551/71Sy/EbF6Br67A3iBUr2ZYbvg7IBDWaZJUwg A==;
X-CSE-ConnectionGUID: XGHJdRfyTAyrOL8qCRbn5A==
X-CSE-MsgGUID: 9Yv9IQRWR6aCgIxcOyvWWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22555153"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22555153"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:18:36 -0700
X-CSE-ConnectionGUID: UUQjDjPmSTyDUWG1JANVaw==
X-CSE-MsgGUID: /tYdMtLWR4SB6LcqTwV0kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="65473470"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.147])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:18:30 -0700
Date: Tue, 20 Aug 2024 10:18:26 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] drivers:gt:Switch to use kmemdup_array()
Message-ID: <ZsRRUrNnveqU6bSV@ashyti-mobl2.lan>
References: <20240820074505.2728118-1-yujiaoliang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820074505.2728118-1-yujiaoliang@vivo.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yi,

Please, next time check with "git drivers/gpu/drm/i915/gt" to
better understand the patch formatting.

The title should be something like:

   drm/i915/gt: Switch to use kmemdup_array()

But sounds more grammatically correct

   drm/i915/gt: Use kmemdup_array instead of kmemdup for multiple allocation

On Tue, Aug 20, 2024 at 03:45:03PM +0800, Yu Jiaoliang wrote:
> Let the kememdup_array() take care about multiplication and possible
> overflows.

Leave one blank line between the commit log and the tag section

> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 09a287c1aedd..d90348c56765 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -111,8 +111,8 @@ static void wa_init_finish(struct i915_wa_list *wal)
>  {
>  	/* Trim unused entries. */
>  	if (!IS_ALIGNED(wal->count, WA_LIST_CHUNK)) {
> -		struct i915_wa *list = kmemdup(wal->list,
> -					       wal->count * sizeof(*list),
> +		struct i915_wa *list = kmemdup_array(wal->list,
> +					       wal->count, sizeof(*list),
>  					       GFP_KERNEL);

Here you are not aligning correctly. Everything should be aligned
to one character after the open parenthesis; for example:

		struct i915_wa *list = kmemdup_array(wal->list, wal->count,
						     sizeof(*list), GFP_KERNEL);

Patch is good, though looking forward to receiving v2.

Thanks,
Andi

>  
>  		if (list) {
> -- 
> 2.34.1
