Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF678C7AA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002C310E2FE;
	Tue, 29 Aug 2023 14:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D259610E2FE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:35:52 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-594ebdf7bceso33963587b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 07:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693319752; x=1693924552;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2VUnnxjq9ZOeNV0lBroXB3y5SzgvsZ6+9M2NuUn+6Jo=;
 b=E/1oxwc3M5Kdkdw0GqkNZw3ocgdPyCRqDTGyl4k7yv3NEhW8QHXYMlROyn3M8A+2KP
 cK+PmmlJccNjCXt3XkAfj93ars5wWN7mP46RQ3Ms5+ewANOh5Vx09EEPK2cYwvUiRPMr
 thBTckzB3N5hW2RyDahfUmKvQDGPF1g9CpR0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693319752; x=1693924552;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2VUnnxjq9ZOeNV0lBroXB3y5SzgvsZ6+9M2NuUn+6Jo=;
 b=YoX3rYFdZLXjzBPHGZq/ITGCRMk4UlD6a3pbjClLtJERv5hVQ90qGQsYc0ABw+5w5t
 G+N5BE/YwWJYWDKrfj8KVTb+8SCJsMglab0ZGzsLUquKXBcH6iItMofyQRF1YOvPoVl0
 EdnazSMxMMA3d7gvXn0dH4DCo8SFSq2u5nDGFEKyzKw/YN4o0WoWFuKw2wz/uf/rrYwe
 oLRtjjJ7BCVfB90nHGWAiKKQZPPEMik7kwGWmu+sk4pQEggArM75x1nhz0BIJIRzfBnO
 pY66fYpi2BWkguf9xwWeq5vGIhW5ZoigHngK2T+rNDr1xLO20Gt3S2KcZQlO8NUo1C4H
 pMSw==
X-Gm-Message-State: AOJu0YwypvLlW7LIp/q9Lmgy3ot8+ugKX2NpYBn0REhnLcGQPsWPEV9M
 f4isdpd0ZjO3dtKPn0Zp/rJT5enCSuMpqrCZgubosg==
X-Google-Smtp-Source: AGHT+IF3Q0yUxWsMjW6DHnqkt40bNAOjQFMYvIjWVnEkoAXT/+5bpDc4YWCkwF9Euaqm98G8xQFJ5UoIIHvXVEfqrzg=
X-Received: by 2002:a81:5245:0:b0:583:d9de:8509 with SMTP id
 g66-20020a815245000000b00583d9de8509mr27528195ywb.27.1693319751792; Tue, 29
 Aug 2023 07:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230826095516.81387-1-git@mimoja.de>
 <f8d2bbfd-0f9c-31d8-729c-b316025b5b65@denx.de>
 <cccbcec8-b6e5-58e2-2197-f97cc434aa43@mimoja.de>
In-Reply-To: <cccbcec8-b6e5-58e2-2197-f97cc434aa43@mimoja.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 29 Aug 2023 20:05:39 +0530
Message-ID: <CAMty3ZAhA4cimCATHf4D2Tw9iHZkZE9X-fK5++NJ-RjwsjDXoQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/panel-sitronix-st7701: Move init sequence from
 prepare() to enable()
To: Mimoja <mimoja@mimoja.de>
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
Cc: Marek Vasut <marex@denx.de>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, mimoja@aachen.ccc.de,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Mimoja <git@mimoja.de>, alu@fffuego.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 27, 2023 at 12:03=E2=80=AFAM Mimoja <mimoja@mimoja.de> wrote:
>
> I appreciate you taking the time to respond!
>
> On 26.08.23 17:18, Marek Vasut wrote:
> > On 8/26/23 11:55, Mimoja wrote:
> >> "The .prepare() function is typically called before the display
> >> controller
> >> starts to transmit video data."
> >> and
> >> "After the display controller has started transmitting video data,
> >> it's safe
> >>   to call the .enable() function."
> >
> > DSI commands are not DSI video, so this should be OK ?
>
> You are correct, my commit message is mixing things up here. I wanted to
> emphasize roughly the thought of
> "when enable() is called the dsi core is expected to have its clock
> initialized". Will take note to clarify this if I succeed to
> make a case for this patch below :)
>
> >> While generally fine this can lead to a fillup of the transmission
> >> queue before
> >> the transmission is set up on certain dsi bridges.
> >> This issue can also be seen on downstream imx8m* kernels.
> >
> > Can you reproduce this with current mainline Linux or linux-next tree ?
> > I recall the display pipeline in the NXP downstream stuff is very
> > different from mainline .
>
> You are very much correct. The NXP downstream kernel is completely
> different from the upstream one
> and is really a great example to show the issue (code cleaned up for
> readability):
>
> https://github.com/varigit/linux-imx/blob/5.15-2.0.x-imx_var01/drivers/gp=
u/drm/bridge/sec-dsim.c#L1368
> ```
>      ret =3D drm_panel_prepare(dsim->panel);
>      if (unlikely(ret)) [...]
>
>      /* config esc clock, byte clock and etc */
>      sec_mipi_dsim_config_clkctrl(dsim);
>
>      ret =3D drm_panel_enable(dsim->panel);
>      if (unlikely(ret)) [...]
>
> ```
>
> > Which SoC does have this problem ?
> Sadly I don't have any SoCs available which would work perfectly with
> linux-next, let alone are confirmed affected :/
>
> I were able to make my Kingway Panel work (Custom one and so far
> unsupported by the st7701 driver) with this
> patch on downstream 5.4 and 5.15 imx8mn as well as on a raspberry pi CM4
> with 6.1. However raspberrypi/linux brings
> SPI support to the st7701 driver which should not affect this but I
> would just like to document it here.
> I could not find any success story with st7701 and the rpi on 6.1 online
> after a short search (and only one
> reference with 5.10 which seems to me a bit different in a short
> comparison)  but again I can only offer
> circumstantial evidence. Sorry :/

If I understand correctly, 5.10 and 5.15 Would work as it is if the
DSI host calls the panel's prepare and enable directly from encoder
enable. Did you check that?

Thanks,
Jagan.
