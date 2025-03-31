Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B043DA761F5
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 10:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F11310E00F;
	Mon, 31 Mar 2025 08:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="T3R9lMPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2128.outbound.protection.outlook.com [40.107.223.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6D110E00F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 08:28:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbiYZmM1WGeUmx2AoM46qeAif3gClZcFe+vRVAYX2Z+QzHWU5MuT4Py8Oic6g0srwKj6QP5vfxJjPZFopQiZ/ocmdpy1GsDXDvZchEwathXN3DBOPuCVfGnp2092zMOnGqzOrwYuAtqh3r7zI2M5SOnzlFq8dRje9eVOY4/xfjJ4eFVP9n6wGZwYGq/ir7DOpUS82WvuXZ0mpQSBSVk/AmhMKFzo5BwI3lResGIz702FbzahfVtL0oZagHsHpp9IO9kYaNHucvYj39Xhwcf540dwwLWYydpk6XjR9Z/6rl1aL2jyDC1c4rUUpOprXR2iyqN81DWFTB/MgChWkpPd7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOE2TGaUPGFMXACiWLwO92nk7vazocyEwmCWrJgY4Sk=;
 b=SweYCF4tyafrVEjN0Oi/sHg0R+ChwimgQuAq/4sFj0M59BItb48QmG1sDgFzqFCVOMQvYtnO36EhkjbN7pdAlVDeZWDn3zNtpxn6luyDCEyspe6vgS2ExUu2qt85k2uo7E3Sv+vaUXTDeK3Q21g9tj1c3FXG85w/ZRM7gR3Hh2sTUZQTL/dJzmaPoBZDiPc4btTVEAtFDNJbQtxlZt5W1IzO2CS/OpatZQL2wKvcDIOA7b2jk5of0Vaj9fFwXaz+uZ99rqTtN8GW+6IO0WgjIcPhzyHBdX36Y3rM0n5PQWJ+jpjGeAfjHAoA1PEC0sWrJO3PbWtojTYjT4JY/yZR6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOE2TGaUPGFMXACiWLwO92nk7vazocyEwmCWrJgY4Sk=;
 b=T3R9lMPlxzPdJXVpeM/WWho8aqrNUPseSa2AuzOsPS+ZWaCG2Gj8Z1gOV7q64cShI3V2IxGdGJIITmNGO9YNHjMBZj2CgXOxFMcfqe0g35G2mnodiidcYXkIIZjkEn/fh1GgodkxC3zBpvDmxC8gAhpDfJ/+QB5Pe5VxMkYvry4=
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SA1PR04MB9042.namprd04.prod.outlook.com (2603:10b6:806:388::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 08:28:32 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%5]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 08:28:31 +0000
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
Thread-Index: AQHbnw9SQTT4hmIf/0SCVgI7dUd8+LOL9jcAgADH4BCAACCmAIAAD/tg
Date: Mon, 31 Mar 2025 08:28:31 +0000
Message-ID: <BY5PR04MB6739C321FE74A642AEDEB6B2C7AD2@BY5PR04MB6739.namprd04.prod.outlook.com>
References: <20250327115616.1271635-1-xji@analogixsemi.com>
 <gs2pn7o33hjzfpljzjprorof3xehhui5mvsrbnnpu4gwyncw5u@zvlez4dpgv3f>
 <BY5PR04MB6739BEDCE701FBC346106E21C7AD2@BY5PR04MB6739.namprd04.prod.outlook.com>
 <z5uepwsk6t6j5zlkrfrkcuodcmx477b7wr7smziwj4nf3avhv2@p7bqiun4yxb7>
