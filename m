Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A5C55A3AC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5934E10F188;
	Fri, 24 Jun 2022 21:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3E710F188
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 21:36:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v14so4756925wra.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 14:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=EED3vnOPhW5HQ8YAgdkgScBE6T0z6mEdTDgk247qQfc=;
 b=WadTCqDP0V4rAF8HAlcy0X/PnIJOjzKPkDdHPTro+kqCRYT+gCC5GF4t8mDtCtDSNb
 rPLyZjDlm/6sblHBJJCI5s7usMmCS/DfApEMz6ZyowIME9LXRyjiFkcLPHcqhetR4GXD
 EQ3X3rT5LgVBpUB/RDmWe5YcEszpvrLR9MqFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=EED3vnOPhW5HQ8YAgdkgScBE6T0z6mEdTDgk247qQfc=;
 b=NuUD+NouyIRjdKZ2iwj5EVuwZuamUpUk0lQkxAVrN4W4qnQKUicAz2vguGrpLGlJ/W
 mhp9o9+TiQY7R18dlt9qAE95j1mY49/FHkaSJb3wLfYSPmZADUrK54B5z3IGKHWCaqhH
 Iel7yF+p+SLR3B3ZhPvx6cl5+CJGUVLQaq5g+EtluGsF41Dt6R67bYdc0U3sgQ/49tAr
 iaBNgkGwpjKHhzNH1kfYWhcVEsBCB08h6CWRFHlApKShpuaVFR4hbW+1fF0EPQJgDQbZ
 iHxfSaQzPNMU3FnhS7z8orsSIoQbEW0XCyxYRtmee6MauuDhqqRpTI4iX3MhgJfBNPo4
 4+KA==
X-Gm-Message-State: AJIora9DP6G/DzUKRDiWBBpBImwNUzDGjFj1CkirWtpLyzLBsJ3n7gVY
 iOz4HO/tum+1Y5ihJBQelHrFkQ==
X-Google-Smtp-Source: AGRyM1sgTPuLeRxT2gO007WHe4JDXARxYXU5GXXIcyUT33/w2vaThz5p9yps7/wsQpifqalASGj8Bw==
X-Received: by 2002:adf:db89:0:b0:21b:84a6:9cce with SMTP id
 u9-20020adfdb89000000b0021b84a69ccemr1023759wri.675.1656106592570; 
 Fri, 24 Jun 2022 14:36:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adff90f000000b0021b90cc66a1sm3395415wrr.2.2022.06.24.14.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:36:32 -0700 (PDT)
Date: Fri, 24 Jun 2022 23:36:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/gem: Drop obj lock in msm_gem_free_object()
Message-ID: <YrYuXvI8ZyHGWAwZ@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220613205032.2652374-1-robdclark@gmail.com>
 <CAE-0n51ADDijFnPwAQNwYE=62Rj4ZeQ38G7D=Xx3s5x7MRm18A@mail.gmail.com>
 <CAF6AEGtKiv+Y+BQSKvoydEN7W629_BRJR_sMEdFqsWCDRwsSQQ@mail.gmail.com>
 <YrYlgiQYSIoJFqwH@phenom.ffwll.local>
 <CAF6AEGvXUsyVUubhPJy0B=ZDoxofFgPkKh=7g2BEnRwt1N+qmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvXUsyVUubhPJy0B=ZDoxofFgPkKh=7g2BEnRwt1N+qmw@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 02:28:25PM -0700, Rob Clark wrote:
