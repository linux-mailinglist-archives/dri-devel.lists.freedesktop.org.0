Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB1498A457
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9785610E45C;
	Mon, 30 Sep 2024 13:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="l2rv3En7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FD010E456
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 13:10:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGZVs01uf9kcEbnCIU1c/Pxr4B3SEPM9pnZgazaTJiT3CWV5II44/ongZqWAC9i4PmIQrGhOaMUv1HOXnEcEcZpW0oNJoKhgCmq+KSOD7fPO0MQQ8juUUSPZg3Qdcrte1uYSQUWz1HBVXbm6j9QGQzV1MMK2qlpUsIxl59td8ZjZzt9SbHSh2oIUFc99USQJ91MsCFeeUu3ArRbBaE9cMIrkr2CQSDyJJ7z98NAfKtFvMRyPSKQZj4+HSoYqHX5l+xKytg4QBlvdMq5v/eGFJ1UyRZJtDifhv8XGe4Rk9+UdPu0ooKJtMTXBcpJfK8dAXd6ybMyE5Ab4I9ydnEdgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IduMe2w7DKCqFObH9sv0td34XgKmM878efeFgN3RGNE=;
 b=jBKmlJLIBkTHFfDVJrRyZj6DuchWYXiSHPdvKFmKp0fTbUAgxyjUErdgrtWGPsUWhXn4WCoPpvzxazEj1SU6aN+rSADb/IMaG/usyzvKw7rRFyZxW98NnPNAdgnm9hbBMWliS+mVepxVQVlzrMnf5Kma5JkDWqT4EQ9kNlUVqgoJUOnCknWdE3Fr57t7oI+Z/dZM9zTLnyvT/XwC6cfmG16uOCft3l46HmJafYrHYJDjrtuIGY9I6rfMjvAiZy4dH0bLyFtCOA1fc4kFD9xKlDqnE6FiQJ6BAXbS8cEkW/vfyy57kl2G2CdOc3ASFs9WT2YFDD98s17fW2XiEboYNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IduMe2w7DKCqFObH9sv0td34XgKmM878efeFgN3RGNE=;
 b=l2rv3En78fqEejiY6aLXbWKygV+RGNWi/EcWjQPi7qrP5+7WNBkCT4Ob0sZQV9usgGKqEVg7e/N2FoYOGtG16XeNZ+KvjjT1l1G9TXJjLW56QYBjTJWqJmH6mt/++xz1vPrfsSueBYfeWrDeFDuiqzmONe6lNUet2IMzKLWghJ0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11973.jpnprd01.prod.outlook.com (2603:1096:400:38c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 13:10:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 13:10:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, laurent.pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "y.moog@phytec.de"
 <y.moog@phytec.de>
Subject: RE: [PATCH 6/8] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Thread-Topic: [PATCH 6/8] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Thread-Index: AQHbEvtUipP47OqWn0qTbXIXZ3wX97JwA4ZggABJZiA=
Date: Mon, 30 Sep 2024 13:10:29 +0000
Message-ID: <TY3PR01MB113465DEDB647BA45908802AA86762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-7-victor.liu@nxp.com>
 <TYWPR01MB11343E3DE82874B557B537B6186762@TYWPR01MB11343.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11343E3DE82874B557B537B6186762@TYWPR01MB11343.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11973:EE_
x-ms-office365-filtering-correlation-id: 495b9a49-e9bc-4526-df1a-08dce151421d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qNaVsE0Vyp3hHk7wMRqurqPWt3DaD6t6JHwZF+IsUwVWNWqfNylx+e+0mwmG?=
 =?us-ascii?Q?YdMadSSFheHk+7Oww8Behxyygq2+4yVb35/OPOvqUW84LeOHVlu0KvuYSzEy?=
 =?us-ascii?Q?eMbiMZ+zoh8+/83hDbIsSU0dpzWuBGbOYCehqnTPDgO7U/UA1EEf6GPS7QKP?=
 =?us-ascii?Q?v2DnkctV2MGgqVWaYKS9E7RZHjH7We/2Xfw+eAC17ovB/Dn3ixjbZXRLATrc?=
 =?us-ascii?Q?NpWYJTnw8wA4qGCqEq0jYGteRcpS45FNXvautBx1gSCokR+cp59EL7+yldyl?=
 =?us-ascii?Q?uhpZvGwDkOrntRe4EYsVLml1xITX546meBYJkzNI0lLZfGYONMd9eRDc+7ec?=
 =?us-ascii?Q?GgdEXso9LOt+yQKNSaBSj3a7QIWsT/a8GFAvq2VwPmv0NzaXD2ujxJWQrNPJ?=
 =?us-ascii?Q?0GGaX1OiH8036Ev5B6Ak1vPV5GC81XF8ZQ11Yh2tjsrAYkC7yRDrzPkfyLHp?=
 =?us-ascii?Q?eafSb0Itr15Nm5XOAjzMVxA+28y/ZLpXE+brY+ld2hhrgdJCQJ8x14UNQw38?=
 =?us-ascii?Q?jUoNrNdCRM/vLkG60aRCS2c/dy950Bw+f6DgmSAnOZXbEtsEplOWKli/bedH?=
 =?us-ascii?Q?v8pwZqOSWRqJhYODicSRQqwynyBNERBFTxKI4B0sTo60d6yNHYGpKSQnYR8H?=
 =?us-ascii?Q?NnmJ5yNpmDsZdL4BsUimH+RMDGKRzxUVy5hbVphcjcxWtVjvF0U3hbPEJFHu?=
 =?us-ascii?Q?jQRQxlQX5VxQOB58gL7QzE6ewc02+IPygM0ZrbSffVx8bkeGDkol6uUsmvKG?=
 =?us-ascii?Q?81PUD0jVh0tVxU5VbY3aeq0llwVyPp0a3sb18+yTWqkIneegIdjW3uFSl0h2?=
 =?us-ascii?Q?8sNdKfIZB0ccLQXHw+96akeOnPBYdHoal5TzJJYOYtwvpIM+T9FE/t8F3Y9T?=
 =?us-ascii?Q?KhuG4A3gmtDmrVTedDIIq1fF4AqhzKOwLQbrR8w/slQr9C9xHVivRtx0XubG?=
 =?us-ascii?Q?nwfps7i44CaOKT/vTA6IdlUV+uiTCpwoNf2U6OhfV+bEQ/+xr68tS7ujvNcG?=
 =?us-ascii?Q?PBwZvA+8qYUmIfpTPYgP6mX/Eom+LTYyHF7A/rwZIUQD8JIDOyQjVnvFctuQ?=
 =?us-ascii?Q?8Pj7+6HTMn7TF61bwDhrafyCovwWAGaExRZG8WihvW71gtbauL+aOFWxiq2e?=
 =?us-ascii?Q?ioOZxQVzf8jM5dEqS2x79yHhvPUDbavH4WVsChKdhCMaHIPhVv+OIlctXEBE?=
 =?us-ascii?Q?r6jsYfRW0MadNCgjismFSPulA3O+wXorPcVMOz8Q8sApSNf1OsOdJQlgazp1?=
 =?us-ascii?Q?iOYNMrTnfIJU39gRCA67BQ+3iHXzZiF1g6DS+pr0z1hT3N3g7Ue+WIGrnkmT?=
 =?us-ascii?Q?2QzdFVIIJs1FOeJiRUC4vEWfvW30aOfq5oGg+qrq8XKA6Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PcwO74rWuyPBImVXULpflD4/qiALUnaYeumqCk5Go+/2yrYv4m/QpmP7eQcs?=
 =?us-ascii?Q?DYErSp09fVRuRVM4zLTMUOSGDl1NcyuSWaSLpO3EbtnpGwEmPG72G5ORtdcX?=
 =?us-ascii?Q?k9+aepSdThAYDkABttQAuKxFzMH4MXYlKWwkv3+sxVrg0x7NUxMOTWQURHJD?=
 =?us-ascii?Q?VMIIc1/ggkvkJQ+i9mpTI+iV9x8dDd4tLWrLsGZq+kMcdZhmbT43p7mrdQ4d?=
 =?us-ascii?Q?Bob90rXVC4BS6+EGDTspIQ6FGUaTi/Sg43josDPYeF7FqO0xs9zTPehVS1es?=
 =?us-ascii?Q?F2inovr+va70xKZPkK/bBHIvyZcpFlGftFj1MyOcYyF91G4imS/zYoTj0qWc?=
 =?us-ascii?Q?s4JgfsIW6yLote2kCI6mdl9NGKw9rxmgc4TWMrbNzh08v8ZT+ZoK2JC0MwlD?=
 =?us-ascii?Q?xVn7xTEFTvB/7M4S5KdOZT2So5JVrZwKa28c0hzufaWPHnExUw3HEwz8BINl?=
 =?us-ascii?Q?w46eIYTwdIOh9u0uP1FBoD7W8OVk66VBeSTKNh9T5lkgp+94ApPwX0cEdWdl?=
 =?us-ascii?Q?Yc4mt9ob3TodQzbx4Aoyg3xnFW8dfU5mOS5qnP5CbcMvnEg3IEMUwIWV9sC5?=
 =?us-ascii?Q?2eyAPA0Tf4VuOBktj7RgI0c5HgmI5FQVgp2cDbAh9uY4kPrHohRc0WCgSE2W?=
 =?us-ascii?Q?hw0hlnxr90ieZbV1wlesapuICUHZK78VJJM3brQ7+hwYrXhrqK4r5txDFK3x?=
 =?us-ascii?Q?1an5xGoaF7IJa91JDqoceFG9x4G3WRImzRvOhYUcywb/kLVdk9+plMExky0x?=
 =?us-ascii?Q?f2z+j6xAljKC3raydCG0XfXEU/xYHPNqEO/G5KMByLr8SK71pobKghOyUxMj?=
 =?us-ascii?Q?+y3dfb10N+YaW4uMJgjp0RWCLS/KWpRuDr6fta2UzcnN5zleV9c1OpZ47+Ky?=
 =?us-ascii?Q?nnQzaQGzq8cOw4EnTMoOFU+rPmCB0L5DkigP6KKg3BoCLoqggrvnqEN8uPJd?=
 =?us-ascii?Q?Dof7tXhCZJIYrXv7vsX3P15oXFEJPOSPGqo3mLZpLtAGb51Y9kU3cD1fbpFp?=
 =?us-ascii?Q?T0ws4/k1uH1AbXOitIXbXATUp2BuoNvEDRtYCdKxee5WR6z3IlLkXFL8wBcU?=
 =?us-ascii?Q?olJeV05+5TkgZSoQY9WA/4AXDD9kWfehFBQfJ8mcGLQRTIaUkWyFqMo/1JCM?=
 =?us-ascii?Q?jLVOh42NS+jt/TSCO88C+5QfC//M2HmNvEe+hR2KExMwuii53mmVxS0AQEqX?=
 =?us-ascii?Q?o8DURLMZhGdGc25/PL94me5AfsT0/2HNb383BS4PzVHK2dnb8a2zEPET9nnd?=
 =?us-ascii?Q?o8T/fPuWuvgIabNY4n7/BbzePYUOGy4pUNBDCG5js6QATYt++u22QZf/pA8B?=
 =?us-ascii?Q?ZJBygcaBpGdf6zpGN1jHX7Qqq46PCoCvSZoC53KxEKyHHL7Assjpl4LF+J82?=
 =?us-ascii?Q?FBYtlhlvxFGeG05EbW7sKkJYnsk9aXi+ninYP6rIwWFpGAAv9nWCM1uW7tt4?=
 =?us-ascii?Q?4NbFXIuTJNxtK/wa3f1ZvGSG5nTZBqwtJji40aFccYhxPdpdzp0oINWnaPIM?=
 =?us-ascii?Q?ILNn7x7QI58aYxYq6hmvP1HNpjCHitEMIImuwuk1oTlF3cfNRPXrkVSA3o9r?=
 =?us-ascii?Q?+EfIEWKbqcpRa+SB0B/J3FepaAj61W5T98ijCXxG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495b9a49-e9bc-4526-df1a-08dce151421d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 13:10:29.7155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z+yyEEtb0Xu8n/chQh5LhaSmv+zirNEd8yFp5SBSl9qS3Ei68ZvLvuVMq398wnTFbAu3KCMdVsrn0yYH4GTu3iqHtbHoNyB7WHXxFxhaxNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11973
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

Hi Liu,

> -----Original Message-----
> From: Biju Das
> Sent: Monday, September 30, 2024 10:16 AM
> Subject: RE: [PATCH 6/8] drm/bridge: Add ITE IT6263 LVDS to HDMI converte=
r
>=20
> Hi Liu,
>=20
> Thanks for the patch.
>=20
> > -----Original Message-----
> > From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>
> > On Behalf Of Liu Ying
> > Sent: Monday, September 30, 2024 6:29 AM
> > Subject: [PATCH 6/8] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
> >
> > Add basic HDMI video output support. Currently, only RGB888 output
> > pixel format is supported.  At the LVDS input side, the driver
> > supports single LVDS link and dual LVDS links with "jeida-24" LVDS mapp=
ing.
> >
> > Product link:
> > https://www.ite.com.tw/en/product/cate1/IT6263
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig      |   8 +
> >  drivers/gpu/drm/bridge/Makefile     |   1 +
> >  drivers/gpu/drm/bridge/ite-it6263.c | 829
> > ++++++++++++++++++++++++++++
> >  3 files changed, 838 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig
> > b/drivers/gpu/drm/bridge/Kconfig index
> > 3eb955333c80..93f99682a090 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -90,6 +90,14 @@ config DRM_FSL_LDB
> >  	help
> >  	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
> >
> > +config DRM_ITE_IT6263
> > +	tristate "ITE IT6263 LVDS/HDMI bridge"
> > +	depends on OF
> > +	select DRM_KMS_HELPER
> > +	select REGMAP_I2C
> > +	help
> > +	  ITE IT6263 LVDS to HDMI bridge chip driver.
> > +
> >  config DRM_ITE_IT6505
> >  	tristate "ITE IT6505 DisplayPort bridge"
> >  	depends on OF
> > diff --git a/drivers/gpu/drm/bridge/Makefile
> > b/drivers/gpu/drm/bridge/Makefile index 7df87b582dca..f3776dd473fd
> > 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) +=3D chrontel-ch7033.=
o
> >  obj-$(CONFIG_DRM_CROS_EC_ANX7688) +=3D cros-ec-anx7688.o
> >  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) +=3D display-connector.o
> >  obj-$(CONFIG_DRM_FSL_LDB) +=3D fsl-ldb.o
> > +obj-$(CONFIG_DRM_ITE_IT6263) +=3D ite-it6263.o
> >  obj-$(CONFIG_DRM_ITE_IT6505) +=3D ite-it6505.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT8912B) +=3D lontium-lt8912b.o
> >  obj-$(CONFIG_DRM_LONTIUM_LT9211) +=3D lontium-lt9211.o diff --git
> > a/drivers/gpu/drm/bridge/ite-it6263.c
> > b/drivers/gpu/drm/bridge/ite-it6263.c
> > new file mode 100644
> > index 000000000000..886588497bc1
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> > @@ -0,0 +1,829 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2024 NXP
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/media-bus-format.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_atomic_state_helper.h> #include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h> #include <drm/drm_crtc.h> #include
> > +<drm/drm_edid.h> #include <drm/drm_of.h> #include
> > +<drm/drm_probe_helper.h>
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--
> > +------
> > + * LVDS registers
> > + */
> > +
> > +/* LVDS software reset registers */
> > +#define LVDS_REG_05			0x05
> > +#define  REG_SOFT_P_RST			BIT(1)
> > +
> > +/* LVDS system configuration registers */
> > +/* 0x0b */
> > +#define LVDS_REG_0B			0x0b
> > +#define  REG_SSC_PCLK_RF		BIT(0)
> > +#define  REG_LVDS_IN_SWAP		BIT(1)
> > +
> > +/* LVDS test pattern gen control registers */
> > +/* 0x2c */
> > +#define LVDS_REG_2C			0x2c
> > +#define  REG_COL_DEP			GENMASK(1, 0)
> > +#define  BIT8				FIELD_PREP(REG_COL_DEP, 2)
> > +#define  OUT_MAP			BIT(4)
> > +#define  JEIDA				0
> > +#define  REG_DESSC_ENB			BIT(6)
> > +#define  DMODE				BIT(7)
> > +#define  DISO				BIT(7)
> > +#define  SISO				0
> > +
> > +#define LVDS_REG_3C			0x3c
> > +#define LVDS_REG_3F			0x3f
> > +#define LVDS_REG_47			0x47
> > +#define LVDS_REG_48			0x48
> > +#define LVDS_REG_4F			0x4f
> > +#define LVDS_REG_52			0x52
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--
> > +------
> > + * HDMI registers are separated into three banks:
> > + * 1) HDMI register common bank: 0x00 ~ 0x2f  */
> > +
> > +/* HDMI genernal registers */
> > +#define HDMI_REG_SW_RST			0x04
> > +#define  SOFTREF_RST			BIT(5)
> > +#define  SOFTA_RST			BIT(4)
> > +#define  SOFTV_RST			BIT(3)
> > +#define  AUD_RST			BIT(2)
> > +#define  HDCP_RST			BIT(0)
> > +#define  HDMI_RST_ALL			(SOFTREF_RST | SOFTA_RST | SOFTV_RST | \
> > +					 AUD_RST | HDCP_RST)
> > +
> > +#define HDMI_REG_SYS_STATUS		0x0e
> > +#define  HPDETECT			BIT(6)
> > +#define  TXVIDSTABLE			BIT(4)
> > +
> > +#define HDMI_REG_BANK_CTRL		0x0f
> > +#define  REG_BANK_SEL			BIT(0)
> > +
> > +/* HDMI System DDC control registers */
> > +#define HDMI_REG_DDC_MASTER_CTRL	0x10
> > +#define  MASTER_SEL_HOST		BIT(0)
> > +
> > +#define HDMI_REG_DDC_HEADER		0x11
> > +
> > +#define HDMI_REG_DDC_REQOFF		0x12
> > +#define HDMI_REG_DDC_REQCOUNT		0x13
> > +#define HDMI_REG_DDC_EDIDSEG		0x14
> > +
> > +#define HDMI_REG_DDC_CMD		0x15
> > +#define  DDC_CMD_EDID_READ		0x3
> > +#define  DDC_CMD_FIFO_CLR		0x9
> > +
> > +#define HDMI_REG_DDC_STATUS		0x16
> > +#define  DDC_DONE			BIT(7)
> > +#define  DDC_NOACK			BIT(5)
> > +#define  DDC_WAITBUS			BIT(4)
> > +#define  DDC_ARBILOSE			BIT(3)
> > +#define  DDC_ERROR			(DDC_NOACK | DDC_WAITBUS | DDC_ARBILOSE)
> > +
> > +#define HDMI_DDC_FIFO_BYTES		32
> > +#define HDMI_REG_DDC_READFIFO		0x17
> > +#define HDMI_REG_LVDS_PORT		0x1d /* LVDS input control I2C addr */
> > +#define HDMI_REG_LVDS_PORT_EN		0x1e
> > +#define LVDS_INPUT_CTRL_I2C_ADDR	0x33
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--
> > +------
> > + * 2) HDMI register bank0: 0x30 ~ 0xff  */
> > +
> > +/* HDMI AFE registers */
> > +#define HDMI_REG_AFE_DRV_CTRL		0x61
> > +#define  AFE_DRV_PWD			BIT(5)
> > +#define  AFE_DRV_RST			BIT(4)
> > +
> > +#define HDMI_REG_AFE_XP_CTRL		0x62
> > +#define  AFE_XP_GAINBIT			BIT(7)
> > +#define  AFE_XP_ER0			BIT(4)
> > +#define  AFE_XP_RESETB			BIT(3)
> > +
> > +#define HDMI_REG_AFE_ISW_CTRL		0x63
> > +
> > +#define HDMI_REG_AFE_IP_CTRL		0x64
> > +#define  AFE_IP_GAINBIT			BIT(7)
> > +#define  AFE_IP_ER0			BIT(3)
> > +#define  AFE_IP_RESETB			BIT(2)
> > +
> > +/* HDMI input data format registers */
> > +#define HDMI_REG_INPUT_MODE		0x70
> > +#define  IN_RGB				0x00
> > +
> > +/* HDMI general control registers */
> > +#define HDMI_REG_HDMI_MODE		0xc0
> > +#define  TX_HDMI_MODE			BIT(0)
> > +
> > +#define HDMI_REG_GCP			0xc1
> > +#define  AVMUTE				BIT(0)
> > +#define  HDMI_COLOR_DEPTH		GENMASK(6, 4)
> > +#define  HDMI_COLOR_DEPTH_24		FIELD_PREP(HDMI_COLOR_DEPTH, 4)
> > +
> > +#define HDMI_REG_PKT_GENERAL_CTRL	0xc6
> > +#define  ENABLE_PKT			BIT(0)
> > +#define  REPEAT_PKT			BIT(1)
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--
> > +------
> > + * 3) HDMI register bank1: 0x130 ~ 0x1ff (HDMI packet registers)  */
> > +
> > +/* AVI packet registers */
> > +#define HDMI_REG_AVI_DB1		0x158
> > +#define  AVI_DB1_COLOR_SPACE		GENMASK(6, 5)
> > +#define  AVI_COLOR_SPACE_RGB		FIELD_PREP(AVI_DB1_COLOR_SPACE, 0)
> > +
> > +#define MAX_PIXEL_CLOCK_KHZ		150000
> > +#define HIGH_PIXEL_CLOCK_KHZ		80000
> > +
> > +struct it6263 {
> > +	struct device *dev;
> > +	struct i2c_client *hdmi_i2c;
> > +	struct i2c_client *lvds_i2c;
> > +	struct regmap *hdmi_regmap;
> > +	struct regmap *lvds_regmap;
> > +	struct drm_bridge bridge;
> > +	struct drm_bridge *next_bridge;
> > +	struct drm_connector connector;
> > +	struct gpio_desc *reset_gpio;
> > +	bool lvds_dual_link;
> > +	bool lvds_link12_swap;
> > +};
> > +
> > +static inline struct it6263 *bridge_to_it6263(struct drm_bridge
> > +*bridge) {
> > +	return container_of(bridge, struct it6263, bridge); }
> > +
> > +static inline struct it6263 *connector_to_it6263(struct drm_connector
> > +*conn) {
> > +	return container_of(conn, struct it6263, connector); }
> > +
> > +static bool it6263_hdmi_writeable_reg(struct device *dev, unsigned
> > +int
> > +reg) {
> > +	switch (reg) {
> > +	case HDMI_REG_SW_RST:
> > +	case HDMI_REG_BANK_CTRL:
> > +	case HDMI_REG_DDC_MASTER_CTRL:
> > +	case HDMI_REG_DDC_HEADER:
> > +	case HDMI_REG_DDC_REQOFF:
> > +	case HDMI_REG_DDC_REQCOUNT:
> > +	case HDMI_REG_DDC_EDIDSEG:
> > +	case HDMI_REG_DDC_CMD:
> > +	case HDMI_REG_LVDS_PORT:
> > +	case HDMI_REG_LVDS_PORT_EN:
> > +	case HDMI_REG_AFE_DRV_CTRL:
> > +	case HDMI_REG_AFE_XP_CTRL:
> > +	case HDMI_REG_AFE_ISW_CTRL:
> > +	case HDMI_REG_AFE_IP_CTRL:
> > +	case HDMI_REG_INPUT_MODE:
> > +	case HDMI_REG_HDMI_MODE:
> > +	case HDMI_REG_GCP:
> > +	case HDMI_REG_PKT_GENERAL_CTRL:
> > +	case HDMI_REG_AVI_DB1:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +static bool it6263_hdmi_readable_reg(struct device *dev, unsigned int
> > +reg) {
> > +	if (it6263_hdmi_writeable_reg(dev, reg))
> > +		return true;
> > +
> > +	switch (reg) {
> > +	case HDMI_REG_SYS_STATUS:
> > +	case HDMI_REG_DDC_STATUS:
> > +	case HDMI_REG_DDC_READFIFO:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +static bool it6263_hdmi_volatile_reg(struct device *dev, unsigned int
> > +reg) {
> > +	switch (reg) {
> > +	case HDMI_REG_SW_RST:
> > +	case HDMI_REG_SYS_STATUS:
> > +	case HDMI_REG_DDC_STATUS:
> > +	case HDMI_REG_DDC_READFIFO:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +static const struct regmap_range_cfg it6263_hdmi_range_cfg =3D {
> > +	.range_min =3D 0x00,
> > +	.range_max =3D HDMI_REG_AVI_DB1,
> > +	.selector_reg =3D HDMI_REG_BANK_CTRL,
> > +	.selector_mask =3D REG_BANK_SEL,
> > +	.selector_shift =3D 0,
> > +	.window_start =3D 0x00,
> > +	.window_len =3D 0x100,
> > +};
> > +
> > +static const struct regmap_config it6263_hdmi_regmap_config =3D {
> > +	.name =3D "it6263-hdmi",
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.writeable_reg =3D it6263_hdmi_writeable_reg,
> > +	.readable_reg =3D it6263_hdmi_readable_reg,
> > +	.volatile_reg =3D it6263_hdmi_volatile_reg,
> > +	.max_register =3D HDMI_REG_AVI_DB1,
> > +	.ranges =3D &it6263_hdmi_range_cfg,
> > +	.num_ranges =3D 1,
> > +	.cache_type =3D REGCACHE_MAPLE,
> > +};
> > +
> > +static bool it6263_lvds_writeable_reg(struct device *dev, unsigned
> > +int
> > +reg) {
> > +	switch (reg) {
> > +	case LVDS_REG_05:
> > +	case LVDS_REG_0B:
> > +	case LVDS_REG_2C:
> > +	case LVDS_REG_3C:
> > +	case LVDS_REG_3F:
> > +	case LVDS_REG_47:
> > +	case LVDS_REG_48:
> > +	case LVDS_REG_4F:
> > +	case LVDS_REG_52:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +static bool it6263_lvds_readable_reg(struct device *dev, unsigned int
> > +reg) {
> > +	return it6263_lvds_writeable_reg(dev, reg); }
> > +
> > +static bool it6263_lvds_volatile_reg(struct device *dev, unsigned int
> > +reg) {
> > +	return reg =3D=3D LVDS_REG_05;
> > +}
> > +
> > +static const struct regmap_config it6263_lvds_regmap_config =3D {
> > +	.name =3D "it6263-lvds",
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.writeable_reg =3D it6263_lvds_writeable_reg,
> > +	.readable_reg =3D it6263_lvds_readable_reg,
> > +	.volatile_reg =3D it6263_lvds_volatile_reg,
> > +	.max_register =3D LVDS_REG_52,
> > +	.cache_type =3D REGCACHE_MAPLE,
> > +};
> > +
> > +static const char * const it6263_supplies[] =3D {
> > +	"ivdd", "ovdd", "txavcc18", "txavcc33", "pvcc1", "pvcc2",
> > +	"avcc", "anvdd", "apvdd"
> > +};
> > +
> > +static int it6263_parse_dt(struct it6263 *it) {
> > +	struct device *dev =3D it->dev;
> > +	struct device_node *port0, *port1;
> > +	int ret =3D 0;
> > +
> > +	it->next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
> > +	if (IS_ERR(it->next_bridge))
> > +		return dev_err_probe(dev, PTR_ERR(it->next_bridge),
> > +				     "failed to get next bridge\n");
> > +
> > +	port0 =3D of_graph_get_port_by_id(dev->of_node, 0);
> > +	port1 =3D of_graph_get_port_by_id(dev->of_node, 1);
> > +	if (port0 && port1) {
> > +		if (of_property_read_bool(port0, "dual-lvds-even-pixels") &&
> > +		    of_property_read_bool(port1, "dual-lvds-odd-pixels")) {
> > +			it->lvds_dual_link =3D true;
> > +			it->lvds_link12_swap =3D true;
> > +		} else if (of_property_read_bool(port0, "dual-lvds-odd-pixels") &&
> > +			   of_property_read_bool(port1, "dual-lvds-even-pixels")) {
> > +			it->lvds_dual_link =3D true;
> > +		}
> > +
> > +		if (!it->lvds_dual_link) {
> > +			dev_err(dev,
> > +				"failed to get LVDS dual link pixel order\n");
> > +			ret =3D -EINVAL;
> > +		}
> > +	} else if (port1) {
> > +		ret =3D -EINVAL;
> > +		dev_err(dev, "single input LVDS port1 is not supported\n");
>=20
> 		Are you supporting single input LVDS port0??
>=20
> > +	} else if (!port0) {
> > +		ret =3D -EINVAL;
> > +		dev_err(dev, "no input LVDS port\n");
> > +	}
> > +
> > +	of_node_put(port0);
> > +	of_node_put(port1);
> > +
> > +	return ret;
> > +}
> > +
> > +static inline void it6263_reset(struct it6263 *it) {
> > +	if (!it->reset_gpio)
> > +		return;
> > +
> > +	gpiod_set_value_cansleep(it->reset_gpio, 0);
> > +	fsleep(1000);
> > +	gpiod_set_value_cansleep(it->reset_gpio, 1);
> > +	/* The chip maker says the low pulse should be at least 40ms. */
> > +	fsleep(40000);
> > +	gpiod_set_value_cansleep(it->reset_gpio, 0);
> > +	/* addtional time to wait the high voltage to be stable */
> > +	fsleep(5000);
>=20
> What about other resets ??
>=20
> /* AFE PLL reset and  pclk reset */
>=20
> > +}
> > +
> > +static inline int it6263_lvds_set_i2c_addr(struct it6263 *it) {
> > +	int ret;
> > +
> > +	ret =3D regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT,
> > +			   LVDS_INPUT_CTRL_I2C_ADDR << 1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT_EN, BIT(0));
> > +}
> > +
> > +static inline void it6263_lvds_reset(struct it6263 *it) {
> > +	/* AFE PLL reset */
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), 0x0);
> > +	fsleep(1000);
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), BIT(0));
> > +
> > +	/* software pixel clock domain reset */
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST,
> > +			  REG_SOFT_P_RST);
> > +	fsleep(1000);
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST, 0x0);
> > +	fsleep(10000);
> > +}
> > +
> > +static inline void it6263_lvds_set_interface(struct it6263 *it) {
> > +	/* color depth */
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
> > +	/* output mapping */
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
> > +
> > +	if (it->lvds_dual_link) {
> > +		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO);
> > +		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), BIT(1));
> > +	} else {
> > +		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, SISO);
> > +		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), 0);
> > +	}
> > +}
> > +
> > +static inline void it6263_lvds_set_afe(struct it6263 *it) {
> > +	regmap_write(it->lvds_regmap, LVDS_REG_3C, 0xaa);
> > +	regmap_write(it->lvds_regmap, LVDS_REG_3F, 0x02);
> > +	regmap_write(it->lvds_regmap, LVDS_REG_47, 0xaa);
> > +	regmap_write(it->lvds_regmap, LVDS_REG_48, 0x02);
> > +	regmap_write(it->lvds_regmap, LVDS_REG_4F, 0x11);
> > +
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_SSC_PCLK_RF,
> > +			  REG_SSC_PCLK_RF);
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, 0x07, 0);
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_DESSC_ENB,
> > +			  REG_DESSC_ENB);
> > +}
> > +
> > +static inline void it6263_lvds_sys_cfg(struct it6263 *it) {
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_LVDS_IN_SWAP,
> > +			  it->lvds_link12_swap ? REG_LVDS_IN_SWAP : 0); }
> > +
> > +static inline void it6263_lvds_config(struct it6263 *it) {
> > +	it6263_lvds_reset(it);
> > +	it6263_lvds_set_interface(it);
> > +	it6263_lvds_set_afe(it);
> > +	it6263_lvds_sys_cfg(it);
> > +}
> > +
> > +static inline void it6263_hdmi_config(struct it6263 *it) {
> > +	regmap_write(it->hdmi_regmap, HDMI_REG_SW_RST, HDMI_RST_ALL);
> > +	regmap_write(it->hdmi_regmap, HDMI_REG_INPUT_MODE, IN_RGB);
> > +	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, HDMI_COLOR_DEPTH,
> > +			  HDMI_COLOR_DEPTH_24);
> > +	regmap_write_bits(it->hdmi_regmap, HDMI_REG_AVI_DB1,
> > +			  AVI_DB1_COLOR_SPACE, AVI_COLOR_SPACE_RGB); }
> > +
> > +static enum drm_connector_status it6263_detect(struct it6263 *it) {
> > +	unsigned int val;
> > +
> > +	regmap_read(it->hdmi_regmap, HDMI_REG_SYS_STATUS, &val);
> > +	if (val & HPDETECT)
> > +		return connector_status_connected;
> > +	else
> > +		return connector_status_disconnected; }
> > +
> > +static enum drm_connector_status
> > +it6263_connector_detect(struct drm_connector *connector, bool force) {
> > +	struct it6263 *it =3D connector_to_it6263(connector);
> > +
> > +	return it6263_detect(it);
> > +}
> > +
> > +static const struct drm_connector_funcs it6263_connector_funcs =3D {
> > +	.detect =3D it6263_connector_detect,
> > +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> > +	.destroy =3D drm_connector_cleanup,
> > +	.reset =3D drm_atomic_helper_connector_reset,
> > +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_sta=
te,
> > +	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
> > +};
> > +
> > +static int it6263_read_edid(void *data, u8 *buf, unsigned int block,
> > +size_t len) {
> > +	struct it6263 *it =3D data;
> > +	struct regmap *regmap =3D it->hdmi_regmap;
> > +	unsigned int start =3D (block % 2) * EDID_LENGTH;
> > +	unsigned int segment =3D block >> 1;
> > +	unsigned int count, val;
> > +	int ret;
> > +
> > +	regmap_write(regmap, HDMI_REG_DDC_MASTER_CTRL, MASTER_SEL_HOST);
> > +	regmap_write(regmap, HDMI_REG_DDC_HEADER, DDC_ADDR << 1);
> > +	regmap_write(regmap, HDMI_REG_DDC_EDIDSEG, segment);
> > +
> > +	while (len) {
> > +		/* clear DDC FIFO */
> > +		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_FIFO_CLR);
> > +
> > +		ret =3D regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS,
> > +					       val, val & DDC_DONE,
> > +					       2000, 10000);
> > +		if (ret) {
> > +			dev_err(it->dev, "failed to clear DDC FIFO:%d\n", ret);
> > +			return ret;
> > +		}
> > +
> > +		count =3D len > HDMI_DDC_FIFO_BYTES ? HDMI_DDC_FIFO_BYTES : len;
> > +
> > +		/* fire the read command */
> > +		regmap_write(regmap, HDMI_REG_DDC_REQOFF, start);
> > +		regmap_write(regmap, HDMI_REG_DDC_REQCOUNT, count);
> > +		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_EDID_READ);
> > +
> > +		start +=3D count;
> > +		len -=3D count;
> > +
> > +		ret =3D regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS, val,
> > +					       val & (DDC_DONE | DDC_ERROR),
> > +					       20000, 250000);
> > +		if (ret && !(val & DDC_ERROR)) {
> > +			dev_err(it->dev, "failed to read EDID:%d\n", ret);
> > +			return ret;
> > +		}
> > +
> > +		if (val & DDC_ERROR) {
> > +			dev_err(it->dev, "DDC error\n");
> > +			return -EIO;
> > +		}
> > +
> > +		/* cache to buffer */
> > +		for (; count > 0; count--) {
> > +			regmap_read(regmap, HDMI_REG_DDC_READFIFO, &val);
> > +			*(buf++) =3D val;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int it6263_connector_get_modes(struct drm_connector
> > +*connector) {
> > +	struct it6263 *it =3D connector_to_it6263(connector);
> > +	const struct drm_edid *drm_edid;
> > +	int count;
> > +
> > +	drm_edid =3D drm_edid_read_custom(connector, it6263_read_edid, it);
> > +
> > +	drm_edid_connector_update(connector, drm_edid);
> > +	count =3D drm_edid_connector_add_modes(connector);
> > +
> > +	drm_edid_free(drm_edid);
> > +
> > +	return count;
> > +}
> > +
> > +static const struct drm_connector_helper_funcs it6263_connector_helper=
_funcs =3D {
> > +	.get_modes =3D it6263_connector_get_modes, };
> > +
> > +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
> > +				      struct drm_bridge_state *bridge_state,
> > +				      struct drm_crtc_state *crtc_state,
> > +				      struct drm_connector_state *conn_state) {
> > +	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> > +
> > +	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? -EINVAL : 0; }
> > +
> > +static void
> > +it6263_bridge_atomic_disable(struct drm_bridge *bridge,
> > +			     struct drm_bridge_state *old_bridge_state) {
> > +	struct it6263 *it =3D bridge_to_it6263(bridge);
> > +
> > +	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, AVMUTE, AVMUTE);
> > +	regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
> > +	regmap_write(it->hdmi_regmap, HDMI_REG_AFE_DRV_CTRL,
> > +		     AFE_DRV_RST | AFE_DRV_PWD);
> > +}
> > +
> > +static void
> > +it6263_bridge_atomic_enable(struct drm_bridge *bridge,
> > +			    struct drm_bridge_state *old_bridge_state) {
> > +	struct drm_atomic_state *state =3D old_bridge_state->base.state;
> > +	struct it6263 *it =3D bridge_to_it6263(bridge);
> > +	const struct drm_crtc_state *crtc_state;
> > +	struct regmap *regmap =3D it->hdmi_regmap;
> > +	const struct drm_display_mode *mode;
> > +	struct drm_connector *connector;
> > +	bool is_stable =3D false;
> > +	struct drm_crtc *crtc;
> > +	unsigned int val;
> > +	bool pclk_high;
> > +	int i, ret;
> > +
> > +	connector =3D drm_atomic_get_new_connector_for_encoder(state,
> > +							     bridge->encoder);
> > +	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
> > +	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > +	mode =3D &crtc_state->adjusted_mode;
> > +
> > +	regmap_write(regmap, HDMI_REG_HDMI_MODE, TX_HDMI_MODE);
> > +
> > +	/* HDMI AFE setup */
> > +	pclk_high =3D mode->clock > HIGH_PIXEL_CLOCK_KHZ ? true : false;
> > +	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, AFE_DRV_RST);
> > +	if (pclk_high)
> > +		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
> > +			     AFE_XP_GAINBIT | AFE_XP_RESETB);
> > +	else
> > +		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
> > +			     AFE_XP_ER0 | AFE_XP_RESETB);
> > +	regmap_write(regmap, HDMI_REG_AFE_ISW_CTRL, 0x10);
> > +	if (pclk_high)
> > +		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
> > +			     AFE_IP_GAINBIT | AFE_IP_RESETB);
> > +	else
> > +		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
> > +			     AFE_IP_ER0 | AFE_IP_RESETB);
> > +
> > +	/* HDMI software video reset */
> > +	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, SOFTV_RST);
> > +	fsleep(1000);
> > +	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, 0);
> > +
> > +	/* reconfigure LVDS and retry several times in case video is instable=
 */
