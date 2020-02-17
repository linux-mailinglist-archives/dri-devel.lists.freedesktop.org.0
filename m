Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722FD1621CE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2A16E174;
	Tue, 18 Feb 2020 07:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::70e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF4C6E953
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 13:29:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gbphyl95ABAcB8lpJtiafjNJK2QeY6HP9Cwx8hMIdj237va+x3IIOFf01Gn8gBYJzSZaiWGTX4mOa8Iq3Nfj9ek7LDvxEx8EfJLoDsaZcp7jp2mENoK6q49brbaoUhfye3RH+HptYtfw7vs3ZrezADC0qgXR+x4ZYqVYcT4UdHH92g9hmNj7JIouhxz3XbZQa5lzElT69tZDjy/Ej7QMUZohV5I8+6XYmuoukDy/uAJLwqQ56v18tvcPlqwoU/XEhb8kthfhncb3sIpc9+g4Q+UVQzft0dCjm+d8BYhuKEcZA4yP67BB99GIaZFcp8dsJBUu2WyyIpFhDWk2oeraQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76WxWghWQ+kodCB8/Z4rzquanYfxcdid+D3N6F912I4=;
 b=cMQIwKCmWMWtfCQYXgpDv7XsvNSrhZUoyRZGqYD0fROJzaoMUycwoy2C5qNpXvS0r1EWsQXxCpvlv5AU8r32Q5cAQw76UukTMifYI8NLMrIiTadI+9E1RykJyXC+EFamDmRjJoW7KdJam07+0x8kcNtH8cCK+3acKy8enCQPGCGcacXg/F+atQ2VaACt2EiHK5InO1yTV8Ko2Dl6/LykTdRCneW8NAkw8vD3xNBF/VYOTqzazHEvBSkBDifUFF9SyTKpnJW0MCQimoMITgjGurQXnJDioBQ6HcdoJ69pjPoP+qjyHYj+oDyzD3bdeRv0Skuyt+9rltU52n2fE6Y4GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76WxWghWQ+kodCB8/Z4rzquanYfxcdid+D3N6F912I4=;
 b=Y3W7L0YE2eKDpIMhyeaszBvUZfjohubI+tpGBqbkazPqEa3mOJifVKrovACohA2W0y246gFUgfDWMk1S69DNx2efRuKhGsEw18mJ6JjBWK7lBLpaDC+r7aSj4CSLCfFIHlOyxHjpF9u5M8jDlquzGfuU5hRsBdY5/xB0n7bf/N0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 VI1PR05MB5775.eurprd05.prod.outlook.com (20.178.120.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 13:29:42 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52%7]) with mapi id 15.20.2729.031; Mon, 17 Feb 2020
 13:29:42 +0000
X-Gm-Message-State: APjAAAV4qfMMajJLYsaw4ZacEXDGCWP8lybb82LZhvfvMGtTGxxlqsG5
 TsYmaXPQdlbvmG8IUowuh5ah+YUN8mvvk5dhwCM=
