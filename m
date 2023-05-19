Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DC5708CDE
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 02:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D22D10E596;
	Fri, 19 May 2023 00:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AFE10E596
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 00:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684456001; x=1715992001;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IczHcTinen5R8LnXTA43eyV1MBcFE/tZE7MTOfhMK9c=;
 b=hAiA+VJUKafiqXo7y2Wp7es6zMvyfXRWQ9TVuup150GAArHnab+Y2+AQ
 gq0wGQAEaoZxn9LBl3bGV20my1xIjOfYCq91FzQ9Ojz7o1PIUf+vLGM09
 D5pEfZBbLLnWStnxqPBb0rk5xp/b2RLhGsZik/aq9MKylRdeoon6RH6bY
 rjSzlzHQ4omqp6INm1V5yL0RMuBsZufMPbIVYFeqdEbv5wch4UoBnembA
 WCJg1Cuxs3RJNHzC8UIJv8iAGXEuL+fq5Chayg+7DXYZlQteWK76L3Sxy
 blPr2KgvdD7lOUZuVfwJXs5t9tBLWYYKue3C2bFv7SSUHl55ZdI2LNAnv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="349750313"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="349750313"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 17:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="826588292"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="826588292"
Received: from refaase-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.221.245])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 17:26:38 -0700
Date: Fri, 19 May 2023 02:26:35 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: vidi: fix a wrong error return
Message-ID: <ZGbCO9/5yEstym+c@ashyti-mobl2.lan>
References: <CGME20230519000408epcas1p4f5d90f588e7250d2d168d2943adef4f7@epcas1p4.samsung.com>
 <20230519000407.60744-1-inki.dae@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519000407.60744-1-inki.dae@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Inki,

On Fri, May 19, 2023 at 09:04:07AM +0900, Inki Dae wrote:
> Fix a wrong error return by dropping an error return.
> 
> When vidi driver is remvoed, if ctx->raw_edid isn't same as fake_edid_info
> then only what we have to is to free ctx->raw_edid so that driver removing
> can work correctly - it's not an error case.
> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> index 4d56c8c799c5..f5e1adfcaa51 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -469,8 +469,6 @@ static int vidi_remove(struct platform_device *pdev)
>  	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
>  		kfree(ctx->raw_edid);
>  		ctx->raw_edid = NULL;
> -
> -		return -EINVAL;

It doesn't look right to me, I think the correct patch should be:

-       if (ctx->raw_edid != (struct edid *)fake_edid_info) {
-               kfree(ctx->raw_edid);
-               ctx->raw_edid = NULL;
-
-               return -EINVAL;
-       }
-
+       ctx->raw_edid = NULL;

because "ctx->raw_edid" points to a non allocated memory in the
.data segment and you cannot free it.

A follow-up cleanup should be to remove the "const" from
fake_edid_info because you are assigning its address to pointers
(raw_edid), so that what's the point for having it const? You are
just fooling the compiler :)

Andi

>  	}
>  
>  	component_del(&pdev->dev, &vidi_component_ops);
> -- 
> 2.25.1
