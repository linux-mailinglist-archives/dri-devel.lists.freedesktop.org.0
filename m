Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE4A9F79A7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 11:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6767A10E48B;
	Thu, 19 Dec 2024 10:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="NeW2C9HT";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NeW2C9HT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2612::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5299610E2BB;
 Thu, 19 Dec 2024 10:32:33 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WXrEo44p9vsaMu0zw1QJ3o8w+PpCoK+SDvBLpKDx1WlvsOCgsy0xlxTHVtDNSKtgN+CsWMaoYw8v+o4YvlQxCrWiqLMSO52QG+W+bWophROorwqmX3p+/daPFqDhigiabtO0d622hkITiYPTboCdjn9vFZoqWjCBG7yjc4rqq5r01xCEpjqTny7PsNpcCDtcZUGgzXwWwaMhk1pwJH87s+WR6pQlySFegGbLa86fvKmVuIstE2eef5EP0K/iqEVJFeI8rqKITmkWIkUFyyaKMMJK0Iwb5fDP6drwHpLePbxEiCsJul2rxM+no5rK0oP6YITLy/qOm4cwGBPaR7UDwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDsNfL/oQrggMzCHIN+o+UC9lSWh22iv/nzGlvSC/6k=;
 b=jQ/ZwK13vBwIVdtVdrY4w8TQMDn1LspUgJX33UYJeS9zSReaMIXDbKZlSkMKlm9fe1woO8xPlxlt4nz06iOzqiypMl5OV9rf/vFRckNqdRy/fjOeKCemBbXCZ2obG3g2OPZYa2mgFN0YXU6oXQ8BzkEEHeGCaYE4v/Vo9lNw2MQto9YTQ4vOuvBFdq4YOCKZI8f7Hozyzrw5X0dAlHv5XPqcAtOC0/rv3WWS4MpzOAQ24mMvZEUMaZQXDBZ200LHG2dnb72NoL8JG9JUTjUiUqY0YfTbeXkb+TUvg+keXQejfXfZz4LP29vJjxNpqCtNmAfJqvfGKQ95LQZVFR35Xg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDsNfL/oQrggMzCHIN+o+UC9lSWh22iv/nzGlvSC/6k=;
 b=NeW2C9HTKW5IHdXtBMcpBbBk7JwK2BzuIekI1koOmv/5qRELQ66W7apLhPcOkmvL1tx42yA5d2vwdnjwXr4LPDk5dTBS9vXNR5VVHgQzVv2aXWTq+iR3rmTNglxLh5v0ScoIRWWUG7K1F0wIED9YywehHIiQaZ9rxPjbbPexsP4=
