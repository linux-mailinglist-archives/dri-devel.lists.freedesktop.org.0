Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D62AD72EA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE32210E4B2;
	Thu, 12 Jun 2025 14:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M5wxWEQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91E510E7F6;
 Thu, 12 Jun 2025 14:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7jbBEBC8+Wei5hnRvYDJKzzwIEX3iToJvppIo/6dhWbEwbS+l5sjvnVJYLuX7TVb9BN8ycbfQVR0abbbdSn5vrX+e0tuAvqcu0MMGt2a94CtDYOdgnLoMO8sNFEXWyZNu7c1eOBymPs2eEEjqarr7QiDU3y6zAa6ZawhfIx2RJ/P/y+OFQtCNU4+SvM2nHAtJk34LaSLvPRQewdkTP1hjBdGcyi8ems5iuJWQwKhDCjKUcMrbRkc1MFKxyZuUSK/+vX1aYy5Owr286yAePwxfLo0k2Nld9hkPxgGIbTNBQMlRJDk7sb8XQdR5sbYIWP9xVX3j9UIcR6tIiIJ4b6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+m6LprzilaHKfMW1rL0H4AEVNOA3syo9b23mYEnXGo=;
 b=d5pnXzxHvLAhLBKIYnzVU4D3xGywJjunqAKXh2gKd0muxqmrgrDnfyl0zrgchpg6C/Nx3hxkdmJQVFXK/fy72Lbh4YCQIWGP2V+4hg6Wtos1OpH47ViwxpsQ7nkNYNscJLTpYOPAzME/8lNtFU9L8EPBdy0kTYcJDbsYOWlwEx5YO+bwh9uMAnPMtWLu2r0Mel/TPdtMnuev1Q6LbUi/0HyG40gCvYDvHtuE3epzGyE8J6IBZehzzJ1/BSDWyKFlR5fK8TJXPRJnmk2492I8s8j4LQ0RplZX/jaaqCoDmKgBo98XYHoQtrM8hn1IihJPvFSom3MwqMxT/32Ppq0alw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+m6LprzilaHKfMW1rL0H4AEVNOA3syo9b23mYEnXGo=;
 b=M5wxWEQPvf3RGVZr6Spiblz1ihjl1mV/ml8LxWq0AkkLujVIcSG8IZKipmY5yaRCR9Uf4IwTYu0yDj6He/bUG5hVgQRoOIOSjpHJS8s6ku6Vm9MQcO9m4jRMRCVgaI8VzvTlcgBXYd4PDATFDKhkxT0TrRW2jMUokBKS3IjLHtB4Q7yf5qrTvpmcQrpSxOmsjs3xtQhHqjiKmGu0D/SD7aEZoDrmXR/ws2bqUgYiYHXAJimgNAQuXMW6La9lpGbgFPrkavOT6M/313NSZCN0s3duWPRVMsmJn4NYmpWlC2yddgLNh/xs6z/nO0wWHbvmAWYuzKI6QPCrktuvH+Q/vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 14:02:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:02:38 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:31 +0900