In-Reply-To: <z5uepwsk6t6j5zlkrfrkcuodcmx477b7wr7smziwj4nf3avhv2@p7bqiun4yxb7>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB6739:EE_|SA1PR04MB9042:EE_
x-ms-office365-filtering-correlation-id: 59d80ed8-2448-4a33-fe1e-08dd702e053a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?fCsV6KVpnjJGO2drEeuaF/mx7JfyJNVBSQbyMkfhOoCcnB3HgZmaTd7n33zt?=
 =?us-ascii?Q?B/s+HWCv1BkPRwT19JsBl/bPODoboQu8tR9NtNciJeGbUToYYw5FXvs6vH5W?=
 =?us-ascii?Q?Sb1vUbIpeKNSsyrYSK4iKRhAIbLhHdr85toP59sqGXY/w847xk6yPcEPyzYw?=
 =?us-ascii?Q?W7wxRJIVrK0/3H8OrzIQwHKJz4OhLvf5gdDCBsIBetObAsKjBJlcuPekA+hj?=
 =?us-ascii?Q?BZNfAQSZ6ZuDHoeiLD4eMiUbDhDWoxJvPRFX8/KeGFert1qOoUMZmnuhkYQf?=
 =?us-ascii?Q?XfD3l8X7PQP3Ctzym+2gZPVOwuMEjt7p/c5Z6lXs3fYb7QrrYHvPIQd5q0ui?=
 =?us-ascii?Q?PwygQ5cBcVcwkgVSWh2k4LL2R+3UXWpo6lx3M4G6hUhKRWsdDi4JflVIzrL9?=
 =?us-ascii?Q?6a1+mL9W/cCpJjvt30fCg7jhXxGByooL/5n31Ek5So1KgezXxz271OG5zkqX?=
 =?us-ascii?Q?TDrEZXmx2c5a98alkGcONq0s+7w9qY1GvTPpoSEYGCZ7fKwwYOwwzkzda9o0?=
 =?us-ascii?Q?YcoiWjmQovgZhPdYninCmgTLHcxEZfSD9kbEo/UpYSaADo1Z4i6oKexLh2wT?=
 =?us-ascii?Q?q9R4VOs4re7gccJBId6L4WiLU1mnMTF3rZ7czrtnEWqWfntW/82VvH6LE4TU?=
 =?us-ascii?Q?5w4Hn6dLyY7Cki1h7OF1O9mWipSmWFISRbgS6+f3gUNiXB7oYHZz4AR2J+J6?=
 =?us-ascii?Q?1ATzsF7cSr2kJ44tVbBkXKKxD88uBVWONSUTOKGP/quJsfCQoA+jgDu8pzFk?=
 =?us-ascii?Q?+ifo8vT1sO1Gthh/Sgyae8Us9pRh8xOwGcwHk+4DAXEPUrPWesbka+BDA5Mw?=
 =?us-ascii?Q?utVyBgcCrZMGqwc2l1chQISKl6yg58zxSNRcY7XIQ6TJ1dhS4nRPIHBk5s4H?=
 =?us-ascii?Q?siDqSlbXbXIz0XMXQyisQB5cR/3gtlt5IhTdHwsLiz0F6idLVl9PqHOs3OBQ?=
 =?us-ascii?Q?LX8PkDuHyGvjF3IhMfR062rDcEdMLaQcxEE4I3IdlzC1CMYpcPSj7/3xk7zP?=
 =?us-ascii?Q?EC4U/qCsfyZPGE+nBshOHbK7p3WcRpp++AKPsbi5F3Ye/zfGP+nFmze2cfcf?=
 =?us-ascii?Q?N+3Vjn8/8xTgCU0+0405WPcM1deGG7xR7GE0N/H4OcZpFAf5Sgfzv0Anerff?=
 =?us-ascii?Q?DPFkLDMrZD0bLGAC9Bhx9Gg7B70yM6rJuUVKwJ5PEIf/o0+nWj9kVtcuzLG8?=
 =?us-ascii?Q?cl3GuHk/iKynqc3AjCDQ+iOI38nqX4kV2bnI3s+KdZEdCBAEHAyaP7+SHocZ?=
 =?us-ascii?Q?QgdQAZv46bmnAsgLDrw7pHu4xvRcT/XhgT1507c8UrDZxyxmxLX/KN92Z0/1?=
 =?us-ascii?Q?la0zdkuPKVZmE1/1nNUu58ZOoPeaDfV6LErI4mjC3D8XiMf+ztKXDy3HQTY9?=
 =?us-ascii?Q?JXRB8fuuIG0eWkGAcs2mHG8XexAQKUHd3mYkN55BU2KARqFjtWNot3mfvvCt?=
 =?us-ascii?Q?0G7h/Z3EaElGyaDeHZ1spxBaBhB15/oP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+Jwo/63tXXQuXT3pHTZq/3nD5APwIrOHS1TzWTUqZJ/gW5hKf3DF2DCouwxH?=
 =?us-ascii?Q?XUsRCunn6rualqfORYOQ1x5ziHghwAsrDR/VqMSzI3pDAwlSyvvHhuCJJC+d?=
 =?us-ascii?Q?+SZzzxSrmsJH9vOY07JeP5t0K0TApdAfFL1nyjFmTnDo3mQbZ7k5IaBxd3BH?=
 =?us-ascii?Q?c4rgncZKhF7zmRtWeNuMyR2ZLZmeSepjjCEGeFcaEq7DZSoka/QD4OrVsgat?=
 =?us-ascii?Q?r0d4ph6TYQG3eMqY9U7q/PeyyxpXmpw6LQ8MbqemREndbyWbSzBQ6wwQlDCg?=
 =?us-ascii?Q?r5lleiWPq0aouUoQdIQjiLao8xnkZKgqVC4NYXaQb2DZGT8kbz8yw1JSzjVL?=
 =?us-ascii?Q?olWrUIhw8ba/KCzIADfqbV5Y2IDpnosRA57trRse9pv6MNW4ebSpUDwGZZzH?=
 =?us-ascii?Q?G0WWlKMeyYZn1T3g9r+OXqA0OFijDKPaQVtuKjrTKyURLtLeWHCMiPELF07w?=
 =?us-ascii?Q?QylORfikJvp3PTGaEJ+2b2AwNoKdkYPwvbUwV6bivGPqj+ItNCP3bJsUx545?=
 =?us-ascii?Q?xISJ6yCLzJNXH4ZwozvOh5/Z+om7YpOjDHB8L7ufN2KC+2Fiyodcx0gmazaX?=
 =?us-ascii?Q?Kv0NH7EBP/aw4Yf9w6pK32NFLJv+li0v1fPGyYxCJtbWcPDfDBk7h3xg1Ewh?=
 =?us-ascii?Q?N6ECZ5RMuapphukBVzzrXRFSDwpGSYC5zk6qDUAV0iBQHBoYONuFGiIk6NO+?=
 =?us-ascii?Q?BebAcBNmnLqhgEUs45oxne+9Glkvph3EyWn04FbY1lnaO63iomRtIBmMCHY0?=
 =?us-ascii?Q?e13Mpswq3Bi0BR1KKXU14++3FerfpyMmJVdZNWwFwZxNpH3wqjQwm+ZnsQ5t?=
 =?us-ascii?Q?ROal7dWHzmDjTCZn0P6YfHcpQKcgkLFvp/7Sf3ZrGSUH6x8/gAJMC15evq7+?=
 =?us-ascii?Q?lSyAvGtMBJHv3Q/G/jjqYqDTix97WExPVdeGAG0yqu7RStF+Q4sv3b9Qtjav?=
 =?us-ascii?Q?OEbUQ2XeDlffj8nEovbWo/OFj2/Sh8FrY12EMkL65xirDdAuGrFfN0bEyACe?=
 =?us-ascii?Q?eEKZgy+m+kWwuF0vTFZqok9TmXNFlesLYj1q6EtseQsVNRTcEC25Qa1ZPxsF?=
 =?us-ascii?Q?Qs/nucBxUnndKbaMdqsunb6aezMi8rddt5cKQ5bQwNwfdBH4Yv/+TGwoxdYg?=
 =?us-ascii?Q?7dLLqVB28goiUsxBr64h283FIqLGmgOVF6WNKGbTw3ukTgzCf9BVtOc2GFQR?=
 =?us-ascii?Q?ETBlLHvDMmUCzTBIZDDSRb0qtBu9Ju2bnvbdC716C+P29Ll8DC+T1dC139js?=
 =?us-ascii?Q?GoyDQtKuCp2X6GzY2RvhjmBIA0HiViRHvl/O4wppD+8icw6+LAbmeU19+hZN?=
 =?us-ascii?Q?Qpt8GLdexnOH3BZtaFvHaY7cd3XkizcKfOEMG09fAPMO3diZ6CfL6MNNMrcK?=
 =?us-ascii?Q?E//m42mYLHPnSQP//mvLr5f04vO4ugS9Xo6+1sGcwqRnUxCm55c0ZdT/luI5?=
 =?us-ascii?Q?U67C4Iw/WsKpz+ohm+q73xyBWT4C6ja+r2rQonbKNfTWnWCx8lNcOHPcnM4J?=
 =?us-ascii?Q?GjIUCtVQjB28Z3crKOpVuWooBn9Rcx6Vgfrjho+tHx3o0BXmSSPzhmaCTy6t?=
 =?us-ascii?Q?IJ4iUKLGoCMBDLwcJ6cJE9PZpfKnRGfvxsXbbG7D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d80ed8-2448-4a33-fe1e-08dd702e053a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 08:28:31.4783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +hoi6qqztGsFjrwjimaetpbKjsFRGpOcZjSzD8zne3D6arAX6dOwOlXxdmPFvdsZjmrHJ2BKxXolXCXnM8t3Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR04MB9042
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

