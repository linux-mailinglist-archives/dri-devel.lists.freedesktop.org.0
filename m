Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2495C665F48
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1011510E765;
	Wed, 11 Jan 2023 15:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE5910E765;
 Wed, 11 Jan 2023 15:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673451514; x=1704987514;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z4nnnj4scpCwsaTtJTaDRBX6q94GmY3sj2vvcdVJUj4=;
 b=R2iyGANwDn+gLwijOd55UcerHqnWqsO5mY3SkHc5Mcx7mQ+IH/mQ4Y3L
 eWnG9um49ekTO1JvEbsVrFXc3F17dqyaU50KmhuGw+7nh54v2GvbLqZka
 J3+8ypXsd5ENLKR1su7fp8PFyiwY9FAkPfKz33dr678w0/7vrBAjRKdnn
 dtEEz95IpyOzCAvRNKpvsdH/0H8YV+6tMMZjDxkgiHGNAD728QHpNb7l+
 H3DKutCFOb4K7/URasDE7mY+DG3MuE2Rv2dabonZnmfIq0flIxVaMlDVZ
 gdNR7QBAYHhKzqMWl474KetEZqSmp3l/Ke0Ywuv3mZBFe/gd8RFs4cfy2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="321136149"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="321136149"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 07:37:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="765195417"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="765195417"
Received: from silin-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.53.16])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 07:37:01 -0800
Date: Wed, 11 Jan 2023 16:36:58 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to settle
Message-ID: <Y77XmlzOCuOg8YVZ@ashyti-mobl2.lan>
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
 <87a62pi501.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a62pi501.fsf@intel.com>
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
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi@etezian.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 03:18:38PM +0200, Jani Nikula wrote:
> On Wed, 11 Jan 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> > From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> >
> > During module load not all the punit transaction have completed
> > and we might end up timing out, as shown by the following
> > warning:
> 
> Root cause?
> 
> >
> >    i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)
> >
> > Wait 10 seconds for the punit to settle and complete any
> > outstanding transactions upon module load.
> >
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7814
> >
> 
> No blank lines between the tag lines please.

I don't consider "Closes:" to be a tag even if someone is using
it as such. AFAIK is not mentioned it in any of the kernel docs
(e.g. Documentation/process/maintainer-tip.rst).

Not to confuse it with a normal tag, I wanted to put it in
parenthesis or rephrase it.

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
> 
> This is already done within skl_pcode_request -> skl_pcode_try_request
> -> __snb_pcode_rw path, with waits in skl_pcode_request.

the idea is to check for PCODE_READY even before checking if
data are sent/received by pcode. And this is only during boot
time. While skl_pcode_request is called in other contexts as
well.

In other words here I want to start the communication when I
already know that the punit is ready. Otherwise I would hit an
-EAGAIN and fail.

> Is there anyone who still understands what's being waited for, where,
> for how long, and why in the different code paths? I know I don't, and
> this isn't helping.

I think it depends on hardware. There are some documents roaming
around with some boot time and reset time calculation.

> There's also no explanation on the -EPROBE_DEFER return in the commit
> message or comments or anywhere.

we haven't really failed, right? We just need some time for the
punit to be ready and try to probe again (remember we are here in
module probe).

Thanks for the review,
Andi

> Again, root cause?
> 
> BR,
> Jani.
> 
> 
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
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
