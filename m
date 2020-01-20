Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C34143091
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 18:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4977D6EA28;
	Mon, 20 Jan 2020 17:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6D76E884
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 09:59:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkoFKrTogMWxy0Lk2yo7zzyYfmH3F861Q5o8eKTDhYtC+QhcmWOwWDd0uvn12gNo3DIr+LlXYAkg/fIoJNuqZdem2GnRMugk09cUfoKT0LB3VGGXTUq759NxjoqhjiMbAi16GEQuUKYrF9jRzPdwdoo14JM2Hv5YT4iKe6RIEJtdmF19VvQBbSvnj3wnQ0NJhULCGj61DZqGUeNRrDORcwA921UVuQt8SwyPBAK189mYHP7Gt545UZthK/ty0NvaSB8rHTN+H5xa4UPzVKg8F/d1StuxpVEzWqKZht1HNBLxFUB0cOsh0d6AUMA5HKDzcxb04eyBDQALqclW72nZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ssr32v6LCTK3JIU9ynN3fRim3VjdRpU7xkb5zM7VyjY=;
 b=O9rmq9mjmBS7IrCnJD4Avbl6zU9+mlfmymYD+x5ts/5Yqa8Ksz8Ac0rAZfVprtIMfQkjT8qjQCmJFm8qwm+YfF2vx+4N/gEQv0vh6hM4JhE3WCxe8AVf9GbPDfCG/Ob5V8DCNhIbTIK4Md20Hq7Qognfi9ch9g9qF2JR/Nm/Er9OFXmJoFVvF/Du2UpyyRqgmQ6I9ZeYt7SO6jkD8wUFy+2rY7Z812iqAMxFDKKFpQX3iZ7rxyst2LCBfCqIlWr63XGWSqJtTsq1h8RsYqDzESnkXje1fCScFAEftmk0amzCVj9ANJJ0dLgeL9MknvUTD1tR9WepO1RPGpISCoIRQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ssr32v6LCTK3JIU9ynN3fRim3VjdRpU7xkb5zM7VyjY=;
 b=dHjbUSHenfx6O+TuW3jpKUrf6Bkpmk5BfLkXdm2LnxVQgN8GfDpbKdbzp67QC+tV3vVMYYtdPkW31o3RLGPxKK/MDAMr4zRq6WAUMyMD2/AKyT0diqh1aDtON3EsbLOpW66QPNNgplWf/4s8CMu3osGYKRQIOoB355LOtcDUej0=
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 VI1PR05MB4383.eurprd05.prod.outlook.com (52.133.14.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.25; Mon, 20 Jan 2020 09:57:19 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52%7]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 09:57:19 +0000
Received: from mail-qv1-f50.google.com (209.85.219.50) by
 BL0PR02CA0022.namprd02.prod.outlook.com (2603:10b6:207:3c::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23 via Frontend Transport; Mon, 20 Jan 2020 09:57:17 +0000
Received: by mail-qv1-f50.google.com with SMTP id l14so13709949qvu.12 for
 <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 01:57:17 -0800 (PST)
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/3] drm/panel: make LVDS panel driver DPI capable
Thread-Topic: [PATCH 1/3] drm/panel: make LVDS panel driver DPI capable
Thread-Index: AQHVy6AaSAxSVrzF8Em1sZu2z5QUEqfwaFUAgALwVwA=
Date: Mon, 20 Jan 2020 09:57:17 +0000
Message-ID: <CAGgjyvHVg9OBWqpBd9k1hf561VjFQwh3o9QUFcy1A=_KNnK2Gg@mail.gmail.com>
References: <20200115123401.2264293-1-oleksandr.suvorov@toradex.com>
 <20200115123401.2264293-2-oleksandr.suvorov@toradex.com>
 <20200118130418.GA13417@ravnborg.org>
In-Reply-To: <20200118130418.GA13417@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:207:3c::35) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAWDIfBEAIFFPkeLARVBZR1mo2WIXAYKnJJQvMvEDfPAnA8Nr4NF
 oP5VNMtHy0TLyxh18IayHk7RLEqeTex8KkqalFc=
x-google-smtp-source: APXvYqx2o8Lt8nu/EioDnGjd8lcoS/06Zua8BfW+k3MuK6WuhLmFV+oXJs4g/YNYy3olQ9F8M+HdORYmNZ3gI3iAv/s=
x-received: by 2002:a0c:c389:: with SMTP id o9mr20107719qvi.232.1579514233336; 
 Mon, 20 Jan 2020 01:57:13 -0800 (PST)
