Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205ACC2CBFA
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD7510E419;
	Mon,  3 Nov 2025 15:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HEUxaCzh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013030.outbound.protection.outlook.com
 [52.101.83.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A9210E419
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWgheYPs+yuTJ0QoppYJUO9TXRqCDygnI61x9kxfgIkeFoTCZ0i0wOB6DMeZLbwTH3A1svFoHuKnS6miOnOOj9EtyQ9saK3feegcvNH06pzimJsTBJCSAsqbf39rT7u2s9wxGFuZwvXc4eafTLs0axKSb36AjbGXnZou3LmOzpZTurc18TPn9ioToecMux/ksiIhsQAjQaLqHmru4vj0omV3npkRebK0rNmmtk5NAO07m4XE1bBPhfSL8wfEd+GHfRlv9XyBZKFFxt9Ul0lpdsc1cWCma/5KT6V1uE8CmQmZtUPMaTsGxIP7B/vDHB7w3cS99uQ8j7ssDFyNvAk6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idCI5AHV9H3e6JN1jgb8DtvMc54ptCNLoBxGDVXcxfQ=;
 b=KQxWg0XFHDY16yGGe/L3+PnIOyjqrQtevoi1hQUW2PQsnEODRG+08jttO4kQze9I+SiZpyNZiaztAnoM7kLjl33gGPIuCWoXPkOvbufuuna62CS06ffdM+/LgmtWmB10Ms6X/K8qvCAT4RondRhaNj3lsl7foIsaHD7ZjlWsDkkLirBxbQ5xLjokEtFSDkatHGeAWVWBYYxgDszAVAPYJiNCkZj+pkhQ9Nyytn2s7aBWXeSBw1J/M44GVUc3KVfNWfkpJ8pn+NyrlWGNqlUxtkSwZQF0skwKzwyQprYyZKlfP7ZpFuuMV3JMS/1F+ukt9nTzccza3HXAiMB6e27v+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idCI5AHV9H3e6JN1jgb8DtvMc54ptCNLoBxGDVXcxfQ=;
 b=HEUxaCzhrf7BSeIUm6ys3GikDIVCKI0cPk0itEaaUh1TwuJrPFuQlYKXVP1GnWF2D5kRlDMpZAKkrC3OputvhXQElyOI5vZGEIq6qahF8Dc3BFsMOOuuIK0AEoaK0owiuz9dM2j95Pks8ugZr/Yv3iU7IFy88eJK0mXu3WhULElGDRAWT77RYLlGV99J/mHSOe0E3rf/9Fi1Ce9zwHHMhE9IanHM1yqxaDgY5KsJTvfH7wPucEKkjYoQeL1dZbzpWJMYS653NtMV7IVeGw+vvgd8LNRjFQ7kqfeD9Fn6whiPfm/niWM4e05pGcxjO+uT95n6eN9TUVCvyzOyfTwonA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DU4PR04MB10500.eurprd04.prod.outlook.com (2603:10a6:10:55e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:32:25 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%7]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:32:25 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Francesco Valla <francesco@valla.it>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/9] Add support for i.MX94 DCIF
