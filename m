Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C041E99C29D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7E210E095;
	Mon, 14 Oct 2024 08:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pFYQBYPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AD410E095
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:09:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSC8YQQC7eZ4KUGya818+eCMGuOeBHL4Kb11idkzMigKZQBVgjUnSTU+FcYFDdXWehCbvWnM9cjh/2Hhlj/XvV1xxrF1SGvn8YZzHbdyOsc5mE0uQMrY8Ed8sRY3ol4HG0N6WzrspYDjVCA1Y+E5dLt2v46sK+LS8n3TGvOXPIeYTFJD94EfzU99UR4TYGB/TuLF1JNJW+k12YAIcemharQnc7W0bGavcn75ZA42QEtrcO349y7+THHmCjBLHR+gdhbw3jBE/7sEeHO5ETJtxsSsySOr/mPC+3SnE1qTlt9Cc/dyJmcuIrYEYRwblzeCYrBY6+FhmKRAeCltnJbNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cn4jK8cd8FkS2EgLJH+hRrXRPlWPiYOMkj1L6xB7k4s=;
 b=cRwdvf09MVqXAMUQVFWnVr6T7E6wmb97xCRUQNfg+oywziaA7WZ/qWbfU6wqyaU3kEscDwn2/Z50snFIFUJlgvMtf72U+U2DjLEAiCwL1GqRo6c3K1Kfckn05u94qBl5lZQOf7fFeX8TY0jO9RCz2dLTKX2N1ThtTaCBjNFVEN7GOAo4wZf//oEpdf4gJOA64vVt568RpglSiwVy5lq8Q/H9VVgQiNVhu/ifbdxmKA/7qczg8YqT+bTTWdY+WmBf8KzML20QmXloFUIjEvrcZnm4Zg1WPY8JgKTxlblGnFBwKTWLWRfYlGEjVAEjvuSjOecjR4giPH15YrOg/vn3SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cn4jK8cd8FkS2EgLJH+hRrXRPlWPiYOMkj1L6xB7k4s=;
 b=pFYQBYPTjal/KW8jNpdVbP93UBHGkfTMbCSl7jsD0thnPoZrjAcpj/yh8v2gAwqlZq8MBF/8xNbdHTFbuEDUsuo2TMwnjA82Jc4y87qdE1z7xVaHvEDrKic0YC55QNkotau6shgY5sOrv2F3dyJ/wJ2JPDpQ/8hQeNlHDUvQ4i4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8644.jpnprd01.prod.outlook.com (2603:1096:400:159::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 08:09:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:09:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Liu Ying <victor.liu@nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se"
 <jonas@kwiboo.se>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "y.moog@phytec.de"
 <y.moog@phytec.de>, "marex@denx.de" <marex@denx.de>,
 "isaac.scott@ideasonboard.com" <isaac.scott@ideasonboard.com>
Subject: RE: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
Thread-Topic: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
Thread-Index: AQHbHHmcAQrmzLsoUU25rfXdj34z0LKCyOiAgAAMWYCAAoXDgIAAYU0AgAAhkXCAAAh2gIAAAEmg
Date: Mon, 14 Oct 2024 08:09:44 +0000
Message-ID: <TY3PR01MB113463A0E53DAA7481926219186442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
 <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
 <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
 <TY3PR01MB11346530A53C8085561713B6086442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ki7zj2qvf64oi45kcnxl4maoxfvxtawko3vcdikg7dc5q6gw7u@5obyfvyylb3w>
In-Reply-To: <ki7zj2qvf64oi45kcnxl4maoxfvxtawko3vcdikg7dc5q6gw7u@5obyfvyylb3w>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8644:EE_
x-ms-office365-filtering-correlation-id: 81e415e0-a751-40c2-4328-08dcec279030
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?K5BFP7yx7Za+Ml/d68fzZU9zQ5PJYRtEWgOBaG04XJ21DuSB+byR1X0TX3eU?=
 =?us-ascii?Q?xcqNEhtEAqBTf9ACEO17CtDR6ywkd6qtd6APdAXr4D+0NYGPKSYB5dJWFjXN?=
 =?us-ascii?Q?Ul4E5AGh8MtUREWbYUOHbIfDvjKsWltZsiOnqG3sPW1tg2EfuL6BMFxjcqjQ?=
 =?us-ascii?Q?QItofF0CleomOYNImsiqhljEuw/Za5HK9b7urf8Nkg65x51soIDpultPGCtE?=
 =?us-ascii?Q?ZVmg2uncAbVFofwMob7jOXlz3AlyxsfzJl9EELgm/cPjfen621BA3GNQeeUQ?=
 =?us-ascii?Q?oZVlCc75BjWxOJMfewAwrj15XZV5I/sqVKMwbK8UpFxarkjhO6uxT3NvU1m/?=
 =?us-ascii?Q?f7y4Lukkqr1uu0HlT3QVgAXYW5IGAiNUq8o0FW8kGajMUnZ64pXOo/+VjuE5?=
 =?us-ascii?Q?/TEIJXFVopsT+pqmpmkTyT/ovrnCFUMVTIDF/viY7g3t27TDzJLjdT4ou4gn?=
 =?us-ascii?Q?7Fd2C6x/maqS3pBX/qJKMISIoNld4wfdX9htb85HUNQA8D5pCQzZwHKiq2+E?=
 =?us-ascii?Q?j69Q0Tj9sekWpKF+EHD5jXSSvoL37ccDtNDtmwGxuTk8pHo5b8SqHRrSyvNT?=
 =?us-ascii?Q?6PeTj5lsGjkkjfQOdBVahiDDA/KDojekrK6M5LRztBr2m6wD/Gau/8FfiARa?=
 =?us-ascii?Q?eGXouowhyxPwoQwrPYYFYhdRl6n+AfD4KlQW3PXptniprCcnV18DEeyfRCA6?=
 =?us-ascii?Q?DUH8O8tN+3Chqm3hkJgioBXz4iE/GKW4iZJgFya0lBTWyTXyvgq8e52yJ+cJ?=
 =?us-ascii?Q?kLoV61KPoW0mKTIWCZK1EUjz0LX3J4gZyeBKD5I/Gef3i4dDMglKNNqr28AX?=
 =?us-ascii?Q?7n2OLhAzxau/BxmUr4XIkN0TubqE2F0PoZBvLVHUdyaBR4E5MXduK4z1G4Pq?=
 =?us-ascii?Q?l9SACWFTUVM3S/XQV8UIMbG6tKwbFau+dH9qSbb0K3gWyWqhrvDJ/TWPz2aT?=
 =?us-ascii?Q?579tf2RWuCMBimeYulFFu4UY9tvkZmeYH2/nlil9XHHHm4gMeGwdxTYg/QEi?=
 =?us-ascii?Q?FI2M2zBIEAPviXbtZLEN9Ac17LhO++ouD+bznzNAy3g6Rl8SBwPMhct4pPuD?=
 =?us-ascii?Q?/Kkv3CZtojW38RqOQofJFKfetBdOHDLGkkMW2WaarmvBVIsatWivNTxC3lAE?=
 =?us-ascii?Q?lnkC8C9OGgKj8vZnLypI5AwqG8sHXq1WebN7OoEwCovqB/t9zGgbw93atm+4?=
 =?us-ascii?Q?nGkKKpE1p2dqlX4/AkX02NsS9fKOeDgpFm6uRjG4cISBtYYc2/2/sevQ8+Fq?=
 =?us-ascii?Q?/0zhINl4abCR7uynnxShzzbbIAkjRdcQd5HSCPAilw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qrBoSDPQzV9TWNiYaE9DsKOHdGg7utZsDjT9UZwO797QD6qMHLNowyFBLRTq?=
 =?us-ascii?Q?aepDDcfGeigGST8hXhPQo/IKwutHVAHTE6g2E49Z/nuNi1lV3VHyGg0CEsE0?=
 =?us-ascii?Q?FPaH8B3MTR7zpVeKz2Gzmy1lWdyHbC3CS2jRgMlVB/zDJ2CXfp9xY7lSdrNT?=
 =?us-ascii?Q?OigLVDpAtJwUEUX8S6BakaCrP8PLelKwIcSKBedRx6Zj64YkFeDGs/lt/FSI?=
 =?us-ascii?Q?TIqZp+0jtIuqlMdZi2NsZoWgy9GofdORnKM2WDxKTW4hwl41S7qkIMBY/x8A?=
 =?us-ascii?Q?OfCYh2fWiZnqEn1WpxnY/Ht22BK/TzW4Dek6KtOU72e5JUu4wIWMa8i6m2tt?=
 =?us-ascii?Q?eEYw3z8g/RvdiecDYRMHgdR2wtLlivKDGOoYl7wjaZZOEx1wMi86Kaz6nb+c?=
 =?us-ascii?Q?FjFoMa0Anp1ZXnujhi9M5eOkcDoKZ3SXHuU/h2jlEHCe8l28juQxTZeiDZEe?=
 =?us-ascii?Q?mcPcRLk3g19WZaKW5P6ExoH8cX4uG3Oxz5OWJozPBqgsLmTyNJfY4WtJxUtk?=
 =?us-ascii?Q?zzEFZkmDAVOTsx6lj+aCosg64WAUoDYeaYC2gDUE3R9tc6OubxWRokPm5Hyr?=
 =?us-ascii?Q?Lch5oCFrzG6ujfaAP7iObFlKDSS/fNEc5pFl4SLSh4VKOFO7GNFxhnfou0d2?=
 =?us-ascii?Q?bEvYpX/Uf7b3m18bhc+dECRVSFLJAZrf+Fnpb7XgnLPKV69371LSOM5myFco?=
 =?us-ascii?Q?jg0P2WYC0aTyf6m0/fxnYRI/O5I6eOt8AB52HIQqTBn8otCnd60pNdt2ksDI?=
 =?us-ascii?Q?TtVjEKnwSiXPL1+WTd2/p25lO4JTc3w2SDzAC6vxOFCrs18ht0AsfRAd6CHA?=
 =?us-ascii?Q?kKeCcgBjGQUDNcadWYxgtwv6pclmmzn/p8d/iPntuxlXMENu1pwsVPr8SV1J?=
 =?us-ascii?Q?FwTMX72JbQnmvlGDlI3LSakSTfF1Q7ciYKd45bNX5O65T/LlgolPulOm3T2+?=
 =?us-ascii?Q?MhdvI4SSx/5a+6XvvaUC+wwuhkwjo6zHJuXRa7BaduAd8otU0pV4QZve72Zl?=
 =?us-ascii?Q?zl4A4V8i3Z2dm1iRHPfmrtoQsNpO9ENMFfyRfVD2dI61jWq0RzF8d/ZLMQIx?=
 =?us-ascii?Q?SdMGFggDmQ0Ykx0YSjS8xAWVWGdU2svv28Ao268M9AYb1iC+bUZuXBL4JSQ8?=
 =?us-ascii?Q?0WQlH7nCTQHX6gdtUW+LVgNJvN+71UCdAJ0zcsXX2DEE5xNJgMqZy1gyOd4c?=
 =?us-ascii?Q?CDlkQ7O32tu8Ae2F711AbGnuZDMyZQac+p4knRhv8lK2yfRTfi0wqnaoVyqn?=
 =?us-ascii?Q?l1ykQVxV8rCdhGYu+OAQfpmS12ki0dhM8ppo6k3BtQnBadsuVtvipkM87gYF?=
 =?us-ascii?Q?JCNXItrfDQta0iQmQkIbvmRPHoor3L6dxxMn+OSUhy0Q8H6D/WDm9MFaO6V6?=
 =?us-ascii?Q?eoN99cp9VjZ/6DJftHzGzkW4SIz7/Z9CI8bdwTLa1yDzY7Oxemjyf6WKAAHw?=
 =?us-ascii?Q?athdTDPTAs/2ZZV+K3rDB0PtxXkoCJceTm/PDTtKzVcD5AsCUhRKDrLvZ8ae?=
 =?us-ascii?Q?oQnNaiZZffx2jDV9wwW/VioeWBTZ1grPSxcK4Vo3hoipzBKZj5e1x8vaGVqz?=
 =?us-ascii?Q?Vo1bDVdWkrwUmttEQ7wYUEpaI6+KcqpGvvxIJnuu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e415e0-a751-40c2-4328-08dcec279030
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 08:09:44.6189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dQwB1yEm89A0TwS2TVFjWOPmC2YC+ZiD2o8/pAJegwuWMXi+3bhN85I5WQBFvlY3zWg8LnksKp1HcqTA8DJyNJpeYuVQA9s6ZNtkZNQzcx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8644
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

Hi Dmitry,

> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Monday, October 14, 2024 9:04 AM
> Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 =
LVDS to HDMI converter
>=20
> On Mon, Oct 14, 2024 at 07:39:16AM +0000, Biju Das wrote:
> > Hi Liu and Dmitry,
> >
> > > -----Original Message-----
> > > From: Liu Ying <victor.liu@nxp.com>
> > > Sent: Monday, October 14, 2024 6:34 AM
> > > Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE
> > > IT6263 LVDS to HDMI converter
> > >
> > > On 10/14/2024, Dmitry Baryshkov wrote:
> > > > On Sat, Oct 12, 2024 at 05:14:13PM +0800, Liu Ying wrote:
> > > >> On 10/12/2024, Dmitry Baryshkov wrote:
> > > >>> On Sat, Oct 12, 2024 at 03:35:39PM +0800, Liu Ying wrote:
> > > >>>> Document ITE IT6263 LVDS to HDMI converter.
> > > >>>>
> > > >>>> Product link:
> > > >>>> https://www.ite.com.tw/en/product/cate1/IT6263
> > > >>>>
> > > >>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > >>>> ---
> > > >>>> v2:
> > > >>>> * Document number of LVDS link data lanes.  (Biju)
> > > >>>> * Simplify ports property by dropping "oneOf".  (Rob)
> > > >>>>
> > > >>>>  .../bindings/display/bridge/ite,it6263.yaml   | 276 +++++++++++=
+++++++
> > > >>>>  1 file changed, 276 insertions(+)  create mode 100644
> > > >>>> Documentation/devicetree/bindings/display/bridge/ite,it6263.yam
> > > >>>> l
> > > >>>>
> > > >>>> diff --git
> > > >>>> a/Documentation/devicetree/bindings/display/bridge/ite,it6263.y
> > > >>>> aml
> > > >>>> b/Documentation/devicetree/bindings/display/bridge/ite,it6263.y
> > > >>>> aml
> > > >>>> new file mode 100644
> > > >>>> index 000000000000..bc2bbec07623
> > > >>>> --- /dev/null
> > > >>>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it62
> > > >>>> +++ 63.y
> > > >>>> +++ aml
> > > >>>> @@ -0,0 +1,276 @@
> > > >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > >>>> +%YAML
> > > >>>> +1.2
> > > >>>> +---
> > > >>>> +$id:
> > > >>>> +http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> > > >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > >>>> +
> > > >>>> +title: ITE IT6263 LVDS to HDMI converter
> > > >>>> +
> > > >>>> +maintainers:
> > > >>>> +  - Liu Ying <victor.liu@nxp.com>
> > > >>>> +
> > > >>>> +description: |
> > > >>>> +  The IT6263 is a high-performance single-chip
> > > >>>> +De-SSC(De-Spread
> > > >>>> +Spectrum) LVDS
> > > >>>> +  to HDMI converter.  Combined with LVDS receiver and HDMI
> > > >>>> +1.4a transmitter,
> > > >>>> +  the IT6263 supports LVDS input and HDMI 1.4 output by convers=
ion function.
> > > >>>> +  The built-in LVDS receiver can support single-link and
> > > >>>> +dual-link LVDS inputs,
> > > >>>> +  and the built-in HDMI transmitter is fully compliant with
> > > >>>> +HDMI 1.4a/3D, HDCP
> > > >>>> +  1.2 and backward compatible with DVI 1.0 specification.
> > > >>>> +
> > > >>>> +  The IT6263 also encodes and transmits up to 8 channels of
> > > >>>> + I2S digital audio,  with sampling rate up to 192KHz and
> > > >>>> + sample size up to 24 bits. In addition,  an S/PDIF input port
> > > >>>> + takes in compressed audio of up to 192KHz
> > > frame rate.
> > > >>>> +
> > > >>>> +  The newly supported High-Bit Rate(HBR) audio by HDMI
> > > >>>> + specifications v1.3 is  provided by the IT6263 in two interfac=
es:
> > > >>>> + the four I2S input ports or the  S/PDIF input port.  With
> > > >>>> + both interfaces the highest possible HBR frame rate  is suppor=
ted at up to 768KHz.
> > > >>>> +
> > > >>>> +properties:
> > > >>>
> > > >>> No LVDS data-mapping support?
> > > >>
> > > >> It is enough to document number of LVDS link data lanes because
> > > >> OS should be able to determine the data-mapping by looking at the
> > > >> number and the data-mapping capability of the other side of the LV=
DS link.
> > > >
> > > > From what I can see, data-mapping is specified on the consumer
> > > > sink side of the LVDS link. This means it should go to the bridge's=
 device node.
> > >
> > > Then, I won't define data-lanes, because data-mapping implies it,
> > > e.g., jeida-24 implies data lanes 0/1/2/3, see lvds-data-mapping.yaml=
.
> > >
> > > Please let me know which one you prefer.
> >
> > Assume a top level use case where a user changes the format from JEDAI
> > to VESA using On screen display or modetest(if some one adds support
> > for lvds-mapping) then setting of the lvds data mapping should be dynam=
ic.
> >
> > Maybe for initial version hardcode with JEDAI or VESA as default and
> > provide a way to override the host driver and bridge with requested lvd=
s-data mapping dynamically
> later??
>=20
> The ite,lvds-link-num-data-lanes property should be removed, it is not st=
andard. I foresee two ways to
> specify the number of lanes used: either the data-lanes property or the d=
ata-mapping property. Granted
> that data-mapping replaces the data-lanes functionality for LVDS links, I=
 think it's better to use it
> from the start.
>=20
> Frankly speaking, what is the usecase for specifying the data mapping dyn=
amically? What kind of uAPI
> do you have in mind and what is the usecase for it?

It simple just want to change from VESA to JEDAI, how do you change it with=
 existing DRM framework?

Currently I see LVDS panel driver use drm_of_lvds_get_data_mapping(bus_node=
) to get this info.
IT6263 bridge device can use that API to get that info.

Some vendors use VESA as default LVDS data mapping whereas some others use =
JEDAI.

Cheers,
Biju
