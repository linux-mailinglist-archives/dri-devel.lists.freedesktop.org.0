Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822EAA051A5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 04:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B700B10E7F9;
	Wed,  8 Jan 2025 03:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gItJd/D8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C330910E7EE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 03:37:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKgRotxDJsPGdexc9aLVZypHHshFanDmF1YLg12BE6VKYw5YC8hyoHoZukzBxFLoqsxfM6+RG3MJIkwSEt4IS+HTGRj/Wd5QEvzj1J/Iy+1Y0U5OpCXbrf4+UHHMuqddXu974ZVhC20qxw0cNIEJmvMzWsoSXzTnOs8S/g325AXizRRS5GBOzRNkmIx+koHMWmTnMoG80zlZt8a7dBqr0eZ/xfT9YAIGhKQaiIXrgDOCC7380kXoa5jX6qBh5lBgsxpHHS0Eztu5oBgv0BhQ5yX2RyvjW6heyzOdJkhTzrVIKIQbnWq1DCNNETYU7spivKUBlftH1jRpUIuI3kuePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq3YBRqIXSh/xunJg8CwL6UyEXdVGC3xtZbiaZmSpO4=;
 b=aSNM5ERfOWq02pgQgkEwfHZaeMqqrFk/DhX24UlywYF6+LmZztKtbOChL9dLUNCf/K90hC18RU20TzjgvUPEc8EHBfO50FyouRh5ml+Mwbl5ZsT0s/LKMX9Lh8miVOWiDf7bqifqEE8qnPo2Zy5t40owUt/dPkQtHO22Z9ZKoVMZoEovFGPOKSI4wcTjjIkXE6LfLXxF1uw8E69o2Mlk3rUGxYCg2NFAWujt/c9RHpptNjT9ajRY4tESs7nTK4SktMRnjMsi1eMwhvk02X+3a5BKzNaVx+OtRtBv3NKwtuScUVv/HdmeBvJAAEg3QUU4Oa6Jx5tuhVfbnuF098putA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zq3YBRqIXSh/xunJg8CwL6UyEXdVGC3xtZbiaZmSpO4=;
 b=gItJd/D89xZlFxsuUUYKRBKoBTt66b9sqUVB7dFWxNODjbElpdrpZcrIdWSkRSOqgHYfE5ZO2km6OcS/zh8aljlBrqEn/4L/JF20mEN9wGFX0WNG2p2Bd1p1bKCPrPHVR524wdQDvJFLSql6Xb0rLyQ6TW6gDcu5S6mLR0LJ7f/m5vLoyaaX0/HczZcnH3w1BdqruC+G5yMraK+78rCB+fOWROAqQ3/nkW/lIByXGaexPdXQWk50ZK5q7dJqrtUAYCoQvam+Y35h6ZdQJxnS9Yq9VTmiSQwfh8GdPhpHZ8YaeOPVVTi1d6ztT6xSmA0Im3rsQ6DOtiZiutx9emv4lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9700.eurprd04.prod.outlook.com (2603:10a6:20b:473::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 03:37:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 03:37:05 +0000
Message-ID: <af600eff-88ea-498b-9cbc-2c441f47d7fa@nxp.com>
Date: Wed, 8 Jan 2025 11:37:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/bridge: imx-ldb-helper: Use dev_err_probe
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
 <20250107143900.988567-4-alexander.stein@ew.tq-group.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250107143900.988567-4-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS1PR04MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: aabbc5bf-b1c6-48cb-cc9e-08dd2f95b8b4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OW16T3IvL3JXV1prTkhYY29oUWcrYzJXMjBzbUpUbFh4UTZxQURKbjlmRW9q?=
 =?utf-8?B?NzlFK1FkTUhkSllkZEtGRTRTWENLOFlIRzNieG01NHJueklXdVJXM2ppRjln?=
 =?utf-8?B?QnkxSEJ2enRJRTNoQkxWdkdlZk4vemdsa2ZSZ1MzTEg3UjNGV0VnQy9SNzNS?=
 =?utf-8?B?K0JjQUFLYnplZ2VNaXZHSHdkNUl0MVBLV2ZQcXhJRndRdlpZR1JkRFRSZURI?=
 =?utf-8?B?S3g2bS9nZ0xWYmVjeWhmbjY4eGI3Ym90UmdJMHZsd3phRHRHbTdqcVNvNlFr?=
 =?utf-8?B?d2RQM0NtWEJyZ2oyZmdhRlA1YURUYkhBeFdZZEZOR3RjWGg4TXNPczBINU1V?=
 =?utf-8?B?K1NGRk1YMFFlY3djdS9FYWltQXBCcS8zdFZLbE8rVHhvWC9LZEREMFFPbXBs?=
 =?utf-8?B?K0NOdnpwRE8rSDcyYUF1K09MUHdUaG4zU29iTXZPaDhLd1EvRnhRYkJzVTY0?=
 =?utf-8?B?cGtxYmdCWVBzakZ5QWZCVC9SL0NwZkF2NnV4OFNZTHY2dzZUSGdYWmhDWW5K?=
 =?utf-8?B?UXhkblRQMlJZNzlpM1A4Z1JSZnVtR0U5Y3R0aDhzdXFnbGRUTGtsbWRxT0p1?=
 =?utf-8?B?WlVHM2JmMFV4ckl2SXdLdVpHbm1RTXVZZ2t2TGlTYVVsTUxIZWdNMjNFTU85?=
 =?utf-8?B?dklBVnY0SlFpZWh2MU13eDNkZnh3T2dJRXNybDJqa0NiTkNuYjFGUzBDSnZa?=
 =?utf-8?B?LzBQU3RtS1JUOVhOS0lXYW0zS09qa25qcSthNTRhY0o5RnpIWG9tWGZNRmYv?=
 =?utf-8?B?OVpDbVFPM1UzQzJtaDI4RDVXNHlFQlFyK0grSExpNlMxK0lJTEZBMFRwcjE4?=
 =?utf-8?B?QmhGa2J5U0pLTldQK08vUTlGYyttdWd1TVp3eVJuTTJMcEM2ZUVwQk1UL1hR?=
 =?utf-8?B?cUZTL3hDanFaMUJTWHRwUWFvT0swUE8vaGcyVEpGdTZwTEV5cnMwRWFpa2I2?=
 =?utf-8?B?cWVnQStmNnovK1FBNVY3UUlpRUNSNXJncXJIWWp4SjNPU2RrZTVFa1RldXpi?=
 =?utf-8?B?ZnBqa3hFOUU1eDNGNTJOb1Fvd0RkSXpqU2FVaHFkSXVLUGVKMmpRQ2piNDhm?=
 =?utf-8?B?aU9nTzdyeVFCWDVkVFdKQUtjSVE1c1JJcmpJL2x6YUYrcTJBSktKT01ldENl?=
 =?utf-8?B?Vnc3MkhqUlZsN0Rwd3lDNmlBclNwV29IczZBOUZqUzJDVDc1UmYzOGVkekhV?=
 =?utf-8?B?R0xydlFvT01xVk4xdjZEUHo0UVFUYVZZZEFoekJwUkRsZTBDM1ZtNjNGNTlY?=
 =?utf-8?B?UzJQUXRGMFB4dW83S3pNaEIyT0hEMlAxQVUxNE1RY2trZlFVYTlhcCtuMTZT?=
 =?utf-8?B?dlhrY1VEKzFDSzdPb0g0OXY0cEljTEZwSWFpbHJUUndPeUFCQzY3RGFOUnJL?=
 =?utf-8?B?SlZSdmZDSlRUaWo4OW1BR0xkNnhxMWtsWVZTb2pyK2pkQUJvRUlzSG9QSU4x?=
 =?utf-8?B?S3ZkYTNqeW9EenFIVmp6ci9WVVVGcEtrSWdBcVRlTjlyZlNRYVFYc0w2S3Jp?=
 =?utf-8?B?eVNaUzV2RG5VbFFxQmtHbXdiUVNDdUU1WERCY3d4THVONUdtTWxFM0hVc1Vn?=
 =?utf-8?B?WEN1S2dsZDRUaE9mUWxkaEFnZHl6Wi93UHVnRWhiRXFZSmJTbnBQamxGWU5a?=
 =?utf-8?B?QWNhR3ZuVTlqaytLZmo2MlczVTg5d3k4Z0tBMTlFZHBtZXZpYXB6UHg4ZjZt?=
 =?utf-8?B?aTU5Qi9FNGxtNmFiRVZOWjQ2NUgyRUhLbDBmdjRmK0YxOGtYTGF5c1ZReGVp?=
 =?utf-8?B?MzZHUkQ3d3NGNHlGY0xqN0RLL21hQ3cyZVpBSnFhZWZneVhUOVJaM1lFTzFD?=
 =?utf-8?B?d0d4bXBnazMrTHM0ZEpTNEhCd2l2eVdBRHBlaFNzdzZpNk1nc3N4WnJtZm15?=
 =?utf-8?B?YWtyY2RCclcxcEtPa0NxRG1Zc1JJY2M4emkzWDJ4eHRrbTdFNjFiR29DcVVQ?=
 =?utf-8?Q?W9FojSr/EUE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MC9YUEtCVUhIUEcwZnFYZXZNdTNtV0wvbXpwMWNJNWdLQm9tSy9JaUVnMnpr?=
 =?utf-8?B?Y1o1emJ1bnNDRWpJcWZ3TjdaR3dEalVxeEx0em9qWmpMTVdpbU1EamZkcngw?=
 =?utf-8?B?RUNHTGdzc2EvR2JFRWFiZlp0eXNGbjBLQ3VWcmd6d1I5Y1VGRTFaZHp6WFdF?=
 =?utf-8?B?RmpTaXV6aWVVQkJCMWo0Vk05dTJJNWZQRFluczMxa2thUXN4dnpneEJKRERm?=
 =?utf-8?B?aTUyV0dYS0MrcG9tWGJyWkdOZGZpRERtNjEvTnhWYkpmcHpGL1NRMjYzVXI0?=
 =?utf-8?B?dkpMRWRIR0hQNzBiQnQwVmNBd2dEWHJPMXpUNm1HejRQUFIzLzdRd2JLMnFY?=
 =?utf-8?B?WjVnZndTQXZ2WlF1emRza3dWcWZWckg2Ykc1SkFiOFRkcWh1RlR1bzBmdi9W?=
 =?utf-8?B?bWNnMGVKd2gzOVRuK0oxVDh2c0trcnRlVzhSNzRaR1ZYTkVTNFpKUFNhcDdR?=
 =?utf-8?B?dkZqT0hSVmlmQzI0b2UyY2YwR3QzV2h2cktxMDNkLzFlZjRHT1JZNGxxdEll?=
 =?utf-8?B?aURyS2FENS8wUUNnakxRdDRWVW9IMm5sbUJiRGVVUnpQY0FzQWJYN3VqTUpE?=
 =?utf-8?B?QlgxSkxYdWRzRVpZWUJBNWlVRnBRSnlWUmY0Rmx0R0xxbk1VakhSZktCTmJM?=
 =?utf-8?B?K0FwVW1nQ2FCVVBXTjhkMmxYV0k5eGFtNDhwN3lwbEtRVjVhSkljcHczMjFh?=
 =?utf-8?B?WlFidkd0c3A0dW9ZbWMvd2tXaXVvNGNwcEV1NXpnRk1IeTQ5Sm9FZGNBSzh5?=
 =?utf-8?B?MEdmUW1SUUpNTU5zcUcvZWE1Z3RER0NMRnBkUHRGL2F6M0w1a2tkR21oeCtJ?=
 =?utf-8?B?OE9HTjRjczhsNU5MQUlUeFl3bThYV1hhL1JiNDhWZzZ5YmFEMmx0bU1uOW5B?=
 =?utf-8?B?YVduaVk2Qm02NHMweWFCUzg2SEpsbXdodWp3S2QvcGlGbURrL0lFZmlsM3Bt?=
 =?utf-8?B?ZThvSlBQbHlYbVJMMzRhY1BvL2RrNThndXFIUnp6SWNwS1R1VzFSdE5vdlIw?=
 =?utf-8?B?enFXWWJaUmw2SVFxWGxmSENyL0UxTVMvZkNoSjZnbHlDZDdKanhGSDFvSXBX?=
 =?utf-8?B?b2EzMXJWYWpqbHltbXh4LzdxY0pON1lTYjBhRW9EOGNRMDljOGxlYThYbEht?=
 =?utf-8?B?MERQMU1OUnQxdHR0UUpaS2xrdkQvd1dkdGpoQ25XeEJXUUQrcHB4RmxzNTNG?=
 =?utf-8?B?cnEraEdFYnc0dkFJZXlpc1hYOHB1dVdFQVRqZHBNQ2ZrVHR3emRzaTRXSGtY?=
 =?utf-8?B?c0dyaXNLQVJYcUNCejl0RU91STBQZTN5cW5zZmk2ZGtSQ0xia282UzVFRldT?=
 =?utf-8?B?K3diSTBtMisxTzlvby9paVNTeC9UY0h6b3plcDZmTFVjUFdoVWh1MDIvY003?=
 =?utf-8?B?dFZUaGtuVFlPZGJ0OE9XM1h1OEY4SlpYbDd6ekQ4WFpkUzJ4elBEU1E1NWk5?=
 =?utf-8?B?RFJGRk1vb25RcmxhUTFGY1k1UW1Zb2FXb25tZTBDWEJpMEYyenBpQThHR1Nz?=
 =?utf-8?B?SU9pVUxXdEZQSTFJd0plYXJXMXdKdzBnME03eXhXOGVwVmI3SlAyRUhIZ1Bx?=
 =?utf-8?B?OUhneUFnZ3B0c1d6Smt3SExub2lTKzlvN2cwVjg4Z3JxcnlJTWRsRnBMeWtO?=
 =?utf-8?B?ME1WOHFWNzdaWXhua010YWpVRnlZT3pwUFR4bjJMNU1pc2pwOTFxMERUbFBH?=
 =?utf-8?B?TDRPbUxnUzA3NVlCOGptM3NTaVF0VjRseEhuWnh3MUVEcUllNWYzYUx1Z0Jy?=
 =?utf-8?B?NkdBejQ0c1V2VHNkUkxlOEFsc25xdUFSRThuN1NkN2VSYjJ2NStkbXlZdS8r?=
 =?utf-8?B?TUp3QktIVGRQWm9ydzl2MnRnbEFrRTdXV3Y5dXphbmk2YitGRkFGMCtlNHhr?=
 =?utf-8?B?eXpCUWFFWEZkeEJRVCsyNzV5a3BuaE5tR2Z1Y0VNMnlkLzVGeS9zSkZKRG5n?=
 =?utf-8?B?U1NqVWZyanNsanlidDRtM1Vhbzdyc3hsR0FBdnFWZDlLVXlnYURMSU5KOFVp?=
 =?utf-8?B?Ry81VVlpOVIxS2dCNVVOaW80dE4weXJhcWVIUGVDUEU2VWhBTGtGMkVKWnk2?=
 =?utf-8?B?c0Yrck9rVDZlL3l1QUtRdUIrUzJVNkhJNGxUZXAwdjVlQldiaVcrblRFMVoy?=
 =?utf-8?Q?g+Ufble59nTsFvFI7AwLJn/fD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aabbc5bf-b1c6-48cb-cc9e-08dd2f95b8b4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 03:37:05.4754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHGtDdqgeHGo+AGi/2Kvfcv66lbAJTEKjsUOtigD/UJoZNkRKWOlaELjly/9yHaO97G8zab4BFvu1rQ8wgxnkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9700
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

On 01/07/2025, Alexander Stein wrote:
> This simplifies the code and gives additional information upon deferral.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> index 9b5bebbe357dd..2c9b862af74af 100644
> --- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> @@ -167,7 +167,7 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
>  {
>  	struct device *dev = ldb->dev;
>  	struct ldb_channel *ldb_ch;
> -	int ret, i;
> +	int i;
>  
>  	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
>  		ldb_ch = ldb->channel[i];
> @@ -177,14 +177,9 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
>  
>  		ldb_ch->next_bridge = devm_drm_of_get_bridge(dev, ldb_ch->np,
>  							     1, 0);
> -		if (IS_ERR(ldb_ch->next_bridge)) {
> -			ret = PTR_ERR(ldb_ch->next_bridge);
> -			if (ret != -EPROBE_DEFER)
> -				DRM_DEV_ERROR(dev,
> -					      "failed to get next bridge: %d\n",
> -					      ret);
> -			return ret;
> -		}
> +		if (IS_ERR(ldb_ch->next_bridge))
> +			return dev_err_probe(dev, PTR_ERR(ldb_ch->next_bridge),
> +					     "failed to find next bridge\n");

Nit: s/find/get/, since "get" was used.

>  	}
>  
>  	return 0;

ldb_init_helper() may return -EPROBE_DEFER too, so it needs to be changed.

-- 
Regards,
Liu Ying
