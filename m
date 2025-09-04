Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5905B43054
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 05:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E28610E3EE;
	Thu,  4 Sep 2025 03:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SrQTop5h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E5510E3E9;
 Thu,  4 Sep 2025 03:16:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOavQE3qxR/frTpXHyMhbmBQ5PUJUG+ubmK3KoWeWsHng+FMTmBY0QaF1K3hZUutwSLBHunZKRDD/3VZqQkD96Rto57/zvqO8hBiRJIeM8h29SqzMDwzFA0GzfRN3sxAvDcQzG4Y/X7gcxTU3CVDj4W0fwYaUNEW9covB8g7C93bbmJVt20MUbMCSCtLSbVxlqgnKYhEzpeJkx+yD2h9LJleR+PW4b+1U251ZEbb6eElTCrnWdbXA3T0yyze6gLc1YMHGLcaC5xUXEkq/9Rz1O6GaudSkV/eQFlQs3TukSboKDKVqlQp+QwGUzDodA0zM4/fnd31mjYKI0ZAxZnQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZuvOlwnxSpuulQzOXo3165nag2lzdEnoNAUEsM9QeU=;
 b=ZhdXOGdCwetU3CQgNS92/uZiIWN4F6gwjwfiEiy7cZRRHV4agx7SSJlipXLEv0m9DWB5SnYY4sXqbK6iW56E0zSztD0yOq0dyAxB8m+nzBhzRQ2FRTa0aBX8VDDSsG+FSPXjZQt4Yt+4clbyBOERlmH65XN2zD2VlKgngOESPy6l6zholxO/ANj4mzTwIDbticx0stNyfCddOnyp/Ro7whhufqIF8smc17bDRW5qYJtaPfWfWyEozYjnsJjq/NbRVc2w6sWSQvNLaIj4XIP1VZcPzsrLOZ4DP/i/+mWc6KKYYBt+le7sSFyrg3CSwXmjE/W6R9EqPBwxvRU/DY3Wcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZuvOlwnxSpuulQzOXo3165nag2lzdEnoNAUEsM9QeU=;
 b=SrQTop5hwRERO1trFgi1mz+JDlXRvRGdEN4MwnR6VP9dFnrEPKgwwaKyoNMDFB3iAfiufYcPojtNPfuQMEcJ4+uL6yqDOnzhdaestMVGwb22eZ6oisSHyPnfvKlxI1V5FKu/Gxz3ZG54NLlIaqayQ8oHFflI8LiNfENPYLEqmK6QhfUPqwvv9O9473vt+0bJO2aB2sfEzIl6uIEo+yMwWRSR9Xz9Nfm7YcuEW5Yrp+Re63E1VJv42fG9Y6A4FjYUsm1386JUpaN4lO8QJoSN4xA26nuoeKKv9PLFN5FicmphAhjjDW1nIawhRX7cccIPaEioPhecbaYZHbaeWFcvFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB5723.namprd12.prod.outlook.com (2603:10b6:8:5e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.17; Thu, 4 Sep 2025 03:16:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Thu, 4 Sep 2025
 03:16:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 12:16:40 +0900
Message-Id: <DCJOUO214EXC.32MFBN80VJW3K@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <DCBGLCQVD1RF.6V5UT0NQ4GLB@nvidia.com>
 <444ebd64-7a90-46a6-b885-2c114aa59284@nvidia.com>
In-Reply-To: <444ebd64-7a90-46a6-b885-2c114aa59284@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB5723:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec84818-0d1c-42d5-02b2-08ddeb61792f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aStxN0hlblAyQ2NyVEFqczNEbDJTbnl0UTJzMzFYcURTV2VUclptbExSQXc0?=
 =?utf-8?B?R3ZpNXgrYTVicllqSFZSQ3g5ck1lNUgzVTcvWFNlTGpPZDBWaktTL2tQSCtX?=
 =?utf-8?B?UUIxV0grekxDZXBLaTZveTNLOEpGRG9hd0hVKzF0cW9QMTNLSGltRjlRRE9Z?=
 =?utf-8?B?QUtOZmh2V2hTUjRQQVV1cHZzNEFCVGJHVzY1ZDVxUHpQZ0NLaEVLQUthREFx?=
 =?utf-8?B?OXM2Q3AzbnF2MzJVUWdVMFR0SjQyVFN3cE5sc3B3dEczQWQwK2lObjhpRkFw?=
 =?utf-8?B?WmY1QlpqdmVlaVFhdGF3YjczQzdRNTNKNGFOTXIzWitlMmxoZzFBM0lmT1Z5?=
 =?utf-8?B?MC9zcTVqVEM4U2RJb0U2dXlxekpEYWxONmIyVzAydnRnT3dQRDhoY2h5NVNO?=
 =?utf-8?B?YTRURS9rcGFEbFltR1M5dzlYNXF3bXMyQk9QNmpBc0lJYURBYlUzNzVjdXlv?=
 =?utf-8?B?VWRiM1dqaCsvNTVKbWVaQUxkeUQrL21kZlR5T1FHSStnVnVSYWNzblZDWnNU?=
 =?utf-8?B?azdZMStXRUhWRHdxbVRvVHEvZUU3UG1NRlhpVVpnV2s0WTk3WGtyT2FLZkJK?=
 =?utf-8?B?QUVnNTVsQjQ0TVJIZTczNFNISTdhZDhQMTQ4Q0N5ZFRWN25aMDIxUG93cC9k?=
 =?utf-8?B?NW9kYzN4dnBRb2NETzhNblBmazZNTXdtd05Vak1Kbkl4SnE3SmFITjE3b3RE?=
 =?utf-8?B?STJnMmZpUzQ0U1FRZy9xQldQU1JZbUpDZWU2TnNZSGtmckRzRlpmNnprSHdU?=
 =?utf-8?B?bmxWRVJTdzYyUVZNM21xQUJxWTJQMEFwclpmU0xvOHREWE85NGFrc29aSnhN?=
 =?utf-8?B?QlZ3aFhIVG1IMDB6VnJkSDdVYUNHNU1kUksyZWF6ZENKV1BwWWVxcjk1bzM4?=
 =?utf-8?B?ZFUzQTIvUy9ORXFhWkRLY0pGU05lNE9zcUx1d3ltb3NLaExvVndrRWl4anJE?=
 =?utf-8?B?bnc5S08va0EyTlFsZ2hNOTZQWmNrOUlNWG5aK3ZQd1cxR0hJci9nb2FycE1u?=
 =?utf-8?B?Q1JzOTlWRExwZDcxV0IwR0pGZXVHQ3VQaFY0OTdYNGVwRW9MYTFhUGVmZk9y?=
 =?utf-8?B?eWhxRGtHaGpwbnREeDRzZm1KVkoyUVdxSmo1Wm4zMTNUQ1Y1S0NtYnNWc0Y2?=
 =?utf-8?B?UzNKVHVzTU5ibWpQSWd5K0pHckJEVDlRQVRCR0RXaGkxdmRvMkhlQ2tHMENU?=
 =?utf-8?B?bklCRmhKaHJ6Rkd1K3htS01JUWgybjUrc1JNM2lJbUlxVGxGeVE3ZjYwaWtK?=
 =?utf-8?B?cDBYY2tzdUFhNmExLzUyT3pWaUtoM2JKQmY4cFFVekMxY25odFdjSTV1cUdT?=
 =?utf-8?B?TThsMEtZdm1kcVFOZHZyWStoWGVRRzRvVDVhRHJHUVR6d3QwOVhiRUhTRzJk?=
 =?utf-8?B?anYvNzgwYnl4WWttK0FMU0J0dmFtNnBJMitHY3FsSHc0dnJjMjhsbmFheDN3?=
 =?utf-8?B?ZUZMQjd3QW5WcStKSWZOM1NqVFZmVUV3Wm4rZ1VNdEZYZzV6RlJDOTZISXNv?=
 =?utf-8?B?bjVGQkVWRHNyU3g4Tm4vU1VPbVBMZTdEc0NxREZ6ZkpMaUxsT0ZwTzNDMnd4?=
 =?utf-8?B?Qlp2UWFZUyswcjIxL1NpZGttODhrZGgwRGczQWdDWEFKbGw5ek91U0x1NWU5?=
 =?utf-8?B?NmpDNXl0Y2ZvVUZZZmlpUzlPYVVITjRpbDNHK2RidVZaWDRWaW40eS9qM0t5?=
 =?utf-8?B?SUlPdUFpTE9NNkQxSjdNQThoQUljNzBWVjd5amdORkVneWdKUG4zcG9DV0N6?=
 =?utf-8?B?c0oxSlhkcGljdHFZdlZNMXdpUVJXK0NXTHlBUXlaRVpBVUpLYVR4NUN4WUF5?=
 =?utf-8?B?UEoyalNUU3hlL3BrMFVLSmRGRFJCNnBMWmxmSkxxb0lsWnFZZWo4dEJETUtR?=
 =?utf-8?B?c3U5T3huc0FFWlkvd3BadC9ZSEJTQ0hCVzNSVVJ5UE1DWkpscnhnYUR1VE9T?=
 =?utf-8?B?emJlcElySWhyQ0FjOTZKWDJIMXp5ekx2NU5uQSt2cDM3ZmUzQ05nUnlLVW9n?=
 =?utf-8?B?SnVZTEp0Smx3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzJtOVlZSm1VaGhsbHRBWWlnampzdDFGL1QxaVQ0VFU1RTY2bVpYa053U3Ns?=
 =?utf-8?B?d1RNcml3aE9HTnpQdmdGcmoycnZPZ2RRVTZnZ0NlaWxUMmdWamNWN2txM3ds?=
 =?utf-8?B?TlAwcmRJbHllU3hsb1dLcXZSNkx6MWtHRm1uWW5mU1pmeU5JZjNENW1CLy91?=
 =?utf-8?B?QlJxQTNaQUZaNlJOdHppemRpNGZ3bkVDcUg3Mjg1U3I3VGkwZEE0M2Fwa3Qx?=
 =?utf-8?B?RmdFMUVCL3hISTEwUkhEbU01ODNNSFVyY0NsU1hmOTZmWEN6eWJBK05OajRr?=
 =?utf-8?B?bVA2MFRFNWZVM1hyb2Q1SDlndjNZd1hmS01HWG9tWXI0c3hUMTZkVXRkUnp0?=
 =?utf-8?B?QlBRRlg2TUVFT1R5eCtlVWFRYzAvVUplVHFibXIrQ0dwY0xqNFlvMzNsNTEy?=
 =?utf-8?B?SjAzLy9QSnM0Q1BUbDBlay9pVFVCMHBBRThxUnk0NWcyZFBIcTZxS2ljZ2Jp?=
 =?utf-8?B?VW9lS0hvYkZ0bUJ3L1pVNit6Q1VHSTFRaGVDaXd0NHRQZjhOMlFwSVE5SlJq?=
 =?utf-8?B?cERNUm16ZW1VZGVndlpONU5PM1NBZ25OTFcrREM0QjVXUE1xZjU4aFdSSDUw?=
 =?utf-8?B?SzF1Vk0zSEhpUU1sNzhUdC9zb3JrZ24wSXEwRnh5K3RWaG5STVArNmdvQm9s?=
 =?utf-8?B?TG0yekF1VlozV211N20wb2lDbmdjUVR5ckV6b2pnOVlQeXlJblk0emxYZExX?=
 =?utf-8?B?OFdxYjZadEcwQW9BdFlBL3YzZ2FuQmFLSTdrS3VWQjNCbFFWcVAxbm1aL0tj?=
 =?utf-8?B?UXRZaXdrTmYrdllXMWlieUZHM2doUXdIb0pYVERsazRiTU5FaVlhZm1LOTA2?=
 =?utf-8?B?QS82TmVtQ1VNbUxZUkNvYkU2ZlAvcC9RU2NPMzQvVS9yN0I4VmNOQjJTRnBn?=
 =?utf-8?B?a3hGenc0eVQyazlmQUZXbEVpQzIvNXA1SmhPNU13SkpiQVZWQlVPNGRVZTM4?=
 =?utf-8?B?cU1ZbmlpekVSWVpHcTVDVXY4RHB4RVB4Vjg0UDhuN2hZQVk2ZHlJUUt2SVJH?=
 =?utf-8?B?YXdGazg5aWl4OHRWb1lRai9JUFh4M0JlUkVHaWJNRVZGZEFUbG9uOHFlZURs?=
 =?utf-8?B?eWJLUTFOcFVRemErei8zam1pQ1k3dEFtZWNmcVhuSnVibzFGNHZJWmJUV05H?=
 =?utf-8?B?R2RVa3RubkxPa2x5Vk1GNzVRcGtPeXFBZVNramN1dTJscEx3dlhEYzFzbisx?=
 =?utf-8?B?NTByRHZFWXNKZVR6NnZ1RlJvWXZRT1pYZDlrQUs4UVpLTU9qMkdQdHc1QlVu?=
 =?utf-8?B?Tyt3THhuNDVKait0YXRodEtyMHV3VnpkV0xkbGRqdVR3K0hUUlczZzZ0YkU5?=
 =?utf-8?B?ODY2elpqbTVIZFlZMWdIelJ6MjFnZ1lsMUNEaVg0T0pYMEN6Zmd5R1JlNlkw?=
 =?utf-8?B?NjkxYXdMWjB0VnJ3WU4yeHJJQXQ4UVJlOENSWHFtMkFZd3g0VGpzMFpTeElV?=
 =?utf-8?B?OVRZL3dqUFc4cUMycmxCSElMYndEc3NQME8yaVlUTXFqMTJhbUZPWW1aUEta?=
 =?utf-8?B?YlpDMGRSQkhjMDBjSGp1clduSkk1STE2aXIyd2pwamZweUJUZjJJbTBDeHM5?=
 =?utf-8?B?SmtSSWJKOUh4NkRBVzN3ckhWdDk5Zi93UnJ5ajZMZ1RhS0xIUzYxUWptTFhk?=
 =?utf-8?B?anlzb0I2SU44TE9qZWY5U2xsS0VJNDFqMGU3dGlmRU1xVVozbVFoWklBYXgr?=
 =?utf-8?B?djIycjh6TzVNaFV6c0RFaE5RQTYwanVaMyt5SzhzaWcvdWdlZ1ZsWVhnYjNj?=
 =?utf-8?B?WTg0QWFONkdFeXNJeHQxdGRwemFJVmdnMHY3MHpraERwVjMyYXRYUE5weWNL?=
 =?utf-8?B?NHJQbkZ4WVFMbUhScjF0U3g2RUhLQmExeUVxc3gvS2RRZUNPb09EZlBiTFBw?=
 =?utf-8?B?RGl3K2xGZHdyd0F4NmlON0RvamlPOHVXcVo1REFqVlZEYjJremMxTFJndEp4?=
 =?utf-8?B?eU9TYkxwdlVsTksxZWsvTVJ3bHAvUHBVVUU1Ny9jTE1uT0FlYWlmWGtpQjhG?=
 =?utf-8?B?bEFuTWlxbE91bWh1TWtZU0dmR3UvSlhiWVhaK0xjcUtLMXZZZ1ZCc29zdUQ0?=
 =?utf-8?B?aVNHL3V1cjNac1lLcFVaUUhqMElmaUtnNkJDY0U3ZjMwL2FMbmx0N3AvYS9s?=
 =?utf-8?B?dWkrcXdlVmFnNlJwcWk1NTljY0ZMcXlqMVMxYjV4c050RVNmVEttY0ZPb3JX?=
 =?utf-8?Q?HWpBPLaNnf0idHNQ3abuvvKeTctsOeLcJeQ9BZc6E6RB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec84818-0d1c-42d5-02b2-08ddeb61792f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 03:16:45.6347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gtgd1U7Sa1PNrx/zWG7AXFyaeawYg8d5/kFwSDZ6YVyORKGpKTmFVdHX2+VkonDqkGNHX6u477dULYwZ4k+UzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5723
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

On Thu Sep 4, 2025 at 12:15 AM JST, Joel Fernandes wrote:
<snip>
>>> +use kernel::prelude::*;
>>> +
>>> +/// Macro for defining bitfield-packed structures in Rust.
>>> +/// The size of the underlying storage type is specified with #[repr(T=
YPE)].
>>> +///
>>> +/// # Example (just for illustration)
>>> +/// ```rust
>>> +/// bitstruct! {
>>> +///     #[repr(u64)]
>>> +///     pub struct PageTableEntry {
>>> +///         0:0       present     as bool,
>>> +///         1:1       writable    as bool,
>>> +///         11:9      available   as u8,
>>> +///         51:12     pfn         as u64,
>>> +///         62:52     available2  as u16,
>>> +///         63:63     nx          as bool,
>>=20
>> A note on syntax: for nova-core, we may want to use the `H:L` notation,
>> as this is what OpenRM uses, but in the larger kernel we might want to
>> use inclusive ranges (`L..=3DH`) as it will look more natural in Rust
>> code (and is the notation the `bits` module already uses).
>
> Perhaps future add-on enhancement to have both syntax? I'd like to initia=
lly
> keep H:L and stabilize the code first, what do you think?

Let's have the discussion with the other stakeholders (Daniel?). I think
in Nova we want to keep the `H:L` syntax, as it matches what the OpenRM
headers do (so Nova would have its own `register` macro that calls into
the common one, tweaking things as it needs). But in the kernel crate we
should use something intuitive for everyone.