x-gmail-original-message-id: <CAGgjyvHVg9OBWqpBd9k1hf561VjFQwh3o9QUFcy1A=_KNnK2Gg@mail.gmail.com>
x-originating-ip: [209.85.219.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad715d70-c8ab-431c-7caf-08d79d8f2227
x-ms-traffictypediagnostic: VI1PR05MB4383:
x-microsoft-antispam-prvs: <VI1PR05MB43835EEDBF4C49801C691B4CF9320@VI1PR05MB4383.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(376002)(346002)(39840400004)(199004)(189003)(6862004)(66946007)(478600001)(66476007)(64756008)(9686003)(71200400001)(66446008)(186003)(4326008)(26005)(66556008)(81166006)(86362001)(81156014)(8936002)(44832011)(8676002)(52116002)(54906003)(42186006)(55446002)(55236004)(316002)(53546011)(5660300002)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB4383;
 H:VI1PR05MB3279.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K21jP61xzQ+OGYFwfys7oP6XBYQ9HBzIjUW9I7vtaYOJWx6lQQWc3Qs9OONUSoKdVtJgiTYhqAo+x39Ff1ZuhCBhujfRrHjUFZUECzZY0GMPt4LCq0ejbKlszSyeS8tLKLGAoKwRbRwlBgIcHI0KSHox4KT4wdn3/o7T7CC2PEgBWwHm91PH01NZ/WtRNUuTBh5bjhpU61W77Yw3drS8JgcuFFS5QXfiXkMjnYw3aJyVpt4hJhVIckNv1idW284id22lCYYN18OFesO8kPV+bTkPHc/hiP7o7EeCW0X9vayh4aDQlEWq0SA+dfKzRFeooMhzItiGo7/T/WKFnHAqkUfQUhTq3JrARXOoAt3fU82f4e2hNKl5i5jhXqbTVf83jwTBtNpjXcqGpOhGbxf+AOGQYD2tlTL0UyU5b7wYIi6FeZ1xS0nZn1tKCkqAC748
x-ms-exchange-transport-forked: True
Content-ID: <6082D58B16250D41974F5985C4BFCD58@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad715d70-c8ab-431c-7caf-08d79d8f2227
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 09:57:17.7790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xg9Yw7zAYhk9nBrlzmsEzfJOYBymWlXDdKRG5pMMIx+kJb4DjRtVEPz1UiBOYQhlvGSlO88omEvWtaZXvbHJlj2+eQwZJiaYimc69bFzFfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4383
X-Mailman-Approved-At: Mon, 20 Jan 2020 17:09:27 +0000
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
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 David Airlie <airlied@linux.ie>, Igor Opanyuk <igor.opanyuk@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sat, Jan 18, 2020 at 3:04 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > The LVDS panel driver has almost everything which is required to
> > describe a simple parallel RGB panel (also known as DPI, Display
> > Pixel Interface).
> >
> > ---
>
> There are a few high-level things we need to have sorted out.
>
> The driver, when this patch is added, assumes that certain properties
> are now mandatory when using the panel-dpi compatible.
>   - data-mapping
>   - width-mm
>   - height-mm
>   - panel-timing
>
> But this does not match the panel-dpi binding.
> So we need the panel-dpi binding updated first.
>
>
> The current driver specify the connector type in drm_panel_init().
> But a DPI panel is assumed to use a DRM_MODE_CONNECTOR_DPI,
> and not a DRM_MODE_CONNECTOR_LVDS.
> So the drm_panel_init() call needs to take into account the type
> of binding.
>
Thanks, I'll fix it in 2nd version.
>
> > @@ -257,7 +279,7 @@ static struct platform_driver panel_lvds_driver = {
> >       .probe          = panel_lvds_probe,
> >       .remove         = panel_lvds_remove,
> >       .driver         = {
> > -             .name   = "panel-lvds",
> > +             .name   = "panel-generic",
>
> I think changing the name of the driver like this is an UAPI change,
> which is not OK

I see 2 simple ways there:
- keep the original platform driver name;
- fork panel-lvds driver as panel-generic driver with dpi support.

What solution do you prefer?

> >               .of_match_table = panel_lvds_of_table,
> >       },
> >  };
>
>         Sam

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
