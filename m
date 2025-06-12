Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE98AD730F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9215F10E872;
	Thu, 12 Jun 2025 14:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P+dVlLIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2052.outbound.protection.outlook.com [40.107.102.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D480310E88B;
 Thu, 12 Jun 2025 14:03:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkkhP4wN9GuYDytzUC6A7vq/ZyNB2CX21L4f5LKlIzuaQrqaiQ4n22SpqahWBXpQ/K+5FKDD/M7C0xgTIDx7EOXm0DijLmEvfReCl60OSWAp3Ff3pxG8ZLdstSodue52BeWhVCDWzQ77NYUhGzH84NjH4Lc+oAcvH47Otk7kA5Tfzi6IK4uV2UO7edmdXrTPrqikoQ8x+IMc0dfGAYwLl4ygu/1vvw7QpJ8AaYhpo0LlYJmMwNTTRktQ5A1vR+IY0fa/Sy0aogGym+Pw1V32fy7ZFCh/UYnNi+61xsNkb31CtJZggzwUQXHc9F+SMwPqxIJAHcuq/4VRsytom4iQEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7brl7J40JA0lBiZmDj4q9WJhBTQuUQrlN2lc0aPHfUo=;
 b=q+c8Z/hZ5NUhRUrWuA56YRSpPbWKtbayD69rYaVrpYkaYDQb/VEIcRQ3s9ArGJyUfwNkWajccWdl1FaOJT5fN1o/hNVDc5kMEpYaOTAYjU88nwpXnCiQWUEMji5S9vfC0ckqZDGFD9fn33ChPABHwX4Tm6Y3dhIeXfDpLc322Ioul0wAfhxlkYxUvNVfpuNmLxFq6Zq9qymKGKZfLRhbzKSsi7NSq0dbVvxK+RL5jGhkY0czCiE0vPZY0dMEalZHaW8PAn6QHIEmtIImOU3RV8YBqfllLQol3WWVM7L+6g99JjbHNZ458s73I4VIy0qyVMu16zXB6e1ja41PA0c7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7brl7J40JA0lBiZmDj4q9WJhBTQuUQrlN2lc0aPHfUo=;
 b=P+dVlLIVDT8b2pGUlGo9o+/ZLCddjslm6CsKnQ88K4CT/uWG01lWfcxqOIg62+Y1yNS6iDWG98NCeFg7RN9ewZWJs7Ul22Kjy8PVeRYhxS02k3YSwxsYlxsZZmUXecl9N1taNMi7mNd89mVU/edryVPUUyGHO6Njjo6AAjWksjJcwD39Ei1nHehQcAYTxQfGk8Pw1dlglgtzqBylb2c+J4pdFMu6vnca/S0B+x+EW0QMnX4sLJKnEyp/id0x1JOK8MC01ldjafsH2zGDvJrjXtyaPCjPazn/Q1+1SY8AuCvZn1ZHqSvMNshkr0gmQbvVHaIIQ7yxwFQclBx9LpOCiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Thu, 12 Jun
 2025 14:03:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:03:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:46 +0900
Subject: [PATCH v5 18/23] gpu: nova-core: vbios: Add support to look up PMU
 table in FWSEC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-18-14ba7eaf166b@nvidia.com>
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
X-ClientProxiedBy: TYWPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: ad949131-2822-4e3b-fdf7-08dda9b9e9a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjF0QW1ORkFCZmZoZ01OemgyLzhLSDZzR0wwdi9XM05xMEVYWUNzSUlSazFD?=
 =?utf-8?B?SnhhYnZ5cHEzc3BxUjlVZGR0YzlRaSs5NHIzWE5UYVhtRC80NFBra3NBZkpX?=
 =?utf-8?B?UFZLcTlMMWtyVHlvT2ZuS0h1YmxMT2xFMUpaYyt0aG9MdFZJT0s5M3NqOVNv?=
 =?utf-8?B?a3IvUURCVzhNeWFiZUVzOTE5VXZGYTVLa3pISld1emhLdmZBcHY5MjZuZFJG?=
 =?utf-8?B?V2l3YkpObTdBN09DVGxraFdvZDUwazl3ckZaSHhYdVNlZVhBMHVzZ0xyUVRa?=
 =?utf-8?B?aEgvVVRabEdLSkpmcjBHVS9odWdTY3lNb1BWYldSVkRUbytFT2Y3OW44RGdv?=
 =?utf-8?B?dklwcVc4WHNqbmFkZWtHS0c2Ky9rSTZlYUxNTElhVlZ0b0ZQejBlNE8rUmow?=
 =?utf-8?B?QnBPVmpzcU1jMkJ2dFhkV1JUNTZKby9hc0NUTTFreVdYK1lLZ2JpWTlzaDNU?=
 =?utf-8?B?c09jTEcvdFlMek9xYUdLWUFkZlUzM05zT29QeUtHNVl1RVZGMWtlRzZXVHl4?=
 =?utf-8?B?a1UwbWo0T3IzQlA5VmRzblZsYUN1OUhkWmwyZlI1QXVybGpBKzQ5Ykp5dUxZ?=
 =?utf-8?B?dEFDYVlNQm9MWWlmNXFWWGwrUFAzTzNWV2ZpRUZtYU1JdUhESFFTcUh6SjA1?=
 =?utf-8?B?Uy92OW5INU5peXhyQXlzMm45VGZUOWNkNjgvdjdqR3BUUW1MZ09UaUxQQ0U0?=
 =?utf-8?B?RDFnRit0Tmk3NWlpSjgvU1VWRjJJOG9qdEpua2NDUVE5UTdKdDdGYWphZjJE?=
 =?utf-8?B?UGVBMDZ5TmR0TmlIM2Jab2Jaby80QTAxdkoxSU5OU3UzeUZ6dG1PRUcvMEZV?=
 =?utf-8?B?cHlieHNVMmE1SEM1TDFZWmcrejlMd2RCUGFsbzllM1lZMDM5VnJnVXFDUGxN?=
 =?utf-8?B?TmxxT3E3NXVzeXFhbDhIYm5YWWRkdmFZU2lXNEtLbWFRSkN6TU94NVlQVXBW?=
 =?utf-8?B?bHprN2tIdkdrK0NjZEVRbzVxa01zaDc1NWhrZmd5ZjJBQkQzem5JamRKdjR1?=
 =?utf-8?B?VzNrMGRZdVlCUmNoYTFhbDF5OWxaS0VGSWg1SWdJRHlycVptT2pFYWx5MHRu?=
 =?utf-8?B?eE5LWFRHa3c4UUFYeXJUTDFpYkVkVk56c1lJOGhFdGoxTXF0NG1HaG5qZnJV?=
 =?utf-8?B?SGtZUUNhQXg2UmxYV0Q2Q2R2WlB4R0N0U29veXNjdTBNWkxnUDFPT3RlZHpw?=
 =?utf-8?B?V0dkWktWQ2xhYk45RkN1UlV1aE0yMkljVUFRSHRnOFlGY29qZmFUUnR0RXAy?=
 =?utf-8?B?TjJaWUxsNk41STErZlA0am5EaUZ3S2ZWTE5xZ1VnVThuWkpUWkxKU0ltcVlD?=
 =?utf-8?B?VjNxNVJuV0h2YzY4QXdGbzJ6UUtaZXQ2Z3NoSW1PUUZKSnZ1eWpFbHVUaHd2?=
 =?utf-8?B?ZVlCampjZEU1R0toNXhxVUpIN0dvZENHZDgwYVd5enR1T1BNT3pyT1gwMDJO?=
 =?utf-8?B?eXdBUWhCanJXaGpNdk5jYVpZUHVDUFJSUnNKbmdJQXNzbUMybGpXL3F2a3pt?=
 =?utf-8?B?NnFaNTdXN29TQXptMUYwNUhJajd2bmttT0lIYzRrenpiclZIK2VCaFc2L2ZF?=
 =?utf-8?B?eFRFYmtsNzFkd2JqZGU2aGp0ekFtdkpzWm80SWdFd2tZNlM3cTBEcU1ia3Jh?=
 =?utf-8?B?MlB4WnVBa2I4UExwWDFwMDV2OWRvZXVETS9oMWxPRVozWEk3b1Q3MWtqUmY3?=
 =?utf-8?B?cGZIUWt0Z3dUcWRjUW5tN244V1U0MTVpSFlVbCtiNTIvYmhJcXlITnVFVms1?=
 =?utf-8?B?ZTN3WWwyNHlZOWZNVEoyWXN1WjFLZ3g1bmUxa3JSRlNOQ0dJQ24vVFpzT3NC?=
 =?utf-8?B?ZjJCVlVHY3FHaFN1am5jKzZjdW04SmFZTUNFRVRrZVY5Vnl2RThVZnluTkVW?=
 =?utf-8?B?dStHQU03NUJoZE53QWtZT08yK3phMUpnaCtkR0w4RG9jejlRWUk0R3dlVXBn?=
 =?utf-8?B?YUJLWHJZeUlCdFZjNkEwNndwRjdOZUNIdHBFUW9vdnlxbCt1ZEZDVlFieThk?=
 =?utf-8?B?elFDWmZPOXhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHhjaTdFNHJNNG1MaFp0RGRNeTQzWS94UFlnTENBTVFjdnlxMjU5dEZHUmRB?=
 =?utf-8?B?UG1iRXhvYk5YejZWenRucTVLYjRXQ2RpL1k0eGI5c3M0NDRLU1U4elhjajEy?=
 =?utf-8?B?WXJEU21CRVB4eXBVejMxSmx0Yk5MN0JXWjhVTkRzamIwNEQ1ZEEyVXBtcEFV?=
 =?utf-8?B?aGt5ckFRbWVmKzlXOU1GNmh2VlFlWVFqSDFNcTJCTWcyVWpQbE9FTlhjUHd6?=
 =?utf-8?B?S0JFanFZNXZMRU5HVzUwK2NCNVVGSkQzUDdNTFVVQ1FYc290RC9EOVgvMlRY?=
 =?utf-8?B?dk43dDZ3T1h6Y2xlYzYvc2VTVGt3Mnhtc0Z0Y0haek4zZ1B0SEZwbkRjL08z?=
 =?utf-8?B?QWNHeVlTNnUwNG9OOGtCSjdVTVhKS2VLem01OXl0OHRpU09RZXVoc2E3cjU3?=
 =?utf-8?B?aDBvMDd0TExid1MzQjhnL1FyMDJoaHJBWldzZ1pGT0d1SkJsczl6VWJHSFFT?=
 =?utf-8?B?S1V6eStBU0F4ekR1NWMyMkUwYTJ6N2g0NFpJUkxxdExhdzZ5RmZic3VBTE5T?=
 =?utf-8?B?b2VPdDc2SDA0Zi9nQlBsT0QyQ0NHT0VIV2RlT2FIR0NvaWJUSUZtbzM3RXJo?=
 =?utf-8?B?QTNrTFdXLys5M1BBRlF2TXprbFV0dlhwemhjWEZvNjN5a05UNkptNm42U3I1?=
 =?utf-8?B?T3R2bEdwNjhTdjRwMzBRSTNsM2ZrWU1LVG9HeEJHTnNiMG5kWm52VXVPbDNt?=
 =?utf-8?B?bGdTc3hiMVdCSGlwSlErdE5NazZpZUE5QTVJTDJ4S1lqWUxVUXM1aFFjdURQ?=
 =?utf-8?B?K0hFOEpsbnpPdDdZdTI5T283UDlNTW1jZDhJRGNKQjlqUFhmeGJTSE9NdU91?=
 =?utf-8?B?bGNFNWUrOGZma1Rtd3U1MnhvbjJrSmUrbDN6Smx2KzRKa0JCNEFmUmJqOW1H?=
 =?utf-8?B?aElSYVduRzV4QWNGQy9oc015RjQxcFBGMlM0Nk5RTUFYTFNNVkVsckNwOUtm?=
 =?utf-8?B?ajhUM0FqalFWZURabWRrbkVKa3RnZy90ZWd0VXMydVRqOVkzWDhVeDhFQUFI?=
 =?utf-8?B?dktZUTY3Yjh0ZWcxVFpNWFprWXZWUmFuazdvWXI2QldiY0pmbE1Bci83UVZo?=
 =?utf-8?B?QktMem1HSndoMk1wNnVoSThObU9GbTU4SXZwM090MEQzcjdJVkZYYkJWZ2JC?=
 =?utf-8?B?dnlqTXkwOUtXSlpHOXhzUVAxcVpMaCtFOE4yLy9ZZWZCR2w4c01IcGhhTW1F?=
 =?utf-8?B?c01FWi8yS3pRZk9TdlljOHcvVjFpb2RCMTBMa2tRaXUxSXVrMmRDb01ZTUpt?=
 =?utf-8?B?bzhzb1JwZHZyckFsQWphbE8vcForYnVnMWZKSDZUa1RxbDNhZ29MN1BNbTNZ?=
 =?utf-8?B?d08yU2wvQ1piUzBZS3dLVlJleVYvUWNhY3RLbXJiRlhydmZQQmFZUzVGZzdy?=
 =?utf-8?B?YURrS1lYRVRtSnlsdnFaNHRHZGRYajVXdE5oaWljOXRlZHd5b2FkNlAra1N6?=
 =?utf-8?B?bFJzb3JhblNnK1ErenJ3aHlNUkRFY294eUorNnV5c2M1ZThuNkh1RWJ0NGtR?=
 =?utf-8?B?N3VRdVc3WXNlN0ZmTlFEVkVPMzhWWG9GQk9wZEpMOE9HN2dJd25FU1FnVDlQ?=
 =?utf-8?B?bXBURkhsNHpjY1pFNWVXUHJzblFYc2s3alVjSzZzOE5sNjd1UU9HMWFiV2Fq?=
 =?utf-8?B?MlBlZk9QYVBCaEVjTzh0K1NzWDFyVS96SHlDbWZWcGVCVzNQMDJHaHJJTjBD?=
 =?utf-8?B?dlVNZkx0NXZkblZqYk9MaVk5TGhvQ3dLUy85MEhCODhmTG0zRTZWUTJrcE12?=
 =?utf-8?B?ODMzOEpFd0x6cWoxODhzSll6d01kdEtwZ0RBS0R0cjcySDVNV09SZXR2RmtQ?=
 =?utf-8?B?dmx3K1ByRGlsVWszMW1reGN5OStxSDFtbktXTzM1TEFRbFRHQVNVVWVjbWJt?=
 =?utf-8?B?VDBiYXdueVBkWHdVWWI4cEpIbTFiV09qZGYwYVNUMTlVdTJGVEkvQmxndXdJ?=
 =?utf-8?B?RGhRZWU3SjhaS1BpS1h4eXRqVlBoTC8rVFhSb0VIei9xY0hmRWNlSnQwU2Ev?=
 =?utf-8?B?WGtrcG5lQmRFS2xLZzhUTzhPalZ5QkFOVlN6SU0xUVNHSWREN1B5QVhZUVJk?=
 =?utf-8?B?NytycUJZTkhnT3RRdDFkS0oyN090Y0dyZHhXMGN5TVBmTmJIQlVvaFB0bjNz?=
 =?utf-8?B?ZlRMc0Z6b2lGVTI5RXFiWm5mRU40RzdtV2Y1SjNtblpPSUNJbCtLY1ZUY1VL?=
 =?utf-8?Q?4T9KLVGOc9YON0L/Of04rIwrbaVkP/jhacg86GTh+TRX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad949131-2822-4e3b-fdf7-08dda9b9e9a0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:03:31.1508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLTECvzjoPUYU4DEhVkPUqi4NtT+5RRCoq4GAMtZxnzhQL5/GypiFn6R4ghzDKHoKi9AOPOCdwP76mqWPESjsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8598
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

From: Joel Fernandes <joelagnelf@nvidia.com>

The PMU table in the FWSEC image has to be located to locate the start
of the Falcon ucode in the same or another FWSEC image. Add support for
the same.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 179 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 177 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index aa6f19ddd51752ba453a1600ea002a198e27af5d..312caf82d14588e21e0fa2bae0f8954d0efe3479 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -330,6 +330,111 @@ fn image_size_bytes(&self) -> usize {
     }
 }
 
