Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A378582B2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 17:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB25010EC2F;
	Fri, 16 Feb 2024 16:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fwfYTuwe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3191010E677
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 16:37:28 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d12bdd9a64so7963051fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 08:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1708101446; x=1708706246; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2BJidT3hS5vkgQ0xTVUzjojqrGFxsDATBuEs0RRAQ6o=;
 b=fwfYTuwevGkkvJTj/b3/b5xmMoPeqnYJspWmhOroZNeN8fQFpja0NavaOqwS3yc8Km
 MZ150fYaTVnVZ27Vb47u2gYXDcjlYtgJDHubxb/JZgWLPswCWkThwQvVWV+bWTEMEH0I
 HevTbrYFMtXe4jrNinjCGYugH2l4NZ0MykXx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708101446; x=1708706246;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2BJidT3hS5vkgQ0xTVUzjojqrGFxsDATBuEs0RRAQ6o=;
 b=rLVZkhmFTIBZutm0idVvFUUkg5Umwg/h/rvLcjGGjoXwfY36eM3b+HYVDX2Y70Ob8X
 hTbvk/Us6TrPjlvB/bc1zFqjELhZgJbcq2vNjxGWuR0akuj7dHwaJ+tfJgcijQ8kayX5
 kg++aukT6/6Q8Xvnx1FgHeF2F+8dCWO8KtHeafu+tUlmckmdAOGJycu4+NCASH3GqbUX
 FQWONPBXtHYuz0zgLj3adiPcR4vC0FelxW2Kk7R7bJqaYvdCuVKNWEbI2Xs/pChtuUCn
 QtW8Oq6a9/SK4Sf4xxY1EYWHzIdJV3ZZfs8lTQkKg0PNq9F31T6npE3jC8arlMC6Wadl
 StUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0nzGZx2s2TVRpCHVK5FvXW+peunIPByhnGnl0hwlG6Sz+Gg2OX/Dm+ZyJfEuDBbwSdAUe9dU5cznJZV8ZozbH8+n8w3iCJdoCH/I2lBGm
X-Gm-Message-State: AOJu0Yz+yJ4D2C1xdInDzU57Ffeaua9aBL1L4WwIRegJaFCP3WUpVZKP
 2GkcUfULtwzrHM8P58QOIxzWS2BTzaQ9WgEkgwpVuC0bqGhOgDnrSEmUu7Ccj0k=
X-Google-Smtp-Source: AGHT+IGS0GDo5tChpTazykXSgETAvi5nJVe9c/sifb50z1ANJBtBWxRUCH2PLe/YXqHGMMtGcrzHyw==
X-Received: by 2002:a2e:a9a6:0:b0:2d2:233f:1ae0 with SMTP id
 x38-20020a2ea9a6000000b002d2233f1ae0mr247313ljq.1.1708101446154; 
 Fri, 16 Feb 2024 08:37:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bg22-20020a05600c3c9600b0040fc56712e8sm2881166wmb.17.2024.02.16.08.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 08:37:25 -0800 (PST)
Date: Fri, 16 Feb 2024 17:37:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 6/6] drm: add drm_mode_atomic_commit event
Message-ID: <Zc-PQ9Yx4fk4TK43@phenom.ffwll.local>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-7-pierre-eric.pelloux-prayer@amd.com>
 <20240213112017.726016f0@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213112017.726016f0@gandalf.local.home>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Tue, Feb 13, 2024 at 11:20:17AM -0500, Steven Rostedt wrote:
> On Tue, 13 Feb 2024 16:50:31 +0100
> Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com> wrote:
> 
> > @@ -1503,6 +1504,24 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
> >  		drm_mode_object_put(obj);
> >  	}
> >  
> > +	if (trace_drm_mode_atomic_commit_enabled()) {
> > +		struct drm_crtc_state *crtc_state;
> > +		struct drm_crtc *crtc;
> > +		int *crtcs;
> > +		int i, num_crtcs;
> > +
> > +		crtcs = kcalloc(dev->mode_config.num_crtc, sizeof(int),
> > +				GFP_KERNEL);
> 
> If the above allocation fails, this will cause a NULL kernel dereference.

Yeah can't we somehow iterate directly into the trace subsystem? If
nothing else works I guess just a per-crtc event should do.

The more fundamental issue: I don't get how this works. For atomic we
have:
- explicitly handed in in-fences as dependencies with the IN_FENCE
  property
- dependencies that drivers fish out of the dma_resv object of the
  underlying gem buffer objects for each framebuffer. That has become
  pretty much entirely generic code since everyone uses the same, and so
  imo the dependency tracking should be fully generic too

- atomic has an out-fence too, so we could even do the full fence->fence
  dependency tracking. It's just not created as a userspace object if all
  userspace asks for is a drm vblank event, but it is very much there. And
  I think if you want fence tracking, we really should have fence tracking
  :-) Also the out-fence should be 100% generic (or it's a driver bug)
  because the driver functions hide the differences between generating a
  vblank event and signalling a dma_fence.

Cheers, Sima


> 
> -- Steve
> 
> > +
> > +		num_crtcs = 0;
> > +		for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> > +			crtcs[num_crtcs++] = drm_crtc_index(crtc);
> > +
> > +		trace_drm_mode_atomic_commit(file_priv, crtcs, num_crtcs, arg->flags);
> > +
> > +		kfree(crtcs);
> > +	}
> > +
> >  	ret = prepare_signaling(dev, state, arg, file_priv, &fence_state,
> >  				&num_fences);
> >  	if (ret)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
