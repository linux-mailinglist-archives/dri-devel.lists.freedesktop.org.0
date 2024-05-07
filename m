Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C18BE488
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD44C10E18B;
	Tue,  7 May 2024 13:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="czHPQweZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F74010F900
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:44:48 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2ad8fb779d2so2384934a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715089487; x=1715694287;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDcwtJOneav1yglhOtFvjUVD1dcvVWVB5Bx5Px6de+k=;
 b=czHPQweZGluHkOsOUfGWcJIgj4nvGvEwCxDSccW50Tzy/rG11DLAFnkL0NaQ4WSbYF
 EO5GD9pRxtsziyvob1ooUWLT5sARBnRkcgpsEMt9eSpcTTIWutyn0mDqW3BCXOdwYuqP
 mszr2/64y6+YoultgZLjPHRD/ohpsTOPBfY2HvZh7E2hizxmrkMghv1zoMFQI9UVLl+S
 FhW6OOczI5/evsY5pQVWhktA+wc7Pw+jqq7ysMSfnAEk3cFtLQWpLpgNWbf+ANKW49kG
 SeGIhajAuDDmAwapLJObkH5SnciLqm+Hz83jXQjnNR/7Yyhae1aIe2+9PLth48MBKQYD
 zMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715089487; x=1715694287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yDcwtJOneav1yglhOtFvjUVD1dcvVWVB5Bx5Px6de+k=;
 b=f5Sk/d5MgUANI4/voc67yYdfbaBFdAvddWWEcvDC7HbPlFutgrweboLTRxW/pTcjrI
 sqPFwycbO1LXlC1weKKoScYAw2Uv4vbo9qFYU8Ygv4bqWO6rtAFDTncLCsc4yxTVmoJb
 +8SpAPX84OvR9wQFHFqO3XNIRcj8T3WlM8YJpBtNRWl/QgSuQfha7Qh5EgmBocAgybWg
 NKJlcI1ECYnu5nP7vRqvs5vuo3qXOYhvqTigbk1vinTRjzS1Y3Mctlcd/sXVYhxR2+qu
 l2NgSMjg1sWehJVmf9ldNqdSCPNppFT13dQjfaNXs2I/VcJx1oJ8kuv0ZvDbf4SbIFx6
 +oSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtPVJY589etZJTDkOvKQ5+6URi97yQp+bdSvqMrvK2McLJBZKYOPWkaxngMDT7vGGS9DggsH4qJKiz8H+dnZ3/E7mkjxlxgPwFGFzysauX
X-Gm-Message-State: AOJu0YzmEuEeU5LldqOL6jw3TcSrxx2V8Hb6BjlsqRJlJUPxE5p6HjM8
 Br5rmQoAr27hPaRP6QcXnECzfviAvBoHf1avPhctgMWUNOWuL975m7q2/sZFlGaOVp0/EpvW/x4
 DETrJE9ObOb9BkTPqfjUA8vLjYli1GUYdGwefBw==
X-Google-Smtp-Source: AGHT+IFtOa1kpprMySEp/A930EnQn48/tJG5jzQzU1xEjeGdXS/j1AaoJdXH2LX/gzZOdWu2szdVUfXBQZgtmggZcqc=
X-Received: by 2002:a17:90b:290:b0:2b2:81c0:268d with SMTP id
 az16-20020a17090b029000b002b281c0268dmr11366498pjb.43.1715089487250; Tue, 07
 May 2024 06:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
 <20240424023010.2099949-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=VFk3epSxksh+n_LupTiZp=gK=LB2NESGy5iNF=5xFAmg@mail.gmail.com>
In-Reply-To: <CAD=FV=VFk3epSxksh+n_LupTiZp=gK=LB2NESGy5iNF=5xFAmg@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Tue, 7 May 2024 21:44:35 +0800
Message-ID: <CAHwB_NJMWR883kjshtfBFuDBcM9Av87Fx2Jf4d=3_5LLnhUFXg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drm/panel: himax-hx83102: Break out as separate
 driver
To: Doug Anderson <dianders@chromium.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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

Hi,
 Thanks for review.

Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B45=E6=9C=881=E6=
=97=A5=E5=91=A8=E4=B8=89 03:19=E5=86=99=E9=81=93=EF=BC=9A

