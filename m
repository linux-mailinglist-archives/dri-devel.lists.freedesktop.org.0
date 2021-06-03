Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5071E39A597
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 18:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4246E296;
	Thu,  3 Jun 2021 16:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDB56E296;
 Thu,  3 Jun 2021 16:17:15 +0000 (UTC)
IronPort-SDR: VwKZYYB8FmDerffIEC76rr1cfGbF4a8cyrvq5T0EQYj1bIXVrt9Ia2X0yfh/4yujKXTFaZQdyu
 LEveCbD7nY+g==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="204066610"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="204066610"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:17:14 -0700
IronPort-SDR: Uk/Xa5+sRXrXb8WIyGlVyPXKO8o+Fn0Vp7mUFfwKCOAPAOvySsaBGj9EIvt5F8pd8PoDj15MSF
 qstnHqQpXjDw==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="480280893"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:17:13 -0700
Date: Thu, 3 Jun 2021 09:10:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [Intel-gfx] [PATCH 15/20] drm/i915/guc: Ensure H2G buffer
 updates visible before tail update
Message-ID: <20210603161014.GA620@sdutt-i7>
References: <20210603051630.2635-1-matthew.brost@intel.com>
 <20210603051630.2635-16-matthew.brost@intel.com>
 <454067aa-cb2b-541d-21a7-84706a2d93a6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <454067aa-cb2b-541d-21a7-84706a2d93a6@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 11:44:57AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 03.06.2021 07:16, Matthew Brost wrote:
> > Ensure H2G buffer updates are visible before descriptor tail updates by
> > inserting a barrier between the H2G buffer update and the tail. The
> > barrier is simple wmb() for SMEM and is register write for LMEM. This is
> > needed if more than 1 H2G can be inflight at once.
> > 
> > If this barrier is not inserted it is possible the descriptor tail
> > update is scene by the GuC before H2G buffer update which results in the
> > GuC reading a corrupt H2G value. This can bring down the H2G channel
> > among other bad things.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 28 +++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > index 80976fe40fbf..31f83956bfc3 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > @@ -328,6 +328,28 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
> >  	return ++ct->requests.last_fence;
> >  }
> >  
> > +static void write_barrier(struct intel_guc_ct *ct)
> > +{
> > +	struct intel_guc *guc = ct_to_guc(ct);
> > +	struct intel_gt *gt = guc_to_gt(guc);
> > +
> > +	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
> > +		GEM_BUG_ON(guc->send_regs.fw_domains);
> > +		/*
> > +		 * This register is used by the i915 and GuC for MMIO based
> > +		 * communication. Once we are in this code CTBs are the only
> > +		 * method the i915 uses to communicate with the GuC so it is
> > +		 * safe to write to this register (a value of 0 is NOP for MMIO
> > +		 * communication). If we ever start mixing CTBs and MMIOs a new
> > +		 * register will have to be chosen.
> > +		 */
> > +		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
> 
> can't we at least start with SOFT_SCRATCH register that is not used for
> GuC MMIO based communication on Gen12 LMEM platforms? see [1]
> 

We likely can use this but I really don't feel comfortable switching the
register without some more testing first (e.g. let's change in this in
internal, let it soak for bit, then make the change upstream).

> I really don't feel comfortable that we are touching a register that
> elsewhere is protected with the mutex. And mixing CTBs and MMIO is not
> far away.
>

The only code that mixes CTBs and MMIOs is SRIOV which is a ways away
from landing.

Matt
 
> Michal
> 
> [1]
> https://lore.kernel.org/intel-gfx/51b9bd05-7d6f-29f1-de0f-3a14bade6c9c@intel.com/
> 
> > +	} else {
> > +		/* wmb() sufficient for a barrier if in smem */
> > +		wmb();
> > +	}
> > +}
> > +
> >  /**
> >   * DOC: CTB Host to GuC request
> >   *
> > @@ -411,6 +433,12 @@ static int ct_write(struct intel_guc_ct *ct,
> >  	}
> >  	GEM_BUG_ON(tail > size);
> >  
> > +	/*
> > +	 * make sure H2G buffer update and LRC tail update (if this triggering a
> > +	 * submission) are visible before updating the descriptor tail
> > +	 */
> > +	write_barrier(ct);
> > +
> >  	/* now update desc tail (back in bytes) */
> >  	desc->tail = tail * 4;
> >  	return 0;
> > 
