Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3949E90B160
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FA710E00A;
	Mon, 17 Jun 2024 14:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="lv3mYpud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED4610E00A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 14:17:40 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42111cf2706so3863055e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 07:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718633858; x=1719238658; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EQM95NhZnQZa7dlF/QRLcwl7uH7baUwpwDD/MIgaZ74=;
 b=lv3mYpudE0Dbyo43i4Ox7sZYR1vegJf/ayhEbcGb+ucA7IzHvCDMeS9krSpRsAmes8
 aVm2MBbT+uLUdR+uYEu8gH1RkaIZpsXstu9KCcz/i2sFycPtEsfa85OM8saYEf2r8dX0
 nXuFAzytaQumsew4O2p9q6vJuHOAPwDVIRrtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718633858; x=1719238658;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EQM95NhZnQZa7dlF/QRLcwl7uH7baUwpwDD/MIgaZ74=;
 b=X1+vm5qmAZ/xWPbTT1u5pO92GxwpGQdjyqgRER5aY5m6JEUDD4Und58KPb2DGFObgh
 iBPpAJ/6r3t1Y+1sJItN1Mnj+Jna2aXvtSE0BWysW7kCISB7XHg7vsouD4bHP2zyxThz
 yekIxEEL4gZ7ysrQMR85Y1XIT5BykUIzq5UzbiJeb5yJnH3e7s+z5hsiokHNoI0h0oAz
 J+J41U3d8PdQQvtWOAcE2Vbt7PrkobXUHGKFhmCajPbhcH+KyWE4EQzgIMUr/OTQ8IsU
 VBhyQdIyh9wa9dFzqJ+LsAv+ppUaSufEXqp6jpTcQ4lzMcYQoI5mQBMLGpEW3qMhn/z6
 4pzw==
X-Gm-Message-State: AOJu0YwC4ockyBWkB0o8wstnZtKwnyIl9W1rlCBuU9wWABVRtUBFil9m
 /c1BvZwX3Mgbi8iNuKG0jbPAsKalNDkkDd/x61L5zQbyykiqekwA6MLhucpLIeI=
X-Google-Smtp-Source: AGHT+IFaPmZ5YPaGTAKYQuL1A8FFLHJdpy9zr6av7LaKtOLyHHiP9Q9wE0M/rUpSCmZEz6upnZzs3Q==
X-Received: by 2002:a05:6000:1849:b0:35f:e38:6758 with SMTP id
 ffacd0b85a97d-3607a789ad4mr6496360f8f.7.1718633858470; 
 Mon, 17 Jun 2024 07:17:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750ad082sm11835024f8f.59.2024.06.17.07.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 07:17:38 -0700 (PDT)
Date: Mon, 17 Jun 2024 16:17:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
Message-ID: <ZnBFgDO37xhMfvzV@phenom.ffwll.local>
Mail-Followup-To: Doug Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <ZmljNHteJ9L5EdE9@phenom.ffwll.local>
 <CAD=FV=V4C1AYVqG4gig+SiQr4n_mAPVASxneDDZT1a=7AY3Hzw@mail.gmail.com>
 <Zmm6i6iQOdP613w3@phenom.ffwll.local>
 <CAD=FV=WBVfBZrgGay=XY2Usq3FA3m9i6y0cU4=b=w7qO6gRBFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WBVfBZrgGay=XY2Usq3FA3m9i6y0cU4=b=w7qO6gRBFQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Wed, Jun 12, 2024 at 09:00:29AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 12, 2024 at 8:11 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > The problem is that the ordering is wrong, I think. Even if the OS was
