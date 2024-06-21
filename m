Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D124912AD0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 18:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD71910F26A;
	Fri, 21 Jun 2024 16:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WrDRF78g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0404C10F269
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 16:04:06 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4217ee64ac1so2751405e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 09:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718985845; x=1719590645; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vN260L65NdwhhzFhGRzhHpkMdYHsvIyA4ZNIAeJjPbg=;
 b=WrDRF78gnhbIei8Ee72/IohSYRDAcc9DuCOgrgYN0VZoeQH6hsAujR793jI5jPaDw/
 TOE699LaVRUevwgStSAZ2bpeP4p3b2XHrFncOY/owPIkk5Bg9ba8rww7IDYtweCzAPJh
 cWWmCJVHXAZL9VJTKLbnaVbhN1/ctGKcZzv1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718985845; x=1719590645;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vN260L65NdwhhzFhGRzhHpkMdYHsvIyA4ZNIAeJjPbg=;
 b=JpV8o2XegP5yBkzzBJq+l97a6VkmiFM5LgM7PECSJISN8wqI6wkqUr3TYtiaWNq0UF
 t72U/PcLSgqLYEJyN4NuHt2TG7H7kn/6pGOrqfw8cZUIb+NtBh2iYJljxZTrE6ZOLYnc
 TxBsfdLRyj3wkNL89qNaNjwXr0m6pzuclPA7IyRNaO9CDc+uS9RFzun/qXU5e3mXnBmj
 YC5VKLsmfaAtEm5X/TYn5rrYGB/Iu/ECB7PPDFMOcwZY4tuwDuaa23cVTazuzo2/6v4M
 TCNbzoQBBWBi6vknqlX6JBvJTOJ24g0OihWxrphYC9aDRvp6xdQcEqpkzdTvzZMN6wxx
 jJJQ==
X-Gm-Message-State: AOJu0YwRgSXY1QSLCX5AXEKNQICVpY5kZf4nFlNLVRdTijnKCX4f8LRC
 T5KBPW27BiK0lTC6QbFMsY0fk+dzJKhFT+usoobEjQjxhgtbFJsPAqSemiUlfOE=
X-Google-Smtp-Source: AGHT+IFVeU3xce+k26r2+DnW8GeU78oyhJggZBPOJmXKmQ3sZUYdc630B9SNBh7u3If+X/hS+ML+Pg==
X-Received: by 2002:a05:6000:1f86:b0:360:8490:74d with SMTP id
 ffacd0b85a97d-36319990f76mr6226350f8f.5.1718985845005; 
 Fri, 21 Jun 2024 09:04:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366383f6d16sm2172707f8f.3.2024.06.21.09.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 09:04:04 -0700 (PDT)
Date: Fri, 21 Jun 2024 18:04:02 +0200
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
Message-ID: <ZnWkcodVWXe7gPVa@phenom.ffwll.local>
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
 <ZnBFgDO37xhMfvzV@phenom.ffwll.local>
 <CAD=FV=UindNjK4rWMvsMybgp_bPULbNz2A-u8x60MD4scrnHSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UindNjK4rWMvsMybgp_bPULbNz2A-u8x60MD4scrnHSQ@mail.gmail.com>
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

On Tue, Jun 18, 2024 at 04:49:22PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 17, 2024 at 7:17 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > That all being said, I'm also totally OK with any of the following:
> > >
> > > 1. Dropping my patch and just accepting that we will have warnings
> > > printed out for all DRM drivers that do things correctly and have no
> > > warnings for broken DRM drivers.
> >
> > Can't we just flip the warnings around? Like make the hacky cleanup
> > conditional on the panel not yet being disabled/cleaned up, and complain
> > in that case only. With that:
> > - drivers which call shutdown shouldn't get a warning anymore, and also
> >   not a surplus call to drm_panel_disable/unprepare
> > - drivers which are broken still get the cleanup calls
> > - downside: we can't enforce this, because it's not yet enforced through
> >   device_link ordering
> 
> I feel like something is getting lost in the discussion here. I'm just
> not sure where to put the hacky cleanup without either having a list
> like I have or fixing the device link problem so that the DRM device
> shutdown gets called before the panel. Specifically, right now I think
> it's possible for the panel's shutdown() callback to happen before the
> DRM Device's shutdown(). Thus, we have:
> 
> 1. Panel shutdown() checks and says "it's not shutdown yet so do my
> hacky cleanup."
> 2. DRM device shutdown() gets called and tries to cleanup again.
> 
> ...and thus in step #1 we can't detect a broken DRM device. What am I missing?

The above is a broken drm driver, because shutting down something that the
main drm driver needs _before_ it is shut down itself is broken. That's
why we need the device link.

So if this case goes a bit wrong that's imo ok. That was my point that
without device links, we cannot have _any_ warning at all, but we can at
least make sure that correct drivers, meaning:
- they make sure the panel is around for longer than the drm device
- and they call drm atomic_helper_shutdown in the right places

Wont either double-shutdown the panel or get the warning.

It's not great, but it's at least better than the current situation where
correct drivers get a warning, and some broken drivers don't. So still an
improvement.

That leaves us with the issue of warning for all broken drivers. We have
two proposals for that:

- Your explicit list, which is a pain imo, and I'm not seeing the benefit
  of this, because it'll encourage each driver to hack around the core
  code bug of not having the right device links.

- Fixing this with a device link and adding the warning for everyone.

This isn't a great situation, because it's likely going to be another few
years without the device link situation sorted out. But that's been the
case already for years so *shrug*.

> > > 2. Someone else posting / landing a patch to remove the hacky "disable
> > > / unprepare" for panel-simple and panel-edp and asserting that they
> > > don't care if they break any DRM drivers that are still broken. I
> > > don't want to be involved in authoring or landing this patch, but I
> > > won't scream loudly if others want to do it.
> > >
> > > 3. Someone else taking over trying to solve this problem.
> > >
> > > ...mostly this work is janitorial and I'm trying to help move the DRM
> > > framework forward and get rid of cruft, so if it's going to cause too
> > > much conflict I'm fine just stepping back.
> >
> > My issue is that you're trading an ugly warning that hurts maintenance
> > with an explicit list of working drivers, which also hurts maintenance.
> > Does seem like forward progress to me, just pushing the issue around.
> 
> IMO it at least moves things forward. If we make the warning obvious
> enough then I think we could assert that, within a few kernel
> versions, everyone who hit the warning would have addressed it. Once
> that happens we can fully get rid of the ugly list and just make the
> assumption that things are good. That feels like a clear path to me...

Yeah, but your warning I think just encourages more hacks in drivers that
shouldn't be there (for the ordering issue). So I'm not sure it's strictly
better.

And we have _tons_ of drm driver api misuse that we don't catch with
warnings and checks. Sometimes that's just not possible, because the
situation is too messy. If we add an explicit "I'm not broken" list for
each such case, we will have an unmaintainable mess. Sometimes a "I'm the
last broken driver" flag makes sense, but even there I'm cautious that
it's a bright idea.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
