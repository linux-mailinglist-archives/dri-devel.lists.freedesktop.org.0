Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFFEBD387F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D3188697;
	Mon, 13 Oct 2025 14:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="vvcQ7Tl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023141.outbound.protection.outlook.com [52.101.72.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02FB88697
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:32:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1ycHP59l4xQF3WEbZipXtYpzl6/Co6SMTRURhRH7pOAC043yhEKx3jRrqIBtu4XjVhKmOlCy5d6NoObGrpU4Bs0qFMdRekpWmEl/icVZZwA7IP1dKFbW2ixtrh/7DK/+UmmFEUBshxTysic2c2xeTr46Im2GNs+e434Z8ficTQ2qUeBj09C52oU5jfcgt/aXAY3jtHoJ6cLHBfM1vkb/+goHp/gx2v1SooLHGNJeSPafiaz9XkcKdGfM9LrXhuNW4zrUqgAfr1urSOmlnAMaAYD5LhYY7GHvLGLNHIgfgCO/9BxBhimvvmYrO1n486P9RIJlPxt7Reygtvab4rUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/c6zp4q7pdHUZU/0xoW7b2wYM3+TjWRLx9XLUbUHMM=;
 b=humNVkhIRbRHzaavKC+EpLvZwxOYUFl4uqBoX6Z73qiyoBsRU0oacBj8Hrma6QPV361jRSgK0vlz+mN1ZmSGej/65pSLoAcO1SDP1k2J+6IW6YqoVslyPyaO4uQmB1YMglzM6MLAh4Ro9yVktu70vJMjoHw0VWe/MCOaydL4GUMyRe7gWz+miBxEWwGv8T6wm5WeIS1z1BQwscGM7M+08NFWs79+qzOi6/UINK+lbJS8Oa9oC5HXKNhNwE0P603ILvJS/7oBs4aZWphukYPoLcJH9AUnl7po0aLHioAKhTtIc9kLHHVj2CPxxGI/CK2GnIiapnxjbUPnFXZbU60aAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/c6zp4q7pdHUZU/0xoW7b2wYM3+TjWRLx9XLUbUHMM=;
 b=vvcQ7Tl98vYAp7WutOCgsB+9aHGR2rd6ezxpJwPsBHuiKCIi1jOLgj5LDFMqSopXaFskSaZSfy3o5ID4NCk9P6S8wAQHqBL7dcmlaC4R4IokTgMFaZZvEWogCMEc+cn0RJh21MhwQKVRjM0NSF88ExbxLp1a8uh6PBsEhZotn4sXP2xhqvwgybt7M7p+5/U4GV4lPrfTjenzhm1L697lFkgvkKy7SchA0S1Ok132iLwI6vcD1moeTS25gMAUEprSqAmIaHDSBQUY08tZsi99iPci4ZrTeblATXnZsbdfOYvbcGKmqIHk1REBsBEvD7NofBJa+l3MvsrvcFXbsqOEAA==
