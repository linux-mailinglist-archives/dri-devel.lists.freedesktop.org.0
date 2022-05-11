Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E79523729
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 17:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A96410FB45;
	Wed, 11 May 2022 15:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7803310FB49
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 15:23:53 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m20so4733891ejj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AT84es+mzAkWpeG89QxlhH2c/t9GOUkVvEs9eFmXxXY=;
 b=NNBZtQLUELY+A16ufEkDAgLbHtNaTOaEVr7ROnlXcr07b5QSGVqeBmUSezNQv701YR
 YRrDJBNgYXuYhA0WwcTDUq8Ycg+eBvKe/J9DebgM5DwDrxs57sELS9Fhix5AI/Sh1bFI
 VHR8Xo2QL+u49qpgvIIFVNhk7BeE3DRJbpHLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AT84es+mzAkWpeG89QxlhH2c/t9GOUkVvEs9eFmXxXY=;
 b=Bq5LpRgyBZxP5WJ/Z5bwkP2iLIPGYtdoYapquW9rQPnmxBa1PdMxQea6tunQCwIpOp
 g2iRYfQydr412VPFA/JQ4xyFFXhHofBAWshWQ5Psa7LdQbKZZAFJX1yEfE/x3NMwjxLL
 SERc3Q/1gXMcZRQ5ZHnx6uFl/X41Pxf9etrA458IHuzVNehnKG4A1Enrv6mu2SiDEV8o
 mf5/8NtYfIRvKhoeCR+dzPPwzjBOkEiOhZEpIR9cRe3aPap+N1RqZtaU2BjwL9V9PE89
 EqfsW2GSSaAMJR7+Pny5s3SYP63UW6j9v8IijDVHVcvaQCIOigf1Hv8vIkYgj85OVE5i
 mc8A==
X-Gm-Message-State: AOAM530v9rB9kSudrPArz+pr4182x8evUg2MJ9YAXCWWS6wv0y9VaJOA
 jXQizGQHvgEErSa6tINQb8bQFg==
X-Google-Smtp-Source: ABdhPJwG6/+9X7iQEfq44Dv13d6abORwMoRw/J8Pv91GEXFMsUZVS/46SGzBeaEu+ite8DiIh6bbIg==
X-Received: by 2002:a17:907:7fac:b0:6f4:6b70:33d9 with SMTP id
 qk44-20020a1709077fac00b006f46b7033d9mr24228407ejc.380.1652282631911; 
 Wed, 11 May 2022 08:23:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 fv36-20020a17090750a400b006f3ef214e60sm1060465ejc.198.2022.05.11.08.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 08:23:51 -0700 (PDT)
Date: Wed, 11 May 2022 17:23:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/8] drm: execution context for GEM buffers v2
Message-ID: <YnvVBdGo+1SO4zrV@phenom.ffwll.local>
References: <20220504074739.2231-1-christian.koenig@amd.com>
 <20220504074739.2231-2-christian.koenig@amd.com>
 <Ynkl1VSLYDeGF4Ik@phenom.ffwll.local>
 <639687d0-ee0c-975a-93c0-b54422c74719@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <639687d0-ee0c-975a-93c0-b54422c74719@amd.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 09, 2022 at 05:01:33PM +0200, Christian König wrote:
