Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710E39B7288
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 03:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5AB10E828;
	Thu, 31 Oct 2024 02:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Nv0Wze8X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B05B10E828
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 02:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EI42ZRe6W19lbS899f99u3GR7g4kWd3xxeAJTNSwG1bKRWLZGQpd9ut8h9i7rZ/76NwDeTCaUKlDFOz0onlyzMsaMOHKSfTdOQqV9B6i5KpmsRt9EfLKlBr6h/iJykx2eSSWfOxdEdxxnnJ4vPUoa/bn5UL59UTYyxdDU1TIVigkEoA8gkyUkmnopPucKCFl+lOW7gVXs6DFs1NKvPM22P9BecImokt821/wpmk4SRyuM5mGoWAnPUd/W7eVkuafc2tTd/JqEQiAseEbcw4RQ/qvMFQ4UPr2M/y7XR/PtLbN7Lagy64LWA0icgUzyLDQ3E4x+ZXmjRM7FKPCHyMgig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Agz+FzndMgo5Vo7PuHqE8VHAL3BvA0V8K5J8MaNeQ+4=;
 b=GziCtrwLmavTjPcLS7Xz5ftyq+46PMPJUlLU90IE0buU5cpgQQldafECmmlcbRWNO9r5dAG4gYzeBVNWKLjY7kXmJ7Uf3z7f+AXZbGSqNdzfEdDc9p2F4QA62y6JVMi2LQRgkkROVSHtaVyz1olvhah+hM5Ty7fyaZmTm9F7ccDN4l46bXbszfqcKJUm80/jZtjjKlGSf6DRCi52oQQwgW6anRJjClNtNWdg6KyR5+nOpJ1k6G2XoE4gez36C/5A5jht3nx+JSmjQ5o5CBgMfF09En91s61c29rJFsUTCbAIapZf90wtAMkWK8qPGXGgH2ldzwULhjcYoIB0ba0MvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Agz+FzndMgo5Vo7PuHqE8VHAL3BvA0V8K5J8MaNeQ+4=;
 b=Nv0Wze8XqNCMB26O7+Ze7AKsWp36TNMBDwe2Dl2CkU6yRosfg2zgOQ13Ke5WEhzRaJmjH9DfiuaXWN2w+zYDLBzBEcaT3NwS994uzw1DObPn0XJJl43WmLHGpdRiZyOunNmUGYjIAemDBzX4txl+vjJ4bbgUJcrOWHYAUxR83ot8XThBc6EFCwuRbwsyHQ0BVzw+b3O0mQWn35RPFBMmsClM5/9ZZkJXGcX9SjMyv7DmYbmxgzWdnfn1gzKZ4Pq8/7XHmQ713pTR2+BxEy+UlXBlE7W0U8//nrjlVJ6CPF+tUWTi3su5MRLUYB0dIlzENM4k6GJR9q/76jptKpTXKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10961.eurprd04.prod.outlook.com (2603:10a6:102:492::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Thu, 31 Oct
 2024 02:35:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.023; Thu, 31 Oct 2024
 02:35:02 +0000
Message-ID: <47d92ae0-c71a-4c18-9ad7-432c0f70a31f@nxp.com>
Date: Thu, 31 Oct 2024 10:35:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
To: Maxime Ripard <mripard@kernel.org>
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <dbede671-c97b-4ad7-8a54-f1b381fea082@nxp.com>
 <00ffd38c-b01a-40cd-9130-19c35a387ca0@denx.de>
 <819380c3-d13f-4989-b305-388fc60d30e4@nxp.com>
 <d99e0021-3253-4312-9b50-6031ae0f8d8e@denx.de>
 <d1307426-9a86-4356-93b8-9a10c8369ad8@nxp.com>
 <20241022-quirky-ubiquitous-hamster-11dca5@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241022-quirky-ubiquitous-hamster-11dca5@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:194::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10961:EE_