Date: Mon,  3 Nov 2025 15:30:44 +0000
Message-ID: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250911-dcif-upstreaming-3e16d89c3385
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0021.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::31) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DU4PR04MB10500:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d8f637-13cd-406f-171a-08de1aee307b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0tRem1sUThqWTg0SjFrMDZvUTF3Z21QeFFzT2prSVY4R3BrVHUrdUNsZWVQ?=
 =?utf-8?B?WDFIQ0MyOEpKTm9yWFMxUjl4bFc1QTB3clB4Yk9hSlhYTXBGdE1tMS93dU5O?=
 =?utf-8?B?dEdiRTRTcmFMbFd6a21DSnlUM0JWa3JLL0FmUjlrSVY4SmN0V3B1SHBCM3hu?=
 =?utf-8?B?enF4dmE2MVNVRFlDN2JmRklRQ1IzSmFVbmlLQzBQSkhza0VGMVdhTElkZ3py?=
 =?utf-8?B?eGRERTEzNlZUU2J0eS9rWUFrL0lyaktVQzJLMlYvTUdkVCt2NGh0SldIeUpa?=
 =?utf-8?B?Y3JzRldHZmJIWm9vZUE3cGROdzY0M2ZORVhNcjJVVzFCb1dwSndvR1EwTE5V?=
 =?utf-8?B?WXdFOWlqV1JyUjdKVlRSZDRTcU13SHp3M3h4TFNpdzUrZHBFTTZrN3MxV0VL?=
 =?utf-8?B?Y2x5ZzQrWXRva3ZLU2pmNHV0NEtWdU5qSE8vZnlRR1dqY3hJdlVNbmdwSVNE?=
 =?utf-8?B?QzBGSWl3Qy9JYmJwVkFvSlJJaFB6L003NW51NVJWTWZadFBPNmVmMmljMnl2?=
 =?utf-8?B?QVFlWnFoS1M1bDFYSTYwT1VRZVVjbG9nQTRBT293cGtvTVRTMHR1NXBsM1do?=
 =?utf-8?B?MDZTTUlZcXhIZ0Z2ZU1VM2NZaHY5RmRGN0YzaGI2UXpJOWZGK3pZcjFxc1Bp?=
 =?utf-8?B?VFcwZVY4NTR1cFBvK3d5dSt1cFhMQkxSY2ZFTS9lQlgzL2hYM3l1Z09pdWNk?=
 =?utf-8?B?UGVqTm9qSU1qcEszdzNUWVdxaDVpT0l1U3EwWEJZcTZVMzc2TllaN0MzRHJK?=
 =?utf-8?B?SGU1bEV6T1plVG8zQTJZRDV6bm11RG1LYStPdHRYQms5OE0xYkV6UlBDVVo3?=
 =?utf-8?B?eDYzQWY3YU9JRmhkZU4xNWdtT0hxc29zblMvNlE2QUdWdFByTG9QbzdKZGdl?=
 =?utf-8?B?YkxNNmUvNDFMUzBBd2NwUkIxd1JYQVVtNnpHNnUwYlBNdEZiNUVGUFFibkNP?=
 =?utf-8?B?VkI2dW9FVnZHSmMxQUdnV3RaK3lNVWhZV3g1TFBielF4NDZuRXZxekkzOW4r?=
 =?utf-8?B?L2VRUGZ0eG5JbFVTb3FCV2pUanB5TGNWNXM1MHpLQ1NkSWcycDIvWVRweFls?=
 =?utf-8?B?d3ZWRmduZnZ1bEt4TkRtSWdtRHRsSG5HM1g0cWFhd3A0U2l6MHdLZ2NJSFhk?=
 =?utf-8?B?NUNDbmNJVkZOWm10Wnp6OGRGZEJVVllabXg0ZjdvTkxMWG9yM0IzR1NDdzg3?=
 =?utf-8?B?S00xK0h2VGxHUGQrSERTbDhKL3IvcHo4R0xsazNSRWduUW8wa3kxdjhqRDFv?=
 =?utf-8?B?RDVjbVpqNE9oakZVekhLRnJZSmpzR21jRlJTRm1xS2liaU9TL2IxZTU3ZkxI?=
 =?utf-8?B?SklXRDBZUjdDT2txUjlvR01KK2RqT0JJOCtlTVJWOENUR2NaNG0vMk1aMVp4?=
 =?utf-8?B?NVhRbXpEQ1kzZVd2akVwNTBsRHZrL2NkVGFJTkJSV05lL0l0T0haSFNRblRB?=
 =?utf-8?B?RGd6N0pRaWQ5MXVNaTFZRUQ3RjBUNS9CMXlHNkx0OFVpSzBMbGswK2NYYlBL?=
 =?utf-8?B?cnFwNGNXeGdGTXMvbHpSVFRpVitqUlpUdnZmVXJnVk90TE1XMzBXam5FNHdU?=
 =?utf-8?B?OHoxU1BXRWxHMnp5VnIyV3U1SHcxSzNHdEI5WVJTUStUWDBXNUdEZXRmRXJl?=
 =?utf-8?B?Wi9KemdSRmxYNkhjRno0THdmb3B4UFVQTlNDQTVDdjVIQ05IM0U0UVFoT1Bq?=
 =?utf-8?B?NTFNVG94aVFQVWNSSjF3OXFyd3VlRDJTakh1TlVmSWJFME4zakZGMDd2Ny9T?=
 =?utf-8?B?RG83dGFJa1hHZHl4OE1CQ1Ztbyt0eHNtUVFVaTh6TzlHd0hMZ3VFakFWVldx?=
 =?utf-8?B?YzdkTUs3TWVpKzJ5UkNyUWlKeHM2SkM0WDI2dWd0OXdXdExGY0hoMm9GZG02?=
 =?utf-8?B?ZGcyTjRGcHNvTlk0Vk4zcm9QaHhlWVlIRWZJbzZxYTlnRkdJc01nd0lCY25N?=
 =?utf-8?B?MVY1RC9Nd3ptVDFnaUIydzBFQk1WSURXZnBTUTROTDJKUTBhbDlMQm1WNi9q?=
 =?utf-8?B?TjFFQlB2dWM0Z09XR2xIWVFRTWR2MTZkWUhQL2xWWXN0NzhuaTRUZkZLU2Zo?=
 =?utf-8?Q?KNcjE7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vit1YytadUUxWWtIVmZLSzU2WFBVU0pORXVoRzJ3NStpK0RYQks5VitjWWk0?=
 =?utf-8?B?bVRRaUF2SXlYMjhPbjgrMDhvb1FNVmcxZ1V2V0I4cENTakxYVDQyRmtkNitE?=
 =?utf-8?B?allwTkRSOWlwMm14akJyWko2aitXbllody8wNWI2UEFaeGZBcjg3d2lwY3hq?=
 =?utf-8?B?Yy9wTzJVSU1wVkZIVDJwZkxXK3Y2Znk0YXJjaG5UZFRPRjZwQTF2NkpuR2kr?=
 =?utf-8?B?ckJLMFQ3Qm1XR2xJRjBZT3hBWFR5Y3N5MXdqZzFqdnQrcXgyYmhYV3dsUkhK?=
 =?utf-8?B?dXFaeEg2VDJLNVplV0t4cWhkeGtpVElYT2Q4d05nMmZxdmRhU1FqYXZiWThv?=
 =?utf-8?B?UkFoUlJFT2Z3MU8wVUlvcGxYdjg0TzNCUitlMFY4L3BIU0tjdlVQZm5qakda?=
 =?utf-8?B?Qk5ZWFFrR0QxeUN1WnR6enN2M1ZMZ2xOdDUvRXpydnptd3ZjeXdVc2daS3Fz?=
 =?utf-8?B?bTBsQUVvWnVrR1J5WW1Iam9mV3Z3bDlVTkR0dkhUZmswTWl1SHBKT2JZUHMz?=
 =?utf-8?B?ZFNaVVhRYjlCZmtEU3dqa0EwZnhhcjQ4dDc5NC8vU1Zlb1BTcVo4N3BBeElz?=
 =?utf-8?B?Q1FwQUF3U21BQkNLTnFpQnFLSjRRL2hGcFNZYWVYTG9ZUklFcVJRT3NFbXQr?=
 =?utf-8?B?M2dxaVV1SW5QTUVSOXBQajBvRGpXeXEyUThtTUhyY05ZbzZmdHRib2pnUzB4?=
 =?utf-8?B?REdTZjBSQmZ4Z2lldEIwSnllMGNEQytuUlpYQ0RjaTZlSlR6M1h1QytUWTBX?=
 =?utf-8?B?TlVORzN5enFZaXc5dm1ET214Sys5TTdQQ1BKTFpIaGRrd2F2TW1rUXVtUXpT?=
 =?utf-8?B?emcrcnlHeVdmN2MxUE5FOUJ0ZWtlbnRhbHZOQ1JEUEtDdVFMVExKTEZOajd5?=
 =?utf-8?B?STRsem9nbmdBZW5FendvY0RtMlM5M245Nm16cUx6QUNsZ2NFWWo4dDluTW9D?=
 =?utf-8?B?MTIweTdhOTZaeU85ZUdpV01ONFRzYi9YbWxqWHE3WXVVMVlkUFlUSW9EdG1V?=
 =?utf-8?B?bTBySGRkQkNVeGl4ak9uakNYSzFHOGdCTnl1bm1teHNRS1pXTk9WdWd3QVVa?=
 =?utf-8?B?YXFFSDJad1FJcWVSbzQ0bEw5QktFeUkrMWlPQUZYeG5zbmxTSW1qN1BKTi9n?=
 =?utf-8?B?dWFQVXdWZmFBek4vYVl0aXUzRXA0MVA0RlB5MzUza3V1cXJtQVFMWWdzQVRk?=
 =?utf-8?B?b3l1ZTM2V3NuQ3BKUjg3LzVMZWtzZjZRb3pSRlJtenlNb2doVWdzamNGaUQ2?=
 =?utf-8?B?Ymg5SkcwT0pmNDlLNXFwbzlHV0JyWmE5L29CbXJrZkg1VllzdUt2bWx2blpr?=
 =?utf-8?B?cTJHOGZEeG1VZE5XK01jUGd3cHlodXY2UDZlTjdtem0zVHZzZFBsQ2M2dUJ1?=
 =?utf-8?B?YWlVZnBtQ1Qza21jNUN4RWQ3dGhoUGZlUVltNHdva3AraEFpWC9QSi9VMEpL?=
 =?utf-8?B?WE55eHRyYytuMFdiak8rQzlMZWxZbEtlc3NwRWI3cUdBOUF5Tk9sdHJLZGlH?=
 =?utf-8?B?UW9lWmxqQkFjOEJvY25OcDNKVS91WnJsdFVQZzI4S3E2aGh4K3JzclFaQTB2?=
 =?utf-8?B?dDVILzNwVldyVGVya09CL0dabjA5V2I2RHp5dHhEbXVNelVWVkNrdDcrWWZm?=
 =?utf-8?B?QkVPSDM5OHJaU0dpV3ZYNzlxNTN2MXVSTU1FaEovK3BPbXAzczdiSlEvZ1Nt?=
 =?utf-8?B?dGVxUEMvbFozTEtjbTErS0VuMVpXcXVaRE5ndnBkaVBxbkZ1OTBRRTgrV0Nh?=
 =?utf-8?B?SmVDblFhSEdZdkhsanB5NGoyamVTMDRBbEdIdU1RR3k1NStzc21NR25saWJX?=
 =?utf-8?B?QTNDYjFpL3ZRdUVIWUltMXRUR0VvdlNycThtekZQK0QwTkw2S3VlUGVVbThS?=
 =?utf-8?B?c0dNRnk3Zkh0SkFnOThUQmVpcHFuVG1HMHg4TzZScnZUUFNKZm1Ja2tEYS9K?=
 =?utf-8?B?TGw0Rnpjcmg1N2JwU1dUQTNJdk5QMGt6bGtONDR6ZkdPeGJlOC9lOXpCcTEz?=
 =?utf-8?B?Q2hrNmhPQUdsRnI1a3JEZkpLOG05WDhJVjJZeFdCb1FveUhNVkxYQlhUbld6?=
 =?utf-8?B?S0FiNjkwMTRBVytoaEhYcForOEFpZDVjUUNMeko5TEtYZHhibG13aTEySHMy?=
 =?utf-8?B?ZGRzclkvWklPRGVxSTZzTE5vaW5XV1UzN1JIQVZwTi9WWTJwVSs0UndhWStV?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d8f637-13cd-406f-171a-08de1aee307b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:32:25.4556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2w/W5n5yx3V8CPMK5ioXrrUc6TH5AOmwIto3X3mTVbeVQuYJpaBxzgX9oHMxa+EQs3mI+r+imvhqelmP72uHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10500
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

