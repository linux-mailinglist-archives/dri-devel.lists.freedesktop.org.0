Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B796B956CF8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 16:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C3910E288;
	Mon, 19 Aug 2024 14:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="h5+DnDzp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF88B10E28B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:17:05 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42803adb420so4783805e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 07:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724077024; x=1724681824; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4ne7iS4e3lP7N8/gIX0IRRjTEEjN3UUbyRZ9lwke8E=;
 b=h5+DnDzpM+XQEZDqZJAUvXuDIHk+6O/rXiMhEml0XrAfzWf2v+CqfNnE+8QL71zEn6
 5SWxIUo1fsXE/a9OBVxY00aaIVEZ7z0qQ0VHXvmdLxHx1SZor/X4AmUkvpYPQZKHDKTS
 mABXa99+RClV2WX5gLX05Q7bY1iVBKu8k+okk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724077024; x=1724681824;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z4ne7iS4e3lP7N8/gIX0IRRjTEEjN3UUbyRZ9lwke8E=;
 b=bqBWY88u6y1RJkD01xKifeRIBa17sR9qUzEpxKwUHdhekJM0DyTDjZsX3sH/Dm/1zR
 tuXCKhVoA5tqdMWlbzcPU2QX3l84qm2cSC9/qmR17gm1A4NYTJJijjVEXlnpd6sKWTNY
 B53vbvFXA9wRA0AGxQvLZsYaLPjzJ3sWNPx8/H4xqyhKPCYeom0JktO173kZoxxyR7Rw
 RwviFsFUbF+bkWNbIoB6rh4OiZsrCpW+6CFqszZvBJIc1v0zu82DhiRMW3Fcxcrg4VJM
 ElqsrDv999mp5tmu9By2btm8h8iZ2Rx7Rxn68zVtcPBeh8wlFXfQOwN0zH/nznwgFl6d
 2Egw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+Zm/zpYjXKerabbpUJPYUoiV0hoxZZEV5Dz+5bUks3ITxS35Omn/ny+t8p88gxuNicybC5Fm8MemhuCe4Mg81EPYN5Suy0TaG/odllxqQ
X-Gm-Message-State: AOJu0YxOHP/dsjxMcqujZNoB+EUIomqAYw8Ur/M8KsAgo2aiK7Xq67H9
 9qYlBrxnB97VY+ywk7L7fi8CDxmOoVJFGinCufsjYMQnZ995+JLXK63rWIAGU4U=
X-Google-Smtp-Source: AGHT+IHuQ2Mz/Nn5LO27wAuNlJK9+z1lnG59qeCKO6vu2gOyveT/fivKPyFoJbvGGgRcLcSnxNu5mw==
X-Received: by 2002:a05:600c:1d12:b0:427:9f71:16ba with SMTP id
 5b1f17b1804b1-429ed7fdbe1mr46309215e9.5.1724077023824; 
 Mon, 19 Aug 2024 07:17:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded2882esm162969555e9.13.2024.08.19.07.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 07:17:03 -0700 (PDT)
Date: Mon, 19 Aug 2024 16:17:01 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 0/2] Allow partial memory mapping for cpu memory
Message-ID: <ZsNT3aCHSXoD5N2a@phenom.ffwll.local>
References: <20240807100521.478266-1-andi.shyti@linux.intel.com>
 <ZrXZEpplb6YA9T_d@phenom.ffwll.local>
 <ZrXtiBKyCCh0a_ym@ashyti-mobl2.lan>
 <ZrnRuRGjxHe5zxuf@phenom.ffwll.local>
 <Zrn3QqOvOEW2EYB0@ashyti-mobl2.lan>
 <ZrogDGT326oSUZls@phenom.ffwll.local>
 <ZrrK5yjirbjJQSFL@DUT025-TGLU.fm.intel.com>
 <ZrtpM6ILa0laVR1N@phenom.ffwll.local>
 <ZruvEu0BafdsVjSi@DUT025-TGLU.fm.intel.com>
 <ZrwRsXT3gu3WgjCe@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrwRsXT3gu3WgjCe@DUT025-TGLU.fm.intel.com>
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

