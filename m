Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19F2905676
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 17:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D2E10E895;
	Wed, 12 Jun 2024 15:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="i5u9tlQr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F08F10E895
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 15:11:11 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4210f0bb857so7243775e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 08:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718205069; x=1718809869; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j3rEd/N79zsTx5bN2Ceul3LBY+GMeO3ZQ5xYcqq+Lx8=;
 b=i5u9tlQrxZxVA1qSM54vVmXocB7IMcT26MDGn0UxABdz63s12dAM6r66cltiilKDQQ
 N1YiNsXU7J8Tkd929lK4TNlO7i+DQRRtaKY3Y/eBolbK63My9L14gAe8NuBNsEJSmatR
 CMy2UOKA6zUEpsTnW+/RhqN7KyPJZyW9Zt2KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718205069; x=1718809869;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j3rEd/N79zsTx5bN2Ceul3LBY+GMeO3ZQ5xYcqq+Lx8=;
 b=o6OjNuKhoEQwHGIkd+eb+pb4++FlT2oEZvvajEQPaaacarwwHwWrfT9MnZsD35uN6g
 1AFSuDhZM1v+mgymIQ5gBlrMPM4Djmtj36dOQAVV/FpEtLbvCKuJE0tBN7pcXQ+qce7G
 hUEQYW93A6OmmBhIkvbAvL949LrUPcaixblTc3wLQY1uQIPY9x1y1GuDRvoiD0WWZ73w
 YZa1hLFeZCN1atxzDCgLXbBwz6TORZy18wEDM/QeH7FDK8ymD57KIF1hGgISCjkTci5i
 RHezFpA4aumVKr2ygVq+dd7om7Ts+YpwvWnO6x4m7riE2hlKfKfS5n79PFMmbIgUcO2G
 yMEA==
X-Gm-Message-State: AOJu0YwjjwXheoe2dZizO2E+DcK4N2z8PnmA8PKgKYS55bJ2kVb5mU1G
 wCDMRegPfgBc+0jG3X7SRoMQ5BBXoh9m7bR3Mg04ZdKsuKB9BNfvyWwZ5ZeSyoI=
X-Google-Smtp-Source: AGHT+IGOokcQBaF0gtzavB63Lm/hzcbJyOl+IEUlftNYtxr6X9d0tMA3jKNn1cu9xWD4Kz5+Y3xExQ==
X-Received: by 2002:a05:600c:1c85:b0:421:de31:76 with SMTP id
 5b1f17b1804b1-422866bcc38mr14735365e9.3.1718205069428; 
 Wed, 12 Jun 2024 08:11:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42286fe919bsm28783255e9.19.2024.06.12.08.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 08:11:09 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:11:07 +0200
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
Message-ID: <Zmm6i6iQOdP613w3@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=V4C1AYVqG4gig+SiQr4n_mAPVASxneDDZT1a=7AY3Hzw@mail.gmail.com>
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

On Wed, Jun 12, 2024 at 07:49:31AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 12, 2024 at 1:58 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Jun 11, 2024 at 07:48:51AM -0700, Douglas Anderson wrote:
> > > At shutdown if you've got a _properly_ coded DRM modeset driver then
> > > you'll get these two warnings at shutdown time:
> > >
> > >   Skipping disable of already disabled panel
> > >   Skipping unprepare of already unprepared panel
> > >
> > > These warnings are ugly and sound concerning, but they're actually a
> > > sign of a properly working system. That's not great.
> > >
> > > It's not easy to get rid of these warnings. Until we know that all DRM
> > > modeset drivers used with panel-simple and panel-edp are properly
> > > calling drm_atomic_helper_shutdown() or drm_helper_force_disable_all()
> > > then the panel drivers _need_ to disable/unprepare themselves in order
> > > to power off the panel cleanly. However, there are lots of DRM modeset
> > > drivers used with panel-edp and panel-simple and it's hard to know
> > > when we've got them all. Since the warning happens only on the drivers
> > > that _are_ updated there's nothing to encourage broken DRM modeset
> > > drivers to get fixed.
> > >
> > > In order to flip the warning to the proper place, we need to know
> > > which modeset drivers are going to shutdown properly. Though ugly, do
> > > this by creating a list of everyone that shuts down properly. This
> > > allows us to generate a warning for the correct case and also lets us
> > > get rid of the warning for drivers that are shutting down properly.
> > >
> > > Maintaining this list is ugly, but the idea is that it's only short
> > > term. Once everyone is converted we can delete the list and call it
> > > done. The list is ugly enough and adding to it is annoying enough that
> > > people should push to make this happen.
> > >
> > > Implement this all in a shared "header" file included by the two panel
> > > drivers that need it. This avoids us adding an new exports while still
> > > allowing the panel drivers to be modules. The code waste should be
> > > small and, as per above, the whole solution is temporary.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > I came up with this idea to help us move forward since otherwise I
> > > couldn't see how we were ever going to fix panel-simple and panel-edp
> > > since they're used by so many DRM Modeset drivers. It's a bit ugly but
> > > I don't hate it. What do others think?
> >
> > I think it's terrible :-)
> 
> Well, we're in agreement. It is terrible. However, in my opinion it's
> still a reasonable way to move forward.
> 
> 
> > Why does something like this now work?
> >
> > drm_panel_shutdown_fixup(panel)
> > {
> >         /* if you get warnings here, fix your main drm driver to call
> >          * drm_atomic_helper_shutdown()
> >          */
> >         if (WARN_ON(panel->enabled))
> >                 drm_panel_disable(panel);
> >
> >         if (WARN_ON(panel->prepared))
> >                 drm_panel_unprepare(panel);
> > }
> >
> > And then call that little helper in the relevant panel drivers? Also feel
> > free to bikeshed the name and maybe put a more lengthly explainer into the
> > kerneldoc for that ...
> >
> > Or am I completely missing the point here?
> 
> The problem is that the ordering is wrong, I think. Even if the OS was
> calling driver shutdown functions in the perfect order (which I'm not
> convinced about since panels aren't always child "struct device"s of
> the DRM device), the OS should be calling panel shutdown _before_
> shutting down the DRM device. That means that with your suggestion:
> 
> 1. Shutdown starts and panel is on.
> 
> 2. OS calls panel shutdown call, which prints warnings because panel
> is still on.
> 
> 3. OS calls DRM driver shutdown call, which prints warnings because
> someone else turned the panel off.

Uh, that's a _much_ more fundamental issue.

The fix for that is telling the driver core about this dependency with
device_link_add. Unfortuantely, despite years of me trying to push for
this, drm_bridge and drm_panel still don't automatically add these,
because the situation is a really complex mess.

Probably need to read dri-devel archives for all the past attempts around
device_link_add.

But the solution is definitely not to have a manually tracked list, what's
very architectural unsound way to tackle this problem.

> Certainly if I goofed and the above is wrong then let me know--I did
> my experiments on this many months ago and didn't try repeating them
> again now.

Oh the issue is very real and known since years. It also wreaks module
unload and driver unbinding, since currently nothing makes sure your
drm_panel lives longer than your drm_device.

> In any case, the only way I could figure out around this was some sort
> of list. As mentioned in the commit message, it's super ugly and
> intended to be temporary. Once we solve all the current in-tree
> drivers, I'd imagine that long term for new DRM drivers this kind of
> thing would be discovered during bringup of new boards. Usually during
> bringup of new boards EEs measure timing signals and complain if
> they're not right. If some EE cared and said we weren't disabling the
> panel correctly at shutdown time then we'd know there was a problem.

You've stepped into an entire hornets nest with this device dependency
issue unfortunately, I'm afraid :-/

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
