Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D95A682E3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 02:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DDB10E216;
	Wed, 19 Mar 2025 01:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hHTqU99f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2A310E216;
 Wed, 19 Mar 2025 01:47:01 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2241053582dso25179545ad.1; 
 Tue, 18 Mar 2025 18:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742348821; x=1742953621; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mQazujB/9yd1yOfFaq3YxlrN7+iuxbijBpN0gJtM4vU=;
 b=hHTqU99fAef0XdZUrBp/UBkhrldTWh1mfonBIZIsyjkLLLeUm4Hk6qRnEj+ZYnBLVG
 I8s/DAVzW0tJWsVZvs1Go47Oa9thqroJjlRA+blx2c5z/tvhqZyAD5zmm+wHkPd/feJ/
 eMqNFY1+fttQ6qX8eke271H9xNByJEfngfDZUwOg/VvIq3z3Z0byL2dCrDEPAUT2gfZW
 vcZ9xkNhE+TVd04MbpznTCnArDTRMCmLqI9nU4jmBXh/POXCCqL80NTox72QCGqlZI7s
 R8WMJPwNhRBo58vDMG6MNC9+vve7AFoXvG8l5vd77Asx+jKDKap/t4T/cP4LGpkFhVt2
 09Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742348821; x=1742953621;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQazujB/9yd1yOfFaq3YxlrN7+iuxbijBpN0gJtM4vU=;
 b=AHS3msoNMvxc6o6PliRgAtJF39IZJfvEV2vW/fnu3M/pzihB+T3D1Fgjl3idbN0CRi
 pTYtvLWMeANVU0whiyJpfaImY+1Rx6KPxV6A5DSuY75vFQwCSOt1X95C32GbPwTxP2L2
 OfjnEgK1uzT6auDJJOhsjQqTjbt0o44ETUXTffJr85mkXjsKonsyedlg/xh5vJUmoblq
 qiS1c/67nKwLjX+eLFXLhYxMT/rM4V+f4LgJ0yH0P26DQUDCtIYgo5ZiT+RCkMW7z4Dw
 g/pZzjTgU+yRWEKUkRk6xhYaOqcFXwZ8K1xi/loqnsrRhYFqO3S98ZTWMVGPIeiigSJa
 5ZmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmYJ7+wRZXgFpx/wb0yq89wqLahDMgqwX925OTLKtP0wXg32T26727HHyVsTEq9W2gIw+cFah//58=@lists.freedesktop.org,
 AJvYcCVn/1IGLTC5WFpV781rPDStbPRSjD7qoyqMc3fOyqT4KCg5b5YD2HZ4w7kMwcd49QnSSZpnjhC6exx0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCdC2AcMficMFM1nJInRLuv0RbFyC95/gg+h6EcuAayzxin+5W
 YeapO24FXjrZABsC0wsMDpLmuBhDtziO0P5RjFS19LMm+Dg/wZiM8cQpkoIw
X-Gm-Gg: ASbGncsa4sEjk4JtaDGYQapor0rscIVXKK1Uh4UpeexAy7c3LTieiJ1NKXxZ8+Qa0R7
 fMdFxj5zvtElVp7FpEvOa5+YSIZxu4gIzwy8kcFCkwtCPJgDBKSt3DiomKDs3TBSerGlisV1riD
 pFRalwurePPNZRTel9CkRdABIfqhXYd6GGo+WvnGY4/qKhqhJC/h+Z8Ura2yF++p/9mHtkj5VXu
 5m6IGSxYgIZbkzwGjC+vCymG+F0ZVIYqOLNqkMy7Hy/PQBAQtfQrZpZYtArTWGatcZvMWE0fxt/
 Ec1cNt1TmjoptyAY2fqeDiAxfrnfjkH8sIjDOsD0+lvA0aXxcYwQ5UkVDxzkgbWeQHmL
X-Google-Smtp-Source: AGHT+IF0XB8fhv1p95uLw69R18eSu0Lwf8G2N3t1RKmk5WXiiexOrAeRINEjNr/ltlJBTDEzGkPmkg==
X-Received: by 2002:a17:902:e803:b0:21f:74ec:1ff0 with SMTP id
 d9443c01a7336-22649a67f76mr13801815ad.32.1742348821049; 
 Tue, 18 Mar 2025 18:47:01 -0700 (PDT)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6888486sm101601915ad.11.2025.03.18.18.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 18:47:00 -0700 (PDT)
Date: Tue, 18 Mar 2025 21:46:58 -0400
From: Yury Norov <yury.norov@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
Message-ID: <Z9oiEkQEcHhA0a80@thinkpad>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
 <Z8hsRJvpjYoqh9RG@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8hsRJvpjYoqh9RG@thinkpad>
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

+ Catalin Marinas, ARM maillist

Hi Catalin and everyone,

Anshuman Khandual asked me to merge GENMASK_U128() saying it's
important for ARM to stabilize API. While it's a dead code, I
accepted his patch as he promised to add users shortly.

Now it's more than half a year since that. There's no users,
and no feedback from Anshuman.

Can you please tell if you still need the macro? I don't want to
undercut your development, but if you don't need 128-bit genmasks
there's no reason to have a dead code in the uapi.

Thanks,
Yury

