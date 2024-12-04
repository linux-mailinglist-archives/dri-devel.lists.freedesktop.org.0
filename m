Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F889E467D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 22:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE4C10E58F;
	Wed,  4 Dec 2024 21:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ep11XU47";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF96B10E58F;
 Wed,  4 Dec 2024 21:20:44 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7252b7326f4so227125b3a.2; 
 Wed, 04 Dec 2024 13:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733347244; x=1733952044; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BNA1GsPxilVJChqzg/IHgUeCWNBJYbUvWL6MaZGSVcI=;
 b=Ep11XU47izxtu4efh1u9fiK7LrO7hXwszvsqS9yZ/t3ZOB9DxCbyNYVuZ1psaB+xDd
 2tNyNeo2xeyiYVguN9M4/n3xe0lZl0tswhwhjqHfHVeiDgXE3rdRjdpgxg+MOtWVvTLw
 cJDR6QKf6cypfDU/1bSfYFNQ95xZzsoZnksy21hNP1+si+vjTQfQDek/2TrIsQA5CQMY
 te7e0PzSA7WuTa8wAPYAC2HujUJu5IubYG/vxE/6TquQfSYPnBbitiYUyXSlZtOcTKF7
 fYO1inzuFGe/AyaswphbBFA/uRsFtGH6c1ZJyUTDN/x8R6sxPdq+M+8nWHA0FHgXl27Q
 uIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733347244; x=1733952044;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BNA1GsPxilVJChqzg/IHgUeCWNBJYbUvWL6MaZGSVcI=;
 b=Gf21P1HFJgafxkylnsdWseOSjbZy4MHOBqfWGbJkdKxLXUkkaywy1ZPNy51mzmfc1X
 Z0uN0ClcMh+4dGewJ6tw7Ku8THzc8JvR1MRKCMNuBVOw7Aq1PK4ylVN6uWfDkhMjbR5p
 2M9Vr9EtKSjPK+zc34CezsQCRXXIJx5jJtWxrf2WO95MS3+NNEg3esFuaW5F2nwcpwUP
 N2rK/cl7d5h9cDAOTf+inKbEUIuIXqD5pfB9JQozyRpflj4FzZg/eZLERrIOUUadZEzW
 Qp2T8jYyG2j5iZxODzomfXhjLDPuW6d2Wqzwpq7jQpFdlYrW7WY9yg5XyI/l6V5KCR2u
 6rZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4+mrrrsGBbziW+45Nm1yUsOwc9XD70XpTStyhhsn1rrkOdfYJ3DvhZ9NIC+z+ztbwvlyHgODwNRvm@lists.freedesktop.org,
 AJvYcCV+N76KWKmQ+sZVZxk9KaiocB1p1FtzJPuAgGMJ2843mmlgJqFmQo2LWDPADWXGbR1oVJlkPJSWaLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYwUjGf1HXe6TbfVCOvRgReXFp7g++q9gDGQAerRH9lrTi4TSs
 uXzVt2khk8CrOlcFzgSeF2fMHN3bZXjpg5mMwqCH+i8tmvRw6HRL
X-Gm-Gg: ASbGncsq2HY3hfuWAm5TWxfTqi4c78dq1H3I72VuGgHf1WCLwE0dniSQXF/MEGwG/zr
 elXTMIUrOyhXV9W6oPD4qauToBV9y/UQ1z3q0s8NH9YZ3KtaeIZPYIkyU7LLNtxFXuFUfKfkQ/j
 2GDUoBmiQR68BAkY5hoavvQeoHhY0uSOgW2L+MWQbjmz/knhs9vP6TLvHTozav17tJtIw4HOuIx
 bD05nfmm5bcTBZPtExea2nH7YRtuG0PCjevtBYPio/3HEMiBQ==
