Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885C8B407E8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1748C10E77D;
	Tue,  2 Sep 2025 14:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="YDNU/oTo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021123.outbound.protection.outlook.com
 [52.101.65.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6D110E77D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 14:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfzpEQN8wKKHyWjlsYYNhlCmPrD30o3pacQcW5u7fNsS3ikdbdp10UY2nbG4C01Vw8Cf+FTSuOAKyqV86gR3m9xMHfooMBeW2+OplNzOTTwBmArSRrNd3q5/8ZMKonvzrgPBMb3BcxuI7Q4kG0WIclHMYs/EDEDh1qGI9wXXqQ7Y2M2hHNqo1Ijt/0V9chFPk/PhqULx0TURJ6/F/x5mw9m1qXATSReIOEJuUmEVUVv7HWHko3my+Iiu3nshsqLYWmysHe99hrxlCKpnM/4AF8dojt4Pu6DJpgRxlJ6Y/9PLjZmwVOD4vzJaLVl0Dn3mW4nCCaE6AT5K2JEA/yxTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJgJqRBJUy7h+EtCSK9cGeaA2oteevKyz+pNcN2FPXE=;
 b=t2mSS28/e4r8NziOCfAMgIDz4JCUAw/DFHACe7gdMtDt6GsqfQtn2BC+lMKjKitRpyDkNXgjFoZEIGO0I1zwUHOA386DJrhfo00Ij64Rl8+Xl3FR9qRdwKrODTrBwWlBKt8SHBS2SVetioDvdpVjkq4lmbNrV8plyR3UmCBQ9Q2yELReEl+1zVpQsrc0+Lkyzw8g55KOHCLSmVt6c/z8YlUJLHb8WlocD4QUJrZSUgPFMu5Zbos0XpA6NM4Oz1mHEByahhlW5Pq3up025JMVvWR09N0zgzZ1omOtd2R74aCVQcfVVho2TKMfBrqj7sXpqLcQymEl/SmMBx5hmcHcPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJgJqRBJUy7h+EtCSK9cGeaA2oteevKyz+pNcN2FPXE=;
 b=YDNU/oTo1cj9XhBFAbg8drkGAiSHeNWHOdYGXsnjRyn3c4M7V3NRzQ9BunUkZMrK3Vy9oYQOI/9cV8Jy5uxVvzIZsiDMDlOXeYw7cSfIF9jOtuvdDxur77HXlUuc/b0BaLWrBVRKN0i0CWOimB3d2mYK5twERy/Ho242V5IKUgB267ghcitjA/7bCyEuLYbTaKG4OIQPMCojLb8T2cbDXXPEOhaoGwS+NDxxRa/A9iArd/DrQx8iiPynPCfLz29SL/HNphZqLMbcYa2409jmKO80jv5QgP0aPIOQ7dV2z0OXpwv1p0EFaQeKtIbqcpi3WId6jd+gcX6DCuur0LO9CQ==
Received: from PR1P264CA0124.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cd::18)
 by AM9PR04MB8145.eurprd04.prod.outlook.com (2603:10a6:20b:3e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Tue, 2 Sep
 2025 14:52:52 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:102:2cd:cafe::61) by PR1P264CA0124.outlook.office365.com
 (2603:10a6:102:2cd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 14:52:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 14:52:52 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com (40.93.64.7) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 02 Sep 2025 14:52:51 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from PA4PR04MB7790.eurprd04.prod.outlook.com (2603:10a6:102:cc::8)
 by AS8PR04MB8101.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 14:52:49 +0000
Received: from PA4PR04MB7790.eurprd04.prod.outlook.com
 ([fe80::6861:40f7:98b3:c2bc]) by PA4PR04MB7790.eurprd04.prod.outlook.com
 ([fe80::6861:40f7:98b3:c2bc%4]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 14:52:49 +0000
Message-ID: <dc073509-57d9-4b57-a53f-cd285bff8eae@topic.nl>
Date: Tue, 2 Sep 2025 16:52:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
From: Mike Looijmans <mike.looijmans@topic.nl>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250901142958.843678-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.edc18686-244f-441e-a6ac-0b62492b96c8@emailsignatures365.codetwo.com>
 <20250901142958.843678-2-mike.looijmans@topic.nl>
 <20250902-hasty-spry-nautilus-c05c6a@kuoka>
 <e007ee80-2eff-4859-b2e3-402950081b4f@topic.nl>
 <ae28c7e0-6ea1-4a0a-b923-d3906d71141e@kernel.org>
 <fccbba0a-cb8f-4d71-9c91-7558cfaa8ef7@topic.nl>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <fccbba0a-cb8f-4d71-9c91-7558cfaa8ef7@topic.nl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0184.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::21) To PA4PR04MB7790.eurprd04.prod.outlook.com
 (2603:10a6:102:cc::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PA4PR04MB7790:EE_|AS8PR04MB8101:EE_|AMS0EPF000001B4:EE_|AM9PR04MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7da9c0-7020-4366-d031-08ddea306497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?bEM3cGlCaWFnb05Eb3NLYUhieFlHMjRrczAxQllUMXZPTWRDS1Q2ZmFEeVJ1?=
 =?utf-8?B?MFpqMHNIQjduSUpOOVJLelNGdDZ1aFRwWmQrcy96RU96YUMyMS8yMGZMUXZv?=
 =?utf-8?B?M09kTGlGNllqTmVyby9uREZ4eGcwRy9oUUN6TlpEdVlIVXc3M0Y1QmRCOXVN?=
 =?utf-8?B?K0kwRjlUajlPNVdMdDNxK0FhUUN6eVBNc25vVDNpK3FKUHNYVEJJem5SNURy?=
 =?utf-8?B?VDZwRGl0ZTFJMzUwNjRseDFudXRIVW9NWEJRa0MveE5CaGJ6NUF0OVZGV0Ji?=
 =?utf-8?B?ZGI0VEcwamwwM2JWWWduRjRBZXVVK01zbkJlQjJ1M2J6dXVHT3JlZTI4SkVU?=
 =?utf-8?B?eVN5bWc4TDBCbDlBOHl4YVRrUzZSdlVmdG9XQ0dtR3ZNMU1wOTBlVHZZbnBm?=
 =?utf-8?B?ZHVTTHh3cFJyWlVtYW1NOHczQ3J0aHhjcTJNbFJxaGtNK0pLUXRZNXdiVDVG?=
 =?utf-8?B?L2ZFeWM1SHA4YUZNNTA0SnJFUmxxd3B5M2N6TmVKY2I0bm9JdlZuT1ZzOXFX?=
 =?utf-8?B?NExTT0RKWnhISGU2VU1pL1VxY1VXWmFXUGZZdEdkd3VZbURsYWpQaEFLMnYv?=
 =?utf-8?B?ODVFNHZ0TCtVYk9iWTAzUXFCazlqblQvdXJ1cE1CZEVLS25ubFMvLzNrV080?=
 =?utf-8?B?Z1VrTDRuL2dLUmhaUjdWZ21qMXBIbVl6Wkdjam1ZOHFXeUdQMlNKaTEzOVQy?=
 =?utf-8?B?OEtzb05hQW4rMEdhYUNVUkR1YWZGNUlNMjFuS01kYktGYThPc3c1RWRsN0Nu?=
 =?utf-8?B?WFQydkdQYnIwWkQ4cjNFakhXeWZyZmhsUjd0ZmNjUDNPQ1hiV1Zpemo1dVYw?=
 =?utf-8?B?OW9GSHM3dTBldjNXNmc5c1RHQWJKUDVNa1AzdUJuMGxMeHRxMTNlTHlySFda?=
 =?utf-8?B?TkZiaGtPUHh6UjBJVU54T2FmdVM3WFZLMDc0NGhDTEVWYUg5MGM3MmtnNWhR?=
 =?utf-8?B?UjNBcVVkdkdNU2gvdVIwNFNCY1ZKVktacGpIWHZxUTlRMG84ejdqU0hUZjdP?=
 =?utf-8?B?a2poSE9ybi9USGYwNW82eEhsNG1GRmdCZHlTc3VaeW83a0RQVURkcnovclJD?=
 =?utf-8?B?eHhud1NWc25hRnFOYzI3b04yNkhUa2xKT1Jndk4yemFZYjBnTVd2RnNFZzVX?=
 =?utf-8?B?aW1nVitkdnVRanBhdmpLdzJBTVcrckZyRG95b2t1WFFpZU9qempkTXNNZ0Vp?=
 =?utf-8?B?QmVic0llMmlyZmp1VERUcHFkcEEvU1Z1WGsrY01Sb3lsR2w5NGlwa21YNzVo?=
 =?utf-8?B?eG5mRVhvNlo4cGNoMHdVcmQ5UXNqd0h0anpHTnZ5bXRMVGU1ZFdsamUxaW1i?=
 =?utf-8?B?RGlUK0hCamkzOVdLZHVUTkRZSlM2NnZ3ODVsNW1iZWhFNjZzOTNOR2NmeXho?=
 =?utf-8?B?L0pZZVNUL2VISk5PRHkvVThBQnkyS0syYldKWEIzL1F6U05yeXI4em4xaWts?=
 =?utf-8?B?dWNITU9ONEExRzBFWHl1QjFEZHpPUXI0cEJ4NWFzZElHTmlEcE5FYVJsdFRD?=
 =?utf-8?B?MlJsQ0M3dENOdWxoSWh2NDVSK01QWXR5c0FoUFI4NXRWdmZ1d3E4dzB1QU1T?=
 =?utf-8?B?dVVKVm5xOU5QT08xa1dFSHJoeEdBRUlpRUI4K1krcVhlRVBPR0RwNGVCOE10?=
 =?utf-8?B?NEVKQjB0YnZzNzYxT1E1RVlVOTlocjRHanpiMGl2NWZnTG1HNnRJeTB2TURh?=
 =?utf-8?B?SHdySFJnTTRTbEFvWTU1SHI5emZpU0FOL0k4cWRVcDZQdGg1bEFuQnRKNlBq?=
 =?utf-8?B?Ykc1K2UrTEk4R2Q5bGYrN1owQzBudTcvZWVVbVJva0tQMXhHVzIzZDhTQ0hG?=
 =?utf-8?B?RTdpS0ZJaU5QaUdvWC9ZYTd2S2dJUmRPYmxmK20xeTZaQTV4YzJLdThvOUxl?=
 =?utf-8?B?MjZ1SEc1MDBsa2Niem1oRTgyVjVocmM4WU1YblBFbkpyWmxaMDBaSUZqc3Qr?=
 =?utf-8?B?SUVEc2cwZjFFSzROOEVrdE4rVkRFOVR6UG9obFh0dlZyUE9LNnNYR2tTMFZq?=
 =?utf-8?B?QmxUdjhMMW1RPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PA4PR04MB7790.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8101
X-CodeTwo-MessageID: bf2a01a2-fb06-4ae4-9867-c855a5e51381.20250902145251@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ff3cc69a-4d5f-42c7-235f-08ddea3062a8
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|14060799003|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUFMa3E1c3lacGEwMi9QL3MyZ1FYbE54RjRVblQyUFdieTd6WnNFN2lGMVBU?=
 =?utf-8?B?bXpyNVF1RkhTZ2tTVlJjTkptbGJMUGVzVFZNZFZhcnVjMlRsMElCQzdvK3BX?=
 =?utf-8?B?UVRQb0xaamhyUHZyNDA3R291UlhNYnFTNkx0L0kxVTRnZVpIL0VNMFYvL29j?=
 =?utf-8?B?Sm1OaE5sSndtYU03Q0V6di9oNmlVMC9aSmVHUU5HMjQydjQ4ZVl3Nnl6NXp6?=
 =?utf-8?B?YnZic2lzWit5ZkYzK29HQTMwWnVsZ2tIaWxwOFZtbjRqMjVIaDRMdUE0a1J3?=
 =?utf-8?B?OFNPZGxiaHcxY25uSGRIUnBkVFl2dFZyQlFJSVZ2c0FJQ3FHM3k5S2FFV0hX?=
 =?utf-8?B?eGFtT0UvZFhXUDNuYjBkbVBWekR0TjFCbjM3bW1pdlRMQ29Od1YrTzRaSEto?=
 =?utf-8?B?VVVwVTR6dFgzSHRhdlgrVEh3clVpb0VzTEFFUTJxV2tDTW4yUDlidjJLNnNK?=
 =?utf-8?B?bDM5LzVrd0g5NFRrWFF6T2dBeVhmOHVMM3QzVTA4Umc3SkVkY3VNL1NwRHNB?=
 =?utf-8?B?cTk4bFlTYVNlejJKZU81RzV0STFNYjlPSTd3QktjT2tTcktqUEx1M1cxQno4?=
 =?utf-8?B?U2ZUcVFUekFNMGZkcWdvREx1S3ZwTzBSUnp0UGphekFwOUU1cWs0NFdhVmhx?=
 =?utf-8?B?MWFwMVN5REJsUDFCeGdxVENBTkRiUlg0RE5JNGJJS2NQUmt5RUVmSjRTZkly?=
 =?utf-8?B?WlU4WUdpZzZxNjRaOElIQ1FneTBab2F2Q1dWckxMYnl0SW4zL3ZTUUtOZ0wz?=
 =?utf-8?B?YW84NlQyaUZxa09VMWVNaWQvNTAzR0hNK05oZDNraXNDbERBN01reFpTZUM5?=
 =?utf-8?B?azlHMmcxSXBPOTZZcDk2L0UrSEV6OStwSFlHY0M3RkpXZmt0b0xoVUZoVmo2?=
 =?utf-8?B?alB5WUo2Sk53aS9OSVVDZGd6b0Z2TC84NXQ3OGQ0YzJGbHZLM0VuZC90U0hw?=
 =?utf-8?B?SU9NZ2pvekszWkIxajhXRGY2SXZRdlVOWmxzdTQ0bE0yUWp3RFlUMkh0L3dE?=
 =?utf-8?B?ZlhFTmd4SEdndVRIMUVSTHhRRU1OUEFDaWdBSXEyZUg1UmJvb01tazZ5LzRG?=
 =?utf-8?B?ejF2eHdtWGVQOFJMMm50YjFsVEltWm9XTmJ0aFFHUXk2VE1Lc2Y4WWJMQUZh?=
 =?utf-8?B?bGJ0SEU0c2dCMVpMeVhPcHViZW5PYXFrRE94ZHJ1dnM2ZlhLWTFrUFRBeWxv?=
 =?utf-8?B?T0RMSC9OVVlLem4ybFBoMkVSdFhCOUJUcGFJaEpmUVN0ckZNMzVtT1NPSG1Y?=
 =?utf-8?B?b0g3ZlI4a1B5TU9TMFBWMU1MWUd0bmRRRWpKaG5HMGl6dmU2ejNMWnp5aDg1?=
 =?utf-8?B?bUxUNnFyRy82UWhnYThkTHZDdGFRUmFqaHFVSHRRVFNqKzhmaktKdDEyNitJ?=
 =?utf-8?B?Qy9DTi81NGtGYk1sbzZLazJYcmxZYkRqYVZRMkhpa3YzSGhxelU1eVdLUFFt?=
 =?utf-8?B?TmFScFlzY3dwN1UyL1hTZlNURXB2c2hQazBBOXRhY2p0ZWYzaXlmMDg2RW1M?=
 =?utf-8?B?YmZIaHJNeTNwZGwzMkJaWVBQTkY3QnNLMlZUV25iV3AzbnVTdXNFQ2RCd0Fx?=
 =?utf-8?B?b1VYR0xSaDg5aXhrcWRqT1gzQkRFRHRTclJCYnN0eTVwNEtmY25LUlJUeXFp?=
 =?utf-8?B?SWx5ZmFpOGx5ek8rSzVEZlM4NnFjTWNxb2ZNbzhYVzRrcm1FczdBcmQwanJo?=
 =?utf-8?B?cFRkL2NwRkQ1czJscEprb25sM20xZ2x2Qy9MTEc5OXAxNzI4b0VibHpHZGRy?=
 =?utf-8?B?ZTNvelpwMno1N1RTM3hra0JTa0c4Q0tNK1hBQ1FmZ3lkWHo0cUV1WW1Rc0Fa?=
 =?utf-8?B?VGthOC95MVZ5V1lvRHBKeUxydU4zYUVsRWo4V0JoVGZmK012RVVRdFhUVUlq?=
 =?utf-8?B?L294anBMcVM0MDZZMmVCdWw0dzB0bnNMZXRVVTdFUmZjUjV1NFZ0QlVxRVZj?=
 =?utf-8?B?VnBnOCtHQlVjdVBWSDZ0OGRyNFI4Si9BWEY4VnBZbkhUalR3T1BPdCtCQlNP?=
 =?utf-8?B?UThBYlVCZVVMTGpWaVgwVmhYY2ZLRU5SaHZVM0M5ellHd1VjOFdWSWdxQnJl?=
 =?utf-8?Q?WtNnMF?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(14060799003)(36860700013)(82310400026)(376014)(7416014);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:52:52.3002 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7da9c0-7020-4366-d031-08ddea306497
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8145
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

On 9/2/25 16:41, Mike Looijmans wrote:
> On 9/2/25 15:46, Krzysztof Kozlowski wrote:
>> On 02/09/2025 10:46, Mike Looijmans wrote:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 endpoint:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $=
ref: /schemas/media/video-interfaces.yaml#
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
nevaluatedProperties: false
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port@1:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/graph.yaml=
#/$defs/port-base
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unevaluatedProperties: fa=
lse
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: Video port f=
or HDMI output (panel or bridge)
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 endpoint:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $=
ref: /schemas/media/video-interfaces.yaml#
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
nevaluatedProperties: false
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 required:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - port@0
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - port@1
>>>>> +
>>>>> +=C2=A0 ti,source-mode:
>>>>> +=C2=A0=C2=A0=C2=A0 type: boolean
>>>>> +=C2=A0=C2=A0=C2=A0 description:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Force chip to operate in "source" mod=
e. Allows to use
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a TMDS181 chip (which defaults to sin=
k) as cable driver.
>>>>> +
>>>>> +=C2=A0 ti,sink-mode:
>>>> Aren't these two mutually exclusive? Can same device operate in source
>>>> and in sink mode simultaneously?
>>> They're exclusive, yes. Will add that.
>> Then either define constraints per variant in if:then: or maybe better
>> use string enum. Not sure what applies where, so tricky to say which
>> choice is better.
>>
>> Best regards,
>> Krzysztof
>
> Since there's already going to be an "if" block, it simplifies parsing=20
> to keep the booleans. My first attempt was this, but that doesn't work=20
> as I'd expect. Adding "slew-rate" to the example dts results in an=20
> error, so apparently the "if" block doesn't do what I think it would=20
> and I haven't figured out yet what the correct syntax must be:
>
> if:
> =C2=A0 properties:
> =C2=A0 =C2=A0 compatible:
> =C2=A0 =C2=A0 =C2=A0 contains:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 const: ti,sn65dp159
> then:
> =C2=A0 properties:
> =C2=A0 =C2=A0 ti,sink-mode:
> =C2=A0 =C2=A0 =C2=A0 type: boolean
> =C2=A0 =C2=A0 =C2=A0 description:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Force chip to operate in "sink" mode. Allows =
to use
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 a DP159 chip (defaults to source) for incomin=
g signals.
> =C2=A0 =C2=A0 ti,dvi-mode:
> =C2=A0 =C2=A0 =C2=A0 type: boolean
> =C2=A0 =C2=A0 =C2=A0 description: Makes the DP159 chip operate in DVI mod=
e.
> =C2=A0 =C2=A0 slew-rate:
> =C2=A0 =C2=A0 =C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> =C2=A0 =C2=A0 =C2=A0 minimum: 0
> =C2=A0 =C2=A0 =C2=A0 maximum: 3
> =C2=A0 =C2=A0 =C2=A0 default: 3
> =C2=A0 =C2=A0 =C2=A0 description: Set slew rate, 0 is slowest, 3 is faste=
st.
> else:
> =C2=A0 properties:
> =C2=A0 =C2=A0 ti,source-mode:
> =C2=A0 =C2=A0 =C2=A0 type: boolean
> =C2=A0 =C2=A0 =C2=A0 description:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Force chip to operate in "source" mode. Allow=
s to use
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 a TMDS181 chip (which defaults to sink) as ca=
ble driver.
>
Hmm, apparently one cannot "add" properties in the "if:" block? The=20
opposite approach, disallowing properties, works, e.g.:

if:
 =C2=A0 properties:
 =C2=A0 =C2=A0 compatible:
 =C2=A0 =C2=A0 =C2=A0 contains:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const: ti,sn65dp159
then:
 =C2=A0 properties:
 =C2=A0 =C2=A0 ti,source-mode: false
else:
 =C2=A0 properties:
 =C2=A0 =C2=A0 ti,sink-mode: false
 =C2=A0 =C2=A0 ti,dvi-mode: false
 =C2=A0 =C2=A0 slew-rate: false


This produces the wanted behavior, though it looks counter-intuitive to me.


--=20
Mike Looijmans



