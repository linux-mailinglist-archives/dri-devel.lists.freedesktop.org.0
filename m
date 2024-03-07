Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8C1875B3D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 00:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743C810E7A1;
	Thu,  7 Mar 2024 23:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnBRJpRG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FB010E1BC;
 Thu,  7 Mar 2024 23:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709855634; x=1741391634;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oRMRLJaIOnXoiUMm1mzrGxqIAovQKaHNtAgi7eyje4A=;
 b=JnBRJpRGPgntwX+1O4fcmo8Cz8kZ5AFuPOp+TNcNodDrA3w80AvKJo/g
 7ANoSVxQ0Vcb8OkB5TEfNonffykJS71XAMgskKh7ZX/3xzF2gV/sjd2Yl
 4krl0Qt6LBd44FluI9msdeBpcuEPepV1WaA2Yv23wOcFTXie5/+r+1UxD
 XH9RWslmWEf83raQycbUPYncP0Hv11vCtthw6CuX8ymqJ7Ek/EKWMXBto
 rhkL4IR4hIJ+nfhdEo4L2+IsuKYsZ+anYDbCRYEI/10opZx6mmQDQbxIM
 Xfqrf3/UQsS4TIcIuk/+W3gKQqYTvJTW0HnWRL1y8cZAg6mkA2ZdSJfdV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4437899"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4437899"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 15:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="14844374"
Received: from unknown (HELO intel.com) ([10.247.118.98])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 15:53:47 -0800
Date: Fri, 8 Mar 2024 00:53:41 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 stable@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v4 1/3] drm/i915/gt: Disable HW load balancing for CCS
Message-ID: <ZepThZYShdbxQOHi@ashyti-mobl2.lan>
References: <20240306012247.246003-1-andi.shyti@linux.intel.com>
 <20240306012247.246003-2-andi.shyti@linux.intel.com>
 <20240306234609.GF718896@mdroper-desk1.amr.corp.intel.com>
 <ZeodSUrgZXL_pjy0@ashyti-mobl2.lan>
 <11146c2d-726a-4b13-98a6-2360dbe77c3b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11146c2d-726a-4b13-98a6-2360dbe77c3b@intel.com>
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

Hi John,

...

> > > > +
> > > > +		/*
> > > > +		 * Wa_14019159160: disable the automatic CCS load balancing
> > > I'm still a bit concerned that this doesn't really match what this
> > > specific workaround is asking us to do.  There seems to be an agreement
> > > on various internal email threads that we need to disable load
> > > balancing, but there's no single specific workaround that officially
> > > documents that decision.
> > > 
> > > This specific workaround asks us to do a bunch of different things, and
> > > the third item it asks for is to disable load balancing in very specific
> > > cases (i.e., while the RCS is active at the same time as one or more CCS
> > > engines).  Taking this workaround in isolation, it would be valid to
> > > keep load balancing active if you were just using the CCS engines and
> > > leaving the RCS idle, or if balancing was turned on/off by the GuC
> > > scheduler according to engine use at the moment, as the documented
> > > workaround seems to assume will be the case.
> > > 
> > > So in general I think we do need to disable load balancing based on
> > > other offline discussion, but blaming that entire change on
> > > Wa_14019159160 seems a bit questionable since it's not really what this
> > > specific workaround is asking us to do and someone may come back and try
> > > to "correct" the implementation of this workaround in the future without
> > > realizing there are other factors too.  It would be great if we could
> > > get hardware teams to properly document this expectation somewhere
> > > (either in a separate dedicated workaround, or in the MMIO tuning guide)
> > > so that we'll have a more direct and authoritative source for such a
> > > large behavioral change.
> > On one had I think you are right, on the other hand I think this
> > workaround has not properly developed in what we have been
> > describing later.
> I think it is not so much that the w/a is 'not properly developed'. It's
> more that this w/a plus others when taken in combination plus knowledge of
> future directions has led to an architectural decision that is beyond the
> scope of the w/a.
> 
> As such, I think Matt is definitely correct. Tagging a code change with a
> w/a number when that change does something very different to what is
> described in the w/a is wrong and a maintenance issue waiting to happen.
> 
> At the very least, you should just put in a comment explaining the
> situation. E.g.:
> 
>  /*
>  * Wa_14019159160: This w/a plus others cause significant issues with the use of
>  * load balancing. Hence an architectural level decision was taking to simply
>  * disable automatic CCS load balancing completely.
>  */
Good suggestion! I will anyway check tomorrow with Joonas if it's
worth the effort to set up a new "software" workaround.

Thanks,
Andi