>
> Hi,
>
> On Tue, Apr 23, 2024 at 7:30=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > The Starry HX83102 based mipi panel should never have been part of the =
boe
> > tv101wum driver. Discussion with Doug and Linus in V1 [1], we need a
> > separate driver to enable the hx83102 controller.
> >
> > In hx83102 driver, add DSI commands as macros. So it can add some panel=
s
> > with same control model in the future.
> >
> > [1]: https://lore.kernel.org/all/CACRpkdbzYZAS0=3DzBQJUC4CB2wj4s1h6n6aS=
AZQvdMV95r3zRUw@mail.gmail.com
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> > Chage since V3:
> >
> > -  Drop excess flags and function, inital cmds use lowercasehex.
> >
> > V2: https://lore.kernel.org/all/20240422090310.3311429-3-yangcong5@huaq=
in.corp-partner.google.com
> >
> > ---
> >  drivers/gpu/drm/panel/Kconfig                 |   9 +
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    |  99 ----
> >  drivers/gpu/drm/panel/panel-himax-hx83102.c   | 525 ++++++++++++++++++
> >  4 files changed, 535 insertions(+), 99 deletions(-)
>
> It probably makes sense to base your series upon mine that reduces
> bloat / introduces a better way to do these init sequences. I'm going
> to wait one more day in case anyone else has any more comments on my
> v2 and then I'll post my v3. So far everyone has been on-board with
> the overall goal and so all we need to do is iron out the small
> details, so I don't expect it to take too long.
>
> If you want to wait a day or two and then post your patches atop my v3
> (once I post it) then that would be OK by me.
>
>
> > @@ -0,0 +1,525 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Driver for panels based on Himax HX83102 controller, such as:
> > + *
> > + * - Starry 10.51" WUXGA MIPI-DSI panel
> > + *
> > + * Based on drivers/gpu/drm/panel/panel-boe-tv101wum.c
>
> The above file doesn't exist? Maybe you forgot the "-nl6" suffix? I
> would also say that this driver appears to be more similar to
> `panel-himax-hx8394.c` even if the data came from
> `panel-boe-tv101wum-nl6.c`.
>
> ...also, since this is based on `panel-himax-hx8394.c`, it seems like
> you're making pretty significant changes here. For instance, when this
> code was part of `panel-boe-tv101wum-nl6.c` it used to do the "init
> commands" as part of prepare. With the new driver it does it as part
> of "enable". IMO even if the new code based on `panel-himax-hx8394.c`
> is more correct, I'd rather see you change that in a separate change.
> In this change, which is supposed to be more about code refactoring, I
> think you should focus on keeping the behavior before and after your
> patch identical.

