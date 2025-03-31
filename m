Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379F5A75E9B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 07:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCD610E102;
	Mon, 31 Mar 2025 05:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="k+ljn2h/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11023085.outbound.protection.outlook.com
 [40.107.201.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C19410E102
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 05:45:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4GXZ6uAJasbfTCpmnIXchklrs//daa6W0pIXScs07l5NtIaqymWY+1gg5l9VuMMi1ifDjRyqVlp6fWUVyfcNAOG8LztSGN3pPNGqe0Xw46+oveG0nwGNwouqoJmMS/HCBolR7gdpXV57a4DmDyWV3DidI6qvGt/Oyo2YirUJxF4BUt97mtMIfRHQL4AUtUy2iYZiaIhoWKDrPUb5QcIvPpyndDy51Lg6YFe3uLuIDEOfvD5gxUVT6G5MASwuyLl5ExDaevbI64rGtXSB6uu4Q/vLRBA21z0ve+ntG7Sqe2J+DVJb66DZNgc8v5LmVVMTTZMNRcKHQ9LFP3FPrYfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wlq82YvG35HOqickmhJ0SKPztmlBkJzfpe/9JBsdcAk=;
 b=qCTzbWRpIxLzL1/zl90BYlyA68aifrquxSGvxd/tj2Gw3OB481xX88jty3LXlUio9Q6PR71Bvg1S/pbPl+2B2ogzMKxq9CVbBjv+C/nswxfLr4Vpaxof6ayIwZkgv6W7vgwVxXZs3hAANbytMDz/H3Tdokv46G1saSXYCwZdcwUMhjrB5FRXm5BGSU3EBTvbq8rGgzjcvNpq9J6yydYAUbXBNWfmbQP12BL72VMlVeIh8RPwVVhL7EucBH5m8WrNpzv/MU3EI7dEjMWb+KLrppdaNa3tnN3d+4ffY9zlEvSvs9TLtq8lhuBt3LrpkBPnrvq2sdUH7G2NN2zaBhBtCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wlq82YvG35HOqickmhJ0SKPztmlBkJzfpe/9JBsdcAk=;
 b=k+ljn2h/M49Q3TgzB3ec45wc+GqJTbbbXZJMTVmASuszJ6OwlggMyenDFI4ZSxWNeXyQ0+FWWfYH27to7CGgpRnPLLEdhFN++2TMDs0MQ2l2pIa+ilGXBr4YDejFPe1fW3nrYcQXpabet90Fu6UsF1vUxV6QINRpql/iEj0WEUQ=
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB8421.namprd04.prod.outlook.com (2603:10b6:a03:3d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 05:44:59 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%5]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 05:44:58 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bernie Liang <bliang@analogixsemi.com>,
 Qilin Wen <qwen@analogixsemi.com>, "treapking@chromium.org"
 <treapking@chromium.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] drm/bridge:anx7625: Enable DSC feature
Thread-Topic: [PATCH v2] drm/bridge:anx7625: Enable DSC feature
Thread-Index: AQHbnw9SQTT4hmIf/0SCVgI7dUd8+LOL9jcAgADH4BA=
Date: Mon, 31 Mar 2025 05:44:58 +0000
Message-ID: <BY5PR04MB6739BEDCE701FBC346106E21C7AD2@BY5PR04MB6739.namprd04.prod.outlook.com>
References: <20250327115616.1271635-1-xji@analogixsemi.com>
 <gs2pn7o33hjzfpljzjprorof3xehhui5mvsrbnnpu4gwyncw5u@zvlez4dpgv3f>