X-MS-Office365-Filtering-Correlation-Id: a153a295-c207-4a1d-8d5b-08dcf9549f55
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clpnMU9oVTB0aXJBTGFwdjZ3dXpQcGcwbDQ5b3hnM2RKTlhxMldMUGdiSUNV?=
 =?utf-8?B?Mm9lTjJ2cVBQL2dRZ1dQNUUrWGRqMlh3bGI2Ty9NNU1EcVNyc05TcjFReEIw?=
 =?utf-8?B?bnVTV3BNSUNVYXdwdEcwSFFTT3NtZzFmck0yZDJjL0dGZUl2OTBDUDFHRTBG?=
 =?utf-8?B?MEJQbEI5enVYSldDcEVCYnNCT2Y4RGpuZHBYY090ZUJLTkVldjVMMmR5Q3g3?=
 =?utf-8?B?MmxPeTJLMjhLVTBIL2dTK25OVGFyOVl0cVBLTFplOXhEVWx2cTF3b3hnTzZ4?=
 =?utf-8?B?NUpueVAvNmZ0QjRnR3RyYkFFNVJzMk44eHkrSDl3RU9sUU81ejRRNDVBa01W?=
 =?utf-8?B?Ry9XR3ljamlzdG12cmpXT1NHTDQwV0JKNSs3OVJ2MXY2THhRLy93eG0wUVFE?=
 =?utf-8?B?bW1heEVEOWVnaUdYQmh1QmlaUjAyNGpwWlFpTUljOGRVdWVyS2RTSTlnYzJ3?=
 =?utf-8?B?ZFZzSTk2YmdQYW5jUkE1QzRyR1lkT1B0RllMeXhSMjI1anYxVjZlZ00xTzRX?=
 =?utf-8?B?bWtiM1F1NnRpYlA2TS9Zd0Q3OVBvUW56N1J2R1d6dUw2ZStlN3RtVFVIMVUy?=
 =?utf-8?B?cE1LelkrSGltR1BoWkpESGFwSThyNkhITjV1ZGhuRFo0NlVyTmd4SElZNFhn?=
 =?utf-8?B?aVpGa2EzOFV6Mkk2aWkvL216UVRQeUNVRWlLVGlYUkUxeGVwTnhhbUVKSTdu?=
 =?utf-8?B?ZFd2RTJnOGhlNVFMS1dEZ2N6ZE1yaFZ1dlQxL1ZkUGZIZVJCcDJoTk45WEtW?=
 =?utf-8?B?dGxYRzV5SjlxS3cralZmem0wVEZ0QTA4UW53V0RuM0dSWmMyMUpadUt2K1Js?=
 =?utf-8?B?cFZWdmlXVVBDYVBqSU9ub1gwT0tYUklxUHR1WXREQTZvQUpOMGJrTDFvVy9u?=
 =?utf-8?B?TkVZUHBjL2xOeEpDeG1WQURMYzJ5UTVmWHEvdGxpTDRFVkxNTkRrTGpSTkE2?=
 =?utf-8?B?OFVkT0hVaHNPS08rRTNvVktlQlNrWWpVeGNLYlhQYmxXNDJsZnR6V2liUDFN?=
 =?utf-8?B?dWRWUzFsZkJwYVZOWWluTmpldGZmWEhkemR3N1ZWeXYyOUlKdVRyanNtaU9o?=
 =?utf-8?B?cXBmR1hwbVA4N0JwUVdDajFOVzNjL3JRZnQ4eStTcTh4YS9hMTJQRzNreTR6?=
 =?utf-8?B?czVVNTFTK1pNSExTWlJ0dXVvZjVrQVFkODNnNVJobCtrYnJjTm13MGN5QnNG?=
 =?utf-8?B?YlBSRHZPMm9icmRoZk1IL0p4RkZLZ2ZaSHNyV3E5c0VVY0orOGlHTzV3eU9K?=
 =?utf-8?B?TzI4SWllYm1SN3Y5VEpmSlJiMzllbDU1THRJc3k3aGVnUlA1K1JNZ0pGd2dW?=
 =?utf-8?B?TFdrcHFhU2VSNC9UMkI4SkRIOG1YQjRUQ1F6RmxzVmEwc3c4eUp2N21vM05V?=
 =?utf-8?B?d3FzSDFJdWFtS3d6ODN4aXByalRCN1p4dGNwVXdKczZ0NmQ1K3Z2dmhzd0NQ?=
 =?utf-8?B?TjJENFJlNGN6eE00NzZCdmVOYnRGb3BNTm9DMGhTVUk2MlBIOTZETXB3UGQz?=
 =?utf-8?B?RUI5UW9MeTUzMmlEK3BYYjRzVHJRc0RjcWJ5VjVod2V4M1MrWENMWGswNnZZ?=
 =?utf-8?B?ZkliU3hkcy80cWFKaDlMc0ZGQ0padU1QTndOcHlvM0JSemExMUYzVCtXMVF6?=
 =?utf-8?B?dDJvQlNNTk9hK0M5ZjdSdzdFZHdadUZkcTYwS0w0SngxWjVCRytLNnhYOHFX?=
 =?utf-8?B?S1ZkSnlVcDBqekdIN0ZtaDh0SFRodkt1dENaNFo5dy8yVitGOWhSYkdNMnA3?=
 =?utf-8?Q?k77+RgY4y9KQI7UZm9bYcy8i3l/xPG6f7YxXvRn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUY0TjBORFN5aVhGQ0tFS2hHd2NjUGZSZFhRMDF4SFByYUJ1Z0JDMituMS8r?=
 =?utf-8?B?by9icXZRWTNGcVMzWm1QWEx1UWpTcDZrdGpPMUQwb1o4a2NhUWRUcjNwMWgr?=
 =?utf-8?B?MXNaRnJnVmRLUjRwT3c4NW5BdGcrSy9GbEtka1oyTC93ZGZReVByTk95QWY1?=
 =?utf-8?B?eFc0RUJ2bTdvUStHeW5acmhjYVFBbnVsU0RwK2ZVMlk0QzQ4S3FjRjhKTmxZ?=
 =?utf-8?B?NXBJMkk2NVF1WWovM2dyNU5xTkpOWTdrUlJ5WkR4UXdZNm0zR1hUMDRka0dR?=
 =?utf-8?B?QnBDNlRjWUVHNnhCVzdYcFAxOUFNYTZ5Q3V3OWJEaVVNaUlhR2VPbG44dnhN?=
 =?utf-8?B?WTVrSEVURUYyMnJiV0t5YS9jODA3S3JYODd3ME5NNFY2U3FwRW51U0hBeHFl?=
 =?utf-8?B?WnBINTdtMjFxWkVJYkRpV1BONEE4MkMwS3pBYmRNY3pKYXdZNkxtNWtEcG9B?=
 =?utf-8?B?dFk3VTBqem5SRHpRZS9Sd2NHWVlMazF4eE1VZVZFUzI4d2lWeE5KVitKT2Jr?=
 =?utf-8?B?MVlOaGp4a3BaL3BtWTlPYTMwbWRnZi9uWnpFQUUramVxczdadDVMbVZmSE13?=
 =?utf-8?B?U1k5aU1mNzF6VE1xRHVEazVBWXhyL01CSk5CK3l6TlVtZ2oyTDVWV2hNbmpr?=
 =?utf-8?B?ZEFzWDVRVEI0SnIwT3FqNk05ZTg4N0xjSmJVU1AwQnF2WWZCQlZsbWZIQnIz?=
 =?utf-8?B?ekNOcDdGeGdzSlVIME9mczZHaWdualdTaDcwVktzd1VpV0x3WkZHa2pzWXFK?=
 =?utf-8?B?UjZCZXd2Mkg1c05yN0tnT2d2YUpKNW1SMXIweGY4dCthd054NG1wMWJLVmlv?=
 =?utf-8?B?RkZZRWpuekFEM253QzFUOGg1ci9DWjE4YUo0cGZ4Y0FKY2VvbGFib3VPbjZk?=
 =?utf-8?B?ZnNUMnNGSVI1ck5tT3hYZGt6V2pZczh6QnRFU0RHVWMxY0NqVko3b3c3bnBD?=
 =?utf-8?B?MzhabXlJUDdZT3JlSDNSTTBmamZ6SllBRVVWLzRQS0RieVlwaG9PcUFWbjZH?=
 =?utf-8?B?dkpXeW8yVXE5clNDWXlYUEpuRFJLZW02YWJyb2VuRXhXS2VBZ2NnY3NNQWRQ?=
 =?utf-8?B?dlRPTkVCY0JDbU4wZGhDMW94dmpBUE1oVGwraVdBREFpZk9oM3BMSTVPb01S?=
 =?utf-8?B?ZUVEcXBaem1NT2xXLzZqcWh6SkZJdnFSNmR3cytpd0sxUFMzVG0xaWlJOU50?=
 =?utf-8?B?OVJCS1FxeVpjaEJ3ZndlUUlJV0RLTXYvRFdWWUpKSThhRmVUSHQxSHh2a2kv?=
 =?utf-8?B?VGZnUG5kdHRrbjRhUnlrNEYwVHZRZGN6L1RXMTMxMENEL2ZndC8yWDBmV1ND?=
 =?utf-8?B?U3Bia2NZUmJReFJtYktNWGF0TEJ0UWowRnc1a3pVMGhySkZiZzhvbFVmM2pm?=
 =?utf-8?B?bENoM1JObWpDUVh5a245WmMwaWtRWWlvanRHd0I3RmtLRWE1QVFZQ3hoRVhM?=
 =?utf-8?B?cEZKZTdKRklsL2RBUlY0ZXNGcWRGYldvY1pPQVBIekM0eHZVakNnaW5HME5m?=
 =?utf-8?B?SlUyWDN3UnVlSG5nY2IvMUhBY0N3ODlkLzZuZ3ZkTGdTS0lFb1I4OGhtTHBv?=
 =?utf-8?B?NVNpdzJqeDR4akxaQnYxODdUU21KblNTRmU1WC9oSHpjMVJDVzBaNURGc0tq?=
 =?utf-8?B?VFB5TG9oRU54SlJ6Tk5jdHlXU0lhYXRjSTZlQ2J6R2V5ZVpSejFpM3o2ZUpD?=
 =?utf-8?B?ODhqZUZmVmdLZ2k3L2p4K1ZYSEQ1TWsxTkc1WlZDME5uWGY1SjZ6azZ6ZGE1?=
 =?utf-8?B?SEF6QWVFWlo0WUprbzRLZ1YxL1RJaWZIa1g1a1hxSVJyQk5qdzgwdm8vOVIx?=
 =?utf-8?B?U1FtbzVsNTNwMXlxYVpLZ3ZGZlpqK0xMWDVwWFFRMlRjL2M3cVY0MmRXVDlW?=
 =?utf-8?B?TVYzeElWeFdNaHZLODhFUnU3ckduSUhUNmJTeUxIWWVNUHJ6anBmTVh2WEUv?=
 =?utf-8?B?d3NSazRQZ0J1TmtkT1NNTTdaSVpnVGlCTUpJM2FIUUxzcFV0WUh6UVFWZzQ5?=
 =?utf-8?B?ZmgwZEtvT1p4eHVMMkgvMjlrYmorb2VYMHorR3owdGVoTzZzUHkwZUN5S1ow?=
 =?utf-8?B?aVhsS2lJaVBIRkJlYW1pbExsUTNNeXFLYlp6U2JBcXo0aHFXWFVJZ1pDTEtF?=
 =?utf-8?Q?spr36rGBW74zZfOVW4jyMsiJt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a153a295-c207-4a1d-8d5b-08dcf9549f55
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 02:35:02.8649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vofOMNTBnAl6+1+Izcp+LF6dZpzRh9NUZ2I6+CUdZ9nkTkJ1UHnukvshz6ccfSQMNGo04/9iv8GHYB7SrAgfOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10961
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

