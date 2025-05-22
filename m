Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D40AC0383
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 06:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEFA10F816;
	Thu, 22 May 2025 04:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HUNAY3ng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7821D95AB9;
 Thu, 22 May 2025 04:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhH/7rE8RXP+hl6uYikLdfVnSUB1eWKJiohaqckIx2llkXOSh1jV3/2C4O/8ILwcLm8kqGDbSmxB6lMkrTapcDIHAMy4kDH1FzOtf3xELAchtybolRBQLhZO0hx+ZHD7KerXkjPhnHL+rdjjiG8WGVClJhgMkPbGhep7T8md04lwaa7aHOO014hrSoBu2RMDreSfNenJP7WVYr2npJRJ3QBpEHnsR6NMoIJYlnA0BA39tbH4RXI/lwpH/6f00c+H9hK12zWPNGfXU8NbCENg+jWZGP6KfAPsUfA3BZcFV4wc64BtkQfw7Qcsfi6wddq+EPWJorRvZGUuqP6YFkTX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv2qeM2BhPG3oLtA1XTo86pZQW+gCGIeUtBliEwnozQ=;
 b=oyHJL0CmGu/Q8zp3lvG0DhtaZ+6udcxhKXon4mImRb3JQUdWjNZzH6+8n0e8MqnnYxOsDo3bViw6Tp4+iwISqDH62Im5WjY9Pi+5s6JuZGAnY6fsO4ZhvQoNVVlJdb3o1SKYODkUZUdrHQi2d7JGvKJHo6hG4LSJe/iHLcVHBcTydYONHJqg7ZXKarwPuce3GYa/GGYoADt40nN4ctFSYcc6WoZdhXvcg2K/9Cd/ProfujEHnIJBGsTJ6Y1C2uV/R6C6uM6r9YpWDmlX1JMHFYH0WCE4NsH3Q5Q8PiXA1smTsgKqF4J+31egbKz1goYA8+r3ILFxAyQ0nWr8WebFtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yv2qeM2BhPG3oLtA1XTo86pZQW+gCGIeUtBliEwnozQ=;
 b=HUNAY3ngatHwEOepB4p0XeMhmB+lt90RaHK7x5EN84zoJjs5iRaub6gqfo00YT4lMxGdyuU2+hQ+Kj9HV112nuEuE7N38W3Gq2Q+y6LR1xFaKIT4C/kTwcr3abFnESPoMw7odBPhbaa+9v1C454YnNzcQRTlmcMD7d4rSFFjQaJlocybNGnUypCzBDbjp27MjRA28G8zdmI7OtxzLtf0BIrVO9eZVobDmtnIPnjC7SFy6DUZNsQKP+yKV6oyr0SWGj60X36Bav2QStI7G5od2RIK+YEnzLX+9+rptgulPiYjEzKS6PvvKWoNvG/d7kijq/zdVFVKIDZeZCWL+fkZvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7842.namprd12.prod.outlook.com (2603:10b6:510:27a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 04:01:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 04:00:57 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 13:00:53 +0900
Message-Id: <DA2E1BNC668R.MMCARZ3K2NTS@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
X-ClientProxiedBy: TYCP301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: 016863c0-ccdf-4a35-db00-08dd98e54115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnFmMk1IaXJZeDZURlZkcFN5U1FCcmVWVVdNMG9wbitheXpscHRucWRZaTJo?=
 =?utf-8?B?RklLMEo3T2pHUHM5cko1dUdITHVMYTBYNFZhcTQxM0g4UVEvVEViVWd6Ymxy?=
 =?utf-8?B?ZUNWa0E5dnhzVU1YbWQwKzdLTjhuQ1h6blBBbktVd3lmYUE1Y1FoK3dxMDJC?=
 =?utf-8?B?TkVyMGluem42QzBUNy9BV3VraTlxY1pQeE8vM2hsK1IzN2RUcTh2cWh1c0g3?=
 =?utf-8?B?MHZ6c2hLTkVRWDFqL1lOZnQ3RGptMzEzNzFFZklkbEYvMFcrOFc5SGNwYUNY?=
 =?utf-8?B?ZmxJY1BwcUh4Z2ZOempSNlduUDVLL3FIYmZjeVpZQmV4dWNDWE80Rm5ScTFo?=
 =?utf-8?B?MG1XTzNrSEk4RUdTakIxRXBJRmFmTWVUQnNZM3FGOGJoTUk5RTBOQktPN2xt?=
 =?utf-8?B?VW5FTjJiV2NtMXBnWC9hcFV2Z2s5dUtmZ3l6aFJ4L1FubCsvZUxPOGxsZlRh?=
 =?utf-8?B?QlR0K0R1V1JsQnR3NXFNWWdSeGZ0bnVraStOMkE3ZndsbWNzcEhjRnBkV3ps?=
 =?utf-8?B?RExWV1VDUXE2L0YwTHd3dE5UMU1JTEFYT2lDa2Z0dUswZk9BZXo5K1BYZ2tL?=
 =?utf-8?B?NDl0bzJ3d1ZkM1YrK2d1OHE0b1V3Q21FUkNaU1dNbEJaRmtJRldWOE5JY1B5?=
 =?utf-8?B?Zk5WaFpHQ2p2VGcvSDZJc2Z2dU84MGVTRDJRS3VTdFZoSVdleGZOaWVnYVpy?=
 =?utf-8?B?MVZHS01NTTMyNXRGL3VHN1ZtRklLWXU5YlpFaVh5TGZVU3U3R29Xa0gxVm42?=
 =?utf-8?B?ODlOcEFDNitJMFVrK1JnekhQWk5TSUlndTVMUDR4R0Z4RkxvOWlndUR0QjNK?=
 =?utf-8?B?Uzltd2lKQnQ5WW5mUFJXQ0p6WXJjVlFpOGZGeWttSXRMUHBYdkpqbzk3WExz?=
 =?utf-8?B?R3AyL1JvNE9BelZYa1NNNDdLWjhJWE4vZWlQMGc1Rm41dlhHbzVka3Z4NFMv?=
 =?utf-8?B?a0Vma0ZUekFRV1I4TDVEM2JleEQ5VGdUdXdOL2JpRzFUUjFZaXVUTlJBTGJy?=
 =?utf-8?B?R1hGc0tkWTIyU2J2c29LRmlVdWJCR0plZ256SGZocXNLNE91NUtxbTRDRUF2?=
 =?utf-8?B?QklyMkRvdU82VkI1bmkyV05xSG9oeU9odlAxNnR3RnptTHNyaFlWRmdWUHI0?=
 =?utf-8?B?cDY4L0V4NUgrcDI0NW1iQlVmWXQzRGRSc2lLd2k1YmlnODJBejhJY1JoU2Fr?=
 =?utf-8?B?UWRMYjlvZHJFbEo2aWxrTDVxa2Noako3VE5zUCtYZ1ExZjcydW5iYnhCVzdz?=
 =?utf-8?B?WjdoS3RCM2dxUThldytRQVB0KytIMkZ6Mk04cTZKMnBvRjE4bldoR2t0VW5L?=
 =?utf-8?B?cHBKU3lPeC9BZGk1Q0J4R0NnQ2pUa0NvLzNJZytzQXhrRFdEc0JBNkJWTkR4?=
 =?utf-8?B?YnpsblQrdTNvNTlNN3gzaEFUWksxVFdMNERlR0tKVWRTZDdtR1NRS3R4Tkh3?=
 =?utf-8?B?dFduU1RkYTJlcnQzcFFqeFdzV3Nja2VBUnVMQjh2S1pHWEFJMy9pSXo4cXBW?=
 =?utf-8?B?Z3lwMDlPL2t4NERneEF6NGhFd1BZUnk4eEJSaGJtQUpnRSs1RUYvZDdxUjRM?=
 =?utf-8?B?bGU2Nk1Ba1JrQzhoam93Vkt5NGhJdjdDeU96QUF4eW0xVDd6eVJiRTJDTkxn?=
 =?utf-8?B?aFpEcGhSVHNNYnlCaWs0VzcwclVPczUzTDRRc0dQQW5KTHNyRDFOenA5SXEx?=
 =?utf-8?B?V0NwcnpYcFB1dUZVQmliU0txNkVQNVJ0ZE5OZUFkelplcE5GRTdqK2wxMUJn?=
 =?utf-8?B?K3E2REhOWVlxNm5nbmxxU3dkZjJvVGZMcE5idWFrOG8vSVBWQUZCSHJEOE93?=
 =?utf-8?B?QWZGdGxCUlgzTFlJa0toVXNhRGRDRncyMGRVcHVyeWVRaGlTdkRoNElrUm5K?=
 =?utf-8?B?ODYxbnFDakcxV25ZaXlOUDZJa1RNRk9UVXhiNy9iRHdMaU9yelRSbGFZczJ3?=
 =?utf-8?B?a3lTSklHRkZPRVZVT1hqTGVta2VzWHgxbDVhcVoxcTJtWk8rS1QyN2c4cEZs?=
 =?utf-8?B?NXN1a3liMUZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTl3SXJnYkVJYzZreWxLU0FScytwbnR3MGEzcTJmdXpVSXdoL01tWXBWK2Q5?=
 =?utf-8?B?VWRoaUhxQjUrU1BnY3BIU1I1QlBTNUVvM2ZVM0ZaWnNoNG1YNG5PQktCRHhw?=
 =?utf-8?B?ak5ORlhQb0ZhOEhwS09ZZXEydzZZMThMZStlREJkMjlTbDlOTUZDOFRMMGxx?=
 =?utf-8?B?ZVNQMTRycnJzS1BWN2xpOWZzRXVKMzF5b05xWjZ0U1lzLzN0SDU1dWs3NjNC?=
 =?utf-8?B?bTlYTTZSOEZsbThBTzFhNURCNUtSRGxJVXloQks2ODVGYU1lVG04cU5CQ0ZE?=
 =?utf-8?B?UVVFWFQ3RHZrSE1JMWl1T3Z6RjAxeG81YklWRExlU2c1NW1JWGJYeGhERGRs?=
 =?utf-8?B?bFZJbFZDZmxGWUE5QWN5ZE5CZ2RQVkFUTTNZY0Y3bFg1bzJ0cXNzcURDNC9O?=
 =?utf-8?B?b3d2ZzNZQjZNRld4Skd2Q2UrNlRLaWdWVHlLdFFRSFU2SGwrRW9EeWFkVE5w?=
 =?utf-8?B?R1RxdFRpb2FnL240aDBQNThqMm9qVk93U2N4enkvUGI1RmEvQTQ2ejIzbXda?=
 =?utf-8?B?bWZaYUJobWlxRG9mZllTRFQ2aHBQWDVSRFZ5dWs0TUlSTHZKNThZRFF0QTRO?=
 =?utf-8?B?SGdaRkdGMDBXOTMwS1dxMEhhekZqdGgzeU9rSVBDTzgzSDV2MlBTMVFDZmJh?=
 =?utf-8?B?WE5CWGhqb0tSajNXMzd5WHZBNXRpMkRhRTNhc0o2YzRYa1FOcDdnYnkwTGtM?=
 =?utf-8?B?aHh5TkJrSk9pNDRsU21hZkpJMjRIWEhlYldxOE8rbnV6MHdUZnlubzluRU41?=
 =?utf-8?B?YTZ5bFc2N1dWQ2YxbGQwajNBWnhub0UvTlc0ZUxJNjdZRFgwd0RFRSs3Q3FR?=
 =?utf-8?B?Si8rUUZBclhZdUttKzgvK1AxNmV4YWs2cGFlMWZFWisyNWo2cThmNTRjVHZh?=
 =?utf-8?B?c1psS0FnMTBWa0N4dUk0SXNxaGJWalRxWFllL2pDWXlzV0poQnFMYmJubzBq?=
 =?utf-8?B?TXREQmJVaXdZSTRoSVRQa3RvVmVNbllianBsT2R3SXZrL2VlQllSbmVRQ1E3?=
 =?utf-8?B?MXYveDMxK1lBN0NrbCtWQnlqOFdzVnNoUWN3WGFGMlJnMXU0ZUo4TTYrS0tS?=
 =?utf-8?B?bnRKVkF2a1dOL3RpOG5rTlRsbHZyMXdlRkJNZW1qdnR4Q2g0cG4xMWtFdTIy?=
 =?utf-8?B?UGk0L0pyTVlBa1ZibVNMU1BPOXVROGR4YWFLdWVLc0JHN0U4MC9qaUhxdHdR?=
 =?utf-8?B?UGExNTRHeVMxbmdnODgzZGVpS0UyYmdRNkdOYUFlOTFCMEtNT2FYVGVwVnlk?=
 =?utf-8?B?MkI0TkF1NzNGc1pDbmRzS1c4RWxyUEhpRjFLV1JpbDNLRlZRZ2FJYk9uNzdY?=
 =?utf-8?B?NUlPNW41RUR0WnBwbzVpdDVMNFR6Z2JqdnVDOVduTWNYSG5KUFVxcmhjTUZy?=
 =?utf-8?B?NEpmSjJwYkZWVTE2K2NyKzZlQmpyK3MwQlRJWTV1S3AyN290VEN0dUhWeEVN?=
 =?utf-8?B?SFo2eE5hRERCTVdjdTAweVVZbUw0cTh2aTI5c0FOajBab2Z2Z21YaU9kdDYr?=
 =?utf-8?B?VVVXbjVnQzhFQjZZZW84MFpSODNNNCtvTTZNbmtSa3FQOU5CTTRWMHpnWkd1?=
 =?utf-8?B?NHYxN2p5SEdpUFY2S0lJSGEzZmsxNDBTZTlCQ0NBZDltSGt0amtGbjBwTTlB?=
 =?utf-8?B?WEx3WVFZTzRLc0hVdlhCY0ZQd3BjUlc0ZVRyVkVJZW9ERjQvR1hjWCtNTGcr?=
 =?utf-8?B?NnpCbDJRdjBBUUpETkNFM05HQzdpalhVSHRKMmVYZ3pGdm5lZVdVVGlERU9X?=
 =?utf-8?B?TUJTUHFoYVVpbDRGb29pQlJHcXJ3TGNHTFRtV0hWSkIrSVF0M29MM1JXenZR?=
 =?utf-8?B?NkJieEtrenM2Uy9NM0djSXFCNVM2amtaWC8zWWNnRG1Ld0RWU3RKY1BXRDlW?=
 =?utf-8?B?THZyWUNhSGNMTnoxYzZHQzZSckVTUG8zYTJ4Z0NZMTJFWVFvR1VCSkZkVVRt?=
 =?utf-8?B?NW9GaWgvNDhHT1ltRWxJZURVckt3SWpsZUxNM1piSU5Ya2tMNW1sL3FZQms5?=
 =?utf-8?B?RjhjRDBodjkxOGYzTXZYbFo5b2pRSzdPcDZIc2NTK2EyTFE4MlhwOStqME8x?=
 =?utf-8?B?czhMdndiSytNNXp1RlMzV2kxQ1ZFQ3pGVmVTTHdPNFhyY1BENjJlTXhtV2J0?=
 =?utf-8?B?N3BncEU3NU8rb1hYTEFubUY5QTNKSWo3cDltS0NrY1RsSSttcWUyd3BxZWNW?=
 =?utf-8?Q?qKeYSy2cKSIZs8Ep8hCzwbN2NKXaJvmzVSdrjfjFe7NH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016863c0-ccdf-4a35-db00-08dd98e54115
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 04:00:57.5230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAOJ1kKPSPiEDzBDfiDHyRSL20HVGQ8z4AG0/uQAl7UXaBPDtgtDhegV17E05OBxoyraoGcdr+abWdTmJAboUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7842
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

On Wed May 21, 2025 at 3:44 PM JST, Alexandre Courbot wrote:
> Introduce the `num` module, featuring the `NumExt` extension trait
> that expands unsigned integers with useful operations for the kernel.
>
> These are to be used by the nova-core driver, but they are so ubiquitous
> that other drivers should be able to take advantage of them as well.
>
> The currently implemented operations are:
>
> - align_down()
> - align_up()
> - fls()
>
> But this trait is expected to be expanded further.

A trait is nice, but prevents any use in const context... After looking
at the genmask patch [1] I am now wondering (again) whether a set of
const functions would not better serve the needs of the kernel.

Either that, or we enable `#![feature(const_trait_impl)]`. I just tried
and with it we could indeed define and implement `NumExt` as const,
which looks like the cleanest way to do this to me.

The functions of [1] could then also be implemented as methods of that
trait, which would allow them to leverage the macro generating the impl
blocks for all supporting types, while having their examples/doc-tests
in the trait declaration.

[1] https://lore.kernel.org/rust-for-linux/20250326-topic-panthor-rs-genmas=
k-v5-1-bfa6140214da@collabora.com/