Hi,

This patch-set adds support for the i.MX94 Display Control Interface.
It depends on Peng Fan's DTS patch [1] that was not yet merged.

Also, included in the patch-set are a few extra patches that the DCIF
driver depends on for functioning properly:
 * 1/9 - 3/9 : add support for i.MX94 to fsl-ldb driver. It also
               contains a patch (2/9) from Liu Ying that was already reviewed
               and was part of another patch-set ([2]), but was never merged;

Thanks,
Laurentiu

[1] https://lkml.org/lkml/2025/7/7/84
[2] https://lkml.org/lkml/2024/11/14/262

---
Changes in v6:
- 2/9: Collected r-b tag from Francesco;
- 3/9: Removed ch_max_clk_khz variable as suggested by Luca and added
  his r-b tag;
- 4/9: Collected r-b tag;
- 5/9: Call drm_bridge_put() automatically in
  dcif_crtc_query_output_bus_format() by using a cleanup action (Luca);
- 6/9: Moved allOf: block after required: block (Krzysztof). Collected
  r-b tag;
- Link to v5: https://lore.kernel.org/r/20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com

Changes in v5:
- 4/9: Removed "bindings for" from the title, changed the port
  definition and simplified the example;
- 6/9: Fixed the way 'ldb' child node is declared: declare the
  'ldb' child node out of if:then: block and set the property
  to false for compatibles other than nxp,imx94-lvds-csr;
