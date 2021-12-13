Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5EE4733BE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 19:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E2510E839;
	Mon, 13 Dec 2021 18:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8D610E837;
 Mon, 13 Dec 2021 18:16:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="218810302"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="218810302"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 10:16:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="517862130"
Received: from dlita-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.53.92])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 10:16:28 -0800
Date: Mon, 13 Dec 2021 20:16:25 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH RESEND v7 11/12] drm/i915: Use to_gt() helper for GGTT
 accesses
Message-ID: <YbeN+WRnQhfLDOSf@intel.intel>
References: <20211212152117.118428-1-andi.shyti@linux.intel.com>
 <20211212152117.118428-12-andi.shyti@linux.intel.com>
 <20211213181053.GJ2219399@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213181053.GJ2219399@mdroper-desk1.amr.corp.intel.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Andi Shyti <andi@etezian.org>, Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > index 95174938b160..2619bb17b6eb 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -571,6 +571,8 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
> >  
> >  	i915_perf_init(dev_priv);
> >  
> > +	intel_gt_init_hw_early(to_gt(dev_priv), to_gt(dev_priv)->ggtt);
> 
> intel_gt_init_hw_early is defined as
> 
>         void intel_gt_init_hw_early(struct intel_gt *gt, struct i915_ggtt *ggtt)
>         {
>                 gt->ggtt = ggtt;
>         }
> 
> so this call is now essentially doing
> 
>         to_gt(dev_priv)->ggtt = to_gt(dev_priv)->ggtt
> 
> which isn't what you intended.  It might be better to just drop the
> function completely and instead assign the gt's ggtt pointer here to a
> drmm_kzalloc() dynamic allocation.

ehehe... yes, I actually had this fixed (in mock device it's
indeed correct), but I might have brought it back by mistake.
Thanks for noticing it.

The next patch removes it.

Andi
