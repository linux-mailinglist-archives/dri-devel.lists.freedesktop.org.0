Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A36367E1E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 11:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84666EA64;
	Thu, 22 Apr 2021 09:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592EC6E073
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 09:49:47 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s7so44044268wru.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 02:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1tSmh46F66x3ZMfF4P2Jo4ciW4LOkmzVxDUu/LcbcR8=;
 b=DtzsAVcX+D6cS9PqSx9xmssWTGZYIw8a8GhSpgWYAvZnviGK4Qbe3yAKoUySGbr3QT
 RG/nx+ceopUNY6kf8wLEmAbAE5/3k30uKfjzBqJD2v2+qs3e+eazYjqSHlLlygsV59xv
 mRmV3YGkof+L2LtYe6rjGfnGFMrrvdb3fnAh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1tSmh46F66x3ZMfF4P2Jo4ciW4LOkmzVxDUu/LcbcR8=;
 b=XsZjDiaAr/QPZia8GDZHEi3J3PZ1K6R5i9IKTaL0II+vCksLzUrXpy2B6YkT4Ce49u
 +pN6XTxvUxEungsc9IzUv6jg2Qx4pl9qZAHSD17DDlEwdeWsoEXsrHJl3y7JP3mizfFX
 ktWsPlmigwVjB+kbiQbFj3bh22K8bHo+TBzC3wO3rSKjLclx10mMGU2Q7xhSXk4hgMoO
 UQ7O+nQCOvyvmMyuv9rh+CqIZ3etuzdC5wSYQ4HCVcVOyex1YICnAMl1gVG7HPcb3I3U
 klgSU4QrtiTHSMtZpZBOxyyGCG6eHjw8EvyN2Nm24nxswippqrYKOYzkqoyJCfki/gif
 7IAw==
X-Gm-Message-State: AOAM530rVMoplMYOVCcxthx1/rtskUuRGFtw80tFpLzQze5WB3vf9g4S
 B6czLXvnWl6LHHoRX5A9spvX8g==
X-Google-Smtp-Source: ABdhPJy8nDw8FbCNzvK0ud/GMezmTOrw0/YCJKC81A/JTwkQwfslRk9UR0lD7t3GlxsM4S221eDqjw==
X-Received: by 2002:a5d:4682:: with SMTP id u2mr3050340wrq.167.1619084986185; 
 Thu, 22 Apr 2021 02:49:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b206sm2455570wmc.15.2021.04.22.02.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 02:49:45 -0700 (PDT)
Date: Thu, 22 Apr 2021 11:49:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Rewrite CL/CTG L-shaped memory
 detection
Message-ID: <YIFGt+I8LMckYyVG@phenom.ffwll.local>
References: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
 <20210421153401.13847-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421153401.13847-5-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 06:34:01PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Currently we try to detect a symmetric memory configurations
> using a magic DCC2_MODIFIED_ENHANCED_DISABLE bit. That bit is
> either only set on a very specific subset of machines or it
> just does not exist (it's not mentioned in any public chipset
> datasheets I've found). As it happens my CL/CTG machines never
> set said bit, even if I populate the channels with identical
> sticks.
> =

> So let's do the L-shaped memory detection the same way as the
> desktop variants, ie. just look at the DRAM rank boundary
> registers to see if both channels have an identical size.
> =

> With this my CL/CTG no longer claim L-shaped memory when I use
> identical sticks. Also tested with non-matching sticks just to
> make sure the L-shaped memory is still properly detected.
> =

> And for completeness let's update the debugfs code to dump
> the correct set of registers on each platform.
> =

> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Did you check this with the swapping igt? I have some vague memories of
bug reports where somehow the machine was acting like it's L-shaped memory
despite that banks were populated equally. I've iirc tried all kinds of
tricks to figure it out, all to absolutely no avail.

tbh I'd just not touch this, not really worth it.
-Daniel
> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 15 ++++++++-------
>  drivers/gpu/drm/i915/i915_debugfs.c          | 16 ++++++++++++----
>  drivers/gpu/drm/i915/i915_reg.h              |  4 ++++
>  3 files changed, 24 insertions(+), 11 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/d=
rm/i915/gt/intel_ggtt_fencing.c
> index 0fa6c38893f7..754f20768de5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> @@ -693,14 +693,15 @@ static void detect_bit_6_swizzle(struct i915_ggtt *=
ggtt)
>  				swizzle_x =3D I915_BIT_6_SWIZZLE_9_10_17;
>  				swizzle_y =3D I915_BIT_6_SWIZZLE_9_17;
>  			}
> -			break;
> -		}
>  =

