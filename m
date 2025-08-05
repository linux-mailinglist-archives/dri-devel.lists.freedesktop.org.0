Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB989B1AC5C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 04:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A441510E163;
	Tue,  5 Aug 2025 02:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lTmXSRh1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863D510E163
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 02:20:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIQN3HFvgzdyQpM6AT78zeXa1VDLPY1s3L9/kPnb+kkcXyJEBa/j+rKsudmDOetvdPEfyW2ujXn8ZgzvKntNdwXpjjlS9CAFISuRBsuIAj2awtbm1ZdK1eCGcA7IR4I3S2icawSakys0csa1NeWfsAe7aXKfuDE+N/TPe6i20cAQLsLfk3YMojew9BDM2YU/+oV8TRGj7wViKdyD+zUV+PQYA/zUKABzJZkx5F9FktqwWGy72zCJZaDf1+YLGKfAmIWMKG/DWYi7pj7xwj7iJVLA06BQcmqsIWGUhb0fCikc0gstpG8JtMbvnkV+YsFqVCsL9xD9SHacq6GWyb30GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rAODvu068++N8pZ6ADgjTvJ7tpqP18Ln5Ab9ysODt8=;
 b=pwaEhUHPMtw3qjeIm8pPnAU/4S9nd4jhOdmQkvvMZvHWS5ymLfFrstn7LojXVXpPz1Khocl4cE+i0RCzDIaKTdtTQIbg+fB7sRJJ9Q5r0jN2YuuVnLxvav/HCYVwojSkWFrTh9PwGQurGm0zn9G6psytpjVcbfQ/mobJmQlPneqBkbcoB24Hr+zn5GRrA31BnrcP3Tn1uncYTvf5W3FJbNSl95ZrCNavw9BC2XWvdulHvjBBrVJBGJRubWIAsrdeZDj42g6Z37JOyajGlEIInusyzfeYErVlqiEXDIQxOuIu8gH2fi3RK9zlz2ub9fB11sfGE4ip/19MT4bVjjg5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rAODvu068++N8pZ6ADgjTvJ7tpqP18Ln5Ab9ysODt8=;
 b=lTmXSRh1sgtfFaPO02OoB0KYJ2sO1nvXcaJ6fmpaMGSgelkNohUuhxT+1G4i7/JIUTWOVR7E8jm9NhUN9UNp/de4ythu8ze7fi+tTTj0ItjrIWBU9Kb/rWjXc8ArmebcIxHqPnE5K5XfOft9LO9PbW7tj796Yb4cKbZVVQS8kTDgLGDB5F3mQDAQa8TjnBLjzAZxnc+TNlm5Pn7RNh5H+n7C7NVtIdiNT9Oe8dh7/93GwakDZtvpe6SW69NZfb+xt1PW1XzyCg9hXRFvQN7R0u+VJf1iQ9DDgXkwPcB3CL5rZNATVwHFP/BK6I9Ek/okbe6idSBgb7KUkKu5c7INag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM7PR04MB7032.eurprd04.prod.outlook.com (2603:10a6:20b:112::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 02:20:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 02:20:55 +0000
Message-ID: <9aca40c3-e22a-4d41-bac8-18a7cc8e3e96@nxp.com>
Date: Tue, 5 Aug 2025 10:22:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm: bridge: Add waveshare DSI2DPI unit driver
To: Joseph Guo <qijian.guo@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250804-waveshare-v2-0-0a1b3ce92a95@nxp.com>
 <20250804-waveshare-v2-3-0a1b3ce92a95@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250804-waveshare-v2-3-0a1b3ce92a95@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM7PR04MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: abbe3bc9-6e38-4614-c50c-08ddd3c6b56c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NENkd1IxNEFMVER6UHN1NVN1VG1PZ2R5bXRNWGIyYWErYWpCTzRnbDBDczNO?=
 =?utf-8?B?R3hvUmNMSlpPM2w4UGdBT0Zib0VtZ1pNY0hHY1NJQ04zcGxPVUVBdFdwVnAv?=
 =?utf-8?B?ZzVMejFXZkRxcFBMR2tLTVNjVkh3QjRmZ09oUTR1ak9Bb3dZRE9sTVA5OFl2?=
 =?utf-8?B?RHRhMGNUcTg0S1QvbWh2MFJDeTcxN3k5OEZJV2ZyYUNuR0ZvK0o2WDRlUWp6?=
 =?utf-8?B?Z3MvUFc1ZnF4cENCY080SHRocHduOURpRnJ0WkQ1NUZRQTBPV2RiK1k4QjZq?=
 =?utf-8?B?RFJDK214NjVSTnIzZE9kOTRPblhvZGo1b25DTmV2Yk9VYVUyZk92MEN6dGNN?=
 =?utf-8?B?SEtldlBRbGgwYWNTb05XVmN3T0VDTDRBZ3AybjF5SlVhWmc2Y3V3TXVkTXRO?=
 =?utf-8?B?eXBhQktMdnJmY0xLNFJzL0ZhcUVUb0VHZitqM1I2ZDZkY05LTFRsbXhLZ01H?=
 =?utf-8?B?M1ZXV3F3ekNVazZ1dnh3dHdMSFhhVUlib3FjRG1iSG55UzRkcmswTjZOL3NX?=
 =?utf-8?B?YTFqR2l2SUhCczFzK0xzais2TjBEdzJ1bStCRU5Rc1F5SVRrMVJlMHB1Q3FU?=
 =?utf-8?B?T1NFQjhzSGJVclo1dkxqU1BmYitrNHFITllVbGxJZ3lOamN2MWkySWk4eTMv?=
 =?utf-8?B?L1UwWjNLQ081NEg5K0xnTU10MnVldjFKWGxHVlFpY05qZ2p3cUdkSi94dnJM?=
 =?utf-8?B?VG5KZzdQbFl2cG9nZTVxRjNOQnlBdUkybzlBaFh1UW5vQXdrdXhZdElKajVH?=
 =?utf-8?B?M3VnVFVFbmpVaFNIQ25QTDVCZEdxaVVCbmxjbTUyRTZ6dG51MjlBTzJQcktu?=
 =?utf-8?B?UjVWZEMzSWk0dDVQQ2JzUzZXNHRkS2xlamJpa0FVS1NFZFlMMklGM0d4WHhq?=
 =?utf-8?B?S3B5RjlqRVdDcXpFYytzWWd2Y0tEWElId0xnSERtbGxrVlhMY0FkNVk1M0V3?=
 =?utf-8?B?bW9kenNLUGI1YzhYaFJVWFRlcnZBMSsrUTJac2V5WFJkbkpVZlQ4elVvNXEy?=
 =?utf-8?B?NWFUTTlnRzRQMVl0M0EyN3ZnaHFoQUExSStrc1NCMDJlSjhSL3RoWVI5OHBQ?=
 =?utf-8?B?ODVGa28vV25FTGhaUy8rMERPUkFkRkxxd1RJa2VyVTJoLzkzdTRPd2VoOFpk?=
 =?utf-8?B?clBBS3ZiMVRJYk5BVTRKT2xNWUJUcnhrZUcvYjJhM1QwMW1VWFBsT29LbFhW?=
 =?utf-8?B?V0kzMk9xK0p6emZtc2o3dzM2cyt5bjc4M0d5bDhWeWEyN2ttajFZd3REWFZZ?=
 =?utf-8?B?ZmN2ZEVycFgzTXRFSHRHdkxlRzBOa0s5ZWFlL21uWnJHVHh1NU1LaC95UXhG?=
 =?utf-8?B?RlVQTUNvS3RmaWlZTmtnOVhxNTJjMENqZTRiOUFCeVhOMThWaHFhK09hSDli?=
 =?utf-8?B?bnZZY2NlNmxWbVpONEV4LzVFVkhPRFI4TGdscUhRK2tvVDJITmZGZllRUHNJ?=
 =?utf-8?B?cmtUdFhoOW5ZWlF2TlFuZXB6ZE9zR0NRTHJxTzd6aFhEcHlOTHFzbVozbFJx?=
 =?utf-8?B?Z2s3M1RxSmlGOHRoZUx2bUJieXFvd3E4Z0xTNExSKzlaM3pKaS9vdlk1UmtE?=
 =?utf-8?B?cGtoTWxBWFBHQmxpTUtMaE1zbSs3ZjVoVW9mSEV3WnJyL0c4aGZxYUgxcGVx?=
 =?utf-8?B?UDFFbWJCSlB2MFovUi85b3IvcXBqbkJZOUs2cGh4UnVOMU93cCtxTjVtQlBR?=
 =?utf-8?B?Y0M4dHA4b25wTExNbjlUYXhwK21HQU9paFFRVGxQUkF0ZTBZeEY4andSZFhh?=
 =?utf-8?B?MW5hNVFlYUp6eEI4UThhVExTWmU2VnAydDBPcHhwZVZlRlJPUjc0UG85amNk?=
 =?utf-8?B?Q2JWbEdQSmVyZGl2eUxpbUVQY0tTeVdSRlJjWThrVmxhcFBYY2hCbDZ2MTlL?=
 =?utf-8?B?S3dEQ0lPSW9Sa3JnQXVxakRvYzJPazFFazl0TU00bFFhWVBiQ2cvZlZjU1hv?=
 =?utf-8?B?RklFQ1V3MzBWemgzRHdneSt3emtTeC9zR3k4NzMyQ01LeHVrbFJ3VlBrVkVK?=
 =?utf-8?B?UnhRbTMybDNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGVnL0R2aWFGMWphSEZ4U1VUV2hKbThvWUp1Ym1JZy9GK0Y3Uk1OaUVBNUdw?=
 =?utf-8?B?Z09uR1h1TkRXQUlXUnBNeTRDeGM3NTk2elJFRDVTTnU0OXk0YTVjbjZWQkJW?=
 =?utf-8?B?WElOdU5SbWZSaFFHNUtuNEtKZ3N3NDZneWI0U09ubTgxc0t0NHpybk40azlo?=
 =?utf-8?B?SFh5NzFlWW5RK1dwY0tpVjdCcUJNL1ZjeHdKVUxnMzBlTi9VL1VUMFBYa2Nx?=
 =?utf-8?B?c2YrMDB3aWh4VndJQ0crU0xpNGRRaEN6cWhibTRSTVBtTlkzV2Y5bVQwQVM3?=
 =?utf-8?B?RXFQd09FdG1CQ3pOdnR4Rk02Ym92RnFJMDQrZXlKQkxDcjJPYlVtRlVoeDdR?=
 =?utf-8?B?WmhKWnFtVDF5bGx2NkZpeUMyWjJzemFRVG5VNDVTSGlxZHMzR0VESThJcEox?=
 =?utf-8?B?elQ0UEhXeWQwa2d1WitkMzMyRDB6UWhxOWZ6dTcya2dybjA4cnBoQnN6OTcx?=
 =?utf-8?B?WmlKNXY2anNWOXhvUG1QeVJJMVVDOExaSndsZVhaMkxmNXBlNHo0YzhaSkxN?=
 =?utf-8?B?VHZIemZrdXAxekhVS0hKU0ZyVmpWU3NlOXBDUnlMYldLelliSy9leXRIVHp4?=
 =?utf-8?B?Y2dUTmo0QWRPQkQxYWtzMWJhQWx6Sys5NXRNRlB1RTNiOG5zVklMZDV2aHZ2?=
 =?utf-8?B?VDJIb0FyWW9VZ1NsT3pUY1ltUENlMlJyQVREUjdNNEdVMVlUOVhaTzcxTTk1?=
 =?utf-8?B?SmpBdkhkZzV2cXNvN0xhOTFlQys3dlpTZzJRam1SR3dMaW4xK2gxdmZtdU53?=
 =?utf-8?B?TkJRK05vNjRDblYreDNQd3piRmZmTW5MMDdydi9xVXM3ckEwalRCN1NKbU9u?=
 =?utf-8?B?ZEo1OVp6WXYwZWcrMldwZk5GbHNwS09xQjdveTdlU2NSV1FPL2FiVGx2TmlM?=
 =?utf-8?B?OEtIQnYzYkZVbUhoc3picVNZZU9TQ0Uza0lLMldidmFoRHJPRDZ2Z2hXZ3JF?=
 =?utf-8?B?a2o3bitvZy9aUFM4cjlWZUNmdmdvd1RTYms2d1ltd2pqWjRNeVU2bzliWDVq?=
 =?utf-8?B?WjgxdnhrT0luZFdLQjFjeVo4YTVlR2tQKzZwNEt6RWI5SG9Mc3VjRWt6cldx?=
 =?utf-8?B?cllaODBCSWRxMDBadzdwMWQyWHVuRE9lZW8ybkdHN0JtQXRtQUFnRURrUXJq?=
 =?utf-8?B?MjBQRDl2SW5NMFZxNEJ0aWF4dFM3cXk2b3hBbnNna1hvbFZYVXNUUVRINE43?=
 =?utf-8?B?d3BneGtEOWFlSXYyV1ZMTHMxcFo1L1BQNy9kTjAxT3diYjd2VnRIdmlRZTRw?=
 =?utf-8?B?Z3cvT3NuZnRpaUkzVXF4bytuT25Eang0M1BNaGNsaTdybW1HOTNPUk5EaytF?=
 =?utf-8?B?K1JpZDdzbksvQXozVVN4dTduaXdKalpZcWpXR0ZHNTFvRDlBcjVmTHk1QjE1?=
 =?utf-8?B?OWhzZUptclFuZDB6NHp1VnhtVmFIT0RTa2lkZDI4UTlPSDVZK1FjdEY3YjJy?=
 =?utf-8?B?S1VGc2tjMW9MRlZYM2xsTEtVRTdxYTlaRlVwMU9CR3hjTHZsQTlDb042a1NQ?=
 =?utf-8?B?Y1NhT2tzaDFJS2pRcmhKNkhDOXJtckV5ZUxESmJ5UUFJYTNiUkE2NUk0SWRh?=
 =?utf-8?B?d1NpenBTa2RYVEs0TlBxT3g2aFcwblEzcENmY2NVbkhjYms1aVBuU24wRm9M?=
 =?utf-8?B?NDhBTExxMmZWTjJneWxDMk9xdE82QStPYndnTm5Ob0phRXpqanQxdkZkTlZR?=
 =?utf-8?B?RGI1NUUxTFVlbUNMZ1dNQS90ckdLTERhZ085eWN3U0tkSU9tR0FzYlUvdFdl?=
 =?utf-8?B?T2NQY3hTek9QaEpFOWVtejlpc29WNnQzdnRvZ1VEZ25CMXE5aE9IOXFGTTJo?=
 =?utf-8?B?b05tU3dQZ2VsM3J6TGh1Q25ONlBTdnVLVFh1eUNrZUt6czhqUHg5czEyZ3VT?=
 =?utf-8?B?MXJrdFJDdkdhSHIxZjRreWF3UDRaYWdTOVdUdnB6OFEvTGhqaVE5T2J2MmJt?=
 =?utf-8?B?dnh1WWV0cmdlMSt5dkRCNy9KSlEycElhMENHUVlGMktWbE5EbXF3RTFQUjBv?=
 =?utf-8?B?b2F6RENCVzNSZUNxY2J4NDZvbTF4MlZuS1liOXg4NFVsRzUzRHAzc2tsemJm?=
 =?utf-8?B?bklkdm95Z3l5MlhLcEY2Wmg4cndWVENFdEZnSndyc0QwakRFQXVpbTFKTFNY?=
 =?utf-8?Q?MM/zuiXYC3n2UhvptvPbfgZNf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abbe3bc9-6e38-4614-c50c-08ddd3c6b56c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 02:20:55.8523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8M3q6LyOiJHrTCn+30o4xqxtMOLWgsnOjKU+7YD4mjem4b0hwv3lUc3wP/hPHi9c5CiJ0tlTV/d619WsccAZDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7032
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

Hi Joseph,

On 08/04/2025, Joseph Guo wrote:
> Waveshare touchscreen consists of a DPI panel and a driver board.
> The waveshare driver board consists of ICN6211 and a MCU to
> convert DSI to DPI and control the backlight.
> This driver treats the MCU and ICN6211 board as a whole unit.
> It can support all resolution waveshare DSI2DPI based panel,
> the timing table should come from 'panel-dpi' panel in the device tree.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>

For next version, you may add:
Suggested-by: Liu Ying <victor.liu@nxp.com>

> ---
>  drivers/gpu/drm/bridge/Kconfig         |  11 ++
>  drivers/gpu/drm/bridge/Makefile        |   1 +
>  drivers/gpu/drm/bridge/waveshare-dsi.c | 210 +++++++++++++++++++++++++++++++++
>  3 files changed, 222 insertions(+)

This patch doesn't apply to drm-misc-next cleanly.  I see conflicts in Kconfig
and Makefile.  It seems that you generate the patch series based on NXP down
stream kernel instead of the upstream kernel.

> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index cb3b797fcea1c73e83c9187fef6582296b340305..26fec25c61ed7d950c094e0224f1196946079485 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -472,4 +472,15 @@ config DRM_ITE_IT6161
>  	help
>  	  ITE IT6161 bridge chip driver.
>  
> +config DRM_WAVESHARE_BRIDGE

Sort the config names alphabetically.

> +	tristate "Waveshare DSI bridge"

depends on BACKLIGHT_CLASS_DEVICE

> +	depends on OF
> +	select DRM_PANEL_BRIDGE
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select REGMAP_I2C
> +	help
> +	  Driver for waveshare DSI to DPI bridge board.
> +	  Please say Y if you have such hardware
> +
>  endmenu
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index d1db90688a150fdc3a5fd40acebe740798c452b0..3caa4d8f71675804328aa5a51ec67b2587938621 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -48,3 +48,4 @@ obj-$(CONFIG_DRM_ITE_IT6263) += it6263.o
>  obj-$(CONFIG_DRM_ITE_IT6161) += it6161.o
>  obj-$(CONFIG_DRM_SEC_MIPI_DSIM) += sec-dsim.o
>  obj-$(CONFIG_DRM_NXP_SEIKO_43WVFIG) += nxp-seiko-43wvfig.o
> +obj-$(CONFIG_DRM_WAVESHARE_BRIDGE) += waveshare-dsi.o

Sort the config names alphabetically with the best effort.

> diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..efb3a2fc501b5725b02f49862526d1704a3a4b7b
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright 2025 NXP

Nit: Drop a space between * and C.

> + * Based on panel-raspberrypi-touchscreen by Broadcom
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +struct ws_bridge {
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct backlight_device *backlight;
> +	struct device *dev;
> +	struct regmap *reg_map;
> +};
> +
> +static const struct regmap_config ws_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +	.disable_debugfs = true,

drivers/gpu/drm/bridge/waveshare-dsi.c:34:10: error: ‘const struct regmap_config’ has no member named ‘disable_debugfs’
   34 |         .disable_debugfs = true,
      |          ^~~~~~~~~~~~~~~

> +};
> +
> +static struct ws_bridge *bridge_to_ws_bridge(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct ws_bridge, bridge);
> +}
> +
> +static int ws_bridge_attach_dsi(struct ws_bridge *ws)
> +{
> +	struct device_node *dsi_host_node;
> +	struct mipi_dsi_host *host;
> +	struct mipi_dsi_device *dsi;
> +	const struct mipi_dsi_device_info info = {
> +		.type = "ws-bridge",
> +		.channel = 0,
> +		.node = NULL,
> +	};
> +	struct device *dev = ws->dev;
> +	int ret;

Nit: Sort these variables in reverse Christmas tree fashion.

> +
> +	dsi_host_node = of_graph_get_remote_node(dev->of_node, 0, 0);
> +	if (!dsi_host_node) {
> +		dev_err(dev, "Failed to get remote port\n");
> +		return -ENODEV;
> +	}
> +
> +	host = of_find_mipi_dsi_host_by_node(dsi_host_node);
> +

Nit: Drop this blank line.

> +	of_node_put(dsi_host_node);
> +	if (!host)
> +		return dev_err_probe(dev, -EPROBE_DEFER, "Failed to find dsi_host\n");
> +
> +	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
> +

Ditto.

> +	if (IS_ERR(dsi))
> +		return dev_err_probe(dev, PTR_ERR(dsi), "Failed to create dsi device\n");
> +
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->lanes = 2;
> +
> +	ret = devm_mipi_dsi_attach(dev, dsi);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to attach dsi to host\n");
> +
> +	return 0;
> +}
> +
> +static int ws_bridge_bridge_attach(struct drm_bridge *bridge,
> +				   enum drm_bridge_attach_flags flags)

