Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8F8A57282
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 20:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025F610E1A7;
	Fri,  7 Mar 2025 19:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l/HX6iku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1511C10E1A7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 19:53:16 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so13296785e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 11:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741377194; x=1741981994; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OFjCWoFVVseHqDKPyVju+l4iTZxEMM/BbzUS5g6rWQg=;
 b=l/HX6ikuguG6csg3SXIkoydbdI7TalFX4zfqCzn/zVliRjqQb8rsVzY/f+f/71lwpm
 kn/tM+4NCPxP8/NJUW2TYoFQJQ/qbpA5S5UQAAbLIy50mG05SD4Q+qu3pzO9lAxIDysb
 ComZbqFvDnK0z1PJdn2trPhL8gpLgpjSZroc3lvmc5LU3d/zhu5BvbXEpGMjcYoZhOhf
 JPvnop8+P/pdKHvUnNPUhmV95mld6QBXqB+tphndYiWmrAStpUT7KapxJXjIbaTU1ZDn
 UBOQ/55/cEqZ5Hg+kjWUtDdZHVnwshLas49e7vtXarFFi+XyC3EOXwYnSn+qK4/bHUmX
 vovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741377194; x=1741981994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OFjCWoFVVseHqDKPyVju+l4iTZxEMM/BbzUS5g6rWQg=;
 b=RK53/dDJJZfQSJx739Gk0lMnVysbul+tC5rcuh95QmOxe6kXzUEQSB9AD0JO+fGH34
 a45fma+bsk85wl6elSQ+RLAbROsj6nE3UgU3CrZT1kvCwH42YZ0mLY2p1qwy82qgoXhs
 y741Ri/VQnOjVGXQCa+w9mgawEElOCnTMKS0TNnY70KmEsRxWUco4pa/XeFZiQkdB/Yd
 pzuT9YeaXO2r2zYoj9swY99/xYyDxs+scSswQN7E3WdqaZXeyfhHhgkGGLCVfIEx+Net
 wZvsetcWMa2v+6WxzMt8/ctEWXu6j99Aby5NNeaE55gEwreF9a3wsPMXMrqYwtb+S7UE
 fnIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt2RNLbhjA4JGDCORqF6XlRyBTl+fzu9+YMjVCPlqAwiEpGsVUoFj2rFEkE9pk2IqLmxc7t3r9XZ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9KJcsZd645cLgP78ds/V4/KqY01eJ265G+euJe1X7lVwcRYBD
 +L0RO1+CLD7E+ngE4VW4GhPJ/sAeUqX8t1wa9sSh2/pNz9TJxRJS
X-Gm-Gg: ASbGncs3zJJQzBvAnZ9WDM/vOlRBeTudx/IMal4MklHmWO62CIGa5X6DiCG/Pb6NGx6
 VEev87UiOao83KQ5H6oZG/O9Wk1WHbQ4dM1cmBx9B36nQZ4cziqLxMW9uJ1BdzTdSBYBK8pQG/1
 f20YHJ3zG2kBsj+ATqXqUjzX4SFSUFAcmwjOY08Tevu2PlIfrobppwhqQz2R4/C7ahea5dAT7fj
 Oiqdqvf9l5hEw6OJbT1oV4R0fYDVE/s3hxFQLjWg7yf8Eb8Wxx9jfXiJhdKzm9VHocq2tGcXMt2
 teysgXuTJX97aIEpXiHU90Fhsj3t0xaXHFL4xkfX//bH48KQIrWUMNMXF8psk9qpiVuFXJt3Ci/
 2yMy/nYE=
X-Google-Smtp-Source: AGHT+IFtUYsYiNnYKhfvrcaN1ioOhGevW7gRyAbgDR19AZMXszweQZgGUKeQX4mOm4dqyM9BgE29Gg==
X-Received: by 2002:a05:6000:18ab:b0:391:122c:8aa with SMTP id
 ffacd0b85a97d-39132d96079mr3226538f8f.30.1741377194381; 
 Fri, 07 Mar 2025 11:53:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01d2cdsm6394936f8f.57.2025.03.07.11.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 11:53:13 -0800 (PST)
Date: Fri, 7 Mar 2025 19:53:10 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 akpm@linux-foundation.org, alistair@popple.id.au, andrew+netdev@lunn.ch,
 andrzej.hajda@intel.com, arend.vanspriel@broadcom.com,
 awalls@md.metrocast.net, bp@alien8.de, bpf@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 dave.hansen@linux.intel.com, davem@davemloft.net,
 dmitry.torokhov@gmail.com, dri-devel@lists.freedesktop.org,
 eajames@linux.ibm.com, edumazet@google.com, eleanor15x@gmail.com,
 gregkh@linuxfoundation.org, hverkuil@xs4all.nl, jernej.skrabec@gmail.com,
 jirislaby@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 johannes@sipsolutions.net, jonas@kwiboo.se, jserv@ccns.ncku.edu.tw,
 kuba@kernel.org, linux-fsi@lists.ozlabs.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@rasmusvillemoes.dk,
 louis.peens@corigine.com, maarten.lankhorst@linux.intel.com,
 mchehab@kernel.org, mingo@redhat.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, neil.armstrong@linaro.org, netdev@vger.kernel.org,
 oss-drivers@corigine.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at,
 simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de, vigneshr@ti.com,
 visitorckw@gmail.com, x86@kernel.org, yury.norov@gmail.com
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <20250307195310.58abff8c@pumpkin>
In-Reply-To: <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
 <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
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

On Fri, 07 Mar 2025 11:30:35 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> (int)true most definitely is guaranteed to be 1.  
> >
> >That's not technically correct any more.
> >
> >GCC has introduced hardened bools that intentionally have bit patterns
> >other than 0 and 1.
> >
> >https://gcc.gnu.org/gcc-14/changes.html
> >
> >~Andrew  
> 
> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
> for compiler-generated conversations that's still a given, or the manager isn't C
> or anything even remotely like it.
> 

The whole idea of 'bool' is pretty much broken by design.
The underlying problem is that values other than 'true' and 'false' can
always get into 'bool' variables.

Once that has happened it is all fubar.

Trying to sanitise a value with (say):
int f(bool v)
{
	return (int)v & 1;
}    
just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)

I really don't see how using (say) 0xaa and 0x55 helps.
What happens if the value is wrong? a trap or exception?, good luck recovering
from that.

	David
