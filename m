Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7A496B7B4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 12:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC0B10E738;
	Wed,  4 Sep 2024 10:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="PDYY1BDk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE3B10E738
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 10:03:29 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42c7bc97423so43520415e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 03:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725444207; x=1726049007; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=i6v6CT2LsVEZvDfMcPLA40kWZb/zwRi0zTYuWZ425P0=;
 b=PDYY1BDk0gVB0Pb9zK/H1eKpjBS8jnAbNZBtuItIePHPocKvZb86YKoVll84tci4PH
 poTD90WgsHCPpMD36X0PUUjCWtpKKEvTCjQnSaL9m0EA1YWKWxmoSVSdGZJeVY6s/e3M
 X+B2cm7oWIHATPKOYsOoiXre3kxEAlYCo5grg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725444207; x=1726049007;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i6v6CT2LsVEZvDfMcPLA40kWZb/zwRi0zTYuWZ425P0=;
 b=IxRfyHb1GnPzgVaolWZpuFd0o89qHtKwxqZPk45S60frJR/slFClzwhxqBk/cmWfDC
 XX6EB8oW4gHeqQb5EHtAD/FJzQQSN5eHgkNQg6uOgxdgGfjlhmejYSgDWYjEn3woqEZ/
 HAc35VJcLQzemnxjU7AcPS6MLGdTpscLBtkpYb6bmn/Khqz5qa3u0qOvTpAgEsH2gxsk
 PKXzdrrqxmAY+gXa6KQylJVI61FKsm5P0asnVKb8Nz7ayAyHj/BnJZ+1B3oJ9+efrV08
 jyq+lH6akvQttTac4SOYPHEHXoT73x6KKvHEO9rrwYa0HEA0DXlW4DS8f0n3kpzrZVIM
 UTFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVARQlubyfudHyzXsjhiGE2hHj1FTCtQ+Ie7ogSvvAE0XLuBeXjA+5OM4DIyk/LRYEyiyssPtTsrJw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhJqpQcQcEv68PmKk9ho984H8tjvU5fRtzsG3GYDPFHhqA0uuL
 Rbx/vdEtahyHCpv/JYu/jcJlXhFbJh5bwNk8nLaLmrsntgFWLFFsohhefywCzF4=
X-Google-Smtp-Source: AGHT+IGq92/Zr4O14n090ZuTZlkspveupOveIafLzYdBRlT5HTVpD7o84+s5/gFwiiOPzxzwFwDZTw==
X-Received: by 2002:a5d:5e04:0:b0:374:b30b:9ae7 with SMTP id
 ffacd0b85a97d-374b30b9c08mr10986651f8f.49.1725444207263; 
 Wed, 04 Sep 2024 03:03:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c29aa150sm10787676f8f.101.2024.09.04.03.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 03:03:26 -0700 (PDT)
Date: Wed, 4 Sep 2024 12:03:24 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 kernel@collabora.com, Luben Tuikov <ltuikov89@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
Message-ID: <ZtgwbAqAkHdTCTJy@phenom.ffwll.local>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
 <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
 <ZtI9EMzHZW3DkHw/@DUT025-TGLU.fm.intel.com>
 <710b6946-ce8e-42ed-8df6-aa76bf0d5f3f@amd.com>
 <ZtW8aiIhBA5KBLR6@phenom.ffwll.local>
 <b6185b8e-148a-494e-a336-e4290c38b700@amd.com>
 <ZtbFJRZKA4UghVai@phenom.ffwll.local>
 <77ce6514-7050-4b17-b7f8-096b7933dcfb@amd.com>
 <ZtgsjoCWI4aDWpSi@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtgsjoCWI4aDWpSi@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Wed, Sep 04, 2024 at 11:46:54AM +0200, Simona Vetter wrote:
> On Wed, Sep 04, 2024 at 09:40:36AM +0200, Christian König wrote:
> > Am 03.09.24 um 10:13 schrieb Simona Vetter:
> > > [SNIP]
> > > > > So I think the issue is much, much bigger, and there's more. And the
> > > > > issue is I think a fundamental design issue of dma_fence itself, not
> > > > > individual users.
> > > > IIRC both Alex and me pointed out this issue on the very first dma_fence
> > > > code and nobody really cared.
> > > I guess way back then we didn't really sort out any of the hotunplug
> > > issues, and there wasn't any fw ctx schedulers at least on our horizons
> > > yet. Thin excuse, I know ...
> > 
> > Well it's just when you have a bee string and a broken leg, what do you
> > attend first? :)
> 
> Yeah ...
> 
> > > > >    I think at the core it's two constraints:
> > > > > 
> > > > > - dma_fence can stick around practically forever in varios container
> > > > >     objects. We only garbage collect when someone looks, and not even then
> > > > >     consistently.
> > > > > 
> > > > > - fences are meant to be cheap, so they do not have the big refcount going
> > > > >     on like other shared objects like dma_buf
> > > > > 
> > > > > Specifically there's also no refcounting on the module itself with the
> > > > > ->owner and try_module_get stuff. So even if we fix all these issues on
> > > > > the data structure lifetime side of things, you might still oops calling
> > > > > into dma_fence->ops->release.
> > > > > 
> > > > > Oops.
> > > > Yes, exactly that. I'm a bit surprised that you realize that only now :)
> > > > 
> > > > We have the issue for at least 10 years or so and it pops up every now and
> > > > then on my desk because people complain that unloading amdgpu crashes.
> > > Yeah I knew about the issue. The new idea that popped into my mind is that
> > > I think we cannot plug this properly unless we do it in dma_fence.c for
> > > everyone, and essentially reshape the lifetime rules for that from yolo
> > > to something actually well-defined.
> > > 
> > > Kinda similar work to how dma_resv locking rules and fence book-keeping
> > > were unified to something that actually works across drivers ...
> > 
> > Well sounds like I've just got more items on my TODO list.
> > 
> > I have patches waiting to be send out going into this direction anyway, will
> > try to get them out by the end of the week and then we can discuss what's
> > still missing.
> 
> Quick addition, another motivator from the panthor userspace submit
> discussion: If the preempt ctx fence concept spreads, that's another
> non-drm_sched fence that drivers will need and are pretty much guaranteed
> to get wrong.
> 
> Also maybe Boris volunteers to help out with some of the work here? Or
> perhaps some of the nova folks, it seems to be even more a pain for rust
> drivers ...

I forgot to add: I think it'd be really good to record the rough consensus
on the problem and the long term solution we're aiming for an a kerneldoc
or TODO patch. I think recording those design goals helped us a _lot_ in
making the dma_resv_usage/lock and dma_buf api cleanups and cross-driver
consistent semantics happen. Maybe as a WARNING/TODO block in the
dma_fence_ops kerneldoc?

Boris, can you volunteer perhaps? I'm happy to review, but I feel like I'm
too close and deep in this mess that I'll likely miss some aspect if I
type it myself.

Thanks, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
