Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C25905689
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 17:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74BB10E0E7;
	Wed, 12 Jun 2024 15:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="TVri2K6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054E910E0E7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 15:13:07 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-35f0b9a1dd7so24f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718205186; x=1718809986; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aB2lXUipFe+ilhQGDKfy5yRSSxNAEcN/w1KJXQoXXRo=;
 b=TVri2K6kQOwGZdM1zTZZaMYKdoJ5JQeebbkYaiSu9HtrPXVIcxY72zzduFcHCGIa2o
 tFc78jjN0j4RCYCb4nlXVnReFmRKp9U8QNA/qDAlUxqYG73aigfcS8zR9UHPrz8bNKw2
 dS9982ttf9qIk72VoWeGHKcHfZ4biAHs2ABJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718205186; x=1718809986;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aB2lXUipFe+ilhQGDKfy5yRSSxNAEcN/w1KJXQoXXRo=;
 b=BpCc7JjGeu+rQaCWgu+7ekO4Hd0z1xLVD2lxCj/GI7eAN6oLIGHcJuLWu2lmPWlcZv
 VqOd7jqcgA4xS7V30D0ViOP8v0QunWXqCg6UBd5WHxt2vPii4QJ0pGX5/P+BKzSor1YF
 187sJcQj42ItwhcUlARzjfJLUjTsAyD21L82mLEdcAG+4NSxwMz1BsHcUjLS78tyu2KO
 9PhhhDhyqSqtuA6AvQmfWS4Sbll2rzMclMVWeKnl9MhxOhl3legnWEidlMB79yp9zpJ3
 +sisqvEEPy1LhAhUOwSd0yuAUQIKiHOCYJQXYB3M7Z7CBeb2NY5bSX8V3jlBW4J3ZKgH
 5zYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2GLn6DbWEZlWAQiCJNFX/gM9Tdev8P5TZuDAkVNgK40Bob0qoFlEnhQTSzXUNwwF4Z+ZPbov0NDl2ClGXz5Z9kGwpe4km9w7ygdAHnPe9
X-Gm-Message-State: AOJu0YwXrIkBhXdhuuPpzmHTDbQhbht9SLbo5RwDnm5FGDcYavauyARX
 DklNSbBbsmFVgcFufxiTU3gB7CtMdAJ9szBpIjS45OZuzgD0Ot9yNgcJ68QjSdM=
X-Google-Smtp-Source: AGHT+IG6G6UfkgYLOZrbaC3u6RFF77X5XQGCNP3Hq482PX0DbBDxDJ6zJg1aOTxpQe4xxXI8x1blEA==
X-Received: by 2002:a05:6000:1445:b0:354:e03c:b39a with SMTP id
 ffacd0b85a97d-35fe88fe708mr1617633f8f.6.1718205186150; 
 Wed, 12 Jun 2024 08:13:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f30c04d63sm3301375f8f.110.2024.06.12.08.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 08:13:05 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:13:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Doug Anderson <dianders@chromium.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
Message-ID: <Zmm6_27GikpmT3HQ@phenom.ffwll.local>
Mail-Followup-To: Doug Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <20240612-garnet-condor-from-saturn-1c51bb@houat>
 <CAD=FV=Xpu0-_kEvRWy9w8ypjo7pF7tsFWxHfhMZ=YjHugTqG1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Xpu0-_kEvRWy9w8ypjo7pF7tsFWxHfhMZ=YjHugTqG1w@mail.gmail.com>
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

On Wed, Jun 12, 2024 at 07:39:01AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 12, 2024 at 1:09 AM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Tue, Jun 11, 2024 at 07:48:51AM GMT, Douglas Anderson wrote:
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
> > I don't think it's the right approach, even more so since we're so close
> > now to having it in every driver.
> >
> > I ran the coccinelle script we started with, and here are the results:
> >
> > ./drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1640:25-39: ERROR: KMS driver vmw_pci_driver is missing shutdown implementation
> > ./drivers/gpu/drm/kmb/kmb_drv.c:621:30-49: ERROR: KMS driver kmb_platform_driver is missing shutdown implementation
> > ./drivers/gpu/drm/tiny/arcpgu.c:422:30-52: ERROR: KMS driver arcpgu_platform_driver is missing shutdown implementation
> 
> Sure, although I think we agreed even back when we talked about this
> last that your coccinelle script wasn't guaranteed to catch every
> driver. ...so I guess the question is: are we willing to accept that
> we'll stop disabling panels at shutdown for any drivers that might
> were missed. For instance, looking at it by hand (which also could
> miss things), I previously thought that we also might need:
> 
> * nouveau
> * tegra
> * amdgpu
> * sprd
> * gma500
> * radeon
> 
> I sent patches for those drivers but they don't go through drm-misc
> and some of the drivers had a lot of abstraction layers and were hard
> to reason about. I'm also not 100% confident that all of those drivers
> really are affected--they'd have to be used with panel-simple or
> panel-edp...

Aside from amdgpu and radeon they're all in -misc now, and Alex is
generally fairly responsive.

> In any case, having some sort of warning that would give us a
> definitive answer would be nice. My proposed patch would give us that
> warning. I could even jump to a WARN_ON right from the start.

Yeah we defo want some warning to at least check this at runtime.

> My proposed patch is self-admittedly super ugly and is also designed
> to be temporary, so I don't think of this as giving up right before
> crossing the finish line but instead accepting a tiny bit of temporary
> ugliness to make sure that we don't accidentally regress anyone. I
> would really hope it would be obvious to anyone writing / reviewing
> drivers that the function I introduced isn't intended for anyone but
> panel-simple and panel-edp.

See my other reply for the proper design fix, and my apologies for what
you stepped into here :-/
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
