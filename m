Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75437A43508
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 07:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A4310E116;
	Tue, 25 Feb 2025 06:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="AlskJxWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2566710E116
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 06:16:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0KgGv0wZER0pmsA/d+z8b2QjusKDkm3hiBhIQUz7oezZTPMVy976W2qQzi+gLmhH8/FcLwsCNsN88yMhCi0BhZpKZjsvYi/XiUPK7WCQJwqmY1TI785vC3wLUmPGJJBPIBgeBW3w7zbu8u2jsf9ajRhiuKygVQFrARO6mSPVidJqyBerr4D6Z+aU+h0KqGE1PidZrpOwrh3iBLQ5yvUkvcR8R/3IviLfqWroMpRKx6OO1ZMeBzlRnFxNeUHD6IIpwi13nD/tqPICNY/e73fM/0fe+IWrCbvO4PlgmDbIEHwJEa5UBSy2cW2k6ODGGf8czA+BMxR78M/1rLuUdL85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMltxy1/wD4qM0oWoxUkpsuo7IE2Iho7RFUOlhu7mi4=;
 b=iiV58X3H/IMv9VZidvRgjG23EiraKvYvuwFEkkqaxxoiR4B59Po13D0DlJw7pdx/gGY81oURpvs9gEN6hTtLPbtQGRoXFAik9AGUGbgXUUr7UiYkLANGe3w7ijOpVomJqmFoAXUfiv5jK3yGrHTaK04MoN/L6LOUbI1WfMudg9vzhb4VuNwtKrq3PyB8uVX/FbFByFJbzWYOzrxyjJ3z7M7maBO5+apezCtpNFMtd+U02TAPot93V7abRv36umgKKfebmBD7wCfAL7Wa3ERE48XQL62HfEVtlI/qllS4mmHEtu3putlOrAoLAMDSksEFw0DtyZxRJAozVAfNcZvoAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMltxy1/wD4qM0oWoxUkpsuo7IE2Iho7RFUOlhu7mi4=;
 b=AlskJxWhyaQicu3QLSFUJ7qdUegt/Ph2MyrORqMQQ+lUbLx3I0s6BASGkeNtJJYvSkXViC5Krlq3Swx37QFlpCaWEdJfbjRI5COE6gQqtdIrlWb+QnzooZD6Jhp+BhQDMGOOOIBgZHWCJDgiuSh/XUp8b1p7ABzX93Jno6MQ+To=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB12125.jpnprd01.prod.outlook.com
 (2603:1096:400:440::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Tue, 25 Feb
 2025 06:16:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 06:16:51 +0000
Message-ID: <8734g2sg4t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, linux-kernel@vger.kernel.org,
 Algea Cao <algea.cao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, Niklas Cassel <cassel@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 FUKAUMI Naoki <naoki@radxa.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
In-Reply-To: <87frk2sumw.wl-kuninori.morimoto.gx@renesas.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
 <BA73C4A1-C680-4748-9CE1-4B3B19A14261@gmail.com>
 <5E535D58-AEFF-45A4-A1EA-1FA282F366AE@gmail.com>
 <4988041.31r3eYUQgx@trenzalore>
 <87frk2sumw.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: multipart/mixed; boundary="Multipart_Tue_Feb_25_15:16:50_2025-1"
Date: Tue, 25 Feb 2025 06:16:50 +0000
X-ClientProxiedBy: TYAPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB12125:EE_
X-MS-Office365-Filtering-Correlation-Id: 080264aa-e0d9-4319-9e4c-08dd5563fe07
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|7416014|4053099003|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kKQyU7LMz2MhAkHZTpDnjYV2r+m9ywc7DbrI/oSLQrZVaLlZtZ9tVuj8TDiq?=
 =?us-ascii?Q?w8geinNYz8NWT5u+SQMHpQd7j1jNiJa9X9n5INqtzerAAlpgvq+4t7tP7+/z?=
 =?us-ascii?Q?2FxZSLxm+oArkEotuqtBZsYRxVD3B3oI/L0RM6nW9DeqOHTdf1dFAli80BQY?=
 =?us-ascii?Q?Vhz0qVlwS6FZIABXbOuhK0HMIWeW/s0rzIay9GXSv32Dz6pf+/dBfqrf8kwl?=
 =?us-ascii?Q?+/UhU98aVM1fakIoPkK/9KZlSqr22pE1yr8EggHNbaIKd1cN+dlDaO8lQEUH?=
 =?us-ascii?Q?RgU6XB9OoBq4rVoW7rV6BLMWZoFY4hkaX8CkHhXIX1Y793fVcCmiKIOLsEB/?=
 =?us-ascii?Q?4xudl/tNrPX0njVcs3g/zDZkx9dUEWWtq8i9qz0JX5t4Veva8UUrtEg3tstd?=
 =?us-ascii?Q?rqSVcaVWZtiAch70xcYkACv4ZBWw4GaG4V38QS9XLczpWwjAYvVsAhKwtumV?=
 =?us-ascii?Q?YPvJiWJDPfzjPXLGVmw7nSPSLKFQHtXwdBIKJlolIAkxevV35DQeTnKr/5Iu?=
 =?us-ascii?Q?nqbRpbtXNn+G+VmpyLgUFgr9RIrevTttC3xlFJV22iIq/bWya5PVcJk7/oX8?=
 =?us-ascii?Q?kA1c0xCme4AH9AX7P2Hwx1iGlF+lTudj0O7zm8KaLYFKYqRoN6vn7wH8qsgr?=
 =?us-ascii?Q?cPb+7m/aaPD7zl7zxTTEkvSksgkQBjNwWSfj088pShcbv+ipFwciu7hN5Rd4?=
 =?us-ascii?Q?C+TQ77v+kKEkmso/25AX6UuKgbtVRfYNnRc/0Deon7Qif/g12V+XjXfkvBRI?=
 =?us-ascii?Q?5raLclg8QsRTWSFkHcgRDzHerqJGZbpB6Gf1quP7uq6gcxcBkLtAaLzsnMpz?=
 =?us-ascii?Q?q5IKAgp52PM5RJ8NG4vE+1SZ0Cow5BCJ7L/WYborpZaWxQLFhi1kWEyRHD5w?=
 =?us-ascii?Q?hilmWJ757gUbb59HxFPwovDrckwX3Kb5RA20AgQBbiefw1jHv5bOPn6Jw1d2?=
 =?us-ascii?Q?Rc64bUa/g5chGDOeVM0T2zJer2cCVk81hoZ4BewbYeMTRo3wVwTdcZfWemdh?=
 =?us-ascii?Q?VQn2JvZExc7F6Fb3xm6cUq+3VpKhWnwBQAXzt1CMx2JSWH0r3AErcYDum//Z?=
 =?us-ascii?Q?ReF7E/Dt0kbJocqNUjLYR9MWwLllG4oquv/b9h3AyHFvac9Yt3XgEJPAvGeb?=
 =?us-ascii?Q?29XA6bQXKk9cb9UGoY4YwyULfKRDMnjAgO9dbY2184SraQmfjYT4hEcqTj0k?=
 =?us-ascii?Q?ws1eQ+yzo36zrqTJSOXKL4BmbxwoZPs4B9RrAEVCxRpJ9VLi2+BKtulthL6t?=
 =?us-ascii?Q?JlPhtaRohx9Wx0RimPA/0ZLi9z06XnUC0Ad+mk/NDOS58vkg9iB6pcPx4vcU?=
 =?us-ascii?Q?I3k2OkmQckj3BH6mosophYCDhDHH9h3FiNa8I6zRYSLkHRIrU8dFMpbwCXyR?=
 =?us-ascii?Q?dT8GYINvbBuU5d44REvl0YPXX+qq/dwCmHo7pOFZP4IPYqVIVxbQohD8dQKe?=
 =?us-ascii?Q?LyBgeCmvGL9ze9f8Z+adVyzWW03VhpNE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(4053099003)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wTcJvlWc0845cS0tHUwhTmH0sngYljf0TMXizr9RCsmk/REt09y+iiiqgaor?=
 =?us-ascii?Q?AYhKF+4JrsSlt4ZEy/QINZ7HHm97aJTgW8joIHIMssUnHcoXPx52mqQYXJ7w?=
 =?us-ascii?Q?TCBGVKQA6lp4w5BqMYJ0a9JgNpStISk76cAgddKSRM4V9QeTe21L2uqEpJKO?=
 =?us-ascii?Q?rksbzLbnU0aCCW1TCYx69lYmuSfxuvliLOvTR9GZr68Mt9uptcARdC4Bh6lD?=
 =?us-ascii?Q?o+dzdKv+sg9QAOnt9fdreKfYd+V/f57NNOd/MbVP2ifo/zYVT97Izkv+EFsu?=
 =?us-ascii?Q?zE2sW1Vwp0+oAQ1DcnTbAxWbrPKtlfe5OgIcxTXEKHSZ3jqI8E6fx1JA3+X2?=
 =?us-ascii?Q?EkW7fkvm9SShdmDnMD5f+ky9pDSMSQjCnCM2o30cXrfmSFAw5lf9ouCRB4YK?=
 =?us-ascii?Q?XwXTmferjHZm7mFVnc/rL+wzSA6RujDhceEXyyjP20PlkFsqDa50GO51ZJFg?=
 =?us-ascii?Q?JUZYlbaBabffP3yRxVaQabJs8UQTErvwZf8dQY0L5l0/seGOQtexofzeciWB?=
 =?us-ascii?Q?KjGLQIlMLp9G/pZjptxvNpRyd4JIB0WX4HsfpKoU8AA665Bq0bt2nuNcTYYV?=
 =?us-ascii?Q?UR9jwP9kgHqgiX7sYIdA4P9bZcnf7y86d70JH9mEaA6BFSfbMTr8gzWutd1V?=
 =?us-ascii?Q?6Vglbdn4UOHNwrFMiRJY5IfngXGq/SKnE6let87xR2nnnQwMxgcuAgNo56KC?=
 =?us-ascii?Q?Sw4qazvZVcqE3BLEQwO1xTwY56D/ba8z26WOb736zwRIA339BBPrAbvZCOz5?=
 =?us-ascii?Q?Y6b3lJDjI5ziDFjaKt49GBODwOUrymTtWLHRBdLtz/9FDOxZHJkaFyqqoPe5?=
 =?us-ascii?Q?33L6ErxsGea2P/RZv0gMQMaWkIOpSVbDOcHyHwz7utTuD32mQ8rM42UM6Izp?=
 =?us-ascii?Q?i2uIDvE7ZgBcWMUshK9dEinqQMrJBFPJDy143JOUi/ijRZv7IuPPwncd+w4C?=
 =?us-ascii?Q?x5oBeBnQzZZSJ1a6jaoOFCh5mnen+suskiPeuGq60EtGv+CKDM6CsD2YOAPs?=
 =?us-ascii?Q?bMLQGnz4zz1Xw1ki/EZON758PY4VKZb5ujPYotePcCAD5v7XmI9tsiMuPT7D?=
 =?us-ascii?Q?9hQzWpSQonj4mhCAVjthD6TMZ3PQTvFMTxajFpZYHswA/lyOX7T2T/Jk0Tak?=
 =?us-ascii?Q?y0ppt2CDIk6+IfstapaU5mfzbSun2dKcHxY6PiMz/xrRlSHle45KkHNs9LRp?=
 =?us-ascii?Q?TvzpB4U8TvIifvKWXTAyWxnfkwZJvIltsdVby3Jw+2tWpyfsgkfG5qkcWcDQ?=
 =?us-ascii?Q?OHIYRfX5sj+v6GXFFbAoA64TMVxD1YKZEI5EQfjb+BH7NbcOSOK00rwAJF6w?=
 =?us-ascii?Q?+YUThvRYon4hWTliMOG5Wjqt5kaO4nyjUxeup3DJx8VB/KQKhvIHwn9EvSXi?=
 =?us-ascii?Q?TjTCPRics1mn9yVWCbXXD32oiKdG26fBDntXATyf0SOHh44Yl1XIzwBoTmhb?=
 =?us-ascii?Q?NUSLbjnN1s7Z8XeKfHkY9fNinSyuv7lILA6fcwVDSNL4bODTY3kjQWsLfTMg?=
 =?us-ascii?Q?FMNduY69srMiBuFT1/XVun/EotVH+M+GQSOfEy8fDgFvErDuBuzmpWzYcbka?=
 =?us-ascii?Q?zM04hZcwxJKIehrA8OuHWUrDlccs8nhImXdQmVttSgSDRPly4CwH72VxCx8I?=
 =?us-ascii?Q?IF7y70rT5BQoaHcIdnd7eYE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080264aa-e0d9-4319-9e4c-08dd5563fe07
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 06:16:51.0277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jg/rd4ddVhsMEu9rrwaPdU8qXQxZdGIuWFTIgOw8ibWDXfMQwyCvtkq7SNRkHYUc6IIiWKKrPzaHO9ALZa2tly9u1c2aiOIer0Q8OXAUgch9t2J45oJNoTj5duVwhVhY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB12125
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

--Multipart_Tue_Feb_25_15:16:50_2025-1
Content-Type: text/plain; charset=US-ASCII


Hi Detlev, again

> > Especially those commits:
> >       ASoC: audio-graph-card2: use __free(device_node) for device node
> >       ASoC: audio-graph-card: use __free(device_node) for device node
> >       ASoC: simple-card: use __free(device_node) for device node
> 
> I got same report from our test team. I'm now tring to solve it.

Unfortunately, I can't reproduce the issue on my environment,
but I guess I found the root cause. Does attached patch can solve
your issue ?
I will officially post the patch to ML, but want to confirm it before it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

--Multipart_Tue_Feb_25_15:16:50_2025-1
Content-Type: text/plain; type=patch; name="0001-ASoC-simple-card-utils-Don-t-use-__free-device_node-.patch"; charset=US-ASCII
Content-Disposition: attachment; filename="0001-ASoC-simple-card-utils-Don-t-use-__free-device_node-.patch"
Content-Transfer-Encoding: base64

RnJvbSAzOTk1NDc4YWU4NDI0MGIyNDk2NGE0NThlY2JlZmU5ZmI2ZGMyMjcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLdW5pbm9yaSBNb3JpbW90byA8a3VuaW5vcmkubW9yaW1vdG8u
Z3hAcmVuZXNhcy5jb20+CkRhdGU6IFR1ZSwgMjUgRmViIDIwMjUgMDk6NTQ6NDcgKzA5MDAKU3Vi
amVjdDogW1BBVENIXSBBU29DOiBzaW1wbGUtY2FyZC11dGlsczogRG9uJ3QgdXNlIF9fZnJlZShk
ZXZpY2Vfbm9kZSkgYXQKIGdyYXBoX3V0aWxfcGFyc2VfZGFpKCkKCmNvbW1pdCA0MTlkMTkxODEw
NWUgKCJBU29DOiBzaW1wbGUtY2FyZC11dGlsczogdXNlIF9fZnJlZShkZXZpY2Vfbm9kZSkgZm9y
CmRldmljZSBub2RlIikgdXNlcyBfX2ZyZWUoZGV2aWNlX25vZGUpIGZvciBkbGMtPm9mX25vZGUs
IGJ1dCB3ZSBuZWVkIHRvCmtlZXAgaXQgd2hpbGUgZHJpdmVyIGlzIGluIHVzZS4KCkRvbid0IHVz
ZSBfX2ZyZWUoZGV2aWNlX25vZGUpIGluIGdyYXBoX3V0aWxfcGFyc2VfZGFpKCkuCgpGaXhlczog
NDE5ZDE5MTgxMDVlICgiQVNvQzogc2ltcGxlLWNhcmQtdXRpbHM6IHVzZSBfX2ZyZWUoZGV2aWNl
X25vZGUpIGZvciBkZXZpY2Ugbm9kZSIpClNpZ25lZC1vZmYtYnk6IEt1bmlub3JpIE1vcmltb3Rv
IDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4KLS0tCiBzb3VuZC9zb2MvZ2VuZXJp
Yy9zaW1wbGUtY2FyZC11dGlscy5jIHwgNyArKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9nZW5lcmlj
L3NpbXBsZS1jYXJkLXV0aWxzLmMgYi9zb3VuZC9zb2MvZ2VuZXJpYy9zaW1wbGUtY2FyZC11dGls
cy5jCmluZGV4IDUxZTBlNDM0NTE0ZC4uNzlmZGQ1N2E0NzBjIDEwMDY0NAotLS0gYS9zb3VuZC9z
b2MvZ2VuZXJpYy9zaW1wbGUtY2FyZC11dGlscy5jCisrKyBiL3NvdW5kL3NvYy9nZW5lcmljL3Np
bXBsZS1jYXJkLXV0aWxzLmMKQEAgLTExMDIsNiArMTEwMiw3IEBAIHN0YXRpYyBpbnQgZ3JhcGhf
Z2V0X2RhaV9pZChzdHJ1Y3QgZGV2aWNlX25vZGUgKmVwKQogaW50IGdyYXBoX3V0aWxfcGFyc2Vf
ZGFpKHN0cnVjdCBzaW1wbGVfdXRpbF9wcml2ICpwcml2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKmVw
LAogCQkJIHN0cnVjdCBzbmRfc29jX2RhaV9saW5rX2NvbXBvbmVudCAqZGxjLCBpbnQgKmlzX3Np
bmdsZV9saW5rKQogeworCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZTsKIAlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSBzaW1wbGVfcHJpdl90b19kZXYocHJpdik7CiAJc3RydWN0IG9mX3BoYW5kbGVfYXJn
cyBhcmdzID0ge307CiAJc3RydWN0IHNuZF9zb2NfZGFpICpkYWk7CkBAIC0xMTEwLDcgKzExMTEs
NyBAQCBpbnQgZ3JhcGhfdXRpbF9wYXJzZV9kYWkoc3RydWN0IHNpbXBsZV91dGlsX3ByaXYgKnBy
aXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqZXAsCiAJaWYgKCFlcCkKIAkJcmV0dXJuIDA7CiAKLQlz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgX19mcmVlKGRldmljZV9ub2RlKSA9IG9mX2dyYXBoX2dl
dF9wb3J0X3BhcmVudChlcCk7CisJbm9kZSA9IG9mX2dyYXBoX2dldF9wb3J0X3BhcmVudChlcCk7
CiAKIAkvKgogCSAqIFRyeSB0byBmaW5kIGZyb20gREFJIG5vZGUKQEAgLTExNTMsOCArMTE1NCwx
MCBAQCBpbnQgZ3JhcGhfdXRpbF9wYXJzZV9kYWkoc3RydWN0IHNpbXBsZV91dGlsX3ByaXYgKnBy
aXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqZXAsCiAJICogICAgaWYgaGUgdW5iaW5kZWQgQ1BVIG9y
IENvZGVjLgogCSAqLwogCXJldCA9IHNuZF9zb2NfZ2V0X2RsYygmYXJncywgZGxjKTsKLQlpZiAo
cmV0IDwgMCkKKwlpZiAocmV0IDwgMCkgeworCQlvZl9ub2RlX3B1dChub2RlKTsKIAkJZ290byBl
bmQ7CisJfQogCiBwYXJzZV9kYWlfZW5kOgogCWlmIChpc19zaW5nbGVfbGluaykKLS0gCjIuNDMu
MAoK

--Multipart_Tue_Feb_25_15:16:50_2025-1--
