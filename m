Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAC58721E5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 15:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AE7112B79;
	Tue,  5 Mar 2024 14:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H3DWv5X1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8425B112B77
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 14:48:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 57DA0615D3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 14:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BF6C43399
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709650105;
 bh=UqbZu3xyqlDk5uHjlUMrd1Dn1OrXuEFDbeFQfIakCxI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=H3DWv5X17/rqyKaoDTm9YrnRyq39WLZ65+TtNLksEuL0+ZHnGsM8KLTqed+p2/6TM
 3vyCs1RiYNULQh7Rndp6MtPSkHl5NuRrxXqrIcsMJr4IU32jpJEj4fx8YMvsiTksC/
 35UsdNMFeJ527dnwHfO3vqTELjlUMXx+2I4w0VNy42lqVdvf/avHu/fnl7J2JwQCNQ
 yiyJ1ZPsg8deNZboVJoh9GrJUQy3sQBZybi1Yt6I5iMJdXX+1BeKYSXEAxYFsDaZCq
 Ae9n9VztEXiHzASoMOCvV8ToLK2TUNKCIgLctQTJnh+VU+ZGsKzC/2VqfU9Nkbv2K0
 +cXYsKcOlFhRQ==
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dcc80d6006aso5954686276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 06:48:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVe3tTjOL4NCJeHgAeME4ofHUffY1/ukU224hmszd5y4Kscop0n52HuwFX8bcslNpcOZNgiJtghgyuH28NZBA/Ur5F4KCKrnojFeR4A8eka
X-Gm-Message-State: AOJu0YzbZQOStyUozFfJm3AUZ1XAutsQgc3LmBv095xrjIhBqDRaAGMm
 gMchNgSNTgeVlu8ckhlAE6Tr3ufUkXn7O/nyAkJIlZbOcZuVewrNN2S54M8YN+MuRYcVCNcdXno
 HRSpW0y7T4YopCI91/CpV19VfPF7sFM5Rqg0NYQ==
X-Google-Smtp-Source: AGHT+IHGpjkxxxTDIEldpzuSjFQqyR2XC5Ojqd9dAjXKm3mSL5YM47Oljf9oiBFSbYSoAYKPG/dKTAtSCh67GxN6TdA=
X-Received: by 2002:a5b:3c5:0:b0:dcc:7af5:97b4 with SMTP id
 t5-20020a5b03c5000000b00dcc7af597b4mr8182681ybp.12.1709650104981; Tue, 05 Mar
 2024 06:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20230328170752.1102347-1-jagan@amarulasolutions.com>
 <27b3b4fa-95b8-4411-8612-f2d4002eb7fb@kontron.de>
In-Reply-To: <27b3b4fa-95b8-4411-8612-f2d4002eb7fb@kontron.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 5 Mar 2024 15:48:14 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4pGWBAHT2yU0mj_gt_iLicPBSYuHLk6O6LLBgofOssjQ@mail.gmail.com>
Message-ID: <CAN6tsi4pGWBAHT2yU0mj_gt_iLicPBSYuHLk6O6LLBgofOssjQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: Fix improper bridge init order with
 pre_enable_prev_first
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Marek Vasut <marex@denx.de>, linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
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