> > > > 4K30(3840x2160 30Hz) timing pixel clock around 297M, for 24bits
> > > > RGB pixel data format, total transport bandwidth need 297M*24(at
> > > > least
> > > > 7.2Gbps) more than anx7625 mipi rx lane bandwidth(maximum 6Gbps,
> > > > 4lanes, each lane 1.5Gbps). Without DSC function, anx7625 cannot
> > > > receive 4K30 video timing.
> > > >
> > > > When display pixel clock exceed 250M, driver will enable DSC
> > > > feature, and the compression ratio is 3:1, eg: 4K30's pixel clock
> > > > around 297M, bandwidth 7.2G will be compressed to 7.2G/3 =3D 2.4G.
> > > > Then anx7625 can receive 4K30 video timing and do decompress, then
> > > > package video data and send to sink device through DP link.
> > > >
> > > > Anx7625 is bridge IC, sink monitor only receive normal DP signal
> > > > from anx7625, sink device didn't know DSC information between SOC
> > > > and
> > > > anx7625
> > > >
> > > > v2:
> > > > 1. Add more commit message
> > > > 2. Remove unused code
> > > > 3. Add more comment
> > >
> > > This part is useless, it adds no information. It is as good as 'chang=
ed it'.
> > OK, I'll remove it
> > >
> > > > 4. Remove dsc_en flag
> > > >
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 299
> > > > ++++++++++++++++++----  drivers/gpu/drm/bridge/analogix/anx7625.h
> > > > ++++++++++++++++++|
> > > > 31 +++
> > > >  2 files changed, 274 insertions(+), 56 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > index 4be34d5c7a3b..bae76d9a665f 100644
> > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > @@ -9,6 +9,7 @@
> > > >  #include <linux/interrupt.h>
> > > >  #include <linux/iopoll.h>
> > > >  #include <linux/kernel.h>
> > > > +#include <linux/math64.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/mutex.h>
> > > >  #include <linux/pm_runtime.h>
> > > > @@ -22,6 +23,7 @@
> > > >
> > > >  #include <drm/display/drm_dp_aux_bus.h>  #include
> > > > <drm/display/drm_dp_helper.h>
> > > > +#include <drm/display/drm_dsc_helper.h>
> > > >  #include <drm/display/drm_hdcp_helper.h>  #include
> > > > <drm/drm_atomic_helper.h>  #include <drm/drm_bridge.h> @@ -476,11
> > > > +478,159 @@ static int anx7625_set_k_value(struct anx7625_data
> > > > +*ctx)
> > > >                                MIPI_DIGITAL_ADJ_1, 0x3D);  }
> > > >
> > > > +static bool anx7625_dsc_check(struct anx7625_data *ctx) {
> > > > +     if (ctx->dt.pixelclock.min > DSC_PIXEL_CLOCK)
> > > > +             return true;
> > >
> > > So, now DSC is enabled unconditionally just because the clock is too
> > > high. Let's see...
> > Yes
> > >
> > > > +
> > > > +     return false;
> > > > +}
> > > > +
> > > > +static inline int anx7625_h_timing_reg_write(struct anx7625_data *=
ctx,
> > > > +                                          struct i2c_client *clien=
t,
> > > > +                                          u8 reg_addr, u16 val,
> > > > +                                          bool dsc_check) {
> > > > +     int ret;
> > > > +
> > > > +     if (dsc_check && anx7625_dsc_check(ctx))
> > > > +             val =3D dsc_div(val);
> > > > +
> > > > +     ret =3D anx7625_reg_write(ctx, client, reg_addr, val);
> > > > +     ret |=3D anx7625_reg_write(ctx, client, reg_addr + 1, val >>
> > > > + 8);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int anx7625_h_timing_write(struct anx7625_data *ctx,
> > > > +                               struct i2c_client *client,
> > > > +                               bool rx_h_timing) {
> > > > +     u16 htotal;
> > > > +     int ret;
> > > > +
> > > > +     htotal =3D ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > > > +                      ctx->dt.hback_porch.min + ctx->dt.hsync_len.=
min;
> > > > +     /* Htotal */
> > > > +     ret =3D anx7625_h_timing_reg_write(ctx, client,
> > > HORIZONTAL_TOTAL_PIXELS_L,
> > > > +                                      htotal, rx_h_timing);
> > > > +     /* Hactive */
> > > > +     ret |=3D anx7625_h_timing_reg_write(ctx, client,
> > > HORIZONTAL_ACTIVE_PIXELS_L,
> > > > +                                       ctx->dt.hactive.min, rx_h_t=
iming);
> > > > +     /* HFP */
> > > > +     ret |=3D anx7625_h_timing_reg_write(ctx, client,
> > > HORIZONTAL_FRONT_PORCH_L,
> > > > +                                       ctx->dt.hfront_porch.min, r=
x_h_timing);
> > > > +     /* HWS */
> > > > +     ret |=3D anx7625_h_timing_reg_write(ctx, client,
> > > HORIZONTAL_SYNC_WIDTH_L,
> > > > +                                       ctx->dt.hsync_len.min, rx_h=
_timing);
> > > > +     /* HBP */
> > > > +     ret |=3D anx7625_h_timing_reg_write(ctx, client,
> > > HORIZONTAL_BACK_PORCH_L,
> > > > +                                       ctx->dt.hback_porch.min,
> > > > + rx_h_timing);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int anx7625_v_timing_write(struct anx7625_data *ctx,
> > > > +                               struct i2c_client *client) {
> > > > +     int ret;
> > > > +
> > > > +     /* Vactive */
> > > > +     ret =3D anx7625_reg_write(ctx, client, ACTIVE_LINES_L,
> > > > +                             ctx->dt.vactive.min);
> > > > +     ret |=3D anx7625_reg_write(ctx, client, ACTIVE_LINES_H,
> > > > +                              ctx->dt.vactive.min >> 8);
> > > > +     /* VFP */
> > > > +     ret |=3D anx7625_reg_write(ctx, client, VERTICAL_FRONT_PORCH,
> > > > +                              ctx->dt.vfront_porch.min);
> > > > +     /* VWS */
> > > > +     ret |=3D anx7625_reg_write(ctx, client, VERTICAL_SYNC_WIDTH,
> > > > +                              ctx->dt.vsync_len.min);
> > > > +     /* VBP */
> > > > +     ret |=3D anx7625_reg_write(ctx, client, VERTICAL_BACK_PORCH,
> > > > +                              ctx->dt.vback_porch.min);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int anx7625_set_dsc_params(struct anx7625_data *ctx) {
> > > > +     int ret, i;
> > > > +     u16 htotal, vtotal;
> > > > +
> > > > +     if (!anx7625_dsc_check(ctx))
> > > > +             return 0;
> > > > +
> > > > +     /* Video Horizontal timing */
> > > > +     ret =3D anx7625_h_timing_write(ctx, ctx->i2c.tx_p2_client,
> > > > + false);
> > > > +
> > > > +     /* Video Vertical timing */
> > > > +     ret |=3D anx7625_v_timing_write(ctx, ctx->i2c.tx_p2_client);
> > > > +
> > > > +     /* Vtotal */
> > > > +     vtotal =3D ctx->dt.vactive.min + ctx->dt.vfront_porch.min +
> > > > +              ctx->dt.vback_porch.min + ctx->dt.vsync_len.min;
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_=
LINES_L,
> > > > +                              vtotal);
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTAL_=
LINES_H,
> > > > +                              vtotal >> 8);
> > > > +     /* Htotal */
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> TOTAL_PIXEL_L_7E,
> > > > +                              htotal);
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> TOTAL_PIXEL_H_7E,
> > > > +                              htotal >> 8);
> > > > +     /* Hactive */
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              ACTIVE_PIXEL_L_7E, ctx->dt.hactive.m=
in);
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              ACTIVE_PIXEL_H_7E, ctx->dt.hactive.m=
in >> 8);
> > > > +     /* HFP */
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              HORIZON_FRONT_PORCH_L_7E,
> > > > +                              ctx->dt.hfront_porch.min);
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              HORIZON_FRONT_PORCH_H_7E,
> > > > +                              ctx->dt.hfront_porch.min >> 8);
> > > > +     /* HWS */
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              HORIZON_SYNC_WIDTH_L_7E,
> > > > +                              ctx->dt.hsync_len.min);
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              HORIZON_SYNC_WIDTH_H_7E,
> > > > +                              ctx->dt.hsync_len.min >> 8);
> > > > +     /* HBP */
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              HORIZON_BACK_PORCH_L_7E,
> > > > +                              ctx->dt.hback_porch.min);
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > +                              HORIZON_BACK_PORCH_H_7E,
> > > > +                              ctx->dt.hback_porch.min >> 8);
> > > > +
> > > > +     /* Config DSC decoder internal blank timing for decoder to st=
art */
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > > +                              H_BLANK_L,
> > > > +                              dsc_div(htotal - ctx->dt.hactive.min=
));
> > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > > +                              H_BLANK_H,
> > > > +                              dsc_div(htotal -
> > > > + ctx->dt.hactive.min)
> > > > + >> 8);
> > > > +
> > > > +     /* Compress ratio  RATIO bit[7:6] */
> > > > +     ret |=3D anx7625_write_and(ctx, ctx->i2c.rx_p0_client, R_I2C_=
1, 0x3F);
> > > > +     ret |=3D anx7625_write_or(ctx, ctx->i2c.rx_p0_client, R_I2C_1=
,
> > > > +                             (5 - DSC_COMPRESS_RATIO) << 6);
> > > > +     /*PPS table*/
> > > > +     for (i =3D 0; i < PPS_SIZE; i +=3D PPS_BLOCK_SIZE)
> > > > +             ret |=3D anx7625_reg_block_write(ctx, ctx->i2c.rx_p2_=
client,
> > > > +                                            R_PPS_REG_0 + i, PPS_B=
LOCK_SIZE,
> > > > +                                            &ctx->pps_table[i]);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > >  static int anx7625_dsi_video_timing_config(struct anx7625_data
> > > > *ctx) {
> > > >       struct device *dev =3D ctx->dev;
> > > >       unsigned long m, n;
> > > > -     u16 htotal;
> > > >       int ret;
> > > >       u8 post_divider =3D 0;
> > > >
> > > > @@ -506,48 +656,12 @@ static int
> > > > anx7625_dsi_video_timing_config(struct
> > > anx7625_data *ctx)
> > > >       ret |=3D anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> > > >                               MIPI_LANE_CTRL_0,
> > > > ctx->pdata.mipi_lanes
> > > > - 1);
> > > >
> > > > -     /* Htotal */
> > > > -     htotal =3D ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > > > -             ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_TOTAL_PIXELS_L, htotal & 0xFF);
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_TOTAL_PIXELS_H, htotal >> 8);
> > > > -     /* Hactive */
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_ACTIVE_PIXELS_L, ctx->dt.hactive.m=
in & 0xFF);
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_ACTIVE_PIXELS_H, ctx->dt.hactive.m=
in >> 8);
> > > > -     /* HFP */
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_FRONT_PORCH_L, ctx->dt.hfront_porc=
h.min);
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_FRONT_PORCH_H,
> > > > -                     ctx->dt.hfront_porch.min >> 8);
> > > > -     /* HWS */
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_SYNC_WIDTH_L, ctx->dt.hsync_len.mi=
n);
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_SYNC_WIDTH_H, ctx->dt.hsync_len.mi=
n >> 8);
> > > > -     /* HBP */
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_BACK_PORCH_L, ctx->dt.hback_porch.=
min);
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     HORIZONTAL_BACK_PORCH_H, ctx->dt.hback_porch.=
min >> 8);
> > > > -     /* Vactive */
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE=
_LINES_L,
> > > > -                     ctx->dt.vactive.min);
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE=
_LINES_H,
> > > > -                     ctx->dt.vactive.min >> 8);
> > > > -     /* VFP */
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     VERTICAL_FRONT_PORCH, ctx->dt.vfront_porch.mi=
n);
> > > > -     /* VWS */
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     VERTICAL_SYNC_WIDTH, ctx->dt.vsync_len.min);
> > > > -     /* VBP */
> > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > -                     VERTICAL_BACK_PORCH, ctx->dt.vback_porch.min)=
;
> > > > +     /* Video Horizontal timing */
> > > > +     ret |=3D anx7625_h_timing_write(ctx, ctx->i2c.rx_p2_client,
> > > > + true);
> > > > +
> > > > +     /* Video Vertical timing */
> > > > +     ret |=3D anx7625_v_timing_write(ctx, ctx->i2c.rx_p2_client);
> > > > +
> > >
> > > Please split this part into two commits: one refactoring timing
> > > programming into two functions and another one introducing DSC suppor=
t.
> > > It is hard to review timing programming otherwise.
> >
> > OK
> >
> > >
> > > >       /* M value */
> > > >       ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > >                       MIPI_PLL_M_NUM_23_16, (m >> 16) & 0xff); @@
> > > > -663,9 +777,15 @@ static int anx7625_dsi_config(struct
> > > > anx7625_data
> > > > *ctx)
> > > >
> > > >       DRM_DEV_DEBUG_DRIVER(dev, "config dsi.\n");
> > > >
> > > > -     /* DSC disable */
> > > > -     ret =3D anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > > -                             R_DSC_CTRL_0, ~DSC_EN);
> > > > +     ret =3D anx7625_set_dsc_params(ctx);
> > > > +     if (anx7625_dsc_check(ctx))
> > > > +             /* DSC enable */
> > > > +             ret |=3D anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > > > +                                     R_DSC_CTRL_0, DSC_EN);
> > > > +     else
> > > > +             /* DSC disable */
> > > > +             ret |=3D anx7625_write_and(ctx, ctx->i2c.rx_p0_client=
,
> > > > +                                      R_DSC_CTRL_0, ~DSC_EN);
> > > >
> > > >       ret |=3D anx7625_api_dsi_config(ctx);
> > > >
> > > > @@ -2083,6 +2203,7 @@ static int anx7625_setup_dsi_device(struct
> > > anx7625_data *ctx)
> > > >               MIPI_DSI_MODE_VIDEO_HSE |
> > > >               MIPI_DSI_HS_PKT_END_ALIGNED;
> > > >
> > > > +     dsi->dsc =3D &ctx->dsc;
> > > >       ctx->dsi =3D dsi;
> > > >
> > > >       return 0;
> > > > @@ -2187,19 +2308,69 @@ anx7625_bridge_mode_valid(struct
> > > > drm_bridge
> > > *bridge,
> > > >       struct device *dev =3D ctx->dev;
> > > >
> > > >       DRM_DEV_DEBUG_DRIVER(dev, "drm mode checking\n");
> > > > +     if (mode->clock > SUPPORT_PIXEL_CLOCK)
> > > > +             return MODE_CLOCK_HIGH;
> > > > +
> > > > +     if (mode->clock < SUPPORT_MIN_PIXEL_CLOCK)
> > > > +             return MODE_CLOCK_LOW;
> > > >
> > > > -     /* Max 1200p at 5.4 Ghz, one lane, pixel clock 300M */
> > > > -     if (mode->clock > SUPPORT_PIXEL_CLOCK) {
> > > > -             DRM_DEV_DEBUG_DRIVER(dev,
> > > > -                                  "drm mode invalid, pixelclock to=
o high.\n");
> > >
> > > Any reason for dropping debug message?
> >
> > I'll keep this message.
> >
> > >
> > > > +     /*
> > > > +      * If hdisplay cannot be divided by DSC compress ratio, then =
display
> > > > +      * will have overlap/shift issue
> > > > +      */
> > > > +     if (mode->clock > DSC_PIXEL_CLOCK &&
> > > > +         (mode->hdisplay % DSC_COMPRESS_RATIO !=3D 0))
> > >
> > >
> > > ... and there still no check that the DSI host supports generating
> > > DSC data. Nor there is an atomic_check() that will check if the mode =
can be
> enabled.
> >
> > I cannot know whether the DSI host supports DSC or not. Anx7625 driver
> > force enable DSC feature if pixel clock higher than DSC_PIXEL_CLOCK.
>=20
> This is called upstream. Please work on necessary API changes rather than
> claiming that it is not possible. Enabling DSC support when DSC is not ha=
ndled by
> the DSI host is not acceptable.
>=20
> Few semi-random ideas:
> - Add DSC checking callbacks to struct mipi_dsi_host_ops. Assume that
>   DSC support is not available if callback is not present. The callback
>   should accept struct drm_dsc_config and populate const and RC params.
>=20
> - Add DSC-related flags to struct mipi_dsi_host, describing DSC feature
>   availability. Make anx7625 check those flags.

OK, I'll discuss with Chromium team and MTK DSI host team.

>=20
> >
> > >
> > > >               return MODE_CLOCK_HIGH;
> > > > -     }
> > > >
> > > >       DRM_DEV_DEBUG_DRIVER(dev, "drm mode valid.\n");
> > > >
> > > >       return MODE_OK;
> > > >  }
> > > >
> > > > +static void anx7625_dsc_enable(struct anx7625_data *ctx, bool en) =
{
> > > > +     int ret;
> > > > +     struct device *dev =3D ctx->dev;
> > > > +
> > > > +     if (en) {
> > > > +             ctx->dsc.dsc_version_major =3D 1;
> > > > +             ctx->dsc.dsc_version_minor =3D 1;
> > > > +             ctx->dsc.slice_height =3D 8;
> > > > +             ctx->dsc.slice_width =3D ctx->dt.hactive.min / DSC_SL=
ICE_NUM;
> > > > +             ctx->dsc.slice_count =3D DSC_SLICE_NUM;
> > > > +             ctx->dsc.bits_per_component =3D 8;
> > > > +             ctx->dsc.bits_per_pixel =3D 8 << 4; /* 4 fractional b=
its */
> > > > +             ctx->dsc.block_pred_enable =3D true;
> > > > +             ctx->dsc.native_420 =3D false;
> > > > +             ctx->dsc.native_422 =3D false;
> > > > +             ctx->dsc.simple_422 =3D false;
> > > > +             ctx->dsc.vbr_enable =3D false;
> > > > +             ctx->dsc.convert_rgb =3D 1;
> > > > +             ctx->dsc.vbr_enable =3D 0;
> > >
> > > Aren't those 'false' and '0' defaults? If so, you don't need to write=
 those
> fields.
> > Ok
> >
> > >
> > > > +
> > > > +             drm_dsc_set_rc_buf_thresh(&ctx->dsc);
> > > > +             drm_dsc_set_const_params(&ctx->dsc);
> > > > +
> > > > +             ctx->dsc.initial_scale_value =3D drm_dsc_initial_scal=
e_value(&ctx-
> >dsc);
> > > > +             ctx->dsc.line_buf_depth =3D ctx->dsc.bits_per_compone=
nt + 1;
> > > > +             ret =3D drm_dsc_setup_rc_params(&ctx->dsc, DRM_DSC_1_=
2_444);
> > > > +             if (ret < 0)
> > > > +                     dev_warn(dev, "drm_dsc_setup_rc_params ret
> > > > + %d\n", ret);
> > > > +
> > > > +             ret =3D drm_dsc_compute_rc_parameters(&ctx->dsc);
>=20
> BTW: these calls belong to the DSI host driver. See msm/dsi/dsi_host.c an=
d DSC-
> enabled panel drivers.
I'm not sure, this interface is suggested by MIPI host. Seems MTK MIPI host=
 driver didn't
call this interface.

>=20
> > > > +             if (ret)
> > > > +                     dev_warn(dev, "drm dsc compute rc parameters
> > > > + failed ret %d\n", ret);
>=20
> I think this should become an error rather than a warning.
OK

>=20
> > > > +
> > > > +             drm_dsc_pps_payload_pack((struct
> > > > + drm_dsc_picture_parameter_set
> > > *)&ctx->pps_table,
> > > > +                                      &ctx->dsc);
> > > > +             dev_dbg(dev, "anx7625 enable dsc\n");
> > > > +     } else {
> > > > +             ctx->dsc.dsc_version_major =3D 0;
> > > > +             ctx->dsc.dsc_version_minor =3D 0;
> > > > +             dev_dbg(dev, "anx7625 disable dsc\n");
> > > > +     }
> > > > +}
> > > > +
>=20
> --
> With best wishes
> Dmitry