Received: from DU7PR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::25) by AS4PR08MB8072.eurprd08.prod.outlook.com
 (2603:10a6:20b:58b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 10:32:26 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::93) by DU7PR01CA0020.outlook.office365.com
 (2603:10a6:10:50f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 10:32:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Thu, 19 Dec 2024 10:32:25 +0000
Received: ("Tessian outbound 8c86f99b1b13:v528");
 Thu, 19 Dec 2024 10:32:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2aeb068eb300bb33
X-TessianGatewayMetadata: 2p/kpCwyXN62aIp+Aos/IN3Mxw4PRAERwNhQ/QYSwx3jbtlOcFz27oLEXqNKx9G3v7ObADN2L5M7HN4ZpZ4Ocfy4tJ0rK7JQXblU7IFKecrEfdHCTayNOl5MdLjPH8b5H+iNK8sUqnsDZUyC1gzDsLHmHlRzLkqt7rTOGv0XXCUcK6Zm9H4R7MyHqwygwZmf
X-CR-MTA-TID: 64aa7808
Received: from L0792dc63cc4d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8CFF8B01-3211-4CD7-8494-BEA9E1B17790.1; 
 Thu, 19 Dec 2024 10:32:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L0792dc63cc4d.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Dec 2024 10:32:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQmDQf2Aju9pKELenh/zJeBiRq4UiSMdL36DJTd8A/Y58mNArAQPlTEaAezoRtnuKH8Lq2WlH6WS2aLs/iUlMpcFm9k8nHgTN7QyrkL+e18VaHtI2tm3/iaf/x85lDvRcEj+NVIccdW82wFv/rECnAkSe3ImHHuFfLgyHQ3SsYrg+agMqLLZ3VMxSP3ndJi1e5frSu+F0+vlVrU8E7C29Vg1QxKy1rk4ng1D7AvvyORM6y+BvNJMQuhYkIWjLYoBwhApjZ1yyvmANGY/TkGh/bPIXF4RVOA1pOD2gA6jzxRHpanIeekaluWB8lw51Nxf86loOnZ+QXcxRfucYBy/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDsNfL/oQrggMzCHIN+o+UC9lSWh22iv/nzGlvSC/6k=;
 b=R8nrubTZPNCNik3+nxTNdgrKSBF3McY3wT2D//N1/3lODQ6D+z/BcCN2H872hsQg43CrkDLIUu92NmaF92HoWvIcbYw79IGkpTRC72fxUoLE6zTMP87OVP7taxEvoLftABab2RMRb8E9pbF/2uLD0oI3ueHuP89sFOjRPZy5P15DfB9QTU72nKVMq6Kqimjiy5S2dsPD/3Djtd8kGH7UjxPgXIDN3Q0qa0kehrGpIDmNIWbZdNdAZHiK4CQ/ZH+VpwmM8IILRx87oUfraA4fuPw9Jl2w6nuUC3ekiDtwQhHTJobSIODXoeJm1YD3GEXOPITDb1/wgUr764ruCuhTlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDsNfL/oQrggMzCHIN+o+UC9lSWh22iv/nzGlvSC/6k=;
 b=NeW2C9HTKW5IHdXtBMcpBbBk7JwK2BzuIekI1koOmv/5qRELQ66W7apLhPcOkmvL1tx42yA5d2vwdnjwXr4LPDk5dTBS9vXNR5VVHgQzVv2aXWTq+iR3rmTNglxLh5v0ScoIRWWUG7K1F0wIED9YywehHIiQaZ9rxPjbbPexsP4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB8563.eurprd08.prod.outlook.com (2603:10a6:10:404::17)
 by GV1PR08MB7802.eurprd08.prod.outlook.com (2603:10a6:150:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 10:32:16 +0000
Received: from DU0PR08MB8563.eurprd08.prod.outlook.com
 ([fe80::3f5f:95b1:c5ed:1895]) by DU0PR08MB8563.eurprd08.prod.outlook.com
 ([fe80::3f5f:95b1:c5ed:1895%2]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 10:32:16 +0000
Date: Thu, 19 Dec 2024 10:32:15 +0000
From: Brian Starkey <brian.starkey@arm.com>
To: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <zfjnuz2pfg7j2g2zrbt5ryde223plzr4rdyk4f4ans5znicw3l@kbebotesmobf>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAAxE2A5+=QVAFXXCbe3qEgY-Mzb-5XW73CYdANEO+N_xA+ivaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAxE2A5+=QVAFXXCbe3qEgY-Mzb-5XW73CYdANEO+N_xA+ivaw@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::18) To DU0PR08MB8563.eurprd08.prod.outlook.com
 (2603:10a6:10:404::17)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU0PR08MB8563:EE_|GV1PR08MB7802:EE_|DU2PEPF00028D13:EE_|AS4PR08MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe730a8-618d-4cd3-8da6-08dd20186e36
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|27256017; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZzlwbUkxSmZlSFFkRjB6dXh5SCtnQmpNb2lqQzdiOHg0WmtFNE9RdFBYakNZ?=
 =?utf-8?B?SUxWU0EyaVAyVTIrOXQ4M2gzaUY3L0RJZUtYd1NYVytTaVJWcjZtMndjYTdM?=
 =?utf-8?B?djhUU1JXSEpJNWhMVUNHd20wZ2trSm05RGhtclV0Q3Nsc1lXemZMNUlidUVY?=
 =?utf-8?B?MmkweG1JakZ4UW90T1BSL29CNTFhNVhOeVJRRTBjdFZ6K0IrY2RlNzFXWGs2?=
 =?utf-8?B?MGEvMnZUNk1WWmZHc29WcUF1S2QvVnlQa2ZIcFptNjhWU05hMnZIeEprZjZU?=
 =?utf-8?B?QUVXNU1aK1hxUUdKSFo3U3U3cWpPdkhJZ2FGTG84QWlGVCtMUU52blIrMFZq?=
 =?utf-8?B?WjJSc2VJRkJtWU9vMXVtVWhOdVJlUU9UaFZWSGt5T0liM3VHdGloRHhvTy9S?=
 =?utf-8?B?WUUwVS9WOXFtVHRCWk0xamtEYjFrRlpKcHdiVHdubDdHcC9vcGYrUkIrbVd0?=
 =?utf-8?B?bFVkd1BCQm9LYW1mTm9KSGFUc1V5K3VxejB3N3RLdXR4bUVxWjlsTlpvVTh0?=
 =?utf-8?B?aTA5R1IxOWk0MURtd0lYTWh1WlJreWVueC94STF6VTlzbklQd3JhRno4QWhC?=
 =?utf-8?B?RU9RY2lncG9JSSs1QStPb2U1N1lwcWFCS2lDNGc3dTBLWkRpRjZpNzQ0S0ZR?=
 =?utf-8?B?MmhGaUQ0RVhGQ1A1K2tVQS9GTm4yZWhwRnJuY1F2T2NEbFk1SUExb2FRSlVP?=
 =?utf-8?B?U3NiK0FnOFJ1aGVlOFN4ZzJkMlEzVkdGMGpkVVlidmxNcm5LUDBWOGZPN3lQ?=
 =?utf-8?B?TFUwdWEvNGRCMDJLVTJnRkhmQ2dHczM3VTduTXBXb29Ub3JoVDRIUW0wT0sx?=
 =?utf-8?B?UkhPQzV5d0hnYk1ROS9QQU5sUkd1bmZ4SGFBVjRHVmVCbzRzQjJmNkZtTW5m?=
 =?utf-8?B?RXQ1ZzRyRXJtWDV6UFlHdkV0NXFORDFUZXpSbytjVUtWZUFoZ2l6VWpRWHdL?=
 =?utf-8?B?SGpJaDNob3UzN0VUY1VNbTlDYXBzK2hFQ2F3YmNHNWFIUThxN3FIMzZwUHVo?=
 =?utf-8?B?L0VuM3lHSDd2aE93OHB4YXdIb0l4V3grRTNZc1FjTlR1UHlJRDFFNFVXdU51?=
 =?utf-8?B?S04wbHIvajFGSS81L2ZrbUx1ZEdKeWlkVGhwdDZXNG9ONG5GOW1kOHhPYWFN?=
 =?utf-8?B?NTBTc1BFbmpKcWtxWFQ0R3dGTGJHUC9IZDFBQmVzWHpkT0g1cDRUUU9GWXdw?=
 =?utf-8?B?MHpGZmtPMEs0dmcxVmRtZnhtdnV1azFub0RML0U3dG5yWDJ4cXVKTFdmT0th?=
 =?utf-8?B?UW1CZkRzTXplaTNSRVpvQytPVlNMdUx2Rk9qNTdic1dzelNLbG1kK0x3d0xa?=
 =?utf-8?B?MkNpZVY2bUREeFNjMU1GdEhqakZOY3BqWXRNejhiSVB4RmVWMzltWXBzSTJ4?=
 =?utf-8?B?V2R2VFQ0clFnVFluSTRkdlYwcVF2cjRnTnpCTms3Z3NqTHYzeG43MDFqS2Zq?=
 =?utf-8?B?SzAxR2plVG4vZEkrd1lXSU94WnFGY1VaUkZWV1Bqc2huTHo1MVhZRVM2dnRC?=
 =?utf-8?B?RWFnTGVOby9CQU44eGFsUk5zZ0FsQzYyeHdFekhlT2FFZ2hwbVJrZFYvekxi?=
 =?utf-8?B?UHVzUEhWdXhuZzlxbTRScXpXTWd4eU0zK3ZtSTVWaHdrV3BhUG5nQUMwVUxt?=
 =?utf-8?B?WGVYWmdtMkF0cm12ZFRpQURTbXdKWkRUWGgxYVhiaExSZUNKanZZVDRjR0xH?=
 =?utf-8?B?dmtOZ09uQU1CVjRoMTQwYUVSLzZRNHBQMk4zMUJDQ0N0Y0lOMGZKRWZaK1Vt?=
 =?utf-8?B?VzFvdVZCMHRTWFBBVjE0aVJzV1YxUnlFWjZRc0xiWmh2Ty84a29HVy9CK2sx?=
 =?utf-8?B?K3lack9YaW1wSzd3U1VQYmV3NWNjYm9PVUtPTFVmRDFGbG9TRExqZVhCaVVN?=
 =?utf-8?B?aEh5ejJIeGp3Q1l0alpMMG8zQnhzQnlBcWt5dGsxSVdKVVc2ZTcxNG8vOGVo?=
 =?utf-8?Q?EYx5LN/P2fwodWvMq8c9lU15LD5f8raS?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DU0PR08MB8563.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7802
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:404::17];
 domain=DU0PR08MB8563.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8f31afa3-2991-4b87-316b-08dd20186889
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|30052699003|36860700013|1800799024|82310400026|35042699022|14060799003|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2Q2M1cxQ2UwQnZhc0N4ck9PZDFhZXhWYVZoeE1pSDRvclVQdFRPWmYyZEpr?=
 =?utf-8?B?SWdTZkdjVlMwWU82a3Zjb0N4QzZnRm5SUExXYjJ4S3lxcDZlRzgrZ2ZjN0U5?=
 =?utf-8?B?ODkvQjN1SnlmSnFsREVCTm1udGNoOE5UazRxR29Hd3BjaFVYZ0tzcmlwcUVh?=
 =?utf-8?B?U2J2UkcyUmpudkxsOW9XN0NvejdBemszQXpEdm04R1VoRlNEUjMvQktrUGRF?=
 =?utf-8?B?YnJaQ0xWTUd5cll2dXM2WXgzRG9jaXV5MHB3OFhlKzRyRUoyWDIwOXd4cEVM?=
 =?utf-8?B?Um5qQ1dVYkxOTHN5S3JIOHBFNHVWWVBJdlNtNVJMTks5MHkxZkcva2s5dEJU?=
 =?utf-8?B?L012a0UvM2ZDRG10SFJsMnJsL1hPaUNWWHZ4cGJyM3EvWHFHMXFOK3dCNEgw?=
 =?utf-8?B?N3B0OUNCVWpuZW5iZ2lsQmx2QlhlTmhHR21vMmVOOHpZbERadlR1ZUFXY0gw?=
 =?utf-8?B?bHorZnJnMEsrWTBnek9RZ0VGbFg5RGJwcm1nRlZEQW4zczlpdzJOWFFjQ2lY?=
 =?utf-8?B?ZDVEM01mNFNmMUt6QzZqNWtaUi9CZW14K1N0SHJ3YXB1ZVpmSnhjVkljMHNa?=
 =?utf-8?B?cGVialNjNHptQmJjTTYwVnFnanFKbHNlbU5KL2dZWUdOSk56cTR4QnV3MkRh?=
 =?utf-8?B?MWtGNVJkQ0dXbHNCcW81WjNSTEduZ00vbmFieDJBamZ1cUZ0eXk5WlNDV0t2?=
 =?utf-8?B?VTBMRncybkJqS2p2K1JlZHpEMGtDcjZ3Yy8xaW9SRlFCTWovQkdEQmJ6d05z?=
 =?utf-8?B?MU9WZ09BckpuL2Q5TXpCZDUwYzdFeXBOTllWaTBadXpIVVNNRThyVEZwSm9L?=
 =?utf-8?B?cGd5ZW5nU1VLbjI4UENBeSs2TjRYU0Z4VW5yK2NSc09xYXNici9ZNXAyT2xl?=
 =?utf-8?B?cFliS1lMK01OaUs4cUpnQTJvemFTMVp1dUNsYzFldW02VEhqQnllWWhFLzhr?=
 =?utf-8?B?ZTBJTjR1TytoOGJ2Q2tET2Q3OXhsZjloNWZZV2szTW9nUUovdk1mQlN2Ymxt?=
 =?utf-8?B?bFArVHQxOG5iUnVSRzVweE92SnlGWVRmc2UzeXk1WFN4NXB3Y2pBTjVQQ21F?=
 =?utf-8?B?a2RPVzB6UG1KSDNFcDgvQ29acjBLMWl3a2h5ZWJIenAxTURrb2FLb2dZc1VL?=
 =?utf-8?B?SFE2RUkxMlJmd2szTFlFU2JmZGRMK1JvSkl2RHVFQnAwWDgrNjlMRlk4TDMz?=
 =?utf-8?B?aGUxeStmTkZ1OGgzdWFuOURBeVVlZ2tpL0ZSV25XZnhCb3YzUTVrYWNaWGdB?=
 =?utf-8?B?NG1NOFZ3NDlBY0sxQi9WSllmTU84ajV4ajdXbFN0RGtGSGRpOWtkbHd1YURt?=
 =?utf-8?B?eWRmSnFBL2NxK2dkcTAwR1Z3M0JtUU40SEUvM0IydVdRYkUvQzlIZ1RneTAr?=
 =?utf-8?B?YURiTHdrK09xUy90KzhobDJWMlJKQzRZQWxhbjU0M29EMjl3L0llK1FaOHBr?=
 =?utf-8?B?OVM1bmx1dExwb09qZUJPTHZlNm1ITGNRQjlJb2dVL3JpdEw3VVh6b0tCMGp0?=
 =?utf-8?B?V0JsZ3JKVVlxdzFhUWhhUklvVHNhOHl3UVh1V3FRYWF4b0VLRXlHVUM3MlFP?=
 =?utf-8?B?OTZQUm1idmJBZzZPM2VGeXl0YjFEL1B2VTFjQkdwRERWK3JJajdQUVJFODNG?=
 =?utf-8?B?UUFabnJvcFVSUFpCY1RwQXNJbklBb3VxeFowekwxMEZlQmk0SFNXam1FaUo3?=
 =?utf-8?B?YTAxMnQzeDR1ellPTTN3TEFQRVViZ014SEVCa2d2REQ0Z21HRitqbC96R0dn?=
 =?utf-8?B?c3dzY2Vpa0E5TEdLV1lYRVZuOW1meThETGttZHhqdUtOSWpEa1p2SWNPeldN?=
 =?utf-8?B?a0ZIR0Jla1BOdkNKRnRwamVDeWRXYi9kOTVDRVVrdENPWFdpdWErNHVWSnJo?=
 =?utf-8?B?K3luZStZUk0xaTlmdkZrYVg1VXZIdUxwckQvVDFnSEk3ZWxCNEc4U2VMSjhu?=
 =?utf-8?B?cEFoN2YyMm9jUjhCV1JpSjlVWU9EaS9WUmowcHFOS0RSbnEvVFhSZ3p1dDZi?=
 =?utf-8?B?WTVLWE9sMDhJOVFxTkViNllORG42akhHTU0zMWl1eHlJaGNFRlJaZ1l4UXBK?=
 =?utf-8?B?RTZmZ2JUSGJrWkxraDJpWElqNmppbmQ0MitSQT09?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(30052699003)(36860700013)(1800799024)(82310400026)(35042699022)(14060799003)(27256017);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 10:32:25.6851 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe730a8-618d-4cd3-8da6-08dd20186e36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8072
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

On Wed, Dec 18, 2024 at 09:53:56PM +0000, Marek Olšák wrote:
> On Wed, Dec 18, 2024 at 5:32 AM Brian Starkey <brian.starkey@arm.com> wrote:
> 
> > On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:
> > >
> > > For that reason I think linear modifiers with explicit pitch/size
> > > alignment constraints is a sound concept and fits into how modifiers work
> > > overall.
> > > -Sima
> >
> > Could we make it (more) clear that pitch alignment is a "special"
> > constraint (in that it's really a description of the buffer layout),
> > and that constraints in-general shouldn't be exposed via modifiers?
> >
> 
> Modifiers uniquely identify image layouts. That's why they exist and it's
> their only purpose.

Well you've quoted me saying "it's really a description of the buffer
layout", but actually I'm still unconvinced that pitch alignment is a
layout description rather than a constraint on an allocation.

To me, the layout is described by the "pitch" field of the framebuffer
object (and yes, modifiers are not only used for DRM framebuffers, but
every API which passes around linear surfaces has a pitch/stride
parameter of some sort).

> 
> It doesn't matter how many modifiers we have. No app should ever parse the
> modifier bits. All apps must treat modifiers as opaque numbers. Likewise,
> documentation of all modifiers in drm_fourcc.h is only meant for driver
> developers. No developers of apps should ever use the documentation. There
> can be a million modifiers and a million different devices, and the whole
> system of modifiers would fall apart if every app developer had to learn
> all of them.

My concern isn't with app developers, my concern is with drivers and
their authors needing to expose ever larger and more complex sets of
modifiers.

There _is_ a problem with having a million modifiers. The opaque set
intersection means that all authors from all vendors need to expose
the correct sets. The harder that is to do, the less likely things are
to work.

Look at GENERIC_16_16_TILE. We spotted that our layout was the same as
something already defined under SAMSUNG. If there were a million
modifiers, we wouldn't be able to spot that commonality, and you'd end
up with disjoint sets even when you have layouts in common.

For this specific case of pitch alignment it seems like the consensus
is we should add a modifier, but I still strongly disagree that
modifiers are the right place in-general for trying to describe device
buffer usage constraints.

I'm worried that adding these alignment constraints without any
statement on future intention pushes us down the slippery slope, and
it's *very* slippery.

Up-thread you mentioned offset alignment. If we start putting that in
modifiers then we have:

* Pitch alignment
  * Arbitrary, 1 byte
  * At least 16 byte aligned, arbitrary padding (Arm needs this)
  * Exactly the next 64 bytes (AMD?)
* Offset alignment
  * Arbitrary, 1 byte
  * You mentioned 4096 bytes (AMD?)
  * Arm needs 16, 8, 4 or 2 bytes, depending on format. Oh and it's
    different for the chroma plane of planar YUV too, so it's more
    like 16, 8, 4, 2, 2Y_1CbCr

We would need a new modifier value for each *combination* of
constraints, so 3 (pitch) * 7 (offset) gives 21 new LINEAR modifiers
which need defining, and a device with no pitch/offset constraints
needs to expose *all* of them to make sure it can interop with an
Arm/AMD device.

I'm certain that 3 * 7 is not the full gamut of pitch/offset
constraints across all devices.

Then we come up with one new constraint, let's take Daniel's example
of contiguous. So I need contiguous/non-contiguous versions of all 21+
LINEAR modifiers and I'm up to at-least 42 modifiers, just for
describing a tiny subset of device constraints on a single layout.

It's obvious that this doesn't scale.

> 
> The only thing applications are allowed to do is query modifier lists from
> all clients, compute their intersection, and pass it to one of the clients
> for allocation. All clients must allocate the exact same layout, otherwise
> the whole system of modifiers would fall apart. If the modifier dictates
> that the pitch and alignment are not variables, but fixed values derived
> from width/height/bpp, then that's what all clients must allocate.
> 
> If any app uses DRM_FORMAT_MOD_LINEAR directly instead of querying
> supported modifiers from clients, it's a misuse of the API.
> 
> DRM_FORMAT_MOD_LINEAR will be deprecated because it's the only modifier
> that is generally non-functional (it's only functional in special cases).
> After new linear modifiers land, drivers will stop
> supporting DRM_FORMAT_MOD_LINEAR if they can't support all pitches and
> alignments because we only want to have functional software.

As part of this change will you be adding some core code to
automatically add aligned versions of LINEAR to any devices which only
expose (unaligned) FORMAT_MOD_LINEAR?

I'm also curious to understand how deprecation works here. Will LINEAR
be removed from drivers which currently expose it but actually have
pitch alignment constraints? I think that risks userspace breakage.
Or userspace should start interpreting modifier lists so that it
can ignore LINEAR? Or something else?

Thanks,
-Brian

> 
> Marek
