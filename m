Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6263A29ECF1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 14:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5BD6ECBC;
	Thu, 29 Oct 2020 13:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08EE6ECBC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 13:31:42 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y12so2782464wrp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m8GRnF8qGooixhL6DWEGKikS0gyJFf4Ahad5/MqCc10=;
 b=P0saBrtaab1aIeHkJzHlm65kDAF9/xrj2WUdMmNpDWMETcRZGMt5aDTviRvc1ihHbG
 JhFaekdp91VW5H+vAZMNUKcGx+qs9l64JJXc0LefZMjujfInPkpmVX0go5p2s2qRzI1L
 oeMQKMlNJqGpgu/YKLtKlE+5jcBKSRljls658=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m8GRnF8qGooixhL6DWEGKikS0gyJFf4Ahad5/MqCc10=;
 b=XZqu8qZx38vhVrrXGX+IWBSue9bzparOQQDk8JDaCgIwM6FfYfqOynkGSNvmRw6M2W
 vtZ+olKlOQYgmbSlXb+LLZ2vtBhh8FV8FrPM/rhFIbWk1YxjF52mQXoCSjtI3eY0+wox
 w+fS+NY3fGGa8oKHsSR2fAKMJ4WpiSPI6zi+7xoaFAIaA1g0QMRrNRfZKr+BRXT9G/mQ
 6mIfEeeHtMZJEhaE2QQ9Sx5F70nFa2lJMNbUZ4qrlhLnoZnEWc4lmWisz8br3XBz25hd
 9sJrUlOUhbT5puzqf+NGZYO+HAsSTUdOd2CDRlo24y0dPuT/3zEodl8GuRtcC7yrS3xO
 W05Q==
X-Gm-Message-State: AOAM530smvCJuAV7JALOcJ/6RTIXK+izPlMuOHf782o3MXguRJwhK+g2
 rZrepP/omVmXQG8vujHvBXJ3Gg==
X-Google-Smtp-Source: ABdhPJy7r5v0QJ3KdD2rpzVlJOMSmOmnR//B1kVaITOoJA0W5XVAl4QGfB3KP/fQbHruSEGfI1aSfg==
X-Received: by 2002:adf:8bce:: with SMTP id w14mr5539648wra.242.1603978301273; 
 Thu, 29 Oct 2020 06:31:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c185sm4651148wma.44.2020.10.29.06.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 06:31:40 -0700 (PDT)
Date: Thu, 29 Oct 2020 14:31:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 4/7] drm/vc4: kms: Document the muxing corner cases
Message-ID: <20201029133138.GB401619@phenom.ffwll.local>
References: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
 <aa88b754887b0a53b33e6a2447a09ff50281fd54.1603888799.git-series.maxime@cerno.tech>
 <20201029085104.GA401619@phenom.ffwll.local>
 <20201029104728.xrrqug5zjmbhpf5c@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029104728.xrrqug5zjmbhpf5c@gilmour.lan>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 11:47:28AM +0100, Maxime Ripard wrote:
> Hi!
> 
> Thanks for your review
> 
> On Thu, Oct 29, 2020 at 09:51:04AM +0100, Daniel Vetter wrote:
> > On Wed, Oct 28, 2020 at 01:41:01PM +0100, Maxime Ripard wrote:
> > > We've had a number of muxing corner-cases with specific ways to reproduce
> > > them, so let's document them to make sure they aren't lost and introduce
> > > regressions later on.
> > > 
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_kms.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> > > index 4aa0577bd055..b0043abec16d 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_kms.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> > > @@ -612,6 +612,28 @@ static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
> > >  };
> > >  
> > >  
> > > +/*
> > > + * The BCM2711 HVS has up to 7 output connected to the pixelvalves and
> > > + * the TXP (and therefore all the CRTCs found on that platform).
> > > + *
> > > + * The naive (and our initial) implementation would just iterate over
> > > + * all the active CRTCs, try to find a suitable FIFO, and then remove it
> > > + * from the available FIFOs pool. However, there's a few corner cases
> > > + * that need to be considered:
> > > + *
> > > + * - When running in a dual-display setup (so with two CRTCs involved),
> > > + *   we can update the state of a single CRTC (for example by changing
> > > + *   its mode using xrandr under X11) without affecting the other. In
> > > + *   this case, the other CRTC wouldn't be in the state at all, so we
> > > + *   need to consider all the running CRTCs in the DRM device to assign
> > > + *   a FIFO, not just the one in the state.
> > > + *
> > > + * - Since we need the pixelvalve to be disabled and enabled back when
> > > + *   the FIFO is changed, we should keep the FIFO assigned for as long
> > > + *   as the CRTC is enabled, only considering it free again once that
> > > + *   CRTC has been disabled. This can be tested by booting X11 on a
> > > + *   single display, and changing the resolution down and then back up.
> > 
> > This is a bit much.
> 
> What do you find to be a bit much?
> 
> > With planes we have the same problem, and we're solving this with the
> > drm_plane_state->commit tracker. If you have one of these per fifo
> > then you can easily sync against the disabling crtc if the fifo
> > becomes free.
> > 
> > Note to avoid locking headaches this would mean you'd need a per-fifo
> > private state object. You can avoid this if you just track the
> > ->disabling_commit per fifo, and sync against that when enabling it on a
> > different fifo.
> > 
> > Note that it's somewhat tricky to do this correctly, since you need to
> > copy that commit on each state duplication around, until it's either used
> > in a new crtc (and hence tracked under that) or the commit has completed
> > (but this is only an optimization, you could just keep them around forever
> > for unused fifo that have been used in the past, it's a tiny struct with
> > nothing hanging of it).
> 
> I'm not really following you here. The hardware that does the blending
> (HVS) and the timing generation (pixelvalve) is mostly transparent to
> DRM and plugged as a CRTC, with the pixelvalve being the device tied to
> that CRTC, and the pixelvalve hooks calling into the HVS code when
> needed.
> 
> The FIFO is in the HVS itself since it can only blend 3 different
> scenes, and then you get to choose the output of that FIFO to send it to
> the proper pixelvalve that matches the encoder you eventually want to
> use.
> 
> So yeah, this FIFO is entirely internal to the CRTC as far as DRM is
> concerned.

So why do you dynamically assign it in a global state object? It sounded
like you assign these things dynamically, and that there's a problem with
sync when you move it from one crtc to the other. And that kind of problem
is solved by tracking the last crtc using a given resource that can be
used by different crtc with a drm_crtc_commit *last_user pointer.

Otherwise I think if you follow 2 crtc commits, one that disables a CRTC
user and releases a FIFO, and the next crtc (a different one) that uses it
right away, both nonblocking, then the 2nd crtc might start using your
shared resources before the first one actually stopped using it.

The other thing is also if you need multiple of these shared resources on
a CRTC, and dynamically reassigning them, then forcing them to be assigned
until the crtc is completely off is a bit too much synchronization. E.g.
we don't have that rule for drm planes. Now I have no idea whether your
CRTC:FIFO is 1:1 or 1:n, so maybe you only have the sync issue and not the
over-sync issue :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