X-Google-Smtp-Source: AGHT+IFEmSUNzGrT5DnfoRZVH+SQ2pUXxmGmw+aJzGPI7oEZwncOxNonhADpq7F5PtDa6Cd2EgQG5g==
X-Received: by 2002:a05:6a00:3022:b0:725:9202:6731 with SMTP id
 d2e1a72fcca58-72592026879mr4620300b3a.13.1733347244177; 
 Wed, 04 Dec 2024 13:20:44 -0800 (PST)
Received: from localhost ([216.228.125.129]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7258b2e79d3sm2235622b3a.67.2024.12.04.13.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 13:20:43 -0800 (PST)
Date: Wed, 4 Dec 2024 13:20:39 -0800
From: Yury Norov <yury.norov@gmail.com>
To: David Laight <David.Laight@aculab.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Martin Uecker <Martin.Uecker@med.uni-goettingen.de>,
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Message-ID: <Z1DHp34fyyhtLEV0@yury-ThinkPad>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
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

> > diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> > index a2a56a50dd85227a4fdc62236a2710ca37c5ba52..30ce06df4153cfdc0fad9bc7bffab9097f8b0450 100644
> > --- a/include/linux/compiler.h
> > +++ b/include/linux/compiler.h
> > @@ -316,6 +316,47 @@ static inline void *offset_to_ptr(const int *off)
> >  #define statically_true(x) (__builtin_constant_p(x) && (x))
> >  #define statically_false(x) (__builtin_constant_p(x) && (x) == 0)
> > 
> > +/*
> > + * Whether x is the integer constant expression 0 or something else.
> > + *
> > + * Details:
> > + *   - The C11 standard defines in §6.3.2.3.3
> > + *       (void *)<integer constant expression with the value 0>
> > + *     as a null pointer constant (c.f. the NULL macro).
> > + *   - If x evaluates to the integer constant expression 0,
> > + *       (void *)(x)
> > + *     is a null pointer constant. Else, it is a void * expression.
> > + *   - In a ternary expression:
> > + *       condition ? operand1 : operand2
> > + *     if one of the two operands is of type void * and the other one
> > + *     some other pointer type, the C11 standard defines in §6.5.15.6
> > + *     the resulting type as below:
> > + *       if one operand is a null pointer constant, the result has the
> > + *       type of the other operand; otherwise [...] the result type is
> > + *       a pointer to an appropriately qualified version of void.
> > + *   - As such, in
> > + *       0 ? (void *)(x) : (char *)0
> > + *     if x is the integer constant expression 0, operand1 is a null
> > + *     pointer constant and the resulting type is that of operand2:
> > + *     char *. If x is anything else, the type is void *.
> > + *   - The (long) cast silences a compiler warning for when x is not 0.
> > + *   - Finally, the _Generic() dispatches the resulting type into a
> > + *     Boolean.
> 
> The comment is absolutely excessive.

I like this comment. Particularly I like the references to the standard
followed by a step-by-step explanation of how the macro is built.

> I'm sure I managed about 2 lines in one of the patches I did.

Sorry, don't understand this.

Thanks,
Yury

> > + *
> > + * Glory to Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
> 
> IIRC Martin has agreed in the past that the accreditation can
> be removed - especially since it refers to the 'sizeof (void)' trick.
> 
> > + */
> > +#define __is_const_zero(x) \
> > +	_Generic(0 ? (void *)(long)(x) : (char *)0, char *: 1, void *: 0)
> > +
> > +/*
> > + * Returns a constant expression while determining if its argument is a
> > + * constant expression, most importantly without evaluating the argument.
> 
> You need to differentiate between a 'constant integer expression'
> and a 'compile time constant'.
>  
> > + *
> > + * If getting a constant expression is not relevant to you, use the more
> > + * powerful __builtin_constant_p() instead.
> 
> __builtin_constant_p() is not 'more powerful' it is testing for
> something different.
> 
> 	David
> 
> > + */
> > +#define is_const(x) __is_const_zero(0 * (x))
> > +
> >  /*
> >   * This is needed in functions which generate the stack canary, see
> >   * arch/x86/kernel/smpboot.c::start_secondary() for an example.
> > 
> > --
> > 2.45.2
> > 
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
