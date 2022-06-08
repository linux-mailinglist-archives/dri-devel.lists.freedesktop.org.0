Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D604754377D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7249F1126DD;
	Wed,  8 Jun 2022 15:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C9A11252B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 15:34:32 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a15so20350372wrh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 08:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=/3Uhz2MzX+opEJ1vl2VMkznGEHPHcYf9Tcal/QO6uyQ=;
 b=YATbmhtVNkDLRL1cMxkgnNPvC9xkZ/OO1tTeSzJBVdWnAcc3ED6f4ZkzxnoUisY+l1
 uFpUnotT+0w/sJ/jbMoxdaAhnVQfGFYwMKasa5+bWHDDG/3oeCOpsYhc0YPvPPQCAsAP
 CpLOGClljy6gCmZajMHqSotb7MH0++HqNHL+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=/3Uhz2MzX+opEJ1vl2VMkznGEHPHcYf9Tcal/QO6uyQ=;
 b=dtBcCWPjR9hIxgDmQKIx2SM+i2kVitkex+u0OieJP9tPavTbyEveVBkT0ededZFhiA
 wRro2/LkaYGpZeTiYdurekjD2p1pHwzjyTCjhyK0L3EPCCt+/nIl1tGUh4acvIWuad8v
 l256YztWnmEduSBczHUxjPgfzNE1u2aVfIP94TosbyM52bbCkopldsz4+XTcSnXnvkS5
 K0YIlCP0hajXY1y/D5IpRNMPeuHddd0FXYQme6Q1leajJXobKD1gGHTHWGG5dOlAaDCN
 qIAufSdtMgB+hqBnDF3FOVaZXMGL4UN5byFAuVvE2xLuycBMtSo45IzH5HsPOjKrQe73
 kLKA==
X-Gm-Message-State: AOAM530LmWxgDVIekKZ7Rl3r2pc8KXn9S+5Bk1EKGFT3Sewi8GxB43xg
 qArOYFK4DBl8RVBJdGDxsASYkQ==
X-Google-Smtp-Source: ABdhPJyGzzVZ3D0bxcuNPUPGWV3cn1+ftk4zl/yiq3z2ZoGXPol7G7JsxCQHanG23JHpFxLm/6GTig==
X-Received: by 2002:a05:6000:1c1b:b0:215:840a:3fc4 with SMTP id
 ba27-20020a0560001c1b00b00215840a3fc4mr25725772wrb.30.1654702470986; 
 Wed, 08 Jun 2022 08:34:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b00397122e63b6sm24818307wms.29.2022.06.08.08.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 08:34:30 -0700 (PDT)
