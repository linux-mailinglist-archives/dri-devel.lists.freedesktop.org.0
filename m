Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6065A50D28
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 22:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BC810E81F;
	Wed,  5 Mar 2025 21:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hIBbJeOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F071D10E81F;
 Wed,  5 Mar 2025 21:13:47 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43bc63876f1so30843845e9.3; 
 Wed, 05 Mar 2025 13:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741209226; x=1741814026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mBRrY/yBfxvuLgMlXhSkD7HMQ9Yj7k44KHWuqIjXDEE=;
 b=hIBbJeOAafkMHfM/6L4lkqKB1+qHOkrceEZxH5m0vM0bs2H3MGy7njkifjBZj6wcCa
 UcFXgHb7FOJL47hidLfb9jdGMiCnyvy8nJSmsAyqlCR2ILegYn/TkXYdLWVEPalDEJdR
 vZXaYWyAJAm+rcV+11F+4da+4CWFuBmvpXBjVUSUTiEA4tUef1jR6fg/Rz+B8JuTBE0M
 SPh/t+FuTII9bK2l76fBMD32CIHTorLC5dO6LFioWbIIxxjbnxnngfL4LUTqW/F4vmOH
 p5ffNXtKPUf6bF6OeJkjX/L9Ylm3jw/7UAXVG0uWrPPEm+3AOl+hSfRCsXUZB2ruCMci
 qRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741209226; x=1741814026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mBRrY/yBfxvuLgMlXhSkD7HMQ9Yj7k44KHWuqIjXDEE=;
 b=U3EIbdLI5r5q64+aN7hhR+QpNgxii4n+IakSPUex7OHLK5Qz54uu8LGL7lXYHu/eei
 S+eYW1fU/Ddqo+xSqhlcz7+X9Jx53F9UnzD4g2tA1rFJSwnGsjvTaQm36sBhPeKzICTV
 XAaVKRKOeU28QlzlUNW2/0JUrgm4Jks9crOIOqmFHVltzCbFIQn2tkapMoOt10n34yA3
 Xu0dK2d4fI+12PCf36LQrzBv2fYU7tlr+L6NlQMKXkLCHjbr7QrKsyRwSgUooOOi7Chd
 7o6lSIssv3XIj88XIuOHbXLN+4NE/5tvmc70RVoUJaGCUQOv4dDvWohmcMpKD0En8Bag
 9gFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8XazACZgXTTtjnYXJLuNtW9NoTV+yuMdYGor3cWfdHUWexglvZXtQBXrEufO/rrSXDgFzhCmOVog=@lists.freedesktop.org,
 AJvYcCVJUo2cqO0uwYWIPQ3y4yoBsZTI8L5TrRUAx5WHIMamfVL02TIoEKSJvM8/J3FyYYa6i7eRbm09eoP8@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe9/smk1XFf64Z6C9ltrReGLXoTooP22DlXz8ZSUaN4drCeOrV
 eZSjF6awiTWxgrnpaiQWbymnuVU761bOHRhJMgnJvP0U7GcxeyhG
X-Gm-Gg: ASbGncv2INf+vJ9n7LPCo9cgyVMxGMUWdehTKyoBsLysBcr2OOiY/yyMzb8EoOlnF9H
 yeTR+gnYY+IFKg0Y44gyYFN9TjXdrkz0qYu02lkzg8x8Qt1PJhCakEXbGLFcbCV+E0q/oQd9yQ1
 s/Lf2Gy2gO6PxNgZ64W+1oKseW8xVduYFw61j9p3B8u9XfvPvTWQyfKn/M+yET/B2T8fD8nZqvb
 udTLx6DBcGPEKO3r8hPDA8BYH89CkwhGCE7k71NN7giqxOujJbqjkiIQlWK5aF2nxtMPEHqRXrt
 1O57+j0IjFCha28HAwNew4dU6mjWh94sz9xDYLU+IAzc70zocROKyzDgsErd/CxwzB6iEaTl4jW
 nTXyL/Yc=
