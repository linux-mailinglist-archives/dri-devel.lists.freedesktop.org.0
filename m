Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 955B8C6B1FE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 19:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0676710E4F7;
	Tue, 18 Nov 2025 18:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fZiwS/aq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4BB10E4F7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 18:11:10 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-7866aca9ff4so59342397b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 10:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763489469; x=1764094269; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jpvaXJfOVoTjgbXNgGWkL9BDcOnKOa3gc5k4E4NdjrU=;
 b=fZiwS/aqZiqQJ3U6c7//ui2UMi0I/F4omuY4GhtyImo3blGDI/tCL7ajf1/Qei7fml
 eufWxdDkL2N512DyhjDAIHWWxnXUjDZHCK9fJb6nSLNPkKb2GGIlI4C6uoDXGZoESVq1
 9AbS19nnc9scG/zFAwJIaGQAefUXbYScDDsGlSxKzojolH2KMO4wv8m8y5Yo5ODIbdU+
 U7omw4Vxb20B8aJTEL/AQbesRbZT6HdYbQSACEVjAWhFhpVZjryr3r6W2/tKndYUU63g
 E2hDZ2yT0zW8349XdLBcCePfPNghG/GgqtuWkkJY0Vee5dUEUY4X7y2JLivQRqG6NP27
 8fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763489469; x=1764094269;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jpvaXJfOVoTjgbXNgGWkL9BDcOnKOa3gc5k4E4NdjrU=;
 b=tZ1OlYuLOjiP6aZ7b/j4kN3+8k1MUp0i/NfZduCvVjR/MaIJd8qjm+qnAlbR7x7YCA
 FOdYlW4T/dBQ8Ew+tIp6BDLkumSqmckW1F6ZAPQRZHFdpqn2R0RdoKBf0qfN3QdWE26b
 D9mTFylL5rU48DZzSP0aSMRS/HAG8/8uYnMQz/dB5arcx+rE7iNV6JyMsMx8dial2T+q
 3DMP/RSgPn1NM4g4NHj74SL11H60Pa6WKpusEiMFOhRXiKfm0p+5sITsnvl9b6rXEcRO
 c/l9/194NPYcIsvSwiv7vPtSMIQigrBJKoRoJRaAAoGpY5YC2CA1SsYqx/ci7HN5OdIv
 tSyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXMRTmWC+QEOS15F1Sdup35PDyWBN3GxTapvl/wbjlkN0uP6UJrmUvKzpu41UaaJuh1ZrmbrhMmqE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywQEH/EIVSWdMRLQH41ua64028Y8K5OIVsVz0wa1fkVx293grs
 9UOkEx84uEmMWN6Bgoqz1at8fIQtNdZ7hy5j0Paf/mUIpjmGZNB+GtBL5cNFPZx9xk5KESCX7ow
 +CoHjerfMUlsteJ2dHvgPYExylDi3Fx+QmgzG/IHuKg==
X-Gm-Gg: ASbGnctbEFCuHeuDFk3UZ7OPLhxKLLJKgtMa27dpcBa04SneVOay3wUYw+X5+N/rQyS
 yoSlChZgAvPn3HkqYVvbmCQz5/E/B6rAEDXHFWwwWkgS/ThqB+BzpFry9bw7j++aBgOckhbydI9
 NsL5C1iXQtVHMaVLY7i1Y/3jgZbV3dOLfWoapx1/mc2B/4xn0tZNIEFw9IEPnUixE8KwPxZGIyg
 2aqXf1wzr/AgwyDgrzd9Tj6oRrZfm8g7bg/0Fj2pn82RFrlsmPuLEqJtV2l1E6XFW2I3A/n/nkV
 nfPrit4C5SbK6WCl
X-Google-Smtp-Source: AGHT+IECflaUuFa+0ZacNkRiCjedWF8R8Br3a4cb0738VQ5sCUr6kbV00q5G5P2nif7qYRQAyYxT5GB5fvMprMy7PoM=
X-Received: by 2002:a05:690e:d41:b0:641:f5bc:696b with SMTP id
 956f58d0204a3-641f5bc73d4mr10515129d50.71.1763489469009; Tue, 18 Nov 2025
 10:11:09 -0800 (PST)
MIME-Version: 1.0
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com>
 <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
In-Reply-To: <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 19:10:47 +0100
X-Gm-Features: AWmQ_bnyAy9o1iHkh7xeFmBbCHHVK-aDntEPafslHltaVQIymndnehiGpH_UPFU
Message-ID: <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
To: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
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

On Tue, Nov 18, 2025 at 4:44=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Tue, Nov 18, 2025 at 05:01:28PM +0200, Laurent Pinchart wrote:
> > On Tue, Nov 18, 2025 at 03:36:05PM +0100, Linus Walleij wrote:

> > > +/**
> > > + * drm_atomic_helper_commit_tail_crtc_early_late - commit atomic upd=
ate
> >
> > Based on the function name, it feels that the nem commit tail and
> > modeset enable/disable helpers reached a point where we may want to
> > reconsider the design instead of adding new functions with small
> > differences in behaviour that will end up confusing driver developers.
>
> Agreed, and I'd go even further than that: we don't want every odd order
> in the core. And if some driver has to break the order we document in
> some way it should be very obvious.

Is this just a comment on this patch 3/3?

Or do you mean that Mareks new callback
drm_atomic_helper_commit_modeset_enables_crtc_early()
from patch 1/2 should go straight into the R-Car driver as well
and that
drm_atomic_helper_commit_modeset_disables_crtc_late()
patch 2/2 should also go into my driver, even if this
is a comment on patch 3/3?

Both patches 1 & 2 have a lot to do with ordering, this is
why I ask.

We already have
drm_atomic_helper_commit_tail()
drm_atomic_helper_commit_tail_rpm()

Does one more or less really matter? Maybe, I'm not sure,
but if it's just this one patch that is the problem I can surely
do it that way since we're only calling public functions.

Pushing the first two patches would be more problematic,
because they call a lot of functions that are local to the
drm atomic helpers.

Yours,
Linus Walleij