On Wed, Aug 14, 2024 at 02:08:49AM +0000, Matthew Brost wrote:
> On Tue, Aug 13, 2024 at 07:08:02PM +0000, Matthew Brost wrote:
> > On Tue, Aug 13, 2024 at 04:09:55PM +0200, Daniel Vetter wrote:
> > > On Tue, Aug 13, 2024 at 02:54:31AM +0000, Matthew Brost wrote:
> > > > On Mon, Aug 12, 2024 at 04:45:32PM +0200, Daniel Vetter wrote:
> > > > > On Mon, Aug 12, 2024 at 01:51:30PM +0200, Andi Shyti wrote:
> > > > > > Hi Daniel,
> > > > > > 
> > > > > > On Mon, Aug 12, 2024 at 11:11:21AM +0200, Daniel Vetter wrote:
> > > > > > > On Fri, Aug 09, 2024 at 11:20:56AM +0100, Andi Shyti wrote:
> > > > > > > > On Fri, Aug 09, 2024 at 10:53:38AM +0200, Daniel Vetter wrote:
> > > > > > > > > On Wed, Aug 07, 2024 at 11:05:19AM +0100, Andi Shyti wrote:
> > > > > > > > > > This patch series concludes on the memory mapping fixes and
> > > > > > > > > > improvements by allowing partial memory mapping for the cpu
> > > > > > > > > > memory as well.
> > > > > > > > > > 
> > > > > > > > > > The partial memory mapping by adding an object offset was
> > > > > > > > > > implicitely included in commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix
> > > > > > > > > > Virtual Memory mapping boundaries calculation") for the gtt
> > > > > > > > > > memory.
> > > > > > > > > 
> > > > > > > > > Does userspace actually care? Do we have a flag or something, so that
> > > > > > > > > userspace can discover this?
> > > > > > > > > 
> > > > > > > > > Adding complexity of any kind is absolute no-go, unless there's a
> > > > > > > > > userspace need. This also includes the gtt accidental fix.
> > > > > > > > 
> > > > > > > > Actually this missing functionality was initially filed as a bug
> > > > > > > > by mesa folks. So that this patch was requested by them (Lionel
> > > > > > > > is Cc'ed).
> > > > > > > > 
> > > > > > > > The tests cases that have been sent previously and I'm going to
> > > > > > > > send again, are directly taken from mesa use cases.
> > > > > > > 
> > > > > > > Please add the relevant mesa MR to this patch then, and some relevant
> > > > > > > explanations for how userspace detects this all and decides to use it.
> > > > > > 
> > > > > > AFAIK, there is no Mesa MR. We are adding a feature that was
> > > > > > missing, but Mesa already supported it (indeed, Nimroy suggested
> > > > > > adding the Fixes tag for this).
> > > > > > 
> > > > > > Also because, Mesa was receiving an invalid address error and
> > > > > > asked to support the partial mapping of the memory.
> > > > > 
> > > > > Uh this sounds a bit too much like just yolo'ing uabi. There's two cases:
> > > > > 
> > > > > - Either this is a regression, it worked previously, mesa is now angry.
> > > > >   Then we absolutely need a Fixes: tag, and we also need that for the
> > > > >   preceeding work to re-enable this for gtt mappings.
> > > > > 
> > > > > - Or mesa is just plain wrong here, which is what my guess is. Because bo
> > > > >   mappings have always been full-object (except for the old-style shm
> > > > >   mmaps). In that case mesa needs to be fixed (because we're not going to
> > > > >   backport old uapi).
> > > > > 
> > > > >   Also in that case, _if_ (and that's a really big if) we really want this
> > > > >   uapi, we need it in xe too, it needs a proper mesa MR to use it, it
> > > > 
> > > > I looked at this code from Xe PoV to see if we support this and I think
> > > > we actually do as our CPU fault handler more or less just calls
> > > > ttm_bo_vm_fault_reserved which has similar code to this patch. So I
> > > > think this actually a valid fix. Can't be 100% sure though as I quickly
> > > > just reversed engineered this code and TTM.
> > > 
> > > That's the fault path, which isn't relevant here since you already have
> > > the vma set up. The relevant path is the mmap path, which is common for
> > > all gem drivers nowadays and the lookup handled entirely in the core. Well
> > > except for i915-gem being absolutely massively over the top special in
> > > everything. i915-gem being extremely special here is also why this patch
> > > caught my attention, because it just furthers the divergence instead of at
> > > least stopping. Since we've given up on trying to get i915-gem onto common
> > > code and patterns that's not an option, and the reason why xe exists ...
> > > 
> > > Anyway that common gem bo mmap code code is in drm_gem_mmap and still only
> > > allows exact matches.
> > > 
> > > Unless I'm completely blind, it does happen :-)
> > > 
> > 
> > Not blind.
> > 
> > > > We don't have IGT test cases for this in Xe though, we likely should add
> > > > some if mesa is doing this.
> > > 
> > > I'd expect they would fail ...
> > >
> > 
> > Just wrote one, it fails.
> > 
> > So agree with everything you are saying. Sorry for the noise. 
> 
> To be clear what I agree with:
> 
> - Xe doesn't support partial mmaps, if the i915 / Mesa needs to support
>   partial mmaps Xe needs changed in step with the i915 (it is a 1 line
>   change in drm_gem_mmap which then will a community ack too)
> - We need IGTs for partial mmaps in both i915 and Xe
> - The Mesa use needs to be understood ensuring this isn't a bug on their
>   end and this actually required
> - If partial mmaps are actually required, I'd like to see this in 6.12
>   for Xe as we are about to remove force probe

Fwiw I concur on this all. Maybe one thing to add is that if i915/mesa do
not need partial mmaps, then we should also again removed them for gtt
mmaps since that patch already slipped in.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