X-Google-Smtp-Source: AGHT+IHVQz7StEb3E7vwY+wN9yjtbQ30ziK4JQuHk7WcBp+0Xfw+qMA37Ery803rfsIYjDm2WSDeiQ==
X-Received: by 2002:a05:600c:198f:b0:43a:b0b5:b0 with SMTP id
 5b1f17b1804b1-43bd293ef18mr37803035e9.4.1741209226004; 
 Wed, 05 Mar 2025 13:13:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a6a9fsm22432775f8f.36.2025.03.05.13.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 13:13:45 -0800 (PST)
Date: Wed, 5 Mar 2025 21:13:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Yury Norov
 <yury.norov@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 4/8] bits: introduce fixed-type BIT
Message-ID: <20250305211344.0c7c3782@pumpkin>
In-Reply-To: <Z8hyNXVZxLzhEzNy@smile.fi.intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-4-1873dcdf6723@wanadoo.fr>
 <Z8hgqOB5Ym-GGykS@smile.fi.intel.com>
 <d7f3150d-0167-44be-90b2-17f8a050687c@wanadoo.fr>
 <Z8hyNXVZxLzhEzNy@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 5 Mar 2025 17:48:05 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, Mar 05, 2025 at 11:48:10PM +0900, Vincent Mailhol wrote:
> > On 05/03/2025 at 23:33, Andy Shevchenko wrote:  
> > > On Wed, Mar 05, 2025 at 10:00:16PM +0900, Vincent Mailhol via B4 Relay wrote:  
> 
> ...
> 
> > >> +#define BIT_U8(b) (BIT_INPUT_CHECK(u8, b) + (unsigned int)BIT(b))
> > >> +#define BIT_U16(b) (BIT_INPUT_CHECK(u16, b) + (unsigned int)BIT(b))

Why even pretend you are checking against a type - just use 8 or 16.

> > > 
> > > Why not u8 and u16? This inconsistency needs to be well justified.

What is the type of BIT(b) ?
it really ought to be unsigned int (so always 32bit), but I bet it
is unsigned long (possibly historically because someone was worried
int might be 16 bits!)

> > 
> > Because of the C integer promotion rules, if casted to u8 or u16, the
> > expression will immediately become a signed integer as soon as it is get
> > used. For example, if casted to u8
> > 
> >   BIT_U8(0) + BIT_U8(1)
> > 
> > would be a signed integer. And that may surprise people.

They always get 'surprised' by that.
I found some 'dayjob' code that was doing (byte_var << 1) >> 1 in order
to get the high bit discarded.
Been like that for best part of 30 years...
I wasn't scared to fix it :-)

> Yes, but wouldn't be better to put it more explicitly like
> 
> #define BIT_U8(b)	(BIT_INPUT_CHECK(u8, b) + (u8)BIT(b) + 0 + UL(0)) // + ULL(0) ?

I don't think you should force it to 'unsigned long'.
On 64bit a comparison against a 32bit 'signed int' will sign-extend the
value before making it unsigned.
While that shouldn't matter here, someone might copy it.
You just want to ensure that all the values are 'unsigned int', trying
to return u8 or u16 isn't worth the effort.

When I was doing min_unsigned() I did ((x) + 0u + 0ul + 0ull) to ensure
that values would always be zero extended.
But I was doing the same to both sides of the expression - and the compiler
optimises away all the 'known 0' extension to 64bits.

> Also, BIT_Uxx() gives different type at the end, shouldn't they all be promoted
> to unsigned long long at the end? Probably it won't work in real assembly.
> Can you add test cases which are written in assembly? (Yes, I understand that it will
> be architecture dependent, but still.)

There is no point doing multiple versions for asm files.
The reason UL(x) and ULL(x) exist is because the assembler just has integers.
Both expand to (x).
There might not even be a distinction between signed and unsigned.
I'm not sure you can assume that a shift right won't replicate the sign bit.
Since the expression can only be valid for constants, something simple
like ((2 << (hi)) - (1 << (lo)) really is the best you are going to get
for GENMASK().

So just define a completely different version for asm any nuke the UL() etc
for readability.

	David
