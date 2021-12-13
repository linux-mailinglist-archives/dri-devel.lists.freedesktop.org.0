Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 032114733DE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 19:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B638110E845;
	Mon, 13 Dec 2021 18:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCEC10E845;
 Mon, 13 Dec 2021 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639419613; x=1670955613;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gtpppRChZmOnMX1MS+xsL0Ih/fLueLvw+IiGpIJAf+I=;
 b=CCN5gUuHPUZPn4uLgwOWO8HPft1ay4C4jEjx+6CPRn0+P6oxokeIFoqn
 LuqQxowEr26SGpPdinkhYz2y30dKwpcJeNTJ3+ioGWVKIdoZ8juk/uxGw
 L5cEep3GvFBJD6Xgu4SplTBzMbATIfHThU5Vu8U30FosjAMTIFux70NNj
 dEiVnfxvL/LzUPxS2aoPjBKuQ7rFXVcQ3ZnPe4qMs4vs7SMXmeYP8DpNe
 AwRUE4ip6XAYNuuhY3GiNQcqX3sChxZmYnzYtubXQjA3RstD3J88cUtrd
 2Cn8pYPV6u49tCYRu63XT2yzkTDv+r0jO1HiFcFkjnvW7XbEbAhft0Fzz Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="237529621"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="237529621"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 10:20:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="517863522"
Received: from dlita-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.53.92])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 10:20:09 -0800
Date: Mon, 13 Dec 2021 20:20:06 +0200
From: Andi Shyti <andi.shyti@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH RESEND v7 12/12] drm/i915: Move the GGTT from i915
 private data to the GT
Message-ID: <YbeO1saXid4TEJHy@intel.intel>
References: <20211212152117.118428-1-andi.shyti@linux.intel.com>
 <20211212152117.118428-13-andi.shyti@linux.intel.com>
 <20211213181647.GK2219399@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213181647.GK2219399@mdroper-desk1.amr.corp.intel.com>
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

On Mon, Dec 13, 2021 at 10:16:47AM -0800, Matt Roper wrote:
> On Sun, Dec 12, 2021 at 05:21:17PM +0200, Andi Shyti wrote:
> > GGTT was available both through i915->ggtt and gt->ggtt, and we
> > eventually want to get rid of the i915->ggtt one.
> > Move the GGTT from i915 to gt and use to_gt() for accesssing the
> > ggtt.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > ---
> ...
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > index 14216cc471b1..02fc7641b82e 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > @@ -69,7 +69,7 @@ enum intel_submission_method {
> >  struct intel_gt {
> >  	struct drm_i915_private *i915;
> >  	struct intel_uncore *uncore;
> > -	struct i915_ggtt *ggtt;
> > +	struct i915_ggtt ggtt;
> >  
> >  	struct intel_uc uc;
> >  
> 
> I'm not sure this is the direction we want to go.  Although it works for
> the initial multi-tile support, there's some other stuff coming up soon
> that will require two intel_gt's to share the same ggtt rather than
> each having an independent one.

Sure... I sent this just to have an opinion, I'm dropping it.

Thanks,
Andi