drivers/gpu/drm/bridge/waveshare-dsi.c:117:19: error: initialization of ‘int (*)(struct drm_bridge *, struct drm_encoder *, enum drm_bridge_attach_flags)’ from incompatible pointer type ‘int (*)(struct drm_bridge *, enum drm_bridge_attach_flags)’ [-Werror=incompatible-pointer-types]
  117 |         .attach = ws_bridge_bridge_attach,
      |                   ^~~~~~~~~~~~~~~~~~~~~~~

> +{
> +	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
> +	int ret;
> +
> +	ret = ws_bridge_attach_dsi(ws);
> +	if (ret)
> +		return ret;
> +
> +	return drm_bridge_attach(ws->bridge.encoder, ws->next_bridge,
> +				 &ws->bridge, flags);
> +}
> +
> +static void ws_bridge_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
> +
> +	regmap_write(ws->reg_map, 0xad, 0x01);
> +	backlight_enable(ws->backlight);
> +}
> +
> +static void ws_bridge_bridge_disable(struct drm_bridge *bridge)
> +{
> +	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
> +
> +	backlight_disable(ws->backlight);
> +	regmap_write(ws->reg_map, 0xad, 0x00);
> +}
> +
> +static const struct drm_bridge_funcs ws_bridge_bridge_funcs = {
> +	.enable = ws_bridge_bridge_enable,
> +	.disable = ws_bridge_bridge_disable,
> +	.attach = ws_bridge_bridge_attach,
> +};
> +
> +static int ws_bridge_bl_update_status(struct backlight_device *bl)
> +{
> +	struct ws_bridge *ws = bl_get_data(bl);
> +
> +	regmap_write(ws->reg_map, 0xab, 0xff - backlight_get_brightness(bl));
> +	regmap_write(ws->reg_map, 0xaa, 0x01);
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops ws_bridge_bl_ops = {
> +	.update_status = ws_bridge_bl_update_status,
> +};
> +
> +static struct backlight_device *ws_bridge_create_backlight(struct ws_bridge *ws)
> +{
> +	struct device *dev = ws->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 255,
> +		.max_brightness = 255,
> +	};

Nit: Sort these variables in reverse Christmas tree fashion.

> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, ws,
> +					      &ws_bridge_bl_ops, &props);
> +}
> +
> +static int ws_bridge_probe(struct i2c_client *i2c)
> +{
> +	struct device *dev = &i2c->dev;
> +	struct ws_bridge *ws;
> +	struct drm_panel *panel;
> +	int ret;
> +	struct backlight_device *backlight;

Ditto.

> +
> +	ws = devm_kzalloc(dev, sizeof(*ws), GFP_KERNEL);

Recently upstream bridge drivers were changed to use devm_drm_bridge_alloc()
to allocate the main structure which contains the DRM bridge member.
devm_kzalloc() is no more allowed to be used.

> +	if (!ws)
> +		return -ENOMEM;
> +
> +	ws->dev = dev;
> +
> +	ws->reg_map = devm_regmap_init_i2c(i2c, &ws_regmap_config);
> +	if (IS_ERR(ws->reg_map))
> +		return dev_err_probe(dev, PTR_ERR(ws->reg_map), "Failed to allocate regmap\n");
> +
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, &panel, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to find remote panel\n");
> +
> +	ws->next_bridge = devm_drm_panel_bridge_add(dev, panel);
> +	if (IS_ERR(ws->next_bridge))
> +		return PTR_ERR(ws->next_bridge);
> +
> +	ws->backlight = ws_bridge_create_backlight(ws);
> +	if (IS_ERR(backlight)) {
> +		ret = PTR_ERR(backlight);
> +		dev_err(dev, "Failed to create backlight: %d\n", ret);
> +		return ret;
> +	}
> +
> +	regmap_write(ws->reg_map, 0xc0, 0x01);
> +	regmap_write(ws->reg_map, 0xc2, 0x01);
> +	regmap_write(ws->reg_map, 0xac, 0x01);
> +
> +	ws->bridge.funcs = &ws_bridge_bridge_funcs;
> +	ws->bridge.type = DRM_MODE_CONNECTOR_DPI;
> +	ws->bridge.of_node = dev->of_node;
> +	devm_drm_bridge_add(dev, &ws->bridge);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ws_bridge_of_ids[] = {
> +	{.compatible = "waveshare,dsi2dpi",},
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, ws_bridge_of_ids);
> +
> +static struct i2c_driver ws_bridge_driver = {
> +	.driver = {
> +		.name = "ws_dsi2dpi",
> +		.of_match_table = ws_bridge_of_ids,
> +	},
> +	.probe = ws_bridge_probe,
> +};
> +module_i2c_driver(ws_bridge_driver);
> +
> +MODULE_AUTHOR("Joseph Guo <qijian.guo@nxp.com>");
> +MODULE_DESCRIPTION("Waveshare DSI2DPI bridge driver");
> +MODULE_LICENSE("GPL");
> 


-- 
Regards,
Liu Ying
