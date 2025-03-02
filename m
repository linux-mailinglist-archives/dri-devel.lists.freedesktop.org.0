Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03856A4B444
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 20:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810E810E1B1;
	Sun,  2 Mar 2025 19:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WVlhHaNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C009110E1C3
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 19:10:00 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5e4ad1d67bdso5813656a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 11:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740942599; x=1741547399; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ogY5wzd3oCk8kdPLCtTxCsUKxDoY8A/pG2HeW+qkfUM=;
 b=WVlhHaNKGZ/z9wuUGZWMMK2zouOWPrzupXwD8BiET3nTny/HlszShURUgIIkWYuTLp
 EgM/WCe4IWSIstY2zfjNa6kxGHhuQL3wxeVyoLRXsMO7Ni31fUrDP0hSe13o8SNqFpnj
 hR3BwphDKFnh+dLZsQHFqkQQZwSZRFVrYP/S6gFCyFMaLz7B6pW5xxfngvapWXzT7DL6
 FffWzV7HSFFflntEgrCHT3rV+bMtlmgrSAwa84iJNYjgUpFGgH1Pdf6NuGFREPQzU+5W
 A7nIKSQzUd98X0PgfSMLSyHoEhZt9xy5IjcJ8ZLthllJ8R3nMRUXMBuBXPLwXnbljFH6
 cijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740942599; x=1741547399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ogY5wzd3oCk8kdPLCtTxCsUKxDoY8A/pG2HeW+qkfUM=;
 b=H98hFQMJtchX6FGoKlrW6K7EY7xeIzPBX1+KIdY0dbFMtDqGtshhBxBGhFjgQHRmJ7
 Y0OpXjve019P7/MLX9KS8Bc4Euh+TnK9vv/YpCL2A/S7MQYXLp6lUkplBdfVndeFscNJ
 WCknoyrssqLeJK9qJS+PhwVWjWLVL1sYTBX054rqJ4ytCFlINxsrvl3Jpp6+L8pO1fIS
 iU9b2Uo/csU+PkLdQblgPx9R9osRNtllRft9aLM8VEi+7E1a6/qnkOB8g/fBb0aMXiEu
 D6VaupMreFR5sHv1sxCw+F1TRmy6FibwQVghd6KjDj7lIKRcthuUSbbz54hyonXYFMN6
 wEww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeenrAFpkfYde73F2L+vF33TFaJ7gczYSjHFf/G5a5zrKhbWwr1vY99xb9wXVlsXvb8ped+3CNczM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSbRMoajvYItCwr00Qcp1S3MjFcKv52CeEkwOeKhjKiyIb0A3L
 grA0gexbx5diCzyKMOGNsOhAmEpxbzSwvkW2c5tYQFHbTymDPh3R
X-Gm-Gg: ASbGncsgbhItuSJOdMVYzf0mvnleRqKQ8UFpCaSYqGhTaEnD/OtuT5SV8tgfcvCIpJL
 lSpLzlQhG5Ecg9XVp+0sNIqLh4wlFkRLr494/eOZvTEHjaXt5LgS6S0c/NmVj5X/4VX3M3jXadm
 ljX42/THbyWsbubeaSta7Lg8i1mKEbxMGrs59j7etuPkWAmfC8UprlDbttnoxKfYDuSWGCJbpI/
 25hAG+9rkQbK/RIL0JKxlL7qI5Bs4Pnjgpmd4ZwZlqkg32/5nwZP/3Tm729cy7D9hLfAvx8GjTc
 k3MmkE8MhvnkXyQMNfpiXCZ3KXI+sstgGWAuYcWl1uwwnBAtbPw6dGmd92QXGwx7YYguOPGBOWB
 8gkJ7haY=
X-Google-Smtp-Source: AGHT+IGNQCSAoc8LmGQF8EIc7kQM08OmFnoqINHm9aEb6FKPQifoConKvW4zjpQ3SOkR7ennZ2vyzQ==
X-Received: by 2002:a17:907:7210:b0:ab7:c1d5:14f9 with SMTP id
 a640c23a62f3a-abf25d952edmr1400872266b.10.1740942598830; 
 Sun, 02 Mar 2025 11:09:58 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf599604cesm289760666b.126.2025.03.02.11.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 11:09:58 -0800 (PST)
