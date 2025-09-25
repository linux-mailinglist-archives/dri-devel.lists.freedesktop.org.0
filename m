Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE11EB9E312
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 11:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A2210E8AE;
	Thu, 25 Sep 2025 09:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eSZv2LKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC6610E8AB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 09:07:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/a0VFQhOhhjhI1bUTmmjg5SOtFMQOFUPqmv6zdwxEvttnTSjEcWeymJ7kSy60jkbrL8gghap4wLCUH+n28xLsNyTaYghRyRlGwfjjla/zF8FF0HVt52lfsGq0UWqmi0qvE8uMc98WAM5h13r6L77NiebyACttEn/nx2MbN98FPiSvFYM3tnci9DOP8D/YLNmuznGazykwwdOr4JioWUXUDeVfHiMuC/eGRfDWxNPn09RzSu+Hw2UPhTlcxvwrN3IZGGso7hEOPT0+gFsgdpcninoPGiG6cXLtOtvFdCg01GDwRlmLBDArkx8K4eJmDW6o//zqwobdYJRxGP9pv2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHU4gCKkC4O+Z/ZaCOyboEUVp0UumcIatQLYfwXWAIg=;
 b=IPuw7M0TZIXuzXIqA9KNtItoex5YjRPApxQ87DeiztFqRHxE+hazlA9F3Kq2/fZ5BWtxEEuFOBAlkMK1e5zPetFEl4xQpXewd7co2vOfcz9pDl2wSG22jFe2n0XO52Gf/TprVKWti6KsYZ+RZjMBDZ+g8aWxz5BuNhlgnRCdxXMG/7HI2gcSj1mcFI1uM3ycRickVB2lplV/3yxaQp3QyMTuDRBol1mglAgFc1lEp75U4dxiv5DYF+myyDqn/7vq1Mh/EX3zUd1S5CQw4mBgdPQI6odaqalfYapd3jJhY7SWHWyolz/xgf71RUrl5JDh2e028Lx3stX4Bj2dp+ESjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHU4gCKkC4O+Z/ZaCOyboEUVp0UumcIatQLYfwXWAIg=;
 b=eSZv2LKS/DoeWRcwbT3BrYuhG3dHmBU1MAqO3zRWo6ijMVt6YoBFqImZunLnM92H85b6WOyPjr04yEvI5hDHaSSfKgruObuAS4M9XgF60TpeOXrGcsopofWHoFrQQxsiTUwk9YF1J56kiAe4JtfvFJxGwP4vKg3H3IJtA2mOBzkU4bBn2bQG+kJFvjJqh+IwasTbT0h1bY2u/RHlZhQgF0RcIMvMewFOgedznD3x/xNnM6Jx0GK4Q4ZeZcXXldfVpgYVaMBDspj8hZuS7lOaa3rxvNEzEOapbZpCZpWVLj+U+LK4pco5f6qJvENNe0+SMHwcN0eoW+Rxj/3L2J/JUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by DBBPR04MB7834.eurprd04.prod.outlook.com (2603:10a6:10:1ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 09:07:56 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::8f9d:4273:ea83:167a]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::8f9d:4273:ea83:167a%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 09:07:55 +0000
