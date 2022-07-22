Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504FE57E411
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 18:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE091137A4;
	Fri, 22 Jul 2022 16:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE28A96F60
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 16:05:59 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id mf4so9382133ejc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 09:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MnftyBzRGSBEVE4hevJey01J9ByqvjlOa85l8x7VehU=;
 b=mKNq2Y6EXqL3tUFN9MNVQzfJPv64ZNkE+Cy9/5Ube3pAMJJDGM6SXDiz69odVtjmAY
 0dV4pCR3Euzf6E2lLFTBq6Rf94J8eMhqC8hrc28hOpSbsXsx53MsQ3LgIbOyyIK/tjD7
 cE+W6wrlx5LXebQoZ4oDdUUxdCbCqIXSc5YB86LwgfzM2Pxvd/xNDwK6/SQHE6McJngb
 bikqXthWvXTV3gasdN4JN1mqJlRcHwVrd/glBa7xQ27Vyfa75SbDISrRq7Pm9m9tjUby
 JyXLBbJZqwNQbBSOVKcgnNSPYQlKoCsfyK2sJYa+39KoCtl7ZYK7Tb2uXCRcl5FW8Vfv
 w6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MnftyBzRGSBEVE4hevJey01J9ByqvjlOa85l8x7VehU=;
 b=pC2qwGiNIn1zCUsokPdCzUlmRoIv2o3lp5IPjtVSaVVR/Xz8WsTA/GdL6QXUQY3a+r
 79I/UL6pYVvYH3BOoujsKXt2o4MqRPSPGpJqHsbxqdJmy08QfMeUUewYk10PSkroECSq
 WlsBWBrTcwMG0WC/tcTUNDBxNi+nU87OX1qgm2F8b3UPpNmZWJsMPoocYFZausqEdI5h
 RgX4V30sRfs7VwFKURN53lcPEFake9ma+bz2opBzRLkhPJxwDlv8L9qJ1v0aFBl6VgJl
 hhQKT1/eg+9xUnU0qmeZOZZlV8fZ0ywp9nKXAcJmp0lWrU4so8qwmK3SsmR/DfKncaCP
 1jjg==
X-Gm-Message-State: AJIora9ABMMatXGfPkvIDQxHSchjGdxb3ctmorVswzwYG0vlWQkRd672
 suv0w74afNC/qFPHvdCU701kFP9En2nXVmy/G8AaPA==
X-Google-Smtp-Source: AGRyM1vBFbtqVsQgghpDhvhpCCJ+MwMdJCOMMWmRAW5CyO+wXnemMWaIL1UBkzGhQ0bB0k/VzGtC8aHiEtuD1f3vW9k=
X-Received: by 2002:a17:906:4fd5:b0:72e:ce13:2438 with SMTP id
 i21-20020a1709064fd500b0072ece132438mr469619ejw.175.1658505958265; Fri, 22
 Jul 2022 09:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
 <CGME20220720155316eucas1p2ab58c67670ef8f30f0827fdbe5c41ef2@eucas1p2.samsung.com>
 <20220720155210.365977-7-jagan@amarulasolutions.com>
 <8598bc48-ab5d-92fe-076a-c1e6ca74fccd@samsung.com>
In-Reply-To: <8598bc48-ab5d-92fe-076a-c1e6ca74fccd@samsung.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 22 Jul 2022 17:05:42 +0100
Message-ID: <CAPY8ntCrOqYbE7X5vCP7xa9xqJY8RwpO68hWhg1UuYusd3EQCA@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] drm: bridge: samsung-dsim: Add DSI init in
 bridge pre_enable()
To: Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan and Marek.

On Fri, 22 Jul 2022 at 16:35, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> On 20.07.2022 17:52, Jagan Teki wrote:
> > Host transfer() in DSI master will invoke only when the DSI commands
> > are sent from DSI devices like DSI Panel or DSI bridges and this
> > host transfer wouldn't invoke for I2C-based-DSI bridge drivers.
> >
> > Handling DSI host initialization in transfer calls misses the
> > controller setup for I2C configured DSI bridges.
> >
> > This patch adds the DSI initialization from transfer to bridge
> > pre_enable as the bridge pre_enable API is invoked by core as
> > it is common across all classes of DSI device drivers.
>
> This is still problematic in case of Exynos. Without a workaround like this
>
> https://github.com/mszyprow/linux/commit/11bbfc61272da9610dd5c574bb8ef838dc150961
>
> the display on the all real DSI panels on my Exynos based boards is broken.

I'd queried on the other thread trying to address DSI operation [1] as
to whether the test for STOP_STATE (presumably LP-11) at [2] was
actually valid, but had no response.
There is no need to check for bus contention at that point, but should
it happen the driver doesn't write the registers in lines 862-868
having returned -EFAULT at line 853. The controller is therefore only
partially initialised.

I may be misinterpreting what that code is waiting for though, or the
hardware may require some further state before it can be initialised.

  Dave

[1] https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg397703.html
[2] https://github.com/mszyprow/linux/blob/11bbfc61272da9610dd5c574bb8ef838dc150961/drivers/gpu/drm/bridge/samsung-dsim.c#L850

> >
> > v3:
> > * none
> >
> > v2:
> > * check initialized state in samsung_dsim_init
> >
> > v1:
> > * keep DSI init in host transfer
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >   drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++------
> >   1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > index 9b74a3f98a17..b07909a52f2d 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1258,6 +1258,9 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
> >   {
> >       const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
> >
> > +     if (dsi->state & DSIM_STATE_INITIALIZED)
> > +             return 0;
> > +
> >       samsung_dsim_reset(dsi);
> >       samsung_dsim_enable_irq(dsi);
> >
> > @@ -1270,6 +1273,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
> >       samsung_dsim_set_phy_ctrl(dsi);
> >       samsung_dsim_init_link(dsi);
> >
> > +     dsi->state |= DSIM_STATE_INITIALIZED;
> > +
> >       return 0;
> >   }
> >
> > @@ -1289,6 +1294,10 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
> >       }
> >
> >       dsi->state |= DSIM_STATE_ENABLED;
> > +
> > +     ret = samsung_dsim_init(dsi);
> > +     if (ret)
> > +             return;
> >   }
> >
> >   static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> > @@ -1464,12 +1473,9 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
> >       if (!(dsi->state & DSIM_STATE_ENABLED))
> >               return -EINVAL;
> >
> > -     if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
> > -             ret = samsung_dsim_init(dsi);
> > -             if (ret)
> > -                     return ret;
> > -             dsi->state |= DSIM_STATE_INITIALIZED;
> > -     }
> > +     ret = samsung_dsim_init(dsi);
> > +     if (ret)
> > +             return ret;
> >
> >       ret = mipi_dsi_create_packet(&xfer.packet, msg);
> >       if (ret < 0)
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
