Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39112A4C57B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C425C10E1A9;
	Mon,  3 Mar 2025 15:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PiKPsujE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEA110E1A9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:43:31 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e589c258663so5042919276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 07:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741016610; x=1741621410; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1bze7IhHFHWNKOAl2fnuzVpo5poDDbwUFQZHYPw6zzY=;
 b=PiKPsujETtGUrCV9mcWzsH3lTaNMZ55K1FaLU2rofqHyMqLTURjszoc8gr5eVeDZyp
 BdZ9JJr+H9CMZ6pE5iPsqVvyPIWK2V6jKxbwZViZTcF6anQB1QY4AuKiEZsOdtrj2L+G
 0tSBLyfAUQbmkB4MWxKcXZP7p54ttwAmNao0Wj+8n11R+cdNb5BumxogLSUp4txJrKdE
 pa044d2sW1HvpxXxAmgWI9uUmRUMHkOpDR+49uu7DSFKYsmxvS+6zO3MVZvg9mry7XKA
 lYhf19Il7dCPJT+c11n6P+rw9dWSqcfk+CLo3cZtJ3Z3jPOL4eNzXIlvDV65VR4S5gWP
 TTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741016610; x=1741621410;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1bze7IhHFHWNKOAl2fnuzVpo5poDDbwUFQZHYPw6zzY=;
 b=eAgJQnn1I4qVJ5FjhZEHJyV5jJiXVhdD9Mxzohxhh+cey6dSkI/o1FVhORJi/OQFOj
 NUgO/MikLN7cV+joadnXVjxIizCta+iu/vp0EAGr67qlJcBgbwfdbpeI83r+ps9pRHy4
 4Yke3enHPgEz/a4mQcAVJTmD2DJcpjUJVLs6HFP6LqECHcFnFzKcypa+IKYoAMzk3apZ
 T+huOojMr5ZjCSmguNKx5awA9jm0yg5y5kWqdEmWcrOEENAdm8tuNM23Xz1aiT5L7Rsk
 dvgvP5Bf9sPH/qvLwtbiaV4zD3iSL6UcE2omVGYJJU2FTgg8y1zT3bGoGyhUc2uoZvHS
 829A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlut7KE9DNFNHI4lbIblHlUGioIOYp8qkePMBrKqBtf/24PCUFM8PqgwOsiGta20fPvPdwCZd/auI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz040I79Xjnfqau1+1ttVphxiRnyPG930lWI4XUhh3OUh7GB9de
 b5h3J0ZALltNmDlEm4kURne4f/7ETV2qniYKenIW+LVP5LUwOKxy
X-Gm-Gg: ASbGncsrapIJtDD4m1qjRFul7DeTh5UBw2we0viUqCOwe2PkhbNGyOcO2rNOv6FO5rW
 I6Sb42BX0zJsxZrvkygrEEYJUgxgYT5/a3r3AcHnWuoP7AEFWkXiAMC8ht/9y536m60efONi9kf
 ziiGirnoNhW9Fk1qMeHI87oX31ldVJYwA0xcP1cIO718K6y/97cNX0aOwnC72eMiPvv5pD+LRzQ
 3g7xcnzTXY+eml+BkcS9TE970XYXyGWQeXk34OU9MpnasyFoBs9Y921KP+Q2KUeFl4pLu8r/dAT
 BzSwwQnXnDhPvq1ak8avwx6NzztQJGUAlG/g06rThCWS2Wqsw0HlzY7oTwQ9U723cpNuQRYNgOm
 gK9qW
X-Google-Smtp-Source: AGHT+IG89LZIvDJlj/3HacLk9/vOGUR8YR6jlY63nvw+Gy77ela/IFHbq/QbvXbn9Hpv7+y9TBQguw==
X-Received: by 2002:a05:6902:2748:b0:e5d:dda6:d25 with SMTP id
 3f1490d57ef6-e60b2f5f1d5mr16067385276.45.1741016609877; 
 Mon, 03 Mar 2025 07:43:29 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e60a3a20448sm3017480276.3.2025.03.03.07.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:43:29 -0800 (PST)
Date: Mon, 3 Mar 2025 10:43:28 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
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
Message-ID: <Z8XOF2DMMRKqam6R@thinkpad>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
 <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
 <20250302190954.2d7e068f@pumpkin>
 <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
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

On Mon, Mar 03, 2025 at 10:47:20AM +0800, Kuan-Wei Chiu wrote:
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

We do care about code generated by any compiler. But we don't spread
hacks here and there just to make GCC happy. This is entirely broken
strategy. Things should work the other way: compiler people should
collect real-life examples and learn from them.

I'm not happy even with this 'v >> 16 >> 16' hack, I just think that
disabling Wshift-count-overflow is the worse option. Hacking the macro
to optimize parity64() on 32-bit arch case doesn't worth it entirely.

In your patchset, you have only 3 drivers using parity64(). For each
of them, please in the commit message refer that calling generic
parity() with 64-bit argument may lead to sub-optimal code generation
with a certain compiler against 32-bit arches. If you'll get a
feedback that it's a real problem for somebody, we'll think about
mitigating it. 
 
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
