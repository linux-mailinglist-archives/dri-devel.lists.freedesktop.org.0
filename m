Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEC1BE1BBA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00AE10E955;
	Thu, 16 Oct 2025 06:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Rjh/t1ff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EED810E954
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:32:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaX62p0L/sWpVWDc+68iS/H57ea1dJf7xq6BUFDFtx2189nah+u0EFcaUg9L2MR7HEXqLbk+o3alU+SPjPrqqGHUfSrVRIDTkBoahYxaQQVD62scEwN+2Zt1urHndzxDGd+nADUUn/e6FD7RhM8xGPSABl4W4e9VydmWQSDb026EU2pojJQ9cpRkmfqJUXyc4rFxLuu++0MvUY14faep8d3Gf1z88feAvfFgqikxwGn6NJfm+tfJvwDWbDhGLJi+nlAvuWFyG7BM/8iwOrjzMVMeHQ3x+yq8b9YwoRJAaH9nJRUiTNJ9fcpEcHJF6hDNWsbHIyO+l+Qt6tdLdcwKbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGMunIFIcOBCJg2FjXlmclmg9c2lCgL4MzlfIYGhw78=;
 b=FjkFbYe8kE1DFrOe4J9pWF+FHqyd2VqXNNuW35HeUygb6lo98soIalHZVb10sU9ynZQneTaphZwblaHlxlrTzzSNUdB5wzs2MBNaPTO02BOjVmk+px5vDwYbKgOThU8ca/RhhMCiY8sueUFcoUVirzxfHihM8AKY7YP3Bo3DLH8QuvyLVJHFPwlsyesWU3yQ+1M4X+O3FP/cScA/XANlvbYCatFfws1koRbyHWdkmcE9imP32wFaIG0th032g5qKujoqid15vjgKnNxIEw//HYIf3P212pz0ScsZXfNJo5FRh6Rdz1jjQ/77meyzGSXnnTaR/NLHZQ16pHTob2+85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGMunIFIcOBCJg2FjXlmclmg9c2lCgL4MzlfIYGhw78=;
 b=Rjh/t1ff2HEhZTCy+ilSFsNVZo8nSzgoyryXYjTKIkX2TUvUZR3N0qj2aXT7EsxKBvzZfgTnSzB09JebV/7XX/C6awEMAMRxHYcNmnSZMV2hZ8f8hTcUD2QbAjdxFSfiHQpfvKJot2EvLYl8R2VvSIGledPMVGOGppe/TcDDnhJl3Ycqc4B5WQhWM2HwBtY0Ctf4jcb7tKOLoAsuEbkNdP9oa1uVSNzrzVF+npquNuVcDRz9G/bgh6iDhrsklik1hiSefbhu4IScTtcRIfRwC4MicndzthhtNrnKlQnG42Ljp6eW0/RLzHyfU24hz0C3Fp9YN/7OyK2ecETVHi5KCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9964.eurprd04.prod.outlook.com (2603:10a6:10:4c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:32:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:32:50 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 16 Oct 2025 14:32:22 +0800
Subject: [PATCH v4 04/14] drm/imx: dc-fu: Fix dimensions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx8-dc-prefetch-v4-4-dfda347cb3c5@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
In-Reply-To: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
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
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9964:EE_
X-MS-Office365-Filtering-Correlation-Id: 88200a51-6fa8-40c7-f9b6-08de0c7dd3c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejRhTkZ4OHh5ZWtMWVJCcWFRK1FGNUpZaHBWZEtGZVVpOWZ6bTdHVHhlZGpT?=
 =?utf-8?B?cHphTW5MeDJsbCt0L2F1ZlArSVFPNGJlMGJPbE10SmtndjhqZVdiRmo3TmhS?=
 =?utf-8?B?emRHSzdaSk92bTc2RStCSXlXRlZOVGsrNXZaMkV3R3RWazZSeXdaRHBTeFhi?=
 =?utf-8?B?M1pncTJLTml2LzZhcDRBWWFmKzZ1aE1xdENRQlNIbHZtWkxHTXJXNFQ2QUEw?=
 =?utf-8?B?L05FVitpYysxZmk5SEVpdWdLU2g5Vm1iemZPTWxzZHNoYXN2S09PcUl1d0I0?=
 =?utf-8?B?ZzlIcWZrTG5Id3NlTkorQk02QXpIQjlEWVNiUk9MV2RubVE1ZzcwbTJVVTJM?=
 =?utf-8?B?eFBsZCtObXlXRFhrSWVxaVgvaUpEanZWb096RW1BU0E4c1dxSmluSFcydmxP?=
 =?utf-8?B?dGg2MVRWMmRFVVl0MHFHai9TdXZ1aEs3ajBFTVVPZHU3M2Q5bWpmdkQxWjM4?=
 =?utf-8?B?T0dFaHhDV05qY3ZNa3AxbFNZWkowOEdrcmg4eHdxMU1oL004OWZEb2JORFRI?=
 =?utf-8?B?cDhiT1hEb3hPTHNnVHNvdXRhSXh5UU5CSUpQQ2toRFRvdUc4YUhydDZ1alZx?=
 =?utf-8?B?R2k2eGhXS3djRnBNaTh2Nk5rSkZRSk5sTWI1c1FOTTBXZHczWVd5UmtySVEw?=
 =?utf-8?B?cWFPSVZkSmZuSDhmclRkRHI4aXhFcXUwK3JRcEpJTS95STF3MTF3a3UrZWhM?=
 =?utf-8?B?M2NtOG41YUVBdFBDL1FIUUx4bUt0Q2xIcDNuc2cwVzlaZVhBRENnTTVQNVhl?=
 =?utf-8?B?RWY2WDJ3eURudnFVQ05HeUhNSXduSy9TRGVXNXZTcGJnVy8reENkTHRqWEdE?=
 =?utf-8?B?TGZ6S3k2bnQ2ckhmWFJjbVJkVEkxazloRjh1MTFuNGJkaEVPRHFTTlVpbk54?=
 =?utf-8?B?RnlKc0hWSFpyN0Yrc3F5RnZHNDhPRGsrNkloQzMyWFpjZGMrUDhWT3BOU0NN?=
 =?utf-8?B?eDVNUUlQOFMxdWFEN2ZrYU45OS9EUFl3cmVRaEZXYmdkb09yS3l1YkpMc0xr?=
 =?utf-8?B?aEZFcytSdjlaR0Y1TEMvVzdteWdFRW9lVmVpNHBqdGdEbWFEQi9rcnUxREdC?=
 =?utf-8?B?V2ZKYkxjWTM0cHJqdi9veEgxeEhHRjZWb2VRc21Mc2xKSFZteDhFT1VRc2tJ?=
 =?utf-8?B?QzBiZ0h1VXhPVTZCZVp3ZWJkZU4rblgrWEtod3ArTnJ3LzlLcTFlV3FUNUJM?=
 =?utf-8?B?b1M0YmhLYmhuWUVwbGpINWlUNnRYNzl6cTF5SjNraUFYMkZaaEh1dk9vSEdm?=
 =?utf-8?B?T3RhekhUbTdsRzdPaW5rWFR4MTQ2L3RNMElhWjl0RDFyNStNSTVMcmdqNXI3?=
 =?utf-8?B?OHlwamY4aERKRUFFK3FSU3NoUWd2QlRtc3VFK1FlQkFDTFgwcHl6a1BPOS9Q?=
 =?utf-8?B?RjkwVTFNck1zUGcrYW8vN0F4akNleGpWZ3J3K2MwS2VVbnpUZXVHbHdHWDRt?=
 =?utf-8?B?aEN1dUlDSkJDaVNlSnhPSXh0RnBMME1LU01QREJwNzdlbnloV1JrYjVjeFpL?=
 =?utf-8?B?VEpJQnFFQnZqMEovOWFZclZDNEFWNS9JTmJ6K3ZjNFBuNmh1MjVJRmVTQjNz?=
 =?utf-8?B?OFNnR1Nub0Z4dHl2dEJuVGdHTEM5MjNUOUZYSUg5NFRqbm9ZSW8zK3NDMjN1?=
 =?utf-8?B?QVhjUG5IUTM1cGZ6b2JKa1ZTeW9qb1p5S0swYTVka0t2RCt6N1luTHZLM1k1?=
 =?utf-8?B?a0JkRlNZd00vb3NrUEhYeFAvM2tVeVJRWHBDR3pWMkp3b3YyMndyUUVZT0Jt?=
 =?utf-8?B?MjBoWUtUaGsxNHpiRk9rL3dFMkhvYjcxODFQMlN1U2FnKzkvdFV4cUp5RVRR?=
 =?utf-8?B?dkxwT1BGKy9FcDRCQ3c2d3AwYUdMMTBGeUgzYllWeVovM1ZHMG9QMW9IK1Q4?=
 =?utf-8?B?a0dLU3JEUlRhRWQraHowZVl1V1V1aVhrdlF2UTF2RE5jcWUzZ0JUTjRkaVJ5?=
 =?utf-8?B?OHowaURjMFlXcWtUU0pCQ0FyVUF1OEk2Q3dIY2krU2RIc0NBSndiZm9oVERm?=
 =?utf-8?B?bmYwZnpFWUFxUHhGREJFS2VvVnpXY1d1QUJ5ZlcwdVUwbktvdzdDL0I0b0VW?=
 =?utf-8?B?WHNpRUVjUFZlbFJmd1FWaFZRdDFCZDhvVEZyQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlhDVndERm5ZZmZncE9BdGltYjBZUkZqR1F0VHNmcURKdDlXY0FLakI0THNa?=
 =?utf-8?B?c0VwcjU5ajZvUmZadmZuRzl4YUJ4MTY3VVBlUncvRGdsT1QvSFdTWHpXTjB2?=
 =?utf-8?B?RWxwZmlkU3U5b3lIaXN6emh2Mnd4RTQ3TmVUVkZKL0o2MlJhaWdZbWN3Q2dj?=
 =?utf-8?B?bDN6Wk01VVFBVm5OaGE1RUZTNWVjOTROUVowaXVDaWNwWmpLdWpSNkxQUElF?=
 =?utf-8?B?YkJVNTViQmZzeGV4NXpxcCs2NldrK3dxNlo4M2VHa3hJQlBiVHZIVG55REhT?=
 =?utf-8?B?QlU0R3l4dTFIRXJWejVOUWd3VXprd05FNmxCSXZmcXE5MzF5bVFoR0J0MTJS?=
 =?utf-8?B?ZDBSenBwam5zVVB1cnJTajM5VDExOE5laTBsRVlLZTRTdTUxMlRpU1hybzFP?=
 =?utf-8?B?MHZ5WGVuZGZHVW50QWtMWVZ2aGRzdHBsbVpPemEwUUtwa2toekdCVnJPYWZu?=
 =?utf-8?B?aC9PSC9UOStWMUxxMXdWUFc5L0lvcnkzcnpVS2tGYWk5Y1pSUFNua09DU1F0?=
 =?utf-8?B?MHUwZ3lla1huVm1icFFVTW1WS0NPbzB6cjlPc0hsOXltdWsrZmJVa3lUZ2tm?=
 =?utf-8?B?MDh5N2JRQUUxbVd6blpGeVpUZUw1UGNOTWF0RFhjVHRTN3g2UWd2SlNOb3RC?=
 =?utf-8?B?UzlNQStQZXUwRlZtZUFkYzBvTXVCZkU0TFBOZmFlOWo4TERUZ0owbVU4aXBQ?=
 =?utf-8?B?ajlIRnRoRFhEQjcyQSt6RGJwTDZFVW13by9EK1NrQ0R4b3ZGOGdtaVcraXJa?=
 =?utf-8?B?NDlxTXFsenhwT2xOMEk4bHl6ajNabzd1NXFJbW5HcnpaM3ZPNDVCbWFVaWVu?=
 =?utf-8?B?TXJHK0NBZDJVZWh3Nm9xTEdJZHYxQmFqeG5OWlhudThaRXdYTzlhWmJzTjhz?=
 =?utf-8?B?WEVaTFh6bERBQ1NrdGVLRTZyVEE1R09jeTZ2Sy9tTmpFZkJqa213dG00OHBV?=
 =?utf-8?B?ekpKTVR6cUhvYUdJS1lYU2tQR0NpUHgwbFFuaExCZDZyU21MYWMvRktHK3NU?=
 =?utf-8?B?V2VSejBjcmhrWFRRNUZLWUo4djAyS0NCcXoyMkdGRzJmeXlyd0NiQzVuMVh1?=
 =?utf-8?B?Z1Z6RXh3OWdxZy9DeE9SSmJyN0lQdytJa3Y3aEdpZ1BOTXZjTnVZNWJNaGRX?=
 =?utf-8?B?Um9MSTlJZEpuYzZRcndOTm13QmFSNGFKbGE2bTY2SnRJZ2Q5K0VTK01ZVmdn?=
 =?utf-8?B?cWNZRHpEZGg0Y1ZoK2I2aDI5R2gxMFVzcExXOStzMURFUmxaRWdyNU9JMUFv?=
 =?utf-8?B?M0lEb1h6cDNRVmJjOVpBT2RrNzEwY0F5VWhQdzFwbUpuOVcvRXg2NmxPczhs?=
 =?utf-8?B?RldxZDgzRUlsV2RQckovdDF3VXdwUnhqSEZqblFMTTAyblNZTjNJVUp4YW5V?=
 =?utf-8?B?U1FCNGQwYnJvNTdIUzFpMTlqOXVyUlhzWlVUTklWa1JCb05LMWpZcmk0Nlhj?=
 =?utf-8?B?TlVnTUdCSHVZTG9US3ZFK2VUTEVlRU82cU10N0dvM3k5YnhzWmhEZUtNMVBU?=
 =?utf-8?B?aXFhbUJ5VEU2NjhNVDNjTExsUVEvL0IxVVdxTmJibEF4b1QxWVgyQTExMklj?=
 =?utf-8?B?aEhKRU9ia0I1blZFVkJudC9qMkdWNFZWL2RsK2l4bVpOUGd4UTZ1NEhheHNu?=
 =?utf-8?B?Rk1XdmViSjRyNGVsckw3QVRFUThIelBpWlh2Z3ZGd1JHMFdwdHJKQ0RqUnJw?=
 =?utf-8?B?YXVvdHlMcnpWSnRQUmRuQXFjVlJYa2g4TXdCSVU0UmdaTjVveHRadFNDcnIx?=
 =?utf-8?B?OU50akxnS0ZxcEUrbVNweXVqZEJmWEZkR1pIZ3NJZ3NBVlZJUlBxRFVPMW9o?=
 =?utf-8?B?dFA1WTJsYlB3V0pGNnJVNXdGblZmeUxpK1RUMCtEUCtPQ2RUUHFKRUFHbk1m?=
 =?utf-8?B?dkpQV0EzYVZkUmMyNVZjb3lVcy9RZ1VIbW9PVnY5ZXlIZzU5by9aMmZ1UW96?=
 =?utf-8?B?bDdmUFQrdXdsczFvams0ck52QmgvdFZuMHcwdVI4bUh6dDNua1JaQXRNOVFE?=
 =?utf-8?B?TjhQMEZjNTJjc3cvTDNOT0FxN2ZMd0tZY3NZZ1A1YWhvTDRYcXhRMFp1MGIy?=
 =?utf-8?B?aDVabi9wanlPelB1Mm14c3FIT3hORWdEajhyRTNKeDJTbjNGMUNtTndkbExM?=
 =?utf-8?Q?oyqUheUDHBnYrOBfqZhR5I6D4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88200a51-6fa8-40c7-f9b6-08de0c7dd3c0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:32:50.0137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6h7t4IxckO25xdpdccFa37LsAUMMEob6HXke/Ogsr+jsasDl5xBXG8lQp2vc0LYNwYm2B6uLWfaryH297FkIAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9964
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

Fix off-by-one issue in LINEWIDTH, LINECOUNT, FRAMEWIDTH and FRAMEHEIGHT
macro definitions.  The first two macros are used to set a fetchunit's
source buffer dimension and the other two are used to set a fetchunit's
frame dimension.  It appears that display controller itself works ok
without this fix, however, it enters panic mode when prefetch engine(DPRC
and PRGs) attaches to it without this fix.

Fixes: 0e177d5ce01c ("drm/imx: Add i.MX8qxp Display Controller pixel engine")
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
- Rebase onto the latest drm-misc-next and resolve conflicts.

v2:
- Collect Alexander's and Frank's R-b tags.
---
 drivers/gpu/drm/imx/dc/dc-fu.c | 4 ++--
 drivers/gpu/drm/imx/dc/dc-fu.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index 1d8f74babef8a7139d9d4d42726426dfe437d966..2e197b3344bd12491c1f7bab0e5304190ed84356 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -31,8 +31,8 @@
 #define STRIDE(x)			FIELD_PREP(STRIDE_MASK, (x) - 1)
 
 /* SOURCEBUFFERDIMENSION */
-#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x))
-#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
+#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
+#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
 
 /* LAYEROFFSET */
 #define LAYERYOFFSET(x)			FIELD_PREP(GENMASK(30, 16), (x))
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index f678de3ca8c0ae8d883ae47ce6bebc33cd00815d..cc93317e300134a0f8c378a155fb7c67dc6689d5 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -38,8 +38,8 @@
 #define YUVCONVERSIONMODE(x)		FIELD_PREP(YUVCONVERSIONMODE_MASK, (x))
 
 /* FRAMEDIMENSIONS */
-#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x))
-#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
+#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
+#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
 
 /* CONTROL */
 #define INPUTSELECT_MASK		GENMASK(4, 3)

-- 
2.34.1

