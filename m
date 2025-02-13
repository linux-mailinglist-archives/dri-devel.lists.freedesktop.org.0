Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FBEA34074
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:36:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C2310E071;
	Thu, 13 Feb 2025 13:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iNkaH1uv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517CB10E071
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:36:00 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4395f81db4dso5337225e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 05:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739453759; x=1740058559;
 darn=lists.freedesktop.org; 
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=;
 b=iNkaH1uvcNuGtTZJO+sbYXfy5VkpyEyv0t54nS9LVoafVc8RCjjFF4Id5DFlNTLinQ
 QANQnYkqAI7gOtOLkm+5ZpNWdDHVg6tKUpdttkDIEUWQSBJtnWk9MRD98qWxN7q/yTbS
 afTeTd/FZBRCEvFOZF+Ei6WWirgMluu0zQ//+x9iuIspYbn0NWzcyt+d6MZ4z3X6MrNB
 6yVghTpzWYjFS5ftE37uOYXd6hzu+V2E4HaRI2owtz1tb7iefivC9XqzGBNvJkXlnSvT
 GtrbkP2AkhPkf6eA8qaKg95GIpK6aeRuxe+/Y/QMAzRkaZOZBtZwreVpHJDdEUuK/vNO
 38Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739453759; x=1740058559;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=;
 b=vIl5KL/nc0ZXZz+tFZIOSOXBlli3m0cdx7i1AZWn/2OA0p7f6sFb8se+WnH502OwyS
 0SKAwEA3jH2uJxv1rqCM1BqDwbwt3RQ7/A3fNuqDhjwOozUMiJ/qaydHmdJXGVwi/kMx
 yyPymRg89yfHJhJMgHtQU1wXFyldw6gWRGrcUVMv2w/yRefVvKRvU2jjUTGZlAaYIJA+
 Ifyync8hBFqXc92Pu7yrGOTsaJRLY3YNUJrVPqumbKcb2m2NL5Kx+b/2VcK/e3AFafQv
 ZNwr6j2HrR57OsH2IIk2SGZUWVQ008zLYu9ZFjUZYJIv5MvzsV9g/j7gos4BvAhUmIzk
 K23A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk6UQsm5OAktV+udXk4plSWtqdEJa/62hRHhDS8HOOJMcvgjm3Gp7BNE9smftxGZ7qoxAw0vGnzn0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjRg1xP22D4Xxk+nienUdM67WgSSnDjJqdKWLODr7z/vG6USZX
 kOWIKm3tOg+2X7LDacd7GfmOB7/AztHi89cvlQsTPS+S7hivnF1z8tOT0NJd2zs=
X-Gm-Gg: ASbGncv6gcXdag5CKdm84ofGD/0lCiPhJ2taHx26eP1S8vRgpV/8Rrb1kb9ADBm+1xg
 BAUDEXdaGoNn66cR/izK49H/FtH0RvYSSl2/PHg2/fFNvqQFCNQlV1U76LQB6v/peZscOfgh/mm
 NkbBkPuTOLr4Y4FJXiiMI/fgSpBj9Um/NN+D8Uf6C1KVVKz1AO7YMi7baQrD/ynwqT+inkquQQa
 GMfM5JqlTvs3U1q9GyIfsHNFv5/hUkPMov8TmOExTSRYhPlE20Zn3nWb9I7g9SzZ4IIs5/Hj4kq
 Mi6NY4eJFHUndg==
X-Google-Smtp-Source: AGHT+IFlyyROQN/jp5N25OPHAwGGncnJ/FLwqH6qkR/P/8dmal2Zk5G/l0wZieziiMnBJNT5H1Y22g==
X-Received: by 2002:a05:600c:a0c:b0:434:f1bd:1e40 with SMTP id
 5b1f17b1804b1-43960e81b92mr29235125e9.6.1739453758160; 
 Thu, 13 Feb 2025 05:35:58 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a056151sm49618825e9.16.2025.02.13.05.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 05:35:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Dave Ertman"
 <david.m.ertman@intel.com>,  "Ira Weiny" <ira.weiny@intel.com>,  "Rafael J
 . Wysocki" <rafael@kernel.org>,  "Stephen Boyd" <sboyd@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>,  "Conor.Dooley"
 <conor.dooley@microchip.com>,  "Daire McNamara"
 <daire.mcnamara@microchip.com>,  "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Doug Anderson" <dianders@chromium.org>,  "Andrzej Hajda"
 <andrzej.hajda@intel.com>,  "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>,  "laurent.pinchart"
 <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "Dave
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  "Hans de
 Goede" <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>,  "Gregory Clement"
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 "Michael Turquette" <mturquette@baylibre.com>,  "Abel Vesa"
 <abelvesa@kernel.org>,  "Peng Fan" <peng.fan@nxp.com>,  "Shawn Guo"
 <shawnguo@kernel.org>,  "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,  "Fabio Estevam"
 <festevam@gmail.com>,  "Kevin Hilman" <khilman@baylibre.com>,  "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
In-Reply-To: <73c1ab6b-fd5e-47e3-8815-8f74758535f1@app.fastmail.com> (Arnd
 Bergmann's message of "Thu, 13 Feb 2025 13:26:12 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
 <73c1ab6b-fd5e-47e3-8815-8f74758535f1@app.fastmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 14:35:56 +0100
Message-ID: <1j1pw20xxf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu 13 Feb 2025 at 13:26, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Feb 11, 2025, at 18:28, Jerome Brunet wrote:
>>
>>  I also think this is more readeable and maintainable than a bunch of
>>  'default CONFIG_FOO if CONFIG_FOO' for CONFIG_RESET_MESON_AUX. This approach
>>  also would have several pitfall, such as picking the value of the first config
>>  set or the config of RESET_MESON_AUX staying to 'n' if CONFIG_FOO is turned on
>>  with menuconfig.
>
> I still think you should just drop the 'imply' line, all it does it
> force reviewers to double-check that you didn't make a mistake
> here, so it's a waste of time.

Arnd, you've made you preference clear and this note has been added
specifically for this reason, and transparency. 

I've exposed a technical reason for my choice. Going with the 'default'
approach makes things more difficult in the long run for those
maintaining this platform, me included.

The trouble of having to coordinate changes in 2 different subsystems to
have an appropriate configuration and the pitfalls of using 'default'
outweigh the extra review trouble of using 'imply' ... especially when
the pitfall mentioned in documentation is explicitly addressed in the
description.

If there something wrong with 'imply' existing and being used, maybe the
Documentation should be updated to reflect this, or the support be
removed entirely.

ATM, it exists and it makes things a lot easier for me to support and
maintain this device.

This all started with a maintainer request to move some resets away
from clock. More requests have been added along the way, making things
more generic. I'm more than happy to have contributed my effort and
time on this and I don't think anybody's time has been wasted so far.

>
>     Arnd

-- 
Jerome
