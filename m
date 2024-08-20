Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37E958CE6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 19:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEE710E528;
	Tue, 20 Aug 2024 17:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FZmKQomH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930D510E46F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 17:12:57 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7a66907fa39so73984085a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 10:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724173976; x=1724778776;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=Az1A9NMBsWL3/7vKt/sApr3R4UF7scT2PZ3fQljPcaU=;
 b=FZmKQomHUHThP4EhHhEe4a5m9HAFGpqSW9WeRwEoVV7e0FaGiBgdzSZV6iihcgwk/B
 37PGSHD90u84QImPDd14Ug5UAxeiJOSO2G09t0HyO15vgjf9tIJf4ej9J8ZMkAZWDreR
 25ylGZpzeQEfXcAvlmmIaEwniSfTLXxpmbvr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724173976; x=1724778776;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Az1A9NMBsWL3/7vKt/sApr3R4UF7scT2PZ3fQljPcaU=;
 b=CA6SRxKzqSTwZIkDwvdZNXVYGcqrNDC4/OtQTpwBhZZth6zZPDkFoDQ4IoYLak/asp
 9mmz5JnT8CozZwoWreRlR6yPAE5VDZ+m4yLiCHRz0aPQ2XZb1BymyFeVsdg7Bg4HuPAp
 MJ7nrj0r9HfrgDtlCx3od8jKYQ6AvmR+sBked3Li+Rd+5X0iv6I+EFZ/0wl7NiaIFDQU
 JOTw2n7xGsiCQde+W4f+K+YCmuYBrCQTCCCgxVyqYQ+yCU1rs30somhZQMX5qweP35Hg
 hzbipv22xjlDpI/6hO2dSvXsJi5hzbyU5VZ4qk09ec0VApWsFhjU37Nk7obzI/ExnGXQ
 S4BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEh4eRIOjgofeLss6Vrm/2bb7GxHn758ibq8WUB4iW1dw1akhbKy/q7VZBFl4R0kZaWOhtEZ5QKAIL+vxDNFkHn5SMom92qHoOb9E1fOhq
X-Gm-Message-State: AOJu0YyCR15n/btxY0J6e1iYJn/TBguJG2VpVuA5RrMUj3zkTlbkigt8
 7qLchC7sCdIruq6MeQBHGSP2WzgVKPbjUFQR/Z4OXgbNFAfpj9710yQQkyQjp/b/raop+7sFuu0
 IFf4dePd8pLqLqEL79mfqu0xap5gIcSKCm5sT
X-Google-Smtp-Source: AGHT+IFkHKjFejZjAs941sgh7G6biMuTuBjyP76WiW4rgqwMwtsqslDT56RN+7cjrZMCdxIwmDbG7BvU7jfkGLOLSTI=
X-Received: by 2002:a05:620a:4245:b0:79f:5d5:1bc1 with SMTP id
 af79cd13be357-7a669685ff7mr335452285a.58.1724173976423; Tue, 20 Aug 2024
 10:12:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Aug 2024 10:12:55 -0700
MIME-Version: 1.0
In-Reply-To: <ZsRrWfoPPVGC4Dqy@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-3-swboyd@chromium.org>
 <ZsRrWfoPPVGC4Dqy@smile.fi.intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 20 Aug 2024 10:12:55 -0700
Message-ID: <CAE-0n536OWtoOoRSM=6u=wA75A+0WtBktiY=6Y6VjKKTQWPcNw@mail.gmail.com>
Subject: Re: [PATCH v3 02/17] drm/bridge: Verify lane assignment is going to
 work during atomic_check
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, devicetree@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, 
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Scally <djrscally@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, 
 linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Quoting Andy Shevchenko (2024-08-20 03:09:29)
> On Mon, Aug 19, 2024 at 03:38:16PM -0700, Stephen Boyd wrote:
> > Verify during drm_atomic_bridge_check() that the lane assignment set in
> > a bridge's atomic_check() callback is going to be satisfied by the
> > previous bridge. If the next bridge is requiring something besides the
> > default 1:1 lane assignment on its input then there must be an output
> > lane assignment on the previous bridge's output. Otherwise the next
> > bridge won't get the lanes assigned that it needs.
>
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > Cc: Robert Foss <rfoss@kernel.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Cc: Pin-yen Lin <treapking@chromium.org>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Yeah, I really think that the appearance of this thousandth time in the Git
> history has almost no value and just pollutes the commit message makes it not
> very well readable. The only outcome is exercising the compression algo used
> by Git.

I'll leave the decision up to the maintainers.

>
> ...
>
> > +     /*
> > +      * Ensure this bridge is aware that the next bridge wants to
> > +      * reassign lanes.
> > +      */
> > +     for (i = 0; i < num_input_lanes; i++)
> > +             if (i != input_lanes[i].logical && !num_output_lanes)
> > +                     return -ENOTSUPP;
>
> Besides missing {} this code is internal to the Linux kernel. Is it okay?
>

ENOTSUPP is used by select_bus_fmt_recursive() so I simply followed that
style.
