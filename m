Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B65BFE82C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 01:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7004310E1C3;
	Wed, 22 Oct 2025 23:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tHit0QdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013003.outbound.protection.outlook.com
 [40.93.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E6810E1C3;
 Wed, 22 Oct 2025 23:17:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmIUaAaMUH+5seRwgz8icBsB4dBnqhRiRlL9pV+rrVdubxFlx+Vy44lc9PUKynjn8MHjZE7DPdgIbc80tZ9FfDihbN8wcS0LDKUzG4AsDUXttqNWklYnbtTwqImJAmxcaOTShR2r3//ywn4doDKSUr+PkxYNTWWB/QKOquQ9nNbFb0339A28lAbiruDO5ZoKGNpqJQj3WPlJ45UNFHvVmq2UwO6ZXDDtBnidWvo8GsSMYLqA4hbqN7pW4QsKSVrqtJEP5ebwzDZpIE5ec50jaqV6VCKyt4nOTKKriUTHzK6/iDb8tovHa65S5f+twwqzvgCWN+hddzeYaz2LhTW7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=px0O1OWsygWKotCZPZLbyNvCqtukkLpiJdeN7WYiHDU=;
 b=jIgI5mv8yEzW8h60PbAJD/eEb7ao94+whRcIcEf5ZLHYTGTJ3c0h30d53seYlu3bJ/2MVtLPjKrxPxRncAL9axhf/W2G1K170CZ8LIlw9sj2OV547KFYQeKNGB3t902/SI5uEZHzNzWOtoh1wXi9BymY9xAmv6Py9rdfB9lUGHU9Xgac9wQcyLyYxZhW+XDeAICGJAz7oEpP+JiapFOOglcinlFRu//F3gT1b1l09XCh4PHTgUWcvEKIC72pjvSIL0B6p6mhllAaBzIBlRm8NT39A7sqxphi0Vva5CweRt1VmMxD7ip02klnriFycgGCp8kK4ZQIxM1kXazLT9cRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=px0O1OWsygWKotCZPZLbyNvCqtukkLpiJdeN7WYiHDU=;
 b=tHit0QdEUXiwLYUEeGB4uYOUvAV676nrnX/9iI6tFhaIBxAdN5ox8CUzDEzFkjVYB7WW5QdOQ1SFdFgRSEeXw5kiYV5EXaYUEw8Ncg2mYEtDQdLz0Q6xnBl2royVV57rFu2KZg8VElHyMaBUZy0wcFmH1rEZXn0tr3Nobrlm8Svq99mftGvZYCNNDWmI0txeN6FwZXnDv8WoRFGtP5EoKaVE7cKSoOqwTXiM2quP8qxYtk2Cy6r6D+SDvnpUik5s0oBkiUXN9VR9+pepqCjYqvyIG8RULDlZyE8wEq1xLty6CKDxZU+eMAIwUUPdDFytxN18JoWDZObooeVDXqw5Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Wed, 22 Oct
 2025 23:17:00 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 23:17:00 +0000
Message-ID: <2c5d90c8-e73a-4f04-9c1d-30adbd0fef07@nvidia.com>
Date: Wed, 22 Oct 2025 16:16:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] gpu: nova-core: Add support for managing GSP falcon
 interrupts
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-6-joelagnelf@nvidia.com>
 <4553a31a-fd13-41c4-8bcb-3b830cd7b661@nvidia.com>
 <DDONF5MY5Y8F.1LPCBN4MBL5RZ@nvidia.com>
 <8fe3f616-27d9-4251-a753-1b2698a82870@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <8fe3f616-27d9-4251-a753-1b2698a82870@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0054.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::31) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MN2PR12MB4239:EE_
