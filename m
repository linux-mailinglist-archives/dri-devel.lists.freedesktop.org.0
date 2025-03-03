Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE709A4B63C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 03:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9966810E1E5;
	Mon,  3 Mar 2025 02:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aE78goZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC85510E1E5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 02:47:31 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-223959039f4so17533495ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 18:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740970050; x=1741574850; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/sZXPafCnfjPrX+eEhFZ+/W9i9aWnu/LtnJisycSy4=;
 b=aE78goZU5jNnDLChjDHyzIOUYFTAZGp3ZvHSTVJrVIV5eqYBxrc6na9MfcEm6Blrfo
 Z4JiAZp3giGwh1KqIPlXGRl8dcG0b9R4j9vYhPA7QnEZ1cdzQj9ArdTTgAaQohjcPT1q
 krDiMb+3Rkd7UK2OayUr/8lkH2HHLy1uHT03mh9/0eBtMb+6h0K2Fs7BWLwL4S0YkhvF
 Eq8hftHOxcd/1c/POPCp3qVhV00VMDF8aUoLGCgShox0EH+i6LkImybZbdzwPn2HWppq
 v80Bq+v3BM4MJQGHBKLcCx+zSMLzp/91Y/dap+MThcsOjW+6gkoxWsjhWicdmEd51oTZ
 r7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740970050; x=1741574850;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/sZXPafCnfjPrX+eEhFZ+/W9i9aWnu/LtnJisycSy4=;
 b=AIuKPMaizDTrLEtQDDbCq6/gYvG589wAyyjQyRiryk1h4xz1jwCCriL/Jqb7mQck1X
 TcedYrHw9Rc5TCJxAYqLNq1C2vHzVCzMYQym5LHICXIhi9T41uyh9oa1bAhs5FvzYcK0
 PBpHsqbRlC7314cn8ilnck6rQwYIOD1Eh3wS5/F4nGEGKapR+xgKfyZNI8Hyt0svPwyU
 8ERcO8QhKBMZAEgku697WM0GswMhecsbnYWEmzqETwo1vsDMCG4g9qsVgaMo1LWnkyyB
 RhJ+cvZgtvuX7KdEPxCq3/Jok5zAfw/FG5y+1vRxvty5x0/MY22V9XSDvKVnJ87TYhAF
 d78Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR49ksv5tUQFQTXPIHrLkEY0pgcR2T9lXnzuNt7q5+ulqwsyo/QAOCe854W8ghCeGeeA74pkPOXvg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV4FSeUSEeMhw1GSshZ3NwN0dTxPrhaJVF1y2VDfGo7Yx1orRg
 BH/xsCk5FiFDNs5VQc61V5KX4jP/uMYhnd0uz8mOca6hYzQ7abQR
X-Gm-Gg: ASbGncty2H/LV3R73UC4tYC0zQ4UsfCawVs7ZrsjN5wrPafp08Q7bh2xFBNwAJUrtAX
 mpVE6pxR7acqOjzLIceO4gjltnhvTVr4cqf5EDJYUipj2chHSxoMwLYIQZnfh/ZgbIfdvm4y4Gn
 b1PFSBL8k7Eh6s5O7/NLIzc33kCGLJEDWszHiRdVyyHKiE/5a3GW8a1l/ZwSraMncMkEoj7LEWa
 I9yHabPfjDjBiMwV7bZN2pMcnKWWStshKjyZySYpf6WsjnP3jhmDR0JaBMlegZ7sWb+eQlhaAug
 GgB4NugndFdVNmT8sBgvLXYiIOqMW6+ViL8T0Cuo0KTWbutzMLE/6cXh5RdEksz3W98O+2eG
X-Google-Smtp-Source: AGHT+IEaGtdMZBEy2bxwSPGd2bD8qrXnPe8PVMJ2bjqQlITrRKiZTP6g3iWQ0ddz5yh+ocZy4OpOpA==
X-Received: by 2002:a17:903:2302:b0:216:2bd7:1c2f with SMTP id
 d9443c01a7336-22368f7b5d3mr144431425ad.18.1740970050255; 
 Sun, 02 Mar 2025 18:47:30 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-734a00255d8sm7660595b3a.88.2025.03.02.18.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 18:47:29 -0800 (PST)
Date: Mon, 3 Mar 2025 10:47:20 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
 <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
 <20250302190954.2d7e068f@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302190954.2d7e068f@pumpkin>
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

