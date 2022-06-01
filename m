Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CE053A523
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 14:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EB610E06A;
	Wed,  1 Jun 2022 12:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C37810E06A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 12:35:40 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q21so2179544wra.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 05:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=geWAW2xPBu0qLpWdiPyBgNivVlwU5h/jMqQrbUnnVfs=;
 b=BdiXXMzt8D06LixSdY84NDu9Ost8vce1JU5Ly7m8KGGcWhLpUhElYtn+kEPfDuaH/W
 ND88PNMAtKQj+HfoxEaDWhcrBetkIBFbdqglb7wVKPfHO9j+2zS1NmYUaejOw1aou2eM
 2E2nTMfjIdKfDATqam2LNbA4ivHfMMsaofjKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=geWAW2xPBu0qLpWdiPyBgNivVlwU5h/jMqQrbUnnVfs=;
 b=FmpZ08uwq7/2/PRRkhX45k/iClCgZnjqAdPv0bY2p/IKYLq+oBzLcUP1c9p6xUwtim
 970U3KYOI8TYck27/MXbwnnSAVOpNuecOoRS329njf4mobZm4yAVwtKkY7Io6xgwU6Hw
 /hcl45ONWCIRJPl2ai5vn0DpxTngzEKmR7G93WgwDILJ+QCKtE04K9SoJ45/3ldDlNF0
 LVbXgGWrxgh1nlGlDKMjBsRe3l5pRLRsJs06iQNzeONTWKsrDhsnohh6YgEBRVlOvc/4
 M0hdpZJBVK7J+6hX0oTJ0Mitc/GYCi/QfLUBuHlM30jleOAWPv7tyrWmFJcXc+Ap4iU6
 PAPw==
X-Gm-Message-State: AOAM5319ta+DpUfyZmx9I8pbKo7xX9iHZrMgw2PZ9D1HaJrIFQOCxQqj
 uhL/bAizJtHiS1Fsq2p034lWbg==
X-Google-Smtp-Source: ABdhPJzRlsH0LJwGkcjJA/JqoeBghm0kDNaIwYUbkjauNpnH8gIwKHdrawPBSHH7gN216H+LRzl0Uw==
X-Received: by 2002:a5d:43cd:0:b0:20c:fdbd:8c11 with SMTP id
 v13-20020a5d43cd000000b0020cfdbd8c11mr53732471wrr.7.1654086938960; 
 Wed, 01 Jun 2022 05:35:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a5d4f8c000000b00210346cd0b7sm1537054wru.101.2022.06.01.05.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 05:35:38 -0700 (PDT)
Date: Wed, 1 Jun 2022 14:35:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [RFC PATCH 00/16] drm/rockchip: Rockchip EBC ("E-Book
 Controller") display driver
Message-ID: <YpddFxvC9pCsobNB@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>,
 Samuel Holland <samuel@sholland.org>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Alistair Francis <alistair@alistair23.me>,
 =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>,
 Andreas Kemnade <andreas@kemnade.info>,
 David Airlie <airlied@linux.ie>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liang Chen <cl@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220413221916.50995-1-samuel@sholland.org>
 <20220414085018.ayjvscgdkoen5nw5@houat>
 <Yo5kz/9cSd6ewC5f@phenom.ffwll.local>
 <20220531085835.grw5nt4vyofis3po@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531085835.grw5nt4vyofis3po@penduick>
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
Cc: David Airlie <airlied@linux.ie>, =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Andreas Kemnade <andreas@kemnade.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 10:58:35AM +0200, Maxime Ripard wrote:
> Hi Daniel,
> 
> Thanks for your feedback
> 
> On Wed, May 25, 2022 at 07:18:07PM +0200, Daniel Vetter wrote:
> > > > VBLANK Events and Asynchronous Commits
> > > > ======================================
> > > > When should the VBLANK event complete? When the pixels have been blitted
> > > > to the kernel's shadow buffer? When the first frame of the waveform is
> > > > sent to the panel? When the last frame is sent to the panel?
> > > > 
> > > > Currently, the driver is taking the first option, letting
> > > > drm_atomic_helper_fake_vblank() send the VBLANK event without waiting on
> > > > the refresh thread. This is the only way I was able to get good
> > > > performance with existing userspace.
> > > 
> > > I've been having the same kind of discussions in private lately, so I'm
> > > interested by the answer as well :)
> > > 
> > > It would be worth looking into the SPI/I2C panels for this, since it's
> > > basically the same case.
> > 
> > So it's maybe a bit misnamed and maybe kerneldocs aren't super clear (pls
> > help improve them), but there's two modes:
> > 
> > - drivers which have vblank, which might be somewhat variable (VRR) or
> >   become simulated (self-refresh panels), but otherwise is a more-or-less
> >   regular clock. For this case the atomic commit event must match the
> >   vblank events exactly (frame count and timestamp)
> 
> Part of my interrogation there is do we have any kind of expectation
> on whether or not, when we commit, the next vblank is going to be the
> one matching that commit or we're allowed to defer it by an arbitrary
> number of frames (provided that the frame count and timestamps are
> correct) ?