- Link to v4: https://lore.kernel.org/r/20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com

Changes in v4:
- Addressed remaining DCIF driver comments from Frank;
- Limit the 'ldb' child node only to CSRs compatible with 'nxp,imx94-lvds-csr'
  in the binding file. Since LVDS CSRs are a minority, I chose to
  use the if:then: construct instead of if:not:then:;
- Remove the '#address-cells' and '#size-cells' from the ldb node, in
  imx94.dtsi, as they're not needed;
- Link to v3: https://lore.kernel.org/r/20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com

Changes in v3:
- Removed the BLK CTL patches and created a separate patch set [2] for them;
- Collected r-b tags for 1/9, 2/9, 3/9 and 9/9;
- Removed the DCIF QoS functionality until I find a better way to
  implement it through syscon. QoS functionality will be added in
  subsequent patches. Also, used devm_clk_bulk_get_all() and used
  dev_err_probe() as suggested;
- Addressed Frank's and Krzysztof's comments on the DCIF bindings;
- Addressed Frank's comments on dtsi and dts files;
- Added a new binding patch, 6/9, for adding 'ldb' optional property to
  nxp,imx95-blk-ctl.yaml;
- Link to v2: https://lore.kernel.org/r/20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com

Changes in v2:
- reworked the BLK_CTL patch and split in 2 to make it easier for
  review;
