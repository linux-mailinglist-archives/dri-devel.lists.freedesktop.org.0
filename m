Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C317F2D54E4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 08:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BAD6E516;
	Thu, 10 Dec 2020 07:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA91E6E2C7;
 Thu, 10 Dec 2020 07:53:09 +0000 (UTC)
IronPort-SDR: Bw9RXIFEgN1uJuRzFL26IMT5uKcQQ7VPPADG2mZ8k2zaMyaAUJkh7d0o/sQadDV7DYSvCLtd4a
 oUMt8LgyBS0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="174329036"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="174329036"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 23:53:08 -0800
IronPort-SDR: GXwzMAoXMJneblLoVcnh81qMWmYGzXQ8MFNg/P0ooRmNc68RzjhpPYLP3hwhqyP/hpQPjlwvCE
 DxcejKf/Qykg==
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="364507804"
Received: from ggiordax-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.87.181])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 23:53:03 -0800
MIME-Version: 1.0
In-Reply-To: <875z5e99ez.fsf@nanos.tec.linutronix.de>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-3-jsnitsel@redhat.com>
 <875z5e99ez.fsf@nanos.tec.linutronix.de>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Jerry Snitselaar <jsnitsel@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH v3 2/4] drm/i915/pmu: Use kstat_irqs to get
 interrupt count
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160758677957.5062.15497765500689083558@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 10 Dec 2020 09:53:00 +0200
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, Matthew Garrett <mjg59@google.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 David Airlie <airlied@linux.ie>, Jarkko Sakkinen <jarkko@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-integrity@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Tvrtko and Chris for comments

Code seems to be added in:

commit 0cd4684d6ea9a4ffec33fc19de4dd667bb90d0a5
Author: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Date:   Tue Nov 21 18:18:50 2017 +0000

    drm/i915/pmu: Add interrupt count metric

I think later in the thread there was a suggestion to replace this with
simple counter increment in IRQ handler.

Regards, Joonas

Quoting Thomas Gleixner (2020-12-06 18:38:44)
> On Fri, Dec 04 2020 at 18:43, Jerry Snitselaar wrote:
> 
> > Now that kstat_irqs is exported, get rid of count_interrupts in
> > i915_pmu.c
> > --- a/drivers/gpu/drm/i915/i915_pmu.c
> > +++ b/drivers/gpu/drm/i915/i915_pmu.c
> > @@ -423,22 +423,6 @@ static enum hrtimer_restart i915_sample(struct hrtimer *hrtimer)
> >       return HRTIMER_RESTART;
> >  }
> >  
> > -static u64 count_interrupts(struct drm_i915_private *i915)
> > -{
> > -     /* open-coded kstat_irqs() */
> > -     struct irq_desc *desc = irq_to_desc(i915->drm.pdev->irq);
> > -     u64 sum = 0;
> > -     int cpu;
> > -
> > -     if (!desc || !desc->kstat_irqs)
> > -             return 0;
> > -
> > -     for_each_possible_cpu(cpu)
> > -             sum += *per_cpu_ptr(desc->kstat_irqs, cpu);
> > -
> > -     return sum;
> > -}
> 
> May I ask why this has been merged in the first place?
> 
> Nothing in a driver has ever to fiddle with the internals of an irq
> descriptor. We have functions for properly accessing them. Just because
> C allows to fiddle with everything is not a justification. If the
> required function is not exported then adding the export with a proper
> explanation is not asked too much.
> 
> Also this lacks protection or at least a comment why this can be called
> safely and is not subject to a concurrent removal of the irq descriptor.
> The same problem exists when calling kstat_irqs(). It's even documented
> at the top of the function.
> 
> Thanks,
> 
>         tglx
> 
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
