Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E08AC14CA
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5D110E95C;
	Thu, 22 May 2025 19:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wPGYdDTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2419210E71B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:26:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WY6JRYpnPTvVetpLEMpSf7CTzvFzuH+5Un3C3MBD2GzzwJ9ttTt73ZO7k8yqyqtsztRVwy9bKb8o5Q1To+C3VglMu3fAfkEhQCPh5cLdu9fG8oIUrh0h3pI4CYU2nKI5K8CFd0nTjDOvTt/8UCWXRD7MBBfVpd3qILdAIxtomCHFciIBoR2WwDs73iJzgM/YiwSyke51UxgqbWFb1pn/FR3ThSuPG+kRWZXDANZNd3dIbZUsfUuxs8t2XEYlQ58VOfIn6ZIy/L3BhD1dxylFoX/AF3ODdLpwfb2kSOe2gjD1me4eWDa8ZqnTRPLjuW1+TI2FUp9JhnreQOHnyLonWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsbhtfsG4eBevgC1tvossu2AA0ITSU61mzzEKX5Muu0=;
 b=Gv6RUzCUfoj2DVTigkQWp1MwGVSyB/QuqyqCF+5ivA9z26HLUAnO5rrw7kANLb8sPZHTmSWx9CS8Rq71q6DYwqn+uE3/eNOn4NXYw12kjjJ6nDZgh5RChzESPEGCfZhy/4Tu9Ran05QQ8lfjha/NL76TS0JwInTKd9LfrWG/CFQhf4nWRoUmxH+V/+xkvfEms+sXxC3vwohi5TaUYl4L3J+TsJXA7C6j3VspPIbZhKHDbkl1McWZzRspwYIGadkbN9oYeNaMAT6Lb2QeQtlhMQja5djUtXdxa7QeRrYBgtc8tzGgkuoKQgHSWhnJvX0Woa2EYYLxzflT51YSuzi1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsbhtfsG4eBevgC1tvossu2AA0ITSU61mzzEKX5Muu0=;
 b=wPGYdDTG0OsN6FZSrVsIDvXUinmMC0zZ9X/j1vnXDfsb7Sy2ZVDKI9madz6qbwidR4l+qYQSgr1Dp3orA7FFpH0aW/KP+li/JEXa7vvgIG3W89/va7D+5MCt4z0mBQdxUzBJOQ75P/7ll/eNecmTTjeSvGcu49vEDP8S6mTEOv8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB16004.jpnprd01.prod.outlook.com (2603:1096:604:3ec::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Thu, 22 May
 2025 19:26:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8769.021; Thu, 22 May 2025
 19:26:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Chris Brandt <Chris.Brandt@renesas.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>
Subject: RE: [PATCH v3 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI command
 support
Thread-Topic: [PATCH v3 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI
 command support
Thread-Index: AQHbyydT2d3anTEXM0CXN2vGc1WQM7Pe+rIwgAAKSQCAAALNQA==
Date: Thu, 22 May 2025 19:26:12 +0000
Message-ID: <TY3PR01MB1134675403AF1DFADD1A3B25D8699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250522143911.138077-1-hugo@hugovil.com>
 <TY3PR01MB113464412C75E0AC1928A4FBA8699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20250522151348.856a75a66cd87d8794500dc4@hugovil.com>
In-Reply-To: <20250522151348.856a75a66cd87d8794500dc4@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB16004:EE_
x-ms-office365-filtering-correlation-id: 6c8eb56d-84da-42a3-e55c-08dd99668353
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bWrOwY1HTV2xJ4p3zFrf70g1wrEOi361ODYEz2NW9TAmf+YCe9gjB19Gv1qv?=
 =?us-ascii?Q?5HuE/S0e9496OfzeH9V51N22kSApniTpjr4jBr2IE3FTLMVyBfTZf1SMZhXC?=
 =?us-ascii?Q?Kpy8kms7Ta6Xb4F2412W2dMnFrPg2RfbJ4rboSTL0gFt3zEmM92s4rNujdeT?=
 =?us-ascii?Q?4W2KheHn6fYWHeGF50Ik1x7W4HV4uc7QfI1yPn5189idfTKwlhl958wYxBxo?=
 =?us-ascii?Q?sK7fviL9WrD6J/Qguv1XSwp/2JlnThjK4+v/Yrz/E5bV+Ob9dqzqLu8wIMPm?=
 =?us-ascii?Q?OuyhXV1z3VCBA4z7Xwm2G2aSFzyDE8nJZhohXtkdTqf2d6qzyBX/2DsQIw/B?=
 =?us-ascii?Q?mToPd1q5fb0hCuwxpdmOZoy8hdVfwxqdXgXl/PKDiQzneX3SiQ0FRzWb+vd4?=
 =?us-ascii?Q?cZq9sXE1HWa3LZAH77wdtcNe94eD+3lmaixu391eYo0Ij2KQwjPFFfCQpXC1?=
 =?us-ascii?Q?DlYeiMKGMxHTo7e1Bh6ODmyiGxwIrkPFgB3fcyKNUdftoyONfXHZ+8FloSoQ?=
 =?us-ascii?Q?uuI+Pdq1OZKPaahrNz/r+IHkM95ABFAeshAUR8Mosi9mlx5gWg6soOdzUTr/?=
 =?us-ascii?Q?t3BMkLjNbqhmRiFkrsassBo90gPPeXxr/zxCP1k/YQTQhSmKdXlFd5JWkHcC?=
 =?us-ascii?Q?RMW9uh4exXvSImSEwon7El6DV+Nc7W/7ieTWsfqPtd4GvTxPuUaElvtTbmzJ?=
 =?us-ascii?Q?7UYm4+lL0jXAMNGKwUU0YFUT1g89ScBZwWxlNu90IDVAqbQxEwii91OAWYG3?=
 =?us-ascii?Q?TFP91XjI+J1ihE7p2LKTFsBuKKu6lvNK9Z9wVtYjn/YztJYb7BentwxtoAZF?=
 =?us-ascii?Q?lombd2Hkz1eZQrOvat/PfQ8tEKWJJQoKVKaH3plt/smG8ExTsythAdl0ne1G?=
 =?us-ascii?Q?qpyJp1Cd3Ybp2JmqzdPai2NNFJHbv5uCNbKeFeQUDYNBylSPahs/O/EQ27AW?=
 =?us-ascii?Q?I9UOyxe+cGNcOHN0sH4sPq1ubOCycIqCVbAoxkAZQPwOtg0Sm8d2HU6ll8Gm?=
 =?us-ascii?Q?jFPplPdZ7gqNzpSXrBuTbCGI/BHVN/KZKiyyu3LZoywQRHgUumpFOegrpeeN?=
 =?us-ascii?Q?6ol53U/4DGrOejZRtBlslDiPhwb1Lx0RllPwvQQ7ZXF9zCHaeXFtW0SInou3?=
 =?us-ascii?Q?fmHYwZ9GPhRLGxkz2GmOEa3D488c9S0B+Znzz3leOtucY7CMArz1534CWGJh?=
 =?us-ascii?Q?wjdtI56MrGpKapycQL4JN+cA7Rgm4kdYlp8N0JtMAP/IQBbepeAemljtHtsi?=
 =?us-ascii?Q?spiJBIgmhwFEn76Xo1cxohqd+qDOgenc+6RTCtGlV0h6i9Pq9d3qGOGqv1Cj?=
 =?us-ascii?Q?g5p0bmLUlhdYGu7ccyO3Rt7L7GpNVIlZ5Kdl5MMMkfxbZTDb/Q2KlIFDAyZr?=
 =?us-ascii?Q?n00YfTSXZvkIPqsjr9/33kNtbp+Qc3zcYDrHVI2on+n0RuYa+Y8SIMxIXdFf?=
 =?us-ascii?Q?YqDXKhl3NQope9Xiojq2J3CdvT8Yj54NIxMYJX9Cc0g56+orxpQW9Qt2geM/?=
 =?us-ascii?Q?5jeSifKFWBMHZpg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LHZU1PJr7n7ZGeuyeCAc9nqnvpI6gJ25vW6lie6DZqyDth0BgmX3TPNBgsuG?=
 =?us-ascii?Q?cT7LulYF1jdnCwX7KkwCEmmVD2Cwo9SQQroimHtXwtQqfRO+T3YtZkMmOrUw?=
 =?us-ascii?Q?/KUeCJcQ4DVoMPE48T8j7VX/acGFMkCk8gsTcd52z1/LEj7TRgmR2EaG+Mjw?=
 =?us-ascii?Q?n2t9TeNsRCUdoJrwO0RK02X8Mbv3IVDnAoC09V2ZYR1bUgj+Pv7aUMjwaPxt?=
 =?us-ascii?Q?WFZ2Nx17gxFrG9DMQRENV9+TfJM8mVoFK6c7mmLXN0PXiliV8fKgUoyw0038?=
 =?us-ascii?Q?nLly1gAfyCLD+p1cLFOOcQJN/3fz5LO33Ie7Jsk8G8VYZY2jNW4054uaXzHo?=
 =?us-ascii?Q?rXLU0hKyFTmPyoClrCLdl7x3+gFCC+JSFSd5Nz1SATwhYOWrBrSVv+81NJK3?=
 =?us-ascii?Q?oicTlR9Dnh9FZhOsXRMKWUJVFnudcf/hcnMz8M9DQKPnQBDdbuB4fMMWWgG+?=
 =?us-ascii?Q?vJLNQ8mGiSOoPyqOo8en4GvCNUUirqZ+/cESQou6pZi48nF2GRwRVABf8ILq?=
 =?us-ascii?Q?UwVAtpcprd9qbwQRduBWn+Bvt8o9bDG8FO81y0PvA9uHVFPJEKY5QciEPls+?=
 =?us-ascii?Q?T4yiSjVODe/TuDlrHdNyOFoC/i6/koUJ6G6EaHpkFMZJdMowvkb0vPrmmH63?=
 =?us-ascii?Q?DJ6cH9p5IAUnRHy/l2xsOrzTE8MzkTTGr9OaL4PNK6BRCUAWAikjFylNoo0z?=
 =?us-ascii?Q?73UsiqmyOspv0O7NC1K8h6r6ukQKj8DYf/HTRP+YdXBIVgvLqFIhZDNpEjEC?=
 =?us-ascii?Q?UkBEidpk7oxw1CJ++c/ofr1VoiAtSvkRUvZgHoAAs+2X6BuBtSg48ATUvBLe?=
 =?us-ascii?Q?c6sxWHPIJYZDnHwGbHe7apClejSIX4VclOx6VXH1gpC1ssRku2hGxLowZDOG?=
 =?us-ascii?Q?/waxAgpzM9whh/TSfMKzaLUMjdzG09Ufzdx7uTAqYTQULBO6nng89OoUcvdb?=
 =?us-ascii?Q?TdYR0itRoQoywpxlGlkKKIVv6TaJHE+dGmg9yRNKriRHo7KS/yHLP13lbeDq?=
 =?us-ascii?Q?McbPrPX1MBC1Y5Z1g4MNfgL84CPEtY4X3DLsa4o70Jj1LosaI26yR/dV9bF2?=
 =?us-ascii?Q?cH0ZE0JIyFP/krekMxRZnsQRCvuAR4kw6X+GMgi0siJ5fJ1dMTG4l9jmtKUP?=
 =?us-ascii?Q?UGPD0YdKzoZsHTDmrojQcDgJ8LykpliwtNoVoHrD8f5MTynBqZ4r+6bUCFJ/?=
 =?us-ascii?Q?P0rtb4MKd69OIoWR0fClQJSCDBHFtHEwrQosQ6KdgiN0sLZTHp+tXyMYYUMs?=
 =?us-ascii?Q?kBZDtve1abqqh/i+jkdvr+W5KSnbApLKt+yXu96j4mw+WD9NE02zDfRsOMm3?=
 =?us-ascii?Q?FzY0VJEnRvPAcWT8ojmf9ZypR9AlKmui2z2o9Twm5SKqRptp/IlaBrPbpEuO?=
 =?us-ascii?Q?4HqClZBUJXa/YScPy4cDTfHmMenDyUzfepNpp++eZmiqf7xe7NXr6hqaV0Ga?=
 =?us-ascii?Q?W+hyCoqVSt82BNjlklFFpr+9dpgblR0VQV8G2dsNYVaLpQT1OBU2KSad4Tu/?=
 =?us-ascii?Q?ZOp2rIl5XGxhvkQhgi2xreHyi+1PKtI7by0Y32jqQg6RSfpTesY6aW3sH2vk?=
 =?us-ascii?Q?1BHO793vGul0WGqyB3cJ5D0o46s1w02HeaXhbwKHpd2ZdIHjTE74R6Rq5VVu?=
 =?us-ascii?Q?pg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8eb56d-84da-42a3-e55c-08dd99668353
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 19:26:12.5164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RFTQXpaA+KdXKyelSic6DJsiijiBtxDD7p1q7Int/4cP/QJH2eDa5Jpp/vZo7qJ1MM2hPyZTJvd9UOhSRLKWOJVhChaKuSIzE8xAfA+QTaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16004
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

Hi Hugo,

> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: 22 May 2025 20:14
> Subject: Re: [PATCH v3 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI co=
mmand support
>=20
> On Thu, 22 May 2025 18:40:29 +0000
> Biju Das <biju.das.jz@bp.renesas.com> wrote:
>=20
> > Hi Hugo,
> >
> > Thanks for the patch.
> >
> > > -----Original Message-----
> > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > Sent: 22 May 2025 15:39
> > > Subject: [PATCH v3 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI
> > > command support
> > >
> > > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > >
> > > Hello,
> > > this patch series add support for sending MIPI DSI command packets
> > > to the Renesas RZ/G2L MIPI DSI driver.
> > >
> > > Tested on a custom board with a SolidRun RZ/G2L SOM, with two
> > > different LCD panels using the jd9365da and st7703 drivers.
> > >
> > > Tested short and long writes.
> > >
> > > Tested read of 1 byte, 2 bytes and long reads.
> >
> > I see tested-by tag for patch[1] and this patch series is conflict with=
 that patch.
>=20
> Hi Biju,
> there is no conflict per se for the moment, as these are two separate sub=
missions. Chris's patch is
> not part of this submission.
>=20
> I tested patch[1] by rebasing my series on top of Chris patch.
>=20
> > Can this patch series work without patch[1]? If yes, no issue.
>=20
> Yes it can.
>=20
>=20
> > Otherwise, you need to rebase your patch on top of [1] to avoid merge c=
onflict.
>=20
> Eventually, if Chris's patch is accepted before my series, I will rebase =
and resubmit then. Right now,
> it seems I cannot do it, because submitting my serie based on an "not yet=
 accepted" patch will result
> in the kernel test robot complaining (and rightly so). Unless there is a =
mean to specify that my serie
> depends on other unapplied patch...
>=20
> Ideally, it should have been easier if I could have integrated Chris's pa=
tch into my serie, but he
> preferred to send his patch alone since he felt that it could be accepted=
 more rapidly like this.

OK, I have added your patch + Chris's patch and tested with ADV7535 connect=
ed to display.
But the display is unstable. I need to figure out which patch is causing th=
e issue.

Cheers,
Biju