Date: Sun, 2 Mar 2025 19:09:54 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <20250302190954.2d7e068f@pumpkin>
In-Reply-To: <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
 <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
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

On Mon, 3 Mar 2025 01:29:19 +0800
Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> Hi Yury,
> 
> On Sun, Mar 02, 2025 at 11:02:12AM -0500, Yury Norov wrote:
> > On Sun, Mar 02, 2025 at 04:20:02PM +0800, Kuan-Wei Chiu wrote:  
> > > Hi Yury,
> > > 
> > > On Sat, Mar 01, 2025 at 10:10:20PM -0500, Yury Norov wrote:  
> > > > On Sat, Mar 01, 2025 at 10:23:52PM +0800, Kuan-Wei Chiu wrote:  
> > > > > Add generic C implementations of __paritysi2(), __paritydi2(), and
> > > > > __parityti2() as fallback functions in lib/parity.c. These functions
> > > > > compute the parity of a given integer using a bitwise approach and are
> > > > > marked with __weak, allowing architecture-specific implementations to
> > > > > override them.
> > > > > 
> > > > > This patch serves as preparation for using __builtin_parity() by
> > > > > ensuring a fallback mechanism is available when the compiler does not
> > > > > inline the __builtin_parity().
> > > > > 
> > > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > > ---
> > > > >  lib/Makefile |  2 +-
> > > > >  lib/parity.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> > > > >  2 files changed, 49 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 lib/parity.c
> > > > > 
> > > > > diff --git a/lib/Makefile b/lib/Makefile
> > > > > index 7bab71e59019..45affad85ee4 100644
> > > > > --- a/lib/Makefile
> > > > > +++ b/lib/Makefile
> > > > > @@ -51,7 +51,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
> > > > >  	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
> > > > >  	 percpu-refcount.o rhashtable.o base64.o \
> > > > >  	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
> > > > > -	 generic-radix-tree.o bitmap-str.o
> > > > > +	 generic-radix-tree.o bitmap-str.o parity.o
> > > > >  obj-y += string_helpers.o
> > > > >  obj-y += hexdump.o
> > > > >  obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
> > > > > diff --git a/lib/parity.c b/lib/parity.c
> > > > > new file mode 100644
> > > > > index 000000000000..a83ff8d96778
> > > > > --- /dev/null
> > > > > +++ b/lib/parity.c
> > > > > @@ -0,0 +1,48 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > +/*
> > > > > + * lib/parity.c
> > > > > + *
> > > > > + * Copyright (C) 2025 Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > > + * Copyright (C) 2025 Yu-Chun Lin <eleanor15x@gmail.com>
> > > > > + *
> > > > > + * __parity[sdt]i2 can be overridden by linking arch-specific versions.
> > > > > + */
> > > > > +
> > > > > +#include <linux/export.h>
> > > > > +#include <linux/kernel.h>
> > > > > +
> > > > > +/*
> > > > > + * One explanation of this algorithm:
> > > > > + * https://funloop.org/codex/problem/parity/README.html  
> > > > 
> > > > I already asked you not to spread this link. Is there any reason to
> > > > ignore it?
> > > >   
> > > In v2, this algorithm was removed from bitops.h, so I moved the link
> > > here instead. I'm sorry if it seemed like I ignored your comment.  
> > 
> > Yes, it is.
> >    
> > > In v1, I used the same approach as parity8() because I couldn't justify
> > > the performance impact in a specific driver or subsystem. However,
> > > multiple people commented on using __builtin_parity or an x86 assembly
> > > implementation. I'm not ignoring their feedback-I want to address these  
> > 
> > Please ask those multiple people: are they ready to maintain all that
> > zoo of macros, weak implementations, arch implementations and stubs
> > for no clear benefit? Performance is always worth it, but again I see
> > not even a hint that the drivers care about performance. You don't
> > measure it, so don't care as well. Right?
> >   
> > > comments. Before submitting, I sent an email explaining my current
> > > approach: using David's suggested method along with __builtin_parity,
> > > but no one responded. So, I decided to submit v2 for discussion
> > > instead.  
> > 
> > For discussion use tag RFC.
> >   
> > > 
> > > To avoid mistakes in v3, I want to confirm the following changes before
> > > sending it:
> > > 
> > > (a) Change the return type from int to bool.
> > > (b) Avoid __builtin_parity and use the same approach as parity8().
> > > (c) Implement parity16/32/64() as single-line inline functions that
> > >     call the next smaller variant after xor.
> > > (d) Add a parity() macro that selects the appropriate parityXX() based
> > >     on type size.
> > > (e) Update users to use this parity() macro.
> > > 
> > > However, (d) may require a patch affecting multiple subsystems at once
> > > since some places that already include bitops.h have functions named
> > > parity(), causing conflicts. Unless we decide not to add this macro in
> > > the end.
> > > 
> > > As for checkpatch.pl warnings, they are mostly pre-existing coding
> > > style issues in this series. I've kept them as-is, but if preferred,
> > > I'm fine with fixing them.  
> > 
> > Checkpatch only complains on new lines. Particularly this patch should
> > trigger checkpatch warning because it adds a new file but doesn't touch
> > MAINTAINERS. 
> >   
> For example, the following warning:
> 
> ERROR: space required after that ',' (ctx:VxV)
> #84: FILE: drivers/input/joystick/sidewinder.c:368:
> +                       if (!parity64(GB(0,33)))
>                                           ^
> 
> This issue already existed before this series, and I'm keeping its
> style unchanged for now.
> 
> > > If anything is incorrect or if there are concerns, please let me know.
> > > 
> > > Regards,
> > > Kuan-Wei
> > > 
> > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > > index c1cb53cf2f0f..47b7eca8d3b7 100644
> > > --- a/include/linux/bitops.h
> > > +++ b/include/linux/bitops.h
> > > @@ -260,6 +260,43 @@ static inline int parity8(u8 val)
> > >  	return (0x6996 >> (val & 0xf)) & 1;
> > >  }
> > > 
> > > +static inline bool parity16(u16 val)
> > > +{
> > > +	return parity8(val ^ (val >> 8));
> > > +}
> > > +
> > > +static inline bool parity32(u32 val)
> > > +{
> > > +	return parity16(val ^ (val >> 16));
> > > +}
> > > +
> > > +static inline bool parity64(u64 val)
> > > +{
> > > +	return parity32(val ^ (val >> 32));
> > > +}  
> > 
> > That was discussed between Jiri and me in v2. Fixed types functions
> > are needed only in a few very specific cases. With the exception of
> > I3C driver (which doesn't look good for both Jiri and me), all the
> > drivers have the type of variable passed to the parityXX() matching 
> > the actual variable length. It means that fixed-type versions of the
> > parity() are simply not needed. So if we don't need them, please don't
> > introduce it.
> >  
> So, I should add the following parity() macro in v3, remove parity8(),
> and update all current parity8() users to use this macro, right?
> 
> I changed u64 to __auto_type and applied David's suggestion to replace
> the >> 32 with >> 16 >> 16 to avoid compiler warnings.
> 
> Regards,
> Kuan-Wei
> 
> #define parity(val)					\
> ({							\
> 	__auto_type __v = (val);			\
> 	bool __ret;					\
> 	switch (BITS_PER_TYPE(val)) {			\
> 	case 64:					\
> 		__v ^= __v >> 16 >> 16;			\
> 		fallthrough;				\
> 	case 32:					\
> 		__v ^= __v >> 16;			\
> 		fallthrough;				\
> 	case 16:					\
> 		__v ^= __v >> 8;			\
> 		fallthrough;				\
> 	case 8:						\
> 		__v ^= __v >> 4;			\
> 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> 		break;					\
> 	default:					\
> 		BUILD_BUG();				\
> 	}						\
> 	__ret;						\
> })

I'm seeing double-register shifts for 64bit values on 32bit systems.
And gcc is doing 64bit double-register maths all the way down.

That is fixed by changing the top of the define to
#define parity(val)					\
({							\
	unsigned int __v = (val);			\
	bool __ret;					\
	switch (BITS_PER_TYPE(val)) {			\
	case 64:					\
		__v ^= val >> 16 >> 16;			\
		fallthrough;				\

But it's need changing to only expand 'val' once.
Perhaps:
	auto_type _val = (val);
	u32 __ret = val;
and (mostly) s/__v/__ret/g

	David
