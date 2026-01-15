Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA760D22B90
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FD710E6B8;
	Thu, 15 Jan 2026 07:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JMSlbrdS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EEF10E6B8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:08:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWqAiAoDGIUcA5oJiN44pPcDaPcEcJZPDVjNyKCb01dsfv22vRkPCgsQ6YiRnZm/sZ9bzK4J/Hi9JIoI76S5GM6rVlE/YYopwJwD23qYtOSgJLoO3/MyKXUd0/2bupbCL/cotnNUnLkATvDsJ8Xp8pfAXJZqt675VYd5NDKfhXTSmrh1b0vljpgGIJpxOIuhsiR4iyv78HdQKoxJgMa10RUyQktcv89G2FLoDIaG4Ch96Znyuh67mwI/maC/yonzWbG1ME1u8fPDWPxfZYL+vjVEwSMiCgieZYRxRUJjleoaBFdFXwF7t8LaqOowh3iFkr5l3T/2SUxiKmflbzG/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8X22t99z42UCIWWwxXCvvFt/wqXg4JEWSGqTos44AzI=;
 b=SG97LCcSw47SMQc6vs3zpuC33+bdrNP7ic/tEkY9TwSiLXJl02mSqZGj0WuoF4CaNeSPNk00yANfRkRt1e9lUFl+IKqeJgXSmDALih0pZ77afnnQP0pKO6K0EEgUHKVo9G24pIIHZ02+NdlbHPef2i0CnobvauIqBi2s4mmI1xZw7YI8+Ai1HZogOZdb9xd6nIzazmi5hmgRc4JG2tXqEoRL6GeyGV4S7RLiNWJ5liQh8YPaGv2Ilr/w0hvUSJ+s6nORFhq6xjhV2kf5dm3mXkLgd1uhkUPnG234pOKht6SetqP1NptLOFdn+CR2zULIRmP0QhD/1scIIIcKtdbbug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8X22t99z42UCIWWwxXCvvFt/wqXg4JEWSGqTos44AzI=;
 b=JMSlbrdSJ3bhPPguReq82NryZHdSm+xhgcX9kzX85hbwg9VJvdGtWryt4hK/ngOuLri83fYfSufNFS22H4b+2EK1pIdx/PmuI9Lyu/jv3qm7/FnLezvs73PHDP1i6M00uTTRplrEHIK53aDwEqOyYYbGax3rXQSXLI4v4cvD/rGFFaMxjbOXqvuXLNBzuwvqHq7YXezL8Wm7kEBEDpl2OY5MID4IbtRj02S+Fm6li2fruMiLKRQsR0EjGwJLeocaJzBy1RfdSlF7hnfNQKdRw3mrGtbldel+BCVDwQ1GQZOTEWguR8TO0NB0F17Q/hEFaRFooPs6Oi2YAtB1X2067Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by BL3PR12MB9049.namprd12.prod.outlook.com (2603:10b6:208:3b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 07:08:50 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93%3]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 07:08:50 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4 RESEND] clk: tegra20: reparent dsi clock to
 pll_d_out0
