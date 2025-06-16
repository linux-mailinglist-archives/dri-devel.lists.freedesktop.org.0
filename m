Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EC1ADA862
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 08:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C0910E2AA;
	Mon, 16 Jun 2025 06:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NQHNT9JJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D3C10E28B;
 Mon, 16 Jun 2025 06:41:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knPnCGTmUWtVkLw4eSxIDFzdCJZhxWg+Y5st4uYBxYJP/D9Odb1isybnSVhIhpbOLxY2Vx2bEXLC/+bhYYRMDXo/0DdtmC/+UU6JyZ20vGBSzY3f164Rx+TaFx2VgRT5yEBlgQbypPEuUdtNYkNXRSSfjo3oXfYwCp8gMneYu6foKc9FRGRZfhLTDatgbOg88iuulRIfmYtVTTp6pZBM1xlI5ogBRn6Q7LYfznTI0gzvQkVn4wkcoNe25S1ccv1vEcLnkeQo9dOHPEx+ExRjqcnoTxLsR1EfA/tmSm+a0RZQNXLKclW/f/qzy0S+w/G0Iacs2s33yODRZa1BqKFX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sz8F3jMpAu9vCWY/xpNvKb3AvdHPCof0kJEoD3iiNII=;
 b=aXDeHs4nX24fSxaa6ChWsNv2CWwvy1SzLm0VXZjvqTRUztm36B+kezoubEpAl4r8kxKxitkeo/YJlnKRSlWcykYCqoIdhfOiF4KbUwsa2UAC2hvmh/i3g0fB4eLSw33xtBeezbaxE+L82/5g5GkoojiSAvxTJHt2z5xEh+8tvqm35Fm1VDeXWCqP/IIn75O2LAWdnX/lcDz8VKMCQsIadETrtbly1McvYUQXxeJaCWnrZYNUs1TafMqNXUZzMDw/27YkUEsETn7Q4gBkAQyBO3iOr4IwDU+AlFG+tjvGM/6X1xtKHoVjISRqJnTGrqdC5k4+AfLyYnv1OaulNRQGPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sz8F3jMpAu9vCWY/xpNvKb3AvdHPCof0kJEoD3iiNII=;
 b=NQHNT9JJIQ6AIrInykSq2bvrps0ZGwuPLxzNHn17bH9Azxbr346b3ZlGHU/UOwFbPgibUcnDI/uk8DYCGQIFG3Qqx9XaOifj/e4h68nKDwynCGIPiNAI6/+wB6BcME9DXJBJ2RCKvibgRf4sYMkJjYVib8RlOEfcTlREOLL5iFDcDe084lONnSujdFGz92eqlEG2ijMzpYPEe+5wUkh/752vdRkINg9b1PKl4FR4UpMkh0oWq/+WGT/sdf0+MwE8FFoiJ6l0CtDVIdA2O997lUNjqLeqr9AlWyWePvi5oMdkb4x/+PQz3xtlAirpW5OC+hCS20cAFI/AH75enme5oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7294.namprd12.prod.outlook.com (2603:10b6:806:2b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 06:41:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 06:41:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Jun 2025 15:41:44 +0900
Message-Id: <DANR43CR8X87.1YWHJK7P75TPQ@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 05/23] rust: num: add the `fls` operation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
 <DAMHWN6ML8A1.2AUE4UWR58KR2@kernel.org>