Subject: [PATCH v5 03/23] rust: sizes: add constants up to SZ_2G
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-3-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0251.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 02dbd07e-bd03-4987-9fa6-08dda9b9ca3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFFBSXdIdk80ck9SdGNJRmhmL0I2U3RWVW9md040Lzl3OWJCaE53c256YkU5?=
 =?utf-8?B?alBFZCtjR05kNXVqSlRYUGFKRCtiUytGc3VCYmhyKytmS3pyQUIyRC9oYWtM?=
 =?utf-8?B?NHFwemgzbzl5b2NabjZTWkZ0Z2NDcW9uVk10T213MVpVK3ByVW1KZXpuTUhP?=
 =?utf-8?B?cHJaMnhGYUZzTy9ybnRPV1JnK3hiUVNTU0ZaMExMQ3VvM1RKN2htVUwrMmhY?=
 =?utf-8?B?RXJsWnE4MkY1MUtibDFTcVhUVDAyUEdBVUtWSDFjKzJvUENLeGRQOFNJdGNY?=
 =?utf-8?B?UU0wcVZ6bWUrNVhIN2ZGZkE2ZGprVmlXczVPTFVBL3VickdIYjhMK3lmYzVS?=
 =?utf-8?B?WHdJVFJINUtGOXBJSlNXSzJUMG1RSng5bGZBODZzZlowdE5zVTFVN1o4L1V0?=
 =?utf-8?B?VWU1TmpkS2lvWVBGb1E2MFhnWVFpT0t6THJ2MXg4WG9zWkpHYWFvSzhCRFNU?=
 =?utf-8?B?eEZOMm9taE02UVJVeXJ6RUx0b0RIeG55RTd4NFRCMlhpUGF2d01UWlBtYmNk?=
 =?utf-8?B?Smp3aSt4cEVSaDNyVzIyd1NYb1lUTnROWXppQXRNQXR3cks1ZHZYSDd6UXRD?=
 =?utf-8?B?Wis3WXdYMHBkL1hZM1BWbk40SkFzekExVUd3YUJ0L3l4WDZ6YXdwSWcrR1FS?=
 =?utf-8?B?ejl3NUlIT0tQKzB1VGUwaGNXQ0M0eTFJajg5Rk9LL0g1QkY2dVhjRHRDV2U4?=
 =?utf-8?B?RU9lVVFvVGJ5K0lQZ0tjSnBiQWwxS21zU2srWnliMG9xbzFsdVpaSmZ5bU9W?=
 =?utf-8?B?QWVLTWt6ZDJlQ0ZYVG5rUEFzL3VVM0haNHV5S25ObHJKUElVMHZyN2YvNG5j?=
 =?utf-8?B?UVZwT2RzYTc1UTEwWGcvcUxSYUtyTWRqRStHSCtsWm1aMkJ1dFNYcjl0VTRX?=
 =?utf-8?B?czNUeTV3SmVuYzZKSmx6SnBwNWhxWnRqakYxZDFyL1JhUCtUWGhWNXJsRTZa?=
 =?utf-8?B?aCtySk82UEV4S3pPZkNqbWFaQU5mcWlzQzJrbDdEcDRlSTJkM2tCL3RjMDU5?=
 =?utf-8?B?TXZ2cnFzVm5RaHZRd3QxTnJKK05CZGZyczE4T2NrOVB2RGR1cmUzOXd2T3Nk?=
 =?utf-8?B?VVdWcnZ6aHdKSmp4S1FaNkszV28xend1YzBUNDcrUzFJV09ET3RYbWFnUFZM?=
 =?utf-8?B?ZHpnOUE3RWkweE9tNmcyZHp4RC9hTUtaOWM0ZHkzYzNZMlpXNGVCN0N6Y3pv?=
 =?utf-8?B?K1pDVzZkTmhMR2FaL2ZSN1hMME1mUEFPTzVVQlB5MW5vbkIxUHh0a0QxcHdp?=
 =?utf-8?B?ejBxdXYrVkpsRmNic1ZTQlFtWEtlK21SSEI5aFNrSHJTWmpyTmhmUDE0U2lK?=
 =?utf-8?B?bjJMMXN5U2RDcnhTOWtyK3ZYWi9wRGZDM3NCY0d0MW00WGR3eUJITnRqa0RL?=
 =?utf-8?B?Y2VEQmhZT1krZjN2ZS83L1NnbVZONmx0VG15UVNieHljZ2ZkOUtYck9hc1BF?=
 =?utf-8?B?RlNnZ2dpYVdLMVBNKys3bVJNYzBmb1A1R21yK1pSbVdNSE1jRE9FelhiaGkv?=
 =?utf-8?B?ZTV3bzRpMGF2VU93UkFhSFN4bFBzaUU1cUo2N3B4T0dkSlNqTjZlekdFczVn?=
 =?utf-8?B?R3B6dDkrQnd6YS9LQkdEOEloSys2Tks5M1FsRXB0N0lGc2JuZ1FGZUF5NVMx?=
 =?utf-8?B?d1g2MHZPQTI3eWM1MVdtNFF3YzFDQzBEMHNkRVlvUG16UkVpdStGOTUrOGhM?=
 =?utf-8?B?ZFpidnBvYWxqdEhnRXp5WHJERVYwOTErODZMTVN2TExTdmFNem1waUhSekcy?=
 =?utf-8?B?YzJjZ0RkQWhwOFZLMVFMU1AzOGx6cUJ3R3AyV0ZBem9ZOThGaUR4YnYzRlhW?=
 =?utf-8?B?OWxSTE5LTlE2M1pOTUc2UGdKRFBEWi9adlp6VGNZY1dGdmF0NHhWVEVUYWh2?=
 =?utf-8?B?QXBCN0ZRVy8yY3V6czk5WlYvOVZUdHJkaElSb0dsUGFPOHI3MTltQnlmMXRB?=
 =?utf-8?B?MDhlVTI3eEZUR3ZzcTlNQzhwUEltOUZ3eW83WnZUb1k3NW9IbGdNdEpJcmRw?=
 =?utf-8?B?QUlCTDhrUWdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzU3L0UySFM3OStZdjhzTzhXOWNTMHY0RHFCd09NcEtHZkZDSGplaDYrMHUy?=
 =?utf-8?B?OXRmQUZnRVV0R0FJRWtuRkNsa0puREx6V3JVdll2ZHNXMFMzZjI1WDF2NXQ5?=
 =?utf-8?B?SWxVMVVabjFJOHZmQlAyTnRzSnhaSVJLNUQwc1pFMTVFWTRDQ2hjQ05CVUxH?=
 =?utf-8?B?UDNPanE0dmI5RTQ3aEw5dU84OThza0xDWDIwaytXQzMvRytSOUVmT1N5T3NB?=
 =?utf-8?B?RXBtYUpYVVlqQXBqclAzUlBEV3hJZWpnKy8zUnZFTnl6LzRLeUk3VWljUG9z?=
 =?utf-8?B?TGpiYmh0OS9va3FYU3ZGcWl3bWJlWTJyVEs3eUcrKzErajdGUlpENDF5bjkv?=
 =?utf-8?B?S2dyNkRYU3JGeEdWVC9TR0RnK3VMZGFpd1lud3d6M082ckEyZFhWRnRVQkF0?=
 =?utf-8?B?RUlWSkc0bFJTMll1ZFNBRWJKSm5HM2trL2JzSEhGaUlFR3J3Y0dmR1p4MG5q?=
 =?utf-8?B?WnJyTVIybGlzM01GZ2tENW13YTBBb2hkRy9FYVQ5bWVENGlhc0tIRmsvUHBM?=
 =?utf-8?B?Ym1VTjAzTStRV1JHUGw2aHJuZTd6ZmgyTTJVTkVtelNoR2lxZEJaMlpubTl1?=
 =?utf-8?B?U2RwYjRXREJwQzJ6Wm1QajZkQnBteVg0UU4ydTJmblN6Yy82VyswY3VlTWxP?=
 =?utf-8?B?UXZ1NEc2Z1Zvb0NUODM0a0crOVZGS0NtbVV1T29BN3o5Q0RqOERoTDBRSkow?=
 =?utf-8?B?R1MvcVlHOHdJTDFSUlZGUkpVL1FzZkVBeXFLWGJaeDhaYlZiYlI0R2ZmV3lu?=
 =?utf-8?B?MEJLOU1XSlJ4QkF0bk82Y3F6M1lsYXJJWjZ2a1RUclZjbFlFSTFwaWlqMnVH?=
 =?utf-8?B?M1lSa2tmajMxZEl0ZjcvM2dyTk5JaTU5Wks5MURXY0RzSFNpMG9ZdVNERDNT?=
 =?utf-8?B?aUVPRHRVSC9IdHlyTzJ4RTlaUzZtTVNxNEdxRXdSSGZvcGwxTXBpSDB6WWpm?=
 =?utf-8?B?REJ4TVJXYm0zaTdwNEhSekFuSXZiRys3TitVSU1ONWVUWVVJWXp4SWl4NkRH?=
 =?utf-8?B?SE5LMzk2eXNVT0RYNlBqSFd3WnpDM1JzZ2MxOFFkM3h5UVJsZUpEWVdvYmFL?=
 =?utf-8?B?ejNRVW1MU0czMFo2NElVbkEvdzhtUk90dmZSRlpETkNHZ3p1R3Q3NU1ZSFJR?=
 =?utf-8?B?dGNEeXoxaFlGTzU3QVpDeDRSQVp6T1ZyZm00U2czN290M1Qwb3BTdE5OdHZS?=
 =?utf-8?B?R1dNSE5jZVJLVVU0alJYeUFKQXAxMVc1aDFjQmZBaFUyN0VkVFpwU2J6V1Zs?=
 =?utf-8?B?N3V1YlkzQXBUQ2ZaT0syMW43Q1NtWkRSbmtLbnUrZmF2Rm45QkFWZ0UxQktK?=
 =?utf-8?B?aHA1eGRnQlk2ZHVPNXFhOGg4emVXQVBvQm85S3ZOTkFYeDc0VjRTdGNyMFdK?=
 =?utf-8?B?NGVTZE5RMm1nRXBVZSt6ZVdjYWFEQm1XZU02dDdqYkt5ZEZib2FzMktHTGlB?=
 =?utf-8?B?RTNhSXNYelo5TldBQk1UVi9heEk4dGFGYlBZcnpvK0FTcWo5WnNWUENoYTk3?=
 =?utf-8?B?RDBNdTZhWWZZbWd3bDZObGlvN09yNkE3QmlLYlhvMW4yT2hMdmljUHNsaFRP?=
 =?utf-8?B?OWQ3TkhEY25Id1FyVG8vNVlXQmdYZUJXZnE0Ylh4aG5QTHdUZFM5MHVFT0o1?=
 =?utf-8?B?ZFNHOUdsWHl6NzJ2N1p1QjBtaVhTQk1PbW9pNzVqc0RXN3BDZEtjVGErL1Q4?=
 =?utf-8?B?ZWhtVkdOamh5Mko4OU5pQmROL0RuL203WWZUSHBMQlNCeU1lZ3J4NXZ0Y3h4?=
 =?utf-8?B?TWdEWU4vck1weS9Cd010VHZVM0hVSVRiKzc1alVsZ1BPN0VIUmhuTWE1K1Jn?=
 =?utf-8?B?UGFjT1dWSVhGMjNWNUdzcmpaRXprbXNIVWxQK1RhNzVNYkFwNDU3L2IrNWdH?=
 =?utf-8?B?YVFhRS9maTdmQldjS3VBRWV5QW02dWc0MTd4WFV5QUtsQzVZZTlyKzJrVndk?=
 =?utf-8?B?RGFOZFR5QkdtSHpTOE5Gc0svUzRLd0EzZDVNSXhnaUZDWUJLRDlmSVdDclVh?=
 =?utf-8?B?QUJPZVhveEtOTnBtOTZKcFZVODFXODdtU0swa0gvY2hoM1VpemVtc0Vhakoy?=
 =?utf-8?B?YjlhZlh0ZTZVRTVTRVFSclEwU2Vhbk9IS2JlcTFJSThsRWR1ZU9FUkx5SFZM?=
 =?utf-8?B?Y0NaNG1hQStaRlZwOUZydVZwMDBvRm9yZStGbFUxdU9iNlBXcXQyME5HR0d2?=
 =?utf-8?Q?Dhy1VSf99B8+ua20aLV6tgQoIzv65s6GjT/N/VfW4Bo/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02dbd07e-bd03-4987-9fa6-08dda9b9ca3e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:02:38.5159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FVbwJwIDkXsmLvTfv6hKLQSkvvSAvzK0AFbr7hmKyOH4l0S1pMPsIn2GOsHM9+ypG6gNLS2LDwkSopuWIuobw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
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

