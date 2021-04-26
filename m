Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF5D36B682
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 18:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7666E84D;
	Mon, 26 Apr 2021 16:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1936E849
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 16:09:03 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m9so43724159wrx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 09:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=E+mHAInWmbrQo9QXL3PF/VKL1eGyA5adx/6sf3p1QaA=;
 b=V+mpC32PGYVK3yBkROS6PzN2GW3EPmguv/gaAlCzFifycLDkftldUQWeweKJo/1wv7
 PXE6CFCzsXmUU3JFJu7T6e6XhhOam9XpeKdmX//VJXsMoiEsSNelIANTeC7fT450bvQH
 /Pp9oRHOEeL1ehJyaaTF0eUSmvtXr3yl+9n6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=E+mHAInWmbrQo9QXL3PF/VKL1eGyA5adx/6sf3p1QaA=;
 b=QkxBYeIZV7M+noJe7k+S9xux+FBGocij9I+7xIcZ6aYK9enT1c4c7pv70Fhb0XoZhB
 cLHgKfHxSNS6RxjwAP7PhMtSetX6MXed+b0cbQByS44llFP3vm+1GBsms8/yWz3tXvuT
 iyP32f+4exgfXWEV9ts3YFOi58+V7zmgesHi/hlpWYjnPfe1Sj4vRXfikEMZNf2Kj+1a
 jgmQcRMWxWrWoNgWVhnzHnzPh2LE8enO/XZ+RRP6sGleeSYkZSi4QLGmzyyjtxkE+lYJ
 /qABMsCiPRjhF/n4+J64ln2bMxey1/hGigIJh76NsRXpXBLPG2Q2FKGGyFV3dz15Fi1o
 5NrQ==
X-Gm-Message-State: AOAM5327Jz6e7NUaToXQgBzdTH3ynfk6ZAObP5ByIkP4uK+MeOUlhBuH
 qGngqnC8Kqy3KhIQRFJ5hLMahA==
X-Google-Smtp-Source: ABdhPJzXDkZyI1QsusCP/9E2gcMwH99XR+Gk+JAuZtxeG2VLOsmtkG8ZLfZZknZqIbcjwCfpNWq5Ig==
X-Received: by 2002:adf:fdca:: with SMTP id i10mr23820626wrs.55.1619453342274; 
 Mon, 26 Apr 2021 09:09:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c18sm566244wrn.92.2021.04.26.09.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 09:09:01 -0700 (PDT)
Date: Mon, 26 Apr 2021 18:08:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Rewrite CL/CTG L-shaped memory
 detection
Message-ID: <YIblm7BAj6fnQiq+@phenom.ffwll.local>
References: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
 <20210421153401.13847-5-ville.syrjala@linux.intel.com>
 <YIFGt+I8LMckYyVG@phenom.ffwll.local> <YIF1+mhbWO7UD/yN@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIF1+mhbWO7UD/yN@intel.com>
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

On Thu, Apr 22, 2021 at 04:11:22PM +0300, Ville Syrj=E4l=E4 wrote:
> On Thu, Apr 22, 2021 at 11:49:43AM +0200, Daniel Vetter wrote:
> > On Wed, Apr 21, 2021 at 06:34:01PM +0300, Ville Syrjala wrote:
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > =

> > > Currently we try to detect a symmetric memory configurations
> > > using a magic DCC2_MODIFIED_ENHANCED_DISABLE bit. That bit is
> > > either only set on a very specific subset of machines or it
> > > just does not exist (it's not mentioned in any public chipset
> > > datasheets I've found). As it happens my CL/CTG machines never
> > > set said bit, even if I populate the channels with identical
> > > sticks.
> > > =

> > > So let's do the L-shaped memory detection the same way as the
> > > desktop variants, ie. just look at the DRAM rank boundary
> > > registers to see if both channels have an identical size.
> > > =

> > > With this my CL/CTG no longer claim L-shaped memory when I use
> > > identical sticks. Also tested with non-matching sticks just to
> > > make sure the L-shaped memory is still properly detected.
> > > =

> > > And for completeness let's update the debugfs code to dump
> > > the correct set of registers on each platform.
> > > =

> > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Did you check this with the swapping igt? I have some vague memories of
> > bug reports where somehow the machine was acting like it's L-shaped mem=
ory
> > despite that banks were populated equally. I've iirc tried all kinds of
> > tricks to figure it out, all to absolutely no avail.
> =

> Did you have a specific test in mind? I ran a bunch of things
> that seemed swizzle related. All passed just fine.

gem_tiled_swapping should be the one. It tries to cycle your entire system
memory through tiled buffers into swap and out of it.
-Daniel

> =

> Chris did have similar concerns and suggested we should have
> better tests. I guess what I should try to do is some selftests
> which make sure we test both high and low physical addresses
> and check the swizzle pattern is as expected. But haven't =

> found the time to do that yet.
> =

> > =

> > tbh I'd just not touch this, not really worth it.
> =

> It's totally worth it to get gen4 machines working again.
> =

> =

> > -Daniel
> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 15 ++++++++-------
> > >  drivers/gpu/drm/i915/i915_debugfs.c          | 16 ++++++++++++----
> > >  drivers/gpu/drm/i915/i915_reg.h              |  4 ++++
> > >  3 files changed, 24 insertions(+), 11 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/g=
pu/drm/i915/gt/intel_ggtt_fencing.c
> > > index 0fa6c38893f7..754f20768de5 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> > > @@ -693,14 +693,15 @@ static void detect_bit_6_swizzle(struct i915_gg=
tt *ggtt)
> > >  				swizzle_x =3D I915_BIT_6_SWIZZLE_9_10_17;
> > >  				swizzle_y =3D I915_BIT_6_SWIZZLE_9_17;
> > >  			}
> > > -			break;
> > > -		}
> > >  =

