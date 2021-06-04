Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B41439B508
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 10:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401B16E97C;
	Fri,  4 Jun 2021 08:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EF16E97B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 08:39:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a11so6568588wrt.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 01:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ezEsu27aEau2eaETHRTfQHmZBfdfdkSn7JD2IdJmAio=;
 b=G+qvhdM4gktCRfonXyfbjHgCFmAUi1BEv6xiMOsLkOVyUlq5QcvqS5Do95RgT7o8a1
 7SbFdaLrUrYAYHCJjG/lA0lv1SJulyvyG7iUiqQbw4qZMfdKLt2sylENJtptZeOtx05/
 WIVRnsIVDfv9GIUNxBR+4dfpJmHlev9Sz0exw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ezEsu27aEau2eaETHRTfQHmZBfdfdkSn7JD2IdJmAio=;
 b=WNdzpNpQxFcXlTShqxUcO50SIIB6DLqixjcSVHeuT64KSzqrwHpWcoUmqVDPXZtMhK
 kfRRscqAHFcyh+17FaZXxB8NpykrKEbUasuiKzKsOTo83LIjmeFGvoHnODVFmhjwmk5b
 CvyRUiSt0VOBt4Ze2tOr4h1h9DOXgYygEbhQHJhqxfV76M7K+wvS5LCNRRRUHjmzWQeM
 FuRiX12TlqRxriN1EhwDlxoc4+O7X/4hXhxAITkTjd1Zdd0NmSMS7UERXxevgAJOjwj9
 DuZHmFbopx/ymkDEOssjUrWN9HNmST9cR/3AYe46O8gU1AzcCESa88kgKCCcJD61EnS0
 7L2g==
X-Gm-Message-State: AOAM5331+cRKJno3v4WIE+K31igNKmepOk7ZB+Zvvj8ctgsATwAj3DbG
 JVaqAFbhqRtyHejCKQ1tpkqShf76x9KvOA==
X-Google-Smtp-Source: ABdhPJzQv2owLIkjkqedlGWF5li5K/eUjppNQrM+HCegAIctMJCErWI78n/PunWF3orYuDPbWYinoQ==
X-Received: by 2002:a5d:6da8:: with SMTP id u8mr2613859wrs.391.1622795990273; 
 Fri, 04 Jun 2021 01:39:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w13sm5233125wmi.4.2021.06.04.01.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 01:39:49 -0700 (PDT)
Date: Fri, 4 Jun 2021 10:39:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [PATCH 15/20] drm/i915/guc: Ensure H2G buffer
 updates visible before tail update
Message-ID: <YLnm00d5gAO7/WmZ@phenom.ffwll.local>
References: <20210603051630.2635-1-matthew.brost@intel.com>
 <20210603051630.2635-16-matthew.brost@intel.com>
 <454067aa-cb2b-541d-21a7-84706a2d93a6@intel.com>
 <20210603161014.GA620@sdutt-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603161014.GA620@sdutt-i7>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
 dri-devel@lists.freedesktop.org, Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 09:10:14AM -0700, Matthew Brost wrote:
> On Thu, Jun 03, 2021 at 11:44:57AM +0200, Michal Wajdeczko wrote:
> > 
> > 
> > On 03.06.2021 07:16, Matthew Brost wrote:
> > > Ensure H2G buffer updates are visible before descriptor tail updates by
> > > inserting a barrier between the H2G buffer update and the tail. The
> > > barrier is simple wmb() for SMEM and is register write for LMEM. This is
> > > needed if more than 1 H2G can be inflight at once.
> > > 
> > > If this barrier is not inserted it is possible the descriptor tail
> > > update is scene by the GuC before H2G buffer update which results in the
> > > GuC reading a corrupt H2G value. This can bring down the H2G channel
> > > among other bad things.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 28 +++++++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > index 80976fe40fbf..31f83956bfc3 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > @@ -328,6 +328,28 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
> > >  	return ++ct->requests.last_fence;
> > >  }
> > >  
> > > +static void write_barrier(struct intel_guc_ct *ct)
> > > +{
> > > +	struct intel_guc *guc = ct_to_guc(ct);
> > > +	struct intel_gt *gt = guc_to_gt(guc);
> > > +
> > > +	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
> > > +		GEM_BUG_ON(guc->send_regs.fw_domains);
> > > +		/*
> > > +		 * This register is used by the i915 and GuC for MMIO based
> > > +		 * communication. Once we are in this code CTBs are the only
> > > +		 * method the i915 uses to communicate with the GuC so it is
> > > +		 * safe to write to this register (a value of 0 is NOP for MMIO
> > > +		 * communication). If we ever start mixing CTBs and MMIOs a new
> > > +		 * register will have to be chosen.
> > > +		 */
> > > +		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
> > 
> > can't we at least start with SOFT_SCRATCH register that is not used for
> > GuC MMIO based communication on Gen12 LMEM platforms? see [1]
> > 
> 
> We likely can use this but I really don't feel comfortable switching the
> register without some more testing first (e.g. let's change in this in
> internal, let it soak for bit, then make the change upstream).
> 
> > I really don't feel comfortable that we are touching a register that
> > elsewhere is protected with the mutex. And mixing CTBs and MMIO is not
> > far away.
> >
> 
> The only code that mixes CTBs and MMIOs is SRIOV which is a ways away
> from landing.

Maybe add a FIXME note as part of the SRIOV patch stack in internal to
track this?
-Daniel

> 
> Matt
>  
> > Michal
> > 
> > [1]
> > https://lore.kernel.org/intel-gfx/51b9bd05-7d6f-29f1-de0f-3a14bade6c9c@intel.com/
> > 
> > > +	} else {
> > > +		/* wmb() sufficient for a barrier if in smem */
> > > +		wmb();
> > > +	}
> > > +}
> > > +
> > >  /**
> > >   * DOC: CTB Host to GuC request
> > >   *
> > > @@ -411,6 +433,12 @@ static int ct_write(struct intel_guc_ct *ct,
> > >  	}
> > >  	GEM_BUG_ON(tail > size);
> > >  
> > > +	/*
> > > +	 * make sure H2G buffer update and LRC tail update (if this triggering a
> > > +	 * submission) are visible before updating the descriptor tail
> > > +	 */
> > > +	write_barrier(ct);
> > > +
> > >  	/* now update desc tail (back in bytes) */
> > >  	desc->tail = tail * 4;
> > >  	return 0;
> > > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
