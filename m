Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4702C74703
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A3110E75D;
	Thu, 20 Nov 2025 14:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s6CI8Q97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com
 [74.125.224.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E4F10E75D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:07:48 +0000 (UTC)
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-63e19642764so677667d50.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763647667; x=1764252467; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zPjSZ94CNLG87Co8dKmzNKmFn74ftGXglxtJ38De2DE=;
 b=s6CI8Q97Cjul/OSCLx6DSTrHmNtY57oFnhI/bDT0k+qd+e8xBdZxosBmAZMikkrE61
 /I/C7DhfE24odfLz1cfMl1rIw8GLKldLJ7UvPPmjsy9+FnLDKgXKQV9yVrn2ICrQbNDX
 vX7wHySkERwX7nuizawgaQpr8umjRdSBxezf5uAxjQgPLoJRyAgG83CJpfMTzVj3jIJh
 o2/giZbuf6Q9WWPLpnByq9onL7fCPPuvnELajIX6bKgSSHz7iNPUgT2ETlykgXOGFKYi
 hh5ZL3iGPB4Muw608W7KOOoM8tvnaL+AZI3o7clwg/mRVmAWk9HO39ZZt79RUkhqRcW0
 J31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763647667; x=1764252467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zPjSZ94CNLG87Co8dKmzNKmFn74ftGXglxtJ38De2DE=;
 b=eugbDa1C717eA6RdUZ34OmNNlE1di8l/zR5oqusuypxZKBETXOoMf2pTSyTf/XwQkz
 CBfUDUilgLxBf2tA13798XqyYSiY1LCChWdsTdRwXcotoHcEkgVIRt2pC4F9qk/sv6or
 WqJzoPxTgHyXDj5KOVEz/tdhCf+yGThPiMrdAuaLgAEbsvX00Uynt6Lv7dTY5DFXIdF6
 ig6RODFRjdknlzhuqmNhb1gg12Q4wttiM0TlK3P1cetvB2xssS9keKgjeQRl2sjseu9H
 6Ww7AIWfcDIJl/d98AIt8awOCQLgCYZlYXC4pR4z1k16zWSXPcEpZFmNj38F7uAX3aX9
 QHiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW10lnK9km2aqtKuHUi5BfNEOa49q846IbU8HFM0XhpDaKtzJ8w08fII0oFb1YaOxhaBhpTvbZOPVc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxviMXScdiVzxyFWptSbpGLL0IrbROeH32+BqsFcwB/uy1MEt42
 JBhcnf1HVb3DMzBjXPMW1GkDXLje5QX5ORqftOXQypmMKbjDeIGgQC6u5irm/AHUGKE2pQz9M4Z
 Hg5V2BpXZPQ5uouBzKu2oYRDPNf8EbJ9TPXDzMlcLdw==
X-Gm-Gg: ASbGnctlQxVyb2WUJPmPYlz0cnu7rstmPeQy5tqMC8COtGksU+YaYEHZ5QPBjKeF7Sr
 DxQaPKhwV5whgkFSj1z6YGkyM+QwOq51zMYLpW6NIYJzKa0DqQaAYr+0Z6h6IZWaEdMhpitmsmR
 7kC0WSUPvI7iraM1ICUZzOGTWpTKYexg5pF+uMOMpJO2dIwHFZJKagdiIJOwCcRRAM+Dg75dXwv
 Ylkc0d+N5vr5d0QxvZn0zVJIZPLnUsZIcNypdZtHFLP+XXXxokXOjB49Op8h4fJKj+v5NE=
X-Google-Smtp-Source: AGHT+IHvMQfjnGMOjW7vW3sZWEW8qjVMXpKxefI37CvUYXCFXEROenQqfDOoQIoeIU/ss+8Pk88rI7K0bbXf64s1ZJ0=
X-Received: by 2002:a53:d001:0:b0:641:f5bc:68d9 with SMTP id
 956f58d0204a3-642f7a682f2mr1803616d50.70.1763647667453; Thu, 20 Nov 2025
 06:07:47 -0800 (PST)
MIME-Version: 1.0
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com>
 <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
 <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
 <5zo76nnejrinmf6snaezld5ylfvk266bwyxg3phdhtg74z43pu@kub3r7tvz7vc>
 <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com>
 <20251120024523.GI10711@pendragon.ideasonboard.com>
In-Reply-To: <20251120024523.GI10711@pendragon.ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Nov 2025 15:07:32 +0100
X-Gm-Features: AWmQ_bkTm3pm4AZxXZawzpHvNOqx9Ph_uoWV_Jgh7iWmnUYFQI-EXzxFar9QfVk
Message-ID: <CACRpkdbE0VXLF2Gui6WRGke+Dt=GQLqDDebRJ-ug-rC4NO0UAg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, 
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

On Thu, Nov 20, 2025 at 3:45=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> > But I digress. I think initially we should just look for a clean fix fo=
r
> > the platforms affected:
> >
> > - Add the implementation into the drivers?
> > - Add helpers to the core?
> > - Add a flag of some kind so the core can do the right thing?
>
> drm_atomic_helper_commit_modeset_enables_crtc_early() would be more
> cumbersome to implement manually in drivers as most of the functions it
> calls are not exported. drm_atomic_helper_commit_tail_crtc_early_late()
> shouldn't be difficult to implement in the MCDE driver.

But the second patch patch adding
drm_atomic_helper_commit_modeset_disables_crtc_late()
would be needed for symmetry.

> > I made a quick test with the flag approach, below. It's not many lines,
> > but... Ugh, it does feel like a hack.
>
> Without seeing the code I can already imagine how this would feel like a
> hack, so I agree not to go that way.

It seems we cannot reach consensus on a regression fix that doesn't
require large re-architecturing, so I'll go ahead and propose a
revert instead, it's the only sensible thing. I hope nothing breaks
from the revert...

Yours,
Linus Walleij
