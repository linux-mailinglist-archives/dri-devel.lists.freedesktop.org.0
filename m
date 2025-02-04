Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582F6A27FBC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 00:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3790D10E712;
	Tue,  4 Feb 2025 23:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="iGCkCDVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE8F10E2B4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 09:59:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yc/hsvWe3YTr1bzcgKl8tAav61DtMPugN6SAmLWCvfvbNG5sbUisaxBWpTbPLPe/YGGw0TfYnriA7DkK+OrqDWSZwcDYbc4nTh2ExnERP7ln41YTE5lSKaypNVauT87OCNwW+H3T+P5E4WSNDg/eieEg6uIB7FEywZFZmp+cqYgnepxjYCJ9VLonhezRySuA5Io5XaNkV1NfXEm7Vp97fgHK/fUjnIBesJLqgfu4ybthGa/ssFYz9dCsbcB95WwLbCIUltE+QKKkXFoUPLm/LTkfaX/9Xz2SJ6y/PYpz6NmaTKu4l7WpaRhshz4MrkYKb/mQk7TWrMJz4FHMfnorZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Dqo1UvCttRQtJ7cXeeAtV3YaRpdarXCIxZrEakjJ6s=;
 b=UqJr4IVPRyVVcpFGPwPAR0kTu58IKUwrRCOP65h62HZXuUrAbiH1g7OSd6sLwkp3V4ZdEO1bkLtA7ax7rPIs8gZd32YaeWMFpxdYrvA3dtjbig2IQyKuEmZ+aIX7+0+zyyC5+sxAcvNKzSZilMgjMqC696ePaqWD1paojhsnkd3i1f2N2NjjrTrro+GdR/BHN7/h+PDxlLaSI9aSwxgkbv0SRb9gqIO/Tp/SSNoCbGyH05uvtBATJpn3V2EQ0n5L6Tpp1c1BzXHlGv4TIwDE1aZmRFaf/T8jiReFFNQB4GUGhfX5UumRM2wTy7VifQUNVPY/zMycGLfAtsthWFyHeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Dqo1UvCttRQtJ7cXeeAtV3YaRpdarXCIxZrEakjJ6s=;
 b=iGCkCDVLlYL43ZX5QOlVCzAmUW0bvahwJHcSy5nh29meNerPdBmf5DFDAc9NvkLyd5AhPJKspkDcU6KfBUMYeYZBB63UBOCsKJj2K0tHhvVA91ekKKs4BkBMzbY0aGKmT26n5LHQWlcA4P6xCwXmU9jiL/oBFcA9FYeJO+Wnr8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9294.eurprd04.prod.outlook.com (2603:10a6:102:2a5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 09:59:14 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 09:59:14 +0000
Message-ID: <db29945e-565a-490f-8a8c-387ecd47a198@cherry.de>
Date: Tue, 4 Feb 2025 10:59:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/bridge: synopsys: Add audio support for
 dw-hdmi-qp
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Niklas Cassel <cassel@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Kever Yang <kever.yang@rock-chips.com>, Johan Jonker <jbx6244@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Algea Cao <algea.cao@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250203171925.126309-1-detlev.casanova@collabora.com>
 <20250203171925.126309-2-detlev.casanova@collabora.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250203171925.126309-2-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9294:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8fd139-9783-40da-c9e7-08dd45029494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUQ5dFo3MXdoWDRTaG1hVCt6WTlpeWJQQ0ZLV3hKRlpMMDZTYXNTYzU5NG90?=
 =?utf-8?B?YzhWUmNvR0ZOdUpCS1B4aXh6QTNnME1JR2NKMlcwS1dNVDFodVdvc2paMm5I?=
 =?utf-8?B?UHE1dXhlVTViVTdhUU1GUUJpTkVDUU14NDNoUGx0Sm5XL1U5U0JFUGVnTGY1?=
 =?utf-8?B?WkxoY05kQVJoQWUvdDlVK0Y1WmFWWnBlZVNham5zT0xVakU0NnY4Wjl3OU9o?=
 =?utf-8?B?cFRQQXZKVmRIMy9MTGwrQjIrOTRSK1c5M2JYUWNGR1k3Vms5cVBiTVh3LzBk?=
 =?utf-8?B?SS9wN1BTMVBmUnJMUUVyeDFQbkVmU1BuRUNBYXRCdERFazZqdUduTlFFc0tT?=
 =?utf-8?B?bm9POFlKbVRwRFl5VW5OMStldDFqck1hN1g2NzZuaExNNm11bWpQUjdhWXky?=
 =?utf-8?B?eW1nQ3prdXBBRUJDeUV2RzR1ZWJZSUMxVVRDZ0s4VkNWWU8yMXJQMy9Hd1VE?=
 =?utf-8?B?dkVreG1BbERVZm1MaWRpUG0vSGIxNnNabk1mZXJhQ1krVEJmcnZTc0dwOGlu?=
 =?utf-8?B?aW53OWJXWjcxak5qYVI3cFBrL3FrZGd5RzluZHZhVHQwSkZzRkgwTml5d2tF?=
 =?utf-8?B?dHVySGVmL1lmVVlDUlYwL2ExeWZXMWwyVDJZdXFEUHRRa2V2WURsYTlTVGdN?=
 =?utf-8?B?enZ0RXpWWUE2bXczOE5nSHJhbmUyTS9ORC8zc2c5SmlvK1hjSVE1dlZuR0dR?=
 =?utf-8?B?bHQxb25KU0F2SkpkQW9xTnZENENwWE55c2t3cGZJNXRqZFdMN1N4SnhBaFNO?=
 =?utf-8?B?OWFadTlJT2FaQWJOclB0dWpYaFk2b2dxYllrUjlUcFVJOEZiNEgrSDhpZG1z?=
 =?utf-8?B?aCszVUdScFY4Uk05Y0pPQ3lEZ09GeVZwM0xMeGpGcHlYNnVxM3crUmRQUWsy?=
 =?utf-8?B?WWVrb2VxeGNqbTVKd1BkMFN0NmNUZ09qZFJlQWVmTGRFMzVGWURRQXVQVjd3?=
 =?utf-8?B?dXpwUXN4cVE1YzkwazAzM1ZueGdLS3BTY0pQSWEza0pIdTUzNURYTmZKbzhu?=
 =?utf-8?B?TFc5cUVSYWxuVnhGM3VhczhFMkgwRmFMNmh1aElka0k3TE1WOEoyNDIzenBU?=
 =?utf-8?B?MlM0VjA5eDQyR0lxWHhxUytlbmdyMHJTSjRpM0ZLY1FlZWEvYVNwOG1LTndI?=
 =?utf-8?B?b2VQT2V5YUJORExZVktoUXh6YU5XbFltZU41eDRlanNQSHVybmJnU3RweUJG?=
 =?utf-8?B?cXd6VHVJYTBkM1pZWDBqVDljeHhubW9wZ3JPL3NrUm5zVFpoc2hsdGp0aGky?=
 =?utf-8?B?RFh1NXJHcFZFODBvZVRRSmNHZ0JaU05pY2hoOWkwVlZoOU4vM0g2RDVZMWZH?=
 =?utf-8?B?azhDdEZSSkhrSjVNNWRJK3ZOeXhzeTIzTmxzS21FSitwWllCcXBndVA5NXNT?=
 =?utf-8?B?SXJQYjVZTmxwbUxYd1g2MjJyYUE1Y1RkOTVCM0s3K01ISXo5V0ZIMGlHdVoy?=
 =?utf-8?B?MTRadUQ3d245MGF6SjQ5cGQ1WjJYR0NhbWlhWVJVd1A4ZVY3dmZwUUc0eU91?=
 =?utf-8?B?Rk55N3lZRGUzVGF0WmdMY1ExY2EwYnhiaFFaMDBNaS8vYnZOK1Q0QjQ0MTlO?=
 =?utf-8?B?dCszd0JEZEVYZG5FeElKN0ZnQXZSU2xJU1pIZFlseVZJd3pEVmRMVG1raFpN?=
 =?utf-8?B?OGJRK0t5T3VoRnVVK0R2ZHdlQkJKb1BUU0ZLRnhpNUJDamUyZ0tQVUxoSXVC?=
 =?utf-8?B?V0JoKy9rNTViSHNSTnlaZ1ZXUEZLNlJxYm1hcVc1V1diTEsra1NqMVc2amx5?=
 =?utf-8?B?cXhPWnpvY1EyenNCRExidHd3enVLMzJJOE5lSDdVODJkSHFOSEI2dXBFek4v?=
 =?utf-8?B?R3pubFUvb3pqV1hKTEJtZkdic3ByY1BHTEplbmQyT0Q2aDJ1bERYMUZNODQr?=
 =?utf-8?Q?it8MbHLTecgbd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHlPN1A2TWs5YTdXelBONXlyZkdJeDR3ZG5NY3ZRbFFVQmg3M3AzWFpLenpP?=
 =?utf-8?B?SlAwTytXVU9RY1VsLzl1T2t5emZNbCtzVWdIbG1DK2FmZFd6eFpXSC95Zndh?=
 =?utf-8?B?ZGJyQytZOXdlTHdsU1BsUlhZaVRvNTVaL1ZpVzF4Zk1PNmV2UUcrYnNucmVp?=
 =?utf-8?B?bVU4V3ZZZ2dURG9salNXY2EvSkRWTGlmQjY3QVZwbmYrcW9wR1JhVXZXdlRU?=
 =?utf-8?B?V3J4R3A5VVFRRVlmWU1CQk1DQTZ1aitUYUZlbERaN3RRKzVyT1NZcjZkVVJo?=
 =?utf-8?B?VDZsaE9HRmJjSlBnM05ZcXkvYlNJSVQzcHhVQU1VOHFhaksrcWRwbXpsSitC?=
 =?utf-8?B?Z3A2UUN1U0l3bXJBRVB0eUlXMDdYMU5QeUVrVWtUbUFxekFBaS8zcFNwNFln?=
 =?utf-8?B?TU0wVm15K3ZvRWROdkh3bWhIdDhHSU1veWRCcldkTzRtSVA4cmx2bDZJUFBv?=
 =?utf-8?B?SVp5ZlFaTzBrM1ZIQ3FET0dqc1drdEJvczdvbjNwTUVLYnpseFFYcmtZTjJm?=
 =?utf-8?B?cGc5bk9WYUp4aGtuRXdBQ1JoLzhaVDloRW13UTVFUkpvYURoem1mSE5ZNjBh?=
 =?utf-8?B?VGVsSjF2WTJjbldQcGY1dXZDa0tsaUFNVUwyRDl2SjdpM3pRd1AwV0NCYXBx?=
 =?utf-8?B?bFpEbnFVbW05RVc0YnpMWnR3WnhQVWpUeGo3WkJ3Z1BLWERPOU0xVDRCOHdn?=
 =?utf-8?B?c0lNakNXcDkwWUhCOFVlQXh6ZVZ5VmZVaUZSSENpQnFNVzZkb1pDcEJlSE9u?=
 =?utf-8?B?RnkzNnFnN2thbUVhNnA5cWFaVUJlWThueVZxZW5vdGZ2Qjl1N0pDcXBCeG9j?=
 =?utf-8?B?bkMxNXhhKzV6UVJhakh6c0drUTM1TThmZ3F4YUV1eXFMMmwxcEQ0QnUzMXpR?=
 =?utf-8?B?T0ZwMDVickhmdEpyaWc5Wk1BbjlXMDVjRE1XaG9zdXFnWGxNZHhHQ0RLU05k?=
 =?utf-8?B?emdtamNFZ05yNjZOVlBld0ZsRHM2K0hqQzBNL3ZuZ3RvTDFheXNoRktucVhz?=
 =?utf-8?B?QU1neXNpZkkvUGx0QkNoMWVxVmdZUUZaUS93dTUrUnlDVlA2VXNLVFMzc0o5?=
 =?utf-8?B?cUx5U25VQWNlSTNtTzZqdjBUV05oTjYvMXFPY3JHTUVwTDFZdC9uR2xySUtR?=
 =?utf-8?B?MmhwSXdYaUt5MElKT3Y5S0hrRk1sUTBVd1lqeEJZUlRJQURWVFE4RWNpc01Y?=
 =?utf-8?B?MUducGdzbk41MWF5MUlncWhwc3JiVUQ2N1BvOE5yMmNEQ0VSMjEwQm9RYWNM?=
 =?utf-8?B?bUliUWRtdHJXcnREcjdtTUpSOVZxNytqNUJza3pXTndyQXovRTBoa1ZDeWxl?=
 =?utf-8?B?MVBrcTZTb0RCajdsVXhhbDQrKzFUOWxvdWpwN0lWeGYxRWJSang5USttQjUx?=
 =?utf-8?B?U3ZDQm85STgyd3M4NmdqZDhCeVVaWjgvTHdvQXRhZmJybUFRdlRydEpnUWdP?=
 =?utf-8?B?WTIwbTlxM040L3pXczV0Wk5pVDRmQU5kYW9iTnRpV1VDdndObjNrdUlkV1N6?=
 =?utf-8?B?bmY2RkJPMktIa2tGaGR2NDBOYlVHa1NQYnVSQ2YzaFp5bTJGWDhMUU9jeXVR?=
 =?utf-8?B?UURlMFVudk9LSk1YajVWOFhmcDN6NDdNSGhyc0NxcGRNS0p4ZVFCZkE3NWlT?=
 =?utf-8?B?RldrR0NrMjNOa1RFZTc0NCtXZk1rcnZXZHhTUG03dHlwVDM3ZG5UM2h4L3NF?=
 =?utf-8?B?emJDQnRaaDRtalJ1cThZaTZTZnY2Vk1pejIwc1FBTEUvN3JsWVd6anZwa1pE?=
 =?utf-8?B?N1M4U0tULzJmSEd5aWNxK0tuS2MxL3RoTkNoZXVvT2I4eWFLZGZIZmRWd1Z6?=
 =?utf-8?B?N3VWalBwYllBcG9Xd0diK2JXc2RPVHhkbGZsRDdyNi9sbU5GTFcvT2oxRW0v?=
 =?utf-8?B?OVdiWThRMGx4SHE4cW5TMWRCM0YrVFJjL1pvc3lrb1pDWFVocVlEZ2FOc3kz?=
 =?utf-8?B?RW42TkR2OUdDNW0xQTZtMjh4RnFmN3RNZGxZdG43UzZFMnpsek5mMHE2Wk5Q?=
 =?utf-8?B?ZUs0ODBlbng1SEJQVXljSkZnd01yT0JjS3dDUm9MK2ZUNXAzbmNteVRWZlNv?=
 =?utf-8?B?NHMzWUw5K2J5UzZ5dGhVb3JCSUN0UVYwL3VUT3dBb1RiUmRxTUxXeFArNVgv?=
 =?utf-8?B?ODdqeXFlTVpNM2oxMmwrZEwvbElQUVJLYnRXNkJKQ3JyQVNNMmo0SGVUZGdm?=
 =?utf-8?B?VEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8fd139-9783-40da-c9e7-08dd45029494
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 09:59:14.3096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DdtemN/hh9+/3cwjig9FEbhnsQHATmMX8Z21aSnEhE2Xp81DaselHj1EtcazZfD+mngMJuJT1Icdna02XRxg44o4gJf3xLGpZqbOHsGP8cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9294
X-Mailman-Approved-At: Tue, 04 Feb 2025 23:37:37 +0000
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

Just some drive-by comment inline.

On 2/3/25 6:16 PM, Detlev Casanova wrote:
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
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 497 +++++++++++++++++++
>   1 file changed, 497 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index b281cabfe992e..ea5d8599cb56a 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
[...]
> +static int dw_hdmi_qp_match_tmds_n_table(struct dw_hdmi_qp *hdmi,
> +				   unsigned long pixel_clk,
> +				   unsigned long freq)
> +{
> +	const struct dw_hdmi_audio_tmds_n *tmds_n = NULL;
> +	int i;
> +
> +	for (i = 0; common_tmds_n_table[i].tmds != 0; i++) {
> +		if (pixel_clk == common_tmds_n_table[i].tmds) {
> +			tmds_n = &common_tmds_n_table[i];
> +			break;
> +		}
> +	}
> +
> +	if (tmds_n == NULL)
> +		return -ENOENT;
> +
> +	switch (freq) {
> +	case 32000:
> +		return tmds_n->n_32k;
> +	case 44100:
> +	case 88200:
> +	case 176400:
> +		return (freq / 44100) * tmds_n->n_44k1;
> +	case 48000:
> +	case 96000:
> +	case 192000:
> +		return (freq / 48000) * tmds_n->n_48k;
> +	default:
> +		return -ENOENT;
> +	}
> +}
> +
> +static u64 dw_hdmi_qp_audio_math_diff(unsigned int freq, unsigned int n,
> +				unsigned int pixel_clk)
> +{
> +	u64 final, diff;
> +	u64 cts;
> +
> +	final = (u64)pixel_clk * n;
> +
> +	cts = final;
> +	do_div(cts, 128 * freq);
> +
> +	diff = final - (u64)cts * (128 * freq);
> +
> +	return diff;

I believe

final = (u64)pixel_clk * n;
do_div(cts, 128 * freq);
diff = final - (u64)cts * (128 * freq);

is just an elaborate way of doing

((u64)pixel_clk * n) % (128 * freq)

? If that's the case, then I believe do_div(a, b) actually already 
returns the remainder of a by b.

If that's the case, isn't that function simply:

return do_div(mul_u32_u32(pixel_clk, n), mul_u32_u32(freq, 128))

?

We could probably replace mul_u32_u32(freq, 128) with freq * 128 
considering that dw_hdmi_qp_match_tmds_n_table expects freq to be < 
192000, so we won't get an overflow with that.

mul_u32_u32(pixel_clk, n) does the u32*u32->u64 without a temporary C 
variable.

[...]

> +static void dw_hdmi_qp_set_audio_interface(struct dw_hdmi_qp *hdmi,
> +					   struct hdmi_codec_daifmt *fmt,
> +					   struct hdmi_codec_params *hparms)
> +{
> +	u32 conf0 = 0;
> +
> +	/* Reset the audio data path of the AVP */
> +	dw_hdmi_qp_write(hdmi, AVP_DATAPATH_PACKET_AUDIO_SWINIT_P, GLOBAL_SWRESET_REQUEST);
> +
> +	/* Disable AUDS, ACR, AUDI */
> +	dw_hdmi_qp_mod(hdmi, 0,
> +		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDS_TX_EN | PKTSCHED_AUDI_TX_EN,
> +		  PKTSCHED_PKT_EN);
> +
> +	/* Clear the audio FIFO */
> +	dw_hdmi_qp_write(hdmi, AUDIO_FIFO_CLR_P, AUDIO_INTERFACE_CONTROL0);
> +
> +	/* Select I2S interface as the audio source */
> +	dw_hdmi_qp_mod(hdmi, AUD_IF_I2S, AUD_IF_SEL_MSK, AUDIO_INTERFACE_CONFIG0);
> +
> +	/* Enable the active i2s lanes */
> +	switch (hparms->channels) {
> +	case 7 ... 8:
> +		conf0 |= I2S_LINES_EN(3);
> +		fallthrough;
> +	case 5 ... 6:
> +		conf0 |= I2S_LINES_EN(2);
> +		fallthrough;
> +	case 3 ... 4:
> +		conf0 |= I2S_LINES_EN(1);
> +		fallthrough;
> +	default:
> +		conf0 |= I2S_LINES_EN(0);
> +		break;
> +	}
> +
> +	dw_hdmi_qp_mod(hdmi, conf0, I2S_LINES_EN_MSK, AUDIO_INTERFACE_CONFIG0);
> +
> +	/*
> +	 * Enable bpcuv generated internally for L-PCM, or received
> +	 * from stream for NLPCM/HBR.
> +	 */
> +	switch (fmt->bit_fmt) {
> +	case SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE:
> +		conf0 = (hparms->channels == 8) ? AUD_HBR : AUD_ASP;
> +		conf0 |= I2S_BPCUV_RCV_EN;
> +		break;
> +	default:
> +		conf0 = AUD_ASP | I2S_BPCUV_RCV_DIS;
> +		break;
> +	}
> +
> +	dw_hdmi_qp_mod(hdmi, conf0, I2S_BPCUV_RCV_MSK | AUD_FORMAT_MSK,
> +		  AUDIO_INTERFACE_CONFIG0);
> +
> +	/* Enable audio FIFO auto clear when overflow */
> +	dw_hdmi_qp_mod(hdmi, AUD_FIFO_INIT_ON_OVF_EN, AUD_FIFO_INIT_ON_OVF_MSK,
> +		  AUDIO_INTERFACE_CONFIG0);

This is all very I2S-centric while the HDMI controllers on RK3588 do 
have the ability (according to the TRM) to use S/PDIF instead of I2S. I 
assume the driver should be able to know which format to use based on
simple-audio-card,format property? Is that correct? Then current support 
which doesn't even check for I2S would be fine and not conflict with a 
later commit which would add support for S/PDIF? (Essentially asking if 
we need another DT property for the HDMI controller node or elsewhere to 
specify which mode to run in instead of expecting it to always be I2S).

Cheers,
Quentin
