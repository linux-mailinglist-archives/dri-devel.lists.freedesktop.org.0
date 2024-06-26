Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9123917EFF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 12:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7828810E10C;
	Wed, 26 Jun 2024 10:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HtlvIJE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602E110E10C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 10:55:44 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-57d07464aa9so85783a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 03:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719399342; x=1720004142;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DvpHCyqwIEWrIEkuFm3ZwyDR/Vs8dxE4a8djGzFogD8=;
 b=HtlvIJE3LudvWVD5lDP+9IDMXPo9nUF7cEg05Ylk2SEalJPaqANhgMMESlNVg8X4LB
 YGTGRgZjwcxzkFqErSmjH7k0RwS2OL24A3zp/TvihDgh0U94LNQkVzZDyEK1PkOU44nG
 EF3ucI3exK6HJ8WA00gIJauPpL8/jDSumem9eoPTt9Z1fQDMa0PrFBqB7x71SGko+kuD
 lreY885t0dKBtFZWZVjiF60DbHmEKb2lx5NbG6MCsxutPOxv/oD51oC/5QpTiB3wyzwK
 s8IoCtNNdwO4QgiAZIEmwrt4XommFQ+chxPJrgFVwrDgEgA0+K2zfd/xTLmsciFmfxNg
 uisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719399342; x=1720004142;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DvpHCyqwIEWrIEkuFm3ZwyDR/Vs8dxE4a8djGzFogD8=;
 b=xErTHQOqHZ1e3F/q9pz1gGJVXMpN9vbpLmbR58s93XntDb1a5DJE1KG5IGMbxhvlos
 q4IoHg45rhmd/KMDlvpYMYKdB/ZIJrr6BVN57zT3burg3ODEhQIhN41pkDPo24ig/a4g
 a9bB7S441qudwlpqI1e3wl9CqIlQTvCnkY0cDDZIyVpgsXJ1xpxW1xTA2fxJVjzNd3m0
 RY7Aa3GUfdzlsFZm0LmSeEk9GU8CoB/NBiQ2N6r2/mw/2ngoWYfKLypcmw64bgAVmrzo
 7mYwwJcmJmiD8NGWtzDTyyEY9o10h0f2Cq1nfi7Bn7G7FpTRRezv3tAv4wimp/PIcD6I
 9icQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz5AlvqGlafDDp8U6ljn5ZWPw61gNthhi/ro6kIMj/A76zyKiXEaDgLIlL9i0xNvqz+dq5iEj1MMzi8oP4Qg0n03zaXFIAReR01OzmP4/c
X-Gm-Message-State: AOJu0Yx98niO22fc3qO6YDPQE7etJYVEP/X6PrjWjRMkUEoWuEn2nUnb
 htK6T7Z70ivTLWOXYM1ANcrKlID+K1Pjj3fTfEDq28a3jNg5usINVcEyX+waEB8JvlC8DTtn41Z
 EJ1wVriLgzKrjec1trZGv+zatWXak4rjLx6eKNQ==
X-Google-Smtp-Source: AGHT+IFLL8v+ApRsdF1oQyJ4gYj95DTo+ZpYfz8vWOavfb/Rr+f7PYpka089Pmz5x/tFDV2Ns1y5LdQGTy6tzXBS1V0=
X-Received: by 2002:a50:8d4f:0:b0:57d:10bb:b42b with SMTP id
 4fb4d7f45d1cf-57d4bdcba20mr6272487a12.26.1719399342459; Wed, 26 Jun 2024
 03:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240624141926.5250-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <de8ab492-272c-4bed-92eb-a0c3303543b2@quicinc.com>
 <CA+6=WdSDSvcMJsmUNW6NXqNXktYjp0xdqk8Y+FakiPBYcXfgGw@mail.gmail.com>
 <a5734572-c822-493a-a15a-63dcf37d60cc@quicinc.com>
In-Reply-To: <a5734572-c822-493a-a15a-63dcf37d60cc@quicinc.com>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Wed, 26 Jun 2024 18:55:31 +0800
Message-ID: <CA+6=WdSYZCOQvOLCVV9BVBs_=UKbw9Sn8t7a58hY=Y--7JqGvg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] drm/panel: jd9365da: Modify the method of sending
 commands
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com, 
 jagan@edgeble.ai, neil.armstrong@linaro.org, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Shuijing Li <shuijing.li@mediatek.corp-partner.google.com>
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