In-Reply-To: <gs2pn7o33hjzfpljzjprorof3xehhui5mvsrbnnpu4gwyncw5u@zvlez4dpgv3f>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB6739:EE_|SJ0PR04MB8421:EE_
x-ms-office365-filtering-correlation-id: 0de6de99-ef8d-470f-b427-08dd70172c26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?shEbilQj6iQGYxQUUc4T21YN4V1S3oNfmJb/5mclyMEViqAKk0zINIH6rM8H?=
 =?us-ascii?Q?924LMNTKJF/ZcIYl5XtLyr1I56KAXW2MBNhSmvmeyFx6d2g3GxM5hr8ZHTGF?=
 =?us-ascii?Q?+tNylRHeX6bkXlyiQetnBSejXifol4vKgzArcUOFulcXFhlJBrvMy30Lscgg?=
 =?us-ascii?Q?WPZH2VN3FwjjSpEpousHMjyFz29jGAxQyW2Q9/l6CTIl2/gpGRZ8U0mU70+r?=
 =?us-ascii?Q?ylIecr5xPGfqFo+qtQN5D0UW9jfDxEjW05spO3ztAxvrV3kMOIxbSvXJF7C/?=
 =?us-ascii?Q?TjB7u0jm6AtdZvJz70YrGgdWq4pBUunDWa8aoRboVtTr5zBvI2Oflqekcxtg?=
 =?us-ascii?Q?i45LXj5g9lv/yur90k2EqYQy6XaygbDaLxd4b/yZS0kVK2DuFhZuZIUo1Qtm?=
 =?us-ascii?Q?LGgRXB5X8IMy2yaasoraPRAxfHLSK3mFdyAHRSQKPxKaexbsQApBE5C46tIm?=
 =?us-ascii?Q?GM8O+uPTfwgtdd0c+L89HIt4ackLLhgfXsD2JuqdnqMapPpagONRMdqz5igD?=
 =?us-ascii?Q?FlXGJzaDWa+H7OsVriiMwWZ/FWMEwBDWc5cnYcNEBqHKJRMl3i36Ta5Vdhfb?=
 =?us-ascii?Q?ihvsdXiFb71OGyT0cyoivXhTbNVY0DccoczYEOUn87qvEExvH0C4HEzw0U3y?=
 =?us-ascii?Q?4lWF8HPTmxK0WxXBjMeb7HyYwAh5O7Rrt2XfWmCoLuXiBf9PHXwLQZ1stWbe?=
 =?us-ascii?Q?G1kVz8HRYa3fBIJfy3u57QO51OePcQ2P2wGiOa/b2ThUzK+Mz2Rs+k6mrXFB?=
 =?us-ascii?Q?Ivuj2oYoylOtsBBIeo8tJN4URbbEMyY/q6HWuXWpK34luHj3elgij5ZrUqvn?=
 =?us-ascii?Q?TFevG5JEM94o0Mff1Y7+RU4iiQn7TIQG80z5ybHy+e+rZ9/Ztb0PXnecbjtr?=
 =?us-ascii?Q?5zas1HgqJcFelib4Fca1DuT24W8VojPTcU4y6vVrVjBvmFnxrJoCnC8FSmrc?=
 =?us-ascii?Q?6rzYU2KSPmz5w839jbqve4LBYdvRCsy4610yYI+XdSXdoeXTCpNEEtKwzYvN?=
 =?us-ascii?Q?Bm3Bs2WTPXuhodnlyGhnwdI80aYB9sUbTJijrSREF2xkQWxpCqqAIiFsgdvQ?=
 =?us-ascii?Q?I+EO7qD0ngHyHfHbM6Rx95f4GuQkHuZBrvBEb6HMJ5bDqreBpqzgdGwOk3yI?=
 =?us-ascii?Q?Nq9D0y4OmXFaKzM1s831yKKAfC8BNUGa8BTstJhEOUoV6MNqIZvPDpzhA/Nr?=
 =?us-ascii?Q?Z7tedp0wBCwwXZ0nuYchdHsfHWUmIWRm7cVNEoAm6ENz/qcsz7e2ZO8L1Znj?=
 =?us-ascii?Q?6/y06DgM7w2RyeDnFCDbZJQbtLRvJmU7OlbyrKfW5IHRp5fQ8EjT1WuIzUpp?=
 =?us-ascii?Q?yvJE/6+okWfkHG+oVxeShM3h/eiZlBNWh+PvD/XefNX7E/0/zlgruwceIfzP?=
 =?us-ascii?Q?0HEJLYHbbbxi+8TGojVaE7VQks5dH4ma3GosJxoL7dhrEDbqsaeGPUJLV/en?=
 =?us-ascii?Q?kgqTqNGZHNd+rzpYs2KnR2zKEb+x5zy7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6LJOYroAnWttJAy8HRdIMa4HtNBPFRy616QE/tKFCeMX/I7lxbeliV3JXc5Z?=
 =?us-ascii?Q?lobqOAlnZxZnswYTZEY8O6YKIyM9Y9p0yHDNKZ+WDZ1VTdXBk8q4GSVKO0f5?=
 =?us-ascii?Q?k9VzIjZuPYzuEWkZ3Q4+wcMM1I+fYEn4DtajTIHnrGjVJHGVQUr1vL9AH9q+?=
 =?us-ascii?Q?otvQMKgHY/nbQuvOMxrLP+2mtIrX4FGY+dsr8t8+7+vcrZrluBNNJlUzewn0?=
 =?us-ascii?Q?kCqrLVKE/xdZpynV47tPXFJdSi7kIT4PncbX7+aMSaSAofo2J6XgnKhI9bJT?=
 =?us-ascii?Q?d09o2RAQe9l8L8OjnMUqXnV4vERATm0FWejHdh4XSRRrLjsKsF4t3URC9pTk?=
 =?us-ascii?Q?e1CZAtfjxV7LqtakHP7V+RBqTTgORU2sXbH1C0yFXJ3JcV03p9YNmpR520BM?=
 =?us-ascii?Q?FSVX0Tfxf9YFm7udtIModQ9fGGx8XEZW2Fm76whplFNnlWK5YkwgaJlT0O+t?=
 =?us-ascii?Q?pKN2KlXb6EJb/FbPifIpnQBxdF+antLfTzDMqP5l3k2YH7ORfvD9TKuKVKcQ?=
 =?us-ascii?Q?35sMMuE3wZ2q6VQSAO4JjOTgRM2+jPpLV9BKxtCHa9hxUXh+NUoXgxpG4NN8?=
 =?us-ascii?Q?nSFLjlSKyAE8l5d3M9kxQIz/FT+58VX47fQFmCTiLrwGr6xTWyG7hAiVsr9k?=
 =?us-ascii?Q?VvBcdI5bglP02S/+YeQDq5FM1oJeJGJX+n3vBxDhiHxzDfycp1Kw3o+ySoMn?=
 =?us-ascii?Q?BE22Os7u9ZOId033PbocBSZLHlh9wkyjavJ/AtHWBbBN9njkfn/kTbulvmZ1?=
 =?us-ascii?Q?lyViHL3zBNAIoobNTrRyIl7si5uEk52T1rw7mdqKaw8awxuQ8jmZNgodQ5od?=
 =?us-ascii?Q?JBV+oavpGoplj5uctW+WHTHA3+7i205q0T86E7qEDM9MRYdfGSMxg5M/V2gA?=
 =?us-ascii?Q?iP8+obDDkfYtbVzetTGw8pJ+kC2WGv+RFqPT8lL6aEkdMpN9p1A6r2PY3fwd?=
 =?us-ascii?Q?izvQSf0AqWLFdlOUGY+nWWNamhw97P8Itm31lwMwmdU/A9UE+caKaxrMTMqV?=
 =?us-ascii?Q?mL6AqdrhXoKWZVN1K7kReERSSlkZmPmb2tL7p3HNsFY1/hBAC7OX2IyPGkz8?=
 =?us-ascii?Q?br2SolijlhhndINma3H7rhnrrh0iRQ/nT6ms0oZCPpJQ8BSExocrYTZVlb5P?=
 =?us-ascii?Q?g7xTJmCosgjESlpkLtJDFWYk/xj35Z0eL7bXCX2lnTR0JWegpQhQuj8RgSfn?=
 =?us-ascii?Q?mOG0vczyjOyKWhy7w/pTUGiBnNuwPs+xivG9cQ4+MzUDKrl8mR12sqRgUC+G?=
 =?us-ascii?Q?bk5hcZSwLIvUKXRaihwTgrV07ISa3EO803eTmvmYePBrz3d3Ko4yZipczlqt?=
 =?us-ascii?Q?vhLEU+HbyhvMt+OX/qbk2zcNNnrrh89q4zIWbewnUBFWAJm9tOOB7aPgw4n0?=
 =?us-ascii?Q?Nqcfiu+f6r4u6KK5rt1xDH4xq1SvaJHDLJ6bFFBiUiU7SWE6DpOVnZ7wXBpu?=
 =?us-ascii?Q?CJGpEOzQeSmiI2om97oH+Ss9XS5eQ0QxOkAy5gOIdDhuLpW6wRx8ncXUT9E4?=
 =?us-ascii?Q?f+h1Vmz1X2HJt/eWGJWzxnnurjhEzzVFT5mK6Qw/dGsPASrRcCJWd/pRqbKD?=
 =?us-ascii?Q?9ebl+X37JV+yBPnl/itdqCXT3X+Yy95MPlehsBoq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de6de99-ef8d-470f-b427-08dd70172c26
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 05:44:58.3132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kgTObqosms5gVso+KqNdAb/GsDLhcu3IzpM3pDSaStF5dmNnqHnQgAjGMwdDx6LKkoLr2zUmb9xIk5dDwbSkUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8421
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

