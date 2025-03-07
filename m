Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA85A571FE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 20:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A4210E9B9;
	Fri,  7 Mar 2025 19:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MqxK2lpT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43C610EAF1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 19:36:49 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43bc4b16135so13513645e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 11:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741376208; x=1741981008; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xFoJyn4DTa2CPJIrOrIuaVtmodM0qzkMs+rPvEMHc5M=;
 b=MqxK2lpTM4EmaP+Q/RWT+fE1c2NT0kjv2u5cHfFyCQ1U77CRRMMi3TP/d1lKvl6NRG
 FfvxXANsNvsunVY4Mgo+ulE7AD6X3vRijKQVuVi2OuxLe1CGdcX29XhAro21z2af18vT
 7HEd6I7Z9X19frLVVNFKKA71OEn/GCACRU+sMQ8R2NmtUiuvssZ5NUOD6/uqXvlqbyj7
 4gCQvOFzq6OlqDCXeY0jOodyRASIKBrgBt67S4/fMWjWgjTaxeMyH/LPx1vdGh7pDFha
 INTGsl24ixgya/5vfiDe5jXxoL7ibCQgKGZzYNVZKllNuRlYd26Gi/ADZqKRKcoa8/Ts
 1qxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741376208; x=1741981008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xFoJyn4DTa2CPJIrOrIuaVtmodM0qzkMs+rPvEMHc5M=;
 b=pNuKY6vF3ZEzNOZAE3dWxS0w+FHhO7thH5tlpsl9yU3aYEbdKyaMnXKGNR9vXWljGf
 CJaORIrpXakkcHit/hjTHTkJh52HDDq13yEJJ4Pyj21cpVDijQDApEW38Go6bcUZHIli
 sq4dZAmYHH5ETpJwMpC3msvMUiIk36L0vd+E7TQPRZHH5um3zBIYMVKAG40u1qqsNELP
 i3SYWFSymt7GUlYbLeRyutsH7Ko5YPFjkHOzrUFVxJdk/p6N1+s0onsiHqAp0H0ciegd
 bT3/+xrTXP62fmXOqob0WzV5b7oOLqFXnch3ijwpxNUUcA4klokdcnQLojOD1Iddm5Of
 ie6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl+JqnrLlJ5XHNprOs1yf2dcltiWyeVvPaEnC4NVuZz31UshsuOL5RfjJfsv7NCHPWhvj1Hx8lkUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8pPnsdLEsKRztuNA1gR2ifSx6rZ7/fB5+FPhvR6M5O+MB05Kn
 xfr9GtptHhhxQ0YA3a4kA/4HTjiHAX5r/QlAyBsz54Ei+xHcF4Nv
X-Gm-Gg: ASbGncs1ZX67MDqQEn144qb2wJSbxDeq95fySL2MZS9RLk7HIYRYqv+0CBLdZyJ5EVW
 9KjtZa1yB+Gpw5yOjRSEhPWb7k2/ruZm2uyXzSy1VBqNW5l3xLjNc3m7c4UBw6WiLi/pYmll8hv
 JU12xXCay7M5afJcvt90S+csvu4RJmyt9w7x94hDt24CE4M9NQv1av1cjJbA5GaISMUhZXYYXYg
 IpYwZEN73FsdsoHhzYvBA9DGJFvdfmOz0OJgJqQi5BvrOCdFg+f7MSuL1hgQEVlxjqRTYHjP1lB
 mpcGjuNGvnKWZajJqtuHn1ZOv2+6dXabBWxg7x/+OsoIA0f+3JkU/DpoLmt0/8kgPyWYVXp0oRt
 2zMpl1jo=
X-Google-Smtp-Source: AGHT+IGYxYOhWA1l6Gh+krzanMxcdhuAnlJytBsEAg4OGnrOW8+O9FUNnMqzwJ9p5yYRvsqSKnj7Zw==
X-Received: by 2002:a05:600c:3007:b0:43b:c034:57b1 with SMTP id
 5b1f17b1804b1-43c6024be64mr30043695e9.20.1741376208006; 
 Fri, 07 Mar 2025 11:36:48 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c1030cfsm6392462f8f.90.2025.03.07.11.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 11:36:47 -0800 (PST)
Date: Fri, 7 Mar 2025 19:36:43 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
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
 yury.norov@gmail.com, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <20250307193643.28065d2d@pumpkin>
In-Reply-To: <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
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

On Fri, 7 Mar 2025 12:42:41 +0100
Jiri Slaby <jirislaby@kernel.org> wrote:

> On 07. 03. 25, 12:38, Ingo Molnar wrote:
> > 
> > * Jiri Slaby <jirislaby@kernel.org> wrote:
> >   
> >> On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:  
> >>> Change return type to bool for better clarity. Update the kernel doc
> >>> comment accordingly, including fixing "@value" to "@val" and adjusting
> >>> examples. Also mark the function with __attribute_const__ to allow
> >>> potential compiler optimizations.
> >>>
> >>> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >>> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> >>> ---
> >>>    include/linux/bitops.h | 10 +++++-----
> >>>    1 file changed, 5 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> >>> index c1cb53cf2f0f..44e5765b8bec 100644
> >>> --- a/include/linux/bitops.h
> >>> +++ b/include/linux/bitops.h
> >>> @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
> >>>    /**
> >>>     * parity8 - get the parity of an u8 value
> >>> - * @value: the value to be examined
> >>> + * @val: the value to be examined
> >>>     *
> >>>     * Determine the parity of the u8 argument.
> >>>     *
> >>>     * Returns:
> >>> - * 0 for even parity, 1 for odd parity
> >>> + * false for even parity, true for odd parity  
> >>
> >> This occurs somehow inverted to me. When something is in parity means that
> >> it has equal number of 1s and 0s. I.e. return true for even distribution.
> >> Dunno what others think? Or perhaps this should be dubbed odd_parity() when
> >> bool is returned? Then you'd return true for odd.  
> > 
> > OTOH:
> > 
> >   - '0' is an even number and is returned for even parity,
> >   - '1' is an odd  number and is returned for odd  parity.  
> 
> Yes, that used to make sense for me. For bool/true/false, it no longer 
> does. But as I wrote, it might be only me...

No me as well, I've made the same comment before.
When reading code I don't want to have to look up a function definition.
There is even scope for having parity_odd() and parity_even().
And, with the version that shifts a constant right you want to invert
the constant!

	David