In-Reply-To: <DAMHWN6ML8A1.2AUE4UWR58KR2@kernel.org>
X-ClientProxiedBy: TY4PR01CA0021.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f7fccf-c2f7-43e7-e09b-08ddaca0ddd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0lGdmpCbEFsdU8rSlBnVU1CUTBBVXdYckVOaEtMK25qaitidVM0SCs5TDBa?=
 =?utf-8?B?Sy9pUE9MR0J0L2cydWoyRGhtcGlYQ1doV0VRbnhhRmdoRDEyczVEVmVMa3NR?=
 =?utf-8?B?K0dNYnZGb1hjejlINjF1aDg0Zk9YcXY0L0dpUWQ2cGZyK0h0YllkTTBTa1Mr?=
 =?utf-8?B?STRobUxDK3ZMQWk3d2VwZFVxR0RiM0tRUnBFT2xpWVppUVRSbFpZN2UyRHpo?=
 =?utf-8?B?OFp1eUs1eWxzdlBWaFM0bmNoenJJRjV6YjVrMTd3RyttNjFPNXBqdU5lK29o?=
 =?utf-8?B?ZVF1Vk9IdHdSbGVxRVhxdDYzNFBBbDYyeFo5VVY0MzBxdTNFdGZ6c2piZU1v?=
 =?utf-8?B?RGk0SE1Wb3pyamFvMGM1aDhIY1puS2ZGVWZpcU13M1BBWmtIc3ZNZ2JTWWFD?=
 =?utf-8?B?S2JZUnRoUEQ4NFVnSDh3ZVo0ajljN25PaTkxcUFFVVRyUUowVVhSRFRqMzdO?=
 =?utf-8?B?R3VKQ1NmbmZmbjgwOC9PTTg3VE9DTGF3SEZZak5mUkwzV0xjWnJKTVlwNEtO?=
 =?utf-8?B?aEJTZTV5cVBFNTdCSFRkZkszYkp0TWt5bGRsMVdob3d3WTZCdjBPU0FJQ1Fk?=
 =?utf-8?B?MVlXSUxnL3p2cWd3YnpPUnVKWExGMDdTOWxDamZDZ2FuUGRTWjZnYnplTGhB?=
 =?utf-8?B?dWJ0Q1U2anI1MnBzRHZmbW5HU2RXSzVUSnRKQU8ya1pLb3FvMk5ZaEoybDlO?=
 =?utf-8?B?R2NkcXNBK1h6S1Z6WE9WSWtpcE9WRXIwS25nbWszczdKU2VtcnUxaUlhM2JW?=
 =?utf-8?B?cit5OWhwQnZRSmJPZkpSYm1ZT2FINW5HM2Znc0Nha3Y3T1JwZVZoVTluSzZ0?=
 =?utf-8?B?ZEtVSGpMT3poalgrQnMva1pNVHAzemxDRGR2VGxGNHdVZTgvVjZZU0JhS0Ns?=
 =?utf-8?B?bnoxbTk0OU9CY1djdjVQYk1DNFp6UDRmZnM0Z1B0Y1pzcUdLQnNwNTRjc3pS?=
 =?utf-8?B?QS9MTXlpb1lIS0RGN0NLWmNEek5CQ2t5MExCelIyVEpZaEoybUduRHVUYlND?=
 =?utf-8?B?Umh4V2ViM2JjOFZzMnl6WkRxWUIvN2RiSHM4MUloalZHb29UMlZDTzI3TkFo?=
 =?utf-8?B?RFI4SkhkdmRZVUQ1a253dzBvSWlOWEJ4Y1FKeFVJZ0ZyTXFET3k4eWptbEk4?=
 =?utf-8?B?bkZzSHdNcnJQL0VkWncyRlg5YzdTZmw1NHJEd051ekRxanN6NThvaHRPZmVT?=
 =?utf-8?B?WnZxRTlDdkhXZXZDcStZT0s3Ym8xV1l4SkhpV0pwL2lKeUtWbUY4eWZodGVs?=
 =?utf-8?B?L3lOZ1o4OVZJWVdyT2lyU3NkSkFBRlc1RFY1cGdveGUyRmsreWlycGlZMzZj?=
 =?utf-8?B?THNMdHZuR1YzWmc4QWFKaUVyOVN2UGtUaS9JMjNKenA4Z21XaDc2RXdLQjRO?=
 =?utf-8?B?amNLcmN1d2lCeDU5WU1XeUhWOFVpY21iQkoxcXZFZC9nbnJacDN0bXczNmxq?=
 =?utf-8?B?cjExcFJLV0dhalZocmg5QW1NZGEyVk5VdCtVaEhEV3JadnlLeTkyRUFjM1lw?=
 =?utf-8?B?ZVFaSi9tMFJtekJBTXdLcnBkOXJpQ2hpaTl4bm9zUGNvMURPZ2tGamlGSHZY?=
 =?utf-8?B?aXpXUjd1MFNJRTBvelJQWXhvQ0FNTlFrM3daR212YUtUVHVJSEdGOTRtSmx5?=
 =?utf-8?B?MlZIWWxSQ2NyRnh1NjkxbklwcTBTR1QyK1duRk1KMVovRDRGTUMxcXdPZGlF?=
 =?utf-8?B?Q0lnVWZNOCtKZFJLRjZmVXlyZkFPVmlKL3hlbHhNaGVFQmtmME45NWRwR0hK?=
 =?utf-8?B?V3RzbkRZdFh3S1VidW80SEhHSXIwdzNlNlh0dU9SYjQrM1A3K3N3bWI2bG1D?=
 =?utf-8?B?UWhkNUFUampJMkJETlhwUG5reHZCekJjTHJEQ0ExMmMzbitLUTI0eWVjbkNL?=
 =?utf-8?B?d1RsQk44c01tUjFsR1REbDFYTHVPQVA0UVVtSTM5QnFwL2NYZUhWYUFNTmRE?=
 =?utf-8?B?cmRWakwrVitkZWFoeCtTL1krRWFLa2FzQ1JpY0xWSXBMN2JlY2czS3NVcG0z?=
 =?utf-8?B?YUJOWkk1YTV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDBwc053UXdTUUZFSDNvT0Zwcy9DeUwxRHp3OHdJbjhoWnNHQWN4ZkIxVGxm?=
 =?utf-8?B?M2NOTjVsN051WkxxUUtwNk0xaW1lM0s1N05haGRFRGU0M2pDakZqR1NoMDhu?=
 =?utf-8?B?Z2EvWnFJREVsN1NCSytwZktMVGtqaFJCR3l1QVprRTl3VUZpcFg1QWZGRjVV?=
 =?utf-8?B?QU9Gd0Q5SXZYTlJVYWtieFYvdTlBbXRJMzJ1OHVmNXBaQVpyNS9qRHA0ZVNi?=
 =?utf-8?B?Y1VuTDFVNk9zQnFNSWU3alFHWlptNWlXcThzdzFzaWZhb2UydnBXLzNQR3Yr?=
 =?utf-8?B?cmszd3R4THBYeTF4Yi9INFVNT1lhT2Z4MU5GU0kvYkNmaHpqOXE1dzZxVjBJ?=
 =?utf-8?B?RHlBWTlyWEF0VERJcGozejhOeWNxM1IrYktndGE3Z3kyUEU3TGoyWUpjUlpW?=
 =?utf-8?B?SDRUejkyR21DSUFXdUFDQmkrenMwU1BjbUh0eVNzLzdPanNpNkJ2VGVrVUts?=
 =?utf-8?B?ZGloR0hSalVmR3dTb1lxYkU1a1VvKzY4S1FiMzhUbVM2V1NPTytuK3VtdDdJ?=
 =?utf-8?B?VjlrcitjVHAwV1BDNDZzaUFJemtFM1hUM0hJNjhRL095bmg2b0NhbndZbmR3?=
 =?utf-8?B?TnlDODBRVlZUeVNsK1NmQzBtWTNoK3FTa3hLamJETUhFaUFuZU82b2VYaWl0?=
 =?utf-8?B?VHpDb3VYKytBNWV5QThpdkwvNHFSeS9mUXBrZTNIU25lMGM5eTl6VnltU2sy?=
 =?utf-8?B?WDlvS2pBSTBCd1RpN0F3MkpZTkZxYUR0YkEyRHNyWHpKNGtWU1o5eUx2UnRT?=
 =?utf-8?B?dGJqRmN6OEt1N1dyNlBSUEpIV3I1d3laSHVrdDgrdlRTWHpmbGJNbGk4Vzg2?=
 =?utf-8?B?VUlnWDFScjJJNS8vQnRtdGl0djVhMk00WFYvTmJsQStYblJ1VHV5blVEdXdm?=
 =?utf-8?B?L0Ryd2NwQUJZZ2pZWFRmTEVmbitpZDdBUEJWMVJOd0hkUWdZeXVGOUNneW5O?=
 =?utf-8?B?WTZjYjVDTmFUUm43cVBYMGoxUkVIZ3JodWR6RS9LWGx0c00xT1BjRXdCTjE1?=
 =?utf-8?B?eEJobnNpMTdwU3JkRVpwNU1PSkNDajFOVGpLakh0aGNHUU4veFRsNk9aQWRH?=
 =?utf-8?B?WnZCQ1A3S0Z1Q2pRbGx3K2hCSi85VlF5dGFhbXRSYTdDNWtvcXJPb0FqaFpC?=
 =?utf-8?B?QlhwYUhoVUJQOUoxcGsrbHkzYlM0dWRDeWFGdi8yZUJobTFZN2VBTWljNUhS?=
 =?utf-8?B?VUx5dFdCSG1sTktEaHRaUDJJSVZtL0JvNjc5eEZFWUZod25oOXh6QzdtczZD?=
 =?utf-8?B?bVJta3E4MU1KTmtWN21RUTNRb00vTE1OSWxkdURoeXFQbUdjNENkOTdTUWo4?=
 =?utf-8?B?VTZTMXVPTUI2TjQ4a2MxNmltMjZmMjVIL0c1TzVWcVA5TThZRCtUcjRNRUVC?=
 =?utf-8?B?M2JRaXMwQ3pWbkZrWlR3U3pSUklCbk96b0h4UHA1dzE1UWI5b3p5b0RWQnhE?=
 =?utf-8?B?amtFc2h2cHdGWWNOUGZQNFlEZUo4SW9ZcWdvSHRWV0Fjay9rRjBGZE55Y1hY?=
 =?utf-8?B?aFJTYmJMd2Vxc3ZsK3R1c1F0bnpDdEpTNExENVJ5L0NZRU82MTc4cExNbndm?=
 =?utf-8?B?enBINXRKVTZOZlhQckh4eUJSK1JRZ0NHaFoveFVMakt4a2ttdVduUDJxWEJs?=
 =?utf-8?B?STZPK3N4dU5LUVkrejdzeHBKNnB4cFFMdW5sdnVqZEpsVVIyQ3QvWGswZUYw?=
 =?utf-8?B?RlQ0SDlWTzVTV09YTjdZWGV0OGprOHk3Z2FWZmkxWVZpRGNnQVJJdW5sdkNI?=
 =?utf-8?B?aVFLUDA2eUhJMjNwbUR5R0duRis2R0R1MW5QR3ZxL0dTMlRjaEs1d1dzL0wx?=
 =?utf-8?B?dVFVbkQ1UWhpUncyY1ZFa3BJb3kwQVIxTjZMeFRzS2RESnR2V0s3dXBzNUt1?=
 =?utf-8?B?YjVKTm83dkFxQnJ4eU1vUHo0WW41cldjVFpHckVaYWVXVytadjUydjl6YnVK?=
 =?utf-8?B?KzNnbC91UFRuSGVDTWZIZVBBYmNyc0FEeHN0djVXTXg2akQ3UWtXY3VXQ2E3?=
 =?utf-8?B?V1I1em8zMHBhK0x6WnE5MDBwSmZyaTllYXljWm44cXd0QTBZSUZBejVmVjVO?=
 =?utf-8?B?K3h2NTMrc3R4Ri9sM3BnT0plczlXVWlCd1FrUUEveFY2QU5mZVZVellENkNM?=
 =?utf-8?B?Vjk4UHdMckdjVlI5VEpVcWNWRkR6MHBoSzEzZHh2NHlMYThQSEE2M2RQR0hi?=
 =?utf-8?Q?R05CrwOXywGcxxBWRxT8e8ArB+PItLPFamklqDW+9jhI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f7fccf-c2f7-43e7-e09b-08ddaca0ddd5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:41:47.4673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: De5ML8/XLJfez0QJU6aaVmonmIG9le0+eu9HHRZ4pN6SFl15c8EpD2BuxkVVSsk5fE8xbm8OjVWgDtzTiQ8wvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7294
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