> > > -		/* check for L-shaped memory aka modified enhanced addressing */
> > > -		if (IS_GEN(i915, 4) &&
> > > -		    !(intel_uncore_read(uncore, DCC2) & DCC2_MODIFIED_ENHANCED_DIS=
ABLE)) {
> > > -			swizzle_x =3D I915_BIT_6_SWIZZLE_UNKNOWN;
> > > -			swizzle_y =3D I915_BIT_6_SWIZZLE_UNKNOWN;
> > > +			/* check for L-shaped memory aka modified enhanced addressing */
> > > +			if (IS_GEN(i915, 4) &&
> > > +			    intel_uncore_read16(uncore, C0DRB3_CL) !=3D
> > > +			    intel_uncore_read16(uncore, C1DRB3_CL)) {
> > > +				swizzle_x =3D I915_BIT_6_SWIZZLE_UNKNOWN;
> > > +				swizzle_y =3D I915_BIT_6_SWIZZLE_UNKNOWN;
> > > +			}
> > > +			break;
> > >  		}
> > >  =

> > >  		if (dcc =3D=3D 0xffffffff) {
> > > diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i9=
15/i915_debugfs.c
> > > index 8dd374691102..6de11ffcde38 100644
> > > --- a/drivers/gpu/drm/i915/i915_debugfs.c
> > > +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> > > @@ -621,10 +621,18 @@ static int i915_swizzle_info(struct seq_file *m=
, void *data)
> > >  			   intel_uncore_read(uncore, DCC));
> > >  		seq_printf(m, "DDC2 =3D 0x%08x\n",
> > >  			   intel_uncore_read(uncore, DCC2));
> > > -		seq_printf(m, "C0DRB3 =3D 0x%04x\n",
> > > -			   intel_uncore_read16(uncore, C0DRB3_BW));
> > > -		seq_printf(m, "C1DRB3 =3D 0x%04x\n",
> > > -			   intel_uncore_read16(uncore, C1DRB3_BW));
> > > +
> > > +		if (IS_G45(dev_priv) || IS_I965G(dev_priv) || IS_G33(dev_priv)) {
> > > +			seq_printf(m, "C0DRB3 =3D 0x%04x\n",
> > > +				   intel_uncore_read16(uncore, C0DRB3_BW));
> > > +			seq_printf(m, "C1DRB3 =3D 0x%04x\n",
> > > +				   intel_uncore_read16(uncore, C1DRB3_BW));
> > > +		} else if (IS_GEN(dev_priv, 4)) {
> > > +			seq_printf(m, "C0DRB3 =3D 0x%04x\n",
> > > +				   intel_uncore_read16(uncore, C0DRB3_CL));
> > > +			seq_printf(m, "C1DRB3 =3D 0x%04x\n",
> > > +				   intel_uncore_read16(uncore, C1DRB3_CL));
> > > +		}
> > >  	} else if (INTEL_GEN(dev_priv) >=3D 6) {
> > >  		seq_printf(m, "MAD_DIMM_C0 =3D 0x%08x\n",
> > >  			   intel_uncore_read(uncore, MAD_DIMM_C0));
> > > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i=
915_reg.h
> > > index 0587b2455ea1..055c258179a1 100644
> > > --- a/drivers/gpu/drm/i915/i915_reg.h
> > > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > > @@ -3790,6 +3790,10 @@ static inline bool i915_mmio_reg_valid(i915_re=
g_t reg)
> > >  #define C0DRB3_BW		_MMIO(MCHBAR_MIRROR_BASE + 0x206)
> > >  #define C1DRB3_BW		_MMIO(MCHBAR_MIRROR_BASE + 0x606)
> > >  =

> > > +/* 965gm,ctg DRAM channel configuration */
> > > +#define C0DRB3_CL		_MMIO(MCHBAR_MIRROR_BASE + 0x1206)
> > > +#define C1DRB3_CL		_MMIO(MCHBAR_MIRROR_BASE + 0x1306)
> > > +
> > >  /* snb MCH registers for reading the DRAM channel configuration */
> > >  #define MAD_DIMM_C0			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5004)
> > >  #define MAD_DIMM_C1			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5008)
> > > -- =

> > > 2.26.3
> > > =

> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > =

> > -- =

> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> =

> -- =

> Ville Syrj=E4l=E4
> Intel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