On Wed, Mar 05, 2025 at 10:22:47AM -0500, Yury Norov wrote:
> + Anshuman Khandual <anshuman.khandual@arm.com>
> 
> Anshuman,
> 
> I merged your GENMASK_U128() because you said it's important for your
> projects, and that it will get used in the kernel soon.
> 
> Now it's in the kernel for more than 6 month, but no users were added.
> Can you clarify if you still need it, and if so why it's not used?
> 
> As you see, people add another fixed-types GENMASK() macros, and their
> implementation differ from GENMASK_U128().
> 
> My second concern is that __GENMASK_U128() is declared in uapi, while
> the general understanding for other fixed-type genmasks is that they
> are not exported to users. Do you need this macro to be exported to
> userspace? Can you show how and where it is used there?
> 
> Thanks,
> Yury
> 
> 
> On Wed, Mar 05, 2025 at 10:00:15PM +0900, Vincent Mailhol via B4 Relay wrote:
> > From: Yury Norov <yury.norov@gmail.com>
> > 
> > Add __GENMASK_t() which generalizes __GENMASK() to support different
> > types, and implement fixed-types versions of GENMASK() based on it.
> > The fixed-type version allows more strict checks to the min/max values
> > accepted, which is useful for defining registers like implemented by
> > i915 and xe drivers with their REG_GENMASK*() macros.
> > 
> > The strict checks rely on shift-count-overflow compiler check to fail
> > the build if a number outside of the range allowed is passed.
> > Example:
> > 
> > 	#define FOO_MASK GENMASK_U32(33, 4)
> > 
> > will generate a warning like:
> > 
> > 	../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
> > 	   41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
> > 	      |                               ^~
> > 
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > ---
> > Changelog:
> > 
> >   v3 -> v4:
> > 
> >     - The v3 is one year old. Meanwhile people started using
> >       __GENMASK() directly. So instead of generalizing __GENMASK() to
> >       support different types, add a new GENMASK_t().
> > 
> >     - replace ~0ULL by ~_ULL(0). Otherwise, __GENMASK_t() would fail
> >       in asm code.
> > 
> >     - Make GENMASK_U8() and GENMASK_U16() return an unsigned int. In
> >       v3, due to the integer promotion rules, these were returning a
> >       signed integer. By casting these to unsigned int, at least the
> >       signedness is kept.
> > ---
> >  include/linux/bitops.h |  1 -
> >  include/linux/bits.h   | 33 +++++++++++++++++++++++++++++----
> >  2 files changed, 29 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index c1cb53cf2f0f8662ed3e324578f74330e63f935d..9be2d50da09a417966b3d11c84092bb2f4cd0bef 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -8,7 +8,6 @@
> >  
> >  #include <uapi/linux/kernel.h>
> >  
> > -#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
> >  #define BITS_TO_LONGS(nr)	__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
> >  #define BITS_TO_U64(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u64))
> >  #define BITS_TO_U32(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u32))
> > diff --git a/include/linux/bits.h b/include/linux/bits.h
> > index 5f68980a1b98d771426872c74d7b5c0f79e5e802..f202e46d2f4b7899c16d975120f3fa3ae41556ae 100644
> > --- a/include/linux/bits.h
> > +++ b/include/linux/bits.h
> > @@ -12,6 +12,7 @@
> >  #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
> >  #define BIT_ULL_WORD(nr)	((nr) / BITS_PER_LONG_LONG)
> >  #define BITS_PER_BYTE		8
> > +#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
> >  
> >  /*
> >   * Create a contiguous bitmask starting at bit position @l and ending at
> > @@ -25,14 +26,38 @@
> >  
> >  #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
> >  
> > -#define GENMASK(h, l) \
> > -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
> > -#define GENMASK_ULL(h, l) \
> > -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
> > +/*
> > + * Generate a mask for the specified type @t. Additional checks are made to
> > + * guarantee the value returned fits in that type, relying on
> > + * shift-count-overflow compiler check to detect incompatible arguments.
> > + * For example, all these create build errors or warnings:
> > + *
> > + * - GENMASK(15, 20): wrong argument order
> > + * - GENMASK(72, 15): doesn't fit unsigned long
> > + * - GENMASK_U32(33, 15): doesn't fit in a u32
> > + */
> > +#define GENMASK_t(t, h, l)				\
> > +	(GENMASK_INPUT_CHECK(h, l) +			\
> > +	 (((t)~ULL(0) - ((t)1 << (l)) + 1) &		\
> > +	  ((t)~ULL(0) >> (BITS_PER_TYPE(t) - 1 - (h)))))
> > +
> > +#define GENMASK(h, l) GENMASK_t(unsigned long,  h, l)
> > +#define GENMASK_ULL(h, l) GENMASK_t(unsigned long long, h, l)
> >  
> >  /*
> >   * Missing asm support
> >   *
> > + * __GENMASK_U*() depends on BITS_PER_TYPE() which would not work in the asm
> > + * code as BITS_PER_TYPE() relies on sizeof(), something not available in
> > + * asm. Nethertheless, the concept of fixed width integers is a C thing which
> > + * does not apply to assembly code.
> > + */
> > +#define GENMASK_U8(h, l) ((unsigned int)GENMASK_t(u8,  h, l))
> > +#define GENMASK_U16(h, l) ((unsigned int)GENMASK_t(u16, h, l))
> > +#define GENMASK_U32(h, l) GENMASK_t(u32, h, l)
> > +#define GENMASK_U64(h, l) GENMASK_t(u64, h, l)
> > +
> > +/*
> >   * __GENMASK_U128() depends on _BIT128() which would not work
> >   * in the asm code, as it shifts an 'unsigned __int128' data
> >   * type instead of direct representation of 128 bit constants
> > 
> > -- 
> > 2.45.3
> > 
