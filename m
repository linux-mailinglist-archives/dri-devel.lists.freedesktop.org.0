Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8141CBEC87E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 08:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4A310E00A;
	Sat, 18 Oct 2025 06:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LPtbcMI2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013053.outbound.protection.outlook.com
 [52.101.83.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B616010E00A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 06:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQiRGLM9jZLPhHa3bSOaQ4BGTTSthwFQxCjgF0JOq415/90xgaxa764g9K+UsIWqIXHwi1NiiyllYtvMjIh4XsrWqc4rn1Q76Rx8HpB3+qKqxkN8xBpoZju92kh1CTmEO64VkwA1psvlJ7dvn7reY2O+lCQkFAllW4xnztHE6YgUMBj7CnoNu93DYwG5Qht2h4L5ggWHMJCyHQGF+B14pCj8HIHopV2I5WXKkGR2BjlqwrrOGj2z13TDwpAQh2OeDWu/TVYRGNE4bzZ9w0g8YBD8cms80VC95Sy0+aOIpN3/NvvoKGImOwVlY+F1gteqOAbarono6sfme8nGNj60Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYeUY9CPVsGQX7h3QK+B3fpUxokhB58izJojw6E+Kgg=;
 b=joWSYLqPmhUiCMlQhyccRU8cwzncQvFADEfuN0eK7ANTGdMitUcP77RdpIX/72WSC9pTGI1lhUAosiUCzn4sva68/PftlAfGzK0z/YJHc2bNA48oopZHuO4P/UsLgwEeEnTCoOWODVKTwbJmrEwEUKNouwWvGaoTtRdeMur+9zvyQ8xwXY2GiCsOio4OXhfXe3QBAuCukzyylDeCYH8KhaTCSLzfAJRtebZ3iPet4AqHkuVjlHyDTZpYUCmhxIvNmEw0ngXsH5NGckHI45of0q8DQyyqc+lquxFdougFP9xE2fRb83LwFyxCmIT4622usu/nIgn9opji5WwGwHgHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYeUY9CPVsGQX7h3QK+B3fpUxokhB58izJojw6E+Kgg=;
 b=LPtbcMI2aY63FfJIMacDRh4exhndAFHmUPAb2CavFxkFEn1eagT0IQ7ZJ6dIE8FvAPX/DQ7dtXvS/PZdFOFtF9OVzcCtU5ZzdKp+5NqvhKEhmeTrJpEPN9/v+FgylqlB6ZEeDESHlUV5F9iDmFihzvZVA6ItB7R6N4N/Pglr5p2KCTlv7C54GJByz8IJ54BiakjqgLxOAWAqxX1vTAuHUS/lqVA5kLQWKeAzi78dZ3xIaN5d+YGmXY7rP709op0X9bXz8wxlAWtap7rNOMwUWzFHOy+wqjWe//zKdIIv5SmZEfxEEPEaq6JjtDJ20lqvSEZl1do4lOYv45nZwHSomQ==
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10536.eurprd04.prod.outlook.com (2603:10a6:150:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Sat, 18 Oct
 2025 06:09:19 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.011; Sat, 18 Oct 2025
 06:09:19 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>, Rob Herring <robh@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Abel
 Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
Thread-Topic: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
Thread-Index: AQHcOtDlf1Bu1BAuLEKiX8ccDAMDsLTDOH8AgADVGwCAAm6KgIAA8u8g
Date: Sat, 18 Oct 2025 06:09:18 +0000
Message-ID: <AM7PR04MB7046685E946417FD795C810198F7A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
 <20251015132442.GA3241958-robh@kernel.org>
 <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
 <c712dae1-00a5-4cc0-baef-2ce014bd470f@mailbox.org>
In-Reply-To: <c712dae1-00a5-4cc0-baef-2ce014bd470f@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|GV1PR04MB10536:EE_
x-ms-office365-filtering-correlation-id: ef8c9bd9-04a9-4399-6489-08de0e0cdfd0
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|19092799006|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wEB3yB3pZMi9sMYv1RSlyScJXzVZOn7ZWduP9kkvsXE/DhkeeYw33t42PaGg?=
 =?us-ascii?Q?CcEpyn+Qjs2dtKhhI7yXIkgIPB2sdl4/zWE/NpykL71GZD7xmarVY03WwuX5?=
 =?us-ascii?Q?0Mc0AkzVb+HX/FSXvhRf4fC9R1IzT/6FEimz6oIA8n7D+x+E4VIvg1bNyYXt?=
 =?us-ascii?Q?XMeB15/XJEUfjAfn6xD+iErp+GPpPQupkN9gulMPRM0nvq/FG7HBrMw9HXgp?=
 =?us-ascii?Q?cbDiMHZsWB76JtjIn2czHOd6FG1oFbXxOBiu/YcYmG8RIEYW0w8IUOFYk6pR?=
 =?us-ascii?Q?bRnJ62scI2dW9u63IcCKdRIDZHSn7yT0cWl3ZBKEptAhHPLXKorr2ShTCMfd?=
 =?us-ascii?Q?OewgzDJnXYMk6hi3+O7haNbcbi2BkzERF/rqVvq2mojJbzcyoXyTSSQ3/sLH?=
 =?us-ascii?Q?cxm+90iBBoq+rByMZ4soMj7n2GcPUX42j/dc7lffL+D4pJ/cKzEtj1JN/L6y?=
 =?us-ascii?Q?FP9I42uqBK81VWYXm/i3Eam1u7BhV/vz5jarKLjlLSPOCzpyEs/py3M8+4yl?=
 =?us-ascii?Q?EaLC8bwe0so1jm6ICSdXij1cfAWIiT+yt7JE9tt8ZheaHGiKmE4vpXAx/N8Y?=
 =?us-ascii?Q?+OBYz8TdEfmBOrbZRPJzhp6BG8zOXHr3Gj5B6nlxC7qcGBHcxPMeYr4CcXyR?=
 =?us-ascii?Q?YVeFrHzfavP3Z+Dfl1D9x4nuZg2roUG/YQDG2TIAQ7iQjyfJF6UIKIRDTWBi?=
 =?us-ascii?Q?Yt9cZ3QyHtmeOKUrD+FsVvT3kNpry+EzZ8Fu2afFwkj7US1zNAXc3GzGeiCx?=
 =?us-ascii?Q?hsHpMEQUAeYTw+BJsUgzHJ+oqwYwvA6ywaTSx0pSy6bOngewvOIKXXxMKEia?=
 =?us-ascii?Q?BWmnigFXtnJa9hpot4P2/SyqC5i20OI5SKpnKAHpzJW2sKbSrqU/7fWe7f61?=
 =?us-ascii?Q?4lt2GzXBFcG53UM7jsw6blzGn/gMLRz6beVEWOZt8TjNYZ+moYc/vylKBekv?=
 =?us-ascii?Q?M3ADTIkG94PI4YmHmlXer5tFr2BKdJbLh9fvn6co/oh0RYuCOYJdKUQ4ZUPL?=
 =?us-ascii?Q?uSD01T7dpAFFQUJ6xbcRwdG8FH+/poqPwf3ozAaOTdGe6qh/qhdKeuu8AGCH?=
 =?us-ascii?Q?GM1cLOCi3EINffaruy9nda8mGvCcasJ89ZVNausqFVE13ARPvjniPI765C7K?=
 =?us-ascii?Q?RpDYAM50hjWOzn01OUO8eq2jvR5/6W1SZ5lI3AG2yNIpihU3TmuAk8r2CU+/?=
 =?us-ascii?Q?BPr3KeSaTp+7TV1QoRJFwHIx3LOH9RTWPV6zPsHLvFyAkMxYrU32ogcciYXT?=
 =?us-ascii?Q?EXDjw95LZMG2+VjQZNb7z+YC+Ctth7qSs6mll3oI8THm6Ssc6khjEHdkaNbQ?=
 =?us-ascii?Q?nBExYmeBWNrLwQd7FS3s0K/7/9uqv1naRo98JDMU68LTJ8SIrF1zUAc3vzmc?=
 =?us-ascii?Q?VH7LLARp0v00w0hVVePctHHoxZBTEJivECsAHlcHRhNyOQIqAXcRAZ5oiXGo?=
 =?us-ascii?Q?1lhRLvj/GQBRW9lHQCLvXmqnAt0u4ImzUgYkZX0FF5JWwhrOMPZn2aPnpUCF?=
 =?us-ascii?Q?cx6N6hpJcq2zzGW+poWezP2BYa+xdIDWrBsX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(19092799006)(376014)(366016)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MQiTAZySJzL0cv+EvlzAkjRagwegYk1YhQUR8yI+LOJle8x22b7adLxpnI4b?=
 =?us-ascii?Q?m+FvIWKqBTHeE3rM4ql3k3+r1MX1H2/4kF2QBrzxR2K+ovi8xRwTb8gV+i09?=
 =?us-ascii?Q?fRPJEJHINx/n0Mr85emRCmzukoefelFnA9zTfVuLoisShIPKiihfkqwLoWEO?=
 =?us-ascii?Q?oHKbiGanuxL7Nfs/QUrr00b3T8Y9U4G68caE+pAJNPJl6WNE/G2vbQyiUzCK?=
 =?us-ascii?Q?Bq4yY17MfUTyiFfrNs1lYvXByn8qzYgenf45cbdU6MMKq2PWfitn6Bnbo3aG?=
 =?us-ascii?Q?sPxEQi56mX65jZgaHSC1bvx7McL7H6U2xFqYz11ZHkKL+CewyzhrQqfUIXJX?=
 =?us-ascii?Q?j6BioaelsKw084MsNLYxxyOvrDzipNrgmmrpiScNd4RU9mn9TVWw/DIjIlAL?=
 =?us-ascii?Q?0hLKUj0kpQ2UbKikoTBQEiWe/8P6bR32cs24JrvYlD8bGGpQmZ+OsvqFf/XH?=
 =?us-ascii?Q?M1z4B+09UHxL2hJahg1+jT9G9VeQqGeN20RNfWVTBuQfZNPehSu09o5QX1tC?=
 =?us-ascii?Q?l+KukmpeHw1+vk4zd0771JyIrKaq2BJgAQQBr+IukFbEUIgRMAtJ1f0nI8EL?=
 =?us-ascii?Q?xfKJTcV5v1Rz6ike4cOfddAJx94Sycua/JwE13mJBgax/+095ZLMz5jl0M1F?=
 =?us-ascii?Q?0OJ5AZYs+fKUmZZSTu+KupKKdij1QB36yA09RFrqvcF/eeUyf8txNOECgwkF?=
 =?us-ascii?Q?jPkRnHz+lLbIZvxnwUi6wfmQVI0elSKUg/N31NSwxQgkhzG+IT4dzTVpt9AI?=
 =?us-ascii?Q?sTQIpN2adZ1ECvVbTZIngJDT8vq+wesDZmU6OeauahLWjHu4i5m4QsRsWuNv?=
 =?us-ascii?Q?rkL92alN9fXwtdi4jwVod8LJk02db2nIMP7G9UGavBMxJMEBsS7GK0S/jlKs?=
 =?us-ascii?Q?RfQqQEiah3e6HTJZo7xgLLMIhWxLIc6jihG9chJWuYh8bDG7VQR/6ssy8tng?=
 =?us-ascii?Q?y2TmdkMRwxEacxn8zY+EYv+oxl9x5Pr1SuxFDe4gjEXG7BeoiDBzc8Nm61wY?=
 =?us-ascii?Q?wC+HWkAoiWxq8wNBpU5OhuNc2VeCSsC3I2VFk2HS59pChdk0+/bUukpwaAQ9?=
 =?us-ascii?Q?SoLIve4bgznivlZZDXgwPgmQEFq/8IrgclZ6m+OBHzG6Q8VbZ/vgEYs7lX0N?=
 =?us-ascii?Q?nG0XIIgT6AkJpClqOFcO5f+VnYZFCc4MLheSo46GEEZMKX0OXSgr6Y5CB5da?=
 =?us-ascii?Q?wDulBe4Ix6B4RpleOHEqA7/et7kCTugXi/crX+0xjEH9g2Z0XQrbI+WO2U/t?=
 =?us-ascii?Q?Y/qTGtVfuaq/VdbZE4i3YOLYUjB3mDV8VeljcQBm1mb18lJdEvuVb6llVSsF?=
 =?us-ascii?Q?gmw7bU5HFYXFMxZ57ZHp0d9B1HiSvn86MH3sYDACV7iQwsJyEWcX9R0JEQRk?=
 =?us-ascii?Q?7RTXktrNesGlkuypz4GEOcsxelwo5S2fDixGhuL8NXVey9acDuGhwKClZsNq?=
 =?us-ascii?Q?7CzAOOFnVBvtwRY1oVRozbA9/NJCY/jXUZ80FRtjrAQPg2UjKcyln3+0AWkQ?=
 =?us-ascii?Q?TLLNljovsbnypZqvJ1X/Ga9nZ3hOsyNXGCLUHlkh1dkMs1pzpJo3+9yS3+XG?=
 =?us-ascii?Q?K+uH7RXU6SuqgcDLQ+I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8c9bd9-04a9-4399-6489-08de0e0cdfd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2025 06:09:19.0372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4BU7JrRm4kevrmZlLpphJqXBWzaiJV78YvYK3D0eDfTFm612wCpWOlzT+5SH7r7QQpvO410Qb2Twx/AG2z6FoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10536
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

On 10/17/25, Marek Vasut <marek.vasut@mailbox.org> wrote:=20
> On 10/16/25 4:07 AM, Liu Ying wrote:
>=20
> Hello Liu,

Hello Marek,

>=20
> >>> +$id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
t
> ree.org%2Fschemas%2Fdisplay%2Fimx%2Ffsl%2Cimx95-dc-
> domainblend.yaml%23&data=3D05%7C02%7Cvictor.liu%40nxp.com%7Cc0eb44
> 78aced4ce6921d08de0d9d59dd%7C686ea1d3bc2b4c6fa92cd99c5c301635%7
> C0%7C0%7C638963166631090945%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0
> eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpb
> CIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DNEUOVd1LBTU%2FIymp1Ieb
> 22hbewujlOfQzZTflJ39Nuw%3D&reserved=3D0
> >>> +$schema:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
t
> ree.org%2Fmeta-
> schemas%2Fcore.yaml%23&data=3D05%7C02%7Cvictor.liu%40nxp.com%7Cc0e
> b4478aced4ce6921d08de0d9d59dd%7C686ea1d3bc2b4c6fa92cd99c5c301635
> %7C0%7C0%7C638963166631115160%7CUnknown%7CTWFpbGZsb3d8eyJFb
> XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTW
> FpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DJSP9XazHXO0HeirsaW3D
> lqKf5rXOJgGJ1M1hcsk7jS0%3D&reserved=3D0
> >>> +
> >>> +title: Freescale i.MX95 Display Controller Domain Blend Unit
> >>> +
> >>> +description: Combines two input frames to a single output frame.
> >
> > I'd like to comment on patches in split patch serieses(to be sent if ne=
eded).
> > But, since I provide the below interrupt information, anyway I take the
> chance
> > to comment more:
> >
> > Add more description about the unit according to i.MX95 DC IP spec:
> > The unit operates in four modes:
> > - Primary mode: The primary input is used for output.
> > - Secondary mode: The secondary input is used for output.
> > - Blend mode: Primary and secondary inputs are blended, according to th=
e
> >                programmed blending functions.
> > - SidebySide mode: Primary and secondary streams are projected side by
> side,
> >                     i.e., primary video on the left side and secondary =
on the
> > 		   right.
> >
> > BTW, I confirm that two Domain Blend Units exist in i.MX95 DC while the=
y
> don't
> > exist in i.MX8qxp/qm DCs.  And, as you can see, this unit supports mult=
iple
> > modes, this would impact how an OS implements a display driver a lot,
> especially
> > Blend mode and SidebySide mode.
>=20
> There is one thing which specifically concerns me about the DB, it seems
> to be capable of blending two inputs from different security domains, is
> that correct ?

For now, I know nothing more than the DT binding description here, i.e.,
two inputs are combined to one output in four modes. And, DB cannot be
bypassed IIUC.=20

>=20
> >>> +maintainers:
> >>> +  - Marek Vasut <marek.vasut@mailbox.org>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: fsl,imx95-dc-domainblend
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>
> >> No clocks or other resources?
> >
> > As patch 39 shows, there are 3 interrupts - domainblend{0,1}_shdload,
> > domainblend{0,1}_framecomplete and domainblend{0,1}_seqcomplete.
> It seems we currently do not use either clock or interrupts on either
> domainblend or layerblend IPs, but maybe DB and LB are different and LB
> really has no clock/interrupts ?

If you take a look at NXP downstream kernel, it uses
domainblend{0,1}_shdload IRQs in CRTC driver and I believe that upstream
driver should use them too.

DB and LB are different. DB is in Display Engine, while LB is in Pixel Engi=
ne.
This pipeline sort of tells how LD and DB are connected: LB -> ED -> DB.

LB has no interrupts.  And since it processes pixels in Pixel Engine with A=
XI
CLK and it can be configured via the AHB interface of DC with CFG CLK, I'd
say it kind of inherits AXI CLK and CFG CLK from Pixel Engine and DC
respectively.  See the diagram in fsl,imx8qxp-dc.yaml, you'll find those
clocks.

Liu Ying
