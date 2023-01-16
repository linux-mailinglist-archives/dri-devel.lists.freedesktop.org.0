Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E51266CF88
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 20:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5956410E49E;
	Mon, 16 Jan 2023 19:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D69B10E49E;
 Mon, 16 Jan 2023 19:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673897247; x=1705433247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D//9tX9uMIfk0TcaireKllJNoQGCP467hbXDiPzx+4k=;
 b=WEqRXGroaMT9PGQ0YXQfgKVgok1bOHYsWAHIc3MzPD6ZtdLH0yforpGL
 3XH2VdQzSrcuHEijwl/Pgj2jYDtK1THT7UWgqDVaob2jBb47I2dCdSdQ0
 4mCTEHL0uofDg/O4foxEkZyceOWvn8gnYuCBrLtkDVc3bQHHas7y1ZixT
 JQFHF53VGIsf2ah9ZYSoRxdVbtvmM9BSH1zcWydSa1Gq2CjPpsGmxSmRr
 GimBVk/fy05Zlp5vLV4dDlZf34WnwFub/fyKZOQ/2ulHftCuPq3uLQqze
 MooDGwSWbi4krHISCIggVZPZUNYsLv6hgW7FESzj0CcSiG//wY+eGj2wf w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="304227529"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="304227529"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 11:27:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="661065760"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="661065760"
Received: from rhormila-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.100])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 11:27:24 -0800
Date: Mon, 16 Jan 2023 20:27:20 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to
 settle
Message-ID: <Y8WlGHxXgBo7av+j@ashyti-mobl2.lan>
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
 <Y77VBNAgY161+QNM@intel.com> <Y77YOGLaTPiZ4Opr@ashyti-mobl2.lan>
 <Y77skCsA2rTouT7E@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y77skCsA2rTouT7E@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On Wed, Jan 11, 2023 at 12:06:24PM -0500, Rodrigo Vivi wrote:
> On Wed, Jan 11, 2023 at 04:39:36PM +0100, Andi Shyti wrote:
> > Hi Rodrigo,
> > 
> > On Wed, Jan 11, 2023 at 10:25:56AM -0500, Rodrigo Vivi wrote:
> > > On Wed, Jan 11, 2023 at 11:44:47AM +0100, Andi Shyti wrote:
> > > > From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > 
> > > > During module load not all the punit transaction have completed
> > > > and we might end up timing out, as shown by the following
> > > > warning:
> > > > 
> > > >    i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)
> > > > 
> > > > Wait 10 seconds for the punit to settle and complete any
> > > > outstanding transactions upon module load.
> > > 
> > > 10 *SECONDS* ?!
> > 
> > Don't be alarmed :)
> > 
> > It's up to 10 seconds, otherwise we would end up waiting up to 3
> > minutes.
> > 
> > And I've seen a version (and you did as well) where those 3
> > minutes were raised to 6 (for the PVC particular case).
> 
> Oh yeap! and that case is funny! Because the indication from PCODE
> is that 10 seconds is enough, but there are some rare cases where
> it gets stuck and end up taking a very long time. Then they multiplied
> the bad rare case to 3, and no idea why how that become 6.
> 
> But anyway, thanks for refreshing my memory. When I first noticed this
> patch I thought it was in all the platforms, where this wouldn't make
> sense. But on discrete where the pcode needs to bring the memory and
> gt up before we can really use it, it makes sense.
> 
> And then I noticed that your patch is indeed for dgfx only, so it
> would be okay. And 10 seconds is okay.

yes... :)

Thanks for the recap!

> However I also noticed that you do this before the other pcode_init
> check that we were told by pcode folks to use. So, I don't understand
> how your patch is helping now... you wait for 10 seconds and then you
> will wait more 10 seconds on the pcode_ready... why the pcode_ready
> check that we have in case already doesn't cover yours?

The difference is that the first timeout ensures that the punit
is ready during boot time. The need to wait is only in boot,
as we check if it's ready and then start communicating.

The second 10s wait comes after the read/write has actually
happened. I expect in this case to wait just a little because
it's just a test write done in boot to make sure the punit is
really responding and ready for the next writes.

But because skl_pcode_request() is used in other contexts, as
well, I assume that the punit is ready and I don't need to wait
anymore before communicating with it. Thus I wait only after
sending the command: I wait for it to complete and be ready again
for the next command.

In other words each wait makes sure that the punit is ready for
the next command. That's why we need a first 10 seconds wait as
at the very first write we weren't sure 100% the punit was ready.

> And why that return?

Becase the driver is not really failing. Most probably the
hardware is completing the boot routines thus we need to try
probing again later.

I hope I was able to explain myself.

Thanks for the comments and for looking into this,
Andi

> > 
> > Thanks for checking this,
> > Andi
> > 
> > > > 
> > > > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7814
> > > > 
> > > > Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/intel_pcode.c | 35 ++++++++++++++++++++++++++----
> > > >  1 file changed, 31 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/intel_pcode.c
> > > > index a234d9b4ed14..3db2ba439bb5 100644
> > > > --- a/drivers/gpu/drm/i915/intel_pcode.c
> > > > +++ b/drivers/gpu/drm/i915/intel_pcode.c
> > > > @@ -204,15 +204,42 @@ int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
> > > >  #undef COND
> > > >  }
> > > >  
> > > > +static int pcode_init_wait(struct intel_uncore *uncore, int timeout_ms)
> > > > +{
> > > > +	if (__intel_wait_for_register_fw(uncore,
> > > > +					 GEN6_PCODE_MAILBOX,
> > > > +					 GEN6_PCODE_READY, 0,
> > > > +					 500, timeout_ms,
> > > > +					 NULL))
> > > > +		return -EPROBE_DEFER;
> > > > +
> > > > +	return skl_pcode_request(uncore,
> > > > +				 DG1_PCODE_STATUS,
> > > > +				 DG1_UNCORE_GET_INIT_STATUS,
> > > > +				 DG1_UNCORE_INIT_STATUS_COMPLETE,
> > > > +				 DG1_UNCORE_INIT_STATUS_COMPLETE, timeout_ms);
> > > > +}
> > > > +
> > > >  int intel_pcode_init(struct intel_uncore *uncore)
> > > >  {
> > > > +	int err;
> > > > +
> > > >  	if (!IS_DGFX(uncore->i915))
> > > >  		return 0;
> > > >  
> > > > -	return skl_pcode_request(uncore, DG1_PCODE_STATUS,
> > > > -				 DG1_UNCORE_GET_INIT_STATUS,
> > > > -				 DG1_UNCORE_INIT_STATUS_COMPLETE,
> > > > -				 DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
> > > > +	/*
> > > > +	 * Wait 10 seconds so that the punit to settle and complete
> > > > +	 * any outstanding transactions upon module load
> > > > +	 */
> > > > +	err = pcode_init_wait(uncore, 10000);
> > > > +
> > > > +	if (err) {
> > > > +		drm_notice(&uncore->i915->drm,
> > > > +			   "Waiting for HW initialisation...\n");
> > > > +		err = pcode_init_wait(uncore, 180000);
> > > > +	}
> > > > +
> > > > +	return err;
> > > >  }
> > > >  
> > > >  int snb_pcode_read_p(struct intel_uncore *uncore, u32 mbcmd, u32 p1, u32 p2, u32 *val)
> > > > -- 
> > > > 2.34.1
> > > > 