> > > calling driver shutdown functions in the perfect order (which I'm not
> > > convinced about since panels aren't always child "struct device"s of
> > > the DRM device), the OS should be calling panel shutdown _before_
> > > shutting down the DRM device. That means that with your suggestion:
> > >
> > > 1. Shutdown starts and panel is on.
> > >
> > > 2. OS calls panel shutdown call, which prints warnings because panel
> > > is still on.
> > >
> > > 3. OS calls DRM driver shutdown call, which prints warnings because
> > > someone else turned the panel off.
> >
> > Uh, that's a _much_ more fundamental issue.
> >
> > The fix for that is telling the driver core about this dependency with
> > device_link_add. Unfortuantely, despite years of me trying to push for
> > this, drm_bridge and drm_panel still don't automatically add these,
> > because the situation is a really complex mess.
> >
> > Probably need to read dri-devel archives for all the past attempts around
> > device_link_add.
> >
> > But the solution is definitely not to have a manually tracked list, what's
> > very architectural unsound way to tackle this problem.
> >
> > > Certainly if I goofed and the above is wrong then let me know--I did
> > > my experiments on this many months ago and didn't try repeating them
> > > again now.
> >
> > Oh the issue is very real and known since years. It also wreaks module
> > unload and driver unbinding, since currently nothing makes sure your
> > drm_panel lives longer than your drm_device.
> 
> In this case I'm mostly worried about the device "shutdown" call, so
> it's not quite a lifetime issue but it is definitely related.

There's the "this is for pm" type of device_link, they have a few
flavours. And if that doesn't yet cover ->shutdown, then I guess that
needs to be addressed.

> As per my reply to Maxime, though, I'd expect that if all ordering
> issues were fixed and things were perfect then we'd still have a
> problem. Specifically it would seem pretty wrong to me to say that the
> panel is the "parent" of the DRM device, right? So if the panel is the
> "child" of the DRM device that means it'll get shutdown first and that
> means that the panel's shutdown call cannot be used to tell whether
> the DRM device's shutdown call behaved properly.

The device_link (if you add it the correct way round) means a
provider-consumer relationship. Which means:

- driver core unbinds the consumer before the provider (e.g. on module
  unload)
- driver core disables the consumer before the provider for power
  management stuff
- driver core enables providers before consumers when enabling power again

So yeah this should work the right way round ...

> > > In any case, the only way I could figure out around this was some sort
> > > of list. As mentioned in the commit message, it's super ugly and
> > > intended to be temporary. Once we solve all the current in-tree
> > > drivers, I'd imagine that long term for new DRM drivers this kind of
> > > thing would be discovered during bringup of new boards. Usually during
> > > bringup of new boards EEs measure timing signals and complain if
> > > they're not right. If some EE cared and said we weren't disabling the
> > > panel correctly at shutdown time then we'd know there was a problem.
> >
> > You've stepped into an entire hornets nest with this device dependency
> > issue unfortunately, I'm afraid :-/
> 
> As you've said, you've been working on this problem for years. Solving
> the device link problem doesn't help me, but even if it did it's
> really not fundamental to the problem here. The only need is to get a
> warning printed out so we know for sure which DRM drivers need to be
> updated before deleting the old crufty code. Blocking that on a
> difficult / years-long struggle might not be the best.

The issue is that everyone just gives up, so it's not moving.

> That all being said, I'm also totally OK with any of the following:
> 
> 1. Dropping my patch and just accepting that we will have warnings
> printed out for all DRM drivers that do things correctly and have no
> warnings for broken DRM drivers.

Can't we just flip the warnings around? Like make the hacky cleanup
conditional on the panel not yet being disabled/cleaned up, and complain
in that case only. With that:
- drivers which call shutdown shouldn't get a warning anymore, and also
  not a surplus call to drm_panel_disable/unprepare
- drivers which are broken still get the cleanup calls
- downside: we can't enforce this, because it's not yet enforced through
  device_link ordering

> 2. Someone else posting / landing a patch to remove the hacky "disable
> / unprepare" for panel-simple and panel-edp and asserting that they
> don't care if they break any DRM drivers that are still broken. I
> don't want to be involved in authoring or landing this patch, but I
> won't scream loudly if others want to do it.
> 
> 3. Someone else taking over trying to solve this problem.
> 
> ...mostly this work is janitorial and I'm trying to help move the DRM
> framework forward and get rid of cruft, so if it's going to cause too
> much conflict I'm fine just stepping back.

My issue is that you're trading an ugly warning that hurts maintenance
with an explicit list of working drivers, which also hurts maintenance.
Does seem like forward progress to me, just pushing the issue around.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
