Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E736660CC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 17:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB3110E798;
	Wed, 11 Jan 2023 16:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A9A10E798;
 Wed, 11 Jan 2023 16:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673455291; x=1704991291;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4A4ao5L2r3TfP7WL9syRLryKpdWIe2f8//dXaLYFxYA=;
 b=QhEfOu0MSEzkNibyDC1JEnN4p6EWn0wvh4cj7vHKPZNF8qW63i8aV27s
 UFYt0PnaobuNjNDq5l84x2XnDdMw6THnQZG1gIAKX7SCZ3AgWW8PTKJEk
 vKkwzCM4zPFPD7smGdVWoq69Xn9WE4CnxSRUBiCqALOuK1TTv4adrCezT
 7j248jmV+ZX8IkDvukMBm1yzV9nybRKqRZ9vNhYWOmNXe2g3mT7j9F3Nk
 BK8ZOXoWPCM41yEJhE1DAOQsqXWBVZKi5TzdueQNfWya58IzTk+2WB+ix
 Vo6ZwXXSIf0fUW5AsPIWGqw4191acRZYVlKmkb+4H6dlwwh3yTZkqhX9W Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="325478902"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="325478902"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:40:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="688008544"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="688008544"
Received: from mmgriffi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.11.225])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:40:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to settle
In-Reply-To: <Y77XmlzOCuOg8YVZ@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
 <87a62pi501.fsf@intel.com> <Y77XmlzOCuOg8YVZ@ashyti-mobl2.lan>
Date: Wed, 11 Jan 2023 18:40:13 +0200
Message-ID: <87pmblgh3m.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 11 Jan 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> On Wed, Jan 11, 2023 at 03:18:38PM +0200, Jani Nikula wrote:
>> On Wed, 11 Jan 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
>> > From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> >
>> > During module load not all the punit transaction have completed
>> > and we might end up timing out, as shown by the following
>> > warning:
>> 
>> Root cause?
>> 
>> >
>> >    i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)
>> >
>> > Wait 10 seconds for the punit to settle and complete any
>> > outstanding transactions upon module load.
>> >
>> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7814
>> >
>> 
>> No blank lines between the tag lines please.
>
> I don't consider "Closes:" to be a tag even if someone is using
> it as such. AFAIK is not mentioned it in any of the kernel docs
> (e.g. Documentation/process/maintainer-tip.rst).

Basically all of the Something: lines should be bundled together.

BR,
Jani.

>
> Not to confuse it with a normal tag, I wanted to put it in
> parenthesis or rephrase it.
>
>> > Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> > Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
>> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/intel_pcode.c | 35 ++++++++++++++++++++++++++----
>> >  1 file changed, 31 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/intel_pcode.c
>> > index a234d9b4ed14..3db2ba439bb5 100644
>> > --- a/drivers/gpu/drm/i915/intel_pcode.c
>> > +++ b/drivers/gpu/drm/i915/intel_pcode.c
>> > @@ -204,15 +204,42 @@ int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
>> >  #undef COND
>> >  }
>> >  
>> > +static int pcode_init_wait(struct intel_uncore *uncore, int timeout_ms)
>> > +{
>> > +	if (__intel_wait_for_register_fw(uncore,
>> > +					 GEN6_PCODE_MAILBOX,
>> > +					 GEN6_PCODE_READY, 0,
>> > +					 500, timeout_ms,
>> > +					 NULL))
>> > +		return -EPROBE_DEFER;
>> 
>> This is already done within skl_pcode_request -> skl_pcode_try_request
>> -> __snb_pcode_rw path, with waits in skl_pcode_request.
>
> the idea is to check for PCODE_READY even before checking if
> data are sent/received by pcode. And this is only during boot
> time. While skl_pcode_request is called in other contexts as
> well.
>
> In other words here I want to start the communication when I
> already know that the punit is ready. Otherwise I would hit an
> -EAGAIN and fail.
>
>> Is there anyone who still understands what's being waited for, where,
>> for how long, and why in the different code paths? I know I don't, and
>> this isn't helping.
>
> I think it depends on hardware. There are some documents roaming
> around with some boot time and reset time calculation.
>
>> There's also no explanation on the -EPROBE_DEFER return in the commit
>> message or comments or anywhere.
>
> we haven't really failed, right? We just need some time for the
> punit to be ready and try to probe again (remember we are here in
> module probe).
>
> Thanks for the review,
> Andi
>
>> Again, root cause?
>> 
>> BR,
>> Jani.
>> 
>> 
>> > +
>> > +	return skl_pcode_request(uncore,
>> > +				 DG1_PCODE_STATUS,
>> > +				 DG1_UNCORE_GET_INIT_STATUS,
>> > +				 DG1_UNCORE_INIT_STATUS_COMPLETE,
>> > +				 DG1_UNCORE_INIT_STATUS_COMPLETE, timeout_ms);
>> > +}
>> > +
>> >  int intel_pcode_init(struct intel_uncore *uncore)
>> >  {
>> > +	int err;
>> > +
>> >  	if (!IS_DGFX(uncore->i915))
>> >  		return 0;
>> >  
>> > -	return skl_pcode_request(uncore, DG1_PCODE_STATUS,
>> > -				 DG1_UNCORE_GET_INIT_STATUS,
>> > -				 DG1_UNCORE_INIT_STATUS_COMPLETE,
>> > -				 DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
>> > +	/*
>> > +	 * Wait 10 seconds so that the punit to settle and complete
>> > +	 * any outstanding transactions upon module load
>> > +	 */
>> > +	err = pcode_init_wait(uncore, 10000);
>> > +
>> > +	if (err) {
>> > +		drm_notice(&uncore->i915->drm,
>> > +			   "Waiting for HW initialisation...\n");
>> > +		err = pcode_init_wait(uncore, 180000);
>> > +	}
>> > +
>> > +	return err;
>> >  }
>> >  
>> >  int snb_pcode_read_p(struct intel_uncore *uncore, u32 mbcmd, u32 p1, u32 p2, u32 *val)
>> 
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