- split the dts and dtsi patch in 2 separate ones;
- addressed Frank's comments in DCIF driver;
- addressed Rob's comments for the bindings files;
- addressed a couple of checkpatch issues;
- Link to v1: https://lore.kernel.org/r/20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com

---
Laurentiu Palcu (7):
      dt-bindings: display: fsl,ldb: Add i.MX94 LDB
      drm/bridge: fsl-ldb: Add support for i.MX94
      dt-bindings: display: imx: Add i.MX94 DCIF
      dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb child node
      arm64: dts: imx943: Add display pipeline nodes
      arm64: dts: imx943-evk: Add display support using IT6263
      MAINTAINERS: Add entry for i.MX94 DCIF driver

Liu Ying (1):
      drm/bridge: fsl-ldb: Get the next non-panel bridge

Sandor Yu (1):
      drm/imx: Add support for i.MX94 DCIF

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  26 +
 .../bindings/display/bridge/fsl,ldb.yaml           |   2 +
 .../bindings/display/imx/nxp,imx94-dcif.yaml       |  82 +++
 MAINTAINERS                                        |   9 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts       | 121 ++++
 arch/arm64/boot/dts/freescale/imx943.dtsi          |  53 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  46 +-
 drivers/gpu/drm/imx/Kconfig                        |   1 +
 drivers/gpu/drm/imx/Makefile                       |   1 +
 drivers/gpu/drm/imx/dcif/Kconfig                   |  15 +
 drivers/gpu/drm/imx/dcif/Makefile                  |   5 +
 drivers/gpu/drm/imx/dcif/dcif-crc.c                | 211 +++++++
 drivers/gpu/drm/imx/dcif/dcif-crc.h                |  52 ++
 drivers/gpu/drm/imx/dcif/dcif-crtc.c               | 695 +++++++++++++++++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.c                | 226 +++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.h                |  86 +++
 drivers/gpu/drm/imx/dcif/dcif-kms.c                | 100 +++
 drivers/gpu/drm/imx/dcif/dcif-plane.c              | 269 ++++++++
 drivers/gpu/drm/imx/dcif/dcif-reg.h                | 267 ++++++++
 19 files changed, 2245 insertions(+), 22 deletions(-)
---
base-commit: cd8eb1cf3dad15dad65060f5d18a59ab99485d01
change-id: 20250911-dcif-upstreaming-3e16d89c3385
prerequisite-patch-id: b2acaaf7e92a5c8e377e6b56f3a9ee7409f64b00

Best regards,
-- 
Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