X-MS-Office365-Filtering-Correlation-Id: b7fae9c4-7cd2-4236-d18d-08de11c11a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0xlVzBCQUVBdmxDK1BrSnQxbHBhN3lnV2I2RWlkTUJ2TVRWbXZHbkpNZG1I?=
 =?utf-8?B?MTRHMHQ1anBHdDZ6RU4vVjcxSUlvNTRRMUhIS0N0RUVuMXEzbGVZQWRUNXJF?=
 =?utf-8?B?d3pHS2xVN1RGRkdqOGU4Z0YrYkFqMlBNSjlIZG51TEpZbjdnYlU5aVM5Rm41?=
 =?utf-8?B?TEFSdnBsQXpvY0Y1eEZXVklRUy9od0FnM3pTSHRQNzNhYzVuUURtVU5waE1T?=
 =?utf-8?B?RTU2cUkxa29QZHdaTzZPN3l0UWg4dVJIc00vK3hHOUlvT0Rhc0U1QzdJQ1lM?=
 =?utf-8?B?TnNQRUNxOWlYZU53QlF0QURSOWZjeUxkQkw1U2Z1VjQ1QXpNb0VwcEpYeHZi?=
 =?utf-8?B?OHVqbFAyT1RXbTYzWlQ0WnZzaFBLc1VYWk9ESHpoTTNvZjF3ZkRsNHhzdW01?=
 =?utf-8?B?T09DY1NrcEZnb0tpR20ybUJmMGwzbEU2N1hKbms5U2VCcEtLWlFPanBtV2pS?=
 =?utf-8?B?Um9VekJ1cFVHbS85eHkxbmtoYk52QlEyQzlXS3B2aWF2dFZDN3BFWjB6cXVJ?=
 =?utf-8?B?WjV6czMrYkRpekZldEEyZndUOWt4RDhvSGJKdk1JM2V6cU5tZVl6U3l6eUVO?=
 =?utf-8?B?YWhhWG5ZaTJGQ2dEbHJhYnpkNnVtSkJIUUFkZW1Ccmx4eDJvcGtReW1hanlq?=
 =?utf-8?B?ZVo3Q0hNY1N0SjR1dE1rZkI2c1Y3cG1adThxNlpseWZ5VDgrRmVpNE84ZDJR?=
 =?utf-8?B?WEU5bDlRZmFGV1hFV0VDdEhsOWdpUWxKcGJSTUJiTkNnbThTNkxrTW80d2cr?=
 =?utf-8?B?N3hQaGp3eWcvd1M5ZGNkN2daODlMMURYWHRTcFAzTlJ0aG10dk9BUGwzd3Vp?=
 =?utf-8?B?K1RoUWZBMFpmV0l1TFI5bXR1T2g2VUd2enp5TzBpdjhRdFFqOURFNTRHTjMv?=
 =?utf-8?B?b3RTT3hObmhkQ2FjdDhMeUdmMi9kL1NxRkZHaGpzWDI4dnpvdGxUWWZwV2NJ?=
 =?utf-8?B?VXMvSHh4QUNRODdZMFlJTml1b0w1eDViWHcyNE9mUWJndTZpTDVTOEd4K3A1?=
 =?utf-8?B?MGluYnZ1T2tIdkI1WUFyRThkZTk2WWdqTC83dEl6eG1aOTYvTEY0Zk1lQ3pu?=
 =?utf-8?B?VHdiOWpuV0xwbXl0QUtCNWR0TVM1Nmtzc21xV0o2cFkwMFFzNkw1ci9EM3pO?=
 =?utf-8?B?WlNraFhhdTNaekpiNjloZEhzN1o4OW9pNDdyT1NEVFhtVkdDOVRXdXFiS1VW?=
 =?utf-8?B?dnFNVWdQSmZ1UDJIb2diZlZURzF0dE90ekxEK3VoQVE5RlZmRVp0aGg3ZVVy?=
 =?utf-8?B?V2ZHOVVDcUMzNHRxWVRmUWY5NUFrWXlvYjZVWk9PMzNqY1BBRFRUd3FCWmR0?=
 =?utf-8?B?eEJnZ01lZldPaXNtb0ZvUElsV0ViY2YrYllSZ0dMYWt6RDRidVFGbUw3SEp5?=
 =?utf-8?B?c3AwQ3ppWTZ4R1JOUE5rdDRIamM1RnRmaCtqcE1MODFoTXJJMVdlVVY3bzJM?=
 =?utf-8?B?RE13cDJYSGhmb2NnUkdtOXlCeklORThiOTdDb0w3Z1g0RWlnOEpyN25vSVI1?=
 =?utf-8?B?aVFHZjA2b2RoWUtjRVRRcldPaVBmZXpnc00wQ0ozbi9hcGRKUjdTbWZIZ1RG?=
 =?utf-8?B?Y0EvUUZ6RWh6TmxtSklnRXU4Q1p6bnNsQ01NK2ZXb3Nvc2NMRDNtanRFMjlY?=
 =?utf-8?B?SWV6aUU1S05zS0M5OXh4TStMYXpmamZ5cTJoa3EyV1l4MGQ1eGZKRHYzNnpN?=
 =?utf-8?B?RzJaR1VjS3RQTnc0U0hlTjdUbng3Nk16dEREbW1BWC9MaFN4THU5SEJZTHpZ?=
 =?utf-8?B?Um1rQmdSQ0sveUVKVTFOb2EwTEZxR2FVcmt4UjJVYk83Q0tOYk5BVE1KOGI4?=
 =?utf-8?B?RDl5bDVxSy9WNVNJSmFITFpYdWdlc2JrbUxMNzVzbVFrelZleWtCQ3R4STAr?=
 =?utf-8?B?OVBhVWxOdkdNWEdLbHJ0SDQ5NXd6MlgrV2ZBamQvTHo2ZldRcWsyU1MxVTlB?=
 =?utf-8?Q?CTSALlGRvc9P/HFO5sbesXAU5U8OYUZw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVFjOU9VTU1DYmw2SlBTNVp4ZlJnQVNadW9LdlgrQWJ3WW9jdzRSb05kSmlR?=
 =?utf-8?B?LzVLeWZvMTJydGpOMkxZNFlsaEdkWXlabjh2YkVCNi9vRWliUkQ3TWtxN2Nw?=
 =?utf-8?B?akw5dUpZN0tHWTdyRFBYY25leHU3ZHZJMzU3bFIvbnp2LzJKcUFCMUZxVHNR?=
 =?utf-8?B?UHRvakdUV21qblE4bDhHVkJoZUV2NTQwbkpEeHgwVUp1OEhnZDNOS2pMZjcw?=
 =?utf-8?B?Uk9SMVlDYSs4dk1pTG5QLzFUQUdpNlhIb21GVzc1ZGFuektYZjhpajdZRFB3?=
 =?utf-8?B?K3JCS2xuTGdmVE1YY0cxQTNtcDE1U2tKcys1aUlIVDZQbXp6cHdmWGEvcXpM?=
 =?utf-8?B?QkwydHlwZFJGYWJaRkJaWWsyNXZzWGVEQ0laRUFXeTNXeWhVaSsyNHBFMzFl?=
 =?utf-8?B?ZkFTMjZVS3BNZGFxZmMwU1BlcWZkVDNrSFBBSGM3clZFYkR2NXZ0dnBHTEFC?=
 =?utf-8?B?bzQ2RWRQLzZmd2lPRUZHQm5GVUhYOVVURm5mTWFBb2xhU0hraTVudWN5RWVp?=
 =?utf-8?B?MVFlWWVnajZCZUtiYWdKdTVIdVIzbzJTWkdkTk5hNkV6cmFGSzZiNW90UlA1?=
 =?utf-8?B?TEJaRDVZZ1RuUk1IYStoejhYaTFYUzFUNjhrNzBiL0xmTzhnbkxWcVNMUGhM?=
 =?utf-8?B?eEhBTzFSRjRuVDY2SGxYcFdlUTZGbGxOMzYveVRDTU56cFk3Q25MdmQwekZX?=
 =?utf-8?B?Z2U1NGtvYVpoSmNEWlQ3eXJqdG9PL2VRelREYVgxaHRuUnRyWHRPSXNBejRI?=
 =?utf-8?B?S2NaT210VnlNSk9vRmxJMWs3ZVNRclFGck4wekZMaVdDNk9KdHFUNnFQVit3?=
 =?utf-8?B?cElzTWlZc1hLUmlEZC9jcGlOL1MxOTllcGpYUE1NUlYwQ0NGQ1dheDE0QVhZ?=
 =?utf-8?B?RHZlWU5Ld25CbEhmN3dZYTM5U0ZRRHNZSHJlNEpabVlkaytWZEF4cG85UTFZ?=
 =?utf-8?B?SnZjV2dsSkVyZEJKSE56L0J1ZHczZXpkYSs5Qkl4VnNtU2lVMmlzcnRLTE14?=
 =?utf-8?B?bG4veW1JZmVIOEFIYUdmREJ1bUQ3MVFjWW45ZHJJR3VQMThDV1Z1Y25WRTBP?=
 =?utf-8?B?TTJ1ejBuam9XV2luMlljZ3pic2p5bDdWZWhlOTNlRmdGcnhmV0JlVW5pNFFM?=
 =?utf-8?B?S21tNDg5NmJBcmRXcnNhV0lidTVkL0lQd1RBUGs4MmFpMXpSRDBKWW5STng4?=
 =?utf-8?B?RzRmRTdmVFFXRjAxNFZsVmNYN0tWaTRmcStDYkF1NGRwejYzNVNucUNCbGdY?=
 =?utf-8?B?QnJKaWZQY2ZBaGVPaW40eHZkZUpBanJtbElVWERLS3ZpSENnbjFnMFlMMCt5?=
 =?utf-8?B?WFlISkVEeWtqNTZ2K09rZ25JMjF6NEtQMGNRZkcvdjFIeXlwcUY1bENxR0N6?=
 =?utf-8?B?aUZURGxNa0ZTRWprTnlQb2g2bFYvMzNFbU02bzZ0RlAyaUlOdmVtRENHZnlm?=
 =?utf-8?B?VGExZWNCTE1jVXRoS0d4a3lENzNBaUxRbHgwcitOOHNrRmNWUlU4QTVmL2hp?=
 =?utf-8?B?OXNXR2xkNWZpRC92NFFISlBwenR0QlNpajNzUmFnb0txcHd5bkZ2TmR2NlJh?=
 =?utf-8?B?ak1YODM4QWFVTXEra0k0VDdrSUQ3R21nOExNNk9PaUdSZEpJUzRTc2ZHUkM3?=
 =?utf-8?B?WCtqR3plTmJPWThwaXFoOUhUS2ppNDJCdUNlOXNlRXRNWFJ2OU5XTFNjaU5k?=
 =?utf-8?B?QVJtdmd1R0YvVDJjRnNyY01hVHR5L0lIYzNKaEZONjdGNHh4Wjk0aGg4M1g5?=
 =?utf-8?B?SkpKeEhnYjFaMnh2a2hCUkl1RlI2VytpaklMRjBUM00yQUlrYnFyYjhxdHQ5?=
 =?utf-8?B?WVltTGJHaVhXbnJhTENRWUlGdEFpWHpSbzVFbUE2cFdnVWZWdHAvZXBQazlN?=
 =?utf-8?B?YWJPcG9YdjU3N3F4ZEkwcjlBdjB4cmlpUVVXTk5NbVBNMEJVZHo5SXVqcFcy?=
 =?utf-8?B?THAvZmhMUkhqWDZhblRnd3UvOEYwSnNudnpMUTd5Z29mb2R0eDMrbXRXdUMx?=
 =?utf-8?B?NVpGT1pIRFhQeVdMbW5QdFFvcWVvUFJjeUVVdk5VLzZyQ0FTVWc2S1RVV3kv?=
 =?utf-8?B?NHMzaGh4R1hJR09tOW5iWFo0WElxdTVveUhKYjVxQUl1cGVJVUxpVk1vekpt?=
 =?utf-8?B?QUxrOHFBd1ZGQTlLWll5LzFMdEtaZFllUW0xZGk5UjNWUVZBck5pczJpTTZw?=
 =?utf-8?B?Y2c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7fae9c4-7cd2-4236-d18d-08de11c11a52
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 23:17:00.2758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEncn+Yca+La9DAdrzcQpBb6ZJESVjH1nsD8m1cyKssPKZJbPty/hpOp4auqsx6UhhqDQFEPjFCF0yDiKHvFLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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

On 10/22/25 2:09 PM, Joel Fernandes wrote:
> 
> 
> On 10/22/2025 2:48 AM, Alexandre Courbot wrote:
>> On Tue Oct 21, 2025 at 7:35 AM JST, John Hubbard wrote:
>>> Alex, this ".alter" method is misnamed, IMHO. Because for registers,
>>> The One True Way (or so I claim, haha) is to have the following methods:
>>>
>>>      .read
>>>      .modify, also known as RMW (read-modify-write)
>>>      .write
>>>
>>> "alter" never shows up in this naming scheme. I'm going to claim that
>>> this is a bit jarring for old hardware/kernel programmers.
>>>
>>> But it's not too late: these are only used in a very few places, and entirely
>>> within nova-core, too.
>>>
>>> Can I *please* send a patch to rename "alter" to "modify", perhaps?
>>
>> Oh yes, although I was just thinking that this should be renamed to
>> `update` for consistency with regmap.
>>
> 
> Either update or modify would be Ok with me. Update does make it sound more like

"update" works for me, too. Maybe we have a winner. Quick, let's
do it before a 4th engineer shows up! haha

I can send a patch to rename it.

> a total write though for some reason. Perhaps update_fields ?
> 
thanks,
-- 
John Hubbard