+/// BIOS Information Table (BIT) Header
+/// This is the head of the BIT table, that is used to locate the Falcon data.
+/// The BIT table (with its header) is in the PciAtBiosImage and the falcon data
+/// it is pointing to is in the FwSecBiosImage.
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct BitHeader {
+    /// 0h: BIT Header Identifier (BMP=0x7FFF/BIT=0xB8FF)
+    id: u16,
+    /// 2h: BIT Header Signature ("BIT\0")
+    signature: [u8; 4],
+    /// 6h: Binary Coded Decimal Version, ex: 0x0100 is 1.00.
+    bcd_version: u16,
+    /// 8h: Size of BIT Header (in bytes)
+    header_size: u8,
+    /// 9h: Size of BIT Tokens (in bytes)
+    token_size: u8,
+    /// 10h: Number of token entries that follow
+    token_entries: u8,
+    /// 11h: BIT Header Checksum
+    checksum: u8,
+}
+
+impl BitHeader {
+    fn new(data: &[u8]) -> Result<Self> {
+        if data.len() < 12 {
+            return Err(EINVAL);
+        }
+
+        let mut signature = [0u8; 4];
+        signature.copy_from_slice(&data[2..6]);
+
+        // Check header ID and signature
+        let id = u16::from_le_bytes([data[0], data[1]]);
+        if id != 0xB8FF || &signature != b"BIT\0" {
+            return Err(EINVAL);
+        }
+
+        Ok(BitHeader {
+            id,
+            signature,
+            bcd_version: u16::from_le_bytes([data[6], data[7]]),
+            header_size: data[8],
+            token_size: data[9],
+            token_entries: data[10],
+            checksum: data[11],
+        })
+    }
+}
+
+/// BIT Token Entry: Records in the BIT table followed by the BIT header
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct BitToken {
+    /// 00h: Token identifier
+    id: u8,
+    /// 01h: Version of the token data
+    data_version: u8,
+    /// 02h: Size of token data in bytes
+    data_size: u16,
+    /// 04h: Offset to the token data
+    data_offset: u16,
+}
+
+// Define the token ID for the Falcon data
+const BIT_TOKEN_ID_FALCON_DATA: u8 = 0x70;
+
+impl BitToken {
+    /// Find a BIT token entry by BIT ID in a PciAtBiosImage
+    fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
+        let header = &image.bit_header;
+
+        // Offset to the first token entry
+        let tokens_start = image.bit_offset + header.header_size as usize;
+
+        for i in 0..header.token_entries as usize {
+            let entry_offset = tokens_start + (i * header.token_size as usize);
+
+            // Make sure we don't go out of bounds
+            if entry_offset + header.token_size as usize > image.base.data.len() {
+                return Err(EINVAL);
+            }
+
+            // Check if this token has the requested ID
+            if image.base.data[entry_offset] == token_id {
+                return Ok(BitToken {
+                    id: image.base.data[entry_offset],
+                    data_version: image.base.data[entry_offset + 1],
+                    data_size: u16::from_le_bytes([
+                        image.base.data[entry_offset + 2],
+                        image.base.data[entry_offset + 3],
+                    ]),
+                    data_offset: u16::from_le_bytes([
+                        image.base.data[entry_offset + 4],
+                        image.base.data[entry_offset + 5],
+                    ]),
+                });
+            }
+        }
+
+        // Token not found
+        Err(ENOENT)
+    }
+}
+
 /// PCI ROM Expansion Header as defined in PCI Firmware Specification.
 /// This is header is at the beginning of every image in the set of
 /// images in the ROM. It contains a pointer to the PCI Data Structure