> > 4K30(3840x2160 30Hz) timing pixel clock around 297M, for 24bits RGB
> > pixel data format, total transport bandwidth need 297M*24(at least
> > 7.2Gbps) more than anx7625 mipi rx lane bandwidth(maximum 6Gbps,
> > 4lanes, each lane 1.5Gbps). Without DSC function, anx7625 cannot
> > receive 4K30 video timing.
> >
> > When display pixel clock exceed 250M, driver will enable DSC feature,
> > and the compression ratio is 3:1, eg: 4K30's pixel clock around 297M,
> > bandwidth 7.2G will be compressed to 7.2G/3 =3D 2.4G. Then anx7625 can
> > receive 4K30 video timing and do decompress, then package video data
> > and send to sink device through DP link.
> >
> > Anx7625 is bridge IC, sink monitor only receive normal DP signal from
> > anx7625, sink device didn't know DSC information between SOC and
> > anx7625
> >
> > v2:
> > 1. Add more commit message
> > 2. Remove unused code
> > 3. Add more comment
>=20
> This part is useless, it adds no information. It is as good as 'changed i=
t'.
OK, I'll remove it
>=20
> > 4. Remove dsc_en flag
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 299
> > ++++++++++++++++++----  drivers/gpu/drm/bridge/analogix/anx7625.h |
> > 31 +++
> >  2 files changed, 274 insertions(+), 56 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 4be34d5c7a3b..bae76d9a665f 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/iopoll.h>
> >  #include <linux/kernel.h>
> > +#include <linux/math64.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> >  #include <linux/pm_runtime.h>
> > @@ -22,6 +23,7 @@
> >
> >  #include <drm/display/drm_dp_aux_bus.h>  #include
> > <drm/display/drm_dp_helper.h>
> > +#include <drm/display/drm_dsc_helper.h>
> >  #include <drm/display/drm_hdcp_helper.h>  #include
> > <drm/drm_atomic_helper.h>  #include <drm/drm_bridge.h> @@ -476,11
> > +478,159 @@ static int anx7625_set_k_value(struct anx7625_data *ctx)
> >                                MIPI_DIGITAL_ADJ_1, 0x3D);  }
> >
> > +static bool anx7625_dsc_check(struct anx7625_data *ctx) {
> > +     if (ctx->dt.pixelclock.min > DSC_PIXEL_CLOCK)
> > +             return true;
>=20
> So, now DSC is enabled unconditionally just because the clock is too high=
. Let's
> see...
Yes
>=20
> > +
> > +     return false;
> > +}
> > +
> > +static inline int anx7625_h_timing_reg_write(struct anx7625_data *ctx,
> > +                                          struct i2c_client *client,
> > +                                          u8 reg_addr, u16 val,
> > +                                          bool dsc_check) {
> > +     int ret;
> > +
> > +     if (dsc_check && anx7625_dsc_check(ctx))
> > +             val =3D dsc_div(val);
> > +
> > +     ret =3D anx7625_reg_write(ctx, client, reg_addr, val);
> > +     ret |=3D anx7625_reg_write(ctx, client, reg_addr + 1, val >> 8);
> > +
> > +     return ret;
> > +}
> > +
> > +static int anx7625_h_timing_write(struct anx7625_data *ctx,
> > +                               struct i2c_client *client,
> > +                               bool rx_h_timing) {
> > +     u16 htotal;
> > +     int ret;
> > +
> > +     htotal =3D ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > +                      ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> > +     /* Htotal */
> > +     ret =3D anx7625_h_timing_reg_write(ctx, client,
> HORIZONTAL_TOTAL_PIXELS_L,
> > +                                      htotal, rx_h_timing);
> > +     /* Hactive */
> > +     ret |=3D anx7625_h_timing_reg_write(ctx, client,
> HORIZONTAL_ACTIVE_PIXELS_L,
> > +                                       ctx->dt.hactive.min, rx_h_timin=
g);
> > +     /* HFP */
> > +     ret |=3D anx7625_h_timing_reg_write(ctx, client,
> HORIZONTAL_FRONT_PORCH_L,
> > +                                       ctx->dt.hfront_porch.min, rx_h_=
timing);
> > +     /* HWS */
> > +     ret |=3D anx7625_h_timing_reg_write(ctx, client,
> HORIZONTAL_SYNC_WIDTH_L,
> > +                                       ctx->dt.hsync_len.min, rx_h_tim=
ing);
> > +     /* HBP */
> > +     ret |=3D anx7625_h_timing_reg_write(ctx, client,
> HORIZONTAL_BACK_PORCH_L,
> > +                                       ctx->dt.hback_porch.min,
> > + rx_h_timing);
> > +
> > +     return ret;
> > +}
> > +
> > +static int anx7625_v_timing_write(struct anx7625_data *ctx,
> > +                               struct i2c_client *client) {
> > +     int ret;
> > +
> > +     /* Vactive */
> > +     ret =3D anx7625_reg_write(ctx, client, ACTIVE_LINES_L,
> > +                             ctx->dt.vactive.min);
> > +     ret |=3D anx7625_reg_write(ctx, client, ACTIVE_LINES_H,
> > +                              ctx->dt.vactive.min >> 8);
> > +     /* VFP */
> > +     ret |=3D anx7625_reg_write(ctx, client, VERTICAL_FRONT_PORCH,
> > +                              ctx->dt.vfront_porch.min);
> > +     /* VWS */
> > +     ret |=3D anx7625_reg_write(ctx, client, VERTICAL_SYNC_WIDTH,
> > +                              ctx->dt.vsync_len.min);
> > +     /* VBP */
> > +     ret |=3D anx7625_reg_write(ctx, client, VERTICAL_BACK_PORCH,
> > +                              ctx->dt.vback_porch.min);
> > +
> > +     return ret;
> > +}
> > +
> > +static int anx7625_set_dsc_params(struct anx7625_data *ctx) {
> > +     int ret, i;
> > +     u16 htotal, vtotal;
> > +
> > +     if (!anx7625_dsc_check(ctx))
> > +             return 0;
> > +
> > +     /* Video Horizontal timing */
> > +     ret =3D anx7625_h_timing_write(ctx, ctx->i2c.tx_p2_client, false)=
;
> > +
> > +     /* Video Vertical timing */
> > +     ret |=3D anx7625_v_timing_write(ctx, ctx->i2c.tx_p2_client);
> > +
> > +     /* Vtotal */
> > +     vtotal =3D ctx->dt.vactive.min + ctx->dt.vfront_porch.min +
> > +              ctx->dt.vback_porch.min + ctx->dt.vsync_len.min;
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINE=
S_L,
> > +                              vtotal);
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_LINE=
S_H,
> > +                              vtotal >> 8);
> > +     /* Htotal */
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXE=
L_L_7E,
> > +                              htotal);
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, TOTAL_PIXE=
L_H_7E,
> > +                              htotal >> 8);
> > +     /* Hactive */
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                              ACTIVE_PIXEL_L_7E, ctx->dt.hactive.min);
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                              ACTIVE_PIXEL_H_7E, ctx->dt.hactive.min >=
> 8);
> > +     /* HFP */
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                              HORIZON_FRONT_PORCH_L_7E,
> > +                              ctx->dt.hfront_porch.min);
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                              HORIZON_FRONT_PORCH_H_7E,
> > +                              ctx->dt.hfront_porch.min >> 8);
> > +     /* HWS */
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                              HORIZON_SYNC_WIDTH_L_7E,
> > +                              ctx->dt.hsync_len.min);
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                              HORIZON_SYNC_WIDTH_H_7E,
> > +                              ctx->dt.hsync_len.min >> 8);
> > +     /* HBP */
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                              HORIZON_BACK_PORCH_L_7E,
> > +                              ctx->dt.hback_porch.min);
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                              HORIZON_BACK_PORCH_H_7E,
> > +                              ctx->dt.hback_porch.min >> 8);
> > +
> > +     /* Config DSC decoder internal blank timing for decoder to start =
*/
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +                              H_BLANK_L,
> > +                              dsc_div(htotal - ctx->dt.hactive.min));
> > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +                              H_BLANK_H,
> > +                              dsc_div(htotal - ctx->dt.hactive.min)
> > + >> 8);
> > +
> > +     /* Compress ratio  RATIO bit[7:6] */
> > +     ret |=3D anx7625_write_and(ctx, ctx->i2c.rx_p0_client, R_I2C_1, 0=
x3F);
> > +     ret |=3D anx7625_write_or(ctx, ctx->i2c.rx_p0_client, R_I2C_1,
> > +                             (5 - DSC_COMPRESS_RATIO) << 6);
> > +     /*PPS table*/
> > +     for (i =3D 0; i < PPS_SIZE; i +=3D PPS_BLOCK_SIZE)
> > +             ret |=3D anx7625_reg_block_write(ctx, ctx->i2c.rx_p2_clie=
nt,
> > +                                            R_PPS_REG_0 + i, PPS_BLOCK=
_SIZE,
> > +                                            &ctx->pps_table[i]);
> > +
> > +     return ret;
> > +}
> > +
> >  static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
> > {
> >       struct device *dev =3D ctx->dev;
> >       unsigned long m, n;
> > -     u16 htotal;
> >       int ret;
> >       u8 post_divider =3D 0;
> >
> > @@ -506,48 +656,12 @@ static int anx7625_dsi_video_timing_config(struct
> anx7625_data *ctx)
> >       ret |=3D anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> >                               MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes
> > - 1);
> >
> > -     /* Htotal */
> > -     htotal =3D ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > -             ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > -                     HORIZONTAL_TOTAL_PIXELS_L, htotal & 0xFF);
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > -                     HORIZONTAL_TOTAL_PIXELS_H, htotal >> 8);
> > -     /* Hactive */
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > -                     HORIZONTAL_ACTIVE_PIXELS_L, ctx->dt.hactive.min &=
 0xFF);
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > -                     HORIZONTAL_ACTIVE_PIXELS_H, ctx->dt.hactive.min >=
> 8);
> > -     /* HFP */
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > -                     HORIZONTAL_FRONT_PORCH_L, ctx->dt.hfront_porch.mi=
n);
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > -                     HORIZONTAL_FRONT_PORCH_H,
> > -                     ctx->dt.hfront_porch.min >> 8);
> > -     /* HWS */
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > -                     HORIZONTAL_SYNC_WIDTH_L, ctx->dt.hsync_len.min);
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > -                     HORIZONTAL_SYNC_WIDTH_H, ctx->dt.hsync_len.min >>=
 8);
