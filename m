Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C7B708DDD
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 04:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63ABC10E5A1;
	Fri, 19 May 2023 02:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4781710E5A1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 02:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684463838; x=1715999838;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gPVLxIgLjrPophpUuE+ZF3za491E2E6KrFr2sELiUXI=;
 b=Skvim25YKcxwzE9rV4SmdOwgWbzio3IKm4UfqdaT8cbLuBCthBWVROdn
 ZHo61azBjbb3FZlw2rYa3qrGw0yhWP9hjf7tV0IfWXL3h3aTdzFBSyyFx
 PRg2SGK+BOVazJ2/s0YfTdyeRdS+PS1Z2wE2kzyaH38yGHZL2EbpcrDYN
 dXgAxFLpJKA/qT2RzjRZ1REvpaxakwjryZS3h6fMTXSP5EKUxAcpc3Cpd
 uDxlwfanjx3lOH2i7X/5XII8eAqdPRqWOQJLu4IGxQoM/AFJEUgU2APAu
 O0VLsHjfuapaHqlRr48i1QICmzf25XQRrLjtVSvO9yNQyEyW7pJXX/HKp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="352278826"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="352278826"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 19:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="814565295"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="814565295"
Received: from refaase-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.221.245])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 19:37:04 -0700
Date: Fri, 19 May 2023 04:37:01 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/exynos: vidi: fix a wrong error return
Message-ID: <ZGbgza6w6taNIXAl@ashyti-mobl2.lan>
References: <CGME20230519000408epcas1p4f5d90f588e7250d2d168d2943adef4f7@epcas1p4.samsung.com>
 <20230519000407.60744-1-inki.dae@samsung.com>
 <ZGbCO9/5yEstym+c@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGbCO9/5yEstym+c@ashyti-mobl2.lan>
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

On Fri, May 19, 2023 at 02:26:40AM +0200, Andi Shyti wrote:
> Hi Inki,
> 
> On Fri, May 19, 2023 at 09:04:07AM +0900, Inki Dae wrote:
> > Fix a wrong error return by dropping an error return.
> > 
> > When vidi driver is remvoed, if ctx->raw_edid isn't same as fake_edid_info
> > then only what we have to is to free ctx->raw_edid so that driver removing
> > can work correctly - it's not an error case.
> > 
> > Signed-off-by: Inki Dae <inki.dae@samsung.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> > index 4d56c8c799c5..f5e1adfcaa51 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> > @@ -469,8 +469,6 @@ static int vidi_remove(struct platform_device *pdev)
> >  	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
> >  		kfree(ctx->raw_edid);
> >  		ctx->raw_edid = NULL;
> > -
> > -		return -EINVAL;
> 
> It doesn't look right to me, I think the correct patch should be:
> 
> -       if (ctx->raw_edid != (struct edid *)fake_edid_info) {
> -               kfree(ctx->raw_edid);
> -               ctx->raw_edid = NULL;
> -
> -               return -EINVAL;
> -       }
> -
> +       ctx->raw_edid = NULL;
> 
> because "ctx->raw_edid" points to a non allocated memory in the
> .data segment and you cannot free it.
> 
> A follow-up cleanup should be to remove the "const" from
> fake_edid_info because you are assigning its address to pointers
> (raw_edid), so that what's the point for having it const? You are
> just fooling the compiler :)

please ignore, this is what happens when reading patches at
2.26am, that a "!=" becomes "==". The patch is correct, still
some cleanups is needed here, though.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

PS I was actually sleeping and this woke me up :)

> Andi
> 
> >  	}
> >  
> >  	component_del(&pdev->dev, &vidi_component_ops);
> > -- 
> > 2.25.1
