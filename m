Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 502B58B17F2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 02:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01C2113EE4;
	Thu, 25 Apr 2024 00:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Cl4UGFOr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD9F113EE4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 00:22:08 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-439b1c72676so126521cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 17:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1714004527; x=1714609327;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qX36zL+8SnXnPofbhPQH1rVaLb6ttYTTZybT/hWsEJs=;
 b=Cl4UGFOrc4j2MUHm8sPolHawBkBmdGK3KXSxrNpSY/R6iZGni0ohx5wMde4mnqClGL
 jCui6EQzpso1ubVkBsBvlyaWGIAjUnggHzW+rsZlHgx5dsr+RrJLXcQGhDUVEolHzAuo
 PmNPATHimSpovV35jdFDHYmLYd+R7REHb5Hr3cMTao+kjEnKkMMZNHpbvIZkDppcvJFn
 rQgMefUSbMfJHIljmyzy3ogL0SguwqbtlOfyH4Kb5aHBu/V8Hc6d3w0JDqcWN+3Jo9W9
 YlSRQ/RRDLM/OgXAquMbiwqQdp7pQ3084l/umgmoEpDq0IEZi7Q7VXNKA92jBoGYeTZv
 gbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714004527; x=1714609327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qX36zL+8SnXnPofbhPQH1rVaLb6ttYTTZybT/hWsEJs=;
 b=Oz9nBy0t6U7xoKolqHbP9USOR5bwamgP05JRT7AMX8GpdJd5EQkywxY9ACGJbv+Vbl
 RuLIIr0IbX/JA6bVESkc8gQcnqqlQ8nvNldrjvjyARCIzq2BOlux9P9PradOL+qs+XRu
 cTv5ylBqycclkFSoseqdTwYvEGJrUPbFO41dYkeW7ijpaLcpAxmveGvpteqPoNYrU8UN
 MiVIT4NtHM7E7IfbG3iyfyfsapE4HyTw6B4zQ6GXA/JjbCU+4WDxUx6ZUUdpiqJqFJER
 JHtN7nW2SuutwZQ1lKBQhYsm3xODvTx5EZtat2OXdDo5Wi2GjGftdk1ircDG3eB1BoNi
 n5Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeSAJU5W4+13G5Znc+G2Zj1u6K49A9EABX0xgyEp/J26X5rZ5ChDIT54HPLvobqtAEtLCEPKAIymYGyurVeS+ozdMhsNuBkPlLhtfcHQX0
X-Gm-Message-State: AOJu0YwSVvTU2/XoQwVKI+yH5WnlQkqsEa7UVVWWNhyuI4f5NoMqJ8rv
 +v4NwGERLZ8rylwpWAAxcE1ZrRSwUtQ/ex6nmQTV90R9F3/Rid0DQD30FDlzkhPSoB1cj/QFuPm
 wfNC2pB+zdwqia7varJDrNzGK30qupa6aZkMa
X-Google-Smtp-Source: AGHT+IHgB4NlLUHPs3FdgauOg8a5+o89vMOPoBWLv+vZwU9HJB9ei+66DabBHm0TnslA9GBNspCREnBo0enCduLAjMM=
X-Received: by 2002:ac8:53c1:0:b0:439:d5e3:1f31 with SMTP id
 c1-20020ac853c1000000b00439d5e31f31mr132912qtq.4.1714004526570; Wed, 24 Apr
 2024 17:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240418081548.12160-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <zanx5y3obqmewnbooovf52hx6vh7tpi4zsbse2dyzcqzddmzhw@kewxoa6n3mja>
 <CACb=7PURWtS8bwT5EcAFHhu7deHd2Y8cNOattfdwyEYpOUcbnQ@mail.gmail.com>
 <vbt2nxddw2dc7hkreq4iybv5zv5xyp32oajybeqsphgfrhzmn7@tskvckljmxpe>
 <CACb=7PVTvV9nsFu1ZAXu7YTjSOAGZka+c__EJq3J3qgSJGEShw@mail.gmail.com>
 <CAD=FV=VYAzqsGEBJai9b9n+HxHiG59L1vF73AEWcTwLS_ryjWw@mail.gmail.com>
 <an2k3vgynq4as2sd5dy6ccmdiqedmo7qjsab5qyfhesd333i2a@235sqph3bze5>
 <CAD=FV=VQ8rbwKk4WpHRER9p4cZp7UrrHRpgnErqbQxyxp4sg5w@mail.gmail.com>
 <CAA8EJprv3qBd1hfdWHrfhY=S0w2O70dZnYb6TVsS6AGRPxsYdw@mail.gmail.com>
 <CACb=7PVEpCFWf_aysRkeR0yWAXR5sTaXhNbi3TV3ffKj866+EQ@mail.gmail.com>
 <CAA8EJprLvEt_pt4XzACQG7pU8KYagKbQ71xwtRF9KrLygTT3ow@mail.gmail.com>
 <CAD=FV=V+jBvkKj1vvAsXuC5dSn0u_SQBQZHTrDZKoSG2V4fp3g@mail.gmail.com>
 <CAA8EJprU1KZHKAVUJiYaDRY6Wxihzw=ZDgdqQ9y7W3zdnRMfFg@mail.gmail.com>