Ok,modified to panel-himax-hx8394.c` in V4 version.

>
>
> > +/* Manufacturer specific DSI commands */
> > +#define HX83102_SETPOWER       0xb1
> > +#define HX83102_SETDISP                0xb2
> > +#define HX83102_SETCYC         0xb4
> > +#define HX83102_SETEXTC                0xb9
> > +#define HX83102_SETMIPI                0xba
> > +#define HX83102_SETVDC         0xbc
> > +#define HX83102_SETBANK                0xbd
> > +#define HX83102_UNKNOWN1       0xbe
>
> I'm not sure that the "unknown" define helps much, but I guess it's
> fine. One nit would be to call this UNKNOWN_BE based on the address so
> that if we can later replace some of the unknowns then there won't be
> gaps in the numbering.

Got it. Thanks.

>
>
> > +#define HX83102_SETPTBA                0xbf
> > +#define HX83102_SETSTBA                0xc0
> > +#define HX83102_SETTCON                0xc7
> > +#define HX83102_SETRAMDMY      0xc8
> > +#define HX83102_SETPWM         0xc9
> > +#define HX83102_SETCLOCK       0xcb
> > +#define HX83102_SETPANEL       0xcc
> > +#define HX83102_SETCASCADE     0xd0
> > +#define HX83102_SETPCTRL       0xd1
> > +#define HX83102_UNKNOWN2       0xd2
> > +#define HX83102_SETGIP0                0xd3
> > +#define HX83102_SETGIP1                0xd5
> > +#define HX83102_UNKNOWN3       0xd6
>
> Given everything surrounding it and given a datasheet I have for a
> similar panel, I'm going to guess UNKNOWN3 is "GIP2".

Got it. Thanks.

>
>
> > +#define HX83102_SETGIP3                0xd8
> > +#define HX83102_UNKNOWN4       0xe0
>
> I think UNKNOWN4 is SETGMA to set the gamma curve.

Got it. Thanks.

>
>
> > +static int starry_init_cmd(struct hx83102 *ctx)
> > +{
> > +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> > +
> > +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETEXTC, 0x83, 0x10, 0x21, =
0x55, 0x00);
>
> As far as I can tell from looking at a different (but similar)
> datasheet, the above means "enable extended command set". Assuming I'm
> correct, maybe you could abstract out:
>
> static int hx83102_enable_extended_cmds(struct hx83102 *ctx, bool enable)
> {
>   if (enable)
>     mipi_dsi_dcs_write_seq(dsi, HX83102_SETEXTC, 0x83, 0x10, 0x21, 0x55, =
0x00);
>   else
>     mipi_dsi_dcs_write_seq(dsi, HX83102_SETEXTC, 0x00, 0x00, 0x00);
> }
>
> Then your panel-specific init functions could call that?

Got it. Thanks.

>
> Speaking of which, some of the panels that you add to this driver seem
> to disable extended commands at the end of their init sequence, but
> this one doesn't. Should it?

I  have confirmed with himax that disable extended commands  used
at the end to prevent accidental writing. And our inital code has been
confirmed by himax before FSI. Considering that this has been on the
market for a long time and there are no feedback issues, I think it should
remain the same as `panel-boe-tv101wum-nl6.c`.  What do you think?

>
>
> > +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETPOWER, 0x2c, 0xb5, 0xb5,=
 0x31, 0xf1, 0x31, 0xd7, 0x2f,
> > +                                                 0x36, 0x36, 0x36, 0x3=
6, 0x1a, 0x8b, 0x11, 0x65, 0x00, 0x88, 0xfa, 0xff,
> > +                                                 0xff, 0x8f, 0xff, 0x0=
8, 0x74, 0x33);
>
> nit: Can you make your indentation cleaner? Right now when a function
> call extends to multiple lines the subsequent lines are indented a
> somewhat random amount of space that probably has to do with how much
> they needed to be indented before.
>
> ...though if you base on my v3 series that I'll send out tomorrow then
> probably you'd just move this over and the indentation would be right.

Got it. Fix in V4.

>
>
> > +
> > +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETDISP, 0x00, 0x47, 0xb0, =
0x80, 0x00, 0x12, 0x72, 0x3c,
> > +                                                 0xa3, 0x03, 0x03, 0x0=
0, 0x00, 0x88, 0xf5);
> > +
> > +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETCYC, 0x76, 0x76, 0x76, 0=
x76, 0x76, 0x76, 0x63, 0x5c,
> > +                                                 0x63, 0x5c, 0x01, 0x9=
e);
>
> nit: I wouldn't have put a blank line between every function call.

Got it. Fix in V4.

>
>
> > +static int hx83102_enable(struct drm_panel *panel)
> > +{
> > +       struct hx83102 *ctx =3D panel_to_hx83102(panel);
> > +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> > +       struct device *dev =3D &dsi->dev;
> > +       int ret;
> > +
> > +       ret =3D ctx->desc->init_cmds(ctx);
> > +       if (ret) {
> > +               dev_err(dev, "Panel init cmds failed: %d\n", ret);
> > +               return ret;
> > +       }
>
> nit: don't call it "init_cmds" now that it's not a cmdlist anymore. In
> my patch series converting things I called it "init". Seems like
> "hx8394.c" calls it "init_sequence". Either would be fine.

Got it. Fix in V4.

>
> nit: the init function already prints errors so you don't need to.
> Just return the error without printing.
>
>
> > +       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       msleep(120);
> > +
> > +       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to turn on the display: %d\n", ret=
);
> > +               goto sleep_in;
> > +       }
> > +
> > +       msleep(130);
> > +
> > +       return 0;
> > +
> > +sleep_in:
> > +       ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> > +       if (!ret)
> > +               msleep(50);
>
> The above is broken (but it's also broken in the driver that you
> copied this from). Specifically imagine that the call to
> mipi_dsi_dcs_set_display_on() above failed. "ret" will have an error
> code and you'll jump to "sleep_in". Now, imagine that
> mipi_dsi_dcs_enter_sleep_mode() _didn't_ fail. Since you store the
> result in the same variable "ret" you'll clobber the error code that
> mipi_dsi_dcs_set_display_on() returned and you'll return "0" (no
> error) from this function. That's not right.

Thank you for your explanation, remove  'goto sleep_in;' in V4.

>
>
> > +static int hx83102_panel_add(struct hx83102 *ctx)
> > +{
> > +       struct device *dev =3D &ctx->dsi->dev;
> > +       int err;
> > +
> > +       ctx->avdd =3D devm_regulator_get(dev, "avdd");
> > +       if (IS_ERR(ctx->avdd))
> > +               return PTR_ERR(ctx->avdd);
> > +
> > +       ctx->avee =3D devm_regulator_get(dev, "avee");
> > +       if (IS_ERR(ctx->avee))
> > +               return PTR_ERR(ctx->avee);
> > +
> > +       ctx->pp1800 =3D devm_regulator_get(dev, "pp1800");
> > +       if (IS_ERR(ctx->pp1800))
> > +               return PTR_ERR(ctx->pp1800);
> > +
> > +       ctx->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_LO=
W);
> > +       if (IS_ERR(ctx->enable_gpio)) {
> > +               return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio), "C=
annot get enable GPIO\n");
> > +       }
>
> nit: remove braces since the above is now one line.
Got it. Thanks.