On Sun Jun 15, 2025 at 4:16 AM JST, Benno Lossin wrote:
> On Thu Jun 12, 2025 at 4:01 PM CEST, Alexandre Courbot wrote:
>> Add an equivalent to the `fls` (Find Last Set bit) C function to Rust
>> unsigned types.
>
> Have you tried to upstream this?

I will consider alongside `prev_multiple_of` that we discussed during v4. :=
)

>
>> It is to be first used by the nova-core driver.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/num.rs | 31 +++++++++++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
>> index ee0f67ad1a89e69f5f8d2077eba5541b472e7d8a..934afe17719f789c569dbd54=
534adc2e26fe59f2 100644
>> --- a/rust/kernel/num.rs
>> +++ b/rust/kernel/num.rs
>> @@ -171,3 +171,34 @@ fn borrow(&self) -> &T {
>>          &self.0
>>      }
>>  }
>> +
>> +macro_rules! impl_fls {
>> +    ($($t:ty),+) =3D> {
>> +        $(
>> +            ::kernel::macros::paste! {
>> +            /// Find Last Set Bit: return the 1-based index of the last=
 (i.e. most significant) set
>> +            /// bit in `v`.
>> +            ///
>> +            /// Equivalent to the C `fls` function.
>> +            ///
>> +            /// # Examples
>> +            ///
>> +            /// ```
>> +            /// use kernel::num::fls_u32;
>> +            ///
>> +            /// assert_eq!(fls_u32(0x0), 0);
>> +            /// assert_eq!(fls_u32(0x1), 1);
>> +            /// assert_eq!(fls_u32(0x10), 5);
>> +            /// assert_eq!(fls_u32(0xffff), 16);
>> +            /// assert_eq!(fls_u32(0x8000_0000), 32);
>> +            /// ```
>> +            #[inline(always)]
>> +            pub const fn [<fls_ $t>](v: $t) -> u32 {
>
> Can we name this `find_last_set_bit_ $t`? When the upstream function
> lands, we should also rename this one.

We can - but as for `align_up`/`next_multiple_of`, I am not sure which
naming scheme (kernel-like or closer to Rust conventions) is favored in
such cases, and so far it seems to come down to personal preference. I
tend to think that staying close to kernel conventions make it easier to
understand when a function is the equivalent of a C one, but whichever
policy we adopt it would be nice to codify it somewhere (apologies if it
is already and I missed it).