> -		/* check for L-shaped memory aka modified enhanced addressing */
> -		if (IS_GEN(i915, 4) &&
> -		    !(intel_uncore_read(uncore, DCC2) & DCC2_MODIFIED_ENHANCED_DISABLE=
)) {
> -			swizzle_x =3D I915_BIT_6_SWIZZLE_UNKNOWN;
> -			swizzle_y =3D I915_BIT_6_SWIZZLE_UNKNOWN;
> +			/* check for L-shaped memory aka modified enhanced addressing */
> +			if (IS_GEN(i915, 4) &&
> +			    intel_uncore_read16(uncore, C0DRB3_CL) !=3D
> +			    intel_uncore_read16(uncore, C1DRB3_CL)) {
> +				swizzle_x =3D I915_BIT_6_SWIZZLE_UNKNOWN;
> +				swizzle_y =3D I915_BIT_6_SWIZZLE_UNKNOWN;
> +			}
> +			break;
>  		}
>  =

>  		if (dcc =3D=3D 0xffffffff) {
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i=
915_debugfs.c
> index 8dd374691102..6de11ffcde38 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -621,10 +621,18 @@ static int i915_swizzle_info(struct seq_file *m, vo=
id *data)
>  			   intel_uncore_read(uncore, DCC));
>  		seq_printf(m, "DDC2 =3D 0x%08x\n",
>  			   intel_uncore_read(uncore, DCC2));
> -		seq_printf(m, "C0DRB3 =3D 0x%04x\n",
> -			   intel_uncore_read16(uncore, C0DRB3_BW));
> -		seq_printf(m, "C1DRB3 =3D 0x%04x\n",
> -			   intel_uncore_read16(uncore, C1DRB3_BW));
> +
> +		if (IS_G45(dev_priv) || IS_I965G(dev_priv) || IS_G33(dev_priv)) {
> +			seq_printf(m, "C0DRB3 =3D 0x%04x\n",
> +				   intel_uncore_read16(uncore, C0DRB3_BW));
> +			seq_printf(m, "C1DRB3 =3D 0x%04x\n",
> +				   intel_uncore_read16(uncore, C1DRB3_BW));
> +		} else if (IS_GEN(dev_priv, 4)) {
> +			seq_printf(m, "C0DRB3 =3D 0x%04x\n",
> +				   intel_uncore_read16(uncore, C0DRB3_CL));
> +			seq_printf(m, "C1DRB3 =3D 0x%04x\n",
> +				   intel_uncore_read16(uncore, C1DRB3_CL));
> +		}
>  	} else if (INTEL_GEN(dev_priv) >=3D 6) {
>  		seq_printf(m, "MAD_DIMM_C0 =3D 0x%08x\n",
>  			   intel_uncore_read(uncore, MAD_DIMM_C0));
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index 0587b2455ea1..055c258179a1 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -3790,6 +3790,10 @@ static inline bool i915_mmio_reg_valid(i915_reg_t =
reg)
>  #define C0DRB3_BW		_MMIO(MCHBAR_MIRROR_BASE + 0x206)
>  #define C1DRB3_BW		_MMIO(MCHBAR_MIRROR_BASE + 0x606)
>  =

> +/* 965gm,ctg DRAM channel configuration */
> +#define C0DRB3_CL		_MMIO(MCHBAR_MIRROR_BASE + 0x1206)
> +#define C1DRB3_CL		_MMIO(MCHBAR_MIRROR_BASE + 0x1306)
> +
>  /* snb MCH registers for reading the DRAM channel configuration */
>  #define MAD_DIMM_C0			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5004)
>  #define MAD_DIMM_C1			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5008)
> -- =

> 2.26.3
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