> > +	for (i =3D 0; i < 3; i++) {
> > +		ret =3D regmap_read_poll_timeout(regmap, HDMI_REG_SYS_STATUS, val,
> > +					       val & TXVIDSTABLE,
> > +					       20000, 500000);
> > +		if (!ret) {
> > +			is_stable =3D true;
> > +			break;
> > +		}
> > +
> > +		it6263_lvds_config(it);
> > +	}
> > +
> > +	if (!is_stable)
> > +		dev_warn(it->dev, "failed to wait for video stable\n");
> > +
> > +	/* HDMI AFE reset release and power up */
> > +	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, 0);
> > +
> > +	regmap_write_bits(regmap, HDMI_REG_GCP, AVMUTE, 0);
> > +
> > +	regmap_write(regmap, HDMI_REG_PKT_GENERAL_CTRL, ENABLE_PKT |
> > +REPEAT_PKT); }
> > +
> > +static enum drm_mode_status
> > +it6263_bridge_mode_valid(struct drm_bridge *bridge,
> > +			 const struct drm_display_info *info,
> > +			 const struct drm_display_mode *mode) {
> > +	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? MODE_CLOCK_HIGH :
> > +MODE_OK; }
> > +
> > +static int it6263_bridge_attach(struct drm_bridge *bridge,
> > +				enum drm_bridge_attach_flags flags) {
> > +	struct it6263 *it =3D bridge_to_it6263(bridge);
> > +	int ret;
> > +
> > +	ret =3D drm_bridge_attach(bridge->encoder, it->next_bridge, bridge,
> > +				flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> > +		return 0;
> > +
> > +	it->connector.polled =3D DRM_CONNECTOR_POLL_CONNECT |
> > +			       DRM_CONNECTOR_POLL_DISCONNECT;
> > +
> > +	ret =3D drm_connector_init(bridge->dev, &it->connector,
> > +				 &it6263_connector_funcs,
> > +				 DRM_MODE_CONNECTOR_HDMIA);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm_connector_helper_add(&it->connector,
> > +				 &it6263_connector_helper_funcs);
> > +	drm_connector_attach_encoder(&it->connector, bridge->encoder);
> > +
> > +	return 0;
> > +}
> > +
> > +static enum drm_connector_status it6263_bridge_detect(struct
> > +drm_bridge
> > +*bridge) {
> > +	struct it6263 *it =3D bridge_to_it6263(bridge);
> > +
> > +	return it6263_detect(it);
> > +}
> > +
> > +static const struct drm_edid *
> > +it6263_bridge_edid_read(struct drm_bridge *bridge,
> > +			struct drm_connector *connector)
> > +{
> > +	struct it6263 *it =3D bridge_to_it6263(bridge);
> > +
> > +	return drm_edid_read_custom(connector, it6263_read_edid, it); }
> > +
> > +static u32 *
> > +it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +					struct drm_bridge_state *bridge_state,
> > +					struct drm_crtc_state *crtc_state,
> > +					struct drm_connector_state *conn_state,
> > +					u32 output_fmt,
> > +					unsigned int *num_input_fmts)
> > +{
> > +	u32 *input_fmts;
> > +
> > +	input_fmts =3D kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> > +	if (!input_fmts) {
> > +		*num_input_fmts =3D 0;
> > +		return NULL;
> > +	}
> > +
> > +	input_fmts[0] =3D MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
>=20
> Why is it hardcoded? What about supporting VESA??
>=20
> > +	*num_input_fmts =3D 1;
> > +
> > +	return input_fmts;
> > +}
> > +
> > +static const struct drm_bridge_funcs it6263_bridge_funcs =3D {
> > +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +	.attach =3D it6263_bridge_attach,
> > +	.mode_valid =3D it6263_bridge_mode_valid,
> > +	.atomic_disable =3D it6263_bridge_atomic_disable,
> > +	.atomic_enable =3D it6263_bridge_atomic_enable,
> > +	.atomic_check =3D it6263_bridge_atomic_check,
> > +	.detect =3D it6263_bridge_detect,
> > +	.edid_read =3D it6263_bridge_edid_read,
> > +	.atomic_get_input_bus_fmts =3D
> > +it6263_bridge_atomic_get_input_bus_fmts,
> > +};

