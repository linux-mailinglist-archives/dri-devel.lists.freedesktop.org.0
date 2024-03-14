Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CE687C20F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 18:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1638F10FC2E;
	Thu, 14 Mar 2024 17:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xdcs9T8g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E884B10FC2D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 17:21:01 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a466381b411so145825766b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 10:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710436860; x=1711041660; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uvthK6ZPHv9ziKLsWHO3MPl4ZybvCCopm0QV4LX8UkQ=;
 b=Xdcs9T8ga0TzqsjL2CJxiYvv/OQYWvML91Nsmm/hT2z3YRcWzHZmOy2rf9kWY4b6oM
 YNDKcoFEJEJE8IVR+zRHZbqESZtdyxQx83DQPuypGRMDyHP84tTGfYBM2/hhQ4rovG+O
 jp3/QQcuYkSjLtSmMRA1oTzaR6xQU+uJWR135buM7+ZIw6guhlrimAflRzYg0O3hACR7
 slfKHxvH9tcq/I3taS4ob1RWypA60rVb9HnpesyprNToXB373yqpJBBULmUwvNHu7dlJ
 UXSC16j/K7Xzo4LYmDvHrP1sC682Uz0Pl/72EhIa7bwIytJMrM20NlIk7eA0/GFPGfXz
 jpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710436860; x=1711041660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uvthK6ZPHv9ziKLsWHO3MPl4ZybvCCopm0QV4LX8UkQ=;
 b=IgepR0ofu2EsRFKa8nQ/5t9+FaY1yR2x5AviCE49Q61VBwDMDeka5YkGpN7DRrkkHG
 aiv74/mayS1S8qoqbpDWdA6xAYkXtu3Nqe+P0CFwZspa+fY1nUcFrR3u2mUvFr25OzGQ
 A3TqwPe2vMTOKrH/v9cypY+exJSd2IUuPrAl5IsHY0YRN2RV6N6XjUzHiZebIFUB0bGa
 i5D+MnDjkQ5tmKKFDEXDXjcbfuIEu5HoPPn7boxpVnKtoBuePW7r89fbUKGdB1x+nD3c
 b0cS6EjY7nwKvChW1sa+LuqtiGvgMjGXk6bUSGngBoT3itZnFO3jdhbU0u7NaJsUEcjX
 l/Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS/yzlFb4Oh1n/nQJvSoViJC797pDwoRIsPAlEj8eMP0tjDoqVcwedKFqgjeOncJWdX4EvetSXgN1L6v/HSXR9BRbUMWj5Z3wcx/JI4IiX
X-Gm-Message-State: AOJu0YybhFNJVf7GkGYqN4k5OC/RsuqTRwBZKKuk6O/PqVqP6QFXoDCW
 ctDBveeZn24j95TnyP1ExG4A3aJxrp30eZ6c1zpYII837u2YE8Vb
X-Google-Smtp-Source: AGHT+IEwb/JV3ROy5jBsR2h0x53EOam5x48bXCQzKOeUat4Rg2BPQuqlegOQyDv9bGsdCWC9AfeGSw==
X-Received: by 2002:a17:907:2da1:b0:a45:ab9b:4a28 with SMTP id
 gt33-20020a1709072da100b00a45ab9b4a28mr552954ejc.60.1710436860023; 
 Thu, 14 Mar 2024 10:21:00 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 o26-20020a17090608da00b00a461c637eddsm881549eje.223.2024.03.14.10.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 10:20:59 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Frank Oltmanns <frank@oltmanns.dev>, Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Icenowy Zheng <uwu@icenowy.me>, Ondrej Jirman <x@xnux.eu>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: tcon: Support keeping dclk rate upon ancestor
 clock changes
Date: Thu, 14 Mar 2024 18:20:58 +0100
Message-ID: <5448341.Sb9uPGUboI@jernej-laptop>
In-Reply-To: <20240314-careful-silky-bear-8ee43f@houat>
References: <20240310-tcon_keep_stable_rate-v1-1-0296b0a85c02@oltmanns.dev>
 <20240314-careful-silky-bear-8ee43f@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Dne =C4=8Detrtek, 14. marec 2024 ob 15:42:24 CET je Maxime Ripard napisal(a=
):
> Hi,
>=20
> On Sun, Mar 10, 2024 at 02:32:29PM +0100, Frank Oltmanns wrote:
> > Allow the dclk to reset its rate when a rate change is initiated from an
> > ancestor clock. This makes it possible to no longer to get an exclusive
> > lock. As a consequence, it is now possible to set new rates if
> > necessary, e.g. when an external display is connected.
> >=20
> > The first user of this functionality is the A64 because PLL-VIDEO0 is an
> > ancestor for both HDMI and TCON0. This allows to select an optimal rate
> > for TCON0 as long as there is no external HDMI connection. Once a change
> > in PLL-VIDEO0 is performed when an HDMI connection is established, TCON0
> > can react gracefully and select an optimal rate based on this the new
> > constraint.
> >=20
> > Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> > ---
> > I would like to make the Allwinner A64's data-clock keep its rate
> > when its ancestor's (pll-video0) rate changes. Keeping data-clock's rate
> > is required, to let the A64 drive both an LCD and HDMI display at the
> > same time, because both have pll-video0 as an ancestor.
> >=20
> > TCONs that use this flag store the ideal rate for their data-clock and
> > subscribe to be notified when data-clock changes. When rate setting has
> > finished (indicated by a POST_RATE_CHANGE event) the call back function
> > schedules delayed work to set the data-clock's rate to the initial value
> > after 100 ms. Using delayed work maks sure that the clock setting is
> > finished.
> >=20
> > I've implemented this functionality as a quirk, so that it is possible
> > to use it only for the A64.
> >=20
> > This patch supersedes [1].
> >=20
> > This work is inspired by an out-of-tree patchset [2] [3] [4].
> > Unfortunately, the patchset uses clk_set_rate() directly in a notifier
> > callback, which the following comment on clk_notifier_register()
> > forbids: "The callbacks associated with the notifier must not re-enter
> > into the clk framework by calling any top-level clk APIs." [5]
> > Furthermore, that out-of-tree patchset no longer works since 6.6,
> > because setting pll-mipi is now also resetting pll-video0 and therefore
> > causes a race condition.
>=20
> Workqueues don't have an upper boundary on when they execute. As we
> discussed multiple times, this should be solved in the clock framework
> itself, not bypassing it.

I think TCON code still needs to be touched due to clk_rate_exclusive_get()
calls which effectively lock whole chain. You can't have both TCONs locking
rate on A64 for this to work correctly.

What was original reason for clk_rate_exclusive_get()? I forgot already.

Best regards,
Jernej

>=20
> Maxime
>=20




