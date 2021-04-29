Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC6836EA3D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A7A6E442;
	Thu, 29 Apr 2021 12:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADACD6E442
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:22:36 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l2so14409514wrm.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 05:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6hSgX7ZmS1acr+kheiYbkWuSg2tkQLwz/5B77fLrqYQ=;
 b=eyPPyqIsZlfTUQRMOecBBI1QjAvhgfaNnxey+818POF8igShwhwxRStTZHqZSO2VXf
 JeG9YOV5GnlSb3ocQP+M1A6wMDi3htgBsnFshVXcsTfZx4wAey0V8/lNB275k1+kgVdO
 ccBHA27f1GGXkL98HpMO3wFBMjkGu0M8u2NAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6hSgX7ZmS1acr+kheiYbkWuSg2tkQLwz/5B77fLrqYQ=;
 b=aBmSVzDdBSZFiubHRAS5/ZWHBryXtNY7b97yNNmtIJYelpxV549unYhTFWb7jcEl2/
 cewKttF29Z6mkNoiNiONX0NOUHOL4NudlIyO5iy6TlPl9rOo+6XqX6bAQSwyTv8+Tc5a
 WnunsIklnS2gc5857eh6o07SuBzuEMqUhhvcJhvNkKw+NKci/DeX+mB1Rph2PQCopoS+
 IwBbIIXBhLldVbc53nRAKIb6jc8xm244DK0Y5AsH5u7dpUZRsWEFWiBC+8yLacCJUvlW
 1ljUliKCWb9Revj3bbEWDxVI5UsXpiGWeNspUXdi3CyhaOBHVB4iKhNEEqn7//Q0VG9j
 VyzA==
X-Gm-Message-State: AOAM532W4ZmBXYOrSNnd0jr+H7cS4uffQ7vSaKdcANwXHoqA+GWdpFcF
 fjpI/E0Ud4IuhiUCIUosJoVuhQ==
X-Google-Smtp-Source: ABdhPJzhSB8LSrA6v160Kk1j9N/U8GhXDmpoTRS8P2y4uuaMjLexux29x2o+F264DMcA9CRgQ+ce1w==
X-Received: by 2002:a5d:5351:: with SMTP id t17mr35832612wrv.83.1619698955340; 
 Thu, 29 Apr 2021 05:22:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e17sm4603539wrr.34.2021.04.29.05.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:22:33 -0700 (PDT)
Date: Thu, 29 Apr 2021 14:22:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 11/21] drm/i915: Stop manually RCU banging in
 reset_stats_ioctl
Message-ID: <YIqlB3tB/0t0C/eK@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-12-jason@jlekstrand.net>
 <YIk4mcKOjRUKuHVB@phenom.ffwll.local>
 <CAOFGe95NaBj+ag2Ez+zS-Tc3ociVpNcm99hvg+eYbQ2=N7pNQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOFGe95NaBj+ag2Ez+zS-Tc3ociVpNcm99hvg+eYbQ2=N7pNQA@mail.gmail.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 01:22:14PM -0500, Jason Ekstrand wrote:
> On Wed, Apr 28, 2021 at 5:27 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Apr 23, 2021 at 05:31:21PM -0500, Jason Ekstrand wrote:
> > > As far as I can tell, the only real reason for this is to avoid taking a
> > > reference to the i915_gem_context.  The cost of those two atomics
> > > probably pales in comparison to the cost of the ioctl itself so we're
> > > really not buying ourselves anything here.  We're about to make context
> > > lookup a tiny bit more complicated, so let's get rid of the one hand-
> > > rolled case.
> >
> > I think the historical reason here is that i965_brw checks this before
> > every execbuf call, at least for arb_robustness contexts with the right
> > flag. But we've fixed that hotpath problem by adding non-recoverable
> > contexts. The kernel will tell you now automatically, for proper userspace
> > at least (I checked iris and anv, assuming I got it correct), and
> > reset_stats ioctl isn't a hot path worth micro-optimizing anymore.
> 
> I'm not sure I agree with that bit.  I don't think it was ever worth
> micro-optimizing like this.  What does it gain us?  Two fewer atomics?
>  It's not like the bad old days when it took a lock.
> 
> ANV still calls reset_stats before every set of execbuf (sometimes
> more than one) but I've never once seen it show up on a perf trace.
> execbuf, on the other hand, that does show up and pretty heavy
> sometimes.

Huh I thought I checked, but I guess got lost.

> > With that bit of more context added to the commit message:
> 
> I'd like to agree on what to add before adding something

Yeah in this case maybe just mention that with non-recoverable ctx there's
no need for userspace to check before every execbuf, so if this ever shows
up there's a proper fix which avoids the ioctl entirely. Like iris does.

Or something like that. I just want to make it clear that if this ever
does show up (once we've made execbuf faster with vm_bind and all that)
then the correct fix isn't to make this ioctl faster. But to just not
call it :-)

Cheers, Daniel

> 
> --Jason
> 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > >
> > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_context.c | 13 ++++---------
> > >  drivers/gpu/drm/i915/i915_drv.h             |  8 +-------
> > >  2 files changed, 5 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > index ecb3bf5369857..941fbf78267b4 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > @@ -2090,16 +2090,13 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
> > >       struct drm_i915_private *i915 = to_i915(dev);
> > >       struct drm_i915_reset_stats *args = data;
> > >       struct i915_gem_context *ctx;
> > > -     int ret;
> > >
> > >       if (args->flags || args->pad)
> > >               return -EINVAL;
> > >
> > > -     ret = -ENOENT;
> > > -     rcu_read_lock();
> > > -     ctx = __i915_gem_context_lookup_rcu(file->driver_priv, args->ctx_id);
> > > +     ctx = i915_gem_context_lookup(file->driver_priv, args->ctx_id);
> > >       if (!ctx)
> > > -             goto out;
> > > +             return -ENOENT;
> > >
> > >       /*
> > >        * We opt for unserialised reads here. This may result in tearing
> > > @@ -2116,10 +2113,8 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
> > >       args->batch_active = atomic_read(&ctx->guilty_count);
> > >       args->batch_pending = atomic_read(&ctx->active_count);
> > >
> > > -     ret = 0;
> > > -out:
> > > -     rcu_read_unlock();
> > > -     return ret;
> > > +     i915_gem_context_put(ctx);
> > > +     return 0;
> > >  }
> > >
> > >  /* GEM context-engines iterator: for_each_gem_engine() */
> > > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > > index 0b44333eb7033..8571c5c1509a7 100644
> > > --- a/drivers/gpu/drm/i915/i915_drv.h
> > > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > > @@ -1840,19 +1840,13 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
> > >
> > >  struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags);
> > >
> > > -static inline struct i915_gem_context *
> > > -__i915_gem_context_lookup_rcu(struct drm_i915_file_private *file_priv, u32 id)
> > > -{
> > > -     return xa_load(&file_priv->context_xa, id);
> > > -}
> > > -
> > >  static inline struct i915_gem_context *
> > >  i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
> > >  {
> > >       struct i915_gem_context *ctx;
> > >
> > >       rcu_read_lock();
> > > -     ctx = __i915_gem_context_lookup_rcu(file_priv, id);
> > > +     ctx = xa_load(&file_priv->context_xa, id);
> > >       if (ctx && !kref_get_unless_zero(&ctx->ref))
> > >               ctx = NULL;
> > >       rcu_read_unlock();
> > > --
> > > 2.31.1
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
