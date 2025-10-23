Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD54EC02EAC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 20:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DF610E035;
	Thu, 23 Oct 2025 18:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="JmwnTkOn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2FE10E035
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 18:25:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBDfJzUkLprQwjd0lLGjy+W3vRTRB+BJZPg7xArMhAHuWhnVu+KSI245/8h9EmdbBre8PsuPhv9nvNC5fkKjojN05yYaQuf+kDOH9osGYtad8QhAcj6Nt0VnseA0pEJfY5yBOX2HNnDjp8AignCpGlcqBzDP5/5Bks2ZzW0a5x4TTkwx2YskLk6+ak3qFhr9sIbqvZeri7oYtGu/kTPWcYT/tUyhw/eP6ltiJbyCwtLzKbbcVCZIkljybHxUZlu27aYPrrlTH3Ysvav9DA1q9iBzx5XMkoXSUDUaW2SnaLxgWSK15mcKbCFj3To/ynHDt06iNn1mIzBJEnOFS89oaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2fC5iLkEtLoAyRcWvuRt1RbjNB6fLMDjAN5A0Os5hs=;
 b=PbDWm9CT190Qr/fRqjhY1jSqvNh1wF2tMbQzu0S+OUjyS5ejmPoiAP+SICHTJ2tWRRKiVT3LHAeVM6w6B51WAfLQVi46OtEMz73Eg/KvWNa6qEQJgmWv7H9GKg9UzvCX7hU93BfUUZDX0WoBohipykX54nF71I8JAwPjb01f8Mi3sHeUu2RiKjHq+5ekUvtz696Q5r7NNpHmkoCSbjRmGwfi1cGPgpOY2vucXay8ikvUvujWqZOof1uvgyxI2NAPzQChLbJvRzMWBSv2LRkm5/ND59E1zFcgXuH46yBVMre9e5xKIibnGhlxP5AipJ2lPENMJxxuWsIFchDwYYZMIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2fC5iLkEtLoAyRcWvuRt1RbjNB6fLMDjAN5A0Os5hs=;
 b=JmwnTkOnW5sim74WZOoqA+YSvnaNNLr+AMzy8isoN34OyW6sm0fEsa8iCDL8gNfvQqyz6EPiZAK0+FTV8OCIUZVO6+6sVEusVLL8opMSb0I4i4EtyNFbCze93e5CAMY1V4J1/5dOg48jufRjwZ/MRoWKL6C49HpIvWVEOXZK9P8=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TY4PR01MB14418.jpnprd01.prod.outlook.com (2603:1096:405:239::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 18:25:37 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 18:25:37 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcQ6/1iluAkL2rhkmyfDQl5Q3u3rTO9w4AgADrIhCAACUTAIAABWBg
Date: Thu, 23 Oct 2025 18:25:36 +0000
Message-ID: <OS3PR01MB8319CA634982A6A3A12AD9D48AF0A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
 <20251022235903.1091453-2-chris.brandt@renesas.com>
 <20251022214906.eaf123bd740ac9e396a65570@hugovil.com>
 <OS3PR01MB8319C5F67878677D380EC53D8AF0A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <20251023140322.a4d6777f37dcb8177480538f@hugovil.com>
In-Reply-To: <20251023140322.a4d6777f37dcb8177480538f@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TY4PR01MB14418:EE_
x-ms-office365-filtering-correlation-id: e9e159b8-7ec3-44c1-416d-08de12618ffd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MovIfoXFyBZJOTP8aP5dV4gtXZHAM+OE9o4zeXOtIgr+a8M4TX2mlRpZ0v3j?=
 =?us-ascii?Q?SV8BEnEAEnFxLkHR/sFm3n2zDD3iIGo+1JTwSZf4xTKUzyEQddRi/bVjURCa?=
 =?us-ascii?Q?AAPKeIsGPofTBrAhSAr4t79Wee0geFL87HsUdpvl73dc9fWVmGPAkpLRxnGn?=
 =?us-ascii?Q?oEVX71ecySWI0uHad7NUvCPv3aEyWAoZk2trMJLNDMJ3e6Xh3UYZKjEOrMqJ?=
 =?us-ascii?Q?Gz2re+4Mnl8zHzrXF6cEURofH399S1n1gHx4E41q8wa3dpwyGjAYHa1irWzH?=
 =?us-ascii?Q?ugWd1xdUOD8KQcM2CZuO5mRizb5BeZdRUZ3fUUUEpPkZAaR0k4IkQluhcZE7?=
 =?us-ascii?Q?rMyTMbdGJD5j/VhXRTzyHyvTdiEC2OEc/hAR+URIyi5W4TjzxyRgCPSQeHKK?=
 =?us-ascii?Q?pQN7iYMjkRBo8eUHPg2XNwsB7XpGxIhAYEWK61xJE/sWJYL7uJRG3i+DRgXX?=
 =?us-ascii?Q?o/kseJ0emzzVl9Xy9FCdpwcem88+3CPTdElI2iEpq3odrndfVe+yt+8YmR1o?=
 =?us-ascii?Q?YzSGL7rX/97jC6le2zjOR8zcFfTb+SpBR5RwPwpwgYrU3Vjdh+md7quRLcos?=
 =?us-ascii?Q?8wGfUqCeSbuTeseJ5PmH+wOPR5hT7Ha0VzvQb0INCWcYrLV/hQtKYtdik/Es?=
 =?us-ascii?Q?1SB52d7AeWXqkjeIKKnlbeAufMD4EjMRrO+Bc8T0/fdbMIDyuihw5jW3Xv4f?=
 =?us-ascii?Q?gkiczP3BVjOH4jl7BurhiVLHss4FV0WuFrtNkx7b8QOyrhT21fvQkQ4F2vdc?=
 =?us-ascii?Q?kRGTVN7xOE6jBY3ou/Jwa23C9YRhSoqKdxUTO7ghm2XSPEH+1uK0MVs9tF9c?=
 =?us-ascii?Q?g+A7sTSxeex44PxmFFsNvXic/vOmDbeOmuFe0Ox4YeFqerYsZOLeP04+1PQ/?=
 =?us-ascii?Q?SSrz+wxmvaNlep33jWiTaVEIGuu8NZi2UxuxvgSN7yQiuU9iVSmZQehKn3m/?=
 =?us-ascii?Q?+cxzTIIQ6IRRdvl6aSwo1D0W2WaRXUDs8WwKT09mbDg1gtyvblcIx78qASh4?=
 =?us-ascii?Q?K+ZAdRGZ+Z2A5W9WUFsaAIjVa5fe96kevoXEJ0qdCOyuGYeQKMo3oFniqepg?=
 =?us-ascii?Q?YTqRQaL2R+24V/f81NdWCEOvR2uZfWA0Cm++0mH5br+TWyva8oi/P3achbQ2?=
 =?us-ascii?Q?6hIsfZhOcIUAYEumxN75Fm5ucvNQbOCo4hXvaGPKC3GyV9scsdisDPT/rONY?=
 =?us-ascii?Q?TJiIrqiMAh2tDQUncLYVmT+EeKhSieojwFuwcFXKvwVSgMhTSQP1jW6FErH3?=
 =?us-ascii?Q?e031ADXcs89YV4W81gLfQAvUFN2i+lX4a0zC77s549cvpGV+lasOwPwBUH/Y?=
 =?us-ascii?Q?6p/V9nAyH+YeMUQfrggPYUNqI9NBQq9D1CKuFPgrNtLSW2KTTehMeaEDty+4?=
 =?us-ascii?Q?0uZgY6DHRuF4Zgu8L8EskqUdgqUEDB9N3iGeMShQLGCGAsnvTDraZQF6GZrQ?=
 =?us-ascii?Q?Y7Cm1NtVVvn0HhCdOjmANXyR7SvkqnfgMWfHCkL4q9tz53gwuQbsIIh4M1HO?=
 =?us-ascii?Q?KVmmcTk7KtJccOxEfrqCx4MoY6Ql7DDy/X0l?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rcmXkE+13LbVzVR2QsvTgzjBu6+aOdJ8Z0ESJ6t/vruD6Gr6oocd/haHXvdS?=
 =?us-ascii?Q?7JCYVwWY+FFZIgYFxyMVkf+ARaZGz0wPgbq31xPnVcKsI3kp41kUIdc4qaus?=
 =?us-ascii?Q?tWKgfniVCIEsde2rR2zUl/PlS1N+r49PHyXt0BQXkyWuWHrKza8wxp3s7AVH?=
 =?us-ascii?Q?wu4QfeFMlYCGECoSVxCf1D+Wy7ZHamtcMjKR2ErM7NubjvSwJQY7bB64+iIU?=
 =?us-ascii?Q?y2ZEXBzae71MWdnyChWVXYcDPKyTiMX3W4d0wp0VL/7FaRKwVWFFFPdaYj8S?=
 =?us-ascii?Q?2UIF5hOLPrRzXj1W32lctKQ3KnaVjlPt6SaUqv4RZ/WMnhofm90pNzjpPbnN?=
 =?us-ascii?Q?vTK5swH/GVE8TiyUZpR5WEbCs1LosLgyCffcB760vDRVY9+WQR36jeNtjaxg?=
 =?us-ascii?Q?TSnlVp61CNeDK3XkEMTCGfd9eWDbXDRWXYSyjcbbaK9XX1eDRlOf5GeBpJJb?=
 =?us-ascii?Q?qqIxfiNknxLeZ3KXS00jWUWsfrqTmnQkMoN0xZe9UjLm9Zi/+NWvDp3qme+l?=
 =?us-ascii?Q?Q9T8mGtt/cFRPtqUgTpe/p/aPDtM809L9houdV4mxNUJ6zL97Rr1jXZ4NkZa?=
 =?us-ascii?Q?EU8TFwTEV2jDD3rIW2JXLc1puWtS2lGqbzAKm4HfqIwR6rSSq3FcC6dpjY/9?=
 =?us-ascii?Q?gpHICoHK4+62I5e3TAS+xJ8YGzDmCf4jyjof6y8tV09yoHjByzd2YED0IkgR?=
 =?us-ascii?Q?NuBCYazgYkATvMH83KMK6EErqcVpiFlbnUeQ1lwA6mSB+pcxr8Rq28U4Ju36?=
 =?us-ascii?Q?9YqYOG3J23xXn+kDnVOAf9vuYe+lLVtmGVESyFeG6ixF7STQEXel0iFKfxxq?=
 =?us-ascii?Q?53LPueaWp9VZj9jRbYYCedkXLOuSo08YYwpjbSJHvFG3vC2aryNazq34kuDe?=
 =?us-ascii?Q?gmu50jUWfWYuaSLZ6WlBw2J1gyu9683DNWuNdECBXR8zm9YBvV0YKh5hXJ0T?=
 =?us-ascii?Q?MK5MprtthXhf283b2+M7i3hUbFx61TIB2WxWFn54S8lm9v7TsO84I0uVWDtQ?=
 =?us-ascii?Q?yQvbCVPHcn4h7aF5qCdkoy4coD9Kc9nsSIKA2KTNZ5v6s7IBVYQRths2WUK1?=
 =?us-ascii?Q?OCIgbMAu6Uu5arHqDQQlVIatG2ZplpLt2KMJKrqhJqkC/ipy/Lt4TC27cJKV?=
 =?us-ascii?Q?LJ6l4zf+oYGfDf6BIulg0ooSSkQly3H5zgi37Fc3FDvMCpjy0yAP6XZaszLi?=
 =?us-ascii?Q?dpdBMVI+a0xusSdtwZmDYtHPBTpRZU3llGsZBcZQIjXqSLhgX+AUIH20qgVF?=
 =?us-ascii?Q?PV6ZK90JAhS5KdBsDLzy9zWbJ+dlnNAB7zm5jMxvJ8jceetls/Omlc82BCYp?=
 =?us-ascii?Q?NZzjPWSWROnveFk7rO/MMXkej123OQkNzgZ+aZBnUpyXqbMBmStaOr8tH2Q3?=
 =?us-ascii?Q?UgPL9H7Q8He2zBmnhEBgJCCDUMA/7UsTUoTd6SR2U6TmlO/fwXwR4pmfZJCx?=
 =?us-ascii?Q?p+5cd2QY6Ys4lVB5BJXD6KWxzLLiWdlqq73tBNuFNibDZaEute+7wxG9/qUF?=
 =?us-ascii?Q?HOf++bPIvTVZcXPvz7aXxY4ocynorsq8Ce0PKmmsLDGbpNKtFcerQaURYVPE?=
 =?us-ascii?Q?wdJKoKlR1W/93zLXYBGz+RpRjD5wXmgzwOkuidAR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e159b8-7ec3-44c1-416d-08de12618ffd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 18:25:37.0029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xASEzw/NB4WlavaAefBZi8jLOKQRQXmKuKgkKT/Qjgk3aBmijP6FTkurjidTLRcpvpxJLfYxqCMMDM6QBcvWAJdGMTYONeFvTlK5IBCVc20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14418
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

On Thu, Oct 23, 2025 2:03 PM, Hugo Villeneuve wrote:

> If you do that, you can also probably put this if() on as single line to =
improve readability:
>
>     if (foutvco_rate <=3D PLL5_FOUTVCO_MIN ||  foutvco_rate >=3D PLL5_FOU=
TVCO_MAX)

You're right!
With 3 characters left to spare on the line :)

Thanks,
Chris

