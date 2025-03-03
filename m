Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A60A4C080
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCED10E245;
	Mon,  3 Mar 2025 12:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="glDehYEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F83810E406
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:41:32 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5e538388dd1so1593545a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 04:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741005691; x=1741610491; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kLW0AYaLwkO6JC1piDU5qS15yDYOQslsP1SvNrbEZfE=;
 b=glDehYExcdnKsRL9WNO9Yd+Er6fah6RBDKq1tuLahmDAqEaB0ancKmD5Uold7qeCpj
 490VZ+MYM08Lwm8YIhET3OzbEYiWt4FLamt2kauCuW+V2yreeF0pHlKavgQpOhrYEz+7
 13LyjJUbxhuteAD3uT9srwXcKfybkSzEOpJC3q/cYKjgLmisHs2R28tx479iYMophJA3
 uvlUCxuGJg03DFjzhMdY6OmwUwaCbFrbrgoy6EoWGcwM1NLSPtx4YxoJc1rL5Z7CKsE5
 eYDHerSqMnisYIUsvXuetAxrwSNf236O6tqjcwwSiS6qb1B+dXXiocTInOJ1B5/hbrX4
 Lleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741005691; x=1741610491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kLW0AYaLwkO6JC1piDU5qS15yDYOQslsP1SvNrbEZfE=;
 b=jE1TW4/JhjwkSi2F66MPAqvQVWRfcdarW3pYUHl0DU3C9bALVmiNuD8SDuYpKXZ5mf
 aaszbX7qo5MSC+i3jvV+Hlxpb2bVaTspMV2jwD5fAoKHWIgUi7aKu4PbkDj8zMpkvWD9
 x08fCN362sM80usYin/Yb9v6NHp5vDKNlRYu1V+eOclA2uoFSbUsU+JQSAJejTdDRVDr
 oiJwE165xld+z64tee67Gs+KdrrijvSLjpYSwXGODn3+HJMWUb5AOU8TR/8MUgSIpPZC
 bQ3nBaGqWakNbrsCUyyEomZhh7Nk3/U79eiHOuEIWVSNw+AnaUDhS+KqmiN1vQZzW09D
 NvOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOzpNX24BpMs2Ws+UMRHl+/7imWGCZYStKOYW+dCeIl1OmcH5DuPd+PHBj3nPbt2vrsFr92yTFqyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+kbl0OGsg+0JuFLkzwFuobSHk1xraL3+Y0a/00Yp5PbmGYm9S
 8fZH5K/JbJ33xWZVVuMnwmmJ4RaTnzVzjcLfBEcqvibsqXMNUrEP
X-Gm-Gg: ASbGncsIqKnCOipKD/EwX+aC/CrzcZjxTZPVKmpSwkDivWlG2nIb8o170b8XL7lCSNb
 TOcvCpBSinfOTuqNc4kSlP9HnKwsjqR+2xFhAzkMmEhb70zZznN8POUkzv/hN0Ls2Zpm9KpSKe/
 nEiUYS6W4GOvLOYAz91Iap2LA91omOlNpHS7JwLnUuJbv2c0Xsa0ZxfVhtgYf6L4da067VQGPwD
 kr6qODvlo+caaa871ZKuc616pAbFkuvzU5P5VyhghB+WpWH8e/o3lEBmBPmSrXDURUIdgYBMsLA
 WQVKa67aaRWCNYvH07E7vLNvLifi0BkE+B8OCDKevs66v3v6tE6Wi8pIN1AtfiftjAVDR44WGrx
 hQjA6J2g=
X-Google-Smtp-Source: AGHT+IGmsdmZpDuU64/zBFVRQ3e/o9vGnleqAFoX6F+q7Lw2p71TWS5SPeiWtsRpxGv/SLlt+kfa+w==
X-Received: by 2002:a05:6402:2808:b0:5e4:d2d4:b4f3 with SMTP id
 4fb4d7f45d1cf-5e4d6af1582mr13492784a12.14.1741005688031; 
 Mon, 03 Mar 2025 04:41:28 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3fb4384sm6903702a12.49.2025.03.03.04.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 04:41:27 -0800 (PST)
Date: Mon, 3 Mar 2025 12:41:25 +0000
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
Message-ID: <20250303124125.4975afdc@pumpkin>
In-Reply-To: <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
 <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
 <20250302190954.2d7e068f@pumpkin>
 <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
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

On Mon, 3 Mar 2025 10:47:20 +0800
Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> On Sun, Mar 02, 2025 at 07:09:54PM +0000, David Laight wrote:
> > On Mon, 3 Mar 2025 01:29:19 +0800
> > Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> >   
> > > Hi Yury,
> > > 
...
> > > #define parity(val)					\
> > > ({							\
> > > 	__auto_type __v = (val);			\
> > > 	bool __ret;					\
> > > 	switch (BITS_PER_TYPE(val)) {			\
> > > 	case 64:					\
> > > 		__v ^= __v >> 16 >> 16;			\
> > > 		fallthrough;				\
> > > 	case 32:					\
> > > 		__v ^= __v >> 16;			\
> > > 		fallthrough;				\
> > > 	case 16:					\
> > > 		__v ^= __v >> 8;			\
> > > 		fallthrough;				\
> > > 	case 8:						\
> > > 		__v ^= __v >> 4;			\
> > > 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > 		break;					\
> > > 	default:					\
> > > 		BUILD_BUG();				\
> > > 	}						\
> > > 	__ret;						\
> > > })  
> > 
> > I'm seeing double-register shifts for 64bit values on 32bit systems.
> > And gcc is doing 64bit double-register maths all the way down.
> > 
> > That is fixed by changing the top of the define to
> > #define parity(val)					\
> > ({							\
> > 	unsigned int __v = (val);			\
> > 	bool __ret;					\
> > 	switch (BITS_PER_TYPE(val)) {			\
> > 	case 64:					\
> > 		__v ^= val >> 16 >> 16;			\
> > 		fallthrough;				\
> > 
> > But it's need changing to only expand 'val' once.
> > Perhaps:
> > 	auto_type _val = (val);
> > 	u32 __ret = val;
> > and (mostly) s/__v/__ret/g
> >  
> I'm happy to make this change, though I'm a bit confused about how much
> we care about the code generated by gcc. So this is the macro expected
> in v3:

There is 'good', 'bad' and 'ugly' - it was in the 'bad' to 'ugly' area.

> 
> #define parity(val)					\
> ({							\
> 	__auto_type __v = (val);			\
> 	u32 __ret = val;				\
> 	switch (BITS_PER_TYPE(val)) {			\
> 	case 64:					\
>                 __ret ^= __v >> 16 >> 16;		\
> 		fallthrough;				\
> 	case 32:					\
> 		__ret ^= __ret >> 16;			\
> 		fallthrough;				\
> 	case 16:					\
> 		__ret ^= __ret >> 8;			\
> 		fallthrough;				\
> 	case 8:						\
> 		__ret ^= __ret >> 4;			\
> 		__ret = (0x6996 >> (__ret & 0xf)) & 1;	\
> 		break;					\
> 	default:					\
> 		BUILD_BUG();				\
> 	}						\
> 	__ret;						\
> })

That looks like it will avoid double-register shifts on 32bit archs.
arm64 can do slightly better (a couple of instructions) because of its
barrel shifter.
x86 can do a lot better because of the cpu 'parity' flag.
But maybe it is never used anywhere that really matters.

	David


