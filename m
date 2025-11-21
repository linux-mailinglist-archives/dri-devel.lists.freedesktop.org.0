Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767CFC7B9D2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 21:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A91810E11C;
	Fri, 21 Nov 2025 20:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="AF6Wdgvm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FCC10E11C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 20:04:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlLkm86cYsRCvUTzJEvuu8Tctjto3vK3dqS7RNyUlR1jxmNMKvBoSM8g5psf8FbD5iTZ0rDmalHDRsY0wexzma7rfqbgl6rb/mqoNRSoufrTXZ30kJYGpsVyCQ6mZzxVCd/zoF0HM1xSAxOsqtekyo7u4MR3ZX0hbLA8AvHg4BIl/vIQMM/JYAEiQrNulXl1Wry2VqySG00pMjN6XhpuetukjMUYxyiBhgO7YxufgeESvKWUHZ8Y2ZCBVx5IsO5PvhA5pWoSTPqMV6o/ZBi8NovSAw05bdRkQRbOeV/YPl4RFSm2mTsWRl8DAJqqe10T7a50/QQITVH0Ti1rST4KMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wsls+Y5s4jTOGIIYqiv/w9NfofttUQZU0V6EUZlWMo4=;
 b=v1jLaWnExWiO6RLhJujl60PLccaQIrtzhJjz/RIAQvbmpXIUZbZBdE7Bk3HD1JtptRTfa+3wJP88Ao4R3kQX7KbQG35yXZH9Y+N+0CIBEtDiKYXV2eyr/N029/CohIO3ZzBM01lSOddb9MQfeQZSaaKP6F9DMUoy5d4XuVo8rSKOGkBMkHZkwQyIxcK25M4DkI6XDANpnP8STLFh39XS3DknA7K735C0ldPti5JJQb2bG/3UYgjda5PxjYb5iIvtCSIFPc07JTNiIBzuFkLgRgQUfgmRz8C6iXJAGocP0iYkmI8mc2sd48BeaC8E/NroTq0YZt8TZnbnSa9crf56Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wsls+Y5s4jTOGIIYqiv/w9NfofttUQZU0V6EUZlWMo4=;
 b=AF6Wdgvm47amSVWJG6iPqdHZKmmotW89bAQTTuTrRHRPUqz35+/4OOtr29A4aJIIzWh74211OE3lEZrBq9QqnHsQueE2v3WOupdMRqj9G3kzemOYgJwnWn5aVjvnfWo+2XmhvpBji8RCg+PpNFxkqnKXy3Ue55v7eFtO6lIZtGA=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TYRPR01MB15098.jpnprd01.prod.outlook.com (2603:1096:405:227::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 20:04:49 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 20:04:49 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, geert <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcWPwxRrBR+pEeF0OW1RdaNVw7mbT5c60AgADdT4CAAjLVIIAAVGOAgACG0oCAAA1UIIAAJSyw
Date: Fri, 21 Nov 2025 20:04:48 +0000
Message-ID: <OS3PR01MB831991F8DA0A5E4D488666F88AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
 <20251119022744.1599235-2-chris.brandt@renesas.com>
 <20251119001030.bf900d1fcad4db5b63055e2e@hugovil.com>
 <20251119132235.795b633eedbb91f8544262db@hugovil.com>
 <OS3PR01MB8319EE3FB4460584BD8C62B68AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <CAMuHMdWvKSDp3EVThcgU0UiUjXKAu16VtiWER1Xv4cEUdcCUZw@mail.gmail.com>
 <20251121120137.e6ad0e6d98daa15d2a1d3963@hugovil.com>
 <OS3PR01MB83191AEFA889BEF610474ED48AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB83191AEFA889BEF610474ED48AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TYRPR01MB15098:EE_
x-ms-office365-filtering-correlation-id: 4e2a9a67-1291-4963-ac0c-08de29393997
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?G1noxh8tBB1mJKnbbTPQraWa4agwAnoBzNixNDc6ZWDZ9OY6aIiJBbV02OUV?=
 =?us-ascii?Q?FqbvTlMa14QQX9ZVn9zaJvR+zndLvh/fuUKu4k54O3m9lYviUrxsS82ofrUN?=
 =?us-ascii?Q?gAGUvOZ0WT/ncXAndrkbLq0S5ET7PSCaufIfJpMNCy3ScPrfChtfYxi4WXme?=
 =?us-ascii?Q?JwS/GtWrsm6t9rd5IvbyiVvrkwAyc8F67seQT/KVyM9/eMrT5Z5wiiEvfrDw?=
 =?us-ascii?Q?95305hbn/kUtH4mZAG40f14Xgr9GNc6njgEJSStbYc7wbr4sRBtq/Mjw51gN?=
 =?us-ascii?Q?OrkvNo9Nu5hLBFCvEg4KX2VRA/iBSWzJpca7og99fUE31ygwIVi+DYkdkBHD?=
 =?us-ascii?Q?ZIvasUopgD1G/M5ZB5Ifr+q16EFfpxlg/heg3lkGhLy6AhhrjY9sDlQFgJm+?=
 =?us-ascii?Q?oHm3Y13uSy6ZfRS28pvu5xxNhncTAikrZnuGkgtbVtY7xz3U4eOnCf8W2AFn?=
 =?us-ascii?Q?On83BVLSbcxUmj2+P40Pwz4F+EA+DSMi2p7xyECIA3eQZ3yO6wH8K2RlZFmm?=
 =?us-ascii?Q?C6F9xTcCt9BMUx7yN/+ma26a2tCBwqlAy8VJg0xPuNnquWmLSfgjwzxyagP9?=
 =?us-ascii?Q?bcO4Aa0lDzwLtHC3vb0Ac5eiGwLdyW3sKdZGqmiEzfhfixdz3Ff6E0IQNbd2?=
 =?us-ascii?Q?OZwV4xTnT6FrILOTwW3gHkccvfL4efJdVRSzKf5ZbgxJReTjzh5oIy92aofz?=
 =?us-ascii?Q?Jor9a3IOf5wPRElCBVrGVbeur+/YC9xesyt33bpod96SEHXmxM97XNfM8Fqc?=
 =?us-ascii?Q?OskctxFqlKPa4eELsuudoxEDLGm71VVRMGUxxqHRchYUjEpWj0UeAzbi6Hjb?=
 =?us-ascii?Q?llBLYzpTbz0rGgJMFMODiApUaV7aLiEak8VjPyBjwB9FfXaHy1ZnePS5IIzF?=
 =?us-ascii?Q?rPE3cBHJ8LsAkuhENi+mLfRXEBI5ou5POwUp+Qe/0MA7daJGW7xM0qrGfVIF?=
 =?us-ascii?Q?yq+4GxiH0VJGmhyF2ROfw6zMW+5hlHavN0Yzl4AuQTuG09H27ynletY7cinI?=
 =?us-ascii?Q?FDNVgcK3inGt8Ws2fayvP0jAXLUxZabFC1+inqbnBtiJ0Rr+pR3NWcWJ5k+u?=
 =?us-ascii?Q?oqNTTPpf0ALae9sqNSInrFfWeXSwY9CaQppLEvox/zvLfGKY6sTZnouBYjNJ?=
 =?us-ascii?Q?UR6S+RCb8GgsR04FhQFyOv81Vs8PfYzlvC8EG8gRi/u3LEM8DvRo6arERReH?=
 =?us-ascii?Q?EnwSzN8BFA/QZ82EVypjaR9+QSqcRW7k7AgvjZoFyWIWrvyArkLmbLPvI3WH?=
 =?us-ascii?Q?N3avvfDsquAHg2lO2a6fpI4Z5phkW/uHn04NnI+7JwmigzWWTTLB/MCeA3LL?=
 =?us-ascii?Q?SeVhdQKfkO4H0PhdFgnoXj+Rwj5VC+H6YMJVYgPldO5zdFAgCWdD5Rhr3XQT?=
 =?us-ascii?Q?MBxbPLfSVj9JqEy3S975FdjYMwuGfed4nLa95eQjJyLLjzaM5rL9KcE9I+ay?=
 =?us-ascii?Q?FG9HO9wbLAnwvNuN2Vhdi9UPZOUP6HW2QJu+MHCgmk24U6SWkSniuVzHWwCj?=
 =?us-ascii?Q?jzbGbMFR9GucyNybtEiuUdGWPZ9r+0jylzMJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AWXh/akFZPOS7Z9+poeDgTgcfN1SvIXn/3zrh1J4tIc6xXrq6+E9qJnH3gv3?=
 =?us-ascii?Q?B+XwGcAy1dXuYa0NWxG8gvBCoCKCTW3cLduB2a9GkIpDeDKV7Jc2eKITQUwB?=
 =?us-ascii?Q?j7r5XL7yatpEqfW4JeSOcKMlK0uM2yT/Illx87ZG7lX5S7FV29EM21oxrO6B?=
 =?us-ascii?Q?/pAKxSTyIVDwAfVyqRqyR2Ge1OvXB5030Gpl9NuDiySNkkN67It/OZxiB65E?=
 =?us-ascii?Q?6ySpcGq6lsxUZaHbQ9AC7Q+TboQeh11tIubVs7x1bCPH+heqvgUzL0ZbE37F?=
 =?us-ascii?Q?d6WQmUQo44+jZj320FPmEvY6PLQNcXwsEIJ9D4Cny3tq83vOhVzsTFTZAVeI?=
 =?us-ascii?Q?LGS+HamMYXHqWhnMddTIZ1/8b6iKiJ1wMywb0KBAaRV8+R3h0U7Nx/kgjFWV?=
 =?us-ascii?Q?DRR5s8jpGoqZw9SewfUpUpv+vwrMf2Ex3vJgES2W88NVttaeWaC0rKNkdTfJ?=
 =?us-ascii?Q?fUNr+6XPFS4RHr6v+HmeSKQmdP+B+GxW+N2V5XYUpFHiYWfIX/UTQWR74tsL?=
 =?us-ascii?Q?PfF40p1aDCtKBVZqEf9Bc3d8hpu1gtmULztr5NniFT1+Tm29vSICUiMZChOV?=
 =?us-ascii?Q?S3+VGJurTLbUpZFrQAjkep2SfhEXhMnzC+y656Tsv3xoZoabP+6aaAmOjvtp?=
 =?us-ascii?Q?Esyj9iP8mIGLjxVXRHB1EupRG/DDySrxheehXUxIwBYuGA5c809rzUIK2IWk?=
 =?us-ascii?Q?SgKzJNn6Xil4D4tVOAqbIN+j9PTLFXtHe3M2C47t2lhPFvSK+hkb/r1MYnYE?=
 =?us-ascii?Q?JiTi7vMDyLv6vYOqjRW2wGZhoKS4zTVWJTlhTKucKtT5EqiJXJazUNmnWcpH?=
 =?us-ascii?Q?qbAYwIFDxd1EcHSb5x2+G0nKU0Q1xzydtPX6GKZfBFT+hQhwwZh6l7QIwBUb?=
 =?us-ascii?Q?aOZ+1FY4T5aHU0Q7ZGYEk3Y54HzIZNQ8UynxRXNLmcZ2movIQB+wbzLUwAAu?=
 =?us-ascii?Q?a0nac8ejq79cJGdDZe+lUORIFDApyEy84Sm5YiuZa0x/UYcjRtxZBkj50AxK?=
 =?us-ascii?Q?qiwmD4+G5+NDFO3D+yyjF+/dH3rYhaCabrjYFrN8WACGXO4foG0vAso8RThc?=
 =?us-ascii?Q?obJHgQMo5Sf1FtFv87NhEW6itRvKX17wMsmMGmTo6ufPcZpYFSSslNe2y2Hc?=
 =?us-ascii?Q?64BybAchUflVsDoKMd3wbWi1yO/I9xjop1ya0aVF9euEyV2bXSAytJADEj5L?=
 =?us-ascii?Q?uvjPDtRbuEfRwf1QDDkXskkpoSmiMcM8nIDc+90hpu/5BWGULi9JFDT1ghTe?=
 =?us-ascii?Q?5m/XpBC+A72ZgmokzmgueYZIcIeNLwivVnDpWir+MwOnMiau12q8lg0/qaMc?=
 =?us-ascii?Q?bb50VhLFGdh1y8jD8aKuMNBNuV/E0N1eMpyL//0ACi8zMbsd8dR1VGcKIIsF?=
 =?us-ascii?Q?7G3xb/ip7x/+mkGbvxW6frf76Fk/ckUT19Qd6E+Px7MrKPOHAPegVs2Gfetk?=
 =?us-ascii?Q?bBPKVqpYhEOHSIoex7Err5Xx545QKpx/1DIJK87Sqh6Rno57TaUyCBeWm7g2?=
 =?us-ascii?Q?HJlxgA94iFcV/J1MY+UPjZX4EhWVD2ernkOyivTI94LW/+NZLrscA5m6UWb6?=
 =?us-ascii?Q?S1Ba3o4GXphm3kU33scAJT5W2TVOwUVhanAuJua8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2a9a67-1291-4963-ac0c-08de29393997
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 20:04:48.9075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RLoZqtg/ZSObSh91Q/IcdlLOT/eoabNe43K/RS4RV7ozIAegKc1j1MjcvI1PFRN2nQLbRFDTfB6J6xoD3fpLBwdFgTfCtJxW9Gi/7QLbXzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15098
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

On Fri, Nov 21, 2025 12:57 PM, Chris Brandt wrote:
> On Fri, Nov 21, 2025 12:02 PM, Hugo Villeneuve wrote:
> > > Pieces of code are reused all the time. So I think it is better to=20
> > > make sure it doesn't overflow on 32-bit.
> >=20
> > Here is a potential idea for implementing it so that it doesn't overflo=
w.
> > I tested it (compile and run) on a 32-bit platform, and also with my RZ=
G2L
> board.
> > Note that I defined an intermediate variable to improve readability
> (extal_hz):
>=20
> I just started looking at this too.
>=20
> I think the existing code is more complicated than it needs to be.
> All we want is a simple quotient (intin) and remainder (fracin).
>=20
> Let me try out your code with different boards and resolutions and see if=
 it
> matches the excel sheet I use to verify all the math/registers.
>=20
> If it's the same, then I'll put it in V6 (which is ready to go as soon as=
 we
> fix this last part)


I tested your code, and it works well!
I'll use it.

Thank you,
Chris

