Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AEFA947A9
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD89510E2B1;
	Sun, 20 Apr 2025 12:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DtoTKwRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4592410E2A1;
 Sun, 20 Apr 2025 12:20:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAKX4H44pCfn1yPQG1xop2EUgw1yN63kc50qak9uK0z3jSZGenXBuPkbbfhjtTFUL2t/fob5X8LSYVLpfj7vbSvE1nd68POmBacXXUCVMWyKBaLThuTQiUNTDFMH1GHlNU6B+vLKwMjk8w1E1wtMXiRorzSLQHGTrK9A4ORWss0aamCunCqyszrnWHTk4BlaPyfYOjtKoVhf/dA4Rk8R9qT+ZFD8XnynOXj70NbY6KzdvEGs7pN7kPpMLHazP1WwPPJtV/t1+6p7YE4lLyoN1U7U2hpAw0Gu7OxzTz6DA5/KWj9iPoDEMrVNfCBn/r+vLdeVKzZv8I+HP50+PSnp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irB1IbCqc/a3OfWnRZE8DG4+g7cDjGxVbBI+6xfczB0=;
 b=ioO7lS6bUWUyheWF5RsJ90wPZV/5yDV91JDvY68u0bf8PfdzGgwjvW4hi1pnKNwekRS1qfg/nYi2DpSZrFHD0Md92Jb6BdE2TeLvw/Ax9gKipRx3NsrUo/nZ/pcKCfhLsG5yNIuQgYsqLffUHvBDngqWKLI5bMnWF5ahz5Unq8L8nMWYOJT0uRxhFlGfku6zVWWaxtB+Ixk7Dq7IfBpCKz3hby6jDUptCqsCWwh5eUESeTXGCFihbC3AcpdzCq1k4yCQQAJOoUJ+vYyDwLrY1fpI92CumgZ478SapnNDC2JMZRKPtuLj2brpVAUsDknqLXWJ7j0Q6GOdiXPZNEB0OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irB1IbCqc/a3OfWnRZE8DG4+g7cDjGxVbBI+6xfczB0=;
 b=DtoTKwRnvxw5wKA5IamtjaB6CuhaPxNbR595oe26pvvMMSA9cNjkI24QM76E/DJVFNl/1UT4IBzjc+UbdRs/O6ewEYHg/sdNbKkWdgpQ6zJ2wvngFTUDQ0ARTxeEaAaRtPD8S8YBuiEQbm1q4BE1EPVyfVy5tNCsWIMJDUxTc210LBulmMP6vvWTZrUCdl12E/02fYRTxC4eye7SjsOCW8/DXMYEzPuvLU8nf1prSL1pWrc50XqWPJ8H2w+CvOms026bOsrsxgeteybQA+KOhD9VGJiJQ9zMiR6rojILSQHWUc2Txby3O0a3P2TL92/iHJeIYLJW9qrAymfwWcU9xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:19:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:19:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:33 +0900
