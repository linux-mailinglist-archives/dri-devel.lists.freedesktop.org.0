Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFBC902093
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 13:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F7589B78;
	Mon, 10 Jun 2024 11:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YcdNmjL/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA3589B78
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:46:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8492F60AF4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741E9C4AF55
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718019958;
 bh=LkJbrehovjI8boe5mKT25LVBJmIDKTobkxAiPn5ANrs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YcdNmjL/Kg19JlWdyGtIGam2DhFIoyzaA+RZ/TSZaBRZBL55Ly52V70toHdLAQK2b
 k4oRPtSFOd8BC3xTzLxGVb43zwow/i9ZCxS+eLTOxZC4SWjzuhyo+wVLVdYvybjoR2
 1WGYSOJpPQR5GVIAQZzNXup1O3mXsEp5ZczJPDNxGhDL0u3QZ9YlYNjyDFOtNmBdZK
 8RPgUP2nj5owfPP8y1zhZl/f0ivnEdS25/nztvMzv8op0xW/6pvuxv/sa3NM05xUMQ
 L8kPv09i1Vh65awZ5i33977VdFBD2yLXYl2JgwTZMVCzjoW/FPc8gujk3jJZojqMCA
 fXOtA1fXoTjUg==
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dfa4876a5bbso3981205276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 04:45:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWWi02zPK0mm6yArkK+rw/y/tm4LprITnEKP948kXF2sI1UT5pDBJqc/cT6fDqSZYeBfUj9BUw6gMb0ScpQP8XuoDaaTRM4RNsy6FKR2i28
X-Gm-Message-State: AOJu0Yx2dz/XDESYvhdFQIQ/pNguTU79WDcbn83WCPWkps1j2X7xnT9M
 AUi9gWI97llFvPtg5pSf33a5YVL29dtlvDvM9nAs8FerUkQQHgGmrcyquGpI1icgELqjsbigr5R
 6X3iMf60xWoR8Gp5e1fC6BgSn6lIosMMvZbjg7w==
X-Google-Smtp-Source: AGHT+IE9MeVBsZF94aj/YHt5dCD74gzjhxYbl6SkNcdi+ZXk0stj9lwbNuDA0bYmmw/1OtQpee+r5SKCScZprWB34uw=
X-Received: by 2002:a25:901:0:b0:dee:998b:1459 with SMTP id
 3f1490d57ef6-dfaf653d004mr8969753276.39.1718019957648; Mon, 10 Jun 2024
 04:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-11-l.stach@pengutronix.de>
 <CAN6tsi4js9jb3Q2tTKLo=3ueCPsQaezZ-FDyzHjJ14D0-Z7ttg@mail.gmail.com>
In-Reply-To: <CAN6tsi4js9jb3Q2tTKLo=3ueCPsQaezZ-FDyzHjJ14D0-Z7ttg@mail.gmail.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 10 Jun 2024 13:45:46 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5R1TiLnwAz0tDbc=jYODwwpTx=3Am-Jqh1wAqYb_8xgA@mail.gmail.com>
Message-ID: <CAN6tsi5R1TiLnwAz0tDbc=jYODwwpTx=3Am-Jqh1wAqYb_8xgA@mail.gmail.com>
Subject: Re: [PATCH 10/14] drm/bridge: analogix_dp: move macro reset after
 link bandwidth setting
To: Lucas Stach <l.stach@pengutronix.de>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>, 
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 patchwork-lst@pengutronix.de
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

On Tue, May 7, 2024 at 3:07=E2=80=AFPM Robert Foss <rfoss@kernel.org> wrote=
:
>
> On Fri, May 3, 2024 at 5:13=E2=80=AFPM Lucas Stach <l.stach@pengutronix.d=
e> wrote:
> >
> > Setting the link bandwidth may change the PLL parameters, which will ca=
use
> > the PLL to go out of lock, so make sure to apply the MACRO_RST, which
> > according to the comment is required to be pulsed after the PLL is lock=
ed.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drive=
rs/gpu/drm/bridge/analogix/analogix_dp_core.c
> > index b4a47311cfe8..736b2ed745e1 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > @@ -243,6 +243,11 @@ static int analogix_dp_link_start(struct analogix_=
dp_device *dp)
> >
> >         /* Set link rate and count as you want to establish*/
> >         analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
> > +       /*
> > +        * MACRO_RST must be applied after the PLL_LOCK to avoid
> > +        * the DP inter pair skew issue for at least 10 us
> > +        */
> > +       analogix_dp_reset_macro(dp);
> >         analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
> >
> >         /* Setup RX configuration */
> > @@ -565,12 +570,6 @@ static int analogix_dp_full_link_train(struct anal=
ogix_dp_device *dp,
> >         int retval =3D 0;
> >         bool training_finished =3D false;
> >
> > -       /*
> > -        * MACRO_RST must be applied after the PLL_LOCK to avoid
> > -        * the DP inter pair skew issue for at least 10 us
> > -        */
> > -       analogix_dp_reset_macro(dp);
> > -
> >         /* Initialize by reading RX's DPCD */
> >         analogix_dp_get_max_rx_bandwidth(dp, &dp->link_train.link_rate)=
;
> >         analogix_dp_get_max_rx_lane_count(dp, &dp->link_train.lane_coun=
t);
> > @@ -637,9 +636,12 @@ static int analogix_dp_fast_link_train(struct anal=
ogix_dp_device *dp)
> >         u8 link_align, link_status[2];
> >         enum pll_status status;
> >
> > -       analogix_dp_reset_macro(dp);
> > -
> >         analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
> > +       /*
> > +        * MACRO_RST must be applied after the PLL_LOCK to avoid
> > +        * the DP inter pair skew issue for at least 10 us
> > +        */
> > +       analogix_dp_reset_macro(dp);
> >         analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
> >         analogix_dp_set_lane_link_training(dp);
> >
> > --
> > 2.39.2
> >
>
> This patch does not apply on drm-misc/drm-misc-next as far as I can tell.

Reviewed-by: Robert Foss <rfoss@kernel.org>