@@ -575,7 +680,8 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
 
 struct PciAtBiosImage {
     base: BiosImageBase,
-    // PCI-AT-specific fields can be added here in the future.
+    bit_header: BitHeader,
+    bit_offset: usize,
 }
 
 struct EfiBiosImage {
@@ -599,7 +705,7 @@ impl TryFrom<BiosImageBase> for BiosImage {
 
     fn try_from(base: BiosImageBase) -> Result<Self> {
         match base.pcir.code_type {
-            0x00 => Ok(BiosImage::PciAt(PciAtBiosImage { base })),
+            0x00 => Ok(BiosImage::PciAt(base.try_into()?)),
             0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
             0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
             0xE0 => Ok(BiosImage::FwSec(FwSecBiosImage { base })),
@@ -679,3 +785,72 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
         })
     }
 }
+
+/// The PciAt BIOS image is typically the first BIOS image type found in the
+/// BIOS image chain. It contains the BIT header and the BIT tokens.
+impl PciAtBiosImage {
+    /// Find a byte pattern in a slice
+    fn find_byte_pattern(haystack: &[u8], needle: &[u8]) -> Result<usize> {
+        haystack
+            .windows(needle.len())
+            .position(|window| window == needle)
+            .ok_or(EINVAL)
+    }
+
+    /// Find the BIT header in the PciAtBiosImage
+    fn find_bit_header(data: &[u8]) -> Result<(BitHeader, usize)> {
+        let bit_pattern = [0xff, 0xb8, b'B', b'I', b'T', 0x00];
+        let bit_offset = Self::find_byte_pattern(data, &bit_pattern)?;
+        let bit_header = BitHeader::new(&data[bit_offset..])?;
+
+        Ok((bit_header, bit_offset))
+    }
+
+    /// Get a BIT token entry from the BIT table in the PciAtBiosImage
+    fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
+        BitToken::from_id(self, token_id)
+    }
+
+    /// Find the Falcon data pointer structure in the PciAtBiosImage
+    /// This is just a 4 byte structure that contains a pointer to the
+    /// Falcon data in the FWSEC image.
+    fn falcon_data_ptr(&self, pdev: &pci::Device) -> Result<u32> {
+        let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
+
+        // Make sure we don't go out of bounds
+        if token.data_offset as usize + 4 > self.base.data.len() {
+            return Err(EINVAL);
+        }
+
+        // read the 4 bytes at the offset specified in the token
+        let offset = token.data_offset as usize;
+        let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
+            dev_err!(pdev.as_ref(), "Failed to convert data slice to array");
+            EINVAL
+        })?;
+
+        let data_ptr = u32::from_le_bytes(bytes);
+
+        if (data_ptr as usize) < self.base.data.len() {
+            dev_err!(pdev.as_ref(), "Falcon data pointer out of bounds\n");
+            return Err(EINVAL);
+        }
+
+        Ok(data_ptr)
+    }
+}
+
+impl TryFrom<BiosImageBase> for PciAtBiosImage {
+    type Error = Error;
+
+    fn try_from(base: BiosImageBase) -> Result<Self> {
+        let data_slice = &base.data;
+        let (bit_header, bit_offset) = PciAtBiosImage::find_bit_header(data_slice)?;
+
+        Ok(PciAtBiosImage {
+            base,
+            bit_header,
+            bit_offset,
+        })
+    }
+}

-- 
2.49.0