In general yes, but there's no guarantee. The only guarante we give for
drivers with vblank counters is that if you receive a vblank event (flip
complete or vblank event) for frame #n, then an immediate flip/atomic
ioctl call will display earliest for frame #n+1.

Also usually you should be able to hit #n+1, but even today with fun stuff
like self refresh panels getting out of self refresh mode might take a bit
more than a few frames, and so you might end up being late. But otoh if
you just do a page flip loop then on average (after the crtc is fully
resumed) you should be able to update at vrefresh rate exactly.

> > - drivers which don't have vblank at all, mostly these are i2c/spi panels
> >   or virtual hw and stuff like that. In this case the event simply happens
> >   when the driver is done with refresh/upload, and the frame count should
> >   be zero (since it's meaningless).
> > 
> > Unfortuantely the helper to dtrt has fake_vblank in it's name, maybe
> > should be renamed to no_vblank or so (the various flags that control it
> > are a bit better named).
> > 
> > Again the docs should explain it all, but maybe we should clarify them or
> > perhaps rename that helper to be more meaningful.
> > 
> > > > Blitting/Blending in Software
> > > > =============================
> > > > There are multiple layers to this topic (pun slightly intended):
> > > >  1) Today's userspace does not expect a grayscale framebuffer.
> > > >     Currently, the driver advertises XRGB8888 and converts to Y4
> > > >     in software. This seems to match other drivers (e.g. repaper).
> > > >
> > > >  2) Ignoring what userspace "wants", the closest existing format is
> > > >     DRM_FORMAT_R8. Geert sent a series[4] adding DRM_FORMAT_R1 through
> > > >     DRM_FORMAT_R4 (patch 9), which I believe are the "correct" formats
> > > >     to use.
> > > > 
> > > >  3) The RK356x SoCs have an "RGA" hardware block that can do the
> > > >     RGB-to-grayscale conversion, and also RGB-to-dithered-monochrome
> > > >     which is needed for animation/video. Currently this is exposed with
> > > >     a V4L2 platform driver. Can this be inserted into the pipeline in a
> > > >     way that is transparent to userspace? Or must some userspace library
> > > >     be responsible for setting up the RGA => EBC pipeline?
> > > 
> > > I'm very interested in this answer as well :)
> > > 
> > > I think the current consensus is that it's up to userspace to set this
> > > up though.
> > 
> > Yeah I think v4l mem2mem device is the answer for these, and then
> > userspace gets to set it all up.
> 
> I think the question wasn't really about where that driver should be,
> but more about who gets to set it up, and if the kernel could have
> some component to expose the formats supported by the converter, but
> whenever a commit is being done pipe that to the v4l2 device before
> doing a page flip.
> 
> We have a similar use-case for the RaspberryPi where the hardware
> codec will produce a framebuffer format that isn't standard. That
> format is understood by the display pipeline, and it can do
> writeback.
> 
> However, some people are using a separate display (like a SPI display
> supported by tinydrm) and we would still like to be able to output the
> decoded frames there.
> 
> Is there some way we could plumb things to "route" that buffer through
> the writeback engine to perform a format conversion before sending it
> over to the SPI display automatically?

Currently not transparently. Or at least no one has done that, and I'm not
sure that's really a great idea. With big gpus all that stuff is done with
separate command submission to the render side of things, and you can
fully pipeline all that with in/out-fences.

Doing that in the kms driver side in the kernel feels very wrong to me :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
