Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0166A58044
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 02:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A72410E2D3;
	Sun,  9 Mar 2025 01:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KMpETyiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A8810E2BB;
 Sun,  9 Mar 2025 01:59:01 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ac27cb35309so94723866b.2; 
 Sat, 08 Mar 2025 17:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741485539; x=1742090339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CQPV71ADDI/mWsm8CeKOioi3PQYjTezoJGiR28RCRSY=;
 b=KMpETyiUr7+w3gYSJi3mPIxv+3M2CMurPaRtZy1U0ReJv94GL063CqUZ/unZduxBCl
 yxGasaYjizpCE6+nk/TOuWpPbG9gX6LLjq5OXbety9WtVPzZKp17LL7LLhwRZk9n37W3
 7nVy/c/MDx8Ifo0Mrqunc7Bd93hHNyxkloZ6bUFGWEv63Ddg50nC+4HEEEyupDnFKFeW
 tEkEyqAPAASg8YQSX8s9oEhq97BZvztlx32aJR0wP6yl8mz0T+HND2XJz0SfAHE0EiS3
 AAfOwYpkI2uBLgUWsjADvft2KT8Pudo5uxKCMRdNbqkv2O0BmK4k9Y0QKnXmHVM+WyO1
 grGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741485539; x=1742090339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CQPV71ADDI/mWsm8CeKOioi3PQYjTezoJGiR28RCRSY=;
 b=Rge2NLSD7YyNinHWTHV7dp9m+jeLGgQZoa/Cr/4nd7ZSHoxtP0EOTlPceecil4xlnC
 r7xiXvmPJqOia30SzV4B2NiHpooX6JUkTHyU0pspiy+Kbiyp5iWwnRwugsejSpTn/MTD
 RfmsHwb/ZXSDu0zSiz1yNqOUSUwdqHPLxvHrjo/GewSSno7q/D2T+6MXFB2ft/q6ThBR
 e6eMfBY95srqTZJ6utalhWvdxdrr7ZCLuqt63hh0e57sCYAD93AWwnI8mhW/bjMQvktJ
 zs51i4u2+a0WQv099/aGhFhTmfGmzAA5lv5onl/8GSdtW47z5/BZr/ckrIPqwov7Q7sL
 EuSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkHVQJtB3N+a722YpYWSTzZGvfyAT6Va34hQlgdPq8D89y2Z8c8dfFEX597ZcgiR15mOAWK7bNiCoy@lists.freedesktop.org,
 AJvYcCVOUc0kunYgUdroqrnHJax72Lxb0tZy9Zcm7bL26AVo8LbtT3Q50gf2Mr9t/eyjrBJbthC+NGfmuTs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRbGl8j5yU+nfnGxZqjoOzAPywQNH2MWzIUmmc0S/4UR3Oc53z
 aQhxFAMHktAtF8q30MPypOYDCxgx1WoSOktRshhHuS+ZPP2DPI6r
X-Gm-Gg: ASbGnctuvL3oZzWY/ua1Nnk73ubPuDQnAgWVedL+Db6ZzDgdlGJuNoRd1qvcc5lxIeM
 q9Suwp489HBMIxnIWXAHqecRqgmrmvDaZ3IOqY4Evxd2lumLuCTrNINNLBhe3bu3BtXdmBygHcZ
 rJjAledQkgWOivhlvQZtis8WtKV+hxgaMSg4wKtwwN9Ak3GXjsFQyojaTR0obxx72rNtVB2yiX1
 VUQxDaH6t5oM9TOCpO5Pn/i+4TF4enoTFKKvXJkOPCeROye2Uy31nWBT602+kj6iMXIIpYDt3SP
 HAthy3wzrV3w5ZU3fB3n5yc/blW5nJccyvWp1h5LVZbQQr2akUBQzlDo/n3vh5awBM7TCMX0G07
 xtLDdYLH3ZLw9NZ4sDQ==
