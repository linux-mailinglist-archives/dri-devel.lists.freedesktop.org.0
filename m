Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AE78C2510
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 14:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C069610E6EE;
	Fri, 10 May 2024 12:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DcoudDZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EA410E3F8;
 Fri, 10 May 2024 12:49:21 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1eb24e3a2d9so17590385ad.1; 
 Fri, 10 May 2024 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715345361; x=1715950161; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4bGB69MaITj0lj1rbpzgDk3jxO2MebXh7Pspyb5Ws2g=;
 b=DcoudDZDEiM7gy9uMdHXaMnq30gUSRSmG2sdLJup0RPjHlimwXM9uiDFOE7RBguvuH
 aAAdoLFp3oDCiX4qpRW+Q/14a9Q6VOw8sbis5AEVwdQJuEfkKXgbK2IKvcA7JseTcUWA
 8WgLEPabmJJ9nYd+pByUFBxS8iXSHYuxWxHKhkL5FqNowPdVRpWPf9c1049U9eUSheQ3
 2z6bVPTKjRnR6pgQ7JBfG+nMbsOHPHm7OpPiNtiZrSMw/4t/tJTtPgTBQ9Zd5MVF7KHB
 +c2dQpptkOHy2lM8D21VfvOpeJTB/nW/VeNXUeylOPLB9wLM6M06qIW2xDNwyTqfh4za
 wWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715345361; x=1715950161;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4bGB69MaITj0lj1rbpzgDk3jxO2MebXh7Pspyb5Ws2g=;
 b=XSx3urk6bTtHGMkiWS1HDkcxRyRakxm5W7Z8bc8HR2hn4VyPMby3En7g0zUn/fy0Qn
 XoN/OrA/Gwp7uaoOHtLjRe0uxaUTd019v/8gulbaUFuyIAYmUEpIfvzH7YzonXs+RpSx
 I2JiuIPJSAegwZkoSZ9QwBj2pK4rJ+oLNL1ZwkBPJ41ZLshey66BQSai5tNT271jQlnh
 eY/qGk89CX2GJ4NfJlXk1/1aXpF9F0JMPUbJPYNa4/stCTusss5txru5iryHWtVPQrQO
 Ss7J101LhQTrI6RQVyZqlimQRfrOhjj5LwNS9hVfVcaOYinFzE5m2b4ZQx7MKffVQrhw
 vqfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH2udn1vhRHT2uj8CG53Y5PzIoVfoeoBMt5RevD/fXA2XZrf7CLkTtQ9aJgCwR5VhLfhHJ+guqhOyowebHRTIKdzhe+JqR7VZS4F/XhKGeQS2D1sbnXPltURRrv0ADPEYPjlK89qNkRsk4sbKqPvo=
X-Gm-Message-State: AOJu0YyNl22KEVADN20E156D+k1jSIseau43SeuHdsuOSKQs1URXtzUG
 MoHwQoMTq7mw0hanUl8Y2EW2L/GdoAD7KIXeMGk13SbXnYyntkrWzIP0lM2E
X-Google-Smtp-Source: AGHT+IE4v/ivolAQj9E6utIZxiGgbJt/dzyCsfbI4cr7prZz85w5gF7mk58fxK9ySkhc71ElRiMz6A==
X-Received: by 2002:a17:902:db0a:b0:1e3:e243:1995 with SMTP id
 d9443c01a7336-1ef43c095cdmr40207065ad.1.1715345360681; 
 Fri, 10 May 2024 05:49:20 -0700 (PDT)
Received: from joaog-nb ([189.78.25.116]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0b9d35fcsm31842095ad.25.2024.05.10.05.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 05:49:20 -0700 (PDT)
Date: Fri, 10 May 2024 09:49:15 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, Marek Vasut <marex@denx.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, joao.goncalves@toradex.com
Subject: Re: NXP i.MX8MM GPU performances
Message-ID: <20240510124915.ilu6nbtlyv6nvixh@joaog-nb>
References: <20240507181712.svjjaryisdgfxkle@joaog-nb>
 <3ac1eadc86772deb12af77e890b2a59a34fa847a.camel@pengutronix.de>
 <20240508143252.kacr3fmrhcx4jkjn@joaog-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508143252.kacr3fmrhcx4jkjn@joaog-nb>
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


> Offscreen test results:
>
> glmark2 command:
> glmark2-es2-wayland  --off-screen -b shading:duration=5.0 -b refract -b build -b texture -b shadow -b bump -s 640x480 2>&1
> |                 |       glmark2 tests                     |
> | sw ver          |shading|build|texture|refract|shadow|bump|
> |-----------------|-------|-----|-------|-------|------|----|
> | etnaviv (no TS) | 348   | 541 | 466   | 24    | 81   | 498|
> | etnaviv         | 434   | 901 | 832   | 19    | 106  | 871|
> | vivante         | 544   | 956 | 790   | 26    | 225  | 894|
>
> With TS enabled, offscreen scores improved considerably in some
> individual benchmarks.

Ralized that the last line (vivante) of the above table is wrong for offscreen
results with TS enabled. Correcting it:

glmark2-es2-wayland  --off-screen -b shading:duration=5.0 -b refract -b build -b texture -b shadow -b bump -s 640x480 2>&1

|                      |                  glmark2 tests                              |
| sw ver               |shading|build|texture   |refract|shadow|bump |
|----------------------|-------|-----|----------|-------|------|-----|
| etnaviv (no TS)      | 348   | 541 | 466      | 24    | 81   | 498 |
| etnaviv              | 434   | 901 | 832      | 19    | 106  | 871 |
| vivante              | 402   | 624 | 520      | 26    | 177  | 557 |

With TS enabled, etnaviv offscreen scores seems to be overall better
than galcore.

Thanks!

Regards,
João Paulo
