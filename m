Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD78A582FC
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 11:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174C210E34C;
	Sun,  9 Mar 2025 10:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CrzByx8T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA0510E30B;
 Sun,  9 Mar 2025 10:23:16 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43bc48ff815so18836405e9.0; 
 Sun, 09 Mar 2025 03:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741515795; x=1742120595; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jOrSY62ly9MyAZzU/mRzG/6yK32MDIUREu5DDgJTTrs=;
 b=CrzByx8TGE7eVz1Y7ZuGhCekcEbNOk82iA3GH4ZFFfTHp1idBL2zT/ch36N1oy/WXT
 XQtFE2v86zC+jnhUOpIsPOfH82QPU2LkDLJ3XS/RGhlWksE2Fdec0dM7eEQlydruRAbT
 pUKayKWDqvUrV+vncl9ESLYtgkz++UgctV8ZA8qHzzUjENmAPCu0j/lI1o/4OlK0WN8r
 /ho3EDCtqUFX4a5480XTX1fWgYOsk1Ax0a1WQAZnmMZtpBmWSEWG1B++5Mhf7bSg0e+c
 HAm13DevAL+ePR70Jvf/xZ6NfgcpgpCuCbKQa/BfOnOTG9B7yafrvMoNXNAtX1OEJRTU
 JYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741515795; x=1742120595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jOrSY62ly9MyAZzU/mRzG/6yK32MDIUREu5DDgJTTrs=;
 b=SUmqZJtoMG/HmSfmQdgiLeLnC9edTToSDMgydq3RwjAM+aEeLIAjwSUxYVV9NcLHUh
 hAhNzOJO2qZcKRKt69klvuAIJAglGzlnHtOmAPotFwu7Y8vUQKTcCrDv+psm2ca52rj2
 iq0Cw3AZpG3X5jYu4+ScE/0Vk32s9J7dT1vpCvCbBuk462VivoR+va4lmccdxOxAwVGC
 0YQJK2FC0yMPr7mwF1hanYS/kqUyPRq4Wo8GahQNwHVvzkuuAbn3pgUaUxhVQuPsYoVI
 o5oTHN3TsXG1US84iTcfcJLLZd9Bt+CFKYAhgPQi17TJz2va7iMHcyu05+Zi6xhkpCx6
 Qtow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWheI9uBCs3kQ7fOBXt9IqXgGC3oy/HETbIjcHy0OB/X+nBbB0ed966eZmrVMqZPVY9dRblULtus+k=@lists.freedesktop.org,
 AJvYcCX7Qi3s0pRB7EOkiycTzVHXetn6C/Mv7TwNfUocdknu8NwZ3KtH+dU5atONihGas198yt/OYfRYo9kY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywR9lgOxSm3qm0XCXHZ1mKg0yZpw6pL97xu9RJTluV9/Sdjbeg
 cXin4JQzsTKXd51l3in/paDkVwIpK7yNkpYG8KSY54xxkN5N/8gp
X-Gm-Gg: ASbGncvANc4/tF0T4cMXXCI/9jI7HGTtvBX3Wyof0yFON5ta61+rg1PTdVaTnXzWd2/
 vN3N2je2nRSp2mkL+hzYPHRxGLWtKJsgmiHdydx//0r5lhBoGVscDuHWTUXZB3BObmtuLeW3gg+
 BboyHK6RHnH4dD8c+xSkhZ6bDr3SlyxVQQ+nuCkxPyYHx4/8PKnH760A0145Oc6dSBOf4J1kLHv
 FMaLz2sr8IuITZ3bH+b0QJP1d5PNKf3pnqAk2PK6Y/mhxQS9ZUT/U3I5xEinkyDnrHjJ2N9P4iW
 98VC88zJtJawyw4haGAyToS3SgOqy0/X/mvXQeP5j84ww2vQAv7ytHkQc5a+bwXguJd/dfNvWPX
 OYXuxNWk=
X-Google-Smtp-Source: AGHT+IHbscHwInTJT24NNcdcbyXR3Qc8dNdzXdp1UDpEDUqPcYTQseTkyV6/M+R7pmGC6z1uWCUoyw==
X-Received: by 2002:a05:600c:754:b0:43b:bfa7:c7d with SMTP id
 5b1f17b1804b1-43ce4aa8771mr34972875e9.2.1741515794376; 
 Sun, 09 Mar 2025 03:23:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf0c42eb6sm21134605e9.16.2025.03.09.03.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 03:23:13 -0700 (PDT)
