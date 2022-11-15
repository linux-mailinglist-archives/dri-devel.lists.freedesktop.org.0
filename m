Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4B862942E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 10:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54C610E387;
	Tue, 15 Nov 2022 09:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7812810E387
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 09:21:08 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id d3so7123866ils.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 01:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTHlNx224MYgFGEKj1x0yVtfV7nyotfOs7IW/rNlccw=;
 b=AcKggX/DTb0H6fGM1GpPvvhxRgDRGi65XhhzCvvsKzwSKXA+Asuy2L2lcpXuWwMxVh
 dt7mKVqoeSitG6PX0oJ3Gao69lZtzU7/HdnUO3AflrEXnXXzulVjsbWHMvCJ/6hfd37t
 d96Pi5zSwqQ+JJL6oP3pB1vc4vd7GsXw78Ifw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eTHlNx224MYgFGEKj1x0yVtfV7nyotfOs7IW/rNlccw=;
 b=FwQ/eU+yXnNW5QS8U7HvZWbN7o2fxPC6Wujw76au86DKQBd2lcRgz6oHyDWvV5gyFb
 SyNRHRDzsKA4272n2ofQqo5kBFnJtSlYBnMHvUCcRGV7eN3oKA2/aHxIUDIJgBt4FO9m
 lY1G7jH3etAEmrPQngmGBD8KKxhGb82f1R4KgSuoAYel4TJ+MbePE+PPFdcHe2HS8EbT
 cFfD/uNdL6q/8ofvzJ7MNecIpKAyq/l1BhhUorfSSC3xqsBAstrP0RIg/MKACws+oIzP
 kvuApFvN3QZ3J+/ZHKpLuQhjpIF9/ipfNP4ZK/c8UvFFhrbwmP1eV87B2OqCGzrnHTNP
 adSA==
X-Gm-Message-State: ANoB5pl+RfC1P0omuDP+q6IPwbr1blT+xE6HUc6pXChwFZJKUjVhwvoA
 N2cHczxyy4IMt+et5S7Z9rUIPIde4e2evMQGbXM5+Q==
X-Google-Smtp-Source: AA0mqf6NRX7+7kBngydA9jwxOk2aRKtJ5TZV3B8MNwAMo0KnJAUqd8O6aVaN2Ppz4Jc+6fAkUu9AFxwhd8D2/ysv30Q=
X-Received: by 2002:a92:ce8f:0:b0:300:c63a:796c with SMTP id
 r15-20020a92ce8f000000b00300c63a796cmr7460695ilo.43.1668504067612; Tue, 15
 Nov 2022 01:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <CGME20221110184122eucas1p11379ff6b85cf9a66455a026259c93340@eucas1p1.samsung.com>
 <20221110183853.3678209-10-jagan@amarulasolutions.com>
 <b13635de-26ce-a8e8-e38e-13c49a99312d@samsung.com>
 <56cab7d0-d9fb-d890-0b1c-678980eafd9c@samsung.com>
 <CAMty3ZD_+m_3aj2-rXThaEDtP=m3Knfo=bmXvMPH_7LSf6N5qA@mail.gmail.com>
 <928ec100-83c0-cbfe-8005-ccf872538999@samsung.com>
 <4f9dd1bd-a5c8-c14a-fabd-bcc53406a4a9@kontron.de>
