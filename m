Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D8CC6F518
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A050E10E647;
	Wed, 19 Nov 2025 14:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k0LBrE8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com
 [74.125.224.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF5C10E647
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:36:15 +0000 (UTC)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-640c857ce02so6510314d50.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 06:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763562975; x=1764167775; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M+Bii+RiTrkB2X/mKcLWf1awOoW7N75l75I3y6PNfN4=;
 b=k0LBrE8wWzMvnXnz5QhhO0262nVRcd+Vg6eGwPe6Wu42zDldP87LRE1T6YdqsCxU69
 QYceJNglNsIDx/ryj6Svphr7z89jeyDkneTqrPu8NMD84rqQkp3xuIrByc3apNqZ4hRx
 Oqw1zwb6JZna5XipMzhW7inL0DBqcEi8cGMgF9Gg31fGr27kzOJuo283pqSU4+hVHihj
 NAMiLDPsci7tFnVeGnO4ufM9xzUdRsaWrXdbHxQIrHCBQcVQJqLlh7aaEkKWi5TxHxq2
 7ncZisdOR1duOKjjChdRnEhGe7YQFDNuPx8pisgf/xqLkMK8oT8KxwAxhbU95d88LZEL
 uWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763562975; x=1764167775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M+Bii+RiTrkB2X/mKcLWf1awOoW7N75l75I3y6PNfN4=;
 b=Z5L/y1pxiuvaVBOb5wJWhb4pCGQNshzGn1FaDP8i8zJKIhyfNlOs2ctj6BhnKfvl5X
 tEZMHMs0ykwflKDHzr4XEY924SdbYQHHLPbjva2jawpng94+iGA5KG33CGdJPlv2I2dg
 FriZ/b/4mG1vMKReVrFwivxOmcX1tddsLnCnxnLAWRJvU+zIoZ6oQwrsTBNYGQushpH5
 sQjBaeWFNN3vac2uTj4fcodms6sliNlg54mpPquk7kVeZIsBzaqL886hWIrpcj2otzXl
 /TZ8bmUDS8jmGBxh8lVzg8bqZFCZxyZRqrnQoBjonYB5nym8ho1qGsysFCZ9oe0PvmsN
 +ixQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Z4ZXdgk/gBP7vdNAaWnD0L4mMQQ5pacPRQjRYT9tHSoi6u7+Ekt1KZSUMJNmyl6lgydzjHrQyvs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+54uYCAowjLsVoTyIY740l6LEMZEbowUEAt9aO0vxljEtTJUK
 0x6Y1rDg1IIBqA4UlXKrCf8Sc2xuoI0O8VbuP45IYo/8xvtsXZ3wZ80IEBtLtg1blEIb74E0OZW
 nxB06B4KXst2LaIFHdpw3Y8kXFHAKtpizDmdaeBZulw==
X-Gm-Gg: ASbGncsJRTb+0NPSUNR+8EpBNIpzkSy2eAfqe5kxhaI/RqT0K5qYl1EXbvfpBIetsVY
 pQNbddA8EGhY8AFThVpPf3px92ho7jguQFXWjbiGkE2du/IzG+m69ZHaND3OZaq/bj3QSUOZZzb
 lDZyGfyl7eOOP6OS3f8ZkQGN/JJgELVHyjt6ZG+cOtom656MiYXDx1kTNQtFISd12mHrzGh4wkg
 MtPsgK2HiLKsDOvAGZeVLEWOfP8C4MflhnnEZ7wsgkzNtLY2UHos4Un+UZd35Vc0Lvb76XRyEm6
 HR4RVQ==
X-Google-Smtp-Source: AGHT+IG0rlRszzqFAzy7UncYTzf2x1uJRdbR85NR+j9SldtaZ3yuYuTp6LZVrTm4jp3pO5PkxWPLhTxM6czkiRKNvlA=
X-Received: by 2002:a05:690e:80b:b0:63f:b624:4c14 with SMTP id
 956f58d0204a3-641e7540ac5mr11888434d50.21.1763562974824; Wed, 19 Nov 2025
 06:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com>
 <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
 <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
 <5zo76nnejrinmf6snaezld5ylfvk266bwyxg3phdhtg74z43pu@kub3r7tvz7vc>
 <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com>
In-Reply-To: <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 15:35:57 +0100
X-Gm-Features: AWmQ_bmMkgPmHsCijgrOLLXKkGyiMIJjrnzB7EuSaST5ezw7Nr7BGD6PKnZIlps
Message-ID: <CACRpkdZ9MA3WyO_Qhsi4ZjnsGrGJ-rFVxdkZLHx1HPAEpKmTzA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Nov 19, 2025 at 11:41=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> But I digress. I think initially we should just look for a clean fix for
> the platforms affected:
>
> - Add the implementation into the drivers?
> - Add helpers to the core?
> - Add a flag of some kind so the core can do the right thing?
>
> I made a quick test with the flag approach, below. It's not many lines,
> but... Ugh, it does feel like a hack.

I did something similar but didn't submit it because I had similar
feelings.

I still feel it's the lesser evil compared to reverting the offending
patch, somehow the core needs to be aware about hardware
behaviours/limitations, we can't keep pretending that the map
is a good approximation of reality if we instead push voluminous
quirks into different drivers.

Yours,
Linus Walleij