> > -     /* HBP */
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > -                     HORIZONTAL_BACK_PORCH_L, ctx->dt.hback_porch.min)=
;
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > -                     HORIZONTAL_BACK_PORCH_H, ctx->dt.hback_porch.min =
>> 8);
> > -     /* Vactive */
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LIN=
ES_L,
> > -                     ctx->dt.vactive.min);
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LIN=
ES_H,
> > -                     ctx->dt.vactive.min >> 8);
> > -     /* VFP */
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > -                     VERTICAL_FRONT_PORCH, ctx->dt.vfront_porch.min);
> > -     /* VWS */
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > -                     VERTICAL_SYNC_WIDTH, ctx->dt.vsync_len.min);
> > -     /* VBP */
> > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > -                     VERTICAL_BACK_PORCH, ctx->dt.vback_porch.min);
> > +     /* Video Horizontal timing */
> > +     ret |=3D anx7625_h_timing_write(ctx, ctx->i2c.rx_p2_client, true)=
;
> > +
> > +     /* Video Vertical timing */
> > +     ret |=3D anx7625_v_timing_write(ctx, ctx->i2c.rx_p2_client);
> > +
>=20
> Please split this part into two commits: one refactoring timing programmi=
ng into
> two functions and another one introducing DSC support.
> It is hard to review timing programming otherwise.

