Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D200136C160
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 10:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AE86E060;
	Tue, 27 Apr 2021 08:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E79E6E1D5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 08:58:11 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h15so6372432wre.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uiVElGJmqHoDec1xU4aC/Gm7QylBUdQxbqaRnAOmmn8=;
 b=UeM0iisAJHnPxfHVhZ82VOwTNV4KlB0z3tjTtc0hz5zEIiJlNy2237siLcbNC4BPt+
 pUFLPDVJWRGNkFSs/5lKXIVM5QVAhhm/XYj4xJ6k/P9WC2Y6wlSQZTOxRY3dj7u7pHek
 MY1/xEEZjhfd0btGptFlvg7bc5sbUvmj+xN6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uiVElGJmqHoDec1xU4aC/Gm7QylBUdQxbqaRnAOmmn8=;
 b=KlEXvdFQ+vo43Oj1ydjT5MT65HMFz7klOS6iBt/84qaQtF/5hh+510H8t6VFT+uOyT
 oUQ6xFClucW1fXXrVrocJWul43aMmtazzuAmcJKR68UZXUOnLOJps5esyL1/lGG8dr8d
 91Bo+FSQwmxJ8cUPqPt2FDShxWxBJdNQikdF6HowBC/+66P1/+LtOw9MtdcXl4QZn6Wo
 eecMqZGsdBjFl0KQBv9y2hQPLTuNrqJpIWmbY6o4/DUq1j/0SUlpDgWUXCBtR2ubNOhD
 6UhWSDU5Fv9hwjC6YhP1fVejMz9ApPyzyyhjjktGNPGF5q1vkjKIathCbYxlpX+rYzJq
 WRUA==
X-Gm-Message-State: AOAM530d6GfP4Tyuw+p662/yE2bTjozF1Rq+ofY4ZOQvmqoZb+802r1V
 zp9brSRtXm4qIsaHl9Zf9a/NEg==
X-Google-Smtp-Source: ABdhPJyDg9yWK4AbqFd2z88jhTgVNGU6B0OfYf6CTnRcFnSuf5zDRlIQQpypr5rKv3Jy4kv3lzdD+g==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr27880657wrs.330.1619513889757; 
 Tue, 27 Apr 2021 01:58:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f22sm10732851wmj.42.2021.04.27.01.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 01:58:09 -0700 (PDT)
Date: Tue, 27 Apr 2021 10:58:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Rewrite CL/CTG L-shaped memory
 detection
Message-ID: <YIfSH/PWf2ZnOnOr@phenom.ffwll.local>
References: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
 <20210421153401.13847-5-ville.syrjala@linux.intel.com>
 <YIFGt+I8LMckYyVG@phenom.ffwll.local> <YIF1+mhbWO7UD/yN@intel.com>
 <YIblm7BAj6fnQiq+@phenom.ffwll.local> <YIb178CssrxSSSk6@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIb178CssrxSSSk6@intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 08:18:39PM +0300, Ville Syrj=E4l=E4 wrote:
> On Mon, Apr 26, 2021 at 06:08:59PM +0200, Daniel Vetter wrote:
> > On Thu, Apr 22, 2021 at 04:11:22PM +0300, Ville Syrj=E4l=E4 wrote:
> > > On Thu, Apr 22, 2021 at 11:49:43AM +0200, Daniel Vetter wrote:
> > > > On Wed, Apr 21, 2021 at 06:34:01PM +0300, Ville Syrjala wrote:
> > > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > =

> > > > > Currently we try to detect a symmetric memory configurations
> > > > > using a magic DCC2_MODIFIED_ENHANCED_DISABLE bit. That bit is
> > > > > either only set on a very specific subset of machines or it
> > > > > just does not exist (it's not mentioned in any public chipset
> > > > > datasheets I've found). As it happens my CL/CTG machines never
> > > > > set said bit, even if I populate the channels with identical
> > > > > sticks.
> > > > > =

> > > > > So let's do the L-shaped memory detection the same way as the
> > > > > desktop variants, ie. just look at the DRAM rank boundary
> > > > > registers to see if both channels have an identical size.
> > > > > =

> > > > > With this my CL/CTG no longer claim L-shaped memory when I use
> > > > > identical sticks. Also tested with non-matching sticks just to
> > > > > make sure the L-shaped memory is still properly detected.
> > > > > =

> > > > > And for completeness let's update the debugfs code to dump
> > > > > the correct set of registers on each platform.
> > > > > =

> > > > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > =

> > > > Did you check this with the swapping igt? I have some vague memorie=
s of
> > > > bug reports where somehow the machine was acting like it's L-shaped=
 memory
> > > > despite that banks were populated equally. I've iirc tried all kind=
s of
> > > > tricks to figure it out, all to absolutely no avail.
> > > =

> > > Did you have a specific test in mind? I ran a bunch of things
> > > that seemed swizzle related. All passed just fine.
> > =

> > gem_tiled_swapping should be the one. It tries to cycle your entire sys=
tem
> > memory through tiled buffers into swap and out of it.
> =

> Passes with symmetric config, fails with L-shaped config (if I hack
> out the L-shape detection of course). So seems pretty solid.
> =

> A kernel based self test that looks at the physical address would
> still be nice I suppose. Though depending on the size of your RAM
> sticks figuring out where exactly the switchover from two channels
> to one channels happens probably requires a bit of work due to
> the PCI hole/etc.
> =

> Both my cl and ctg report this btw:
>  bit6 swizzle for X-tiling =3D bit9/bit10/bit11
>  bit6 swizzle for Y-tiling =3D bit9/bit11
> so unfortunately can't be sure the other swizzle modes would be
> correctly detected.

I think testing-wise this is as good as it gets.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
