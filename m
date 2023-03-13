Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7336B7997
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 14:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD82310E527;
	Mon, 13 Mar 2023 13:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A60A10E527
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 13:56:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A230EB8112C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 13:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7FCFC433A1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678715793;
 bh=9enmi3Gn/b59unt9NzTmjRn+DkaYf8lxMijYqi6LByU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LLXrWgpq32g5HaQAzF2QEWhCE14oooMdUQrTIUmzMdOI6fg6i7UG7GNSb4QItJvZv
 PDqeCdYOp4So9dcoUg8Yv4wxVqX4Wlgx2Ykd4CbT0U5vCdiZHXT/SF+uQFYotSDpna
 ADupU4lOAE9CH39ZpK4t/wkJeVbPV98QCzwZigvYev7OzQxOdvZAFRcPOAm9/I1ogw
 9yron9yLOCnJfBg9S/5rMUDkuhkp7W70uB7vXgIMVmIw/k77E7J0r7upO7C4F0v3I4
 13/Lv6H8neWeSbM7T5Ns2qIkbFOEleYAVo0y8Shqi8vQ2g7DWtj8sBS9lHGqrFBMmx
 u8KDYB/NpnP2g==
Received: by mail-pj1-f49.google.com with SMTP id l1so12139116pjt.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 06:56:33 -0700 (PDT)
X-Gm-Message-State: AO0yUKXS7qn8nnbecpCKXwq97goDCan4+Z0vtDYRneVBUehjl+4C/Bme
 IAi2dsA8iI/4mxGg4DZWEyItVPVBkoWULOXyQQ21Jw==
X-Google-Smtp-Source: AK7set9Yx7vZO3xt+ZXR4S1QpCPobp7lXA5M2uLIIfNkxCe8ho04BUmv6bpxz2XUjfdKoiOdTxANLeY4DjsETNDnZCI=
X-Received: by 2002:a17:90a:5d0b:b0:23b:3611:e42c with SMTP id
 s11-20020a17090a5d0b00b0023b3611e42cmr2367012pji.5.1678715793432; Mon, 13 Mar
 2023 06:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230311231007.46174-1-aford173@gmail.com>
 <6ae67215-28b6-04bf-b61d-1ba99ffdf6fb@linaro.org>
In-Reply-To: <6ae67215-28b6-04bf-b61d-1ba99ffdf6fb@linaro.org>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 13 Mar 2023 14:56:22 +0100
X-Gmail-Original-Message-ID: <CAN6tsi5jW8QOGe3yMQzFMsU7f9=HKOx8a_2azV3rTRNaz-v=0g@mail.gmail.com>
Message-ID: <CAN6tsi5jW8QOGe3yMQzFMsU7f9=HKOx8a_2azV3rTRNaz-v=0g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7533: Fix adv7533_mode_valid for adv7533
 and adv7535
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 12, 2023 at 2:10=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 12/03/2023 01:10, Adam Ford wrote:
> > When dynamically switching lanes was removed, the intent of the code
> > was to check to make sure that higher speed items used 4 lanes, but
> > it had the unintended consequence of removing the slower speeds for
> > 4-lane users.
> >
> > This attempts to remedy this by doing a check to see that the
> > max frequency doesn't exceed the chip limit, and a second
> > check to make sure that the max bit-rate doesn't exceed the
> > number of lanes * max bit rate / lane.
> >
> > Fixes: 9a0cdcd6649b ("drm/bridge: adv7533: remove dynamic lane switchin=
g from adv7533 bridge")
> >
>
> Please remove the empty line here. There should be no empty lines
> between the tags
>
>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm=
/bridge/adv7511/adv7533.c
> > index fdfeadcefe80..10a112d36945 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > @@ -103,13 +103,9 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
> >   enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
> >                                       const struct drm_display_mode *mo=
de)
> >   {
> > -     int lanes;
> > +     unsigned long max_lane_freq;
> >       struct mipi_dsi_device *dsi =3D adv->dsi;
> > -
> > -     if (mode->clock > 80000)
> > -             lanes =3D 4;
> > -     else
> > -             lanes =3D 3;
> > +     u8 bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> >
> >       /*
> >        * TODO: add support for dynamic switching of lanes
>
> Drop the comment please. It makes little sense with your new implementati=
on.
>
> > @@ -117,8 +113,16 @@ enum drm_mode_status adv7533_mode_valid(struct adv=
7511 *adv,
> >        * out the modes which shall need different number of lanes
> >        * than what was configured in the device tree.
> >        */
> > -     if (lanes !=3D dsi->lanes)
> > -             return MODE_BAD;
> > +
> > +     /* Check max clock for either 7533 or 7535 */
> > +     if (mode->clock > (adv->type =3D=3D ADV7533 ? 80000 : 148500))
> > +             return MODE_CLOCK_HIGH;
> > +
> > +     /* Check max clock for each lane */
> > +     max_lane_freq =3D (adv->type =3D=3D ADV7533 ? 800000 : 891000);
> > +
> > +     if (mode->clock * bpp > max_lane_freq * adv->num_dsi_lanes)
> > +             return MODE_CLOCK_HIGH;
> >
> >       return MODE_OK;
> >   }
>
> --
> With best wishes
> Dmitry
>

With Dmitrys feedback, feel free to add my Reviewed-by.
