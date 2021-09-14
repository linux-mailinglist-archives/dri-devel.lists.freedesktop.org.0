Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F34A40B8A4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 22:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA036E5CD;
	Tue, 14 Sep 2021 20:02:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682166E5C8
 for <DRI-Devel@lists.freedesktop.org>; Tue, 14 Sep 2021 20:02:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso3065543wmb.2
 for <DRI-Devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7gkhnE8xcHFQRgQ3yyBk6B1LuGC8MWLx9fbs+zjL4ic=;
 b=am4PjtkOZq2srvkJXiKv0eoTC3H73oHft4nyDpB/yw5+mIPZ/eSZProHFxTuaEskw2
 8FWUBd5hN2nV8z1+0kegJd5bANQdjlWMxZWzBhWNsNOCK0BEkcFBohL2R+k6Yk1UEqg0
 G79jSiH5ldlsCYKxqJtRggA+TM73AYcCgVZpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7gkhnE8xcHFQRgQ3yyBk6B1LuGC8MWLx9fbs+zjL4ic=;
 b=NDiJAKRXOBCd4qhi5S2YLCDbsuJdJjAUBqRGb4GeHXeXhTETCXLZ/2Wxa42l8yLuyv
 8arsCRHxVoBG4z0EMs8vD0QBrmV2n9r1RW7IUMQ4RO+y7HW4qRP5J9wQ1i83FXGwYyiq
 WjpfFfkGLS9IDr+9H4M5tiEvrctOfgw0jpwIDCs6ZcqoY+9EJ+cXjXZv30kowTfrHCNc
 7SsNqHmdD/FnhvpEJY8bOAaH8OiBn9JrbAih5Ov+ijE446PLDzR3gDRyBxxEPbRGAZJf
 U+Iwn1+SNOq/7bgx9HTzlNX/el6v1jf3Urfd58kKFWoEQNH+MnL1BcgjftIMJtJmMyWY
 8GJw==
X-Gm-Message-State: AOAM531jNUvcuKmUKbV8MSk7WpspMocgAnuUOoT2dVuQEOf5QWQl3Rwk
 YI8yiahqCZNL4L6IM1yjrg7siw==
X-Google-Smtp-Source: ABdhPJw6P+GZzwIXEClNIIob4nlt/TvKu0QO1t7E1Rtw1dO3dcec7L2mVTUP/s7wECQ14zWbSEgmVw==
X-Received: by 2002:a1c:22c3:: with SMTP id i186mr771700wmi.145.1631649741734; 
 Tue, 14 Sep 2021 13:02:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d24sm2046557wmb.35.2021.09.14.13.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 13:02:21 -0700 (PDT)
Date: Tue, 14 Sep 2021 22:02:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: John.C.Harrison@intel.com, Intel-GFX@lists.freedesktop.org,
 DRI-Devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Refcount context during error
 capture
Message-ID: <YUD/y4u59ea9bXIl@phenom.ffwll.local>
References: <20210913211016.2299138-1-John.C.Harrison@Intel.com>
 <20210913211742.GA6940@jons-linux-dev-box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913211742.GA6940@jons-linux-dev-box>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Mon, Sep 13, 2021 at 02:17:42PM -0700, Matthew Brost wrote:
> On Mon, Sep 13, 2021 at 02:10:16PM -0700, John.C.Harrison@Intel.com wrote:
> > From: John Harrison <John.C.Harrison@Intel.com>
> > 
> > When i915 receives a context reset notification from GuC, it triggers
> > an error capture before resetting any outstanding requsts of that
> > context. Unfortunately, the error capture is not a time bound
> > operation. In certain situations it can take a long time, particularly
> > when multiple large LMEM buffers must be read back and eoncoded. If
> > this delay is longer than other timeouts (heartbeat, test recovery,
> > etc.) then a full GT reset can be triggered in the middle.
> > 
> > That can result in the context being reset by GuC actually being
> > destroyed before the error capture completes and the GuC submission
> > code resumes. Thus, the GuC side can start dereferencing stale
> > pointers and Bad Things ensue.
> > 
> > So add a refcount get of the context during the entire reset
> > operation. That way, the context can't be destroyed part way through
> > no matter what other resets or user interactions occur.
> > 
> > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index c7a41802b448..7291fd8f68a6 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -2920,6 +2920,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> >  {
> >  	struct intel_context *ce;
> >  	int desc_idx;
> > +	unsigned long flags;
> >  
> >  	if (unlikely(len != 1)) {
> >  		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> > @@ -2927,11 +2928,24 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> >  	}
> >  
> >  	desc_idx = msg[0];
> > +
> > +	/*
> > +	 * The context lookup uses the xarray but lookups only require an RCU lock
> > +	 * not the full spinlock. So take the lock explicitly and keep it until the
> > +	 * context has been reference count locked to ensure it can't be destroyed
> > +	 * asynchronously until the reset is done.
> > +	 */
> > +	xa_lock_irqsave(&guc->context_lookup, flags);
> >  	ce = g2h_context_lookup(guc, desc_idx);
> > +	if (ce)
> > +		intel_context_get(ce);
> > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> > +
> >  	if (unlikely(!ce))
> >  		return -EPROTO;
> >  
> >  	guc_handle_context_reset(guc, ce);
> > +	intel_context_put(ce);
> 
> So this is going to directly conflict with a patch that I'm about to
> post as I'm going to change the error capture to async operation. In
> that case the intel_context_put would need to be done once that op
> completes. I'll likely pull this patch into that series. I'd expect it
> to be posted by the end of the day.

tbh this entire thing is looking very scary. Somehow we can race with
other processing while we try to handle a reset. That's fragile at best.

Proper fix is to exclude these kind of problems by design, by either
guaranteeing that no concurrent dequeuing of guc2host message can happen,
or by holding appropriate locks, or by keeping track of anything pending
in a more controlled way (something like expected g2h messages as separate
structs, instead of the current spaghetti layering violation chaos we have
for processing g2h message).

We maybe should use a few of these things when we're going through the
locking engineering training with guc team.
-Daniel

> 
> Matt 
> 
> >  
> >  	return 0;
> >  }
> > -- 
> > 2.25.1
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
