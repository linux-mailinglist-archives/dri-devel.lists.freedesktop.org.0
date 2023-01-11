Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A97665F75
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A906B10E77D;
	Wed, 11 Jan 2023 15:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0589510E767;
 Wed, 11 Jan 2023 15:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673451689; x=1704987689;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YOqI34fYIjwD3YEeflSVAa0jcE31f+0uMTwEwOQly+4=;
 b=Njk49KdlIIyyU+zPi7EUHoKOL9S0eHxvHvQzJqLlJ8eXZNmLm+1EmzXO
 xfbNj0nMjTC/mhfjQBzciPEJw8qhQOqo/yZ5TA9puNYqtcp/NvE9/BTrd
 89UBEPFQqpVtMG8pr3D380EDQuKm4u68drSJuDxQdjNMYhzqYVZWiBuXb
 Qg4cSwEuSg8jx7MJPvOzGGWPTqqLdg+lP0f9Ive9sg71/nzky2wV5xF7q
 jFwS9PJWIjBjga5kU6uFtKInh8Vxk1Xoq+EoQgWcWj1w2YQFt6oTQeBtp
 yhvCxONcJLBi7zTeRi7jAerBd4qsG9qygDbhmtTgQskbCDoRnIfv3PDkk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="322144763"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="322144763"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 07:39:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="746198014"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="746198014"
Received: from silin-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.53.16])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 07:39:39 -0800
Date: Wed, 11 Jan 2023 16:39:36 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to settle
Message-ID: <Y77YOGLaTPiZ4Opr@ashyti-mobl2.lan>
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
 <Y77VBNAgY161+QNM@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y77VBNAgY161+QNM@intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On Wed, Jan 11, 2023 at 10:25:56AM -0500, Rodrigo Vivi wrote:
> On Wed, Jan 11, 2023 at 11:44:47AM +0100, Andi Shyti wrote:
> > From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > 
> > During module load not all the punit transaction have completed
> > and we might end up timing out, as shown by the following
> > warning:
> > 
> >    i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)
> > 
> > Wait 10 seconds for the punit to settle and complete any
> > outstanding transactions upon module load.
> 
> 10 *SECONDS* ?!

Don't be alarmed :)

It's up to 10 seconds, otherwise we would end up waiting up to 3
minutes.

And I've seen a version (and you did as well) where those 3
minutes were raised to 6 (for the PVC particular case).

Thanks for checking this,
Andi

> > 
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7814
> > 
> > Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/intel_pcode.c | 35 ++++++++++++++++++++++++++----
> >  1 file changed, 31 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/intel_pcode.c
> > index a234d9b4ed14..3db2ba439bb5 100644
> > --- a/drivers/gpu/drm/i915/intel_pcode.c
> > +++ b/drivers/gpu/drm/i915/intel_pcode.c
> > @@ -204,15 +204,42 @@ int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
> >  #undef COND
> >  }
> >  
> > +static int pcode_init_wait(struct intel_uncore *uncore, int timeout_ms)
> > +{
> > +	if (__intel_wait_for_register_fw(uncore,
> > +					 GEN6_PCODE_MAILBOX,
> > +					 GEN6_PCODE_READY, 0,
> > +					 500, timeout_ms,
> > +					 NULL))
> > +		return -EPROBE_DEFER;
> > +
> > +	return skl_pcode_request(uncore,
> > +				 DG1_PCODE_STATUS,
> > +				 DG1_UNCORE_GET_INIT_STATUS,
> > +				 DG1_UNCORE_INIT_STATUS_COMPLETE,
> > +				 DG1_UNCORE_INIT_STATUS_COMPLETE, timeout_ms);
> > +}
> > +
> >  int intel_pcode_init(struct intel_uncore *uncore)
> >  {
> > +	int err;
> > +
> >  	if (!IS_DGFX(uncore->i915))
> >  		return 0;
> >  
> > -	return skl_pcode_request(uncore, DG1_PCODE_STATUS,
> > -				 DG1_UNCORE_GET_INIT_STATUS,
> > -				 DG1_UNCORE_INIT_STATUS_COMPLETE,
> > -				 DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
> > +	/*
> > +	 * Wait 10 seconds so that the punit to settle and complete
> > +	 * any outstanding transactions upon module load
> > +	 */
> > +	err = pcode_init_wait(uncore, 10000);
> > +
> > +	if (err) {
> > +		drm_notice(&uncore->i915->drm,
> > +			   "Waiting for HW initialisation...\n");
> > +		err = pcode_init_wait(uncore, 180000);
> > +	}
> > +
> > +	return err;
> >  }
> >  
> >  int snb_pcode_read_p(struct intel_uncore *uncore, u32 mbcmd, u32 p1, u32 p2, u32 *val)
> > -- 
> > 2.34.1
> > 