> On Fri, Jun 24, 2022 at 1:58 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jun 16, 2022 at 06:59:46AM -0700, Rob Clark wrote:
> > > On Thu, Jun 16, 2022 at 1:28 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Quoting Rob Clark (2022-06-13 13:50:32)
> > > > > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> > > > > index d608339c1643..432032ad4aed 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_gem.h
> > > > > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > > > > @@ -229,7 +229,19 @@ msm_gem_unlock(struct drm_gem_object *obj)
> > > > >  static inline bool
> > > > >  msm_gem_is_locked(struct drm_gem_object *obj)
> > > > >  {
> > > > > -       return dma_resv_is_locked(obj->resv);
> > > > > +       /*
> > > > > +        * Destroying the object is a special case.. msm_gem_free_object()
> > > > > +        * calls many things that WARN_ON if the obj lock is not held.  But
> > > > > +        * acquiring the obj lock in msm_gem_free_object() can cause a
> > > > > +        * locking order inversion between reservation_ww_class_mutex and
> > > > > +        * fs_reclaim.
> > > > > +        *
> > > > > +        * This deadlock is not actually possible, because no one should
> > > > > +        * be already holding the lock when msm_gem_free_object() is called.
> > > > > +        * Unfortunately lockdep is not aware of this detail.  So when the
> > > > > +        * refcount drops to zero, we pretend it is already locked.
> > > > > +        */
> > > > > +       return dma_resv_is_locked(obj->resv) || (kref_read(&obj->refcount) == 0);
> > > >
> > > > Instead of modifying this function can we push down the fact that this
> > > > function is being called from the free path and skip checking this
> > > > condition in that case? Or add some "_locked/free_path" wrappers that
> > > > skip the lock assertion? That would make it clearer to understand while
> > > > reading the code that it is locked when it is asserted to be locked, and
> > > > that we don't care when we're freeing because all references to the
> > > > object are gone.
> > >
> > > that was my earlier attempt, and I wasn't too happy with the result.
> > > And then I realized if refcount==0 then by definition we aren't racing
> > > with anyone else ;-)
> >
> > I think that's not entirely correct, at least not for fairly reasonable
> > shrinker designs:
> >
> > If the shrinker trylocks for throwing stuff out it might race with a
> > concurrent finalization. Depends a bit upon your design, but usually
> > that's possible.
> 
> Kinda but in fact no.  At least not if your shrinker is designed properly.
> 
> The shrinker does kref_get_unless_zero() and bails in the case that
> we've already started finalizing.  See:
> 
> https://patchwork.freedesktop.org/patch/490160/

Oh you have the order differently than what I'd have typed. If you do
dma_resv_trylock under the lru lock then the kref_get_unless_zero isn't
needed.

Ofc if you do it like you do then you need your locking check trickery.
 
> > There won't be a problem since you'll serialize on a lock eventually. But
> > if you drop all your locking debug checks like this then it's very hard to
> > figure this out :-)
> >
> > Ofc you can adjust your refcounting scheme to make this impossible, but
> > then there's also not really any need to call any functions which might
> > need some locking, since by that time all that stuff must have been
> > cleaned up already (or the refcount could not have dropped to zero). Like
> > if any iova mapping holds a reference you never have these problems.
> >
> > Long story short, this kind of design freaks me out big time. Especially
> > when it involves both a cross-driver refcount like the gem_bo one and a
> > cross driver lock ...
> >
> > The standard way to fix this is to trylock dma_resv on cleanup and push to
> > a worker if you can't get it. This is what ttm and i915 does. Might be
> > good to lift that into drm_gem.c helpers and just use it.
> 
> We used to do that (but unconditionally).. and got rid of it because
> it was causing jank issues (lots of queued up finalizers delaying
> retire work, or something along those lines, IIRC).  I guess back then
> struct_mutex was also involved, and it might not be as bad if we only
> took the async path if we didn't win the trylock.  But IMO that is
> totally unnecessary.  And I kinda am skeptical about pushing too much
> locking stuff to drm core.

Yeah with dev->struct_mutex and unconditionally it's going to be terrible.
It really should't be that bad.

Pulling back into the big picture, I really don't like drivers to spin
their own world for this stuff. And with the ttm drivers (and the i915-gem
one or so) doing one thing, I think msm should do the same. Unless there's
a reason why that's really stupid, and then we should probably switch ttm
over to that too?

If ever driver uses dma_resv differently in the cleanup paths (which are
really the tricky ones) then cross driver code reading becomes an exercise
in pitfall counting and leg regeneration :-(

Also I really don't care about which bikeshed we settle on, as least as
they're all the same.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
