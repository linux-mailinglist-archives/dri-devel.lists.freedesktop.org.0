Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B05D73D71FA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44336E9B7;
	Tue, 27 Jul 2021 09:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77596E9B7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:28:47 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id n12so10812551wrr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 02:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6aV3muk642z4hCtT8NSv5lPjZokN9MxGSOMnKyhtsCU=;
 b=Z7P7ulKObnJkjatiqkMRBvT4vyHWts36zOgdgtADSDIQCFf7UKUHu5sjke40ePBPET
 LpUaDHhtAs5GPh88eK9eOaxZVTVpRo9N1PHOGjTbh0z1xrP4fISqI2JUj8T3Y5W6FxQ5
 Ru4RRY+43vPgXWhnMGgdYROofXXmPavc4TL2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6aV3muk642z4hCtT8NSv5lPjZokN9MxGSOMnKyhtsCU=;
 b=LFBcvRVHes3VieNKC6BTh0APa59g4vPuVYcpTeE7N1G5TRXws4iZxn4d3ji8b7hMug
 ztVdMS0PUsjR71BIiNzLirD2+gtXpGFwYcC51EX9wnXM26T+3SdmFLuP8ZkxPFTf8dam
 6soe8FAUX5I5hPrt0c5gNrQdX0ervbzNTlp0N1iPlQjRbPZsgadlWDlgTIu3T5ecYxyi
 QdZ2YTd5CztHin2xTn7UMplxl4N1dOA8UbsYywwgIdseOMba+iAVBWd0vTUL/bmDmptF
 2eSCJJ5SJsIt9yzOATavkE6+yQC0zn/l6cHhvrTz7LmrEjSntq2e3sgiAMqNrt4SepRL
 4OfA==
X-Gm-Message-State: AOAM533aihxd/c7gIchUFWUBibGB2hJSNDitGpphQNAQ/q/oY+cC5DbQ
 6fvgCBXkGno44BPnB7L6k9fdSn6G6J2oug==
X-Google-Smtp-Source: ABdhPJzU7yPr2agv9gDDSM6icbeSKkzbUUPB17yYigExa1sKDHMjsfDdsNXSrsKLYQSb6FH3x5q/UQ==
X-Received: by 2002:a5d:5506:: with SMTP id b6mr23094661wrv.318.1627378126382; 
 Tue, 27 Jul 2021 02:28:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g15sm2270220wmh.44.2021.07.27.02.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:28:45 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:28:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
Message-ID: <YP/RzB5EJJQ0CqFg@phenom.ffwll.local>
References: <20210722124127.17901-1-christian.koenig@amd.com>
 <YPqCBUDiibBWUs2/@phenom.ffwll.local>
 <c83ebc42-567c-4f4c-d6da-53ff21739222@gmail.com>
 <CAKMK7uGVPnsw2o=9E295CobiY_qYdCg5fZQN4Q8Bu22r9E3WUw@mail.gmail.com>
 <4c30a961-0a73-3f69-7733-2491549a8743@gmail.com>
 <CAPM=9txffDPERe_iZ2obsekJcbjfph32bca-18ROCJqEPByQWg@mail.gmail.com>
 <1dd69d33-4b58-e3dd-5598-ed78f2a18ef5@gmail.com>
 <CAPM=9twfAQV60+vmn3WdiS6o4C7GajWS7_a0wLDo6zyBw_kBsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPM=9twfAQV60+vmn3WdiS6o4C7GajWS7_a0wLDo6zyBw_kBsA@mail.gmail.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 06:03:12AM +1000, Dave Airlie wrote:
> On Tue, 27 Jul 2021 at 05:35, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 26.07.21 um 02:03 schrieb Dave Airlie:
> > > [SNIP]
> > >> But you know, normal human: Only equipped with one head and two hands
> > >> and not cloneable.
> > > I'm the same, but I'm not seeing where this problem happens at all, do
> > > we have any backtraces or demos for this?
> >
> > I've stumbled over this while working on some patches which accidentally
> > broke delayed delete and caused random memory corruption and was
> > wondering how that even happened in the first place.
> >
> > Having stale PTEs in the GART isn't a problem unless you break other
> > things. Which is also the reason why I haven't added a CC stable yet.
> >
> > > I split bind/unbind into the driver, but the driver should still
> > > always be moving things to unbound states before an unpopulate is
> > > called, is there a driver doing something unexpected here?
> >
> > Possible, I was only testing with amdgpu and the GART handling is rather
> > special there (which was one of the reasons why we did that in the first
> > place).
> >
> > > at worst I'd like to see a WARN_ON put in first and a test in igt that
> > > triggers it, because right now I'm not see that path through the
> > > drivers/ttm that leads to unpopulated pages ending up happening while
> > > bound.
> > >
> > >  From 5.14-rc3 unpopulate is called from ttm_bo_pipeline_gutting in
> > > non-ghost path and there is no unbind,
> > > pipeline gutting is called from evict/validate, when there is no
> > > placement suggested for the object, is this case getting hit somewhere
> > > without the driver having previously unbound things?
> >
> > Yes, that will hit absolutely. Most likely with VM page tables for
> > amdgpu which uses this.
> 
> My thing is here we moved binding/unbinding to the driver, if the
> driver has a bug
> I'd expect the fix to be in the driver side here. I think giving
> drivers control over something
> and enforcing it in the core/helpers is fine, but I don't think we
> should be adding back
> the midlayering.
> 
> > > ttm_tt_destroy_common: calls unpopulate, everyone calls this directly
> > > after unbinding
> > > ttm_tt_swapout: calls unpopulate, we don't swapout objects from TT
> > > directly, we should always unbind first, this used to have an assert
> > > against that,
> > > ttm_tt_populate: call unpopulate in failure path
> >
> > unbinding was moved into the driver, so ttm_tt_swapout() won't unbind
> > anything before calling unpopulate as far as I can see.
> 
> But we won't call swapout on BOs that aren't in SYSTEM and to be in SYSTEM,
> the bo would have to go through the driver move function which will unbind it.
> 
> >
> > > So any place I can see unpopulate getting called with a bound TT
> > > should be a bug, and fixed, we could protect against it better but I'm
> > > not seeing the need for this series to outright revert things back as
> > > helping.
> >
> > I'm not reverting this because it is offhand wrong, but making sure the
> > GART is clear before unpopulating the TT object sounds like the much
> > more natural thing to do and the state machine is something I certainly
> > don't see in the backend.
> >
> 
> I don't think that's the core's responsibility anymore, I'm fine with
> adding code and
> even an flag that says if the the TT is bound/unbound that unpopulate
> can WARN_ON()
> against so we get a backtrace and track down where something is
> getting unpopulated
> without going through the driver move function to be unbound.

Yeah I think sprinkling a few WARN_ON around to make sure drivers use the
functions correctly is the right thing. Re-midlayering because we don't
trust drivers to do things correctly isn't.

Aside from this principle I'll let you two duke out what's actually going
on :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
