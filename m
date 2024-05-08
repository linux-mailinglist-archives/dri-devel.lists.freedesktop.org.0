Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89E58C0006
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 16:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589E910F66C;
	Wed,  8 May 2024 14:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d0hurS9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E24910F66C;
 Wed,  8 May 2024 14:32:59 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6f4178aec15so3766204b3a.0; 
 Wed, 08 May 2024 07:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715178778; x=1715783578; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2H4+ivpGjy9R0a5W4G8O4saD1YaGPq2k7vYpKsMrAZY=;
 b=d0hurS9Mq7Yd1Paf9YjdBRTHuMQlSvmPHn4KGJLXtcnnBEUNPTka9dxBG06njQF05c
 5n2RPxpGTtCPsnvaK6PUPZFX+HCQlxW03v5ugOPkTEBWoTHKhvGAf7mzFtcUaeSqQ0sa
 InfvTtfNEr3OmuW8zyLfZFFPYmCGZUZz53ky3Xfo8VqL/GWiCsOIvyLJNFKc29KXjhnm
 C9u1jLwQrK5mZZLwME8EF9pSg8ip4tI68dKlzCO1CHOfaL8b115Y9DQ5oqHCFEXxj0Nm
 B7aqT+j8MvHFHXtyr6E2EtOj3/MmXESzK7mOqrcunxzMZGWoYEvB2WuG2x7HtZJSkYdW
 HwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715178778; x=1715783578;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2H4+ivpGjy9R0a5W4G8O4saD1YaGPq2k7vYpKsMrAZY=;
 b=NpRuec54hLV96E6r+iKYSk2stqMsC0K4XALbscSC/3pNA9GJ4xIsd6KwV8JRToqPsN
 92ls/vEG+nZKZ7YGkIueWoh6fm7MNVjMlxNkCLv4BV6FHINAdB35lomyrMs6fH4myjds
 6bRNCBBF4kDglBfc5eswjh5eXRZYY0F1XhlynIz4JhWpd4EtVW8+2Zo68Ob74kLCbkNv
 8h5Z6m6pT4wu3n6UFoh6DsxMl6UUW29PsyZh8hOq1JHP47Tklwm6cZ5W0hu6+CjGcjid
 PcBY7tvDJWPwMEGirxIcXWBTmx6Sr/CXnY+2Uu0w4IZJI/s4Hf4YbKYerDVJ8Voueqho
 qZDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWArD118RJsrUOEEyaNOF8meqVuT6oR9uVxje1t3Ez+MW2MvaO7imFY8A2Un4MTmoKfOz+5VlVg17IiS6vTXXXG/CfSq8eJCIrHvEPaqDvLfKJXJNdFBSWgXVh0WkuojYPzfirvh8YgQotAWzLVDhc=
X-Gm-Message-State: AOJu0YwEaAI7hf9SWCLKza4mxjMmsyhES6ImKdZFLO3o/08k7lUwNPuj
 Gwl2wrbPS4Elp8vk3uOLBGuvASOBaDrVFb2gi4L5AlKS7c3gymkKjXzKFVrE
X-Google-Smtp-Source: AGHT+IGYc4Jh6unM0MLJDrRKMWwATkHRVxfrk4yyZCjKADKy6+AcWzcHRB6XVpfVZI6/Sic0LG3DxQ==
X-Received: by 2002:a05:6a21:339e:b0:1af:b094:3488 with SMTP id
 adf61e73a8af0-1afc8d3cad5mr3037226637.23.1715178778182; 
 Wed, 08 May 2024 07:32:58 -0700 (PDT)
Received: from joaog-nb ([189.78.25.116]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b001e97772524asm11865524plh.234.2024.05.08.07.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 07:32:57 -0700 (PDT)
Date: Wed, 8 May 2024 11:32:52 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, Marek Vasut <marex@denx.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, joao.goncalves@toradex.com
Subject: Re: NXP i.MX8MM GPU performances
Message-ID: <20240508143252.kacr3fmrhcx4jkjn@joaog-nb>
References: <20240507181712.svjjaryisdgfxkle@joaog-nb>
 <3ac1eadc86772deb12af77e890b2a59a34fa847a.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ac1eadc86772deb12af77e890b2a59a34fa847a.camel@pengutronix.de>
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

Hi Lucas,

On Wed, May 08, 2024 at 10:16:24AM +0200, Lucas Stach wrote:
> That's a problem. This will prevent TS from being used, which has a
> large performance impact. But it shouldn't be necessary to disable it
> on the i.MX8MM GPU, as all memory accesses aside from the initial MMU
> commandstream go through MMU translation, so the issue with MC1.0 will
> not be hit. Can you try patching out the check in the kernel and see if
> it helps?
> 
> I'll also send a proper patch for this.

I patched the kernel and enabled TS. The performance improved slightly,
but it still seems lower than the NXP driver. Here are some of the
results:

In screen (weston + DSI) test results:

glmark2 command: 
glmark2-es2-wayland -b shading:duration=5.0 -b refract -b build -b texture -b shadow -b bump -s 640x480 2>&1

|                 |       glmark2 tests                     |
| sw ver          |shading|build|texture|refract|shadow|bump|
|-----------------|-------|-----|-------|-------|------|----|
| etnaviv (no TS) | 263   | 334 | 291   | 22    | 63   | 328|
| etnaviv         | 340   | 549 | 460   | 18    | 84   | 560|
| vivante         | 544   | 956 | 790   | 26    | 225  | 894|

Enabling TS, etnaviv scores improved by around 30-60% compared to
when it is disabled. However, it still remains approximately 40% lower
than galcore.

Offscreen test results:

glmark2 command: 
glmark2-es2-wayland  --off-screen -b shading:duration=5.0 -b refract -b build -b texture -b shadow -b bump -s 640x480 2>&1

|                 |       glmark2 tests                     |
| sw ver          |shading|build|texture|refract|shadow|bump|
|-----------------|-------|-----|-------|-------|------|----|
| etnaviv (no TS) | 348   | 541 | 466   | 24    | 81   | 498|
| etnaviv         | 434   | 901 | 832   | 19    | 106  | 871|
| vivante         | 544   | 956 | 790   | 26    | 225  | 894|

With TS enabled, offscreen scores improved considerably in some
individual benchmarks.

Regards,
João Paulo