In-Reply-To: <CAA8EJprU1KZHKAVUJiYaDRY6Wxihzw=ZDgdqQ9y7W3zdnRMfFg@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Wed, 24 Apr 2024 17:21:50 -0700
Message-ID: <CAD=FV=WDTM6m6fHbs=+1Thnnsi2jCXBcAi89=8HeRYp73EUMQA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel: kd101ne3: add new panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hsin-Yi Wang <hsinyi@google.com>, 
 lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>, mripard@kernel.org, 
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 cong yang <yangcong5@huaqin.corp-partner.google.com>
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

On Wed, Apr 24, 2024 at 4:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 25 Apr 2024 at 02:25, Doug Anderson <dianders@google.com> wrote:
> >
> > Hi,
> >
> > On Wed, Apr 24, 2024 at 3:51=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, 25 Apr 2024 at 01:15, Hsin-Yi Wang <hsinyi@google.com> wrote:
> > > >
> > > > On Wed, Apr 24, 2024 at 2:49=E2=80=AFPM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > On Thu, 25 Apr 2024 at 00:04, Doug Anderson <dianders@google.com>=
 wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Tue, Apr 23, 2024 at 2:20=E2=80=AFPM Dmitry Baryshkov
> > > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > > >
> > > > > > > On Tue, Apr 23, 2024 at 01:41:59PM -0700, Doug Anderson wrote=
:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > On Tue, Apr 23, 2024 at 11:10=E2=80=AFAM Hsin-Yi Wang <hsin=
yi@google.com> wrote:
> > > > > > > > >
> > > > > > > > > > > > > +#define _INIT_DCS_CMD(...) { \
> > > > > > > > > > > > > +     .type =3D INIT_DCS_CMD, \
> > > > > > > > > > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > > > > > > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +#define _INIT_DELAY_CMD(...) { \
> > > > > > > > > > > > > +     .type =3D DELAY_CMD,\
> > > > > > > > > > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > > > > > > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > > > > > > > > >
> > > > > > > > > > > > This is the third panel driver using the same appoa=
ch. Can you use
> > > > > > > > > > > > mipi_dsi_generic_write_seq() instead of the huge ta=
ble? Or if you prefer
> > > > > > > > > > > > the table, we should extract this framework to a co=
mmon helper.
> > > > > > > > > > > > (my preference is shifted towards mipi_dsi_generic_=
write_seq()).
> > > > > > > > > > > >
> > > > > > > > > > > The drawback of mipi_dsi_generic_write_seq() is that =
it can cause the
> > > > > > > > > > > kernel size grows a lot since every sequence will be =
expanded.
> > > > > > > > > > >
> > > > > > > > > > > Similar discussion in here:
> > > > > > > > > > > https://lore.kernel.org/dri-devel/CAD=3DFV=3DWju3WS45=
=3DEpXMUg7FjYDh3-=3Dmvm_jS7TF1tsaAzbb4Uw@mail.gmail.com/
> > > > > > > > > > >
> > > > > > > > > > > This patch would increase the module size from 157K t=
o 572K.
> > > > > > > > > > > scripts/bloat-o-meter shows chg +235.95%.
> > > > > > > > > > >
> > > > > > > > > > > So maybe the common helper is better regarding the ke=
rnel module size?
> > > > > > > > > >
> > > > > > > > > > Yes, let's get a framework done in a useful way.
> > > > > > > > > > I'd say, drop the _INIT_DELAY_CMD. msleep() and usleep_=
range() should be
> > > > > > > > > > used instead (and it's up to the developer to select co=
rrect delay
> > > > > > > > > > function).
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +static const struct panel_init_cmd kingdisplay_k=
d101ne3_init_cmd[] =3D {
> > > > > > > > > > > > > +     _INIT_DELAY_CMD(50),
> > > > > > > > > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > > > > > > > > >
> > > > > > > > > > [skipped the body of the table]
> > > > > > > > > >
> > > > > > > > > > > > > +     _INIT_DCS_CMD(0x0E, 0x48),
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > > > > > > > > >
> > > > > > > > > > > > > +     _INIT_DCS_CMD(0X11),
> > > > > > > > > >
> > > > > > > > > > Also, at least this is mipi_dsi_dcs_exit_sleep_mode().
> > > > > > > > > >
> > > > > > > > > > > > > +     /* T6: 120ms */
> > > > > > > > > > > > > +     _INIT_DELAY_CMD(120),
> > > > > > > > > > > > > +     _INIT_DCS_CMD(0X29),
> > > > > > > > > >
> > > > > > > > > > And this is mipi_dsi_dcs_set_display_on().
> > > > > > > > > >
> > > > > > > > > > Having a single table enourages people to put known com=
mands into the
> > > > > > > > > > table, the practice that must be frowned upon and forbi=
dden.
> > > > > > > > > >
> > > > > > > > > > We have functions for some of the standard DCS commands=
. So, maybe
> > > > > > > > > > instead of adding a single-table based approach we can =
improve
> > > > > > > > > > mipi_dsi_generic_write_seq() to reduce the bloat. E.g. =
by moving the
> > > > > > > > > > error handling to a common part of enable() / prepare()=
 function.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > For this panel, I think it can also refer to how
> > > > > > > > > panel-kingdisplay-kd097d04.c does. Create the table for i=
nit cmd data,
> > > > > > > > > not what operation to use, and use mipi_dsi_generic_write=
_seq() when
> > > > > > > > > looping through the table.
> > > > > > > >
> > > > > > > > Even more similar discussion:
> > > > > > > >
> > > > > > > > https://lore.kernel.org/r/CAD=3DFV=3DUGDbNvAMjzWSOvxybGikQc=
vW9JsRtbxHVg8_97YPEQCA@mail.gmail.com
> > > > > > >
> > > > > > > It seems I skipped that thread.
> > > > > > >
> > > > > > > I'd still suggest a code-based solution compared to table-bas=
ed one, for
> > > > > > > the reasons I've outlined before. Having a tables puts a pres=
sure on the
> > > > > > > developer to put commands there for which we already have a
> > > > > > > command-specific function.
> > > > > >
> > > > > > The problem is that with these panels that need big init sequen=
ces the
> > > > > > code based solution is _a lot_ bigger. If it were a few bytes o=
r a
> > > > > > 1-2KB then fine, but when Hsin-Yi measured Linus W's attempt to=
 move
> > > > > > from a table to code it was 100K difference in code [1]. I woul=
d also
> > > > > > say that having these long init sequences done as separate comm=
ands
> > > > > > encourages people to skip checking the return values of each of=
 the
> > > > > > transfer functions and I don't love that idea.
> > > > > >
> > > > > > It would be ideal if these panels didn't need these long init
> > > > > > sequences, but I don't have any inside knowledge here saying th=
at they
> > > > > > could be removed. So assume we can't get rid of the init sequen=
ces it
> > > > > > feels like we have to find some way to make the tables work for=
 at
> > > > > > least the large chunks of init code and encourage people to mak=
e the
> > > > > > tables readable...
> > > > >
> > > > >
> > > > > I did a quick check on the boe-tv101wum-nl6 driver by converting =
the
> > > > > writes to use the following macro:
> > > > >
> > > > > #define mipi_dsi_dcs_write_cmd_seq(dsi, cmd, seq...)
> > > > >              \
> > > > >         do {                                                     =
              \
> > > > >                 static const u8 d[] =3D { cmd, seq };            =
            \
> > > > >                 ret =3D mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_S=
IZE(d));    \
> > > > >                 if (ret < 0)                                     =
              \
> > > > >                         goto err;                                =
              \
> > > > >         } while (0)
> > > > >
> > > > > And then at the end of the init funciton having
> > > > >
> > > > > err:
> > > > >         dev_err(panel->dev,
> > > > >                 "failed to write command %d\n", ret);
> > > > >         return ret;
> > > > > }
> > > > >
> > > >
> > > > I'm not sure about the coding style rule here, would it be consider=
ed
> > > > unclear that caller of mipi_dsi_dcs_write_cmd_seq() needs to have e=
rr
> > > > block, but the block may not be directly used in that caller and is
> > > > only jumped from the macro?
> > >
> > > I'm also not sure here. It was a quick and dirty test.
> > > We might as well do something like
> > >
> > > ret =3D mipi_dsi_dcs_write_cmd_seq(dsi, ...);
> > > if (ret)
> > >     goto err;
> > >
> > > all over the place.
> >
> > Oh. This is actually very simple to fix and requires no code changes
> > to clients. :-P We just need to hoist the printing out of the macro
> > and into "drm_mipi_dsi.c". Let me double-confirm and then I'll post a
> > patch.
>
> Sounds good. I have converted boe-tv101wum-nl6, ilitek-ili9882t and
> innolux-p079zca drivers. Once you post your patch I can post those
> too.

I sent out a patch for it, though I didn't have time to do testing on
real hardware:

https://lore.kernel.org/r/20240424172017.1.Id15fae80582bc74a0d4f1338987fa37=
5738f45b9@changeid

I can poke more at it tomorrow...

-Doug
