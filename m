Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F989A24B59
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 19:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6215810E306;
	Sat,  1 Feb 2025 18:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="aPtigUK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8692010E1F6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 16:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmzIR3HhTHVdGHx/StHHoabfXGbPDx2CS3WI939o+I5dfzofNo1JqTUjuLSgl0bqfXzKyaJo+IuuBe7OrDm3MIUERqqyM5TPXo3Sd+nFYJJzzE0To571UqmgQIvWXL4FHLvW4SBMwvnjfuq2gu39h0UJ5bHSkRIWl9tIw4fbhpb2K4hI0HbyAcOMuxDRFqDfiCccn2S+voBy9VQuXunQX8hIdSwgW+1lxMesDCCXw3syQqC5MGJNpeWWRIq4ODNaUtT+kyByGVzGw0BXBZW817Mm9C6Unsw76nNYeiFrjEwYQxdUoWcxXRUsInB6rhC9wCORLrtXvtOy0dabEWHxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JI599mH3uVVpzvMq86gHs0paD8Qafc91HQxe1MzNyeU=;
 b=Gm+3A5esfrwD58hXs34UogBB89PoDkpqmiAaWAdOmsY3AV86I4alfK5WxIm1m5/CpxJzXBo/+pvu/6ijCuLZLLJEoeGIhrRqdUreaLV3dCcvFnR7LBXE9qvph1j4R4qXnYZ7ghocIwdFWrtgJfJBkOuON7ow1r77EGzq8LSFFPda7qkjJ84dgGnqRUi8kw8Wh4oPCKHUOYevrVm0XEjxntVms1wHwWYrr3K8M4wJ2l5ocvN8Se3gp6HtRV4KkW/q0MSZdyCJp0bHVhTfa8buuRvFNWw4fROidIW30EWxgKXEI5AdSAAmpaBRw42frqgc3sC0ndQlN25uRvVuZ4y7wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JI599mH3uVVpzvMq86gHs0paD8Qafc91HQxe1MzNyeU=;
 b=aPtigUK4fZI58fPIIoYM2AYA6IunidZ7KwlDp10WcB9yKXcjIsrinsb3WYQisB0peWaMv9uGlQNmOowxGhf1t7XZq2q3n+kQM3ANaCLPLVzkhU0yicGKBGNIYjLu2Mp3k5XGCM/CUB2orMBS3Emcb115CLLiieBAlWf/ccagfuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8776.eurprd04.prod.outlook.com (2603:10a6:10:2e3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 16:39:40 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 16:39:39 +0000
Message-ID: <8ab7c998-fb5b-4afb-aa50-b64a8e2a1db7@cherry.de>
Date: Fri, 31 Jan 2025 17:39:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/bridge: synopsys: Add audio support for
 dw-hdmi-qp
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Algea Cao <algea.cao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@gmail.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250130165126.2292107-1-detlev.casanova@collabora.com>
 <20250130165126.2292107-2-detlev.casanova@collabora.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250130165126.2292107-2-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: ea65d0a3-6c81-4a64-10d2-08dd4215db49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2pLdGFmamVoNjczdzN2OFV4N0c5N3czdFoxZlpTNk82ZnZsc2dkeXZSZW82?=
 =?utf-8?B?OHZPbU5GK3JIVmQ5MzY5cmVQUW8rMlZFTnZMNjdhWEQza3hWajZnVGZSeVpI?=
 =?utf-8?B?OHFvaDdiU1VET1FVZDJyUnNIY1dFamREZVhpbzZEK2tkSWR6cHI1RU1iUktj?=
 =?utf-8?B?emt3b1ZINWtYOEs3UEpOY1FuRTUxVWFReVFiWG9iQnNlU0MrdHNzckJDQTRp?=
 =?utf-8?B?ODJndzdjb0hoUTNTTjJxcE9tZVdxRGdnZ1owTkovVWp2a1pCWEdvcUF4U1BD?=
 =?utf-8?B?YlVaU3l0OTNmQ2R2a1NnREZwT0dyUjhlY0JPZ1FhTHZDM1BOZGlSZ1BjbWxR?=
 =?utf-8?B?QklaMUxxaHJMYzYrWDdOcDJJdUF4bTZrYVV4eXM4N0lSQTZDdEJGcExORXRQ?=
 =?utf-8?B?cTBmN0lZTG52a3F0S0Jva0JtT0xPZFZFYUJjUzJaNVQ5dVVKU1pSU3RTK3dl?=
 =?utf-8?B?UDNzejRsZjNYZHdMNFdOa1Z1UTJRN2sxRFJUMEE1MngzRVEybVBXcXdOd2ZT?=
 =?utf-8?B?bFBLSEJJWlFhcHBzVnRpay9FSm5yaGR6L2luaUNscjNHN0d4VXdRMjhHaEor?=
 =?utf-8?B?bkNrUXJKVkd1NXVlazVld1RnWnY0UTAwVW84S0ZvUzZHTzZKM0NiQ24xQWti?=
 =?utf-8?B?TjA2cG1MSTBHb1ZDUzRyc1FQUXcrSUE4VjlPTG9mSndRUDVRckJ5WHhmSTRq?=
 =?utf-8?B?MmRYSHRjc040VVFLdzBwaFR6QU1WOHhXeHFmQ3RmRUNPL2o2U01IQUZHTXJM?=
 =?utf-8?B?MUVMOVFNVnI0Rk5hdTM2N2VxVG5WVjlhRm83TGNsS2lHSHFpdnkyUU54MG1P?=
 =?utf-8?B?Z0plOVNLNkZIL1Q4ZmNxLzhPU0RJV1pCdzdiVVhQcjZwUkVmYjEwOWtlMm9V?=
 =?utf-8?B?Mk5ES1RXSU9VVW16OVNhWmEzWnZJMytIbkRsYnVXWjd0QndYQzU5KzRzbW9B?=
 =?utf-8?B?TUJxaUZ5ejBWaitkL2J1WFBQTm9mS1MzZzhTR3Z5c2xYbXlKczk5VEYxZkVI?=
 =?utf-8?B?aEo0eEhHSktaRkEzVkVQS3RtTXY5dEdBVTdEM2d0emltZlZaZVdaNEtoZkNp?=
 =?utf-8?B?SllpODltU3pUQXhRU3hhZ0JsZm5GM3ppNjJibExDZzl2a3R1SVd0QXdWd2hm?=
 =?utf-8?B?K2Q1eElBTWY0V2V6UVNIYVhYbXFZZ0FibENZelhVVkxFUG9KbmU2QzEweS9k?=
 =?utf-8?B?YVVMdmFOUzBid1ZoVkVmWXBneVFrenZjTDYwclNXQlJmSTFJc05VcWFDOGNE?=
 =?utf-8?B?MXFuV1M4VG5ORDJqa3NNSnB2aTNrSFJ0N3prS3BNRjY0cVpuczFGZXUvVFc5?=
 =?utf-8?B?b3RHaXJYTU8zcTFNT2NYU2pMNXFxSjNFUUw4Qm54YUtDK0JWRUlDaDgvVjI4?=
 =?utf-8?B?d0xRVlErZDIvVVNPcktKR1h2c2ZQRjJSTk1rMmZWL0s2ZnJVU0hXSGU5bFpJ?=
 =?utf-8?B?M0FCcTV4Y0dxRjFYSlE4M2ExZWRaeGx3eHhNZHc0RVF3bXdKMU0wTFVWTWxD?=
 =?utf-8?B?RjZuMytOM3VNa296TllERHJkTUZMRGJSc2luTXg5RnVqTWE2OFYvWEdPSlhw?=
 =?utf-8?B?NWU5M3VZMFhGblNGdk5QYXA5WExKbEdLT2FkWEswSDZzenI5Y0VUOExmRzJF?=
 =?utf-8?B?YU9aS1kwd2Z5elBKaFZrK1NDTmkrR1BTbmdWUU0zRmk4aG1SWlRhb084NWRD?=
 =?utf-8?B?K2VreWkyVXVpZ1pQVkFFUitNVHcyTG83cG52ai9VYWo2cG5pZVFoWUhJZktM?=
 =?utf-8?B?dTluTmZkNUNRUmt0RWFJT05KYzYyMjlRYWZoOUVWa0MrcHhobVpsYW1qMmpi?=
 =?utf-8?B?TkkzYnVpMVhEMGhFaWYyVnc1SFJmeitETVZnMW9mVnFQS1o3SjdNZERaaHZQ?=
 =?utf-8?Q?haHFCGTZjpLk5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2RhY1VMZEFJK3lMc3pzTzVXN0c1SU5zWnhJb2RPL1B3cmRJRDZXZ3daRVU4?=
 =?utf-8?B?YXhwTDJWcWgwNEwyQ3lLQmg5MWNVNklYNHEwdnBGRHljS2l1NkkvRlpVTldv?=
 =?utf-8?B?d2c0R05iNkhWTkFmUWdzQ0U3azBxSWhhcXNuSWlTWkRyQ0p1c0Z5NER3SEsz?=
 =?utf-8?B?bWdDZEMySk5NMHFKRmxwMjRHcUc1b1E4U2FOYnVzY09wbnQrUStvTG93Yzlx?=
 =?utf-8?B?TWhubGg4M2Job1dJVk5YdStYc1JWRXZrMnkwckMvUmNyNVg4ajQwWDYxaC82?=
 =?utf-8?B?Rk00KzA3UGNqbGJ4VHhYZDk0Z2RIU3ZjSDVQVlpzOTZJSHFaK2lrWS9XVElk?=
 =?utf-8?B?R1EwT0N2MXluVDQ3K2VaemJMOUk5S3V3WGIxSXk0WHRHTEV5aG5Kd2twR1M0?=
 =?utf-8?B?Nm45OWpPU250NUcwSyt2RC9IOGs1MFVLem5kUitWOGJBZ3UvdlJtR05SNlNZ?=
 =?utf-8?B?ZTZvZjJqMXFRTDRaSGtmZzdKL3IrS3BBcStreVkvUUJiZk1lRXI1SUlHR3kv?=
 =?utf-8?B?Wk9oRVZNeERBVXFqQXZGdzdUNE5XV2ZMSisvTkVsYWlkM0gwYWRIbGhUOTZ6?=
 =?utf-8?B?NWlUSkZLZEpkTlhTZG94bUYzTmhtMSsySi91R29SS3MwUU03b1ljVzQzN21a?=
 =?utf-8?B?L24ySEt2T2tWMThVVnFoUGRYWm44MXhsZjA2U0J3bGdzV2ZJZElTMFlnaWkw?=
 =?utf-8?B?c3pUSW9FeDdpeUE4bFBHNXl2Q1BzVUVKKzczdVpkbEVzbFU1MUwyOHl6S0RV?=
 =?utf-8?B?a3p3b2R6Y201ZFFSQWJzamRDbkJMdlY3R2liSllXM2xKbHdjMEh2ZEJWcU1S?=
 =?utf-8?B?UDkxNVlWdlVncVh3QzBHL0p5TXdsN0tEd0tyTDZUUFFYeDhQcE13SUNTdWFp?=
 =?utf-8?B?QW9EeE03a2JBRW1lbnkyQVE1SDZ6REc0KzExYmJlY0hWNC9oaXFnUGozaDBm?=
 =?utf-8?B?bXpaZXVJVWtqWEJCblEvU2VZVFE3VnJYcDVJbTl3UDlqQy9obU1Lci82MzhT?=
 =?utf-8?B?SUswTTgvZ010RTI1WmdlNFV0YVBGT3ZOYUlRMkZMRTVYdENjVEtYS044cHRL?=
 =?utf-8?B?enFQWVBpaEc3K2lDZmVtQmJlKytxRjBvR0xGUm5Fb2dXbWdldHYzS2o2Q0RH?=
 =?utf-8?B?YWRoeUdRVnE2QnZQSE8yNWJBV2lqbk56VGtndjJybWw5YVVKZjJVVTdXUkJD?=
 =?utf-8?B?QjNUYU01YWJod09pZWcvaGJrNEtFVXlsa0V4dEp5SU9KcWREckVQaUo0Vy9x?=
 =?utf-8?B?YnBSdXA3OTVyejIzSURuMk9VMHhnc2VrMXlFZXdmcE1pL0JtUFFmYmR3SGFC?=
 =?utf-8?B?WHhYd25hbTdLdE5WS2tZRXRoRm5RQ2xGUXhUazdqQm9pWStqT2lRMkdnTXNM?=
 =?utf-8?B?SGNCdGNHMEdxZkhSdkkvZk1HMkszaGpLWlBMMlRCdmJjUzJ2dmxZUUROVUpX?=
 =?utf-8?B?azREbkU2WlQ2OTZibXNmRlpZVHR3eDhHeit1LzdOSjFSVWcyZGlLZEZhbFkv?=
 =?utf-8?B?Ykw0cDRtY21hM2ZnU2djaGtUbm1Jc0NxTU0vY1NQNTFiWEZGT3FpcEJQTzVZ?=
 =?utf-8?B?cmR6bzJvV3BMMHpXUGJ2NU1kNlJ5OHdKOXVoMGpubFZzdnpOVE8zRjBHQXYx?=
 =?utf-8?B?ekhXZlhPZGlIMnR3RWFUL0VtRjlhNXJUeG4rQzU3WitneUpwZ1FoV1ZFVzcx?=
 =?utf-8?B?TlJLYTRxbktsbjIyd2pkQk9abkl1c0xGdTAzcWJGMUJVejBPaTgyL21qc0tT?=
 =?utf-8?B?dmpQT2M5bkpqeHpaM1FNa29oWWVvdnAzRUh3ZlZDWVM2VWYwUnVrdUtWd0dm?=
 =?utf-8?B?d0pSS3VpOUdRZmt6cnBGbW53bkkwV1ZhQ3lsaUFtVW9KTmY0R013RzNhZlZG?=
 =?utf-8?B?d1VSVm1vcGFPb1VGQjVOdVpjcTJnYXVPcURCUlg2QmxJaUdXTkJnbU9Hd2NK?=
 =?utf-8?B?b3hBOE1ySEFMcVY4b1hlK1A5YjlpMytxWjZSUy80dWRsdWdMZFlZV0dPQjZD?=
 =?utf-8?B?WjB4YnRKVUZ4MUY5Z1l1bEUyKzIwQzNjT3E2RFNsMjdEWlRLN2EyTU10K0NI?=
 =?utf-8?B?S3V1TFNmblhZdE9TaEpjNmJUN2NlNnhHMW9sUytud3NQeXZ2ekxTU0lhZW9i?=
 =?utf-8?B?NENlOURqcDlaSGh4dGkvUHJPd1J1Zit3TDZ2Q2JHMlFuNW9Ld2ZoQy9JV3ZY?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ea65d0a3-6c81-4a64-10d2-08dd4215db49
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:39:39.9631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mb+iK56zOLBFg2MR5P79tca+bQSuYHWSUgcWsFRDKkwK4ogw+1AMkX9GEH4O5l/FlAuraMaLCu1qzStSPHm0NPPgr6kEcL4nE+hrgaS9LUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8776
X-Mailman-Approved-At: Sat, 01 Feb 2025 18:02:57 +0000
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

Hi Detlev,

On 1/30/25 5:45 PM, Detlev Casanova wrote:
> From: Sugar Zhang <sugar.zhang@rock-chips.com>
> 
> Register the dw-hdmi-qp bridge driver as an HDMI audio codec.
> 
> The register values computation functions (for n) are based on the
> downstream driver, as well as the register writing functions.
> 
> The driver uses the generic HDMI Codec framework in order to implement
> the HDMI audio support.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

I've tested with my suggested change on PATCH 2/2 and same changes than 
for Rock 5B DTS on RK3588 Tiger Haikou with speaker-test -c 2 -t wav, 
left is left, right is right, therefore:

Tested-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
