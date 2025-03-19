Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28A5A68DBD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 14:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BA910E309;
	Wed, 19 Mar 2025 13:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iYreXMEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3256310E356;
 Wed, 19 Mar 2025 13:25:59 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-22401f4d35aso128342395ad.2; 
 Wed, 19 Mar 2025 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742390759; x=1742995559; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8nV8V6naseGogksjahvS3uLXhTv8c4v5cDCu9vdP9cg=;
 b=iYreXMEFd2vb+T2nT/EYaW+ST25LxNRzoIhBlbnmqewdDLollJ461vQV4PzNeIS9SF
 p1SdyoLKXFLTOwqEsFNKnP3mPKujT/tlfbRbdTidknKIyJQOqvYY6QkSVciTWQob+T67
 AoWLlG9SRjccJcgEdHhRy1tBLjzQIa+uz3e7KDTC2NWGxJs06ALDRZJAaEYktkPD4kxK
 R5ULpsPJIBBhzQblKEew7xHZrcqtAYliD6CUiiE1SzARnQe27kvU0LFMSJvdb1WyVCbB
 NoOusgZ7tk0tKu7U9vZzT1tAy8aNCUKncZ9g6QFNJuCalYYP++X8VvjqBhFsBhK3P1bp
 /X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742390759; x=1742995559;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8nV8V6naseGogksjahvS3uLXhTv8c4v5cDCu9vdP9cg=;
 b=t6NOdKOiN/bK1IUxoVm/h2MNXLtUoo1X3ctSWtUl9RyBY0UcYF+3250pIuP3znKBAj
 pxkx7iJj/cD3Nj0q/BLKVV2qkzbckPzc1R7Kbq5au7HjY46ZxEyKclXBCgD7abwWuVYR
 Slx8cM6j5rbRCl3cFTL7axSWYpdmpN0p15Z8dmZTDaGqxT2CAOd9DYcoDh5STUoJpLD8
 nXTQ4B8cxbi+WHXmcRx5T/giWv7IibEyFGwB9dUFWiKJUhSXvakUyQjYNP2ps/2YHnGu
 pvDVF9zRJBbCEC8O4upl433LgSdCUzcKjEcVVheWO4NesPix8zrElKt9kASwhig4Y91w
 xr+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcR75a/H3UM15P5K+HS/zZmojaMqgmsEmoMDvBwnjY3x45uYGpYIO/BJKG2hntI2/1MKzQ7Pd1XoE=@lists.freedesktop.org,
 AJvYcCW/RC2lIgsazd/tFNpnyFjS/5Hc95fdohC2Tldq0o1Ybe6Vm/EGhMKU+Qx3uqB4GHDos0jm4AmQPf7J@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQSYx7phT2UhXNNbrjK2WX7XR849W28nGe1WKoId4uV3RfjXdw
 LjsQM3VDfCSaXuXx0UFqT5K7VeELBZxGkDkMgSA1bR9ICdKnVzQj
X-Gm-Gg: ASbGnctRSL12DZ1qq12h9NXizGlDj4MJv5pEsXeSqOAokaGTmhtvtwe0VJQfayTZ3tL
 Dcmh+eFk8PbPG5HnMVR3c5rP0G04i90gVYnOHyQUkzPLFzVAbw4rhHBnht/i+E5ywbYyBW7/S70
 4UZGpw7D+OPIzxIsMdgeL36JwH5XC4yVEf8ezIpg4rXK95s6V+dIklokagyqFK9iXHlDV0nr9Cs
 uSkgfg7VgE/T1KrrY9QdRK9sm+DqsQpdh5H11IvjM5zvI3XRM8jNbe8JneR32GIB8m6INbZ79xK
 kjBiLxUpQwwMl2i3IEDYJxm5VhSDjUQmQan0KHIhd0nsCkj1u/rRimkVrnDr4wYVe3WB
X-Google-Smtp-Source: AGHT+IFV2ihVKDX+XILsEqqrYfSi5Q031FRnJSnqfNW/LjeoWGfZnrGB6aQNMBwZdy8dsB7j8Hx6PQ==
X-Received: by 2002:a05:6a20:2d0c:b0:1f0:e706:1370 with SMTP id
 adf61e73a8af0-1fbed7f0e92mr5249359637.35.1742390758515; 
 Wed, 19 Mar 2025 06:25:58 -0700 (PDT)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-737115293f6sm11928000b3a.14.2025.03.19.06.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 06:25:57 -0700 (PDT)