Date: Wed, 8 Jun 2022 17:34:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [RFC PATCH 00/16] drm/rockchip: Rockchip EBC ("E-Book
 Controller") display driver
Message-ID: <YqDBhMZCu1gKNFfs@phenom.ffwll.local>
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
 <YpddFxvC9pCsobNB@phenom.ffwll.local>
 <20220608144847.3ibr4buxcbmfj3al@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608144847.3ibr4buxcbmfj3al@houat>
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

On Wed, Jun 08, 2022 at 04:48:47PM +0200, Maxime Ripard wrote:
> On Wed, Jun 01, 2022 at 02:35:35PM +0200, Daniel Vetter wrote:
> > On Tue, May 31, 2022 at 10:58:35AM +0200, Maxime Ripard wrote:
> > > Hi Daniel,
> > > 
> > > Thanks for your feedback
> > > 
> > > On Wed, May 25, 2022 at 07:18:07PM +0200, Daniel Vetter wrote:
> > > > > > VBLANK Events and Asynchronous Commits
> > > > > > ======================================
> > > > > > When should the VBLANK event complete? When the pixels have been blitted
> > > > > > to the kernel's shadow buffer? When the first frame of the waveform is
> > > > > > sent to the panel? When the last frame is sent to the panel?
> > > > > > 
> > > > > > Currently, the driver is taking the first option, letting
> > > > > > drm_atomic_helper_fake_vblank() send the VBLANK event without waiting og
> > > > > > the refresh thread. This is the only way I was able to get good
> > > > > > performance with existing userspace.
> > > > > 
> > > > > I've been having the same kind of discussions in private lately, so I'm
> > > > > interested by the answer as well :)
> > > > > 
> > > > > It would be worth looking into the SPI/I2C panels for this, since it's
> > > > > basically the same case.
> > > > 
> > > > So it's maybe a bit misnamed and maybe kerneldocs aren't super clear (pls
> > > > help improve them), but there's two modes:
> > > > 
> > > > - drivers which have vblank, which might be somewhat variable (VRR) or
> > > >   become simulated (self-refresh panels), but otherwise is a more-or-less
> > > >   regular clock. For this case the atomic commit event must match the
> > > >   vblank events exactly (frame count and timestamp)
> > > 
> > > Part of my interrogation there is do we have any kind of expectation
> > > on whether or not, when we commit, the next vblank is going to be the
> > > one matching that commit or we're allowed to defer it by an arbitrary
> > > number of frames (provided that the frame count and timestamps are
> > > correct) ?
> > 
> > In general yes, but there's no guarantee. The only guarante we give for
> > drivers with vblank counters is that if you receive a vblank event (flip
> > complete or vblank event) for frame #n, then an immediate flip/atomic
> > ioctl call will display earliest for frame #n+1.
> > 
> > Also usually you should be able to hit #n+1, but even today with fun stuff
> > like self refresh panels getting out of self refresh mode might take a bit
> > more than a few frames, and so you might end up being late. But otoh if
> > you just do a page flip loop then on average (after the crtc is fully
> > resumed) you should be able to update at vrefresh rate exactly.
> 
> I had more the next item in mind there: if we were to write something in
> the kernel that would transparently behave like a full-blown KMS driver,
> but would pipe the commits through a KMS writeback driver before sending
> them to our SPI panel, we would always be at best two vblanks late.
> 
> So this would mean that userspace would do a page flip, get a first
> vblank, but the actual vblank for that commit would be the next one (at
> best), consistently.
> 
> > > > - drivers which don't have vblank at all, mostly these are i2c/spi panels
> > > >   or virtual hw and stuff like that. In this case the event simply happens
> > > >   when the driver is done with refresh/upload, and the frame count should
> > > >   be zero (since it's meaningless).
> > > > 
> > > > Unfortuantely the helper to dtrt has fake_vblank in it's name, maybe
> > > > should be renamed to no_vblank or so (the various flags that control it
> > > > are a bit better named).
> > > > 
> > > > Again the docs should explain it all, but maybe we should clarify them or
> > > > perhaps rename that helper to be more meaningful.
> > > > 
> > > > > > Blitting/Blending in Software
> > > > > > =============================
> > > > > > There are multiple layers to this topic (pun slightly intended):
> > > > > >  1) Today's userspace does not expect a grayscale framebuffer.
> > > > > >     Currently, the driver advertises XRGB8888 and converts to Y4
> > > > > >     in software. This seems to match other drivers (e.g. repaper).
> > > > > >
> > > > > >  2) Ignoring what userspace "wants", the closest existing format is
> > > > > >     DRM_FORMAT_R8. Geert sent a series[4] adding DRM_FORMAT_R1 through
> > > > > >     DRM_FORMAT_R4 (patch 9), which I believe are the "correct" formats
> > > > > >     to use.
> > > > > > 
> > > > > >  3) The RK356x SoCs have an "RGA" hardware block that can do the
> > > > > >     RGB-to-grayscale conversion, and also RGB-to-dithered-monochrome
> > > > > >     which is needed for animation/video. Currently this is exposed with
> > > > > >     a V4L2 platform driver. Can this be inserted into the pipeline in a
> > > > > >     way that is transparent to userspace? Or must some userspace library
> > > > > >     be responsible for setting up the RGA => EBC pipeline?
> > > > > 
> > > > > I'm very interested in this answer as well :)
> > > > > 
> > > > > I think the current consensus is that it's up to userspace to set this
> > > > > up though.
> > > > 
> > > > Yeah I think v4l mem2mem device is the answer for these, and then
> > > > userspace gets to set it all up.
> > > 
> > > I think the question wasn't really about where that driver should be,
> > > but more about who gets to set it up, and if the kernel could have
> > > some component to expose the formats supported by the converter, but
> > > whenever a commit is being done pipe that to the v4l2 device before
> > > doing a page flip.
> > > 
> > > We have a similar use-case for the RaspberryPi where the hardware
> > > codec will produce a framebuffer format that isn't standard. That
> > > format is understood by the display pipeline, and it can do
> > > writeback.
> > > 
> > > However, some people are using a separate display (like a SPI display
> > > supported by tinydrm) and we would still like to be able to output the
> > > decoded frames there.
> > > 
> > > Is there some way we could plumb things to "route" that buffer through
> > > the writeback engine to perform a format conversion before sending it
> > > over to the SPI display automatically?
> > 
> > Currently not transparently. Or at least no one has done that, and I'm not
> > sure that's really a great idea. With big gpus all that stuff is done with
> > separate command submission to the render side of things, and you can
> > fully pipeline all that with in/out-fences.
> > 
> > Doing that in the kms driver side in the kernel feels very wrong to me :-/
> 
> So I guess what you're saying is that there's a close to 0% chance of it
> being accepted if we were to come up with such an architecture?

Yup.

I think the only exception is if you have a multi-region memory manager
using ttm (or hand-rolled, but please don't), where we first have to move
the buffer into the right region before it can be scanned out. And that's
generally done with a copy engine, for performance reasons.

But that copy engine is really just a very dumb (but fast!) memcpy, and
doesn't do any format conversion or stride/orientation changes like a
full-blown blitter engine (or mem2mem in v4l speak) can do.

So if it's really just memory management then I think it's fine, but
anything beyond that is a no imo.

Now for an overall full-featured stack we clearly need that, and it would
be great if there's some common userspace libraries for hosting such code.
But thus far all attempts have fallen short :-/ Which I guess is another
indicator that we really shouldn't try to solve this problem in a generic
fashion, and hence really shouldn't try to solve it with magic behind the
generic kms interface in the kernel.

For even more context I do think my old "why is 2d so hard" blogpost rant
still applies:

https://blog.ffwll.ch/2018/08/no-2d-in-drm.html

The "why no 2d api for the more limited problem of handling framebuffers"
is really just a small, but not any less complex, subset of that bigger
conundrum.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