Message-ID: <3051b1a2-a6da-4b1a-88ac-f27da47a82e9@nxp.com>
Date: Thu, 25 Sep 2025 17:09:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] drm/imx: dc: Add DPR channel support
To: Frank Li <Frank.li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
 <20250923-imx8-dc-prefetch-v2-7-5d69dc9ac8b5@nxp.com>
 <aNLnBbSr5BGDvmsG@lizhi-Precision-Tower-5810>
 <eb070dbc-1e8e-437a-b519-69709b3feae4@nxp.com>
 <aNQNn9EwZzCjapB6@lizhi-Precision-Tower-5810>
 <215aff22-7923-4925-afa9-7663cd524b42@nxp.com>
 <aNS9KwQpH1z+TC1s@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <aNS9KwQpH1z+TC1s@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To DB8PR04MB7051.eurprd04.prod.outlook.com
 (2603:10a6:10:fd::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB7051:EE_|DBBPR04MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc93be0-24a0-4489-d3a8-08ddfc1303ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|19092799006|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3hieTNmaUdxNnNnbm82UzM4V1lkL2lab0NXKy95aDBuYlFRUjd1RU1hRW9T?=
 =?utf-8?B?ODAyVE12K0cvaTRmVjRnb3FobVhLQzZTZVJYWlhRWkwyeTc5T3k4bTd6cU15?=
 =?utf-8?B?Y3dLZmFKbU5RVFg1YURwQ1dwS3p1a3JXdVlFQktMbmFIcEdCeGVHZzdENHJ2?=
 =?utf-8?B?SW0xWERIbzFLdjQ4UmRBMnR1eGpuSzBERG5lTnhQbHIxOU9HdmY2WnNwUVFU?=
 =?utf-8?B?SmdVUWZLK1pTeU5QUmRRMTBnZERWR0M3OHlIaDZ6VmhaV1g5TXU1Zmo0NTBz?=
 =?utf-8?B?KzV5aGl6RlNtQkoyUTJ4RWduM3V4YjJERmhyblVkNUZid25La3VDdXpiNzM1?=
 =?utf-8?B?QXlzNWZaTGZpZ0xZWHpoaHE3VWtCOGtjZ2JjZ0RwVmJlSEhiTXhvbFBZVFJP?=
 =?utf-8?B?Vzdiellld3hsb3ZxMzdiNmNBenVXRE5VWUpPN2VPZ0xnL1NHYm5sUWtTNGZw?=
 =?utf-8?B?Q2RyM0RiZlVUK1JDWmU2ZFg1OEh4TXVwb0VaYUQzSG94TkxkSDRQazBXNndv?=
 =?utf-8?B?aDYxKzhxeDhWVlB5TGRNS1A3bHN4cnBzOGhGblFhNFBPQTFGWTVVOXpOQmFY?=
 =?utf-8?B?ZGFXSWhzaUJERzc0NnRib0NFN25iUzZUVFkrWmpOYmxDQXhCeWNZZnVUOEZx?=
 =?utf-8?B?RDA0SE5YWFp4Y3gxNGNRS0xXRTRIZytEKytaZzFLL2ZSc3k5cmV1SUlCKzZj?=
 =?utf-8?B?Smo1ZkdjQnFQcDFpSTU5OGd3WDdQc3pnUGt3YnhLZVdBNVRJcklPcTlCM0lP?=
 =?utf-8?B?RnQyRWhyOHk4eTBiVTNVS0RVRC94VW5BdERRUGRTbk5oWHNnd1FXaUREZzdH?=
 =?utf-8?B?eWV5RUQyL3E4QVh0THZKMVQrcW43d25pTjVMa0UvR3ZIVVVUV3l6REhyT004?=
 =?utf-8?B?VXFRdUpPYVU5VmlKWWFuU0xySHVxSkYvQlp4NncvNDkyc00xWEZLa3FHcHFK?=
 =?utf-8?B?bWcvbGlqeTFvNHhoMHRIdXFXMFBPTXkxRHNTQVBOYXNnRHpQTzRjQi82ZUFK?=
 =?utf-8?B?VXFwWmpaSS8valQ1MjVBMGtKY0xKcEVycHQrR2luc0g0NjB5dlVRMnNIOE05?=
 =?utf-8?B?NVg2MitlTTg1UjloN3NHaUo5VDVtekZjZHVjOXExRjFaUVVaRUROOE52b0hE?=
 =?utf-8?B?MmJyNi9uRzFSTFVPVEh0aWpFSk5xT2t2RUtVWVhucHQzWUhLd1M4RXhWOUQw?=
 =?utf-8?B?Vjc1V2JUSGRmZFY1ZHZYNFpQODAvaE1sOGVUejJVQWVvbzFGNjFRenBQS2pB?=
 =?utf-8?B?RGJ2ZEIrU1hxVXRxd3l2NmszVzd1akZsV2VDY1VBVzFFUnBUTE52dnRlWG1s?=
 =?utf-8?B?RzFoMHNKUC9vUkpmWjhoRDlXaWUyUisvVVYrcCtON2pCSHZQRFg0bE5GM3BP?=
 =?utf-8?B?QUdHb3NiYTRQdjE5YWM2cE01dHdzSkRHT3pnVnNYcDdGZFhMdEVDRUJXV0lh?=
 =?utf-8?B?N3NFVVlIN0xGOGxYd3NaTng1KzVVSHllcnNlM3YyM0ZvbDBMUm9ZOWJScFRQ?=
 =?utf-8?B?T2p2Y2dkWVhlTkkrK1pkUVlhbTd0aWUxeGYrVjZxUGRZNUQ2N21ZdnJ5NUNK?=
 =?utf-8?B?cTZSZmRhaUd2MTJDR1BYT2Fzdm9HaW9DUVBJcWFaQ05BQSsvaWxDWGdsZDJN?=
 =?utf-8?B?WnZ5UFJSWUpJUjY5UWNtbFloTzVQczZNbWhqQzlUcFdTWVVSQmhUeDdpYno5?=
 =?utf-8?B?aUprYUoxQk5IQ2t1ZHY0QzQwMTNnRE43MlVLY0c0YnlRRm1nbU1zclF4STAx?=
 =?utf-8?B?bEdLRndnQmJUOG9IZ3BneEpWOHp6ckhmZmVQeHl5elRnMGFmVHNKMzRtK3BI?=
 =?utf-8?B?MjdQS25yWFJuTmZ6Rm1wRkJ2dmpYbDNSU3pyNE5GT1ZNKzFxbUZZOGZ1NHhv?=
 =?utf-8?B?M1ArNlEyc3oyV3k5Z1F3SmFlSkpHbGdWblA4N053RXZNenkzTzdhOWlSaGdO?=
 =?utf-8?B?V05wK2tCOXp6KzdEQktSVHptL0dDaTRRSUkvemJqWWU0eStVR0dUS3BGUlNz?=
 =?utf-8?B?UTJQeDMzN1JRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlF5VGJZSUpDRktTejVLZDM2VDdEem1IUHFGYmJqM2crM000RWlSL1pzL3pp?=
 =?utf-8?B?WkdweXJqLzVlOWVKd0VjdW1aZlNRMmRPL2Jad2NsTnFOM1BLY0d3WmhOSXVK?=
 =?utf-8?B?ei8wU0l3eFNIUnhKQ2pGYVFscWdyQTdIR2c0ckhPUGVDdUMzbVlxZFRLbWw0?=
 =?utf-8?B?T2JSbkNSVy9OeVBlZnFmNUNEYmpuU1VielRsQndSTTI3Y2NEUi96ZHpyQU9D?=
 =?utf-8?B?enRIMUhNTkxqeDBEOHZxUFlNY1d0TlBvMHJXS1d4ajJPWE9DTFlaNTdYT2Rk?=
 =?utf-8?B?ZzllS01aSFc5TmdZbU9iMTNDTTBvcms2QWxYTG1wNWZPWlBhN3YxRlc2Y2RD?=
 =?utf-8?B?VEdoMHRPM3RRbDc3TlZBNDQxOFlsVjNEOERXbm5KRWZsditxbUV6VDRKQXFY?=
 =?utf-8?B?S1RESlQycFgyL3ZYb21DbndTTnVsT0VUSFB6RjF0anB3Zlc4RFZOaDBDRzJt?=
 =?utf-8?B?OFoxbEtzMitHVGMxZTNSQUlYVWRFNTYvU0s2dTQzdko1MDR0NEVncWtZV1BS?=
 =?utf-8?B?cUI4bHh2bkJraC9sNmIxUDdZOTNlVFV0NllUVTJxc3dtWmFONHhxNkdmeVd3?=
 =?utf-8?B?VEZPaE55UjArS0Q1M01EN0hCL1B1YW9adUJhNjkzQ1Q4TGJrMDBkQnhtUE5x?=
 =?utf-8?B?V25leGJsVkp4dlI2MnZQR1BIcG1XNWthdHh4WE43ZzNDeXg3OTRpNU8xeW9P?=
 =?utf-8?B?ODhFekRTaHJmWG9IZkI1UVpvZ0NGbisrN3ArbUpmQTVqRkUrb2FaK0FFNVg5?=
 =?utf-8?B?QzFKa2RXdStCT3RuVDFBS05LT0RFMzJrS1IrQTd2cTBkbzVFS0NRWUp6TXFl?=
 =?utf-8?B?ZWVXNjhHUk5wM0p0N0xCZzNsMjNmeEZDSm0vWDRtT056dGRJdi9uTytoR0k5?=
 =?utf-8?B?SjhXRWp4VFBGS3hxb0lHOUlpMkdBSlNJTmY2YUJwMkZsU0xmbzVpalB1Qjc0?=
 =?utf-8?B?NFdNUGo5SzRyVkdtclo4WnpPZU5LYTA5RExBMTFQaFVqQ3NlQ2ExYXdkUEor?=
 =?utf-8?B?VXd2SU1wSFlXK1F0bWxOSFVab0VnbUhnTzVySnByUkRWUnRVM0FVM0dGMWxE?=
 =?utf-8?B?WjVraEM2Sk9LN253d3NFaTZHcXdxRFBYOW4wbURmVElXd3RXMGM1QUM5cFgr?=
 =?utf-8?B?Y3NtbFA4R0tEcnlkd3pGNUZRY2xwaEZwa0FZUHR2cFRrYmhNWTVKMXBUV3Vv?=
 =?utf-8?B?UE5WUDVZRXllQmd5emF0QWNab1RmWU45OVZIc1dNbW8rcGRITTkrTXkxRWZQ?=
 =?utf-8?B?UE41QWd0YkR3MkNkQU9zWHdYN1ZBSWZlSktuUnk4UVRReFZhNDJNNTlrRGR4?=
 =?utf-8?B?QWt4UTdUbGtyUTcvZlZxdUpDTGVnRzlIbDQwMXF1bmZSZmw5cjBQKzJuaVBn?=
 =?utf-8?B?eFBnNjFkVkhOeFd6NVYwN3BXKy9NKy9nRDkvdUpFWHQvMjNUNDFEMkl2T0g0?=
 =?utf-8?B?QXNEeGxvWU5QbGlsVktJUlBZTXFTNU9SZFZuTFhiaUNJNWlaekZZb0JLZDNF?=
 =?utf-8?B?aXNadWpxU2ZOQXljNmsxclM3M29qUlV6eW9NRk4rdDg0ejJFc1htQXhhRm5O?=
 =?utf-8?B?MUtCUkpUWE0veEVYVndMVzBhWTJ0aCthaVl5VVVYbnNJZStibUZscmdwZ1U2?=
 =?utf-8?B?SGVUMVJTUEpFUlpmdWg3RkE5VU9zVndmT0loUEl0S3RCTFFiZCtSckY4UHM4?=
 =?utf-8?B?RlkvRXBaVTZmOFBxY3NXaHYvRTBiT1NJT3hCemk5ZkFWK3Z4UDNDaWtDRFR3?=
 =?utf-8?B?RVRhbFh6Q2JkVnZCTWpWNE12N09oQXhzNGNJNFp4am1vVFFCQ01hVHRVdkNX?=
 =?utf-8?B?TWFhb1FGN3ZBVDJRY2dDU0IxYlhRUWE3Z2xaU3lMUjBwMnVxMjRTcWNRenhI?=
 =?utf-8?B?NS85M2U4WlR3SXpWei8rTnZRTFI3MktqQUZYdmVPei9Vcmw1YzNhRUxOMG55?=
 =?utf-8?B?UFpYdGFKbzN6VTAyUlhhRUE5M0FlbG5SOGVScEU1UFRTbHlWTThIalU4Um5K?=
 =?utf-8?B?Ulh2WkhDanN2UXVPT0ZxQVMyRlgxZTBQL2phS3lZWWFueE11SjYvQ0ZacTBi?=
 =?utf-8?B?VHJUazEvYXBJM1Z4OFM4TlYvSEdxRFo2Syt5VDY0ZDZFeEwwNVVJYnBadXNp?=
 =?utf-8?Q?jSGbrzeCrDOjeK+JBsiaUooT/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc93be0-24a0-4489-d3a8-08ddfc1303ca
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 09:07:55.8339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TK8O1TadWbXaHpAM2CT9wiZW3MPql9Hl3NcMVNwThgJEe6+iZahZTtlPL/FG5++yyLUUady2raYc4wCvxE2cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7834
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

On 09/24/2025, Frank Li wrote:
> On Thu, Sep 25, 2025 at 10:58:27AM +0800, Liu Ying wrote:
>> On 09/24/2025, Frank Li wrote:
>>> On Wed, Sep 24, 2025 at 02:41:50PM +0800, Liu Ying wrote:
>>>> On 09/23/2025, Frank Li wrote:
>>>>> On Tue, Sep 23, 2025 at 10:07:57AM +0800, Liu Ying wrote:
>>>>>> Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
>>>>>> It fetches display data, transforms it to linear format and stores it
>>>>>> to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
>>>>>> a gasket between the RTRAM controller and a FetchUnit.  Add a platform
>>>>>> driver to support the DPRC.
>>>>>>
>>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>>>> ---
>>>>>> v2:
>>>>>> - Manage clocks with bulk interfaces.  (Frank)
>>>>>> - Sort variables in probe function in reverse Christmas tree fashion.  (Frank)
>>>>>> ---
>>>>>>  drivers/gpu/drm/imx/dc/Kconfig   |   1 +
>>>>>>  drivers/gpu/drm/imx/dc/Makefile  |   6 +-
>>>>>>  drivers/gpu/drm/imx/dc/dc-dprc.c | 465 +++++++++++++++++++++++++++++++++++++++
>>>>>>  drivers/gpu/drm/imx/dc/dc-dprc.h |  35 +++
>>>>>>  drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
>>>>>>  drivers/gpu/drm/imx/dc/dc-drv.h  |   1 +
>>>>>>  drivers/gpu/drm/imx/dc/dc-prg.c  |  12 +
>>>>>>  drivers/gpu/drm/imx/dc/dc-prg.h  |   4 +
>>>>>>  8 files changed, 522 insertions(+), 3 deletions(-)
>>>>>>
>>>>> ...
>>>>>> +
>>>>>> +static void dc_dprc_reset(struct dc_dprc *dprc)
>>>>>> +{
>>>>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + SET, SOFT_RESET);
>>>>>> +	fsleep(20);
>>>>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, SOFT_RESET);
>>>>>> +	fsleep(20);
>>>>>> +}
>>>>>> +
>>>>>> +static void dc_dprc_enable(struct dc_dprc *dprc)
>>>>>> +{
>>>>>> +	dc_prg_enable(dprc->prg);
>>>>>> +}
>>>>>> +
>>>>>> +static void dc_dprc_reg_update(struct dc_dprc *dprc)
>>>>>> +{
>>>>>> +	dc_prg_reg_update(dprc->prg);
>>>>>> +}
>>>>>> +
>>>>>> +static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
>>>>>> +{
>>>>>> +	guard(spinlock_irqsave)(&dprc->lock);
>>>>>> +	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
>>>>>> +}
>>>>>> +
>>>>>> +void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
>>>>>> +		       unsigned int width, unsigned int height,
>>>>>> +		       unsigned int stride,
>>>>>> +		       const struct drm_format_info *format,
>>>>>> +		       dma_addr_t baddr, bool start)
>>>>>> +{
>>>>>> +	unsigned int prg_stride = width * format->cpp[0];
>>>>>> +	unsigned int bpp = format->cpp[0] * 8;
>>>>>> +	struct device *dev = dprc->dev;
>>>>>> +	unsigned int p1_w, p1_h;
>>>>>> +	u32 val;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	if (start) {
>>>>>> +		ret = pm_runtime_resume_and_get(dev);
>>>>>> +		if (ret < 0) {
>>>>>> +			dev_err(dev, "failed to get RPM: %d\n", ret);
>>>>>> +			return;
>>>>>> +		}
>>>>>> +
>>>>>> +		dc_dprc_set_stream_id(dprc, stream_id);
>>>>>> +	}
>>>>>> +
>>>>>> +	p1_w = round_up(width, format->cpp[0] == 2 ? 32 : 16);
>>>>>> +	p1_h = round_up(height, 4);
>>>>>> +
>>>>>> +	regmap_write(dprc->reg, FRAME_CTRL0, PITCH(stride));
>>>>>> +	regmap_write(dprc->reg, FRAME_1P_CTRL0, BYTE_1K);
>>>>>> +	regmap_write(dprc->reg, FRAME_1P_PIX_X_CTRL, NUM_X_PIX_WIDE(p1_w));
>>>>>> +	regmap_write(dprc->reg, FRAME_1P_PIX_Y_CTRL, NUM_Y_PIX_HIGH(p1_h));
>>>>>> +	regmap_write(dprc->reg, FRAME_1P_BASE_ADDR_CTRL0, baddr);
>>>>>> +	regmap_write(dprc->reg, FRAME_PIX_X_ULC_CTRL, CROP_ULC_X(0));
>>>>>> +	regmap_write(dprc->reg, FRAME_PIX_Y_ULC_CTRL, CROP_ULC_Y(0));
>>>>>> +
>>>>>> +	regmap_write(dprc->reg, RTRAM_CTRL0, THRES_LOW(3) | THRES_HIGH(7));
>>>>>
>>>>> Is it okay to access register if start is false since
>>>>> pm_runtime_resume_and_get() have not called.
>>>>
>>>> Yes, it is okay, because dc_dprc_configure() is supposed to be called
>>>> continously for multiple times(OFC, fine for only once as well).  For
>>>> the first time, start is true in order to enable the DPRC.  After the
>>>> first time(DPRC is running), it is called with start == false to do
>>>> things like page-flip(update frame buffer address).
>>>>
>>>>>
>>>>>> +
>>>>>> +	val = LINE4 | BUF2;
>>>>>> +	switch (format->format) {
>>>>>> +	case DRM_FORMAT_XRGB8888:
>>>>>> +		/*
>>>>>> +		 * It turns out pixel components are mapped directly
>>>>>> +		 * without position change via DPR processing with
>>>>>> +		 * the following color component configurations.
>>>>>> +		 * Leave the pixel format to be handled by the
>>>>>> +		 * display controllers.
>>>>>> +		 */
>>>>>> +		val |= A_COMP_SEL(3) | R_COMP_SEL(2) |
>>>>>> +		       G_COMP_SEL(1) | B_COMP_SEL(0);
>>>>>> +		val |= PIX_SIZE_32BIT;
>>>>>> +		break;
>>>>>> +	default:
>>>>>> +		dev_err(dev, "unsupported format 0x%08x\n", format->format);
>>>>>> +		return;
>>>>>> +	}
>>>>>> +	regmap_write(dprc->reg, MODE_CTRL0, val);
>>>>>> +
>>>>>> +	if (start) {
>>>>>> +		/* software shadow load for the first frame */
>>>>>> +		val = SW_SHADOW_LOAD_SEL | SHADOW_LOAD_EN;
>>>>>> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
>>>>>> +
>>>>>> +		/* and then, run... */
>>>>>> +		val |= RUN_EN | REPEAT_EN;
>>>>>> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
>>>>>> +	}
>>>>>> +
>>>>>> +	dc_prg_configure(dprc->prg, width, height, prg_stride, bpp, baddr, start);
>>>>>> +
>>>>>> +	dc_dprc_enable(dprc);
>>>>>> +
>>>>>> +	dc_dprc_reg_update(dprc);
>>>>>> +
>>>>>> +	if (start)
>>>>>> +		dc_dprc_enable_ctrl_done_irq(dprc);
>>>>>> +
>>>>>> +	dev_dbg(dev, "w: %u, h: %u, s: %u, fmt: 0x%08x\n",
>>>>>> +		width, height, stride, format->format);
>>>>>> +}
>>>>>> +
>>>>>> +void dc_dprc_disable_repeat_en(struct dc_dprc *dprc)
>>>>>> +{
>>>>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, REPEAT_EN);
>>>>>> +	dev_dbg(dprc->dev, "disable REPEAT_EN\n");
>>>>>> +}
>>>>>> +
>>>>>> +void dc_dprc_disable(struct dc_dprc *dprc)
>>>>>> +{
>>>>>> +	dc_prg_disable(dprc->prg);
>>>>>> +
>>>>>> +	pm_runtime_put(dprc->dev);
>>>>>
>>>>> You call pm_runtime_put() in dc_dprc_disable(), but not call
>>>>> pm_runtime_resume_and_get() at dc_dprc_enable().
>>>>
>>>> Yes, dc_dprc_configure()(start == true) is designed to get RPM and
>>>> dc_dprc_disable() to put RPM.
>>>>
>>>> dc_dprc_enable() just sets PRG to non-bypass mode.
>>>>
>>>>>
>>>>> Is it more reasonable to call pm_runtime_resume_and_get() in dc_dprc_enable()
>>>>>
>>>>> dc_dprc_enable()
>>>>> {
>>>>> 	...
>>>>> 	pm_runtime_resume_and_get();
>>>>> }
>>>>>
>>>>> dc_dprc_configure()
>>>>> {
>>>>> 	unconditional call
>>>>> 	pm_runtime_resume_and_get()
>>>>> 	...
>>>>> 	pm_runtime_put()
>>>>
>>>> Here, as RPM is put, it's possible to actually disable the power domain,
>>>> hence possibly lose all the DPRC configuration done between RPM get and
>>>> RPM put.  So, this doesn't make sense.
>>>>
>>>
>>> Okay,
>>>
>>> dc_dprc_enable()
>>> {
>>> 	...
>>> 	pm_runtime_resume_and_get();
>>> }
>>>
>>> dc_dpdr_disable()
>>> {
>>> 	pm_runtime_put();
>>> }
>>>
>>> dc_dprc_configure()
>>> {
>>> 	pm_runtime_resume_and_get();
>>>
>>> 	if (start)
>>> 		dc_dprc_enable(dprc);
>>>
>>> 	pm_runtime_put();
>>> }
>>>
>>> Look more reasonable for pair get()/put().  after first start, ref count
>>> will not reduce 0 by pm_runtime_put();.
>>
>> Then, as dc_dprc_disable_repeat_en() also accesses DPRC register, it needs
>> the RPM get/put too?  Same for PRG driver APIs, dc_prg_{enable,disable,
>> configure,reg_update,shadow_enable} access PRG registers.  Though adding
>> RPM get/put to all of them should work, I don't see much point in having
>> the get/put dance.
> 
> I don't think need change all.
> 
> you call dc_dprc_configure(start = true) to get pm_runtime_resume_and_get()
> 
> call dc_dpdr_disable() to put run time pm.
> 
> Just change to
> 1. call pm_runtime_resume_and_get() in dc_dprc_enable(), which call only when
>  (start == true)
> 2. call pm_runtime_put() in dc_dpdr_disable() /* you already did it */
> 
> get()/put() pair in dc_dprc_configure() to make sure access register
> before call dc_dprc_enable().
> 
> The whole logic should be the same as what your current code.

I got your whole idea and thought it should work, but my point was that
aside from dc_dprc_configure(), dc_dprc_disable_repeat_en() and those
PRG driver APIs access registers too, so if dc_dprc_configure() needs the
RPM get/put, then all of them need too, i.e. dc_dprc_configure() is not
special.  To make the RPM simpler, I think it makes sense to have
dc_{dprc,prg}_configure() get RPM when start == true and have
dc_{dprc,prg}_disable() put RPM, just like patch 6&7 do.

> 
>>
>>>
>>>>>
>>>>> 	if (start) //look like only need enable when start is true
>>>>
>>>> I may add this check in next version.
>>>>
>>>>> 		dc_dprc_enable(dprc);
>>>>> }
>>>>>
>>>>>> +
>>>>>> +	dev_dbg(dprc->dev, "disable\n");
>>>>>> +}
>>>>>> +
>>>>>> +void dc_dprc_disable_at_boot(struct dc_dprc *dprc)
>>>>>> +{
>>>>>> +	dc_prg_disable_at_boot(dprc->prg);
>>>>>> +
>>>>>> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
>>>>>> +
>>>>>
>>>>> you have runtime functions dc_dprc_runtime_suspend()
>>>>>
>>>>> If runtime pm status is correct, needn't call clk_bulk_disable_unprepare().
>>>>>
>>>>> Look like call pm_runtime_put() here to let runtime pm management clks.
>>>>>
>>>>> otherwise, runtime pm state will not match clock enable/disable state.
>>>>>
>>>>>> +	dev_dbg(dprc->dev, "disable at boot\n");
>>>>>> +}
>>>>>> +
>>>>>> +static void dc_dprc_ctrl_done_handle(struct dc_dprc *dprc)
>>>>>> +{
>>>>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0, REPEAT_EN);
>>>>>> +
>>>>>> +	dc_prg_shadow_enable(dprc->prg);
>>>>>> +
>>>>>> +	dev_dbg(dprc->dev, "CTRL done handle\n");
>>>>>> +}
>>>>>> +
>>>>> ...
>>>>>> +
>>>>>> +static int dc_dprc_probe(struct platform_device *pdev)
>>>>>> +{
>>>>>> +	struct device *dev = &pdev->dev;
>>>>>> +	struct device_node *np = dev->of_node;
>>>>>> +	struct resource *res;
>>>>>> +	struct dc_dprc *dprc;
>>>>>> +	void __iomem *base;
>>>>>> +	int ret, wrap_irq;
>>>>>> +
>>>>>> +	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
>>>>>> +	if (!dprc)
>>>>>> +		return -ENOMEM;
>>>>>> +
>>>>>> +	ret = imx_scu_get_handle(&dprc->ipc_handle);
>>>>>> +	if (ret)
>>>>>> +		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
>>>>>> +
>>>>>> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>>>>>> +	if (IS_ERR(base))
>>>>>> +		return PTR_ERR(base);
>>>>>> +
>>>>>> +	dprc->reg = devm_regmap_init_mmio(dev, base, &dc_dprc_regmap_config);
>>>>>> +	if (IS_ERR(dprc->reg))
>>>>>> +		return PTR_ERR(dprc->reg);
>>>>>> +
>>>>>> +	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
>>>>>> +	if (wrap_irq < 0)
>>>>>> +		return -ENODEV;
>>>>>> +
>>>>>> +	dprc->num_clks = devm_clk_bulk_get_all(dev, &dprc->clks);
>>>>>> +	if (dprc->num_clks < 0)
>>>>>> +		return dev_err_probe(dev, dprc->num_clks, "failed to get clocks\n");
>>>>>> +
>>>>>> +	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
>>>>>> +	if (ret) {
>>>>>> +		dev_err(dev, "failed to get SC resource %d\n", ret);
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	dprc->prg = dc_prg_lookup_by_phandle(dev, "fsl,prgs", 0);
>>>>>> +	if (!dprc->prg)
>>>>>> +		return dev_err_probe(dev, -EPROBE_DEFER,
>>>>>> +				     "failed to lookup PRG\n");
>>>>>> +
>>>>>> +	dc_prg_set_dprc(dprc->prg, dprc);
>>>>>> +
>>>>>> +	dprc->dev = dev;
>>>>>> +	spin_lock_init(&dprc->lock);
>>>>>> +
>>>>>> +	ret = devm_request_irq(dev, wrap_irq, dc_dprc_wrap_irq_handler,
>>>>>> +			       IRQF_SHARED, dev_name(dev), dprc);
>>>>>> +	if (ret < 0) {
>>>>>> +		dev_err(dev, "failed to request dpr_wrap IRQ(%d): %d\n",
>>>>>> +			wrap_irq, ret);
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	dev_set_drvdata(dev, dprc);
>>>>>> +
>>>>>> +	ret = devm_pm_runtime_enable(dev);
>>>>>> +	if (ret)
>>>>>> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int dc_dprc_runtime_suspend(struct device *dev)
>>>>>> +{
>>>>>> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
>>>>>> +
>>>>>> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int dc_dprc_runtime_resume(struct device *dev)
>>>>>> +{
>>>>>> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	ret = clk_bulk_prepare_enable(dprc->num_clks, dprc->clks);
>>>>>> +	if (ret) {
>>>>>> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	dc_dprc_reset(dprc);
>>>>>> +
>>>>>> +	/* disable all control IRQs and enable all error IRQs */
>>>>>> +	guard(spinlock_irqsave)(&dprc->lock);
>>>>>> +	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
>>>>>
>>>>> write one 32bit register is atomic, look like needn't spinlock.
>>>>>
>>>>> Only other place use dprc->lock is in dc_dprc_enable_ctrl_done_irq(), which
>>>>> write 32bit clr register.
>>>>
>>>> No, dc_dprc_wrap_irq_handler() uses the lock to protect register access too,
>>>> so it's needed.
>>>
>>> guard only protect after it.
>>
>> scoped_guard() called by dc_dprc_wrap_irq_handler() protects register access
>> too.
> 
> Sorry, I missed this part. I found at original patch.
> 
> Frank Li
> 
>>
>>>
>>> in dc_dprc_runtime_resume()
>>>
>>> +	/* disable all control IRQs and enable all error IRQs */
>>> +	guard(spinlock_irqsave)(&dprc->lock);
>>> +	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
>>> +
>>> +	return 0;
>>>
>>> +static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
>>> +{
>>> +	guard(spinlock_irqsave)(&dprc->lock);
>>> +	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
>>> +}
>>>
>>> How spin lock protect register access?
>>
>> With the error and control IRQs, dc_dprc_wrap_irq_handler() and
>> dc_dprc_enable_ctrl_done_irq() could have concurrent access to IRQ_MASK
>> registers(though there is SET/CLR/TOG register variants, they have a
>> shared read-out value).
>>
>>>
>>> 1: IRQ_MASK <= IRQ_CTRL_MASK;
>>> 2: IRQ_MASK + CLR <= IRQ_DPR_CRTL_DONE;
>>>
>>> 2 possilbe result:
>>> 	1 happen after 2
>>> 	2 happen after 1
>>>
>>> Frank
>>>
>>>>
>>>>>
>>>>> Frank
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>> ...
>>>>>> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc)
>>>>>> +{
>>>>>> +	prg->dprc = dprc;
>>>>>> +}
>>>>>> +
>>>>>> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg)
>>>>>> +{
>>>>>> +	return prg->dprc;
>>>>>> +}
>>>>>> +
>>>>>>  static int dc_prg_probe(struct platform_device *pdev)
>>>>>>  {
>>>>>>  	struct device *dev = &pdev->dev;
>>>>>> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
>>>>>> index 6fd9b050bfa12334720f83ff9ceaf337e3048a54..f29d154f7de597b9d20d5e71303049f6f8b022d6 100644
>>>>>> --- a/drivers/gpu/drm/imx/dc/dc-prg.h
>>>>>> +++ b/drivers/gpu/drm/imx/dc/dc-prg.h
>>>>>> @@ -32,4 +32,8 @@ bool dc_prg_stride_supported(struct dc_prg *prg,
>>>>>>  struct dc_prg *
>>>>>>  dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
>>>>>>
>>>>>> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc);
>>>>>> +
>>>>>> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg);
>>>>>> +
>>>>>>  #endif
>>>>>>
>>>>>> --
>>>>>> 2.34.1
>>>>>>
>>>>
>>>>
>>>> --
>>>> Regards,
>>>> Liu Ying
>>
>>
>> --
>> Regards,
>> Liu Ying


-- 
Regards,
Liu Ying