On Wed, Jun 26, 2024 at 1:49=E2=80=AFAM Jessica Zhang <quic_jesszhan@quicin=
c.com> wrote:
>
>
>
> On 6/25/2024 5:13 AM, zhaoxiong lv wrote:
> > On Tue, Jun 25, 2024 at 7:41=E2=80=AFAM Jessica Zhang <quic_jesszhan@qu=
icinc.com> wrote:
> >>
> >>
> >>
> >> On 6/24/2024 7:19 AM, Zhaoxiong Lv wrote:
> >>> Currently, the init_code of the jd9365da driver is placed
> >>> in the enable() function and sent, but this seems to take
> >>> a long time. It takes 17ms to send each instruction (an init
> >>> code consists of about 200 instructions), so it takes
> >>> about 3.5s to send the init_code. So we moved the sending
> >>> of the inti_code to the prepare() function, and each
> >>> instruction seemed to take only 25=CE=BCs.
> >>>
> >>> We checked the DSI host and found that the difference in
> >>> command sending time is caused by the different modes of
> >>> the DSI host in prepare() and enable() functions.
> >>> Our DSI Host only supports sending cmd in LP mode, The
> >>> prepare() function can directly send init_code (LP->cmd)
> >>> in LP mode, but the enable() function is in HS mode and
> >>> needs to switch to LP mode before sending init code
> >>> (HS->LP->cmd->HS). Therefore, it takes longer to send
> >>> the command.
> >>>
> >>> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.c=
om>
> >>
> >> Hi Zhaoxiong,
> >>
> >> Just curious, if the host expects that commands are sent in LP mode, w=
hy
> >> isn't the MIPI_DSI_MODE_LPM flag set before sending the DCS commands?
> >>
> >> Thanks,
> >>
> >> Jessica Zhang
> >
> > hi jessica
> >
> > We have tried to set dsi->mode_flags to MIPI_DSI_MODE_LPM in the
> > probe() function,
> > but this seems to still happen. MTK colleagues believe that the host
> > dsi configuration is
> > still in LP mode during the prepare() function, and when in the
> > enable() function, the host
> > dsi is already in HS mode. However, since the command must be sent in
> > LP mode, it will
> > switch back and forth between HS->LP->HS.
> >
> > Add Mediatek colleagues=EF=BC=88shuijing.li@mediatek.corp-partner.googl=
e.com=EF=BC=89
>
> Got it. Even drivers that call their init commands in prepare() set the
> LPM flag [1][2] when applicable so I was just wondering why this driver
> doesn't seem to set LPM at all even though it is going into LP mode.
>
> [1]
> https://elixir.bootlin.com/linux/v6.10-rc5/source/drivers/gpu/drm/panel/p=
anel-visionox-vtdr6130.c#L46
>
> [2]
> https://elixir.bootlin.com/linux/v6.10-rc5/source/drivers/gpu/drm/panel/p=
anel-visionox-r66451.c#L46

hi  jessica

The initial default setting of our host DSI is the LP mode.





>
> >
> >
> >>
> >>> ---
> >>> Changes between V5 and V4:
> >>> - 1. No changes.
> >>>
> >>> V4:https://lore.kernel.org/all/20240620080509.18504-2-lvzhaoxiong@hua=
qin.corp-partner.google.com/
> >>>
> >>> Changes between V4 and V3:
> >>> - 1. Only move mipi_dsi_dcs_write_buffer from enable() function to pr=
epare() function,
> >>> -    and no longer use mipi_dsi_dcs_write_seq_multi.
> >>>
> >>> V3:https://lore.kernel.org/all/20240614145510.22965-2-lvzhaoxiong@hua=
qin.corp-partner.google.com/
> >>>
> >>> ---
> >>>    .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 24 +++++++++------=
----
> >>>    1 file changed, 11 insertions(+), 13 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drive=
rs/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> >>> index 4879835fe101..a9c483a7b3fa 100644
> >>> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> >>> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> >>> @@ -52,21 +52,9 @@ static int jadard_enable(struct drm_panel *panel)
> >>>    {
> >>>        struct device *dev =3D panel->dev;
> >>>        struct jadard *jadard =3D panel_to_jadard(panel);
> >>> -     const struct jadard_panel_desc *desc =3D jadard->desc;
> >>>        struct mipi_dsi_device *dsi =3D jadard->dsi;
> >>> -     unsigned int i;
> >>>        int err;
> >>>
> >>> -     msleep(10);
> >>> -
> >>> -     for (i =3D 0; i < desc->num_init_cmds; i++) {
> >>> -             const struct jadard_init_cmd *cmd =3D &desc->init_cmds[=
i];
> >>> -
> >>> -             err =3D mipi_dsi_dcs_write_buffer(dsi, cmd->data, JD936=
5DA_INIT_CMD_LEN);
> >>> -             if (err < 0)
> >>> -                     return err;
> >>> -     }
> >>> -
> >>>        msleep(120);
> >>>
> >>>        err =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> >>> @@ -100,6 +88,8 @@ static int jadard_disable(struct drm_panel *panel)
> >>>    static int jadard_prepare(struct drm_panel *panel)
> >>>    {
> >>>        struct jadard *jadard =3D panel_to_jadard(panel);
> >>> +     const struct jadard_panel_desc *desc =3D jadard->desc;
> >>> +     unsigned int i;
> >>>        int ret;
> >>>
> >>>        ret =3D regulator_enable(jadard->vccio);
> >>> @@ -117,7 +107,15 @@ static int jadard_prepare(struct drm_panel *pane=
l)
> >>>        msleep(10);
> >>>
> >>>        gpiod_set_value(jadard->reset, 1);
> >>> -     msleep(120);
> >>> +     msleep(130);
> >>> +
> >>> +     for (i =3D 0; i < desc->num_init_cmds; i++) {
> >>> +             const struct jadard_init_cmd *cmd =3D &desc->init_cmds[=
i];
> >>> +
> >>> +             ret =3D mipi_dsi_dcs_write_buffer(dsi, cmd->data, JD936=
5DA_INIT_CMD_LEN);
> >>> +             if (ret < 0)
> >>> +                     return ret;
> >>> +     }
> >>>
> >>>        return 0;
> >>>    }
> >>> --
> >>> 2.17.1
> >>>