Like [1]
static const struct drm_bridge_funcs it6263_bridge_funcs =3D {
	.attach =3D it6263_bridge_attach,
	.mode_set =3D it6263_bridge_mode_set,
	.disable =3D it6263_bridge_disable,
	.enable =3D it6263_bridge_enable,
	.get_edid =3D it6263_bridge_get_edid,
	.detect =3D it6263_bridge_detect,
};

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/bridge/adv7511/adv7511_drv.c?h=3Dv6.12-rc1#n998

Is it not sufficient for your use case??

Cheers,
Biju

> > +
> > +static int it6263_probe(struct i2c_client *client) {
> > +	struct device *dev =3D &client->dev;
> > +	struct it6263 *it;
> > +	int ret;
> > +
> > +	it =3D devm_kzalloc(dev, sizeof(*it), GFP_KERNEL);
> > +	if (!it)
> > +		return -ENOMEM;
> > +
> > +	it->dev =3D dev;
> > +	it->hdmi_i2c =3D client;
> > +
> > +	it->hdmi_regmap =3D devm_regmap_init_i2c(client,
> > +					       &it6263_hdmi_regmap_config);
> > +	if (IS_ERR(it->hdmi_regmap))
> > +		return dev_err_probe(dev, PTR_ERR(it->hdmi_regmap),
> > +				     "failed to init I2C regmap for HDMI\n");
> > +
> > +	it->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LO=
W);
> > +	if (IS_ERR(it->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(it->reset_gpio),
> > +				     "failed to get reset gpio\n");
> > +
> > +	ret =3D devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it6263_supplie=
s),
> > +					     it6263_supplies);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to get power supplies\n");
> > +
> > +	ret =3D it6263_parse_dt(it);
> > +	if (ret)
> > +		return ret;
> > +
> > +	it6263_reset(it);
> > +
> > +	ret =3D it6263_lvds_set_i2c_addr(it);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to set I2C addr\n");
> > +
> > +	it->lvds_i2c =3D devm_i2c_new_dummy_device(dev, client->adapter,
> > +						 LVDS_INPUT_CTRL_I2C_ADDR);
> > +	if (IS_ERR(it->lvds_i2c))
> > +		dev_err_probe(it->dev, PTR_ERR(it->lvds_i2c),
> > +			      "failed to allocate I2C device for LVDS\n");
>=20
> Maybe use action_or_reset and call i2c_unregister_device();
>=20
> > +
> > +	it->lvds_regmap =3D devm_regmap_init_i2c(it->lvds_i2c,
> > +					       &it6263_lvds_regmap_config);
> > +	if (IS_ERR(it->lvds_regmap))
> > +		return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
> > +				     "failed to init I2C regmap for LVDS\n");
>=20
> > +
> > +	it6263_lvds_config(it);
> > +	it6263_hdmi_config(it);
>=20
> > +
> > +	i2c_set_clientdata(client, it);
> > +
> > +	it->bridge.funcs =3D &it6263_bridge_funcs;
> > +	it->bridge.of_node =3D dev->of_node;
> > +	it->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
>=20
> 	it->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA; ??
>=20
> > +	drm_bridge_add(&it->bridge);
> > +
> > +	return 0;
> > +}
> > +
> > +static void it6263_remove(struct i2c_client *client) {
> > +	struct it6263 *it =3D i2c_get_clientdata(client);
> > +
> > +	drm_bridge_remove(&it->bridge);
>=20
> > +}
> > +
> > +static const struct of_device_id it6263_of_match[] =3D {
> > +	{ .compatible =3D "ite,it6263", },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, it6263_of_match);
> > +
> > +static const struct i2c_device_id it6263_i2c_ids[] =3D {
> > +	{ "it6263", 0 },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, it6263_i2c_ids);
> > +
> > +static struct i2c_driver it6263_driver =3D {
> > +	.probe =3D it6263_probe,
> > +	.remove =3D it6263_remove,
> > +	.driver =3D {
> > +		.name =3D "it6263",
> > +		.of_match_table =3D it6263_of_match,
> > +	},
> > +	.id_table =3D it6263_i2c_ids,
> > +};
> > +module_i2c_driver(it6263_driver);
> > +
> > +MODULE_DESCRIPTION("ITE Tech. Inc. IT6263 LVDS/HDMI bridge");
> > +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.34.1
> >