X-Google-Smtp-Source: APXvYqz5k4HdT1ek5l5Ro7QkyMVSO6vE6fgVD4t3JIlvT2sHKCXsQ+zU/ruk88XR8auXacQhWspEy9nU8RsQ75futXU=
X-Received: by 2002:a37:6c5:: with SMTP id 188mr14120726qkg.277.1581946177844; 
 Mon, 17 Feb 2020 05:29:37 -0800 (PST)
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200216181513.28109-6-sam@ravnborg.org>
In-Reply-To: <20200216181513.28109-6-sam@ravnborg.org>
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Date: Mon, 17 Feb 2020 15:29:26 +0200
X-Gmail-Original-Message-ID: <CAGgjyvFdowLu4y5xbKLekjyHtxvMhorEo4y1rFPZomGMi0BwJQ@mail.gmail.com>
Message-ID: <CAGgjyvFdowLu4y5xbKLekjyHtxvMhorEo4y1rFPZomGMi0BwJQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/5] drm/panel: simple: add panel-dpi support
To: Sam Ravnborg <sam@ravnborg.org>
X-ClientProxiedBy: MN2PR15CA0024.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::37) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
MIME-Version: 1.0
Received: from mail-qk1-f181.google.com (209.85.222.181) by
 MN2PR15CA0024.namprd15.prod.outlook.com (2603:10b6:208:1b4::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.23 via Frontend
 Transport; Mon, 17 Feb 2020 13:29:41 +0000
Received: by mail-qk1-f181.google.com with SMTP id o28so14802074qkj.9 for
 <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 05:29:41 -0800 (PST)
X-Gm-Message-State: APjAAAV4qfMMajJLYsaw4ZacEXDGCWP8lybb82LZhvfvMGtTGxxlqsG5
 TsYmaXPQdlbvmG8IUowuh5ah+YUN8mvvk5dhwCM=
X-Google-Smtp-Source: APXvYqz5k4HdT1ek5l5Ro7QkyMVSO6vE6fgVD4t3JIlvT2sHKCXsQ+zU/ruk88XR8auXacQhWspEy9nU8RsQ75futXU=
X-Received: by 2002:a37:6c5:: with SMTP id 188mr14120726qkg.277.1581946177844; 
 Mon, 17 Feb 2020 05:29:37 -0800 (PST)
X-Gmail-Original-Message-ID: <CAGgjyvFdowLu4y5xbKLekjyHtxvMhorEo4y1rFPZomGMi0BwJQ@mail.gmail.com>
X-Originating-IP: [209.85.222.181]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 039e3583-d4c3-4524-222d-08d7b3ad71bc
X-MS-TrafficTypeDiagnostic: VI1PR05MB5775:
X-Microsoft-Antispam-PRVS: <VI1PR05MB5775393D425A3E59A1336EE0F9160@VI1PR05MB5775.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(396003)(346002)(39840400004)(136003)(199004)(189003)(55446002)(9686003)(6666004)(66556008)(478600001)(966005)(66946007)(86362001)(107886003)(52116002)(186003)(81166006)(53546011)(6862004)(26005)(4326008)(5660300002)(44832011)(66476007)(316002)(8676002)(81156014)(54906003)(8936002)(2906002)(42186006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB5775;
 H:VI1PR05MB3279.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SrdzaZnvAZC+Zr+ts7o1N8PXhRZMI8lwSku17md2W+cReF2pyI5wkEwR3HGjOSHBma3URS49CHaIB6t/SVUZWMpz0UVbFuh7dFmRzDa/tsPYwdAjaZuro/VNu6jtpNPF6R/6ObwNW/svzNv/2RrfEVlLrpCImNeHuMGaA69TgxsRYI6GcvA5gJ0HCkMsNfLiM/sr4ZvPiKLFddhphCuvch21kpq86uvhz1ifGrnVSrTRXAcP88+yDHu7rxynwpMCDfMkWniSxde1oiwAXiKCaJO3k9r+gg3luj4S8fF2YR9BT3Ch/fT25WstuHSgCDnWQe7AuZy3Zxni9hqU/GcCEceEpTHx4AMC7UP9i/L+3n60BxcpCPnCOYQ4ZXJIkoSgQTXZBvlxIaOk0Q7AdwHcg9cpXPwgaBNlcF2dmG+x29sx+SRBbe2cCtO85mhd/ZMX7BFN6KowM0GdxnHMktlWQD25xLX4iWgat4XnmDWxgCtFidztibigq0AMJyZP8ktlCdJ5YNW/UUdlxiHLbKqEoQ==
X-MS-Exchange-AntiSpam-MessageData: JNw1w1gjre18kRqnEEco4nkLU2ulYxScPcSgVFsr4zNSSKp5eRW2RObpefI3tjljpZ3EyLkWNtwuBx+VVe4F4S2TpLhfmYjj6+G0kRKnWuSWuMGWikFbwjJEg/JQ6sEVF1d6FmCnkgXaAhUR9bsgvg==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 039e3583-d4c3-4524-222d-08d7b3ad71bc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 13:29:41.6522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXhvZbSOVqCP1ppnx/EKxXoB/cWwGsSnSXFXaOfBHfvvi8InEjmBc4csH6IDEvuAPYXrb6R6Q/UzN7AmZRq3FlHbPhRO5xhx/HHIJAKGdAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5775
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:55:25 +0000
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 16, 2020 at 8:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> RFC only - not tested yet!

I've just tested this patch on Apalis iMX6Q and Colibri iMX7D using
panel settings from the following patch:
https://lore.kernel.org/linux-arm-kernel/20200115123401.2264293-4-oleksandr.suvorov@toradex.com/

It works for me, thanks!

Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

>
> The panel-dpi compatible is a fallback that
> allows the DT to specify the timing.
>
> When matching panel-dpi expect the device tree to include the
> timing information for the display-panel.
>
> Background for this change:
> There are a lot of panels and new models hits the market very often.
> It is a lost cause trying to chase them all and users of new panels
> will often find them in situations that the panel they ues are not
> supported by the kernel.
> On top of this a lot of panels are customized based on customer
> specifications.
>
> Including the panel timing in the device tree allows for a simple
> way to describe the actual HW and use this description in a generic
> way in the kernel.
> This allows uses of proprietary panels, or panels which are not
> included in the kernel, to specify the timing in the device tree
> together with all the other HW descriptions.
> And thus, using the device tree it is then easy to add support
> for an otherwise unknown panel.
>
> The current support expect panels that do not require any
> delays for prepare/enable/disable/unprepare.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 74 +++++++++++++++++++++++++++-
>  1 file changed, 72 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 82363d05bad4..188526637398 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -351,6 +351,65 @@ static const struct drm_panel_funcs panel_simple_funcs = {
>         .get_timings = panel_simple_get_timings,
>  };
>
> +static struct panel_desc panel_dpi;
> +
> +static int panel_dpi_probe(struct device *dev,
> +                          struct panel_simple *panel)
> +{
> +       struct display_timing *timing;
> +       const struct device_node *np;
> +       struct panel_desc *desc;
> +       unsigned int bus_flags;
> +       struct videomode vm;
> +       const char *mapping;
> +       int ret;
> +
> +       np = dev->of_node;
> +       desc = devm_kzalloc(dev, sizeof(*desc), GFP_KERNEL);
> +       if (!desc)
> +               return -ENOMEM;
> +
> +       timing = devm_kzalloc(dev, sizeof(*timing), GFP_KERNEL);
> +       if (!timing)
> +               return -ENOMEM;
> +
> +       ret = of_get_display_timing(np, "panel-timing", timing);
> +       if (ret < 0) {
> +               dev_err(dev, "%pOF: no panel-timing node found for \"panel-dpi\" binding\n",
> +                       np);
> +               return ret;
> +       }
> +
> +       desc->timings = timing;
> +       desc->num_timings = 1;
> +
> +       of_property_read_u32(np, "width-mm", &desc->size.width);
> +       of_property_read_u32(np, "height-mm", &desc->size.height);
> +
> +       of_property_read_string(np, "data-mapping", &mapping);
> +       if (!strcmp(mapping, "rgb24"))
> +               desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +       else if (!strcmp(mapping, "rgb565"))
> +               desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> +       else if (!strcmp(mapping, "bgr666"))
> +               desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> +       else if (!strcmp(mapping, "lvds666"))
> +               desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> +
> +       /* Extract bus_flags from display_timing */
> +       bus_flags = 0;
> +       vm.flags = timing->flags;
> +       drm_bus_flags_from_videomode(&vm, &bus_flags);
> +       desc->bus_flags = bus_flags;
> +
> +       /* We do not know the connector for the DT node, so guess it */
> +       desc->connector_type = DRM_MODE_CONNECTOR_DPI;
> +
> +       panel->desc = desc;
> +
> +       return 0;
> +}
> +
>  #define PANEL_SIMPLE_BOUNDS_CHECK(to_check, bounds, field) \
>         (to_check->field.typ >= bounds->field.min && \
>          to_check->field.typ <= bounds->field.max)
> @@ -437,8 +496,15 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>                         return -EPROBE_DEFER;
>         }
>
> -       if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
> -               panel_simple_parse_panel_timing_node(dev, panel, &dt);
> +       if (desc == &panel_dpi) {
> +               /* Handle the generic panel-dpi binding */
> +               err = panel_dpi_probe(dev, panel);
> +               if (err)
> +                       goto free_ddc;
> +       } else {
> +               if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
> +                       panel_simple_parse_panel_timing_node(dev, panel, &dt);
> +       }
>
>         drm_panel_init(&panel->base, dev, &panel_simple_funcs,
>                        desc->connector_type);
> @@ -3688,6 +3754,10 @@ static const struct of_device_id platform_of_match[] = {
>         }, {
>                 .compatible = "winstar,wf35ltiacd",
>                 .data = &winstar_wf35ltiacd,
> +       }, {
> +               /* Must be the last entry */
> +               .compatible = "panel-dpi",
> +               .data = &panel_dpi,
>         }, {
>                 /* sentinel */
>         }
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--
Best regards
Oleksandr Suvorov

Toradex AG
Altsagenstrasse 5 | 6048 Horw/Luzern | Switzerland | T: +41 41 500
4800 (main line)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
