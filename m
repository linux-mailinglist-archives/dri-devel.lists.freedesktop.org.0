Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C266BBF8B79
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 22:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED6010E0FE;
	Tue, 21 Oct 2025 20:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R9tqsHoY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011039.outbound.protection.outlook.com [52.101.52.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC75810E0FE;
 Tue, 21 Oct 2025 20:30:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZvWOgYc7UNnFSiupa2EvWYlBec5S9jPFtVZgVdenq5OKOY1xfpUXUO3sH2jxZ774yIOio6LuDzTRdxn4aOjDq63M+N82r+EaJRccEi1APgDPIZn23S7UapBrN+Cobi4cCMyzloI/vuV79QGGxGXEcGbaFeAhFREq1hjYpKSBfmvjQncVFjHusfrZ4clkHXHp5fMfzN5k8+575wIPXKHzyRCKZia9ZSMVia/Pr1Zoaw1FQxKU8Ut6NpltJ8NrdiQLN9COnQALX95n3bPZSRdIRGdKdiBEja9WSluN6sygsOPaBJmvYeOaGgQNZVH/VleTCgy56L85A3fbYO2lUpNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnYEMgmSq18dv4YOiejCaHGYyOmUS62yCN+5hd+QSk0=;
 b=sJJxFwepR5lJdWOWwjM2bUozJaqmE8QGP/V6G9MLzKWfgn3vSj2slVxYKWFbJdJfwa/NkIn6SsXffLNR7lNlSaQbsJwdkNC3rEMmS6IHQFVSpkwk5vB8OhTJjK8ssc4PFqMSmekPXpWAZVjYhtxVRxYfvyv1oTZrfuIdEn46s8Te78rfGeD1n65/B0AmOgdkgx4+TuRbx115eSRA0XlQrxLol5j8DaBNmqvDWamXDrdgAzMrF5LTxpPqZKrLa2G4Va9dwN3GPgA+d0VxWpIZSK6i9fuFLlUX38NCwfhQ2GMnj7SkeEDR7ZaB8BHI9H6/+RtkxWYbyEhCJEMwx6mCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnYEMgmSq18dv4YOiejCaHGYyOmUS62yCN+5hd+QSk0=;
 b=R9tqsHoYA3iTfHFiXx6YIIexdjGBqc7eAAvHWycJJMHkyKHH+Q31fdJo+6dGyy6sdR1Ha/b7tTu94Gkdeq5qQcp+7ay6PGpGW+bXyrcrJF4nDVSQbXbRyKxs54bOdMPkGs7BniEG344vDKgGeJFEp5SX9KdoeeswkzdtkGhxalLdtNahSU6vRgFzhEfuU7Teakx0FVNINXo1dn+GJiZXjV8yX3EGwmjIxd+JTI9kXDRNA1i5bUPJHPXGMRR7zY3Z8jHaJd86X2cGzb3jcbdlukoxU66sGFDfyr9P2v0ivtQt8eS7VuGgK4MY4A8pUaD9l+I+AikB+LBm/FJAokgVhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by PH0PR12MB7095.namprd12.prod.outlook.com (2603:10b6:510:21d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 20:30:40 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 20:30:40 +0000
Message-ID: <fac90f9e-0389-41de-86b7-18b13832f413@nvidia.com>
Date: Tue, 21 Oct 2025 13:30:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
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
 <20251020185539.49986-8-joelagnelf@nvidia.com>
 <8680705c-7298-4a33-979c-d91bd4e65b1c@nvidia.com>
 <a4241841-b9cc-46ce-baa8-91545c2aa4ee@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <a4241841-b9cc-46ce-baa8-91545c2aa4ee@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::17) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|PH0PR12MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7b0071-9592-4992-08c5-08de10e0b333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGZjQ0dUYXVtNWVjQ21XNHF3ZGlnK3ZNd2FweVZGblhwSFVuTnlqTVplY2dj?=
 =?utf-8?B?cHhBOVlsdlI4em15UHp1NlJ0WmJ4aThBTXdlSXZKNnRqZEpobVZvQlMwM3pz?=
 =?utf-8?B?NUd0c3dvWWl0Q015M1JubDFJblZCTlB2ZEttVXdHSmF0M05Ta20rZHI3bW93?=
 =?utf-8?B?THlWc3BYa1lzVlQ5cCtHTGt1OStFU2ZYYWFiUnFOWFZ5S2lFeUNqVDlmVmxn?=
 =?utf-8?B?WVZoUXNJZlh1OWNUdmhZWE9zVjVSbndDQ0EySzcyMGZHQkJabjExS3prMDBE?=
 =?utf-8?B?UFhvUXNTZFcvRTRScUQ2ekgrVGFURTIvN0pGWHBjazhmdk5jMHBnaXN5QTFl?=
 =?utf-8?B?YjNEOXZYUUhzOER5TDFSMFhaa1B2S0M1S2FEaWlvdGN6K0t4ampaOVVqQ0g4?=
 =?utf-8?B?Tmt3V2Rhc1JSeEg3MEUvT0xNYTZBdENMZlNDN3B6cHgyeUhRMkpYU1Vob1F0?=
 =?utf-8?B?UTVDdHBkNm5NNW5VRUpmN2hmTjRGQWVOWVZ6K2hvNGxSWDdiVHVKalZtV09B?=
 =?utf-8?B?TkhqMWhNUDhJdjFmV0RBcy9rV2xwaU5HM2JOWGRXbjVxc1BoU1JIZkFiQkVW?=
 =?utf-8?B?NTR3SjV5QUthYnQxTzhJajVxWjR2cURYVzV0NUFZNVFFekFTakdIWUk4eXdC?=
 =?utf-8?B?bWNOaTdad3dhU2ltb29zdkMwTFhsa3ViUk5SUExjVlQxeDNLRldlaVh2M3ph?=
 =?utf-8?B?anoxUDdYdHZWQytiV0d0WVl2cnJoRElyUzc4ejJObXJJQ1BEbGpCNVFpRGdH?=
 =?utf-8?B?aUZHQThaNjBuRE5ybmJwT1Bzam9nWlYrN2NydldyL01QaVVwRjNGSExJeG5D?=
 =?utf-8?B?VHl4UGdSdGFzWnJyaGUzSzg3YnVDVzVaN2hZTTU2dmNlS0VEanYwcHJkRWNt?=
 =?utf-8?B?MEpvZCtFVFhvclJJUnY5L1M1N2R1N2IxTWdLVDRwRWo0M2p6UHBQQ3orc0JB?=
 =?utf-8?B?Yi9nNjJta1lza3h4QmlxQ0NOV2hoMXZoazRMcGgxQ2pEbkM3WGxKd1JDY1BH?=
 =?utf-8?B?eVpDUTFyNm1GMWJENStCS05WTlRzY0FRY0VkZlJ3Qm9WaWVaUFFGTEtEMnNn?=
 =?utf-8?B?eHl4L05DNGc4czJjT09xVHVibXRzaVhQN2M5N3FIaUZheitSRXVWdUJYTnBP?=
 =?utf-8?B?dzc3RHVSNW1QWWdTL1BzckhaMStBR1FyR2xLWWtqaFJaN0RyUDFDQml3VjBj?=
 =?utf-8?B?cGlTdWJuKy9QYlNNWTFyUVFPc2VrVlp6TnRFMWY1aCtqMU5Cck1hajhOTnpH?=
 =?utf-8?B?SFRqREdrbDNQVmQ2OHN5alJDd1A3bXNuVmxFWlpUb1QvRHY3RThZNW5DVVJu?=
 =?utf-8?B?Y1VKbGQ3N2E5cmdCUmxBUEE3c1hsU2MvS3hadTdDcUg5R2xkSUZyL3phcDBB?=
 =?utf-8?B?enFzL1RRcWRORzJyRWF4UE91YjlPbmJma1ZjbGhWcmZCSVNMeEl5dkVybnNm?=
 =?utf-8?B?UE44OThnLzh2K2cxVVRLclJNeFVPUTdycVdVUXNmUXBQckhubWpkSHB6UnpX?=
 =?utf-8?B?QnJXVEtDSmozWnlOUVA2VW94VVdpS3J1bStrZnBNb09Ja3N5VkduRDdpbm1D?=
 =?utf-8?B?RW9MNDBkZmpjMlJDTmQyQzRCc2FmWFQrZ0NsWExaZ0FTaFJIS3BiZmo3SzRJ?=
 =?utf-8?B?ZW1MV2ZwVlh6R0g3dEFId1ZHa3Z6cVpuOE9QWTdGVEhZR2k4LzFXUmFEd1py?=
 =?utf-8?B?d2JjWThFRWFyc3ZiZkhzVkxqT0ltdFdwRTg3NDJNc2NGS1FFbHB3eEl6UG14?=
 =?utf-8?B?L2paSzNySGhJQnpxaElXeXNIbnZaSFZzVDdBUnpJY1lRb0pMcEduSUdjSFoy?=
 =?utf-8?B?MjIyLzF0ZUVSOUhSVGxHU25Iem1xSzJZWUhZeG9lbHREYU5tTmJrTUtzT29l?=
 =?utf-8?B?eXErd1lROWFRbGZQNDBzclBpdThIK25vN0NYc2p0MVZ5Ri9venVRV0RsakpF?=
 =?utf-8?Q?NZyPY/i828FmRaf/wK7wG+5512glSwya?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmpNaGRmVWtyQ1RYWjFjNkVvWnVFTEpKcWg4c3lYUC9yRmdYanhlR3BWYzE5?=
 =?utf-8?B?TkhwN2RjUEhvSW9mRzhvSGtKWU9LVE0vTlkzdDA3WDNrVmJQbmZxT3NHTW9U?=
 =?utf-8?B?QXIyV0l2T0QwWWJsMGlmU0hYbHNhb1VZSjVkSGxnYjFrWUxJYzVsQXlSWGVh?=
 =?utf-8?B?TjJtU0VFd3BXUnY3bC82VmxtSENBWGo1NDBCL0JjS1dsNFN0VnZVaXFVd2o0?=
 =?utf-8?B?bkd0dHo1QVdrMEFNZFk2eGJCRDlvVjlSMS9lT3l2M3FzUHcvL3AzUnFyWjQx?=
 =?utf-8?B?Y00xQUVLblFkZFNPemRYdXFhaitsNUJtQVR0WklUL1NJZk9qRjBLNnNHZjNM?=
 =?utf-8?B?WXBlQlRTSmRHYSttVVVSRm8weTdnSTVuUFkwNWd0UVZDblExV1duUzlZaTE0?=
 =?utf-8?B?OUNkckhrekNPTFBaY3ppM2J2aVV1NWNZanhyZEI3NWI4MFc5YkQwbTlXLzdC?=
 =?utf-8?B?T2VaTmpMdzlNcTFGOTRTKzRjc2VJSytUR3dzODNvVkt0ZlJzcmdZRkIvTmR2?=
 =?utf-8?B?QUl1Y3ZTLzJueXhWYWQ0ckN0N0FBdWFlTVRlWUxrSzhPaE9qTVBCbDh5bU5p?=
 =?utf-8?B?YWhST2hnY0twVlpNcFRmN01QM1pOMW9NTDIyN0VKTmRIalh4Vm52L2JZOXJm?=
 =?utf-8?B?bmZ1czd0cGdLVTB4dURaa3kwYTJKa0hHdlBlNnRKUW5sT2VsdWwySGNMOFlj?=
 =?utf-8?B?SDJtODlHT3VnS01tV3l3b3VGNUgySlB2eWJGa0dCMWJKL0ErQnRyT09OR0xU?=
 =?utf-8?B?cHpJdkg5STZEc3hDU3ZabVV0YkpRb21Eb3hvR3R2ek9OUlg0ckNpNDdoZVF1?=
 =?utf-8?B?SUhqSGVoWnRyeXB4MktieWhJRkxENEkzNVN3cm9tbzQ3bE9ER1dHSVdwMEVD?=
 =?utf-8?B?YUFmUzdvOFFQRnNheFE2YzhaNnFHUFp6UjljMWNwV0RCZUxhTHRJQUgvUThy?=
 =?utf-8?B?VG1Ua2g0SkxGZFliYkVEOVFOZkVrb1hhTmdlRXY0WUV2bjQ1SURLZmFiUHE5?=
 =?utf-8?B?c3l4cThiM3JDVUNsSUE3R0pZNU9mTjBkYkdnSmpjZThxZGdXQ3BjTS83bUxH?=
 =?utf-8?B?TDlTOU1MZnR3SmNwUSticVNudENiWkFUSFNwNWpmblphbDBYa3ViUU5OTGVH?=
 =?utf-8?B?Yi9xbHpnUkxQeTlsdkJ5SHordHhlWEh4cTQwRUpKUlBBUGdickNxVE1NdUt3?=
 =?utf-8?B?bVJUcG1tZFlRSnJiRGtOS3FUdmh5Z0Jxemh2QnIrZmRrYUFlU2hXdnhtdFY4?=
 =?utf-8?B?VVI5Q3NWN0hXZ2R4bjNXZy9yb2FLYXl4ZmhrUkE1Rkc2cDJtV216ek1iTWJJ?=
 =?utf-8?B?bEdBUi9sVUUyMmhhS0RKdmNPMVk0YTZoSjJCcW1HcSs4dUoyYTcwdEx2TGlG?=
 =?utf-8?B?ODdKVG1TZEdmeU5CZUR4S1M3aFZsL2RWcDJKV0o4TTBscXRpVW1WUUFtTFVT?=
 =?utf-8?B?dzIrQnk2UnB4K1VRMWRydmg4UzBSWkkyY0pPUkM4QXZhV0FsN0kvaDZubjhS?=
 =?utf-8?B?d2JDQTFwd3lTZWhkS3NweWZLRStUZ0NyQ3pCa3JxVW52KzhEVkh0T0NqU2I1?=
 =?utf-8?B?QkFDRGlYbHB5REs4ZmJPZys2ZmhlM1JraWs5ajAyQnZvV2tWNWxQaTV0Ti85?=
 =?utf-8?B?TCtHem4yZHA1eDV5U1A2Uk9vY3lhYVFnMjFhWGQ3aW4zUUtrR3JKbUh2S3Vp?=
 =?utf-8?B?M21rTW1Mc1Jtc1djT0k5bVpGZ2djSUVFUHd3N3RJTG9TVi9rTVppcVNmWVFF?=
 =?utf-8?B?KzlLM2Znei9DelVDcmRyVE8wRUpzYkZEYnUxb3I0ZlVMS0JFdXV1WURWcTRU?=
 =?utf-8?B?WCtWWCs1NjJCT0VWbVQyR29hY2dCWGFFWWhQSEdVZGw4NXVvVnRydkt2L2Iw?=
 =?utf-8?B?NEVsVjg0NWhoTURYR0pvamdjdG1YY3VweTZvWHpKcTdnbm93MUtDVlJ5dGc5?=
 =?utf-8?B?endnbjViZ2hxZ0tHSXdsOWRJSm0yNXA1a3QxcHJpRFFlamdCT3VSVzZwVjl5?=
 =?utf-8?B?TVhQYzNyN2N2UlNqUjNZUldjOFBRYkhPeUJDY2hRR1pEcFZ6OUk2a3dYM3JS?=
 =?utf-8?B?M0wyaS9MWGphOEJkYWxHYWRJNXU4UjVnQklCeFJJYjc3U3lVL1MxUlJ3YXJP?=
 =?utf-8?Q?XHtA3wTEYYtECCJVWHsxkHqv5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7b0071-9592-4992-08c5-08de10e0b333
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 20:30:40.0878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3KRm6qKaxVaHpYGUDu9O8pwLKw1INw/HhoU+Ms9Eb3LeJFuAyFGxmvPfRsknylLdiwVjG3u1yaAeFuqTNl4Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7095
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

On 10/21/25 11:26 AM, Joel Fernandes wrote:
> On 10/20/2025 4:59 PM, John Hubbard wrote:
>> On 10/20/25 11:55 AM, Joel Fernandes wrote:
>> ...
> Yes, there's different format versions.
> 
> This patch supports all Turing and later GPUs because all GPUs including Hopper+
> are backward compatible with version 1. However they wont be able to use the
> version 2 and 3 features with only this patch.
> 
> I kind of intentionally did this for a first cut. But yes, I could split it into
> versions. The 3 MMU structures (PTE, PDE and Dual PDE) are versioned. Version 2
> is Turing and later. Hopper+ is when Version 3 got introduced and it is also

Ah, then we shouldn't even do version 1. We should take full advantage of
the fact that Nova's earliest GPU is Turing.

> backward compatible with Version 2.
> 
> We could eventually support versions 2 and 3 (instead of just version 1 as I am
> doing), however my working MMU translation prototype is based on version 1 (I
> did not have to configure anything in the MMU to switch versions, this was default).
> 
> There are a couple of options:
> 
> 1. For starters, support only version 1. Drawback is, when/if we want to use
> version 2 and 3 features, it may require some rework.
> 
> 2. Have the following hierarchy:
> mm/types.rs - all common structures (stuff that is generic like Pfn).
> mm/types/ver1.rs - Version 1 specific types.
> mm/types/ver2.rs - Version 2 specific types.
> mm/types/ver3.rs - Version 3 specific types.

Maybe a file/directory structure that more directly indicates page table
formats. "mm/types" could be quite a few things.

> The advantage of this is it keeps the structs namespaced. So it'd be
> nova_core::mm:types::ver2::Pte or nova_core::mm:types::ver3::Pte. And the
> nova-core MMU code can pick the correct version.
> 
> 3. Keep the single file types.rs and just suffix the structs with version
> numbers. This is attractive because there are only 3 types that have version
> flavors (pte, pde and dual pde). So instead of Pte, we would have PteVersion1,
> PteVersion2 etc, and a helper abstraction can pick the correct struct.
> 
> 4. Any of the options 1-3, but dropping version 1 since Turing+ supports version
> 2 and later. I do have to figure out how to configure the MMU to use a specific

Right, I see you already noticed that we can start with Turing. Good.

> version (which is reasonable).
> 
> 5. Your options here.
> 
> Btw, I used Nouveau as a reference as well, so likely Nouveau doesn't support
> version 2 and 3 features. Not that that matters (we should support newer
> features in nova-core), but just thought I'd mention it.
> 
> Other thoughts?

Two things:

1) Danilo is working on writing down locking requirements for Nova page
tables, based on earlier experience with Nouveau page table locking
problems, which were apparently very serious.

2) Maybe it would be good to start with versions 2 and 3, so that we
can see how to do >1 version?

thanks,
-- 
John Hubbard

