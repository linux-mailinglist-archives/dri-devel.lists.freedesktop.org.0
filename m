Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5C0A4506E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 23:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A3D10E082;
	Tue, 25 Feb 2025 22:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Me2ACZec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC6110E082
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:46:27 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so1568075e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 14:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740523586; x=1741128386; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xEzm5a7MvJg/wvZ+Z8+F/9tGDPPJZX+eI/HEgAntBA=;
 b=Me2ACZecNaZN7F0lro0X/FTDg4hYsLTTFiIHZub/k2dAmGNIoeYKvkWGoTOy59YgKc
 L29jfPfuKuDcSS6yR4li1T23y3chMEUJgnamtGHA9/WgY4udH8CzDmVpxLZhcHSv1F3K
 tWhWMmeX4BNeLk7ZIKG64likKEL36ITo/DDaagoT6x+Bo/cCNBOtL7ijPu+JIeS6uT9b
 aq7jYrs8OlntpznIJI18GysMpp8IZ2ac3Bd3Trsfepl/9+csTpd/HZeVTHkq0EbrSDnz
 xhWvvyiSctl02zOQ6zS7FfbkHR9V2wnLIf2q1JhDfdemBzO5Y+WztlrIwUKgeAZQAisw
 ByWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740523586; x=1741128386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3xEzm5a7MvJg/wvZ+Z8+F/9tGDPPJZX+eI/HEgAntBA=;
 b=UYPsh6S897F2YW6bdHeZpzt+BCcdBXqcyEX/rnC94CMg1DFoSrWmHfY2Mpxt3DQKWB
 VmaHhFgFV57p8+vXkL5NjlN9njrsU3SMcYBqRVm6TZGX6bGpP7R1AeYBUMiTsi3q80zy
 CPaKvD7WAhQXzStGkZ5/d4dqyHXOjDcWnpakOMo86dCty3rfS/opxsM1VvobyRCPGB4L
 vZ/Q0GypDmN1SgVd9SY4LA67NNGUTFM5b3qzghUhhnvhSEQCDhEL+FkLwArvZRCrjQP7
 Rp2gU3wK8ynuY1fpxCGLQ+2UgHXcNvq4ec9k3bdXVWXZJZGu303TQxiYt+PmyVvbqv/y
 naJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXlf33roNclF+3PrKGbqU7rDmU1HuCoOr3DqIxRQBntfd8+Ip+2np6EdL57O0Kzfg/SJxgzS2WGbM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd9QAoFvh8JyqjRffs18YW2sZvHZ+4xwZ4P+HQdBdKFNVZsu5D
 r0/Me4mubbMPtQ2SucvdM6A//q4yOBrjmdjFRO3HM9ghkGZMIC/l
X-Gm-Gg: ASbGncvklADuoCyeFtHiZSrmGbjJ4ymTFuVPQJifn95GZpUR/PVqD1Op1wFfsS8vlLl
 oJnDpi2qcE491aNa2ke8OvsPury5/ADsxDxQINVVS5nm/AX/w1WoGIuQeK+J+84/6UJaevs7Iwl
 8DVtp+fxzuOuW+baYnYeuldv46l8xb9p4JJgm6QPSiAxDKST0HrOqfJ6j49Fp1n2CJlPmYmUJ7G
 bF54C19oFg0xJ7ZT4U2aXH653QYT0+pjb8w9Sfs5reVu2Cq71HgboaeTGlZmBEDwpknU6bhuiOi
 YwEWLQr+8tLax6fxHd1sljggaN7bZnmoH/p+cKOXJMkFby0UN/y5q54c2RYf7gOj
X-Google-Smtp-Source: AGHT+IFjrInluoqnbFjbjbGFkCsa4TCd0YMAhHctzgy+ODQ6ToD9u7urtlYhpUHFZQok7JnATsU7Wg==
X-Received: by 2002:a05:6000:144d:b0:38f:4f17:ee29 with SMTP id
 ffacd0b85a97d-38f6f3dca7amr14183257f8f.17.1740523586194; 
 Tue, 25 Feb 2025 14:46:26 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd88295dsm3621054f8f.45.2025.02.25.14.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 14:46:25 -0800 (PST)
Date: Tue, 25 Feb 2025 22:46:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
 mingo@kernel.org, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
Message-ID: <20250225224623.6edaaaa9@pumpkin>
In-Reply-To: <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
 <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
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

On Mon, 24 Feb 2025 13:55:28 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On 2/24/25 07:24, Uros Bizjak wrote:
> > 
> > 
> > On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:  
> >> Refactor parity calculations to use the standard parity8() helper. This
> >> change eliminates redundant implementations and improves code
> >> efficiency.  
...
> Of course, on x86, parity8() and parity16() can be implemented very simply:
> 
> (Also, the parity functions really ought to return bool, and be flagged 
> __attribute_const__.)
> 
> static inline __attribute_const__ bool _arch_parity8(u8 val)
> {
> 	bool parity;
> 	asm("and %0,%0" : "=@ccnp" (parity) : "q" (val));
> 	return parity;
> }
> 
> static inline __attribute_const__ bool _arch_parity16(u16 val)
> {
> 	bool parity;
> 	asm("xor %h0,%b0" : "=@ccnp" (parity), "+Q" (val));
> 	return parity;
> }

The same (with fixes) can be done for parity64() on 32bit.

> 
> In the generic algorithm, you probably should implement parity16() in 
> terms of parity8(), parity32() in terms of parity16() and so on:
> 
> static inline __attribute_const__ bool parity16(u16 val)
> {
> #ifdef ARCH_HAS_PARITY16
> 	if (!__builtin_const_p(val))
> 		return _arch_parity16(val);
> #endif
> 	return parity8(val ^ (val >> 8));
> }
> 
> This picks up the architectural versions when available.

Not the best way to do that.
Make the name in the #ifdef the same as the function and define
a default one if the architecture doesn't define one.
So:

static inline parity16(u16 val)
{
	return __builtin_const_p(val) ? _parity_const(val) : _parity16(val);
}

#ifndef _parity16
static inline _parity16(u15 val)
{
	return _parity8(val ^ (val >> 8));
}
#endif

You only need one _parity_const().

> 
> Furthermore, if a popcnt instruction is known to exist, then the parity 
> is simply popcnt(x) & 1.

Beware that some popcnt instructions are slow.

	David

> 
> 	-hpa
> 
> 