X-Google-Smtp-Source: AGHT+IHm3r6u0Tc1JavXfFI/s+U8dwCNj8qWrGb6bQH+IsLrTWsHG6S8/8z8ZR3B4eeZ93W15hty9A==
X-Received: by 2002:a17:907:7255:b0:abf:51b7:608a with SMTP id
 a640c23a62f3a-ac252738131mr911910566b.5.1741485539107; 
 Sat, 08 Mar 2025 17:58:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac287653d1esm79429666b.125.2025.03.08.17.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Mar 2025 17:58:58 -0800 (PST)
Date: Sun, 9 Mar 2025 01:58:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Yury Norov <yury.norov@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@ACULAB.COM>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 1/7] bits: split the definition of the asm and
 non-asm GENMASK()
Message-ID: <20250309015853.01412484@pumpkin>
In-Reply-To: <bdce7d99-7f02-4667-acda-9ffc62c92af2@wanadoo.fr>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-1-b443e9dcba63@wanadoo.fr>
 <20250306192331.2701a029@pumpkin>
 <bdce7d99-7f02-4667-acda-9ffc62c92af2@wanadoo.fr>
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

On Fri, 7 Mar 2025 18:58:08 +0900
Vincent Mailhol <mailhol.vincent@wanadoo.fr> wrote:

> On 07/03/2025 at 04:23, David Laight wrote:
> > On Thu, 06 Mar 2025 20:29:52 +0900
> > Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org> wrote:
> >   
> >> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >>
> >> In an upcoming change, GENMASK() and its friends will indirectly
> >> depend on sizeof() which is not available in asm.
> >>
> >> Instead of adding further complexity to __GENMASK() to make it work
> >> for both asm and non asm, just split the definition of the two
> >> variants.  
> > ...  
> >> +#else /* defined(__ASSEMBLY__) */
> >> +
> >> +#define GENMASK(h, l)		__GENMASK(h, l)
> >> +#define GENMASK_ULL(h, l)	__GENMASK_ULL(h, l)  
> > 
> > What do those actually expand to now?
> > As I've said a few times both UL(0) and ULL(0) are just (0) for __ASSEMBLY__
> > so the expansions of __GENMASK() and __GENMASK_ULL() contained the
> > same numeric constants.  
> 
> Indeed, in asm, the UL(0) and ULL(0) expands to the same thing: 0.
> 
> But the two macros still expand to something different on 32 bits
> architectures:
> 
>   * __GENMASK:
> 
>       (((~(0)) << (l)) & (~(0) >> (32 - 1 - (h))))
> 
>   * __GENMASK_ULL:
> 
>       (((~(0)) << (l)) & (~(0) >> (64 - 1 - (h))))
> 
> On 64 bits architecture these are the same.

I've just fed those into godbolt (https://www.godbolt.org/z/Ter6WE9qE) as:
int fi(void)
{
    int v;
    asm("mov $(((~(0)) << (8)) & (~(0) >> (32 - 1 - (15)))),%0": "=r" (v));
    return v -(((~(0u)) << (8)) & (~(0u) >> (32 - 1 - (15))));
}

gas warns:
<source>:4: Warning: 0xffffffffff00 shortened to 0xffffff00

unsigned long long fll(void)
{
    unsigned long long v;
    asm("mov $(((~(0)) << (8)) & (~(0) >> (64 - 1 - (15)))),%0": "=r" (v));
    return v -(((~(0ull)) << (8)) & (~(0ull) >> (64 - 1 - (15))));
}

(for other architectures you'll need to change the opcode)

For x86 and x86-32 the assembler seems to be doing 64bit maths with unsigned
right shifts - so the second function (with the 64 in it) generates 0xff00.
I doubt a 32bit only assembler does 64bit maths, but the '>> 48' above
might get masked to a '>> 16' by the cpu and generate the correct result.

So __GENMASK() is likely to be broken for any assembler that supports 64bits
when generating 32bit code.
__GENMASK_ULL() works (assuming all have unsigned >>) on 64bit assemblers
(even when generating 32bit code). It may work on some 32bit assemblers.

Since most uses in the header files will be GENMASK() I doubt (hope) no
asm code actually uses the values!
The headers assemble - but that is about all that can be said.

Bags of worms :-)

	David

