Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D876A46E90
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 23:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21A310E9EC;
	Wed, 26 Feb 2025 22:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QnXEX9P1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C643B10E9EC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 22:29:15 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-439ac3216dcso2198245e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 14:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740608954; x=1741213754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TfWwQBkEse5FRQekJZuNar17CRdvAyTkX7+fO0J+m/4=;
 b=QnXEX9P10e7htXeLUlQzA5vFXqnz6MqpXLyyKVzyLZnTRIcpC/QYHlYBzvGiEyECu+
 B2D6uQeZmQjYNMbym1OSh3PBDcz3X69HFYPJy9WKC81iV4Qoda6vHdgMNYdeU6YdgG51
 bevnPtj/ZMdXMN9/w3mYLI1qbbh8UE8SnCoJ+lKalGlY1aB0Vahc5IxWLE9ykoNyk183
 v4Q4LoSHtTFghqdnxy8GJ2/WfhXMrrwzAQOBAmP/1SsvZlyWOg2KWzH+vxNJIPsozESU
 bp8k4cAeERMNHoHZds3sAQqdWXfv98uVr0hfOO8y1ZHhw3hcvmTd2X2gUcGtf89S0XpR
 1ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740608954; x=1741213754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TfWwQBkEse5FRQekJZuNar17CRdvAyTkX7+fO0J+m/4=;
 b=ZyZV5sGZW5/o43gM/BuKt6BoI0fb6fYqCPBnof5a+YLdFK3ygOm/HIKUxVDzlRCoaX
 MO4/X1Ql27y1OOzw+ZvLTYWfoJpYf8WCR4l6ONp4IKfaw8JX1d+LuvUv7623YJAggZLt
 SIBlGeYUx9USUN5fS7Sw8o+1xwfCoNqBeRXqxouFastmePt04+kphRLW4dxQrTeoR55u
 BU0iK5vsVGKsEPrNbNd7H57aAlcrX6X/OBpE92oE0LlJ/9k+osyWkW03F577GRppcoHl
 aDnWjaFz83j1okAa87KJzqfpAW3ZEEd6iEoHX+jVeaalC/iON2SuNx4V4ZLc+UmvcI9B
 XlPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFR5wYchKKC3Vh9ZqTuDDgOj3Wvj6y5IBtna3DbSu6uvNzlId73d3TshRvIS6Xs3SSP2h86nA4+Io=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPZTw3XYZe5P3xm8Dv6+bU1kND0PUVtFAxWcH7ePWgc4mpmh1P
 fDcPifAPK6J6Z6pouHOZso4ILFYeczl8g1tYBew1/v+iUWS2iKhn
X-Gm-Gg: ASbGnct9ntjI3QLrErOlAK27FaRooCgS04n8xFrkmQZ1e3KYn966hbbfv1HULcOJsQY
 VRzMGKSicG3C05bMo377qy6Y7EDuqpe/vC4G0ekJGRVAhufszn7kxTJyjtZA0BKyB271KDE99Aj
 bVJx0FEwSqZe9nQWP43QBDMnVVhICXMOQwMNUuGxO/D4l0wsDVihvBQfML5u86UOYQxpttdwVBq
 EDBF0ETr7afLDJ0cJmofYAxZZLUzyVuUGfwmJfSvNqOALsXuxqLLlEhq/4pDeUVIVgxqT8IPZTh
 OOQB2eYxRZ1vq/5SbRwYl10Gv9/hkp+sbReGHGYg3ig5Bz2Chf+v9xzH2AFvQ5vw
X-Google-Smtp-Source: AGHT+IGOLpw4Ro1gZlLbKLPuJeugBpGxKDyhpAzWxjxf7AIm0WuOoMev7XCdFdyak+Spbs3OpN2AOA==
X-Received: by 2002:a05:600c:4f47:b0:439:9828:c42c with SMTP id
 5b1f17b1804b1-439aebc27cfmr188697005e9.23.1740608953906; 
 Wed, 26 Feb 2025 14:29:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab37403cfsm55655745e9.1.2025.02.26.14.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 14:29:13 -0800 (PST)
Date: Wed, 26 Feb 2025 22:29:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
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
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <20250226222911.22cb0c18@pumpkin>
In-Reply-To: <Z7zIBwH4aUA7G9MY@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
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

On Mon, 24 Feb 2025 14:27:03 -0500
Yury Norov <yury.norov@gmail.com> wrote:
....
> +#define parity(val)					\
> +({							\
> +	u64 __v = (val);				\
> +	int __ret;					\
> +	switch (BITS_PER_TYPE(val)) {			\
> +	case 64:					\
> +		__v ^= __v >> 32;			\
> +		fallthrough;				\
> +	case 32:					\
> +		__v ^= __v >> 16;			\
> +		fallthrough;				\
> +	case 16:					\
> +		__v ^= __v >> 8;			\
> +		fallthrough;				\
> +	case 8:						\
> +		__v ^= __v >> 4;			\
> +		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> +		break;					\
> +	default:					\
> +		BUILD_BUG();				\
> +	}						\
> +	__ret;						\
> +})
> +

You really don't want to do that!
gcc makes a right hash of it for x86 (32bit).
See https://www.godbolt.org/z/jG8dv3cvs

You do better using a __v32 after the 64bit xor.

Even the 64bit version is probably sub-optimal (both gcc and clang).
The whole lot ends up being a bit single register dependency chain.
You want to do:
	mov %eax, %edx
	shrl $n, %eax
	xor %edx, %eax
so that the 'mov' and 'shrl' can happen in the same clock
(without relying on the register-register move being optimised out).

I dropped in the arm64 for an example of where the magic shift of 6996
just adds an extra instruction.

	David


