Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5506C3E56BA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 11:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B9589FD7;
	Tue, 10 Aug 2021 09:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0050089F89
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 09:23:42 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id u15so12539398wmj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 02:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gUfjlxf0wPQA0BuAzVqKDfY7baVVrAtjzk8QNmdFJvE=;
 b=N86UnAdELsN/OoNepPXLfnZpz5d+itv/7Zjym4xm4+3WMtfXrSHD7vZQ1PnFvTOI9w
 +hCBmBpNKKbLVV/DC9Q2315ZLi3+APklVQiR5iEixn5ifDLWBKU4HGKU6C7Xw4s0xiWV
 fbdtSbaYm/W5q4K+nH7BCvJbRrx1SaMmWTnUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gUfjlxf0wPQA0BuAzVqKDfY7baVVrAtjzk8QNmdFJvE=;
 b=uEyFOTRiiG+tTJLlC2LbqPAgceWAc3rlSH74szv950aJ9qLuE+9FVe/Q2F6nZqD2dZ
 6SGq5DdesKXWqcjKEKT8C87wkiVGknKi59WyMsdZlQJCIDPBBLBOvxENzKqr6mqAaRjO
 bHqvoQSD+LbjvT+BqiOTWiPjsSvp+3w/3vA+pQq0ebyIB8OakdBR30A515kSF1l/tLyS
 mTvL4zMLIHtAJdCC4jTRHD5vLML+gYzjkHrB/OF7MHxyv5JznjtWfs9NVnPUxUrg5kae
 8NGlbEFnXbUcAPBctuf0w+BgXvjnSglFZ94V7F3vjsw3oB86zAz71LI0QBwxFod5lM52
 w7DQ==
X-Gm-Message-State: AOAM530tFNPZ46aVN+XK14KqTLK7KwdWzECpw4lbea2XAabIvMVF2f85
 FPWqljnN1UVVf3jbW8qk170HAfyOQc18cg==
X-Google-Smtp-Source: ABdhPJyyRbyNkgPR4hoQufKwEA5a1uq9PnTZmZLF2ExO/jl2PceZQDrgYj63R2hXnERMDFrlZdvfxQ==
X-Received: by 2002:a1c:a50c:: with SMTP id o12mr2424582wme.4.1628587421321;
 Tue, 10 Aug 2021 02:23:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm1161262wrp.30.2021.08.10.02.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 02:23:40 -0700 (PDT)
Date: Tue, 10 Aug 2021 11:23:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 25/46] drm/i915/guc: Update debugfs for GuC multi-lrc
Message-ID: <YRJFmw4BTJi/UIWf@phenom.ffwll.local>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-26-matthew.brost@intel.com>
 <YRFZnGNvmHPr6DTL@phenom.ffwll.local>
 <20210809191311.GA123935@DUT151-ICLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809191311.GA123935@DUT151-ICLU.fm.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Mon, Aug 09, 2021 at 07:13:11PM +0000, Matthew Brost wrote:
> On Mon, Aug 09, 2021 at 06:36:44PM +0200, Daniel Vetter wrote:
> > On Tue, Aug 03, 2021 at 03:29:22PM -0700, Matthew Brost wrote:
> > > Display the workqueue status in debugfs for GuC contexts that are in
> > > parent-child relationship.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 56 +++++++++++++------
> > >  1 file changed, 39 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index 30df1c8db491..44a7582c9aed 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -4527,31 +4527,53 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
> > >  		gse_log_submission_info(guc->gse[i], p, i);
> > >  }
> > >  
> > > +static inline void guc_log_context(struct drm_printer *p,
> > > +				   struct intel_context *ce)
> > > +{
> > > +	drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
> > > +	drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> > > +	drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
> > > +		   ce->ring->head,
> > > +		   ce->lrc_reg_state[CTX_RING_HEAD]);
> > > +	drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
> > > +		   ce->ring->tail,
> > > +		   ce->lrc_reg_state[CTX_RING_TAIL]);
> > > +	drm_printf(p, "\t\tContext Pin Count: %u\n",
> > > +		   atomic_read(&ce->pin_count));
> > > +	drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
> > > +		   atomic_read(&ce->guc_id_ref));
> > > +	drm_printf(p, "\t\tNumber Requests Not Ready: %u\n",
> > > +		   atomic_read(&ce->guc_num_rq_not_ready));
> > > +	drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
> > > +		   ce->guc_state.sched_state,
> > > +		   atomic_read(&ce->guc_sched_state_no_lock));
> > 
> > It's all debugfs, but I think proper locking even there is good. It at
> > least reduces the confusion when the locking scheme is largely
> > undocumented. Also given how much we have rcu for everything would be good
> > to double-check all pointer dererences are properly protected.
> >
> 
> Not sure if I 100% follow this but I don't think any of the pointers
> dref here are RCU protected. Certainly none of the GuC ones are.
> 
> Will double before the next respin though.
> 
> > > +}
> > > +
> > >  void intel_guc_submission_print_context_info(struct intel_guc *guc,
> > >  					     struct drm_printer *p)
> > >  {
> > >  	struct intel_context *ce;
> > >  	unsigned long index;
> > >  	xa_for_each(&guc->context_lookup, index, ce) {
> > 
> > xa_for_each doesn't provide any guarantees, so doesn't protect against
> > concurrent removeal or anything like that. We need to do better than that.
> 
> https://elixir.bootlin.com/linux/latest/source/include/linux/xarray.h#L498
> 'It is safe to modify the array during the iteration.'

The xarray. Not the thing you're dereferencing, because the xarray only
stores pointers, not your data structure. So yeah correct statement is
that it doesn't provide you any guarantees beyond "the iterator wont be
confused if the xarray itself is modified during iteration". Which isn't
what you need here, you need a lot more.
-Daniel

> 
> Matt
> 
> > -Daniel
> > 
> > > -		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
> > > -		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> > > -		drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
> > > -			   ce->ring->head,
> > > -			   ce->lrc_reg_state[CTX_RING_HEAD]);
> > > -		drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
> > > -			   ce->ring->tail,
> > > -			   ce->lrc_reg_state[CTX_RING_TAIL]);
> > > -		drm_printf(p, "\t\tContext Pin Count: %u\n",
> > > -			   atomic_read(&ce->pin_count));
> > > -		drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
> > > -			   atomic_read(&ce->guc_id_ref));
> > > -		drm_printf(p, "\t\tNumber Requests Not Ready: %u\n",
> > > -			   atomic_read(&ce->guc_num_rq_not_ready));
> > > -		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
> > > -			   ce->guc_state.sched_state,
> > > -			   atomic_read(&ce->guc_sched_state_no_lock));
> > > +		GEM_BUG_ON(intel_context_is_child(ce));
> > >  
> > > +		guc_log_context(p, ce);
> > >  		guc_log_context_priority(p, ce);
> > > +
> > > +		if (intel_context_is_parent(ce)) {
> > > +			struct guc_process_desc *desc = __get_process_desc(ce);
> > > +			struct intel_context *child;
> > > +
> > > +			drm_printf(p, "\t\tWQI Head: %u\n",
> > > +				   READ_ONCE(desc->head));
> > > +			drm_printf(p, "\t\tWQI Tail: %u\n",
> > > +				   READ_ONCE(desc->tail));
> > > +			drm_printf(p, "\t\tWQI Status: %u\n\n",
> > > +				   READ_ONCE(desc->wq_status));
> > > +
> > > +			for_each_child(ce, child)
> > > +				guc_log_context(p, child);
> > > +		}
> > >  	}
> > >  }
> > >  
> > > -- 
> > > 2.28.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
