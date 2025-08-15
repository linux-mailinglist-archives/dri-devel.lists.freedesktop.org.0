Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DA3B27822
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 07:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AECF10E8DD;
	Fri, 15 Aug 2025 05:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OeU71M1Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2AF10E8DD
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 05:13:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FT/Vrf7YmQxjsUhhWcZrA/Fr5JG94NOSdXNxaHirS3lmRM+bwYV0w73Cn+yZusNiBQ1TOFIJqiJ6vIti90vXjKERRZXzk0vOSJ8V9rkHGfH20zj6u9JElhwEMZmt/kyBlKwJfOeQYaq3WQHzV8ME/etZZtRyAFNCSgXcw4uw38ePybnFBaziEbILga+N2HLgDoJvN27VIlOHN0ps2Fl6wl+ZYv+sLaacTu/o9ZuxvSUWfZBSFMx4tYd8IIPgb1dGM14tSBznfcpocWe9UrtuzQM3Ilj71yXWyf1lyMVTbkSgUoFrOnxJOdSzbO8Xu+jzIn1TYFoNJBD3mh8jfDrPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6Utj5Et9vSGj5GgTC+0ycZHz8amHqsxLc4JwbpdvCc=;
 b=TY8RyZcV4Gd+vWiJXL2giUbhyAm+8wdx20nL3mSmgse1y2LcLncg7/UsGwaB4rzawRTzcyAUDX7W44cl30bRQXKwKHGajMEfq6cRgkTBtFNtLRiWVNyZHYGnPsANhktx5sPlDrQrMl8CIGIt9C7TXFi4SGY3NkxmMpYv7xtiRxQYQh2+3scwd9mGiBOkmPdVzrjGuIZPGkdM9bYT/g79h6SAR7YghZw53xnpfWo3B9ObhyW1jZcS5io7VyXXXQ2NGzb0dtCDH5fTpYA9ItTr9LMSGTDHU1ir9/Vi9jivOYSMKOJue5gibJ5m1688rN9fzzYR7OqR4Zs7OQVOjvxpcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6Utj5Et9vSGj5GgTC+0ycZHz8amHqsxLc4JwbpdvCc=;
 b=OeU71M1ZPSTQBQ86+SK4hT+fnjFgnTffeCempn29NGPEPvPOayB82PFPqDlIS2FUa+vNFrwNTLva2eDIl8tX2erLYaQDIxG3mnGALVP3SoiF7bFRlNXl6/0wyUgkOxquIHRNnqPrD4f+MUnwJ/Wztherz3p5/SGrQiVBbYSDzxQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB9312.jpnprd01.prod.outlook.com (2603:1096:604:1d3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 05:13:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 05:13:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 magnus.damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Tommaso Merciai
 <tommaso.merciai.xr@bp.renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v7 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
Thread-Topic: [PATCH v7 2/6] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
Thread-Index: AQHb//xELTRlucq3XUiR0g996J3eUrRjRkNQ
Date: Fri, 15 Aug 2025 05:13:13 +0000
Message-ID: <TY3PR01MB113463310E6CAF1CBD54B7C728634A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250728201435.3505594-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB9312:EE_
x-ms-office365-filtering-correlation-id: c8a37d51-34a6-4a0e-1d1f-08dddbba6f33
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tufWzgCpY4Z7i8616W9VrvqIYO3ePjVMPnNGSAIhi2TP49zj/b4ZbzAtF5Sm?=
 =?us-ascii?Q?1uG1DAFBQ67xaQFUuo3hNPYR5yYssZSeC+PLLserjnvVcTC/JrrH+Hn78lRk?=
 =?us-ascii?Q?KEAZ6eAuB8I17npARIIU4oASUs8/pKjcBUcX9KhjGqiTpJXzxJukPaDwrRyk?=
 =?us-ascii?Q?LQLFNcxAPQsaMNbGB44LAV4mEweJDE+/kEiH9sDywO8h3DVuWEo/kM0xdaOd?=
 =?us-ascii?Q?ER4cKddAo3sL4onWfWAjb0Zy4xirTDNIu6ykGut0xY6dEeP+3gv8XC83+AcF?=
 =?us-ascii?Q?SAZ6ly9prhdqAaszOXgY6cHF/Hygx5Bbdm4dkTYpNLYKn9J0JlMUoaDEJ7xU?=
 =?us-ascii?Q?dNsyuUKads2V4HPe5gyvhL43bwApyiqlmlbg+g2l554rUWLXwnjCQcRr0FdL?=
 =?us-ascii?Q?n/w+qsmNbOtGnqgY//4V6eC5xSOEgbxDD4wYS3ezAinXI39YWKeT+jnchyW0?=
 =?us-ascii?Q?FXN/vnBdrH0w6SEyWQn32UUXb2MZtrDurkLtyrwl0dD6ViK/U4Xfy0hwxYCv?=
 =?us-ascii?Q?FK4EbOSWq7Px9exMzTbxD/nFeUyrgs98jAG9flt2zZM2rrAs1qMTFrupUHhu?=
 =?us-ascii?Q?mzbDE1v6bSzefUbx2Oc/VoIukTVm2JnDCFHX+8l+IzLzINF9vjcNr1uqcLP6?=
 =?us-ascii?Q?wtNXwP1b/wrDB4HpEN1tWfDrHqzP8KFEf10PFMtLvMuuV+N7Z2vira8blc1X?=
 =?us-ascii?Q?+6W6XNd0EQs1vRfRcSY5Lo6BK23aJMOJcnUdxlsDaS+0mWXXJ/q1g+aDTZLx?=
 =?us-ascii?Q?wbL7yxpUxc5e/s8ui+2SSJPBxrR1kCj83LZCq5fjBEoVdLXEAuhnAjq48VAp?=
 =?us-ascii?Q?esDGkLQmaeQuPqI2vvTeZ/p+yT/kCriGAZAjGjb2z5GGL33jC219BODtWYW6?=
 =?us-ascii?Q?upO6m1WJ/Q1PH2s25VxvUYEtztSo4TFWiPqMFkd2wUyJWE6pNAMLeFB0Auj9?=
 =?us-ascii?Q?tD3AYjjG40Jm/VBSQKrhstkuP3Q3uT4kqtRSKUyoqyn50pMgM/+4Z/LDnFlt?=
 =?us-ascii?Q?+aSFivEm2npL+HFB5ICFWY3CPcDQKyY7aI+dXh+Z19c+Hhmj+ku/TjKPneHt?=
 =?us-ascii?Q?QAfr9/+UCJ/Sh8MYZ/k/YKulvTxOKb4IOYZK+CSzaHW78IjE7OrXT3yBDEhF?=
 =?us-ascii?Q?NoS5d5n0nedny5zO6RfcVuR2o4sBEbWMK1k59NKQutMH2NrigAiqqCsfW4T7?=
 =?us-ascii?Q?b5bdAbDx0rdD8bNxVFZGIg77zYIgf+EDMu1fuqBGZ4V0mffcolTluvbUP5yd?=
 =?us-ascii?Q?H5oWKEWo6sisY8WArtkzvXOW8m8+3hDu7pHpD7FLevDLhnDDNBqjfi7Ur6X8?=
 =?us-ascii?Q?oqwxmmuDOvX9ETn5S/c+QsEOtSjAe6pfDP+1CVBYpNvohqPuirheIOWIvkax?=
 =?us-ascii?Q?oSa7u9Zvlh2hgnJwrQwueuSAeF+ex8sXxlsHNA/QS2/Wf9PM6DdrjT6I2GzS?=
 =?us-ascii?Q?xAMaqLsedTAylXyiFGWxR6LbtCMAlwiT6X+IOsPd+0XRrk1ze6LF89T9jjoa?=
 =?us-ascii?Q?jMqgr7zSR39sd/g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tPeurvnuv96N90V02iyFQXjlE32iwUgKzu90y6uD9EcF1HwsRraaemLe8D03?=
 =?us-ascii?Q?aOi4G0z/2/RR1ibn02+yQYrDOIPpvzp4ceN9E2GQ5HUeekFsH6yfup3/kPck?=
 =?us-ascii?Q?74tVft6YX0OYsw5nZZHjP67HeeHcCb/M+Q2GdyTfmFgtzfTSLCKYDWKazuw+?=
 =?us-ascii?Q?UvJn8/ajSXhSlJusMyiS8k7E2t1rP4/gN7GtF/BMIUwz4/DC9OMnnW3Zn8EP?=
 =?us-ascii?Q?6wOHb5n2VTAQHfoqEpLjbgzJLE4yxZafarUaWFZqcBIB8D6B8D/Qw1KyrbZH?=
 =?us-ascii?Q?y2ndM1Geq3AQfHyqXMvrsnb1eQm1I6rmBx5UooobpIzXp1ymnDePIg292Zix?=
 =?us-ascii?Q?dzfgmkWYf7DfRbcv4L1lkb6NOM8L+7rIjVLuVEfh9c6WlAlryC4NoJyrcHFH?=
 =?us-ascii?Q?RGPJqpIkgVkjEzzrbEdfrns08e2GvmYc8kxlpYsHuKZDoXS6vxTTwueCYJYN?=
 =?us-ascii?Q?vB1DV0EtAPxCFLZHfKL2ROXQsFgTGH8qY+A+TRTDY0rQat63ZEd0rrwB0T7W?=
 =?us-ascii?Q?koBx5tDbZrR9bkqhRjjUpJVfP5Hmna2RP77geZnTZm7JHl0anM+B8UeT1dGi?=
 =?us-ascii?Q?llqxY5x8PM6Mb9KYlOMIXqrTcz5kXwpTHblwCoyIu1aH8Q8VxcbJxkVn93mv?=
 =?us-ascii?Q?K9UsQ+xgW/oliREK9sOg95r2z1cNcGZlngLSRQMM/9HDJ8YKp361EUIhOf4q?=
 =?us-ascii?Q?EwLHU9Xrhc/XuUwG5AHHsnrroKvFh+n9dUe1QOq7jY/VDUkc1zZcRlBKt7UX?=
 =?us-ascii?Q?ueSQ8MrJ7DbDsGk3/7CPRAqsMCkNXje+X9hgvKk53rx9Ac+LFMHZsaUGjdJv?=
 =?us-ascii?Q?iiaHoRdw/XPr2k6X8lseuUDPltsrkM1u2/azp9zlrLFE5tOI/W5uL42sap5u?=
 =?us-ascii?Q?vbBmdHigx4DXRN4C1I5Z1QqgRVhMst/4lUBYfqBwZaOsSvQanYDvW2Dx+BAZ?=
 =?us-ascii?Q?01uzuq1yCGZjIf6ejJnkBgfbOOcd3SV3Hcmq3pnPD5gfi99QZUNTcPvlmPBZ?=
 =?us-ascii?Q?EjIOL1tw0ePC63bhlctEGqIlAwvzbGm+txhpfQcE60LKl7VDeuxovDBwnMGW?=
 =?us-ascii?Q?yl2Bc4Fv/i8t5ZmKGdBxEtsBgH9S8s4NkrIUasoXVX+6t2zlt7Zu9PjRMmuM?=
 =?us-ascii?Q?MSVyXncDbsGbzs9/yVGkdKY9RvoFKuBjCOmzOqrwkksWXvFmJQ78Wa+6t/hI?=
 =?us-ascii?Q?5NUZfb/IrORXBoyOCqw3rQp/LkS6I+bwNSrRR1GDaqyfPdccwZVCcQNd5HIC?=
 =?us-ascii?Q?VfZXpJ943ZWwcIF/sT3bNG1m/2smh6hr0QWI8lqTKpLQJMJOywJKGXCqCPvM?=
 =?us-ascii?Q?moWVDESSQP+AL1zVbx+cBJu1+uxS0fRlBInY2kafMm0gHEG/NN0hlrDwtcY8?=
 =?us-ascii?Q?GBWcXGHkyOT3nwuXxMfcyqP83v8mjmD6ImZ1qIYyRWM/jW61EpeZJV0HYghU?=
 =?us-ascii?Q?onK/JDp7lsdsampC+wpIa14oIf0GuE+qLTytCOPEO6/Nh34P2KrO9UeqoKi4?=
 =?us-ascii?Q?qt/WTZ3xyYKClh5RLRwNKjtK0LmEd7lITzcAAU4J9JmGpALxi4Aq6458bg1o?=
 =?us-ascii?Q?vP+tZY0ymPcfUwAuKcv+n6w4abjPaLSWlNtlsRJ7AAfXOWorh/ite1ifnrWc?=
 =?us-ascii?Q?5A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a37d51-34a6-4a0e-1d1f-08dddbba6f33
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 05:13:13.2015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: moVh4iBmslSaJ7dTOL+ASr8kNOFVRZxeOyTjh+1RO3pu2D3pbjko4j+chzmrxBieaXbsk7bWbyW/2vWpEfrMDUvxaB5emrmQG9j0aY8FsGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9312
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

Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 28 July 2025 21:15
> Subject: [PATCH v7 2/6] clk: renesas: rzv2h-cpg: Add support for DSI cloc=
ks
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add support for PLLDSI and PLLDSI divider clocks.
>=20
> Introduce the `renesas-rzv2h-cpg-pll.h` header to centralize and share PL=
LDSI related data structures,
> limits, and algorithms between the
> RZ/V2H(P) CPG and DSI drivers.
>=20
> The DSI PLL is functionally similar to the CPG's PLLDSI, but has slightly=
 different parameter limits
> and omits the programmable divider present in CPG. To ensure precise freq=
uency calculations, especially
> for milliHz-level accuracy needed by the DSI driver, the shared algorithm=
 allows both drivers to
> compute PLL parameters consistently using the same logic and input clock.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>


