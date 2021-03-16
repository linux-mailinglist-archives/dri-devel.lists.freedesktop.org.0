Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE333D14F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 11:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C55A6E2A3;
	Tue, 16 Mar 2021 10:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC086E2B6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 10:02:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a18so10093985wrc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mfLVA+73vEg/lj6ta6oGMzapBabiQYob/MJGjhTamW4=;
 b=RiUl5nGHCtL7MGPKkzbD25Sft9Ls5CY3oZwslmzPBNGgeVsuK7efX18EoNl1BPV5n8
 uZ0c300zx+hUVGJDtm2lwFiWetDKKb+RWtkIDWjm0Qi+ZkfP1Ny4jtS4Ahg2zethdi7V
 LqAm4afo9gjSFS56tu2bXhu/DoBQehAjEcfK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mfLVA+73vEg/lj6ta6oGMzapBabiQYob/MJGjhTamW4=;
 b=mZ1cVv9bk0sNUTePjUgfjj8OilTNK0A1NXeEb4jUYu1PiiNSdSFG5CWFvjQbxgy65m
 em1wjnSAQshk/qncq1jGy5PeAFUPedeOfejqNQ0bGgA3xWZ4Hb8tbwT3a8yvMUHBn14E
 no1Uslx5nr0nRZ7QyJpRPcUTI2Voxgu9Qe2bZFXJbwqY70Pf1Pj5AQd0gSM2gzdWu0Jb
 K5Vu7/Jih/5hVziU8mScyKnrc8cLJc+6JtP6dET2VHtkAROO5eZb/z0BImleOKJexaJ2
 sVfyXzzMnKeedWBlCZvMP0qE7rgZp+Ztn+uC+fOQQFjvelVIG87k8er9vbCPe87gi1IM
 h6Qw==
X-Gm-Message-State: AOAM532k5ZX5PVobdOPJiWtczb4PWwPD7B05BEOmIWb/kNDU8RtAowec
 nWoj2L62cr0GbMnh3ANALtI/Yw==
X-Google-Smtp-Source: ABdhPJz3q95ktkhk4HtUQiybE2v7lbURXerYSd7wr5sguGb/JG+6nlQOZyFQDXHK2szKRdTI5Q12GQ==
X-Received: by 2002:adf:aa08:: with SMTP id p8mr3867668wrd.232.1615888932623; 
 Tue, 16 Mar 2021 03:02:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm2689796wmf.7.2021.03.16.03.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 03:02:11 -0700 (PDT)
Date: Tue, 16 Mar 2021 11:02:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 1/6] drm/i915: Individual request cancellation
Message-ID: <YFCCISvHuBVyo2z8@phenom.ffwll.local>
References: <20210312154622.1767865-1-tvrtko.ursulin@linux.intel.com>
 <20210312154622.1767865-2-tvrtko.ursulin@linux.intel.com>
 <f361804a-2c51-77ee-dbb4-0caba6bfffd0@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f361804a-2c51-77ee-dbb4-0caba6bfffd0@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 15, 2021 at 05:37:27PM +0000, Tvrtko Ursulin wrote:
> 
> On 12/03/2021 15:46, Tvrtko Ursulin wrote:
> > From: Chris Wilson <chris@chris-wilson.co.uk>
> > 
> > Currently, we cancel outstanding requests within a context when the
> > context is closed. We may also want to cancel individual requests using
> > the same graceful preemption mechanism.
> > 
> > v2 (Tvrtko):
> >   * Cancel waiters carefully considering no timeline lock and RCU.
> >   * Fixed selftests.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> [snip]
> 
> > +void i915_request_cancel(struct i915_request *rq, int error)
> > +{
> > +	if (!i915_request_set_error_once(rq, error))
> > +		return;
> > +
> > +	set_bit(I915_FENCE_FLAG_SENTINEL, &rq->fence.flags);
> > +
> > +	if (i915_sw_fence_signaled(&rq->submit)) {
> > +		struct i915_dependency *p;
> > +
> > +restart:
> > +		rcu_read_lock();
> > +		for_each_waiter(p, rq) {
> > +			struct i915_request *w =
> > +				container_of(p->waiter, typeof(*w), sched);
> > +
> > +			if (__i915_request_is_complete(w) ||
> > +			    fatal_error(w->fence.error))
> > +				continue;
> > +
> > +			w = i915_request_get(w);
> > +			rcu_read_unlock();
> > +			/* Recursion bound by the number of engines */
> > +			i915_request_cancel(w, error);
> > +			i915_request_put(w);
> > +
> > +			/* Restart after having to drop rcu lock. */
> > +			goto restart;
> > +		}
> 
> So I need to fix this error propagation to waiters in order to avoid
> potential stack overflow caught in shards (gem_ctx_ringsize).
> 
> Or alternatively we decide not to propagate fence errors. Not sure that
> consequences either way are particularly better or worse. Things will break
> anyway since what userspace inspects for unexpected fence errors?!

fence error propagation is one of these "sounds like a good idea" things
that turned into a can of worms. See the recent revert Jason submitted, I
replied with a  more in-depth discussion.

So I'd say if we don't need this internally somehow for scheduler state,
remove it. Maybe even the entire scaffolding we have for the forwarding.

Maybe best if you sync with Jason here, we need to stuff Jason's patch
into -fixes since there's a pretty bad regression going on. I think Jason
also said there's a pile of igts to remove once we give up on fence error
propagation.

> So rendering corruption more or less. Can it cause a further stream of GPU
> hangs I am not sure. Only if there is a inter-engine data dependency
> involving data more complex than images/textures.

Yup. Also at least on modern-ish hw our userspace goes with
non-recoverable contexts anyway, because everything needs to be
reconstructed. vk is even more brutal, it just hands you back a
vk_device_lost and everything is gone (textures, data, all api objects,
really everything afaiui). Trying to continue is something only old
userspace is doing, because the fully emit the entire ctx state at the
start of each batch anyway.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
