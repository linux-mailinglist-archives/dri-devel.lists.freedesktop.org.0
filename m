Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6CFA57091
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 19:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D25A10E191;
	Fri,  7 Mar 2025 18:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ISkWdP4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F2910E69D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 18:30:18 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2235908a30aso14593085ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 10:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741372218; x=1741977018; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ADljs+6QUrhT8gv23eyNcU2smhHAIyZh+jPjPfAngag=;
 b=ISkWdP4FX2C3OxEySFZP/W4oHgfrpvBmtT4NDulWYTE978W+h9qlXW47RPNia5F1hn
 71Cy523XaibdBZqVnh1pX5PRZ2TrPSJqlUYe5YQFjKs7j4sf+YZBhIOJbKvMEO9x1xlj
 bvIIQfDiEsTUBYoM9IaBRpP08C3hrEnUhSj+TI3+u7v6mbjPEI0vjKmWCHH7WedHUuOI
 TD6rmG2tT5Z3Qjq9+YlfcJkCk+dBKnmg4+Ffi9PXUMquw/83PMYtk8MKklkuwwYeTY+4
 E/c4zzp4x8AOE0EJQEHzswg0+EP2yLNaQlyh/230l7rMI/QyO3O26iFhQPhv0Z9eccGL
 I7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741372218; x=1741977018;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ADljs+6QUrhT8gv23eyNcU2smhHAIyZh+jPjPfAngag=;
 b=o/qKnEdegcG+DbPJrjk1dDDaSqBwSnzlrBlnucq5fgvYjuerEiKrbPOSnI/3IOrfmN
 s7wm6/F+e9/rCNsa2WPlLzai9FVvEDahXdrptbC8WqrZca3fhJZFso6o2zyrehirdJs4
 lGEPr+btNXVClAMCTWBSpuJwAFMGfsAXSicjwykwlZpYVYMK8GqQxbqEzPb7g9flS1p8
 k7HaJcbT5vR2gIMf9TVT+JrxEAz8OdENNzOKY/AFhvbnXBJVqIzf+fkvfpBcSzJiTVbA
 GkzB+3kFm+xRBp80RJsBHJ2pGQOEZ7LH7qq1fLdTNO6NO9cz1EDbrBsrgbfsXJ+tBAgH
 q3kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsGLuc0qQOhrNHkN+Jt+NIBT9baTZOfCyH7a/X9VuiZsZytInxd00n+eXfGPHwOt5dxc8NyvGSTnM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy844srWXz97CwsfaNApgGI+FDqnnbUE4GBnsS+pRJpgEZ5iZ42
 flN+Kgmx2TkPZ2wH+TApeJgxsD+WGACeSWaTw+v1tAynwtbwjsDE
X-Gm-Gg: ASbGncunhRKbkuMbkjR/+CUjsA3/nY93bt/rO5D799rvEO9q/Aa+OGJR+wUy55R0J6b
 IqkQN2IJzH8Lhl5DCxgE5WKbvZyHkRkxLl0SJok3UCFzEu8gtvkkCthwmFwU/s3iai1p4YUxZBF
 qOy1uP+i5pRMcSEfaFriDxJ9xL2wLYaGvloMHaqli90VNz7mImqmK42f9H/aA8NELJZdEJXKwxu
 +oYl//uej4CFL+ArLAUxAkgIadAicCcZD4QadGUVlxq/gW4iRnD4SxDWF2QGZub115RKqkGRea+
 4Q/XRBrA8c+EFWSExOelGuIJeBNpBs+sJWUpnK0x1KAfoBRkiytvDvsjp6kGU2113/cp2ReI
X-Google-Smtp-Source: AGHT+IHgn9VYVN+pY6VrcRSpGmZ1OnVGCCY/wp+YVj8MkJGAiDKX4lh0yxX6MBBGMkwIe7/wx2wiPQ==
X-Received: by 2002:a05:6a00:139a:b0:736:520a:58f9 with SMTP id
 d2e1a72fcca58-736aaadf082mr5830777b3a.17.1741372218220; 
 Fri, 07 Mar 2025 10:30:18 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736984f7268sm3588473b3a.116.2025.03.07.10.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 10:30:17 -0800 (PST)
Date: Sat, 8 Mar 2025 02:30:07 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, tglx@linutronix.de, mingo@redhat.com,
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
 akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z8s7L+ZCI/yM5qm4@visitorckw-System-Product-Name>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <3dfc81eb-caa1-42fe-8fd6-61101de0ef13@kernel.org>
 <Z8sW4c5LxV-ITdCi@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8sW4c5LxV-ITdCi@thinkpad>
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

Hi Yury,

On Fri, Mar 07, 2025 at 10:55:13AM -0500, Yury Norov wrote:
> On Fri, Mar 07, 2025 at 07:57:48AM +0100, Jiri Slaby wrote:
> > On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
> > > Several parts of the kernel contain redundant implementations of parity
> > > calculations for 16/32/64-bit values. Introduces generic
> > > parity16/32/64() helpers in bitops.h, providing a standardized
> > > and optimized implementation.
> > > 
> > > Subsequent patches refactor various kernel components to replace
> > > open-coded parity calculations with the new helpers, reducing code
> > > duplication and improving maintainability.
> > > 
> > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > ---
> > > In v3, I use parityXX() instead of the parity() macro since the
> > > parity() macro may generate suboptimal code and requires special hacks
> > > to make GCC happy. If anyone still prefers a single parity() macro,
> > > please let me know.
> > 
> > What is suboptimal and where exactly it matters? Have you actually measured
> > it?
> 
> I asked exactly this question at least 3 times, and have never
> received perf tests or asm listings - nothing. I've never received
> any comments from driver maintainers about how performance of the
> parity() is important for them, as well.
> 
To be clear, I use parityXX() was mainly because you dislike the >>
16 >> 16 hack, and I dislike the #if gcc #else hack—not due to
performance or generated code considerations.

> With the absence of _any_ feedback, I'm not going to take this series,
> of course, for the reason: overengineering.
> 
I'm quite surprised that three separate one-line functions are
considered overengineering compared to a multi-line approach that
requires special handling to satisfy gcc.

> With that said, the simplest way would be replacing parity8(u8) with
> parity(u64) 'one size fits all' thing. I even made a one extra step,
> suggesting a macro that would generate a better code for smaller types
> with almost no extra maintenance burden. This is another acceptable
> option to me.
> 
I'm fine with unifying everything to a single parity(u64) function.
Before I submit the next version, please let me know if anyone has
objections to this approach.

Regards,
Kuan-Wei
