Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF6D4B83D7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B6210E801;
	Wed, 16 Feb 2022 09:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C423D10E800;
 Wed, 16 Feb 2022 09:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645003179; x=1676539179;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W7JJ5S6ygKVdkRCpl3XvCOgtF+37zc1PmPKZVKrCQZU=;
 b=BetgSctASbOnsKjtu2tYJm0zQjAFuTAlSoZ122CQZvFO1fXt3Y7hRANb
 XlYxELmwUKHqqV9vRVfkm4GxBG1rln/7/BBOShz+psLWCBM5U2cegeGqd
 ACdJeVxU9fsKdYW8uOlNrcKf0dG9C8iFcZsVCTkgIyfIgomK5WtfLbq/V
 Hm1t0+zThtyS1U9wJA6MJfhBakwG4zicxnHA1CwUGr21FknsBMMLdLNhD
 yrZs8paTlHdJh6lecGZum+sPaagk/3U/TSn+anV+F4U+PxYKnZ80piIjt
 MAGKZ7hg96FAiRzPPwFN6RNhaxAAHLmdPgCUEmbfs7t65lri5HeY2x60K A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250760605"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="250760605"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 01:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="498578877"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga006.jf.intel.com with SMTP; 16 Feb 2022 01:19:34 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Feb 2022 11:19:33 +0200
Date: Wed, 16 Feb 2022 11:19:33 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: fix unsigned integer to signed assignment
Message-ID: <YgzBpX2SKCh4cb19@intel.com>
References: <20220216083849.91239-1-jiapeng.chong@linux.alibaba.com>
 <87h78z5gmp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h78z5gmp.fsf@intel.com>
X-Patchwork-Hint: comment
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 rodrigo.vivi@intel.com, christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 11:02:06AM +0200, Jani Nikula wrote:
> On Wed, 16 Feb 2022, Jiapeng Chong <jiapeng.chong@linux.alibaba.com> wrote:
> > Eliminate the follow smatch warning:
> >
> > drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4640
> > guc_create_virtual() warn: assigning (-2) to unsigned variable
> > 've->base.instance'.
> >
> > drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4641
> > guc_create_virtual() warn: assigning (-2) to unsigned variable
> > 've->base.uabi_instance'.
> >
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> The report seems to be valid, but I don't think this is the fix.
> 
> Where do we even check for invalid instance/uabi_instance in code?

The whole thing seems rather poorly documented as there's a matching
uabi struct with __u16's and the negative values are defined right
there in the uapi header as well.

> 
> BR,
> Jani.
> 
> 
> > ---
> >  drivers/gpu/drm/i915/gt/intel_engine_types.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > index 36365bdbe1ee..dc7cc06c68e7 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > @@ -328,10 +328,10 @@ struct intel_engine_cs {
> >  	intel_engine_mask_t logical_mask;
> >  
> >  	u8 class;
> > -	u8 instance;
> > +	s8 instance;
> >  
> >  	u16 uabi_class;
> > -	u16 uabi_instance;
> > +	s16 uabi_instance;
> >  
> >  	u32 uabi_capabilities;
> >  	u32 context_size;
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Ville Syrjälä
Intel
