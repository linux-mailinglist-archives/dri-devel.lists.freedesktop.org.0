Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A6BB93EE5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F16B10E522;
	Tue, 23 Sep 2025 02:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Nj5+8q14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8145B10E520
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:07:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgUas3kr58kIZxvwGdVBNYc+7Cw54jwqFcNwmBvkWyGQYlVHG90IjFoRRSiZ5kHPQtsMhei235GY7BFPnhj3FNNIdgGDYaAq451OKEQNTxlgNi2tC22Fa8IV3Vb+ld0C6LZaf/WOvFr4fA6h3EPTmF20IVPQ/xqjspTzt5rhhX6ZXpirkoG/O7NLmDg4vYXgj48K26Y+my32+N2uFwroMMM7ACpMNS15JYxkl07cJcbirx0tsvxqbwx8eau5y4+HgsEqs/hUp9HLRaLt9k7SR6RRMmX1p06gu7hY+oCmQB+4IJ9V60axiQ1Nw7L+GAAGFSTkZBNkReexgMKwGtcOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OU4SkVlkea3FXtpPoOjxDXOAkpxXSQ//1NqmWywctE=;
 b=fCgf5XKFFsfkKq0JPbg8BIMzAkFAwFrxvj+hT4ZJbi9z8Pv0uJhOoHKAbcPMSOxDtQv6SEIirGlM8EhDyBheDtZ5vgHHAUkSiL5S+RU0dNKJWgo3D0UdKqCIOLIJ59J6EbuIfFdfMBQ1TYnqt/RKEstIgBC7wuRDZNe9JUIt3tFCqE9sB3SZmKLc7Y3YvWbg7KKw9Hl4UPdu3BuzwtLnTV4qK7EVpTUZ/gN7NWfrusvrtIQXw0LFhfJEb6cWhNhgunPFyR1gZdb77PMk2o27lAiUFZ9mznU0SpDnuODH/lcPIAwjnC9BLnXtNF4aE88VUjBjeKzo3D7iecTryrkdmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OU4SkVlkea3FXtpPoOjxDXOAkpxXSQ//1NqmWywctE=;
 b=Nj5+8q14vNEPA0+kxObQ0KnzqvMks2lUVhtNTFroED8QRqVJIhCcgAhASomHI88fp/pZ3g/+rDWVXhRJaLI5YpO/pKrh5YlJRX3xRQnR4uhNfuC2bVnT0MOy8AmBZjgXcsgBHdpKl3iclwyIAfpufWVkokzT6nquGUt5NBXJU58OBk2reYpmayELJ0tC8ShBEncnRJap7ibpgzp46xWF7AKd7lwmn69Cy1Szu4tl2l9vjj1vPVkCMHClK/sl2tMDgO2p5/pAH87tEoRGJO/F0CgvsvGIE6XvbLB1sToYH2UiutVo7zg+323+BgemBskoIHKCWzkKhyflcUJycNk6gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10854.eurprd04.prod.outlook.com (2603:10a6:800:25f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:07:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:07:02 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:07:53 +0800
Subject: [PATCH v2 03/14] MAINTAINERS: Add i.MX8qxp prefetch engine DT
 binding files
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-3-5d69dc9ac8b5@nxp.com>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
In-Reply-To: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10854:EE_
X-MS-Office365-Filtering-Correlation-Id: 5234f70b-c986-4906-7711-08ddfa45e312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjRIbllVR21HK3UzZVNKK2VCV0dyMUU4YkpLbGllVVVGOWFFQUJhangvb3d0?=
 =?utf-8?B?V1ZVWkt6cUVRWmhPMFdlOTFtYW9yTHkyV2Qweko3b3p5cmRhYzNWZ3ArS2ZO?=
 =?utf-8?B?MFJ6NVRaOUNPY3BTT1o0UW1oaFd0b29FTWMrY1hUSjVWbnJzRmt2T01TcDRL?=
 =?utf-8?B?TmJTYlBMRzVXK1BPL0FFbTZURzNIZTlhTGtpYTQvK3Fjb0YrbERyc1NCWUJH?=
 =?utf-8?B?OHBINGRVSExNbmVLRDlGSktDbmpvNHFCZjdPME4wMml3U3NlTnZjN29NS1Zs?=
 =?utf-8?B?OTRid21YaElXVXlicnI3M2FVQ2lVRzNLZDB4VjkxK2VEUVZ6YWRNSklVcVRp?=
 =?utf-8?B?dWdPdnJvdmJ1TEJhZ3VtdkFYOTUyZWM2a0pMdlZxQjJuSUdKOTUzMTlVWmhT?=
 =?utf-8?B?Q2NQRVBvdU5QR2dxbmxodEdyVFlXQkljRVE2L3RKa2VNVzN3bzFoT1dCanBH?=
 =?utf-8?B?NDhIL3FTZ25vSWJOTk5DUVg5cVJvdkZGZFZRTzd2aVB2SENFdldrb1I1VC9p?=
 =?utf-8?B?RHA0STBENExFOGxpNHJncDZwVk9QZTFOeXdrcVBXOS9iU053S2N5VnpESnNE?=
 =?utf-8?B?Rk5MTkNiYzVXN1E2d0tOc3FKQWs1TzhLZ1AvSmdaM3M5MjcwUkJsdlFCdGhE?=
 =?utf-8?B?ZG85cUlmdzBEV3hUcWlEL0c5bnlrdXpoL3l1V2RoOG85Um8xR292N1Q2dm5W?=
 =?utf-8?B?V3dSc2VBaXQ4UFBYTW04bWVocjFkVmE5MlJrMXFudzI3V1I5T2p1WXFqNUI5?=
 =?utf-8?B?MmhHMmdHM0RWc0REVG5VUnU3NVdNVGlNbjJsUW1CM2k0N1ZlUVVpL0RnQlg5?=
 =?utf-8?B?WGx1bXN3UUFoT3FEVGtlY1lvN24xbkNiNnVGcXFDMXZ1cjRqOUhPTENEVzZo?=
 =?utf-8?B?eGNYbnFZbEFTNHdVQ01IWW5ncW43RmE4enVFdXAzOGhOQUtNQ0F0MWkxNTRo?=
 =?utf-8?B?N2RCVXlCSnpVSVRpYlduQnNjYUdwTkZpYjRWU3BqbGRlNUhsdFo5M1lrOFR5?=
 =?utf-8?B?VkRYOGxKWkpCK0dpaWJmZWkvQzA3RWpyTjNhdGtsQlRSL2FVdXhtTnZac1RG?=
 =?utf-8?B?cTg3S2g0emFyQlhTNFBPZHlHdjVXRXNJUnduVlROV2U1R1VJOThrWUJvWmp1?=
 =?utf-8?B?RXVwT1ZDcUZjWVdGTGd5SnNrdURXVnM5d2dRblM5R0phbUxVWUVvMjl6YndH?=
 =?utf-8?B?NVRvWjFpZWFtRy90Z2NzbllqblVsWUNQRDdRb1JxdnA2WDJqb3Y1ZnhKM1FM?=
 =?utf-8?B?TERwSXJoOUJCL0RrSThwME9hZTdlOXhaSzZzKzRLMWs3QXY2RHhxZEk3NmJB?=
 =?utf-8?B?L1B0cHFweHo0NmgxZmRTemtUdXdSTU1uMlFERTZSbU1MK3JGM3FWdlZENURV?=
 =?utf-8?B?QUMvSVBTSmw0dklWak1IWTBKSXE4dlVoMHFlVnZtZU8zeE95WXpYdnVEZGxs?=
 =?utf-8?B?OWdpb3ZXOXdRZWR1Nk5yRnd1VFFvbjlBUzlLalZjZHBjWE9ESkczMUdXREJk?=
 =?utf-8?B?T01LamhrVktHN2J2SEUreXMvMWxNVmJzaDAxODBnSm1lbXhKS28rc1Z3N2xX?=
 =?utf-8?B?KzJlY295bUZ1amN0MzZ0ZjJIOGR0TlRnZHhDSkwvSGpmMWRDNklNK21ORWEw?=
 =?utf-8?B?ZGVaelhhNEE0bXQ5bzhES25FR1NUVzJjbllnaElMRHBBQ3BBWkY5NzhpNXpp?=
 =?utf-8?B?a25JREhOckNESWNaR1g2Uks1U2xuWU9LcHlabEdha2dyUWtTVjZhaHFyemlP?=
 =?utf-8?B?ckpLaXhOWHI0OWJybXhybWF1cHZ1emQyMGJkM2I0cTl5bDBORWFreGVvQndL?=
 =?utf-8?B?bERnbTVLb1gyMXl3RG85VVBrNlB0Y3lBYXBzeVh4TFM3OUZPUjVYREFCemJC?=
 =?utf-8?B?YllGdmFHSE9LR2tOc2FsSlQ3ZkJxQTBQVE1JQ2ZLM1VIS2JLNlhpQ25iOE9W?=
 =?utf-8?Q?ufET8jhS8zFbU3hzYeSjlRxfI6lGS83l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3k0VlliN0JnbTFkNmFtbmI0dno1RHN0elQ0QW9hQXhVTWVJeGhQRG1nWEVr?=
 =?utf-8?B?anJoeE9rMDRHeUM3YU91dEpLZjBwYnFuN2tnd3pFMEZuMm4yeS9PeGVMSElD?=
 =?utf-8?B?UUM0VzNqWXpSR0J2Y0N4N0l5c3hBRHBUZzRtbXdGMk41WWpxcVlKYUkvZU9Z?=
 =?utf-8?B?cDdUQm8zNm14RVd3bENkbHlVUVVZSitXdEI2VWUzU2ZlNGNSYUpZbmhLZ0Ex?=
 =?utf-8?B?NmtENlVRblF3Qk9TMmlIZnVWREpPYTArb2dZTlV1NjllSlc1V3AvdjlHcFNI?=
 =?utf-8?B?aDhCV09FV3BqTEcvY1M5ZHBWeitJdERESy9sMDBwNHE3Mk9uOVp0ZlN6Wmd3?=
 =?utf-8?B?RE91RGkvYnRvdzJDb3ExdU9yQms0VklzbUlnNkZqbFhTZ0VLZ2RzTDBud0M3?=
 =?utf-8?B?TU93Wkx3OWRGWERhc0N3cDVWdld0dUJiekVQWmJSaGxGVGFsZFZCVTgrOUhx?=
 =?utf-8?B?NW94K0RhTVd1YzdpMVduRTZZT0kzYWxrMGdrZHp2OXp6Njlid2lXdm1NeDN5?=
 =?utf-8?B?NklPWGtWYjBYZE9UMGt3ZXVEUnVtenFDaFV4RGl6SFFmV0NKRStaek9EdXNX?=
 =?utf-8?B?UkdWd2tENGpYRFh6UHpMeWlIZ05YRG9Pb2xpMkdrYVVtZUYvK05PK3FyREhW?=
 =?utf-8?B?OE54Y3RSdDVCdFA2NDVVOGV5ajZwdGZidCtwQy8zNnBuZ1lQWFpCWk1NbDNN?=
 =?utf-8?B?bVFOUHNjaEJnNXBsYnN0MkRtcjNUdTkzdlpxZTlXUFRSdjg2bjROb2VpeHFR?=
 =?utf-8?B?WEVpcnlCenYydWhLUkU4VkxZcnFWbEdnRUFIWUxqaUdsdUdpRVdwY05uREVw?=
 =?utf-8?B?Um15YmhHaVAySjBsR2orMktkSy9rU0ExNDZTUTk4SUVsRTZVS203M1h6NlM0?=
 =?utf-8?B?NjNXTzliWVFaK1czVHU3d21WbU5ka2lMR3NFWXhJWDhTekdGUkxndi9SdmhC?=
 =?utf-8?B?SjZGQWY3WnRKS29obU5EMUVER3RIRENVMXpwY0JOMmtHclRyOTZXeUtCWHR0?=
 =?utf-8?B?Nmo5ajBGdWJYQStkaGZPWndiNjMwNkttLzBjcWl2aDR6VjdZTHZ0VlBKYWw4?=
 =?utf-8?B?WDRXS0ZQQ1VFWTErZ2h3M3dlZ1VKbXBjdDAxRGZOQ2pCU09uREt3cHJRczd3?=
 =?utf-8?B?SjFKbFM4eGJmVHFsekpkRkpWMjNBdzVBbXhuMjBmanhDTnF3NCt4akhxRXRS?=
 =?utf-8?B?ajJQVE91T3A5S2Y0ODVTRkE0U1pVa0NpTnNJTnM5bnhxbU5DUHVHVUc4ZERv?=
 =?utf-8?B?RU9XcU1HeXVndHZpQXVVVUFRL1g0c0hGWk4zS2ZwZWRUN1JaS2VweCtyMXY5?=
 =?utf-8?B?bERZdFRlTVg4OEdYVG8wSnl4d05GalVyS0dpZ2YxK2RZZ1c1WWg4VDh5bHA2?=
 =?utf-8?B?THpZZzZzYjM3YTJhbzBZdUl6WE9uN0F5Z3RjdVJaMHRBSXkwZ2pnZFhHaW9Z?=
 =?utf-8?B?aXZEZ28rUzY2dENxTStDWWw4MUxpd2ZBOHJSdmhrWDFrZDRwS29IODdPZ0Rl?=
 =?utf-8?B?UDZJUWU1dEEwbzdpTC9LRVRvWkFONzMwcWpwOEt3RXB5RVFqSnd4RmFzNTk1?=
 =?utf-8?B?cUpNZlcvU005MlhXTmdjdkJkamY5QTZ3MThacnR1RDdHR1NyZWxhZlhvbmdO?=
 =?utf-8?B?T2Z1bE9jT2tUSG5lRzVGaXh5UjBEc0xaVE5aZmZqaDNsZUlvcjFZelF4alZw?=
 =?utf-8?B?aHBVbmw2d0ZpZjlTODRmejVETXFCQ00zOFZWbTJHeHYzaVpzVkp1Z2FKMjc5?=
 =?utf-8?B?clYwZSs1WUQwMUg5VWQ1eE1xV3hHVWowZzZ1OHVxOW4xL0srZ0hTWUJqMVQ2?=
 =?utf-8?B?OWxIMTIvK0pZb1N6ajN0SFAzTGFDRnoxSjZMZFRDeDkvMldLbm9jbHNwQ2hY?=
 =?utf-8?B?bmJTVEdlbWNOOGZsT1pMVUcxeFVHWW1oNHZPd3JsN2wrclhGT1ZhalhKMnFl?=
 =?utf-8?B?MUZETTdSRENFU0tUVGVlNmJOMVNnd2hnZjVKVkJJY0RGeXpwaklnVmxTQ1lr?=
 =?utf-8?B?eTBtYlY3YTA3UVRXR285TjhXclA3YWVFMVhkSElPYTNqdHJBemQ2TDdPMWc2?=
 =?utf-8?B?bkFCS1ViWHowMUFJVzQ3eUl6bUljUWJiTHFxaUI4OFUwTjdFNTIxeDBTOGF2?=
 =?utf-8?Q?Yw5PQsZgGnnS5MxFQMh5lCouE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5234f70b-c986-4906-7711-08ddfa45e312
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:07:02.7479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YV6u98MPHPx19pfHafKrU6hZOh9KTeYKxlWTMMSu50qNl3+0wILtafsT6dimrj+Nv1djUZObxWJaCGoZt9O5Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10854
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

Add i.MX8qxp prefetch engine DT binding files to
'DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER' section.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c8281ea4cc64dce7de4e5ae660a24139753eccb..d1051de3ba5d0ca524a3895ea8981c3e89054e11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8324,6 +8324,8 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
 F:	drivers/gpu/drm/imx/dc/
 
 DRM DRIVERS FOR FREESCALE IMX BRIDGE

-- 
2.34.1

