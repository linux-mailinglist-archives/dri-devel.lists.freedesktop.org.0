Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29758497963
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 08:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E985E10EBDE;
	Mon, 24 Jan 2022 07:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E9810EBEB;
 Mon, 24 Jan 2022 07:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643009275; x=1674545275;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sipxUkhwaAEDluHYIhBEtL2FMiWtPPy8wVlRwkgIVmk=;
 b=CWFa4Cirqr5VplM6+o8wsug3hL9udhmSg0RYBcrPAdd05cfm0bIcq93L
 fhf8rCrk7lt4ZtIEYggmDwcvtFfKhi29qn1lqMNkFPvefdTAiQDclF4nu
 sQlAbOnvhyHa21kl5C/MSHepR6lCtc7MPAgK9ZrBSetHlVhHy7fykbEH0
 yK+r/YTwP3FvaG152Nx69ibSuz1hoyVq7177UsD2x0O4eqswTh8XiaimM
 N8mWDdQpDa2okRsCarxV8ECgqMcvTXQ2J8xGBylIX2iG0TnwqP3ZldWYm
 9H6tfVCWXYb2G2mxQKOG+6z0jiFLvienE/luyhQQo9nLw/K+54Kmo+aAU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="332339741"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="332339741"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 23:27:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="673536160"
Received: from xwan118-mobl1.ger.corp.intel.com (HELO [10.249.254.58])
 ([10.249.254.58])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 23:27:26 -0800
Message-ID: <3ba14be418ab94a5cee363146438e188cb08d6cd.camel@linux.intel.com>
Subject: Re: [PATCH] drm/i915: fix header file inclusion for might_alloc()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
Date: Mon, 24 Jan 2022 08:27:24 +0100
In-Reply-To: <20220124010811.1640-1-andi.shyti@linux.intel.com>
References: <20220124010811.1640-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-01-24 at 03:08 +0200, Andi Shyti wrote:
> Replace "linux/slab.h" with "linux/sched/mm.h" header inclusion
> as the first is not required, while the second, if not included,
> prdouces the following error:
> 
> drivers/gpu/drm/i915/i915_vma_resource.c: In function
> ‘i915_vma_resource_bind_dep_await’:
> drivers/gpu/drm/i915/i915_vma_resource.c:381:9: error: implicit
> declaration of function ‘might_alloc’; did you mean ‘might_lock’? [-
> Werror=implicit-function-declaration]
>   381 |         might_alloc(gfp);
>       |         ^~~~~~~~~~~
>       |         might_lock
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

We'd need a Fixes: tag here?

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>  drivers/gpu/drm/i915/i915_vma_resource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma_resource.c
> b/drivers/gpu/drm/i915/i915_vma_resource.c
> index 1f41c0c699eb..bbb0ff14272f 100644
> --- a/drivers/gpu/drm/i915/i915_vma_resource.c
> +++ b/drivers/gpu/drm/i915/i915_vma_resource.c
> @@ -4,7 +4,7 @@
>   */
>  
>  #include <linux/interval_tree_generic.h>
> -#include <linux/slab.h>
> +#include <linux/sched/mm.h>
>  
>  #include "i915_sw_fence.h"
>  #include "i915_vma_resource.h"


