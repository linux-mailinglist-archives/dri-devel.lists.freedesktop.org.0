Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 620D3391EAC
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 20:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C7E6E51C;
	Wed, 26 May 2021 18:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797BC6E51C;
 Wed, 26 May 2021 18:05:52 +0000 (UTC)
IronPort-SDR: rkc23gQWa0H3rXN3iKRi3caI5HocMWanXYAAFp53UAzHTge8+rg73RDYOAV9IpyXM89z67LIKx
 1lbB4p8kNfeg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="182177957"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="182177957"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 11:05:27 -0700
IronPort-SDR: GRkPA4TUFL+VXuQ0Oqm/fIXpJyZEX1tF0a0/95h6mv2xdJBmc+sMXJhtJT3dkd7On0LP0eHplK
 3CUJfE1vay7w==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="444193679"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 11:05:24 -0700
Date: Wed, 26 May 2021 10:58:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 15/18] drm/i915/guc: Ensure H2G buffer updates visible
 before tail update
Message-ID: <20210526175818.GB31459@sdutt-i7>
References: <20210526064237.77853-1-matthew.brost@intel.com>
 <20210526064237.77853-16-matthew.brost@intel.com>
 <3d18d63d-8359-5ce0-0320-104436d57198@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d18d63d-8359-5ce0-0320-104436d57198@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 02:36:18PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 26.05.2021 08:42, Matthew Brost wrote:
> > Ensure H2G buffer updates are visible before descriptor tail updates by
> > inserting a barrier between the H2G buffer update and the tail. The
> > barrier is simple wmb() for SMEM and is register write for LMEM. This is
> > needed if more than 1 H2G can be inflight at once.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > index fb875d257536..42063e1c355d 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > @@ -328,6 +328,18 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
> >  	return ++ct->requests.last_fence;
> >  }
> >  
> > +static void write_barrier(struct intel_guc_ct *ct) {
> > +	struct intel_guc *guc = ct_to_guc(ct);
> > +	struct intel_gt *gt = guc_to_gt(guc);
> > +
> > +	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
> > +		GEM_BUG_ON(guc->send_regs.fw_domains);
> > +		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
> 
> hmm, as this is one of the GuC scratch registers used for H2G MMIO
> communication, writing 0 there might be interpreted by the GuC as new
> request with action=0 and might results in extra processing/logging on
> GuC side, and, since from here we don't protect access to this register
> by send_mutex, we can corrupt other MMIO message being prepared from
> different thread, ... can't we use other register ?
>

Hmm, this code has been internal for a long time and we haven't seen an
issues. MMIOs are always attempted to be processed each interrupt and
then CTBs are processed next. A value a 0 in scratch0 results in no MMIOs
being processed as a value of 0 is a reserved action which translates to
a NOP.

Also in the current i915 once CTBs are enabled MMIOs are never used.
That being said, I think once we transition to the new interface +
enable suspend on a VF MMIOs might be used. 

With that I purpose that we merge this as is with a comment saying if we
ever mix CTBs and MMIOs we need to find another MMIO register. I don't
changing this now is worth delaying upstreaming this and also any change
we make now will make us lose confidence in code that has been
thoroughly tested.

Matt
 
> > +	} else {
> > +		wmb();
> > +	}
> > +}
> > +
> >  /**
> >   * DOC: CTB Host to GuC request
> >   *
> > @@ -411,6 +423,12 @@ static int ct_write(struct intel_guc_ct *ct,
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
