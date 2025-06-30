Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61FCAED68C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 10:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4DA10E3CE;
	Mon, 30 Jun 2025 08:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="b5XCSkMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021075.outbound.protection.outlook.com [52.101.65.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E413110E209
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALYpJZ8RCdj4u6jkVcj79R8WJCLg15seAQzpgv4Tm6veair1HdFQt3uh4NLly7ROIOfO2nWfCF6VDFg3vm4jiuyKws5b6szgHHgmdz09Yv9IP0Q4ou+59/xiKcnX72brfBq0ppChY68/gHFNuWrZ+mkUBDliNvjN4oSydXAgmvDxuAxnsNMngDvdCM13DM9NIxpCU84jTP0W9qsIohsRnyJtIohmSUsdfIhqIpptBTD2Okp1Y/jHEgFEaFLL5EwnRA4ay6+U2GbHD88arl8QRtsN3y35XSYiDbMBLngkQNFfkjZG1y3fC11DaefGMe+fmUriNV+HthaYNYZZTfTCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4UNtM0hdMm/eZRryBz1Esly2XiZTYmoCKWNeVbABZw=;
 b=Pn+XYheYsxQ1A6dZlpP/a0IQNNUCvWmqfWp6nTIyH4g8LvLc/VYQ8yg2bmCtprx6EeRvyalkRWereDZ7abYLnvRuusI9yUMyJJrXExDCkfw9ViOJR7DwxpC0I+12kWKdajM+iL+7PRjjdDIyfuSQsTGLFZnP9L54rK2OJULWMfRf9wG8l/9dmY8Gyd7B70e4M+JJnzVdw6hcKae0fAH5l1UPfvQn4QSht+96TlXRXjKJwaRQMvIS7MFfyIpzfTs3hNtte+u8F7E8lSh2B8fP493FFUeySO78vsUh2UA6uxKYtoB0BW/jINzc0tFzVXjODLKYgJ/5iGrY3anXHG+0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4UNtM0hdMm/eZRryBz1Esly2XiZTYmoCKWNeVbABZw=;
 b=b5XCSkMT4NhOFihfNKHu7NxkH8ykd4s0Vv5703lMYrp+873XP/7R0SWlQevle2SAobb+tzZvFSK0lJB1pfmh/QLHwh3n0UGOiqOlK+1rjE7atPkppDu6+fRdhec9Ym+cGJQZYylqBS4yUKk0DUgKpWlnf+fcF9AQrTFfJTOrWTf4iEMKgu+OrBPWdpEhxFY4otUmQeFk/aanTTU4edc5c66xNyMBm7Z+wyRuiY+S8Vjyq0q0mNM461Fjm6FFTur1+bfFBTWgJXUcu3NtvuaYpqBtYPPuZCh200JAFzLWVa+IYKfMquc5dsFSkyOWiJU+/bv3tmGeiU2YlSK9qQ6D0g==