Received: from DU2P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::24)
 by PAXPR04MB8094.eurprd04.prod.outlook.com (2603:10a6:102:1c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 14:32:42 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::c3) by DU2P250CA0019.outlook.office365.com
 (2603:10a6:10:231::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 14:32:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 14:32:39 +0000
Received: from AM0PR07CU002.outbound.protection.outlook.com (40.93.65.67) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 13 Oct 2025 14:32:39 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU4PR04MB11755.eurprd04.prod.outlook.com (2603:10a6:10:621::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 14:32:37 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 14:32:37 +0000
Message-ID: <13cbad78-26bd-4dd2-98f0-34bdd409203f@topic.nl>
Date: Mon, 13 Oct 2025 16:32:35 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v6 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20250922121902.88664-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3ef2b90a-ff78-413f-b853-99ebea0afc4a@emailsignatures365.codetwo.com>
 <20250922121902.88664-3-mike.looijmans@topic.nl>
 <y6idr5f7cqtkls3oqnzaoc5u5zvrqns3xdl2ijyxegxvqgph7r@6hkc5zc6urql>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <y6idr5f7cqtkls3oqnzaoc5u5zvrqns3xdl2ijyxegxvqgph7r@6hkc5zc6urql>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P191CA0047.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::22) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU4PR04MB11755:EE_|DB5PEPF00014B8C:EE_|PAXPR04MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: bc8b6cb0-904d-46f4-7417-08de0a655cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZVNOMk5iY25zM3FscWY1eUR5VjVMS3VyeE44cUMzV3l4MStPaUZBUzdWaGl0?=
 =?utf-8?B?VlVRS2xvQkxickFnVlNueHl6dVdNQSs0TURyTC92V1F6WFdmTFVSKzNoTU1Y?=
 =?utf-8?B?VmdTMlE2TS8wY2xUWVRHdzJ2cDIwS3NRZFNsdTlySHFZYUJOVDNKTkNQcCt5?=
 =?utf-8?B?Rk9nYngwb01LQzR4M1lFUElKTkdhRTVseGtEZEZrRjhlU2o1SE1Sd2xIVm1D?=
 =?utf-8?B?MmJBcitOOEo1WlhVODkyOVdEb0hHR2pWMGhXM1U0UUJ2blNpNjllSmxFditp?=
 =?utf-8?B?dHY5R2xkMHlZRllrY21rd0hreEdWbVZrREx6M2JpYWJZeUpsNmJiblZ2STZO?=
 =?utf-8?B?amoxd25zUWJUUEZWdUEyRnNZS1loMUdNYmJKbzEyWFFFMy9vUmQyczZHTCtR?=
 =?utf-8?B?VlFiR25URStBV2E4NjByRWVhVEtVRUpQQjBzeEk5Wk5NeWhwS0VqdEI2MWRY?=
 =?utf-8?B?NWt4ZXVteG5ZMXVtNVNwVzBOZmt3Q1dEZ0xWckFwdmhrc2w5Sk9OaFpRZ1NV?=
 =?utf-8?B?N0xQMlBuQzZ2SlJsaC9KTThxaXh6bDU4V2h6UVYxbytLMEJlU0hYR2R1Rnl2?=
 =?utf-8?B?bDMxeHVuWnFrLzlOZThOMXBCR0tYbmFDZG9oLys3b0pWa0pNTm5sL0VuaUNu?=
 =?utf-8?B?R3dRMUROTDJwaXhMMTc5WFE3WWVIVWRJSGk3bXlGa201cGh1NmZhMXQ4ejcy?=
 =?utf-8?B?d2M3ZnpHSHB4U1VyeVR1RmFtUVo0MEJac1BwRk1GOU8vV05oSjBxZ0ZFV3Ir?=
 =?utf-8?B?MC9CY1BNdTgwZnlqY1ZMa0ZVeVM0U2NKaFV4L2VZc3YyYVA3Y0J2S0xoZGZC?=
 =?utf-8?B?YWZVWGVZZVFWUksydFJ0Tm4rR3hSU1Z4T204UjAxR3lwUEFCVlVwdE0rZGZy?=
 =?utf-8?B?OTlXYTI1T0NQMUYvN3MwVDBhTnh4ZVNyL2xYK25SWTYwQmVwUGRndVg1TjY4?=
 =?utf-8?B?UkVCQkxxNTRLdG1uMHRnU3pkREhIbWFZT2FCT3pNVlBVT0Q1Y3Zkdmd2dDlt?=
 =?utf-8?B?S1FnU0tCL2VsYU9BZFJjeU9ldEk0cXRLeTBPS0ZqclJLdVJlb3JUZUpFLzJk?=
 =?utf-8?B?dzNXUi9mRjR3S0tjSThhNkJoeW9BQlppciszc1JzajdlUVhrODBCTE1uenR4?=
 =?utf-8?B?WWRyTU5ocURkQi8rSVVVQjdFSHVhOGM4amVXaEhCSkw0b2JIVjVYMEQ1Vk5t?=
 =?utf-8?B?RDcvd2dPUGlHeE1CRW9GNm9UQ0lYNStGdnhPcElCbnU5SVhGV0dTUFBZYWY0?=
 =?utf-8?B?MUdMR3FpMkVhbnU2Z0NiQWhYaWdsV1ZCK2ZqWXBiYzRqaGlJbmJtMXMrY0Fz?=
 =?utf-8?B?Y1VuY215Tkh1Y2NVVUliRWFsWHdlbCtPSFVza1BwK2lSNk53TlA3dmF1MDA4?=
 =?utf-8?B?SStkR0IwTThXMDBPemFlVEtnb2hhL05NbFhMU0M2a1QvN0RscnpSLzd3RFAv?=
 =?utf-8?B?M3FTZlFnVXJ6K0lNTVRpcCsyY2poOHJWTFdVenRBWGsvazMxMG5mSnhhSVRS?=
 =?utf-8?B?VmZmbmt2YTA4NG5kbTNtL1BvMkkyd3BiTmxpVCsrZDFFcUZ4ZW91UTdKK0kv?=
 =?utf-8?B?M2lRandOa0F4ZVREMnIxeWJNU1dWTWJ1amx3TXVjb2FoNm96SWo4QkdwTnZB?=
 =?utf-8?B?L3lBdTE5UE1NaXpjMm84L1VKc1RpcE43NGZBaDVabU5GZXkzNXhDV0twaHZH?=
 =?utf-8?B?ZDRHUEFlVGxqbkxFTVhtVkJHWWxmWGxQcitUb3MvNXloRUhUMWVYVVltVUZa?=
 =?utf-8?B?ampEZ3VmY3lvUXdoTklIZExhTHFiTDhhNVJJLzVhcnlRYkE1Vko5TDdNSFcx?=
 =?utf-8?B?aFRMVGZCVXRlaExwOEFEOHhONU1VVGZ2bjVGTnB6amUzSTVCem9tbzJqSmE3?=
 =?utf-8?B?dUhnSHZFdXhvcndQVEtwaC8vS1FsUkdsZ3ZHaWVxNGc0QTFPWkdkZkRTR2Zl?=
 =?utf-8?B?cVgzTUhUQWljMjNKYjBtcEFxL2tYSFFQaHFSYU56dDZlVG1tRUhBTnA3c3pE?=
 =?utf-8?B?eDE1YjF0ZmJzK0Q1MlZJOEk3SXhlelp2Ky82Q1VrVytxRHc3Vm1keXdVWEVI?=
 =?utf-8?Q?BwokNU?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11755
X-CodeTwo-MessageID: 0a0e1dd3-eee9-4bba-b0da-24bc883d7204.20251013143238@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c3fbc98c-a769-4ff9-bd7b-08de0a655b33
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|14060799003|376014|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHIzUFFXcW9Gb3JQcFkzTVlqTVY2YmZxQW5scGVoVXZaK0szamJLMHpVZkYz?=
 =?utf-8?B?c0xITVBUVktGVEs2YXp1QTg2VlpPK3h2Y0VMMFBKcUpYUzFkVnAxaHFuM0Z2?=
 =?utf-8?B?U25kV2JGSWRqVjAvREJiZjdnR3A1Q3ZuTGJXdkRNUkIxWVFZRzREaDlBeWs1?=
 =?utf-8?B?UjRubVdrQVhjTmlOVWc4VTMrZytGcGNHMXdPekxWWEx6T0JBOFE5NE0ranIz?=
 =?utf-8?B?Yi9wK2FUcndZZzJVeUVmSWF2NXRGMnhMdklVVUhFTEU5bUM3ZmR4elB3MTY0?=
 =?utf-8?B?eS9jVFJoVzFlQ0kvWUNPckVvRkh3bEp2cHIvVWNCRDF1bk1vTzB1QlFhZnEw?=
 =?utf-8?B?MFNYUUk0Mm1JMnRzVy9NbXFHcUpBMDAxVDFJMC9TK2FVZGJsVUNjZjQydjJs?=
 =?utf-8?B?OEhmbkxmNEdVSXM5VmdvVEsyVGs5Y2ZsQ2NZY1M3ay8wMEFKZE9tZzhrZTBH?=
 =?utf-8?B?TDZyOTU2czUxbFRDMTM1OVd3OXVzcGRyRmYwcHpSZHJvMHhsNkhQQVd0RTRO?=
 =?utf-8?B?RW56UitkNEtUMVo4ajd6RW84b0dvbm1lNWFYWUQyT2xVWld2MHJGNlRESWR3?=
 =?utf-8?B?QjZZRkd1WUsrZkRCRDZSSTByZE5Bc1BLanhBTkNLRkRsLytpRHY2M3dhbytI?=
 =?utf-8?B?aWNzQjZTY3dsOGlaZnF0YkVKcTltVEliRWtPVEJCYm9KdnQ0SlNvYi80Nnhj?=
 =?utf-8?B?N2xqcE1DcktUV1F2NEwvUmF3RTRtWEFiY2ZmSWlVRWdXQjU2UTN0WFltcVA1?=
 =?utf-8?B?ekxGTW9lQ2lrZDJBWU55Z0s1dWF0T1F2ZE9veGg4TVBGbmxMaUlScmE2clVS?=
 =?utf-8?B?dE9HWUFDS09QeTN0Q0tqeWc3RjhTN3RGdUhqOXU3WXNka28ra3labXFjNktq?=
 =?utf-8?B?MmJtSWFuaUpnVW1aNU91ZFVpNTVhOGpXTUVZNWpCV2RsTFRQcEJBUFBFSm1p?=
 =?utf-8?B?TDNoVUpSMEYrSzUxUlUzV05PVFdCNnJyQjBNd1lQdTV6c2VVQ1hvVzNwdnBU?=
 =?utf-8?B?SDlRcGhlMzJEYmZ6SUFFL1pPK0lSNlZmMEo0MGlybFJJSHBwc3R1Z3FkWlo2?=
 =?utf-8?B?TW9yRThmT3QyWklxZUQ0eUVMZTFrem1UaWxZaldIOGl4cURxYzN1REpnSzRi?=
 =?utf-8?B?NlppTExOenRMY2c5WXEyVTB5aEZqR1ZDcDhGR1pPdzBRdVFJTzlLdndOY2Iw?=
 =?utf-8?B?d1ZHZ2tzNmpEZGIxVlRUeVYwc1FKb3BtMng5NHE0RjU0MWZTVG1kVExqTGNR?=
 =?utf-8?B?cUxsaDlaKzU5WnY4cEI5NjAvR3o3TDVFbmczMStyYVhkTWJsVUJKZk41MTA1?=
 =?utf-8?B?ZjdtUnhtYzZwekozR21BRktSQm0vYjI1R2RlcUVWblRyNm1BOVB5dVJtQ2k0?=
 =?utf-8?B?aTA4c2tXdEZuTWYrL2RMeGd4QVEwTGdQVE1UeTdpMXlNbFZFV2trVHhyQitQ?=
 =?utf-8?B?dmZTQlhZRjY5Q3l5QUYvYk4weWtCY01QSW9HWjR5ZlhxdE5CbnlKbzZPaDl0?=
 =?utf-8?B?eXhsN2hwaG94VFZFQmk2a2hXNS8wMCtPSUcwQ0ZNNzUweEpZSm0yV2tzdGw1?=
 =?utf-8?B?cEl0YkNOVVhTR0JHRVpaZ1k2dHVCVnBRMnhVWGpaUmE5Q2xKMWoyMDJaaWpj?=
 =?utf-8?B?aEtWU0NicllhVnJvbEZCUTZWZklEdDJGWXY5MHgwREFsOVQrRzlCeVkxS3E0?=
 =?utf-8?B?UEZDVWR0Wm95RjZPeGZLampyUnQvQXNGNStHdEtBNXZ2YlM1UXdTYlh3eGpE?=
 =?utf-8?B?WlBrWTZYZVkvSkpsYVRtTXpibENqY3J2R3E5RTQvb0MrVElTME4rOE9DQzJv?=
 =?utf-8?B?cXJiNEJwOUNPRjhMMUNzakwyLzZRc3NZRFh0eU1JYlNZUFJPRVpSbWRrZzVN?=
 =?utf-8?B?dUFPLzZydUU0NWhNM3hEL2tTRUE3Y1NubWVNdTBaMTdubGVIU1lKVXhaaWRh?=
 =?utf-8?B?Qkp3b3RPbTJoVmZ6NlZ1b2k5VUdKMGk5SEcrakhBcXpHZVBYQ0dickJ0L2tq?=
 =?utf-8?B?ZFh4VVF3aG5IRkZUTW5BQksxNWlJTUdVZFo5QzMzYVh3bnJDeEJkbG5QTUgx?=
 =?utf-8?B?djJaUXErVUY3anJuNEN4TVlxMmppS0gzbGt1bUFQMFVNSzV4NVVESituOFMr?=
 =?utf-8?Q?pPuQ=3D?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(14060799003)(376014)(36860700013)(7416014)(1800799024);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 14:32:39.6837 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8b6cb0-904d-46f4-7417-08de0a655cdf
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8094
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

On 9/25/25 05:51, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 02:18:45PM +0200, Mike Looijmans wrote:
>> The tmds181 and sn65dp159 are "retimers" and hence can be considered
>> HDMI-to-HDMI bridges. Typical usage is to convert the output of an
>> FPGA into a valid HDMI signal, and it will typically be inserted
>> between an encoder and hdmi-connector.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>
>> Changes in v6:
>> Add DRM_DISPLAY_HDMI_HELPER to Kconfig
>> Change "ti,mode" to "ti,retimer-mode"
>>
>> Changes in v5:
>> Really added vcc/vdd regulator support
>> "oe" gpio is now "reset" (reversed logic)
>> devicetree enums ti,equalizer and ti,mode
>> Always disable HDMI_SEL (formerly "dvi-mode")
>>
>> Changes in v4:
>> dev_err_probe, this_module, of_match_ptr
>> Use fallback compatible
>> Add vcc-supply and vdd-supply
>>
>> Changes in v3:
>> Lower-case hex values and use defines for EYESCAN registers
>> Remove equalizer code (unlikely to be used)
>> Remove attributes (no longer useful, undocumented)
>> Fix build for 6.17 kernel
>> Use devm_drm_bridge_alloc
>> Sort includes and add linux/bitfield.h
>> Check chip type and complain on mismatch
>>
>> Changes in v2:
>> Use atomic_enable/disable
>> Use #defines for bit fields in registers
>> Allow HDMI 2 compliance
>> Filter modes on clock range
>> Use cross-over pixel frequency instead of manual overides
>> Devicetree bindings according to standards
>>
>>   drivers/gpu/drm/bridge/Kconfig      |  12 +
>>   drivers/gpu/drm/bridge/Makefile     |   1 +
>>   drivers/gpu/drm/bridge/ti-tmds181.c | 427 ++++++++++++++++++++++++++++
>>   3 files changed, 440 insertions(+)
>>   create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c
>>
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kco=
nfig
>> index b9e0ca85226a..d679180b05b1 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -430,6 +430,18 @@ config DRM_TI_SN65DSI86
>>   	help
>>   	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
>>  =20
>> +config DRM_TI_TMDS181
>> +        tristate "TI TMDS181 and SN65DP159 HDMI retimer bridge driver"
>> +	depends on OF
>> +	select DRM_KMS_HELPER
> Do you need it here?

Yes, compiling a kernel without it results in:
ld: drivers/gpu/drm/bridge/ti-tmds181.o:(.rodata+0x2f8): undefined=20
reference to `drm_atomic_helper_bridge_duplicate_state'
ld: drivers/gpu/drm/bridge/ti-tmds181.o:(.rodata+0x2fc): undefined=20
reference to `drm_atomic_helper_bridge_destroy_state'
ld: drivers/gpu/drm/bridge/ti-tmds181.o:(.rodata+0x30c): undefined=20
reference to `drm_atomic_helper_bridge_reset'

>
>> +	select DRM_DISPLAY_HDMI_HELPER
> missing select DRM_DISPLAY_HELPER

Will add in v7


>
>> +	select REGMAP_I2C
>> +	help
>> +	  Enable this to support the TI TMDS181 and SN65DP159 HDMI retimers.
>> +	  The SN65DP159 provides output into a cable (source) whereas the
>> +	  TMDS181 is meant to forward a cable signal into a PCB (sink). Either
>> +	  can be set up as source or sink though.
>> +
>>   config DRM_TI_TPD12S015
>>   	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
>>   	depends on OF


--=20
Mike Looijmans