> Am 09.05.22 um 16:31 schrieb Daniel Vetter:
> > On Wed, May 04, 2022 at 09:47:32AM +0200, Christian König wrote:
> > > [SNIP]
> > > +/* Make sure we have enough room and add an object the container */
> > > +static int drm_exec_objects_add(struct drm_exec_objects *container,
> > > +				struct drm_gem_object *obj)
> > > +{
> > > +	if (unlikely(container->num_objects == container->max_objects)) {
> > > +		size_t size = container->max_objects * sizeof(void *);
> > > +		void *tmp;
> > > +
> > > +		tmp = kvrealloc(container->objects, size, size + PAGE_SIZE,
> > > +				GFP_KERNEL);
> > > +		if (!tmp)
> > > +			return -ENOMEM;
> > > +
> > > +		container->objects = tmp;
> > > +		container->max_objects += PAGE_SIZE / sizeof(void *);
> > Might be worth it to inquire the actual allocation size here, since if
> > it's kmalloc the generic buckets only cover doubling of sizes, so once
> > it's big it goes up a lot quicker than PAGE_SIZE.
> > 
> > But also krealloc checks this internally already so maybe better to not
> > break the abstraction.
> 
> How can I actually do this? ksize() only works with kmalloc().
> 
> Or do we had a function to figure out if vmalloc or kmalloc was used by
> kvrealloc()?

kvfree has a is_vmalloc_addr so it would boil down to open-code that a
bit.

Probably not worth the trouble really, otoh looking at kvrealloc it
doesn't use krealloc underneath, so it's not doing that check. Maybe we
should just push that check into kvrealloc for the !vmalloc_addr case.

> > > [SNIP]
> > > +/**
> > > + * drm_exec_cleanup - cleanup when contention is detected
> > > + * @exec: the drm_exec object to cleanup
> > > + *
> > > + * Cleanup the current state and return true if we should stay inside the retry
> > > + * loop, false if there wasn't any contention detected and we can keep the
> > > + * objects locked.
> > > + */
> > > +bool drm_exec_cleanup(struct drm_exec *exec)
> > > +{
> > > +	if (likely(!exec->contended)) {
> > > +		ww_acquire_done(&exec->ticket);
> > > +		return false;
> > > +	}
> > > +
> > > +	if (likely(exec->contended == DRM_EXEC_DUMMY)) {
> > > +		exec->contended = NULL;
> > > +		ww_acquire_init(&exec->ticket, &reservation_ww_class);
> > Not sure why this is here instead of in _init()? I thought you're playing
> > some really dangerous tricks with re-initting the acquire ctx, which would
> > at least be questionable, but does not look like that.
> 
> That was my initial design, but the problem with this approach is that all
> locks taken between drm_exec_init() and the loop suddenly have a lockdep
> dependency on reservation_ww_class. And that in turn goes boom immediately.
> 
> Took me a moment to realize what's wrong with that as well.

Uh crap, indeed. I think minimally this needs to be document, but
personally I'm leaning towards drm_exec_prepare_init(), which does this
explicitly.

I do agree we need this split, especially so we can eventually add helpers
for bo lookup, or maybe userptr/hmm prep and things like that, which all
has to be outside of the acquire_ctx.

> > [SNIP]
> > +/**
> > + * drm_exec_has_duplicates - check for duplicated GEM object
> > + * @exec: drm_exec object
> > + *
> > + * Return true if the drm_exec object has encountered some already locked GEM
> > + * objects while trying to lock them. This can happen if multiple GEM objects
> > + * share the same underlying resv object.
> > + */
> > +static inline bool drm_exec_has_duplicates(struct drm_exec *exec)
> > +{
> > +	return exec->duplicates.num_objects > 0;
> > Definitely an aside, but in our i915 efforts to get rid of temporary pins
> > we run into some fun where the eviction code couldn't differentiate from
> > memory we need reserved for the CS and memory we just keep locked because
> > we evicted it and fun stuff like that. So maybe we need a bit more
> > tracking here eventually, but that's only when we have this somehow glued
> > into ttm eviction code.
> 
> Hehe, yeah that's what I was thinking about as well. But then I though one
> step at a time.
> 
> > Also the even more massive step would be to glue this into dma-buf so you
> > can do dynamic dma-buf eviction and still keep track of all the buffers. I
> > think with some clever pointer tagging and a bit more indirection we could
> > nest drm_exec structures (so that a driver could insert it's entire
> > drm_exec structure with a drm_exec-level callback for handling refcounting
> > and stuff like that).
> 
> I considered in which component to put this quite a bit as well, but then
> intentionally decided against DMA-buf.
> 
> One major reason was that not all buffers which needs to be locked this way
> are actually exported as DMA-buf.
> 
> Another reason is that DMA-buf doesn't necessary need a concept of an
> execution context. As far as I can see that's something GPU/DRM driver
> specific.

Yeah I think putting this into driver subsystem is right. I just wanted to
point that even with that driver subsystem design we can still pretty
easily put this into dma-buf eventually. And still have the benefit that
each driver would have a structure which operates on the native buffer
object.

> > So anyway I think this all looks good, just one more thing before I think
> > we should land this:
> > 
> > gem helpers in drm_gem_lock_reservations() has something which is
> > practically compatible already, except that you bulk-add the entire set of
> > objects. I think if you add a bulk-prepare function then we could also
> > replace all those. Maybe even nicer if the bulk-prepare takes the array of
> > handles and does the handle lookup too, but at least something which can
> > subsititue drm_gem_lock_reservations with drm_exec would be nice to
> > validate the helpers a bit more and really make sure we only have one of
> > them left.
> 
> I was considering that as well, but then also thought one step at a time.
> Not sure if it's possible to look up handles without running into some
> locking fun, thought.

Since you pointed out the acquire_ctx fun I think that's really the only
issue. It's the combo of e.g. v3d_lookup_bos() and
v3d_lock_bo_reservations().
-Daniel


> Thanks for the review,
> Christian.
> 
> > 
> > Thoughts?
> > -Daniel
> > 
> > > +}
> > > +
> > > +void drm_exec_init(struct drm_exec *exec, bool interruptible);
> > > +void drm_exec_fini(struct drm_exec *exec);
> > > +bool drm_exec_cleanup(struct drm_exec *exec);
> > > +int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
> > > +			 unsigned int num_fences);
> > > +
> > > +#endif
> > > -- 
> > > 2.25.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