On Sun, Mar 02, 2025 at 07:09:54PM +0000, David Laight wrote:
> On Mon, 3 Mar 2025 01:29:19 +0800
> Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> 
> > Hi Yury,
> > 
> > On Sun, Mar 02, 2025 at 11:02:12AM -0500, Yury Norov wrote:
> > > On Sun, Mar 02, 2025 at 04:20:02PM +0800, Kuan-Wei Chiu wrote:  
> > > > Hi Yury,
> > > > 
> > > > On Sat, Mar 01, 2025 at 10:10:20PM -0500, Yury Norov wrote:  
> > > > > On Sat, Mar 01, 2025 at 10:23:52PM +0800, Kuan-Wei Chiu wrote:  
> > > > > > Add generic C implementations of __paritysi2(), __paritydi2(), and
> > > > > > __parityti2() as fallback functions in lib/parity.c. These functions
> > > > > > compute the parity of a given integer using a bitwise approach and are
> > > > > > marked with __weak, allowing architecture-specific implementations to
> > > > > > override them.
> > > > > > 
> > > > > > This patch serves as preparation for using __builtin_parity() by
> > > > > > ensuring a fallback mechanism is available when the compiler does not
> > > > > > inline the __builtin_parity().
> > > > > > 
> > > > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > > > ---
> > > > > >  lib/Makefile |  2 +-
> > > > > >  lib/parity.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> > > > > >  2 files changed, 49 insertions(+), 1 deletion(-)
> > > > > >  create mode 100644 lib/parity.c
> > > > > > 
> > > > > > diff --git a/lib/Makefile b/lib/Makefile
> > > > > > index 7bab71e59019..45affad85ee4 100644
> > > > > > --- a/lib/Makefile
> > > > > > +++ b/lib/Makefile
> > > > > > @@ -51,7 +51,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
> > > > > >  	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
> > > > > >  	 percpu-refcount.o rhashtable.o base64.o \
> > > > > >  	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
> > > > > > -	 generic-radix-tree.o bitmap-str.o
> > > > > > +	 generic-radix-tree.o bitmap-str.o parity.o
> > > > > >  obj-y += string_helpers.o
> > > > > >  obj-y += hexdump.o
> > > > > >  obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
> > > > > > diff --git a/lib/parity.c b/lib/parity.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..a83ff8d96778
> > > > > > --- /dev/null
> > > > > > +++ b/lib/parity.c
> > > > > > @@ -0,0 +1,48 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > > +/*
> > > > > > + * lib/parity.c
> > > > > > + *
> > > > > > + * Copyright (C) 2025 Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > > > + * Copyright (C) 2025 Yu-Chun Lin <eleanor15x@gmail.com>
> > > > > > + *
> > > > > > + * __parity[sdt]i2 can be overridden by linking arch-specific versions.
> > > > > > + */
> > > > > > +
> > > > > > +#include <linux/export.h>
> > > > > > +#include <linux/kernel.h>
> > > > > > +
> > > > > > +/*
> > > > > > + * One explanation of this algorithm:
> > > > > > + * https://funloop.org/codex/problem/parity/README.html  
> > > > > 
> > > > > I already asked you not to spread this link. Is there any reason to
> > > > > ignore it?
> > > > >   
> > > > In v2, this algorithm was removed from bitops.h, so I moved the link
> > > > here instead. I'm sorry if it seemed like I ignored your comment.  
> > > 
> > > Yes, it is.
> > >    
> > > > In v1, I used the same approach as parity8() because I couldn't justify
> > > > the performance impact in a specific driver or subsystem. However,
> > > > multiple people commented on using __builtin_parity or an x86 assembly
> > > > implementation. I'm not ignoring their feedback-I want to address these  
> > > 
> > > Please ask those multiple people: are they ready to maintain all that
> > > zoo of macros, weak implementations, arch implementations and stubs
> > > for no clear benefit? Performance is always worth it, but again I see
> > > not even a hint that the drivers care about performance. You don't
> > > measure it, so don't care as well. Right?
> > >   
> > > > comments. Before submitting, I sent an email explaining my current
> > > > approach: using David's suggested method along with __builtin_parity,
> > > > but no one responded. So, I decided to submit v2 for discussion
> > > > instead.  
> > > 
> > > For discussion use tag RFC.
> > >   
> > > > 
> > > > To avoid mistakes in v3, I want to confirm the following changes before
> > > > sending it:
> > > > 
> > > > (a) Change the return type from int to bool.
> > > > (b) Avoid __builtin_parity and use the same approach as parity8().
> > > > (c) Implement parity16/32/64() as single-line inline functions that
> > > >     call the next smaller variant after xor.
> > > > (d) Add a parity() macro that selects the appropriate parityXX() based
> > > >     on type size.
> > > > (e) Update users to use this parity() macro.
> > > > 
> > > > However, (d) may require a patch affecting multiple subsystems at once
> > > > since some places that already include bitops.h have functions named
> > > > parity(), causing conflicts. Unless we decide not to add this macro in
> > > > the end.
> > > > 
> > > > As for checkpatch.pl warnings, they are mostly pre-existing coding
> > > > style issues in this series. I've kept them as-is, but if preferred,
> > > > I'm fine with fixing them.  
> > > 
> > > Checkpatch only complains on new lines. Particularly this patch should
> > > trigger checkpatch warning because it adds a new file but doesn't touch
> > > MAINTAINERS. 
> > >   
> > For example, the following warning:
> > 
> > ERROR: space required after that ',' (ctx:VxV)
> > #84: FILE: drivers/input/joystick/sidewinder.c:368:
> > +                       if (!parity64(GB(0,33)))
> >                                           ^
> > 
> > This issue already existed before this series, and I'm keeping its
> > style unchanged for now.
> > 
> > > > If anything is incorrect or if there are concerns, please let me know.
> > > > 
> > > > Regards,
> > > > Kuan-Wei
> > > > 
> > > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > > > index c1cb53cf2f0f..47b7eca8d3b7 100644
> > > > --- a/include/linux/bitops.h
> > > > +++ b/include/linux/bitops.h
> > > > @@ -260,6 +260,43 @@ static inline int parity8(u8 val)
> > > >  	return (0x6996 >> (val & 0xf)) & 1;
> > > >  }
> > > > 
> > > > +static inline bool parity16(u16 val)
> > > > +{
> > > > +	return parity8(val ^ (val >> 8));
> > > > +}
> > > > +
> > > > +static inline bool parity32(u32 val)
> > > > +{
> > > > +	return parity16(val ^ (val >> 16));
> > > > +}
> > > > +
> > > > +static inline bool parity64(u64 val)
> > > > +{
> > > > +	return parity32(val ^ (val >> 32));
> > > > +}  
> > > 
> > > That was discussed between Jiri and me in v2. Fixed types functions
> > > are needed only in a few very specific cases. With the exception of
> > > I3C driver (which doesn't look good for both Jiri and me), all the
> > > drivers have the type of variable passed to the parityXX() matching 
> > > the actual variable length. It means that fixed-type versions of the
> > > parity() are simply not needed. So if we don't need them, please don't
> > > introduce it.
> > >  
> > So, I should add the following parity() macro in v3, remove parity8(),
> > and update all current parity8() users to use this macro, right?
> > 
> > I changed u64 to __auto_type and applied David's suggestion to replace
> > the >> 32 with >> 16 >> 16 to avoid compiler warnings.
> > 
> > Regards,
> > Kuan-Wei
> > 
> > #define parity(val)					\
> > ({							\
> > 	__auto_type __v = (val);			\
> > 	bool __ret;					\
> > 	switch (BITS_PER_TYPE(val)) {			\
> > 	case 64:					\
> > 		__v ^= __v >> 16 >> 16;			\
> > 		fallthrough;				\
> > 	case 32:					\
> > 		__v ^= __v >> 16;			\
> > 		fallthrough;				\
> > 	case 16:					\
> > 		__v ^= __v >> 8;			\
> > 		fallthrough;				\
> > 	case 8:						\
> > 		__v ^= __v >> 4;			\
> > 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > 		break;					\
> > 	default:					\
> > 		BUILD_BUG();				\
> > 	}						\
> > 	__ret;						\
> > })
> 
> I'm seeing double-register shifts for 64bit values on 32bit systems.
> And gcc is doing 64bit double-register maths all the way down.
> 
> That is fixed by changing the top of the define to
> #define parity(val)					\
> ({							\
> 	unsigned int __v = (val);			\
> 	bool __ret;					\
> 	switch (BITS_PER_TYPE(val)) {			\
> 	case 64:					\
> 		__v ^= val >> 16 >> 16;			\
> 		fallthrough;				\
> 
> But it's need changing to only expand 'val' once.
> Perhaps:
> 	auto_type _val = (val);
> 	u32 __ret = val;
> and (mostly) s/__v/__ret/g
>
I'm happy to make this change, though I'm a bit confused about how much
we care about the code generated by gcc. So this is the macro expected
in v3:

#define parity(val)					\
({							\
	__auto_type __v = (val);			\
	u32 __ret = val;				\
	switch (BITS_PER_TYPE(val)) {			\
	case 64:					\
                __ret ^= __v >> 16 >> 16;		\
		fallthrough;				\
	case 32:					\
		__ret ^= __ret >> 16;			\
		fallthrough;				\
	case 16:					\
		__ret ^= __ret >> 8;			\
		fallthrough;				\
	case 8:						\
		__ret ^= __ret >> 4;			\
		__ret = (0x6996 >> (__ret & 0xf)) & 1;	\
		break;					\
	default:					\
		BUILD_BUG();				\
	}						\
	__ret;						\
})