Date: Wed, 19 Mar 2025 09:25:56 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v6 4/7] drm/i915: Convert REG_GENMASK*() to fixed-width
 GENMASK_U*()
Message-ID: <Z9rF5JFcEW2DOtcr@thinkpad>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-4-f59315e73c29@wanadoo.fr>
 <Z9mqUZX4H-CzqbW4@thinkpad> <87ldt2c6lz.fsf@intel.com>
 <f6885fdb-4361-428c-b6dd-54cd2ac7904d@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6885fdb-4361-428c-b6dd-54cd2ac7904d@wanadoo.fr>
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

On Wed, Mar 19, 2025 at 01:37:32PM +0900, Vincent Mailhol wrote:
> On 19/03/2025 at 07:32, Jani Nikula wrote:
> > On Tue, 18 Mar 2025, Yury Norov <yury.norov@gmail.com> wrote:
> >> On Sat, Mar 08, 2025 at 01:48:51AM +0900, Vincent Mailhol via B4 Relay wrote:
> >>> From: Lucas De Marchi <lucas.demarchi@intel.com>
> >>>
> >>> Now that include/linux/bits.h implements fixed-width GENMASK_U*(), use
> >>> them to implement the i915/xe specific macros. Converting each driver
> >>> to use the generic macros are left for later, when/if other
> >>> driver-specific macros are also generalized.
> >>>
> >>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >>> Acked-by: Jani Nikula <jani.nikula@intel.com>
> >>> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >>> ---
> >>> Changelog:
> >>>
> >>>   v5 -> v6:
> >>>
> >>>     - No changes.
> >>>
> >>>   v4 -> v5:
> >>>
> >>>     - Add braket to macro names in patch description,
> >>>       e.g. 'REG_GENMASK*' -> 'REG_GENMASK*()'
> >>>
> >>>   v3 -> v4:
> >>>
> >>>     - Remove the prefixes in macro parameters,
> >>>       e.g. 'REG_GENMASK(__high, __low)' -> 'REG_GENMASK(high, low)'
> >>> ---
> >>>  drivers/gpu/drm/i915/i915_reg_defs.h | 108 ++++-------------------------------
> >>>  1 file changed, 11 insertions(+), 97 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
> >>> index e251bcc0c89f5710125bc70f07851b2cb978c89c..39e5ed9511174b8757b9201bff735fa362651b34 100644
> >>> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> >>> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> >>> @@ -9,76 +9,19 @@
> >>>  #include <linux/bitfield.h>
> >>>  #include <linux/bits.h>
> >>>  
> >>> -/**
> >>> - * REG_BIT() - Prepare a u32 bit value
> >>> - * @__n: 0-based bit number
> >>> - *
> >>> - * Local wrapper for BIT() to force u32, with compile time checks.
> >>> - *
> >>> - * @return: Value with bit @__n set.
> >>> +/*
> >>> + * Wrappers over the generic BIT_* and GENMASK_* implementations,
> >>> + * for compatibility reasons with previous implementation
> >>>   */
> >>> -#define REG_BIT(__n)							\
> >>> -	((u32)(BIT(__n) +						\
> >>> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&		\
> >>> -				 ((__n) < 0 || (__n) > 31))))
> >>> +#define REG_GENMASK(high, low)		GENMASK_U32(high, low)
> >>> +#define REG_GENMASK64(high, low)	GENMASK_U64(high, low)
> >>> +#define REG_GENMASK16(high, low)	GENMASK_U16(high, low)
> >>> +#define REG_GENMASK8(high, low)		GENMASK_U8(high, low)
> >>
> >> Nit. Maybe just
> >>
> >>  #define REG_GENMASK		GENMASK_U32
> > 
> > Please just keep it as it is for clarity.
> 
> I also prefer when the argument is clearly displayed. It shows at first
> glance that this is a function-like macro and reminds of the correct
> order of the argument without having to look at the definitions in
> bits.h. It also allows for people to grep "#define REG_GENMASK(" in
> order to find the macro definition.
> 
> To be honest, I don't have a strong opinion either, but because Jani
> also prefers it this way, I will keep as-is.

Please go with the original version. It was just a minor nitpick.