OK

>=20
> >       /* M value */
> >       ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> >                       MIPI_PLL_M_NUM_23_16, (m >> 16) & 0xff); @@
> > -663,9 +777,15 @@ static int anx7625_dsi_config(struct anx7625_data
> > *ctx)
> >
> >       DRM_DEV_DEBUG_DRIVER(dev, "config dsi.\n");
> >
> > -     /* DSC disable */
> > -     ret =3D anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > -                             R_DSC_CTRL_0, ~DSC_EN);
> > +     ret =3D anx7625_set_dsc_params(ctx);
> > +     if (anx7625_dsc_check(ctx))
> > +             /* DSC enable */
> > +             ret |=3D anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > +                                     R_DSC_CTRL_0, DSC_EN);
> > +     else
> > +             /* DSC disable */
> > +             ret |=3D anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +                                      R_DSC_CTRL_0, ~DSC_EN);
> >
> >       ret |=3D anx7625_api_dsi_config(ctx);
> >
> > @@ -2083,6 +2203,7 @@ static int anx7625_setup_dsi_device(struct
> anx7625_data *ctx)
> >               MIPI_DSI_MODE_VIDEO_HSE |
> >               MIPI_DSI_HS_PKT_END_ALIGNED;
> >
> > +     dsi->dsc =3D &ctx->dsc;
> >       ctx->dsi =3D dsi;
> >
> >       return 0;
> > @@ -2187,19 +2308,69 @@ anx7625_bridge_mode_valid(struct drm_bridge
> *bridge,
> >       struct device *dev =3D ctx->dev;
> >
> >       DRM_DEV_DEBUG_DRIVER(dev, "drm mode checking\n");
> > +     if (mode->clock > SUPPORT_PIXEL_CLOCK)
> > +             return MODE_CLOCK_HIGH;
> > +
> > +     if (mode->clock < SUPPORT_MIN_PIXEL_CLOCK)
> > +             return MODE_CLOCK_LOW;
> >
> > -     /* Max 1200p at 5.4 Ghz, one lane, pixel clock 300M */
> > -     if (mode->clock > SUPPORT_PIXEL_CLOCK) {
> > -             DRM_DEV_DEBUG_DRIVER(dev,
> > -                                  "drm mode invalid, pixelclock too hi=
gh.\n");
>=20
> Any reason for dropping debug message?

I'll keep this message.

>=20
> > +     /*
> > +      * If hdisplay cannot be divided by DSC compress ratio, then disp=
lay
> > +      * will have overlap/shift issue
> > +      */
> > +     if (mode->clock > DSC_PIXEL_CLOCK &&
> > +         (mode->hdisplay % DSC_COMPRESS_RATIO !=3D 0))
>=20
>=20
> ... and there still no check that the DSI host supports generating DSC da=
ta. Nor
> there is an atomic_check() that will check if the mode can be enabled.

I cannot know whether the DSI host supports DSC or not. Anx7625 driver forc=
e
enable DSC feature if pixel clock higher than DSC_PIXEL_CLOCK.

>=20
> >               return MODE_CLOCK_HIGH;
> > -     }
> >
> >       DRM_DEV_DEBUG_DRIVER(dev, "drm mode valid.\n");
> >
> >       return MODE_OK;
> >  }
> >
> > +static void anx7625_dsc_enable(struct anx7625_data *ctx, bool en) {
> > +     int ret;
> > +     struct device *dev =3D ctx->dev;
> > +
> > +     if (en) {
> > +             ctx->dsc.dsc_version_major =3D 1;
> > +             ctx->dsc.dsc_version_minor =3D 1;
> > +             ctx->dsc.slice_height =3D 8;
> > +             ctx->dsc.slice_width =3D ctx->dt.hactive.min / DSC_SLICE_=
NUM;
> > +             ctx->dsc.slice_count =3D DSC_SLICE_NUM;
> > +             ctx->dsc.bits_per_component =3D 8;
> > +             ctx->dsc.bits_per_pixel =3D 8 << 4; /* 4 fractional bits =
*/
> > +             ctx->dsc.block_pred_enable =3D true;
> > +             ctx->dsc.native_420 =3D false;
> > +             ctx->dsc.native_422 =3D false;
> > +             ctx->dsc.simple_422 =3D false;
> > +             ctx->dsc.vbr_enable =3D false;
> > +             ctx->dsc.convert_rgb =3D 1;
> > +             ctx->dsc.vbr_enable =3D 0;
>=20
> Aren't those 'false' and '0' defaults? If so, you don't need to write tho=
se fields.
Ok

>=20
> > +
> > +             drm_dsc_set_rc_buf_thresh(&ctx->dsc);
> > +             drm_dsc_set_const_params(&ctx->dsc);
> > +
> > +             ctx->dsc.initial_scale_value =3D drm_dsc_initial_scale_va=
lue(&ctx->dsc);
> > +             ctx->dsc.line_buf_depth =3D ctx->dsc.bits_per_component +=
 1;
> > +             ret =3D drm_dsc_setup_rc_params(&ctx->dsc, DRM_DSC_1_2_44=
4);
> > +             if (ret < 0)
> > +                     dev_warn(dev, "drm_dsc_setup_rc_params ret
> > + %d\n", ret);
> > +
> > +             ret =3D drm_dsc_compute_rc_parameters(&ctx->dsc);
> > +             if (ret)
> > +                     dev_warn(dev, "drm dsc compute rc parameters
> > + failed ret %d\n", ret);
> > +
> > +             drm_dsc_pps_payload_pack((struct drm_dsc_picture_paramete=
r_set
> *)&ctx->pps_table,
> > +                                      &ctx->dsc);
> > +             dev_dbg(dev, "anx7625 enable dsc\n");
> > +     } else {
> > +             ctx->dsc.dsc_version_major =3D 0;
> > +             ctx->dsc.dsc_version_minor =3D 0;
> > +             dev_dbg(dev, "anx7625 disable dsc\n");
> > +     }
> > +}
> > +
> >  static void anx7625_bridge_mode_set(struct drm_bridge *bridge,
> >                                   const struct drm_display_mode *old_mo=
de,
> >                                   const struct drm_display_mode *mode)
> > @@ -2244,6 +2415,8 @@ static void anx7625_bridge_mode_set(struct
> drm_bridge *bridge,
> >       DRM_DEV_DEBUG_DRIVER(dev, "vsync_end(%d),vtotal(%d).\n",
> >                            mode->vsync_end,
> >                            mode->vtotal);
> > +
> > +     anx7625_dsc_enable(ctx, anx7625_dsc_check(ctx));
> >  }
> >
> >  static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge, @@
> > -2258,10 +2431,6 @@ static bool anx7625_bridge_mode_fixup(struct
> > drm_bridge *bridge,
> >
> >       DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
> >
> > -     /* No need fixup for external monitor */
> > -     if (!ctx->pdata.panel_bridge)
> > -             return true;
> > -
> >       hsync =3D mode->hsync_end - mode->hsync_start;
> >       hfp =3D mode->hsync_start - mode->hdisplay;
> >       hbp =3D mode->htotal - mode->hsync_end; @@ -2272,12 +2441,24 @@
> > static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
> >                            hsync, hfp, hbp, adj->clock);
> >       DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d),
> htot(%d)\n",
> >                            adj->hsync_start, adj->hsync_end,
> > adj->htotal);
> > -
> >       adj_hfp =3D hfp;
> >       adj_hsync =3D hsync;
> >       adj_hbp =3D hbp;
> >       adj_hblanking =3D hblanking;
> >
> > +     if (mode->clock > DSC_PIXEL_CLOCK) {
> > +             adj_hsync =3D DSC_HSYNC_LEN;
> > +             adj_hfp =3D DSC_HFP_LEN;
> > +             adj_hbp =3D DSC_HBP_LEN;
> > +             vref =3D (u32)div_u64((u64)adj->clock * 1000 * 1000,
> > +                                 adj->htotal * adj->vtotal);
> > +             goto calculate_timing;
> > +     }
> > +
> > +     /* No need fixup for external monitor */
> > +     if (!ctx->pdata.panel_bridge)
> > +             return true;
> > +
> >       /* HFP needs to be even */
> >       if (hfp & 0x1) {
> >               adj_hfp +=3D 1;
> > @@ -2349,6 +2530,8 @@ static bool anx7625_bridge_mode_fixup(struct
> drm_bridge *bridge,
> >                       adj_hfp -=3D delta_adj;
> >       }
> >
> > +calculate_timing:
> > +
> >       DRM_DEV_DEBUG_DRIVER(dev, "after mode fixup\n");
> >       DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d), hfp(%d), hbp(%d),
> clock(%d)\n",
> >                            adj_hsync, adj_hfp, adj_hbp, adj->clock);
> > @@ -2357,6 +2540,10 @@ static bool anx7625_bridge_mode_fixup(struct
> drm_bridge *bridge,
> >       adj->hsync_start =3D adj->hdisplay + adj_hfp;
> >       adj->hsync_end =3D adj->hsync_start + adj_hsync;
> >       adj->htotal =3D adj->hsync_end + adj_hbp;
> > +     if (mode->clock > DSC_PIXEL_CLOCK)
> > +             adj->clock =3D (u32)div_u64((u64)vref * adj->htotal * adj=
->vtotal,
> > +                                       1000 * 1000);
> > +
> >       DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d),
> htot(%d)\n",
> >                            adj->hsync_start, adj->hsync_end,
> > adj->htotal);
> >
>=20
> --
> With best wishes
> Dmitry