On Thu, Feb 29, 2024 at 12:39=E2=80=AFPM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi,
>
> On 28.03.23 19:07, Jagan Teki wrote:
> > For a given bridge pipeline if any bridge sets pre_enable_prev_first
> > flag then the pre_enable for the previous bridge will be called before
> > pre_enable of this bridge and opposite is done for post_disable.
> >
> > These are the potential bridge flags to alter bridge init order in orde=
r
> > to satisfy the MIPI DSI host and downstream panel or bridge to function=
.
> > However the existing pre_enable_prev_first logic with associated bridge
> > ordering has broken for both pre_enable and post_disable calls.
> >
> > [pre_enable]
> >
> > The altered bridge ordering has failed if two consecutive bridges on a
> > given pipeline enables the pre_enable_prev_first flag.
> >
> > Example:
> > - Panel
> > - Bridge 1
> > - Bridge 2 pre_enable_prev_first
> > - Bridge 3
> > - Bridge 4 pre_enable_prev_first
> > - Bridge 5 pre_enable_prev_first
> > - Bridge 6
> > - Encoder
> >
> > In this example, Bridge 4 and Bridge 5 have pre_enable_prev_first.
> >
> > The logic looks for a bridge which enabled pre_enable_prev_first flag
> > on each iteration and assigned the previou bridge to limit pointer
> > if the bridge doesn't enable pre_enable_prev_first flags.
> >
> > If control found Bridge 2 is pre_enable_prev_first then the iteration
> > looks for Bridge 3 and found it is not pre_enable_prev_first and assign=
s
> > it's previous Bridge 4 to limit pointer and calls pre_enable of Bridge =
3
> > and Bridge 2 and assign iter pointer with limit which is Bridge 4.
> >
> > Here is the actual problem, for the next iteration control look for
> > Bridge 5 instead of Bridge 4 has iter pointer in previous iteration
> > moved to Bridge 4 so this iteration skips the Bridge 4. The iteration
> > found Bridge 6 doesn't pre_enable_prev_first flags so the limit assigne=
d
> > to Encoder. From next iteration Encoder skips as it is the last bridge
> > for reverse order pipeline.
> >
> > So, the resulting pre_enable bridge order would be,
> > - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5.
> >
> > This patch fixes this by assigning limit to next pointer instead of
> > previous bridge since the iteration always looks for bridge that does
> > NOT request prev so assigning next makes sure the last bridge on a
> > given iteration what exactly the limit bridge is.
> >
> > So, the resulting pre_enable bridge order with fix would be,
> > - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5, Bridge 4,
> >   Encoder.
> >
> > [post_disable]
> >
> > The altered bridge ordering has failed if two consecutive bridges on a
> > given pipeline enables the pre_enable_prev_first flag.
> >
> > Example:
> > - Panel
> > - Bridge 1
> > - Bridge 2 pre_enable_prev_first
> > - Bridge 3
> > - Bridge 4 pre_enable_prev_first
> > - Bridge 5 pre_enable_prev_first
> > - Bridge 6
> > - Encoder
> >
> > In this example Bridge 5 and Bridge 4 have pre_enable_prev_first.
> >
> > The logic looks for a bridge which enabled pre_enable_prev_first flags
> > on each iteration and assigned the previou bridge to next and next to
> > limit pointer if the bridge does enable pre_enable_prev_first flag.
> >
> > If control starts from Bridge 6 then it found next Bridge 5 is
> > pre_enable_prev_first and immediately the next assigned to previous
> > Bridge 6 and limit assignments to next Bridge 6 and call post_enable
> > of Bridge 6 even though the next consecutive Bridge 5 is enabled with
> > pre_enable_prev_first. This clearly misses the logic to find the state
> > of next conducive bridge as everytime the next and limit assigns
> > previous bridge if given bridge enabled pre_enable_prev_first.
> >
> > So, the resulting post_disable bridge order would be,
> > - Encoder, Bridge 6, Bridge 5, Bridge 4, Bridge 3, Bridge 2, Bridge 1,
> >   Panel.
> >
> > This patch fixes this by assigning next with previou bridge only if the
> > bridge doesn't enable pre_enable_prev_first flag and the next further
> > assign it to limit. This way we can find the bridge that NOT requested
> > prev to disable last.
> >
> > So, the resulting pre_enable bridge order with fix would be,
> > - Encoder, Bridge 4, Bridge 5, Bridge 6, Bridge 2, Bridge 3, Bridge 1,
> >   Panel.
> >
> > Validated the bridge init ordering by incorporating dummy bridges in
> > the sun6i-mipi-dsi pipeline
> >
> > Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to
> > alter bridge init order")
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> This patch is now almost 1 year old and it has been tested and reviewed
> and there have been multiple pings.
>
> Is there anything missing? Why is it not applied yet?

Sorry about the delay. This has been tested and reviewed properly, so
I will apply it  now.

>
> Andrzej, Neil, Robert: As DRM bridge maintainers, can you take care of th=
is?
>
> Thanks
> Frieder
>