nova-core will need to use SZ_1M, so make the remaining constants
available.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/sizes.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
index 834c343e4170f507821b870e77afd08e2392911f..661e680d9330616478513a19fe2f87f9521516d7 100644
--- a/rust/kernel/sizes.rs
+++ b/rust/kernel/sizes.rs
@@ -24,3 +24,27 @@
 pub const SZ_256K: usize = bindings::SZ_256K as usize;
 /// 0x00080000
 pub const SZ_512K: usize = bindings::SZ_512K as usize;
+/// 0x00100000
+pub const SZ_1M: usize = bindings::SZ_1M as usize;
+/// 0x00200000
+pub const SZ_2M: usize = bindings::SZ_2M as usize;
+/// 0x00400000
+pub const SZ_4M: usize = bindings::SZ_4M as usize;
+/// 0x00800000
+pub const SZ_8M: usize = bindings::SZ_8M as usize;
+/// 0x01000000
+pub const SZ_16M: usize = bindings::SZ_16M as usize;
+/// 0x02000000
+pub const SZ_32M: usize = bindings::SZ_32M as usize;
+/// 0x04000000
+pub const SZ_64M: usize = bindings::SZ_64M as usize;
+/// 0x08000000
+pub const SZ_128M: usize = bindings::SZ_128M as usize;
+/// 0x10000000
+pub const SZ_256M: usize = bindings::SZ_256M as usize;
+/// 0x20000000
+pub const SZ_512M: usize = bindings::SZ_512M as usize;
+/// 0x40000000
+pub const SZ_1G: usize = bindings::SZ_1G as usize;
+/// 0x80000000
+pub const SZ_2G: usize = bindings::SZ_2G as usize;

-- 
2.49.0