In-Reply-To: <4f9dd1bd-a5c8-c14a-fabd-bcc53406a4a9@kontron.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 15 Nov 2022 14:50:56 +0530
Message-ID: <CAMty3ZB-uxzTP0umnkhhdw1nBRYab_K+EdYheGmS_SO+v8dcBg@mail.gmail.com>
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
To: Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Matteo Lisi <matteo.lisi@engicam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 2:18 PM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 15.11.22 09:09, Marek Szyprowski wrote:
> > Hi Jagan,
> >
> > On 14.11.2022 18:07, Jagan Teki wrote:
> >> On Mon, Nov 14, 2022 at 8:10 PM Marek Szyprowski
> >> <m.szyprowski@samsung.com> wrote:
> >>> On 14.11.2022 11:57, Marek Szyprowski wrote:
> >>>> On 10.11.2022 19:38, Jagan Teki wrote:
> >>>>> Finding the right input bus format throughout the pipeline is hard
> >>>>> so add atomic_get_input_bus_fmts callback and initialize with the
> >>>>> proper input format from list of supported output formats.
> >>>>>
> >>>>> This format can be used in pipeline for negotiating bus format betw=
een
> >>>>> the DSI-end of this bridge and the other component closer to pipeli=
ne
> >>>>> components.
> >>>>>
> >>>>> List of Pixel formats are taken from,
> >>>>> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> >>>>> 3.7.4 Pixel formats
> >>>>> Table 14. DSI pixel packing formats
> >>>>>
> >>>>> v8:
> >>>>> * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI DSI/C=
SI-2
> >>>>>
> >>>>> v7, v6, v5, v4:
> >>>>> * none
> >>>>>
> >>>>> v3:
> >>>>> * include media-bus-format.h
> >>>>>
> >>>>> v2:
> >>>>> * none
> >>>>>
> >>>>> v1:
> >>>>> * new patch
> >>>>>
> >>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>>>> ---
> >>>>>    drivers/gpu/drm/bridge/samsung-dsim.c | 53 +++++++++++++++++++++=
++++++
> >>>>>    1 file changed, 53 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> index 0fe153b29e4f..33e5ae9c865f 100644
> >>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> @@ -15,6 +15,7 @@
> >>>>>    #include <linux/clk.h>
> >>>>>    #include <linux/delay.h>
> >>>>>    #include <linux/irq.h>
> >>>>> +#include <linux/media-bus-format.h>
> >>>>>    #include <linux/of_device.h>
> >>>>>    #include <linux/phy/phy.h>
> >>>>>    @@ -1321,6 +1322,57 @@ static void
> >>>>> samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
> >>>>>        pm_runtime_put_sync(dsi->dev);
> >>>>>    }
> >>>>>    +/*
> >>>>> + * This pixel output formats list referenced from,
> >>>>> + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> >>>>> + * 3.7.4 Pixel formats
> >>>>> + * Table 14. DSI pixel packing formats
> >>>>> + */
> >>>>> +static const u32 samsung_dsim_pixel_output_fmts[] =3D {
> >>>>> +    MEDIA_BUS_FMT_UYVY8_1X16,
> >>>>> +    MEDIA_BUS_FMT_RGB101010_1X30,
> >>>>> +    MEDIA_BUS_FMT_RGB121212_1X36,
> >>>>> +    MEDIA_BUS_FMT_RGB565_1X16,
> >>>>> +    MEDIA_BUS_FMT_RGB666_1X18,
> >>>>> +    MEDIA_BUS_FMT_RGB888_1X24,
> >>>>> +};
> >>>>> +
> >>>>> +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
> >>>>> +{
> >>>>> +    int i;
> >>>>> +
> >>>>> +    for (i =3D 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts); =
i++) {
> >>>>> +        if (samsung_dsim_pixel_output_fmts[i] =3D=3D fmt)
> >>>>> +            return true;
> >>>>> +    }
> >>>>> +
> >>>>> +    return false;
> >>>>> +}
> >>>>> +
> >>>>> +static u32 *
> >>>>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >>>>> +                       struct drm_bridge_state *bridge_state,
> >>>>> +                       struct drm_crtc_state *crtc_state,
> >>>>> +                       struct drm_connector_state *conn_state,
> >>>>> +                       u32 output_fmt,
> >>>>> +                       unsigned int *num_input_fmts)
> >>>>> +{
> >>>>> +    u32 *input_fmts;
> >>>>> +
> >>>>> +    if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
> >>>>> +        return NULL;
> >>>>
> >>>> Please add support for MEDIA_BUS_FMT_FIXED and maybe default to
> >>>> MEDIA_BUS_FMT_RGB888_1X24 if requested format is not matched.
> >>>>
> >>>> Otherwise the above check breaks all current clients of the Samsung
> >>>> DSIM/Exynos DSI. I didn't dig into the bus matching code yet, but al=
l
> >>>> DSI panels requests such format on my test systems...
> >>> I've checked a bit more the bus format related code and it looks that
> >>> there are more issues. The DSI panels don't use the MEDIA_BUS_FMT_*
> >>> formats thus the bridge negotiation code selects MEDIA_BUS_FMT_FIXED =
for
> >>> them. On Arndale board with Toshiba tc358764 bridge the
> >>> MEDIA_BUS_FMT_RGB888_1X7X4_SPWG output_fmt is requested in
> >>> samsung_dsim_atomic_get_input_bus_fmts() (forwarded from the LVDS pan=
el,
> >> dsim =3D> tc358764 =3D> panel-simple
> >>
> >> If I understand the bridge format negotiation correctly - If
> >> atomic_get_input_bus_fmts is not implemented in tc358764 then
> >> MEDIA_BUS_FMT_FIXED will be the output_fmt for dsim so we can assign
> >> MEDIA_BUS_FMT_RGB888_1X24 for FIXED formats.
> >>
> >> from include/drm/drm_bridge.h:
> >>
> >>           * This method is called on all elements of the bridge chain =
as part of
> >>           * the bus format negotiation process that happens in
> >>           * drm_atomic_bridge_chain_select_bus_fmts().
> >>           * This method is optional. When not implemented, the core wi=
ll bypass
> >>           * bus format negotiation on this element of the bridge witho=
ut
> >>           * failing, and the previous element in the chain will be pas=
sed
> >>           * MEDIA_BUS_FMT_FIXED as its output bus format.
> >>
> >> As I can see tc358764 is not implemented either
> >> atomic_get_input_bus_fmts or atomic API, so I think dsim gets the
> >> MEDIA_BUS_FMT_FIXED bridge pipeline. I have tested sn65dsi without
> >> atomic_get_input_bus_fmts I can see the dsim is getting
> >> MEDIA_BUS_FMT_FIXED.
> >>
> >> Can you check the same from your side?
> >
> > Here in case of Arndale 5250 with the following pipeline:
> >
> > dsim =3D> tc358764 =3D> panel-simple (boe,hv070wsa-100 panel)
> >
> > the DRM core requests MEDIA_BUS_FMT_RGB888_1X7X4_SPWG format, taken fro=
m the boe_hv070wsa panel (see from drivers/gpu/drm/panel/panel-simple.c). P=
lease note that in case of Exynos, the reversed bridge chain order is used =
for dsim, so this is another nasty consequence of that hack. :/
> >
> > Maybe if no compatible bus format is found, the driver should force
> > MEDIA_BUS_FMT_RGB888_1X24 until a proper format negotiation is
> > implemented and hacks removed?
>
> For this specific case, wouldn't it be better to just fix the format
> negotiation for tc358764 using atomic_get_input_bus_fmts()? It should
> probably do the same as sn65dsi83 and request MEDIA_BUS_FMT_RGB888_1X24
> from the DSI.
>
> Forwarding the LVDS-specific format to the input is obviously the wrong
> thing for the tc358764 driver to do.
>
> But I agree, if there are other problematic pipelines with other
> bridge/display drivers that don't pass a correct format, we should
> accept them for now and fall back to a sane default
> (MEDIA_BUS_FMT_RGB888_1X24) and fix the other drivers afterwards.
>
> Let's not delay this series any further and better work on how to get it
> merged before we miss another merge window.

Agreed this point, here is the updated diff (on top of this patch) for
falling back to the default format for those.

+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1387,6 +1387,8 @@ static const u32 samsung_dsim_pixel_output_fmts[] =3D=
 {
        MEDIA_BUS_FMT_RGB565_1X16,
        MEDIA_BUS_FMT_RGB666_1X18,
        MEDIA_BUS_FMT_RGB888_1X24,
+
+       MEDIA_BUS_FMT_FIXED,
 };

 static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
@@ -1412,7 +1414,13 @@ samsung_dsim_atomic_get_input_bus_fmts(struct
drm_bridge *bridge,
        u32 *input_fmts;

        if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
-               return NULL;
+               /*
+                * Some bridge/display drivers are still not able to pass
+                * the correct format, so handle those pipelines by falling
+                * back to the default format till the supported format lis=
t
+                * gets finalized.
+                */
+               output_fmt =3D MEDIA_BUS_FMT_RGB888_1X24;

        *num_input_fmts =3D 1;

@@ -1420,7 +1428,14 @@ samsung_dsim_atomic_get_input_bus_fmts(struct
drm_bridge *bridge,
        if (!input_fmts)
                return NULL;

-       input_fmts[0] =3D output_fmt;
+       switch (output_fmt) {
+       case MEDIA_BUS_FMT_FIXED:
+               input_fmts[0] =3D MEDIA_BUS_FMT_RGB888_1X24;
+               break;
+       default:
+               input_fmts[0] =3D output_fmt;
+               break;
+       }

        return input_fmts;

If all is okay, I will send v9 which would probably test it for the
final version to merge.

Thanks,
Jagan.
