Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7312534D31
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 12:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758E610E997;
	Thu, 26 May 2022 10:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2657B10E927;
 Thu, 26 May 2022 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653560300; x=1685096300;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dU/2BP1rSwAhJwBPTy3VgikcoeYKXhnupFLGjaT35+A=;
 b=W7qSIE6WfpMCQhvJoA60h7U83qwQcLgkcWg3yMo5424/2e74oawlVPYK
 sI7DnlUznuylzvzTTla415QgkXTk9gpU8nJu7i4QMqR2Z1SYdCQFFuy0/
 lm5n5V9ZDrBdHMLojUwcoBPzPV0rYdEBAf8SSmVNCzRMdGicz7okUn39H
 6vesZt4fzrx19OWVR03V9JAiIuYLHUFRoSeyGcPP2WfGnN04UFbTrhwdo
 QsHQYe0Rh525nicseoO/6eOqNBCxskIqU3rR1TKcgM+ORqXB5XOAjWG8s
 8l4eBq7QlKX20QndiKkxn8nrJakV0eex5m7qQRMA3So9VR24sykNjqX+k A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="360499470"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="360499470"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 03:18:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="664869992"
Received: from tkinch-mobl.ger.corp.intel.com (HELO [10.213.214.182])
 ([10.213.214.182])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 03:18:18 -0700
Message-ID: <53ebd108-c9db-0673-f2c8-5a237dbf354a@linux.intel.com>
Date: Thu, 26 May 2022 11:18:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/i915/dg2: Catch and log more unexpected values in
 DG1_MSTR_TILE_INTR
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20220524094339.1692212-1-tvrtko.ursulin@linux.intel.com>
 <Yo0bBxHBH8cZcnN4@mdroper-desk1.amr.corp.intel.com>
 <f37468b3-1066-ee4b-fb5b-7664fd180fd6@linux.intel.com>
 <Yo5v7/pLw4eF8xxw@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Yo5v7/pLw4eF8xxw@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/05/2022 19:05, Matt Roper wrote:
> On Wed, May 25, 2022 at 05:03:13PM +0100, Tvrtko Ursulin wrote:
>>
>> On 24/05/2022 18:51, Matt Roper wrote:
>>> On Tue, May 24, 2022 at 10:43:39AM +0100, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Catch and log any garbage in the register, including no tiles marked, or
>>>> multiple tiles marked.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> ---
>>>> We caught garbage in DG1_MSTR_TILE_INTR with DG2 (actual value 0xF9D2C008)
>>>> during glmark and more badness. So I thought lets log all possible failure
>>>> modes from here and also use per device logging.
>>>> ---
>>>>    drivers/gpu/drm/i915/i915_irq.c | 33 ++++++++++++++++++++++-----------
>>>>    drivers/gpu/drm/i915/i915_reg.h |  1 +
>>>>    2 files changed, 23 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
>>>> index 73cebc6aa650..79853d3fc1ed 100644
>>>> --- a/drivers/gpu/drm/i915/i915_irq.c
>>>> +++ b/drivers/gpu/drm/i915/i915_irq.c
>>>> @@ -2778,24 +2778,30 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>>>>    	u32 gu_misc_iir;
>>>>    	if (!intel_irqs_enabled(i915))
>>>> -		return IRQ_NONE;
>>>> +		goto none;
>>>>    	master_tile_ctl = dg1_master_intr_disable(regs);
>>>> -	if (!master_tile_ctl) {
>>>> -		dg1_master_intr_enable(regs);
>>>> -		return IRQ_NONE;
>>>> +	if (!master_tile_ctl)
>>>> +		goto enable_none;
>>>> +
>>>> +	if (master_tile_ctl & ~(DG1_MSTR_IRQ | DG1_MSTR_TILE_MASK)) {
>>>> +		drm_warn(&i915->drm, "Garbage in master_tile_ctl: 0x%08x!\n",
>>>> +			 master_tile_ctl);
>>>
>>> I know we have a bunch of them already, but shouldn't we be avoiding
>>> printk-based stuff like this inside interrupt handlers?  Should we be
>>> migrating all these error messages over to trace_printk or something
>>> similar that's safer to use?
>>
>> Not sure - I kind of think some really unexpected and worrying situations
>> should be loud and on by default. Risk is then spam if not ratelimited.
>> Maybe we should instead ratelimit most errors/warnings coming for irq
>> handlers?
> 
> It's not the risk of spam that's the problem, but rather that
> printk-based stuff eventually calls into the console code to flush its
> buffers.  That's way more overhead than you want in an interrupt handler
> so it's bad on its own, but if you're using something slow like a serial
> console, it becomes even more of a problem.

Is it a problem for messages which we never expect to see?

> While the unexpected bits in the master tile register are strange and
> may point to a bigger problem somewhere else, they're also harmless on
> their own since we should just ignore those bits and only process the
> valid tiles.

Yes, I was expecting that a patch belonging to multi-tile enablement 
would be incoming soon, which would be changing:

+	if (REG_FIELD_GET(DG1_MSTR_TILE_MASK, master_tile_ctl) !=
+	    DG1_MSTR_TILE(0)) {
+		drm_warn(&i915->drm, "Unexpected irq from tile %u!\n",
+			 ilog2(REG_FIELD_GET(DG1_MSTR_TILE_MASK,
+					     master_tile_ctl)));
+		goto enable_none;
  	}

 From this patch, into something completely different like walking bit 
by bit, handling the present tiles, and warning on unexpected ones. What 
should remain though is warning on no tiles signaled (which what we saw, 
together with garbage in reserved bits).

>> In this particular case at least DRM_ERROR with no device info is the odd
>> one out in the entire file so I'd suggest changing at least that, if the
>> rest of my changes is of questionable benefit.
> 
> Changing DRM_ERROR -> drm_err would probably be fine in the short term
> since it doesn't really make us any worse off.  Changing to drm_warn
> might not be great since we're generating a lot more lines of output and

Sorry I don't follow - why does replacing drm_err with drm_warn generate 
(a lot) more lines of output?

But it can be drm_err for all I care, I don't think we really have 
consistent story between errors and warnings in this area.

> probably multiplying the already bad overhead that shouldn't be
> happening in an interrupt handler.  But if we could update the interrupt
> handler to just save away the details and do the actual drm_warn later,
> outside the interrupt handler code, that would be okay.  We should
> probably work toward something like that for all of our interrupt
> handler warning/error messages.

Not sure I agree - for messages which we don't expect to see it doesn't 
really matter that there will be overhead when they are hit. Presumably 
bad things are already happening there so spending effort to optimise 
those path is questionable.

Regards,

Tvrtko