Hi Maxime,

On 10/22/2024, Maxime Ripard wrote:
> On Tue, Oct 22, 2024 at 02:13:57PM +0800, Liu Ying wrote:
>> On 10/13/2024, Marek Vasut wrote:
>>> On 10/11/24 8:18 AM, Liu Ying wrote:
>>>> On 10/11/2024, Marek Vasut wrote:
>>>>> On 10/10/24 7:22 AM, Liu Ying wrote:
>>>>>> On 10/09/2024, Marek Vasut wrote:
>>>>>>> The media_ldb_root_clk supply LDB serializer. These clock are usually
>>>>>>> shared with the LCDIFv3 pixel clock and supplied by the Video PLL on
>>>>>>> i.MX8MP, but the LDB clock run at either x7 or x14 rate of the LCDIFv3
>>>>>>> pixel clock. Allow the LDB to reconfigure Video PLL as needed, as that
>>>>>>> results in accurate serializer clock.
>>>>>>>
>>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>>> ---
>>>>>>> Cc: Abel Vesa <abelvesa@kernel.org>
>>>>>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>>> Cc: Fabio Estevam <festevam@gmail.com>
>>>>>>> Cc: Isaac Scott <isaac.scott@ideasonboard.com>
>>>>>>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>>>>>>> Cc: Jonas Karlman <jonas@kwiboo.se>
>>>>>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>>>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>> Cc: Peng Fan <peng.fan@nxp.com>
>>>>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>>>>> Cc: Robert Foss <rfoss@kernel.org>
>>>>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>>>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>>>> Cc: Stephen Boyd <sboyd@kernel.org>
>>>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>>>> Cc: imx@lists.linux.dev
>>>>>>> Cc: kernel@dh-electronics.com
>>>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>>>> Cc: linux-clk@vger.kernel.org
>>>>>>> ---
>>>>>>>    drivers/clk/imx/clk-imx8mp.c | 2 +-
>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
>>>>>>> index 516dbd170c8a3..2e61d340b8ab7 100644
>>>>>>> --- a/drivers/clk/imx/clk-imx8mp.c
>>>>>>> +++ b/drivers/clk/imx/clk-imx8mp.c
>>>>>>> @@ -611,7 +611,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>>>>>>>        hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
>>>>>>>        hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
>>>>>>>        hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
>>>>>>> -    hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
>>>>>>> +    hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
>>>>>>
>>>>>> This patch would cause the below in-flight LDB bridge driver
>>>>>> patch[1] fail to do display mode validation upon display modes
>>>>>> read from LVDS to HDMI converter IT6263's DDC I2C bus.
>>>>>
>>>>> Why ?
>>>>
>>>> Mode validation is affected only for dual LVDS link mode.
>>>> For single LVDS link mode, this patch does open more display
>>>> modes read from the DDC I2C bus.  The reason behind is that
>>>> LVDS serial clock rate/pixel clock rate = 3.5 for dual LVDS
>>>> link mode, while it's 7 for single LVDS link mode.
>>>>
>>>> In my system, "video_pll1" clock rate is assigned to 1.0395GHz
>>>> in imx8mp.dtsi.  For 1920x1080-60.00Hz with 148.5MHz pixel
>>>> clock rate, "media_ldb" clock rate is 519.75MHz and
>>>> "media_disp2_pix" clock rate is 148.5MHz, which is fine for
>>>> dual LVDS link mode(x3.5).  For newly opened up 1920x1080-59.94Hz
>>>> with 148.352MHz pixel clock rate, "video_pll1" clock rate will
>>>> be changed to 519.232MHz, "media_ldb" clock rate is 519.232MHz
>>>> and "media_disp2_pix" clock rate is wrongly set to 519.232MHz
>>>> too because "media_disp2_pix" clock cannot handle the 3.5
>>>> division ratio from "video_pll1_out" clock running at
>>>> 519.232MHz.  See the below clk_summary.
>>>
>>> Shouldn't this patch help exactly with that ?
>>
>> No, it doesn't help but only makes clk_round_rate() called in
>> LDB driver's .mode_valid() against 148.352MHz return 148.352MHz
>> which allows the unexpected 1920x1080-59.94Hz display mode.
>>
>>>
>>> It should allow you to set video_pll1_out to whatever is necessary by LDB first, fixate that frequency, and the LCDIFv3 would then be forced to use /7 divider from faster Video PLL1 , right ?
>>
>> Yes, it allows that for single-link LVDS use cases.
>> And, __no__, for dual-link LVDS use cases because the
>> video_pll1_out clock rate needs to be 2x the LVDS serial clock
>> rate. 
>>
>>>
>>>>      video_pll1_ref_sel               1       1        0        24000000    0          0     50000      Y      deviceless                      no_connection_id
>>>>         video_pll1                    1       1        0        519232000   0          0     50000      Y         deviceless                      no_connection_id
>>>>            video_pll1_bypass          1       1        0        519232000   0          0     50000      Y            deviceless                      no_connection_id
>>>>               video_pll1_out          2       2        0        519232000   0          0     50000      Y               deviceless                      no_connection_id
>>>>                  media_ldb            1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id
>>>>                     media_ldb_root_clk 1       1        0        519232000   0          0     50000      Y                     32ec0000.blk-ctrl:bridge@5c     ldb
>>>>                                                                                                                               deviceless                      no_connection_id
>>>>                  media_disp1_pix      0       0        0        129808000   0          0     50000      N                  deviceless                      no_connection_id
>>>>                     media_disp1_pix_root_clk 0       0        0        129808000   0          0     50000      N                     32e80000.display-controller     pix
>>>>                                                                                                                               32ec0000.blk-ctrl               disp1
>>>>                                                                                                                               deviceless                      no_connection_id
>>>>                  media_disp2_pix      1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id
>>>>                     media_disp2_pix_root_clk 1       1        0        519232000   0          0     50000      Y                     32e90000.display-controller     pix
>>>>                                                                                                                               32ec0000.blk-ctrl               disp2
>>>>                                                                                                                               deviceless                      no_connection_id
>>>>
>>>> Single LVDS link mode is not affected because "media_disp2_pix"
>>>> clock can handle the 7 division ratio.
>>>>
>>>> To support the dual LVDS link mode, "video_pll1" clock rate needs
>>>> to be x2 "media_ldb" clock rate so that "media_disp2_pix" clock
>>>> can use 7 division ratio to achieve the /3.5 clock rate comparing
>>>> to "media_ldb" clock rate.  However, "video_pll1" is not seen by
>>>> LDB driver thus not directly controlled by it.  This is another
>>>> reason why assigning a reasonable "video_pll1" clock rate in DT
>>>> makes sense.
>>>
>>> I agree that _right_now_, the DT clock assignment is the only option.
>>> I would like to see that DT part disappear and instead would prefer if the LDB/LCDIF could figure out the clock tree configuration themselves.
>>
>> I think we'll live with the assigned clock rate in DT, because the
>> i.MX8MP LDB and Samsung MIPI DSI display pipelines need to share a
>> video PLL, like I mentioned in comments for patch 2.
> 
> Guys. There's 4 different discussions that look to be on the same topic,
> and doing workarounds in the DT, DRM driver and clock driver for
> something that looks like a broken clock.

This is a bit complicated, because it is related to i.MX8MP MIPI DSI/
LVDS/HDMI, i.MX93 MIPI DSI/LVDS/parallel display pipelines.  Even
i.MX6SX LVDS display pipeline is a bit related, since i.MX8MP/i.MX93/
i.MX6SX LDBs share the same fsl-ldb.c driver.

> 
> Could we have *somewhere* a proper description of what the problem is
> exactly, so we can review it? Because at the moment, it's certainly not
> helping.

Can you please suggest a place where this could happen?

> 
> Maxime

-- 
Regards,
Liu Ying

