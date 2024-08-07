Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86F894AADD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 16:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047DC10E118;
	Wed,  7 Aug 2024 14:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsQ6GLDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AA310E562;
 Wed,  7 Aug 2024 14:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723042730; x=1754578730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2fItWewwxFGqhmsqb2jSiwgO6+kgU3T+Q2F51ZJQ8+I=;
 b=dsQ6GLDo4vaHgtqULpnZlPZwOzG96BFbwJch9nRW9mgswMgOAur4Hsqx
 l/NzNRQxyBbuZBfYq+WN9ZR7SuSnfXcrYrTLsenSvSiqJsgwV9ECMMJUz
 3Oi5L0+FmVBzaYElKc3I5a3E84uXPWUiSFCvLQkUcYk9Lh8tEp8tt3pdM
 ArM6vTj3ILedT5Grs+gHNmcyjCfLxoE7OMukT2KYTI0ayt0ft2DLJZaEw
 l6GyT0zKSEr1HWKCpGPqCo2hsLInN7D2tL7TEbHBokEMLKKzrOzDgtydV
 26k0b5sbMhkH/+GJFJkCCofNUcd/WXwFCAO97eG4QD3TPjHBVfkausWNB w==;
X-CSE-ConnectionGUID: 6mqUkM5wQTiHwp1ILaLtoA==
X-CSE-MsgGUID: NjD+iQA2RPOG2uJxTlq5IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32520888"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="32520888"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 07:58:50 -0700
X-CSE-ConnectionGUID: VlmhSiYLTeeDTDHJqqa1uA==
X-CSE-MsgGUID: 0gbQH6ABSa+3Udj6lGs5ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="56970199"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.8])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 07:58:45 -0700
Date: Wed, 7 Aug 2024 15:58:30 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: Thorsten Blum <thorsten.blum@toblux.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/i915: Explicitly cast divisor and use div_u64()
Message-ID: <ZrOLlofTKS_xKWrC@ashyti-mobl2.lan>
References: <20240802160323.46518-2-thorsten.blum@toblux.com>
 <CH0PR11MB544400E7751E4A4090DBB387E5BE2@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR11MB544400E7751E4A4090DBB387E5BE2@CH0PR11MB5444.namprd11.prod.outlook.com>
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

Hi Thorsten,

> >  			/* This check is primarily to ensure that oa_period <=
> > -			 * UINT32_MAX (before passing to do_div which only
> > +			 * UINT32_MAX (before passing it to div_u64 which only
> >  			 * accepts a u32 denominator), but we can also skip
> >  			 * checking anything < 1Hz which implicitly can't be
> >  			 * limited via an integer oa_max_sample_rate.
> >  			 */
> >  			if (oa_period <= NSEC_PER_SEC) {
> > -				u64 tmp = NSEC_PER_SEC;
> > -				do_div(tmp, oa_period);
> > -				oa_freq_hz = tmp;
> > +				oa_freq_hz = div_u64(NSEC_PER_SEC, (u32)oa_period);
> >  			} else
> >  				oa_freq_hz = 0;
> 
> Non-blocking suggestion: this looks like it can be inlined.  And if the
> inline route is taken, it might be best to invert the conditional check
> like such:
> 
> oa_freq_hz = oa_period > NSEC_PER_SEC ? 0 :
>                                      div_u64(NSEC_PER_SEC, (u32)oa_period);
> 
> I think this is just a matter of preference, though.  The explicit if-else
> block is definitely clearer.

It's also stylistically wrong given that now the if/else don't
need the brackets anymore, triggering a checkpatch error.

Thorsten do you mind resending it either following Jonathan's
suggestion (my favourite, as well) or fix the bracket issue
following the kernel style.

Andi