Date: Sun, 9 Mar 2025 10:23:12 +0000
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
Message-ID: <20250309102312.4ff08576@pumpkin>
In-Reply-To: <20250309015853.01412484@pumpkin>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-1-b443e9dcba63@wanadoo.fr>
 <20250306192331.2701a029@pumpkin>
 <bdce7d99-7f02-4667-acda-9ffc62c92af2@wanadoo.fr>
 <20250309015853.01412484@pumpkin>
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

On Sun, 9 Mar 2025 01:58:53 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Fri, 7 Mar 2025 18:58:08 +0900
> Vincent Mailhol <mailhol.vincent@wanadoo.fr> wrote:
> 
> > On 07/03/2025 at 04:23, David Laight wrote:  
> > > On Thu, 06 Mar 2025 20:29:52 +0900
> > > Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org> wrote:
> > >     
> > >> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > >>
> > >> In an upcoming change, GENMASK() and its friends will indirectly
> > >> depend on sizeof() which is not available in asm.
> > >>
> > >> Instead of adding further complexity to __GENMASK() to make it work
> > >> for both asm and non asm, just split the definition of the two
> > >> variants.    
> > > ...    
> > >> +#else /* defined(__ASSEMBLY__) */
> > >> +
> > >> +#define GENMASK(h, l)		__GENMASK(h, l)
> > >> +#define GENMASK_ULL(h, l)	__GENMASK_ULL(h, l)    
> > > 
> > > What do those actually expand to now?
> > > As I've said a few times both UL(0) and ULL(0) are just (0) for __ASSEMBLY__
> > > so the expansions of __GENMASK() and __GENMASK_ULL() contained the
> > > same numeric constants.    
> > 
> > Indeed, in asm, the UL(0) and ULL(0) expands to the same thing: 0.
> > 
> > But the two macros still expand to something different on 32 bits
> > architectures:
> > 
> >   * __GENMASK:
> > 
> >       (((~(0)) << (l)) & (~(0) >> (32 - 1 - (h))))
> > 
> >   * __GENMASK_ULL:
> > 
> >       (((~(0)) << (l)) & (~(0) >> (64 - 1 - (h))))
> > 
> > On 64 bits architecture these are the same.  
> 
> I've just fed those into godbolt (https://www.godbolt.org/z/Ter6WE9qE) as:
> int fi(void)
> {
>     int v;
>     asm("mov $(((~(0)) << (8)) & (~(0) >> (32 - 1 - (15)))),%0": "=r" (v));
>     return v -(((~(0u)) << (8)) & (~(0u) >> (32 - 1 - (15))));
> }
> 
> gas warns:
> <source>:4: Warning: 0xffffffffff00 shortened to 0xffffff00
> 
> unsigned long long fll(void)
> {
>     unsigned long long v;
>     asm("mov $(((~(0)) << (8)) & (~(0) >> (64 - 1 - (15)))),%0": "=r" (v));
>     return v -(((~(0ull)) << (8)) & (~(0ull) >> (64 - 1 - (15))));
> }
> 
> (for other architectures you'll need to change the opcode)
> 
> For x86 and x86-32 the assembler seems to be doing 64bit maths with unsigned
> right shifts - so the second function (with the 64 in it) generates 0xff00.
> I doubt a 32bit only assembler does 64bit maths, but the '>> 48' above
> might get masked to a '>> 16' by the cpu and generate the correct result.
> 
> So __GENMASK() is likely to be broken for any assembler that supports 64bits
> when generating 32bit code.
> __GENMASK_ULL() works (assuming all have unsigned >>) on 64bit assemblers
> (even when generating 32bit code). It may work on some 32bit assemblers.

I've remembered my 'pi' has a 32bit userspace (on a 64bit kernel).
I quick test of "mov %0,#(...)" and bits 11..8 gives the correct output
for size '32' but the error message:
/tmp/ccPB7bWh.s:26: Warning: shift count out of range (56 is not between 0 and 31)
with size '64'.

Assuming that part of the gnu assembler is consistent across architectures
you can't use either GENMASK in asm for 32bit architectures.

Any change (probably including removing the asm support for the uapi) isn't
going to make things worse!

	David

> 
> Since most uses in the header files will be GENMASK() I doubt (hope) no
> asm code actually uses the values!
> The headers assemble - but that is about all that can be said.
> 
> Bags of worms :-)
> 
> 	David
> 