Subject: [PATCH 01/16] rust: add useful ops for u64
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250420-nova-frts-v1-1-ecd1cca23963@nvidia.com>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OS7PR01CA0155.jpnprd01.prod.outlook.com
 (2603:1096:604:24d::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: a34ebd69-17b5-4ce3-c7b8-08dd8005a853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjlZVC84QnNaS3RFMzRNenlCUnJxbzU4bDVreHBtNUNMV1Q1dWZpdzZpR201?=
 =?utf-8?B?d3N3cy9USzdPTG9uMEY3ZkIyemRFTklobTYrZ2dXQ2VlOGtUbGlOVTdDZVFH?=
 =?utf-8?B?c1FoOFdxc3J2N1NwbDBZYlpjNXltZGsxb3hjZEdjZUlzYkllaXEzZmhKcDNl?=
 =?utf-8?B?QUFPbGN6Snh0a1FlMytGRXp2MGp6aHk1aksyWkdubXZiVFIzem1oNFZQT0dw?=
 =?utf-8?B?amY4ZjNsWjlnOEdqVG1VRG5VOXB1WWRGOW9DN1RMSUY2WkZTOWkxQ25yK0sx?=
 =?utf-8?B?bmd3amJpSUJpa2JHOEhBQnI1RmZWQmdZSVNiM2tlN3YzOTEzakNtMS9VOW1D?=
 =?utf-8?B?K1pwYjhtMjFEZDFENmZYSTZlcktLREs2M1lxWExrb0U0dDVsL1dGNExWdjlH?=
 =?utf-8?B?T1JYM2dzNEJGUCtIL2k0V2xabWtPKzhyNUdrOEttQnFRNDRXNjBrZEpiT04z?=
 =?utf-8?B?aE4rNWZORFQwMGJFbnFBTFdVTUVPbmVGUzlKWitoMEYvaDFnRGFqYzEzWkM4?=
 =?utf-8?B?ZnF1Y1lqWGVpWUdieW53Y3F3cXpSSnVLSVJhdUNMOVRxaENCQTVUcnY2b3Rx?=
 =?utf-8?B?T3N0MzlGV3FPTjJCWWcrd3U0YW5IRm1vZ1ZIajFtZ2IrU1pUOC9YOEUxa01t?=
 =?utf-8?B?cDFoSmVqWVVNbXBPc25nV0tKS1pqR0lOTXc3RzA3aTdjZk1QbFoxeGtnT0RD?=
 =?utf-8?B?bW9lU1FSM2ZYWTNCV1Y4MVdTRExUSXFRdjMxRDIxa0JRdE5md0VHc1NDa0dD?=
 =?utf-8?B?dW9lRW1JNlpTa0IvUTY2djhQSFB6a09mQis1aXJzd1FFK1E1RnNaTXVDNmNo?=
 =?utf-8?B?R2NVRy96eGc3VnJ5eEZRbU5LaER5MVhDd0tUTTY4TG5qZjhaOW5GNXRvY2ZM?=
 =?utf-8?B?UndBeDNvQ2xPb1NYR2h2SFk1MGltWHgrN3RuM0pqdGRZK1hMNEZ0SFF4cU9n?=
 =?utf-8?B?eE53NXpUUlJTbGdmSW5kN01sT3Y2ZFBvUklpakF4bk5wVXlKMDNiYnRLbEdU?=
 =?utf-8?B?ZGlEV1g2Z0FyQUorcGM1dDJONXdVR2RUbHFsZkxxWUo5aEJGUkVHdzZVREsv?=
 =?utf-8?B?ZDVocExhNnVTbEsxNmkyUnpaRm1KbjZJTmtTWkJFTHdkbW1qZldpOS85T3RE?=
 =?utf-8?B?Z0U4eDd6Q2dTa0ZuN3RVWDg3dmVOQXB0RDQxT1lIQ2szN29rOU1PRW1Kd0d5?=
 =?utf-8?B?K0dEekhLalZId1NIbWx0Y1A4cWFudW82dzdtL0ViRXg1Wmtzb1hnRzIzR0Nn?=
 =?utf-8?B?VXhzQVlvb2ZMTFdkaWdOS2ZGanFxYTdyNDFWTmFBTHI1MUFMVkJsWE1ZY1Rm?=
 =?utf-8?B?aFY3MGV6SGhOOHlKTXlSeVBvcDh4N3RtbHBtYU90cE9wbHlqelNzckxPb2c2?=
 =?utf-8?B?QnFiNFJUVi9KKzlIQ1hlR2c2ZmMrajlJTmw1WktvVmZEM3U3d3pza0tpSDg1?=
 =?utf-8?B?SmNpWmV5ajAyOG8xdDRZK1dhMk5iQkRMdVJtbFA0TStUcWx2U1pqblJMY0t3?=
 =?utf-8?B?d0ZucXJQUmhBVGtybWFrRnM4UjBSQzcvaU5aSkVvU09PTXBKbGRLRXpjbWY1?=
 =?utf-8?B?NWdYMUFVZzVBRTZ4Y1FoazAxVXRmN0J1a0hOQWs5bXJFbFI4YTFWeVhWYVlU?=
 =?utf-8?B?MS9zVmlzMVhvNDhiZ2Zrcno2cEpuejRISXdFZkpUUXdxZWpHNjNnNEVVWnY1?=
 =?utf-8?B?LzQrempNYW9qY0xzYWUyWEswYkdXTHJhQVgzOU85Y2FmU2ZjSWxoTE5BaHRH?=
 =?utf-8?B?aWJwYVovV2NUdm1oZVc0aDdLWXd6aGprcVVwMTVDVmpSYm44NXQxZ2tuUUU0?=
 =?utf-8?B?RlNISWRvV0pvblV2a2NESVkycFF0WTlvYitlOC9JcWFxV1VNTUhBSEhkWjZY?=
 =?utf-8?B?c2poZi90Q0Y3ZTJzU1JtVWNVamRSNzZ6OGhiWnljY3VtM2tOOWhyTWFHaG9B?=
 =?utf-8?B?d1NBMGg4d1llWnk2V2RXNjB5QkpGMzI5UDM3K0pBRmhlNldhSjZyUlY2eHJ4?=
 =?utf-8?B?VTQ2dGxmb3RRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDBYelV5MVRndVYzYjNZU0hmd0dPWXBxcUhQbGpPUHlNK3FVdGF0d3UrL3BS?=
 =?utf-8?B?aDIzOVhxbU5iNnV4cjd5dkZOaGViaFk3VUZFeWNEc1B2VXk1aXdpNUtkK0E2?=
 =?utf-8?B?bVNtTlBGWUFGZ2F0aTdKV3o4cFZINE5mSnhjS2F6OGlaUHlJdXlSTnZKK0xj?=
 =?utf-8?B?UGRtUFNRQ01tTnBBKzJLbTdueTlBa1Nna2xNTE52VG5peDJGTmZhdEJoRFh5?=
 =?utf-8?B?R2lrZmF2UklSbUpKODN5c1dnM0tMRjRuWXpoQlBmNnF6ZHl0VGNPN2VhNGU0?=
 =?utf-8?B?YzdaZmlFOHpiMXRsK3NtN2pKZTJSdnI2Wm9USitsekZCNFExUzkxR3V1dDY0?=
 =?utf-8?B?bUUwem14aTgrbHNVeC9SbmZVcnBzZnBMMGNjekQvUFZzMWpsb3pVMmNCOWg2?=
 =?utf-8?B?OUVlalQ4SmUyS2FmWU1rTG9KczRCd3pyNVc3SklPNDN3VGZQK1ZhMExZNnpy?=
 =?utf-8?B?MHcxSGk0ZU9tdHowRzZuUGJ0U1NKKzlWcXdDWHJCRzFrdnA3aTBvblRjTFZN?=
 =?utf-8?B?cDZJT1F6N0JJWkdOL3VHN1lLQktHZDFzS1RwOVZsUlNLQWxPWnJzVUdLUGlv?=
 =?utf-8?B?WlJVT2lQVENJU240YTRwSUFjZmpabFRrekg4Uk1tOHRDbzlKc24zaUFocVU5?=
 =?utf-8?B?U1B3UlEyNkR0RmhJRHlSYnQrQkVzaTJMZHZBWUxkVlYzd1Z0dUMwcFhDclIx?=
 =?utf-8?B?L0Vvcmh6WVorSGJ3UUNmNFJKcjFiU014MVVsdTlDMG93THhYTDIzSkI4dm9D?=
 =?utf-8?B?R3U3d2xOMEFUOGFnYndEbnkvNkszTG1DamtTUm9Xc0tOZ0pZV1kxZjlaWmdM?=
 =?utf-8?B?ZFpHLzlBTk9TZE1kdWZhd0ZvUkRDNGFkWU9OWm1YeTJVNU5TK1IzcFVsaVY2?=
 =?utf-8?B?c0ZVMHFwYVlkbHBJdEIwY2R6OWI5MnF4QjZScnU2c2MxUWRZeWZYMHJIWmVE?=
 =?utf-8?B?dk9SRGQvQnEyclVTRFR0SXY3VnlrUzhVYzZPTmdFeGY2QW5XUzh2aG9DVnk4?=
 =?utf-8?B?NTZzRC9TTWo3Z2VoZ1Y5bjdDZmNGalI0QzZBZmQxTzNrVTM1U0ZKT1M5RFVt?=
 =?utf-8?B?QTdYNlFOQmJ2NFlnYzlKdnhibUhpeW5rMExKSWVTRDVTYnhwOTl6MUt0NjR6?=
 =?utf-8?B?ZzkzQ0U3eVU0SWxraitFVGNTNm0xdUdYbkFhMlNlVnlhVXlGbEM4NWZSRUJM?=
 =?utf-8?B?OTAxSEhiNHBPSGQ1a0FxdlBoL25nWXdMUEpLdnVEUUZvRlNJSkY2T3VxSnZP?=
 =?utf-8?B?ZmFzcG5WaUpxNDNqTVJGWTltM0FQZ1NsMW9jMUxLQVF3ZmpFL2JoQWprZXVJ?=
 =?utf-8?B?WURCL0VtMmlVdGt2SDY2QlZJSUVLaitiMEN4WmVyNjFPZkREUWx5NXl6QXRR?=
 =?utf-8?B?MVJ1NnAvYkw2TkNsbFNLTG0wbUIwYm5VZnRJSzdLLzJYN2txYk54YWw4NENS?=
 =?utf-8?B?bXRDMlNwMUhwcFF2Um96eXBJeHdFWXc0Wlc4V21ZOE9UNTlTK1FaN01MQTN2?=
 =?utf-8?B?QUxLZ1hsd2NiYUpYdW0zcEpKRGZKZVJIRUsxcVBINEhyU1ZVZ1ZZejhpVHlk?=
 =?utf-8?B?YkM5U0VURnBTUStzenB2ZWRvS2srVDRHcDhwTGdDQmVGT2lIK0FVT1padmtV?=
 =?utf-8?B?Lys2MDNaejJOd2pjMzIvM1FVTGFyQUxjWUppeXgrWFRwVDI1dk5BR1VZVVJh?=
 =?utf-8?B?bTNIZ1IwQStZeHpXcE1CR3VNMlNrMUc1M25JNmlQeEtzZzVSWEZzZEE4UjVD?=
 =?utf-8?B?MHNFbFdjRlk2NjJML0hVTkRYOC9tekI2Vmo5SGhkUkhzQmxQcGFhUnUza1dL?=
 =?utf-8?B?cE4wRHVoVWRQbjZwZi9RYmprQ2w1dU1Za1JaMTNvcXRROUVDRFpyYkFqSkVy?=
 =?utf-8?B?clE0V0VhMEdiVFYrN2VNVVZhSGpHeVJ5SGdaYXlaclB3UUlQR2RuZExiQW1Z?=
 =?utf-8?B?NnV5eUVDTWZiTHhsZVNhSnlYRHV6ZmdGb0hOdnNKSXpkdTBicGRKTE5iQmVV?=
 =?utf-8?B?K3lTQUMwV1dxNzl4a1VVV1lYQ3ZsejdCNkpkTkUvQldlcGJ2SEpSOVo0UkFk?=
 =?utf-8?B?SXBIMjhLSFZCdGhvTk96cU1ud1d5d2R1cVVuVWlLeVZwZURmY3V2azBlbldC?=
 =?utf-8?B?ZTQ0ZWUxR1hBaXlBTU4yaGE0RUxFMlA1V093bFMrU25XMGZVcG9tSU5Fcngx?=
 =?utf-8?Q?1BQv3he6g+K2QOw4Q50/gbo/WPChtMdkaKRaZ/FfHaWv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a34ebd69-17b5-4ce3-c7b8-08dd8005a853
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:19:54.4982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zrdBTV00ifJ1NymMT3RTLB0fwJsQAsp2G8+yYSKMdv8Hw0osBxOAWVWBZlW9HZ8qIeDDwOqzEXH0HE9lCaKxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

It is common to build a u64 from its high and low parts obtained from
two 32-bit registers. Conversely, it is also common to split a u64 into
two u32s to write them into registers. Add an extension trait for u64
that implement these methods in a new `num` module.

It is expected that this trait will be extended with other useful
operations, and similar extension traits implemented for other types.

Reviewed-by: Sergio González Collado <sergio.collado@gmail.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |  1 +
 rust/kernel/num.rs | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 55a8dfeece0b27f188456a9eaebd1045c4cafbcb..e30d2c075a3607f6ea40c901b3281e8798e81260 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -65,6 +65,7 @@
 pub mod miscdevice;
 #[cfg(CONFIG_NET)]
 pub mod net;
+pub mod num;
 pub mod of;
 pub mod page;
 #[cfg(CONFIG_PCI)]
diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
new file mode 100644
index 0000000000000000000000000000000000000000..9b93db6528eef131fb74c1289f1e152cc2a13168
--- /dev/null
+++ b/rust/kernel/num.rs
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Numerical and binary utilities for primitive types.
+
+/// Useful operations for `u64`.
+pub trait U64Ext {
+    /// Build a `u64` by combining its `high` and `low` parts.
+    ///
+    /// ```
+    /// use kernel::num::U64Ext;
+    /// assert_eq!(u64::from_u32s(0x01234567, 0x89abcdef), 0x01234567_89abcdef);
+    /// ```
+    fn from_u32s(high: u32, low: u32) -> Self;
+
+    /// Returns the upper 32 bits of `self`.
+    fn upper_32_bits(self) -> u32;
+
+    /// Returns the lower 32 bits of `self`.
+    fn lower_32_bits(self) -> u32;
+}
+
+impl U64Ext for u64 {
+    fn from_u32s(high: u32, low: u32) -> Self {
+        ((high as u64) << u32::BITS) | low as u64
+    }
+
+    fn upper_32_bits(self) -> u32 {
+        (self >> u32::BITS) as u32
+    }
+
+    fn lower_32_bits(self) -> u32 {
+        self as u32
+    }
+}
+
+/// Same as [`U64Ext::upper_32_bits`], but defined outside of the trait so it can be used in a
+/// `const` context.
+pub const fn upper_32_bits(v: u64) -> u32 {
+    (v >> u32::BITS) as u32
+}
+
+/// Same as [`U64Ext::lower_32_bits`], but defined outside of the trait so it can be used in a
+/// `const` context.
+pub const fn lower_32_bits(v: u64) -> u32 {
+    v as u32
+}
+
+/// Same as [`U64Ext::from_u32s`], but defined outside of the trait so it can be used in a `const`
+/// context.
+pub const fn u64_from_u32s(high: u32, low: u32) -> u64 {
+    ((high as u64) << u32::BITS) | low as u64
+}

-- 
2.49.0