Date: Thu, 15 Jan 2026 16:08:47 +0900
Message-ID: <23752317.EfDdHjke4D@senjougahara>
In-Reply-To: <20251204061703.5579-2-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
 <20251204061703.5579-2-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P301CA0072.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::19) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|BL3PR12MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: 792a4289-9f32-44d6-5a30-08de5404ef41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0FGamJiMUZYV05mRHdyU3lRK29MRWdtUkN4emIwSStRdlNZZDUzeCtpOXJr?=
 =?utf-8?B?Z0hnU0F4cTRvR3RKZ294eWxFWFk2dWtVeVJsZGJhalhJNndRcUI4ditLK1RN?=
 =?utf-8?B?b2JmOFhCaWpRcXNiU0czYXFwNS8yWjBZNXFCTWVNVmlPdDAyVG5hZUxzNWFq?=
 =?utf-8?B?SkFZdWFJeUc4ajVqZk11TGRudk9wdUdTT09yN2FFU0FuZVZCTU5NRE5VV0Qx?=
 =?utf-8?B?aGFvVGJ0aW81TUhQV1NQQjBsbnI4bDl5OXFJRmtnemJ4dXk0Ym9Ga1B4d2JN?=
 =?utf-8?B?OE1vRjBWS01CRXcyOGxXOS95L3hRMjkvc1oxMnN5cjMxR0tYY092b3BWTkE4?=
 =?utf-8?B?OWRMbzRRSE5mcTJxY0x0WGthVllzNTdNR1F4UlZQbUY2YzJDNG56ODRBb3o3?=
 =?utf-8?B?MUl2MER5K1ZSQ1YzcDV0bzA3SmlMY2cyR3g4dHlTODBWN0h6S1VHRVhPaW0z?=
 =?utf-8?B?UGxjdjluTkZZYkV2S2lPMnVzZzN3V0RtNkY3dUhqdDlBQkppNkFwRGpZVUJa?=
 =?utf-8?B?cVI4QWYvZU45blZ1TDJrU0tzQ21ON09id2cwQ3BFSVJIK3Q3azFublNnOVg1?=
 =?utf-8?B?eWZoSHhSMWorRXJneWRydWdWdEp5WVZJa2ZyRyswMlhxeTc2L2ozamdEc2Zw?=
 =?utf-8?B?QmIzTndIcmxHVzFSZWN3QWY0S0ZXSUh4K0t3R3RjTE5RcjlOVGFBYmtGbUk5?=
 =?utf-8?B?aWFsK3d2cVo1MUNPSGx3OWVuUGNTNm45ckRvV1RrNzJKeGVySE1IWVlnVlpv?=
 =?utf-8?B?ZSt3ZWtjZFFmOHRtUURYUGlxdFR6OTVvTFVJcC9uOXpLc2ZyVmlLVGFIRUhj?=
 =?utf-8?B?bm9kVFlxMDE2N1ZYamRtU2wrN29oQ0RYMkhkU09vL1c2WE4vMHVualFmWkhY?=
 =?utf-8?B?MnhpZnQwMmpYOW93K2hMNCs3NWNvaUdrVjBQUXFuMitrZmVwTSsvaDVCb2pw?=
 =?utf-8?B?ODEyd0hRMk10eDE3Q1ZLRTJURHpVZUZpaDNINk41WjViRkwrVm11TFROb2wr?=
 =?utf-8?B?ODJ1Qm1YcUpmYkt1NUlmaGdkQ1FWazJDVEtqcjVnQ1dNV0o5U1lRYW5DQzY0?=
 =?utf-8?B?ZFZqeEV2ak9IZEtkaUl6c3NuWld6N0l4eVpXMDdvRTNjSElIVEh0MXZ2NFd5?=
 =?utf-8?B?aGNTOGpyN1Yyc1kxVXRScUwxbVFudXN5eUtnQ0JlQ0xQTjA1N09yc05mRXpY?=
 =?utf-8?B?TGNuK3FuaEthTjNpVmFCaGE0QnVIN0RRRVgyakJxYVJvbmYwWmFMbkQyYUk4?=
 =?utf-8?B?WERDN3c3a2lRV3BDWTJFUnZtVEczNndaS041L0k4clFuZXZCbkpKdEh3a2F1?=
 =?utf-8?B?cDRhK3haTzFyUEtWRkZWMnB5L0xlUHFnRHJZZWpWTlBsODJROGNieml6b09Y?=
 =?utf-8?B?UDZzZURma3Nhc1FkOUdmNFBUQW1RbEVJQ0dsLzdIOEtzUDBxcWo1QlE2ZXRK?=
 =?utf-8?B?Tzh5T2NmSWdSbDU1VHp5WHRxVHh4Ync0aEFRVTkxK2NsYXY3angzMXpOdjB4?=
 =?utf-8?B?NzFlMVRWZlN4eXgzd1hOOXVvckY0b1pBVDU0YkRlazZOc2IyRWxHR0xxbFR4?=
 =?utf-8?B?V0FnOW5DNkl6a2VZb0pUUTVHNlBsTDVJbUpVQlZMOXNHMHBvODhXOS9VakN2?=
 =?utf-8?B?NnptK3BhU0tneHB0eFp6ck14dU9NT05ud1RueTlHR0FGRVFER0FCVGlNRW83?=
 =?utf-8?B?Q29TanY3QjhmTUtEVjBWUHZVM0JJYnE1b1MwenpBZUF6dlVLK0hwbXk0YXFX?=
 =?utf-8?B?TkowTWhBMlo3SXpnV1daUmE3K0JyS1JvU3g0R0NWS0pXQ1h6bFdFNjgzR3Zi?=
 =?utf-8?B?cUtHNExVcnRnNVE2RG5wZjJJUTJESnNtTUhlaEU1cEpuWnJHT2xqU3pITC9L?=
 =?utf-8?B?VnVBYzFRbUMwaTZyN25ReE55KzBNMTFSNnBBSDlDa285UlFIYnF3MFNmcS9k?=
 =?utf-8?B?eG02bjMyQzN5SkpzZ0EzQ0JrRFRoSi9JelZEMmxyaU9zRjJDU0N3TTZ5bnFD?=
 =?utf-8?B?TjBvcUpWL2dFbUkvR0FxckFwcUhjUm11dDV0Sk1nR2RxdUdKMEt4SExIWmw1?=
 =?utf-8?B?UHNxbFZEUEhIalY2QTBuUjZYL1owcjNhdDd5elJROVVGdXUxU3FYSlBGdWFS?=
 =?utf-8?B?anMvNXJ3TUJpWk8zcUgwT25HTkVtcnZiSlBrWk91RnlDTSs3VmNVbWhINWwy?=
 =?utf-8?B?T2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnZqZkhIa0JBRUlJNjJmdUw4bUpaYVJEUzRPVmF3MnBDdlY3Z2dlYmZMQTkz?=
 =?utf-8?B?ZlRPcVg5VlZYRTYxQTJaejFOS2NZTk1Za3VnaVpsN0RreEpRVXJYMzQ0aW9G?=
 =?utf-8?B?ZllkRnR1TXU1QWtBTDBqdGxhV1U5NlhCeXk1MjBkdVNUc0Z3QUtnNUMrNE1n?=
 =?utf-8?B?K2UxYW9PeVR2akQwMXIvMHh6TUFrRmh5OVE4aUhCUmdIRFIzQ2I3TTJBOU5k?=
 =?utf-8?B?SFdYVUhaS1VWTmRDWEFFenNFK3lIWVFPeVpCRC9YWk9vRm9UWEZKZHBOUVA0?=
 =?utf-8?B?czBTa3E3cjdGQVkrTU5SLzJVTXB4WlgyMXVBK2pVSSthVWlwSkhNTmdJUXV5?=
 =?utf-8?B?VDE4NFhCTlZITXdGS2lNYVplb2JickMrVXk2SmQycVVxTDBqN1RuSnpvb1Ro?=
 =?utf-8?B?SzBxZlZFbjMvVVBMYkJEM3M5Y1BUMDJxdEdUS0pyQVJ1OGsrSzI0OHlzN3RS?=
 =?utf-8?B?azRXNkdWSzlCT1BubUlvNnF2Q2JzS1cxVWpFY2xnelQxSGlJVEduOVYzR1V3?=
 =?utf-8?B?RTlrdURCKzR3SEo2SEgvc1FzY2N3V1ZZV1F6MkRscmV2QUozOEFONXlLdXZH?=
 =?utf-8?B?TVdyS1Z4Qm5VM0lVaDI3VjdXRDBzTTVEUXgwalJDeCs4OUJXRENZdDVja2d5?=
 =?utf-8?B?NnhabjVyQSt5MmV0SkxrZ0VXcm9tdzRpaFRoQjYrREM4NVM1VTYrejNZdTZG?=
 =?utf-8?B?eDJ3RzRMUDRla25jMTY1ZmptMk5NaWcycUkzZXczRnNST0d1SHdISnpERnFm?=
 =?utf-8?B?NCtRZzk4bXV5Yyt1c2swczArUm16RVliTHh2aXZWWmdRczRFTjB5V2FoZDU5?=
 =?utf-8?B?dmhXYVZXU2JxaWJkaElxT2JPVkFBaUFhM0pJNElvS1E0OXpzN0k1TzVieFJv?=
 =?utf-8?B?ZVR0Vis3bFBsajVtWHNTM01ETjkvQlZHQys3aHgrTkpGbWJkeTE1aDFzSlFK?=
 =?utf-8?B?TC9SdTNFbzlOdTRQR1VlRWlrQ1JjNFczVzFwZjRPRjNLM3E3bGlrWU1mM1V1?=
 =?utf-8?B?V2lLSmhWTGI1OUhvT2UzRUtJUzZ0M2RkcTBlRm9CTzlwQWVlTWFTUTZtN1Yw?=
 =?utf-8?B?c3lULzExUEUwL1ZUZnVBaHRLbGRVSURwUkYwSXdTcXlkMTM1eW5TUDVSUWw3?=
 =?utf-8?B?Um5QRmd6T2JiUzVvY3kwcmo0bjlzNFMxTFBYM09NaVFmaDZtMVpHd2dlZTJl?=
 =?utf-8?B?bXNYNkZ0TEJVbXlCenluV2NEK3YwK1F4ZkNhMkFtWFprRW9MVkZSbTB4djl0?=
 =?utf-8?B?dHg1ei9VRlk0ck5pSVNmMEZEVlFJdzM2S0JtcmxTUnprMGFNK0loSEdROGps?=
 =?utf-8?B?SEN6b2xSVm5ud3UrUGpkaXVHWC9RQUwvUTJacCtTRHpBc0JoTzFUSnRCcmp4?=
 =?utf-8?B?RkppbjJtMUphTnpWckRBMG5ncHI1bjZRUExwNk9HVStnMzE4WTNqTU1OUzlv?=
 =?utf-8?B?NVkrVkU5VmJRTC8yL08yT3U4U3dJUzluYm4xSXErWDNOYnFyUmZ4a1pkVUNN?=
 =?utf-8?B?OXg0blUzMERTRzk1VWlYbWJGK3o2MkVneXVUQWVldmV1Z2VTVko0c0dwQlE0?=
 =?utf-8?B?OG5QNFdkZ3hnSnVCaUhVc3hRUy96ZlpWZGRpNk9yYlNLTUlGTjJnK29JMExH?=
 =?utf-8?B?Z0p6enlvSzQvYWNoL3ovU1FSakdQbzFxNEt5QmJ1MVJUb1lkcXF5VnFSSGFB?=
 =?utf-8?B?T1oydUVMSksycGF3U3FWRTZJUDg2dVA4YkFpZDNZazFvT29vSDhGQW9YTHpi?=
 =?utf-8?B?Qm9COW1QcXlaUHEzaVRLNjlaVUZmbVVlUnNXbSt0MWdTQUJJRHVOME1tUkli?=
 =?utf-8?B?WktYME1yLzQzQSs5ZmJsd0FrUWw2TVErb2s0bDdqZHpPaE0xSWlJbGZmTEJ2?=
 =?utf-8?B?TFUyRElmUzdTRUtvUEwxcmI3K3lRVVNqcVRiOERuUGFmb3o1emJSQ2JJb0g5?=
 =?utf-8?B?VXMyNGZvQTIwczRXc0F4aXZ5QlFwMmVPeng2bHg2UW5xbE5YaC9vREJQWkty?=
 =?utf-8?B?OGRhTkNyUFBDRFlPbVdPc0k1aS8xaTJBTmhDZlhCQU5nOHF5VHpEOTBTbGU1?=
 =?utf-8?B?VENTU1RXZEM1bDdiV202bWNwSXUyenlBODZuVmJpd2MyVzVPV2FtY25Oakht?=
 =?utf-8?B?RjVKY2tFRW5LNGRuMFk5aUpoNFhsZEN5VHh1K2RrZEVqcDFYZDcvSkRJbklP?=
 =?utf-8?B?bEtMZ3Q0dG95bmluaVgxL3dCWEp2M1JLcWlZVEVWTWJac3RraUJoN2M5UHF5?=
 =?utf-8?B?ckR4OTRJbkw2aE9Dd09LdnBsRngvUXRLck0wTUpFWGJoOVlRTFg0aWtVb0FM?=
 =?utf-8?B?UC9ZcjJ3S2N0a3ZVUEQyaC9SekVMOS9meGl2WVFvSzR4NU1NV0R5dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792a4289-9f32-44d6-5a30-08de5404ef41
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:08:50.4987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXi0hh4uiY1TOzNQppTKZ79eCJPjDBmgZtErMqJwvuPnTJf760vab4dmoK5Wgnhz/Swsy09Gj8QQiucYugtMKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9049
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

On Thursday, December 4, 2025 3:17=E2=80=AFPM Svyatoslav Ryhel wrote:
> Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegr=
a20.c
> index bf9a9f8ddf62..9160f27a6cf0 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -801,9 +801,9 @@ static void __init tegra20_periph_clk_init(void)
>  	clks[TEGRA20_CLK_MC] =3D clk;
> =20
>  	/* dsi */
> -	clk =3D tegra_clk_register_periph_gate("dsi", "pll_d", 0, clk_base, 0,
> -				    48, periph_clk_enb_refcnt);
> -	clk_register_clkdev(clk, NULL, "dsi");
> +	clk =3D tegra_clk_register_periph_gate("dsi", "pll_d_out0", 0,
> +					     clk_base, 0, TEGRA20_CLK_DSI,
> +					     periph_clk_enb_refcnt);
>  	clks[TEGRA20_CLK_DSI] =3D clk;
> =20
>  	/* csus */
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



