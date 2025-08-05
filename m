Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C95DB1AC41
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 03:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD19210E45B;
	Tue,  5 Aug 2025 01:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Dqrw0XaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013052.outbound.protection.outlook.com
 [40.107.162.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F84B10E45B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 01:53:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1cJMa0QK5HJFyMegOH7VtGjBZluQpdk3FX86lSL3WN4SEa8goRHjMXHStf8yCIThXtjDbwfRdhr+LCo+psDh8E1qbg2OHBjYQ5N3sxK2jhRAVTXkjREM9LLS10eWRdOTfNU+cn8epkLa5BgJZtmrDBSdugqznhCr0Ownl1fFxU9esJSjiG58h02IVvAzSpiECgpd68WGPrkoL+/gOMAjIQ0UqWRJXS02QRcTOaP3nZDjuu1vFoCH8Jz7+tf2uBNr0C1INQCbZ5fuk8THS2r6Gve+9iEk1gLWXjH6OmYl6wqi7mXysA7OGkJlzIeh5UhYSfmhO1QjdteYAWnTeS+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxBg+7ftxRXIE1b0iOgAJ+HgGI7bDK5VZRnUVGAqY6A=;
 b=YnZJ2qMw4uyito8f3DiAkdeZ2Px+qavBwVrvZXNRvZsE73i4ekK5nGYG1Ndgo08YIJianbzdpy0Zs8EPHtVeGwj8jRlosrAq2TDnnJXWavccQ+K4DzWy7Eji/QdVPee+iAfrrqNd6lQHrepcI+dBT7UPISJO+HJtIEuDqJCTKpeen5RpRdYlXxFIARQbHYTFRHgr27RxFEqRGKDDPLoZy+BqZuYHA8kVW4q9jA+DTYDQwSvnhkMRY3dSdsWG+h/aOy3BNQ/O9mdPPv2kzWw/gI4Yo8/B1ATcGFtzbwK2w4PwSIU3zajns/ZVjKCGAZGHwzG2Z7+5+DOjxoHpCxR7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxBg+7ftxRXIE1b0iOgAJ+HgGI7bDK5VZRnUVGAqY6A=;
 b=Dqrw0XaHbSHogHXhp5lwqjmU+0tG2LT4vjzbiCzTPClFkyAUKlpOqf6jAsP0ppKBd/yNOcNhHkiVktAse8xwvBSR/EI3lNrgKFZRiAfMkQshdCHh+c/0hmdhJgcWFe1NKynO2LXgnXpkch7KivELT/1L45ixJWw0W5Mufw6z3NyjmgsuRKfp58yXyT6UXKz8j/a+C1BPiiR1dV5pWySxd3EkYBSl2h5kwGrt1wNV4Lk0Ly0DmJrddKC57+gKuJxkHnpqYmn2cMGgxRe82IS9SFW4SlMg5g8QqTceZaJt0ns7l2HRi9zGqoQLi7nZHJDz2ZIBbgKo3hX5XYLg3lqu+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB11037.eurprd04.prod.outlook.com (2603:10a6:150:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 5 Aug
 2025 01:53:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 01:53:15 +0000
Message-ID: <abe153f8-dac9-4c92-a191-3e97b5a591e8@nxp.com>
Date: Tue, 5 Aug 2025 09:54:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Add waveshare DPI
 panel support
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
 <20250804-waveshare-v2-2-0a1b3ce92a95@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250804-waveshare-v2-2-0a1b3ce92a95@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0124.apcprd02.prod.outlook.com
 (2603:1096:4:188::9) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB11037:EE_
X-MS-Office365-Filtering-Correlation-Id: a267a40a-cd95-470f-582e-08ddd3c2d7c6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|19092799006|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlpxaWJReklhKzFBcGROL3ZXcnFDTlM2SXdwU0MvT3BBcDU4MHl3alExSTBs?=
 =?utf-8?B?K3Z5N3c0WjVOR0h2TDRyd2FIR3lHRHpJMDU2WFU1OThpUDVLWlJCSllIMlRB?=
 =?utf-8?B?SEsxVUZWTXhnV29kMncxMzM4VmlMQ2ZFNVBoS3o1d1dzb3d0YUNSaTF1NTFW?=
 =?utf-8?B?Vng5ZzhGSXdzNTZ4OW9yU3lSY2ZCU1VmMU4zODNGUURUQVgzTmZkdmJFZ3gy?=
 =?utf-8?B?SE53ZFJRNFl2UHpqTHhnSlNVKzFqeEd0UExuUVJXLzVRN29WNnVrVnJ1cERa?=
 =?utf-8?B?V3NFamxHUXpPS092MUh6V0RDTGl1ZU8yNkl6eU12dlFJVkFnQXpSVjJpSEdV?=
 =?utf-8?B?SW1VYUk4Y0xaSkxKKzdsRDJNbVFLWUx2Nk1VRW9HdFBjeWU4UmNRUGtSRlF0?=
 =?utf-8?B?Ymp5VTRCazNqaFNFYStyckxTcmdWbWk1bnFhWTIvdGJsM21tL2crOS9VNkw0?=
 =?utf-8?B?Z05jQ0VBRi9nU0Npb2x2dXRweVA0NWZYaDMxSVNIeXd5MFgzd05vdXExRmF1?=
 =?utf-8?B?aHAvRmE2N1hqRGRSbjc5RDhld042QklXMTA3Mm1vdmFrcnhoQjU2ZS9jSTF1?=
 =?utf-8?B?K2hHT21Yclo3VjBLelY3UGx1aHhjeWd5SnR2dlE0b3V2Z3RvUFR1YmlzNmNS?=
 =?utf-8?B?R2oxakxYbDRtMXlyT3N2SUlLZHFQVWdzY2NiTUliVG00ckx6TzNMQnJuTVVB?=
 =?utf-8?B?TjdQWVd1NnFsTWFlMmZJc3FXRkpEYmxRaXFnbHlOYy93OFFqaVJlN3VmM0Zv?=
 =?utf-8?B?ck5FdkdSQWQ5dFgwVWRuNXM2d1Eyc0htQ3ZHNnd4dXhDTGRna1VkejhiYWZ1?=
 =?utf-8?B?blRUWW50Z2h0Zkc4dU9yQng4RWVNNFFyRjhyMEFURzZmcEdjbWphNGZ4WExa?=
 =?utf-8?B?RGsydVR6Q1NuVURtRXQzbmtGRmMrRm9RUk5JbS9RSmdWUlEyUWZlem9WTkFF?=
 =?utf-8?B?ZUNnRU1oMFdxTG1VcUcwT2NVQVo4UlpmWHRYNHhLZnNQblBlZkkwcUlJbW1D?=
 =?utf-8?B?SGthL2JnYlV0THlYWVUwL0hpS0JwMTIzbUxINHYyRGNlTGljbFY3ZVI5Q2hQ?=
 =?utf-8?B?MGVUY2FJb2poRFk2R1RJdmRTa1JnRWw3VTQrZ2VoMlNXdnFnUkozbk8zem5M?=
 =?utf-8?B?V3NvTTZFWStsck11WlR2QzJmbGVZRXgxT0syU0xzSGJSTHZDY1VhTXlKUnJm?=
 =?utf-8?B?Y2p6cnlNa2pzWnRqY3VNMzZkQ2dqZ3ZUUFR3TStUb0k2amJYM2EzVnBCdUUz?=
 =?utf-8?B?ak5teEZ4TVpubnJjbVdJUmhrc2NvaHRVV1pjTk83QVpPRUptbkh0OUx3SS93?=
 =?utf-8?B?UThjN0wwN1hqcmRneFo4bW5JdkZ3VFNtYUp1Q1VROHI5bDc1bTRFNUNqU08z?=
 =?utf-8?B?L0ZYb1E4ZEZsaTlmN3JyWHZkZ1RJVXU2eFJZREoyZWJDS1F0VllJRHg3WFpN?=
 =?utf-8?B?cHgzVFpJUlVzM2hjNzRnaWlUZkJqZUxXQ2h2MUhiWVNqNHI1RDR1cW1iODRa?=
 =?utf-8?B?NjM0U3I2VGRhY2IzdUJtK0Z0eTY3d3RkQzNRSENTcUhkOXdnRU91VWVxaHBH?=
 =?utf-8?B?ZjE4ODhISjF1bFZXOXNEQnY3Zm14S2tCMnltNkpqbmNleUtKbUIyTUpSWmpH?=
 =?utf-8?B?S3Z3V1BEeU0zem82UDg1MkJMcEdPT3VDU0drTjRvbngrRmlLT2RiTDE1RE5v?=
 =?utf-8?B?aXlIREhqcWlzcUN3WXFsTy9DdnFIbXpHZTF4N01kMlhGNE9LeVZmeGxvbTZ4?=
 =?utf-8?B?bDc1MHoyWG1kK1V2RytNekVkREdHVXY1ekhJaFl5SXJyRTBSVXJEVTRlU0Nn?=
 =?utf-8?B?NDhTOUdxbEt1dWpVem90OFdJb1l1VFRFSnI2L2hHektLbEhBbU9pYk8xY0lX?=
 =?utf-8?B?aUFTSGR1NDl5bjJkVW00aXR3dDMrNjZBdlA0UkN5Rjl2YTREcVUwUVBuVDJW?=
 =?utf-8?B?WFF0VlduSW9DaGZFRElyY0tZa2FlOEtkKzJva3IvYzBaazFvdTkxcEM5Tng2?=
 =?utf-8?B?T1FaS1NyU01BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(19092799006)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnIycU9KV05WU1h5NTFqa1B2Y3hBYUdQdmhhR3hFMThML05tNm92VStOcEND?=
 =?utf-8?B?RDJVem82TUhwdzVZamZrQ2MySmd3dXhKTVdVYkc2YTBJY3NmK0d3eEppVllz?=
 =?utf-8?B?RGErQ3o2cGo1RXBDaEphV2ZVVHo1Mmp1aDJWSEMydHJ3M01jK0c4U2dkRFVi?=
 =?utf-8?B?aGV5SG9kKzgwdG9FOGhXZWxSWGlpTU5VbEsybFowdDdtMytRTGRucE1GanIr?=
 =?utf-8?B?L1cwaTQzTDFEU2lxczFQZDdjVkt0RVZia0pSOHQwRVAyK3poK2RNLzBzUmJr?=
 =?utf-8?B?b3M1aU9vNW9RczRQcHAzWVd0N3dXbEx2U0JzQ3IwaEF6OTNsMnBGRUp3SFpp?=
 =?utf-8?B?OEd6dE93anM4M0JhZmVvOVdnS2Jaa0VjbUF5czV3eitNbGFOWWkraC9jZDRD?=
 =?utf-8?B?R1NZR2R2SHRIeWMyZWhJYWJyZmsrR2dFYnRKYU1xQVhnb1haYkdVaFdTOTc5?=
 =?utf-8?B?dHlIai9mcGFxS1VxZkloVTJhUXNIcDRZVVlPcVVqNUh2NVhaT1JBMisxcExm?=
 =?utf-8?B?NDdrRnV3OXl1ZDU5MDRrYkRNWFFJZjJYaFg5NDJxT1ZXMEF5VmpCTWlwcGxN?=
 =?utf-8?B?L0JWdGJDZFRWS1RzT2t0ZDlFd1h2cU15ZnFYWGx3cVVxMEVhczVtSnhUMW1S?=
 =?utf-8?B?bE9IbkNrbjliYjgzdU9RZzMyU1BUSmgrK1F5dXVZaTQrVTFicU5zdUNnZmVH?=
 =?utf-8?B?T1k4WHBRMXB5aW9pRmp5RU50QU1kZHQ0UDdyc0FOM3ZKSTJYUjBZcHZLekJ2?=
 =?utf-8?B?RzRlQVBiL2svblVWRnI3WVZ0Tzd1ZUdwRVZ5Tm5LNDNad1RtVGhCWmpvVHd0?=
 =?utf-8?B?cGtXL0RBNFB2c2FQbmlOWlJjZCtoRTE5S2R3QUx5L0VuajFFK2JmVjJqTUVC?=
 =?utf-8?B?TS9UR0N6L0lhazU1M1RmQllCLzhGSTZoMzFHTDdmeWF6RmZNcEcyS0lCSjhX?=
 =?utf-8?B?b0VRMmt4SDk0bFVBMEVlOUxDUUxDaXdyVFBLTEF3NVpzUnRiMGIxOEJiTCtD?=
 =?utf-8?B?b3RLcEN4aE5uWGVHWDlWdkVHODFZUk5NbWwybTdMaVMxTktrZUlzZXAxK3RC?=
 =?utf-8?B?UVhsSmlFejZmV2Rsd2xxOG9EZlpYbHh3RmVHNkVXSm5oYW14VHhTbVBDQjFh?=
 =?utf-8?B?ZlkxN2Rod2RXOFkxSkQrVk5Jd21NdXlNZXV6Mmw0VkQrcFVFNUJXd0hLZnBa?=
 =?utf-8?B?ZXJmUE90OUVqL05scmVLcisxWndPN0UySjNXanRDNCtUaEQ2c2RoNWRocUs5?=
 =?utf-8?B?dDYvdVIrTm5ERkV6TWJzZTdUa21QZyszRWNCN2FGR0M4alFKTnZKdlRKMjFp?=
 =?utf-8?B?aEFKaWhuYi9tZTUzaXBPNDJJU1FuMjFwWEtFSmRUUVd6Slp2dkd6M0hqUzJs?=
 =?utf-8?B?V2RRUjNBREU1dFhnakhFKzBybldyRlFYWEQ5eVFBYnE4NEhqYy9hUCtzZXE1?=
 =?utf-8?B?OWErajFBaUNRMndZbFI0L0ZBeG5KUFFZSHdnWWcvTWJ5T0t4bjRPQktESlhm?=
 =?utf-8?B?SWhIVGx5Mm5WNGdtWVZpbUtVSGFZVnozZTFhOHVGK1h5SFlqODN5aER0ZStE?=
 =?utf-8?B?YnRnNEVUL2ZydnRUREpYNWJzY3V5cTZiNVQwQ1hOWm1lRk53K2JYZmVxWEx3?=
 =?utf-8?B?UlFwam1rVlNxY211NVQrWjNoSXpwdkxSY1dTWXMxVVd4eG5BSFdoYmpudFdO?=
 =?utf-8?B?TWxEWTNUeVZNa3NVNjJzb24vNFNsUFlheFdZSzc1YlVhSXRaampNVUpFL25x?=
 =?utf-8?B?Y2NZSGhzZUhXa2ZQMWFBanpnT2dacHZNQkhiREFVUXMwSnQwWlhkeFZCVWNx?=
 =?utf-8?B?dlVVTm5uUm9sMjFOZEs5MW1PUGxqTFNIVmxrU2hTOE9uTVcwR053RTlGZ2Uz?=
 =?utf-8?B?NG5lYWdmWlM1M2hWUEdUTTd0NWRpWHhFa003NzVRZ2QzYlpSTXJYdGljWlpK?=
 =?utf-8?B?Si95c3kxR01uYXdUREVPZWV2NlN4S2VURHF3N0FFdUxFdWg5ditLeGN2K1I3?=
 =?utf-8?B?RjFzbk43VE9KSG5XNFZwaVkwQ1FLaUdnS2lUMmRkRjVoSTZqQXRmUE50K1oz?=
 =?utf-8?B?QmYvUUYwZU10b0dXMXdTOUV3K0pqMG9zcDJyMjZVZGxWOVdaS2ZMYWZZNDNt?=
 =?utf-8?Q?yahnc4Nvq2uhEJc2h9OlnnpUU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a267a40a-cd95-470f-582e-08ddd3c2d7c6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 01:53:15.5257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8H7BZ8QVBeZGDH/IdVjttf53Ew+QoS9r5HCXRomKf0YvY8+qlzs/e4B5oWZDlr1BeXnUSWm13z15R7cdeDHbfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11037
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

On 08/04/2025, Joseph Guo wrote:
> Add dt-binding documentation for waveshare DPI panel
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Suggested-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Liu Ying <victor.liu@nxp.com>