Received: from DB6PR0301CA0095.eurprd03.prod.outlook.com (2603:10a6:6:30::42)
 by VI0PR04MB10832.eurprd04.prod.outlook.com (2603:10a6:800:267::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 08:03:22 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::60) by DB6PR0301CA0095.outlook.office365.com
 (2603:10a6:6:30::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.28 via Frontend Transport; Mon,
 30 Jun 2025 08:03:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 08:03:20 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com (40.93.65.69) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 30 Jun 2025 08:03:19 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AM7PR04MB7127.eurprd04.prod.outlook.com (2603:10a6:20b:113::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 08:03:17 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 08:03:17 +0000
Message-ID: <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
Date: Mon, 30 Jun 2025 10:03:16 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20250627181911.GF24912@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::18) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AM7PR04MB7127:EE_|DB1PEPF000509F3:EE_|VI0PR04MB10832:EE_
X-MS-Office365-Filtering-Correlation-Id: a361cb25-ebbf-48a9-6ae7-08ddb7ac941e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?S1lDWkJkTWFhUkFEeWFKUGluNXpmR09hbXI0WVpzUGljSFRaK2VEYzdnNFBR?=
 =?utf-8?B?U0V6K05VN1I0M2lQcUtDSmhiRitLbXBMd0J0b050dFMxcVlEVDY4bUhpNHRp?=
 =?utf-8?B?TkphRDEwRlhQbnF1emlZdjMzYVVtN3ZHdWUyT3ZMRE56V21tcHlRdE1YdUov?=
 =?utf-8?B?c3FJYm1wN2xZamVhNDhkaWRQWHhSbXZWank5WVdiUWxBWGJ5ZXRoUCs4MVZC?=
 =?utf-8?B?TnJlTmpPRnA3RzFzY3pHemZuUDlNTUo4TjdJNmJQRldPY2U3QmtFcTFLbzNE?=
 =?utf-8?B?c0x3Rzh4NU9BaW85YmVmcVpIbFJycVdEb1dWUWNYWndRZEl2elg4YWx1cGx2?=
 =?utf-8?B?SjVLWXdkTE1ZUjVHYWQ5SUo3aXJQT0VIakxISWI4M1p5ZnBPMk9VKzUyWUlo?=
 =?utf-8?B?cDVFcTFXUHFzcWhCejdCZmM0NmNqUFptVnVtU2VxVXljL0tPdTFzdE1ZSHht?=
 =?utf-8?B?MFBINVUrcVRBYXZlKytQdGI0N3BrV2dKcDJBbGFuZDRpbFBEU0dxNlM2L20x?=
 =?utf-8?B?RmFjNkRnZG9sa2ZjTXQ2WmErelVqVGh0bzM2cXRSZ2ZQUUg4aTdCOGp3RnNu?=
 =?utf-8?B?OXhlNm1NS21yMzNkZXprcE9rOWdTTWp6c0RsMk5tS1pPK29CRVgvcmVGNHlJ?=
 =?utf-8?B?KytpRCtFd09tdkUyckhhVWpZZVRtR2phOTMvWVFsbWc3bnlJWDhhVUdBZkxa?=
 =?utf-8?B?K1grTVQ4RjZuMDQwWVVENis5RGxDYzhPd3cwdUhPcVhHeitVUHZuU3RYcUor?=
 =?utf-8?B?UkZpMHFDbXRHYlEvN2RPOGtVYTM5OXBvWjkraEhXc2ttZmgvRTl5WEs4TUkz?=
 =?utf-8?B?VDcxdWNkZnJKR1pKRUFvQ0Y1RGhWcHk1NUtKTVNsbmt1TWE5UTZZbkpTZHBT?=
 =?utf-8?B?OTNrTXFWcWZTaDVLQTMyWHlzUnBFSlZQRk1XaUoxbzhwQUhiVnNPUW5IQ3hD?=
 =?utf-8?B?QzJKZ004Ti9ZLzRCRWk4WktxQm5NMC9tdGREZFhMRmRrUjBMMXVYZjRqVUtj?=
 =?utf-8?B?UTZCRE9hZlpZbm1iQXBpTWJ2a3VSUk16QUhOVmhtT3Vtd1RKOUs4d2JtM2NI?=
 =?utf-8?B?emJGR1AwczFnclJwc1hmK1ZPRTZTY3lkSVFuZTFGOUR4WFZJdEpmajB5RUQ0?=
 =?utf-8?B?b0lTSW9FeUMzWnN3V0hEQk15TDRPZlNvME1pZjJDUjlabzlXQmlhaWhJU29v?=
 =?utf-8?B?MlNwaktpMFA3L0F0Z0xKdWxuK0U1OFJmSWFEbFNEWGVRcGR3YU1vSXFxQW5s?=
 =?utf-8?B?WUEyQ3BITFBPMlhWK2Q5ajJvc2k1K1FKS1JENFB3YmZudEplanFMRitsam02?=
 =?utf-8?B?WXNPenR1VEZFRHpDeTR6algwQmVidndUT0N2enFWV3p5OHNHd0tVRkpMQzdM?=
 =?utf-8?B?dDVETlJJZTFwaDJNT3l4aTZQTTQ0b2YxQWkvQkFFRVJqVFE5NmhyVU01Y2g4?=
 =?utf-8?B?aU9DZE1HcENlTFhXNFlBQ21XY1c2S0orM093NHBNZTZSZDNPM3NwL0k5WDZl?=
 =?utf-8?B?U3lFK0V2eEtQQWNUaDFEWlJWRG83N3A0SjZzWkF4UE9JRUUzWFlUNThQMERh?=
 =?utf-8?B?Ukt2QmFXRERJQ2dOaFJWRUIrdGo5WUZXWEI5MUdLT0pQOEM1Z2dldjgrMWVS?=
 =?utf-8?B?UU81YzBSUGFKZjN6NkFLRnNZS0Z5QkJKL0ViMmJtMnJ3U2kzbk9ZUkcxdkJv?=
 =?utf-8?B?TDdYa1hGM0VOVUJYa2VPazgvRG5KMU4rZGZoTlRsNFh0VE8zTXRTWHhmYkhh?=
 =?utf-8?B?cHBxc21OMUgzN3lYY2hLS1pBT3VTeFMxc1RSTGZZV05WQjQ4dE4relN4Z2Vn?=
 =?utf-8?B?WGpDN0laSHpIRXFkbFdxSVg1WEhyU3pVa21aSlM2U3FZa3pERGxlNlR3Zk1I?=
 =?utf-8?B?S0ZxTXMzWHFsSXpQaURYckxuS1hXc2lyYU14eVpRNEJRSHhPQ3pRc3hybFVm?=
 =?utf-8?Q?YLIqVrzIrq4=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7127
X-CodeTwo-MessageID: df178efc-8337-427c-9bc4-d690ee2cac6c.20250630080319@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 30bfe7e1-5412-4560-5e9a-08ddb7ac924f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|36860700013|82310400026|7416014|376014|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUlYeDFIOHJzSkVlei9OUk9Kc0huc2E0djdwOFF6dW96aUNJWEp1ZXZXbUFo?=
 =?utf-8?B?ZUhRdGFDOXFlZDZxVUxrTWs3VEZIdVcxRUVSek5oRVZxdlpFQk9rbnNuSGZT?=
 =?utf-8?B?bHBLbzBiVW1zYlJaM1h2SVIrODdZb2JjUXB5YStyV3lDMFI0TkhDMnd2M2Z4?=
 =?utf-8?B?V2tjYTlRRWlFUnpYWlB2K3lzNUt1WklqbHNEeXRkbzU3QVFVbnVrWXVTcmNV?=
 =?utf-8?B?ZmJKa0t2bGxWQytsY2FEc3dHTmFEWUtRZVFjek51cGNBZGtSZFdJeklUeWFD?=
 =?utf-8?B?STF6NGpHQjN4QjlCZDRTSUY3R2gwNS9qUjBPT0R3KzZEdmxTMytzMDNSVzRM?=
 =?utf-8?B?ME50ejhKNXl5bkUreGhXWjFSK2xmTzZ0SzE0bnVaaHZPWXc5bk9sK0hsYTcz?=
 =?utf-8?B?ZjFXMmlpV1d4blRtZ2x6ZFZGZTMrQ1FVQWR0d1p3R25UaytJeHJyQkk5d05h?=
 =?utf-8?B?Z0dUZmlpN3VoN2l3Z1I5NkVsR1M4clNkS2lEeWIwM1FmTFZjd1dpMWRsY3dY?=
 =?utf-8?B?M3pSbVZYUThtNXBCeC9MYzNNajBjWWI2WjBwcVJiTlNLYVlWQjVRdXFSRzdO?=
 =?utf-8?B?MmtXa0FCRHorQjI5eGRqa3BDVDJEYXdraWVEZ0sxTSttVXNLZmUrNEhTVnZN?=
 =?utf-8?B?WjlGQURyTWY1Qk1jdDcrbGRtTHlvWm1kNTR0djJHQ3J4b3FQczB2WVZscDhn?=
 =?utf-8?B?S0RjNTZXeTN2Z0E5WlllQnFqQy8wT3pNNGVMTTRib0w2L1NkRmN1L3dnL29w?=
 =?utf-8?B?S2ZWS1diSnprS0libHFERUc4NDd0dlZoWG0zcDVaVGdlUGFrMmFIWEtteFNL?=
 =?utf-8?B?ek5JcGhJMGNEU3k0Q3lpU1Q4NlBjeWh3SWpvRktyelRZRFhHdmVXN3hGaEJ2?=
 =?utf-8?B?TTI4czl6VW5WL3E3OCtiRWR6KzNyeG5BcGtEYmFvV0RnS2hoa3FYQUZWbkJk?=
 =?utf-8?B?Zk84R0ZreXBkeTFXNnJhV24wSTZUVU9ydzcrVXVsbXpoY1d3RzR2aVczeER2?=
 =?utf-8?B?TzB6OGtYK20wcUNaMlE2MXlqYlE1clpjdEZWdEIwRjNwRk16MGJtbUI3K0N4?=
 =?utf-8?B?bkYySm1QbUVrVHdrVUp0SEhpbDRiazJFNnJjZk91ZG1uOVRYZVdSRVluT1BQ?=
 =?utf-8?B?VHVhQklJS3JIWk9oOFpSVytkNE5PYjFld0grYUtWR1Z5cUozdlpXQUpkZVVH?=
 =?utf-8?B?RVBjU1Z6UWsxbnFpNi9jZXdaZ2RGV2J2TGRLZGtXNUQyS0krZlA5K3I5c0xv?=
 =?utf-8?B?Rmx6UVpmZGlpNCtjNmY4c0hIUElXVmt6dUd3SW9yaUMvK01BaUtGR2JEK1Zk?=
 =?utf-8?B?S0FZMnJLQnNjdVJaM3dWLzRjeVJzYllmem0xSXpBYWFnSnJyZDMwRGszclpD?=
 =?utf-8?B?QnRsWDBlMU9EK1pCa3VvODRSMVhwNGswU1RZL2VEODhUalJoa1lLWk9yZW1D?=
 =?utf-8?B?azA1MTZ6OTl3L09PS1pqSnVPR0NMVE0yTTFJaVpYU1Foc3FVUXNad1NuR2tD?=
 =?utf-8?B?NWNwOTU3b1BuTVhvczYwR1FOT2NEM3krTlZCRXY4aGxjd29KRnhqL1BaR0pU?=
 =?utf-8?B?OEdzOExGeGtHdjNMRlorT2FMWDhqM2tFUnMvb2s1ZlVEdC8zWmN2OGVkNEI4?=
 =?utf-8?B?VWJSOXp1V1p4aS9hdzdSQSsxRnV4Sk1TQTJFSkJVbGlYNWtCVHlUTVVmOENl?=
 =?utf-8?B?L0Ixdy85RVV6V1NGL0RVZ3ZDRGlBVFgxenNQaEpTWWJDYmFMOUtXZE96RFlz?=
 =?utf-8?B?SEgveElWTUVyK0pvQW5lYS9zbU5ROG5GT3gwNE9RT2dUNmEvQnVCSndGVDlV?=
 =?utf-8?B?aExPUlgxbzhnUkRpSncrcFVlWGNaQStpb05wNW93d29CT0FRUnFpWjhFbUF1?=
 =?utf-8?B?TWpXRS9KYWdySzlLWTBQU1drbEUxcC9XR09PS1dhRUdIK1dzbzdtNGp2K0hm?=
 =?utf-8?B?UlB5d2xHckxmZHdxV2lsTjJsMmNGTnRvSUQ5MGxnL3p5bjN5T0dYTEo4ajRX?=
 =?utf-8?B?czlaU092NFNnPT0=?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(36860700013)(82310400026)(7416014)(376014)(35042699022);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 08:03:20.1249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a361cb25-ebbf-48a9-6ae7-08ddb7ac941e
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10832
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

On 27-06-2025 20:19, Laurent Pinchart wrote:
> Hi Mike,
>
> Thank you for the patch.
>
> On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wrote:
>> XRGB8888 is the default mode that Xorg will want to use. Add support
>> for this to the Zynqmp DisplayPort driver, so that applications can use
>> 32-bit framebuffers. This solves that the X server would fail to start
>> unless one provided an xorg.conf that sets DefaultDepth to 16.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>
>>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/z=
ynqmp_disp.c
>> index 80d1e499a18d..501428437000 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_fm=
ts[] =3D {
>>   		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>>   		.swap		=3D true,
>>   		.sf		=3D scaling_factors_888,
>> +	}, {
>> +		.drm_fmt	=3D DRM_FORMAT_XRGB8888,
>> +		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>> +		.swap		=3D true,
>> +		.sf		=3D scaling_factors_888,
> I'm afraid that's not enough. There's a crucial difference between
> DRM_FORMAT_ARGB8888 (already supported by this driver) and
> DRM_FORMAT_XRGB8888: for the latter, the 'X' component must be ignored.
> The graphics layer is blended on top of the video layer, and the blender
> uses both a global alpha parameter and the alpha channel of the graphics
> layer for 32-bit RGB formats. This will lead to incorrect operation when
> the 'X' component is not set to full opacity.

I spent a few hours digging in the source code and what I could find in=20
the TRM and register maps, but there's not enough information in there=20
to explain how the blender works. The obvious "XRGB" implementation=20
would be to just disable the blender.

What I got from experimenting so far is that the alpha component is=20
ignored anyway while the video path isn't active. So as long as one=20
isn't using the video blending path, the ARGB and XRGB modes are identical.

Guess I'll need assistance from AMD/Xilinx to completely implement the=20
XRGB modes.

(For our application, this patch is sufficient as it solves the issues=20
like X11 not starting up, OpenGL not working and horrendously slow=20
scaling performance)


>
>>   	}, {
>>   		.drm_fmt	=3D DRM_FORMAT_RGBA8888,
>>   		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_ABGR8888,


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl



