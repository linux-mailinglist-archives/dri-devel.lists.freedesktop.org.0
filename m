Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DA0AA0C00
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 14:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D011F10E43E;
	Tue, 29 Apr 2025 12:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eCFnpT22";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0AB10E43E;
 Tue, 29 Apr 2025 12:48:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2zxAa1NDuGFjFG2bV6wlhBUT32TPpHUt6iG1Qm9Z3RxFv3XGuJ04IY+vPZvZBXb1VvVIlogY0OfUIER9gLmGBtyxIhYDgU17K2PKZaM+HC8lPJAqw3daQzTyHySi1wMXXsE1Zb7FF2snU/5Xq3VzXC5LaMSzKCoKm1+qPj2VEcCBfvJ0Mjjrh8RUCB9Xhc0UJO73gOUMUg16zg9FcbwulEC681CDZfHT/cF6woa+dJF/xW5CmQ4aYjRZosBoA19tj171qIpaDqUdn2g3m8g+iqo89DoDoqEERJ1mz0gVVRvsNrylLAtK/2izhO10zTbwB5KsyJ7DR1WuCHCtHVzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/USV0Zoivh974fVba764W0x8+qJ2Tf6Xjqlfae8OvQ=;
 b=Lg+YbJDa1UvwK5GqULSWgQVKfCInFLlqg5jY0t1I2Lzf2MJ5vh4gkBjC6QoISVgW/F5YqNXfO7NSVU5tpXRs2REOa87uwKzP5LFV3TitK+qe9xDm4FEODD+KyaoNIvvrF08lm+fYnZ4YjkqUoYk86IB7ETX1YM+LrKf+UdfkzKVEa96e0PwtRsNTZ1Pv4BBMZ8bjE5vJ/3E2U9V+39Vj0qAkY/rdsi0TGQrdBPN4sAGB30Bh9nSxr7i5qKLB9nxdV3G5dVIY2x3U3j9FkicVQWNl6RiV2UuimkL7eeEE19eNhJ36ltbw8eQQ3ovNz8SEEEtsegeBGqL44ZH25BcgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/USV0Zoivh974fVba764W0x8+qJ2Tf6Xjqlfae8OvQ=;
 b=eCFnpT22S8l/ydnKbrKT58A8b8rCN/iWU/Ey84Njaw1xmeXaN8WyC8Sg0sBj1JlFPIIQZi4f+kvJwL85Q2MWyT1A9rKN09CvXaO611KilS3K/ZTyzrSUPKS1ZEWExRHQM6VpUpyP1axO8dBmokK9CFUyJBgzjEuohhpnQK4r1HTFkDP250L2/1nv6Z1RfECuZ0oKOC4NW344EBxr1gpKWqkXjBl12Q7mBPyygvK5+UhmCPUXnz1iuTSba4G4ERpZPHr55ZiwArRmV7GomPwEJdgZV8l0Uf4UCmYRkVyuHPdyJoBpnO6pVkAL9ljIWez+dkof4ifDQIDD0Y7ArB3Rjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN7PPFD6BF22047.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 12:48:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 12:48:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 21:48:14 +0900
Message-Id: <D9J4UK3LWDL6.4TE5O7WM6AIP@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 08/16] gpu: nova-core: wait for GFW_BOOT completion
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-8-ecd1cca23963@nvidia.com>
 <aAd_PBVB5S5pHeP0@cassiopeiae>
In-Reply-To: <aAd_PBVB5S5pHeP0@cassiopeiae>
X-ClientProxiedBy: TY2PR0101CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN7PPFD6BF22047:EE_
X-MS-Office365-Filtering-Correlation-Id: f17c4d48-df67-4222-f5a3-08dd871c1cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0UxM0JqSndORkJ4SVJVZXVManFORjN4OWhyQlg1T0dqQ3ZLUTZaNTEzeXl5?=
 =?utf-8?B?NCtrMVR2MGxDeGR5cGpsaEw1RnFFRitnVG9vdFZWTXowM3F5MzRwVjl0QkU3?=
 =?utf-8?B?NXhNVWFudnoxT01nTlQ5Um9nMjNVaXFJQlZxUFhSWG1BZTgrVXI1QWU0S1Fy?=
 =?utf-8?B?a3RtQUFLbE56dWZDNFBtZFJ1NVpPQ0s2VVBxRlBPM3I3ZkNLT3o2WDNleERk?=
 =?utf-8?B?UzBBc2RaVjkrRTNuQVBUN3V2aTJ2aTBtNmtHVk5rZ2V1QmZyNGh0c2F6Wnor?=
 =?utf-8?B?OW9jWmxibEFIRWxWOWpsQk5TdXRoUlNLNXkwSEx4M2x5UlVTYmdrRW9XNzNQ?=
 =?utf-8?B?M3h0RXpUVzV1bDhpUjhGNVY2TkloT3RmYVBWeFFhNlVUWUlma1M5aUVpSnFL?=
 =?utf-8?B?cy9KNWdOK1dPUTc1OTY1S0xHQUpRWXFPK05wY3hCRnh0T3pVazlsOGNUVFlW?=
 =?utf-8?B?bnpzTGlGT0ZrbTFFaWI3cFhqUVpJZHArU3dhNXBMZmlWWjdmVS9rVm5lMCtZ?=
 =?utf-8?B?MVo3YlVzVlVPYWg3Wm5GTWMrYVBqeFhieS8xaFNzWVZERGpMeWJYdkNZY1JZ?=
 =?utf-8?B?MlUrQ0VwbS9TeHpyRXJWbEtuYk9sYjBkT0o1VktxMnZyeHBsQTE1K3ZUYUNx?=
 =?utf-8?B?K0RWSzA3WEVabU9EajVSOGREWjR1TUcyZW9jOEgrOWNFNnljMy9iQ3JzdHNV?=
 =?utf-8?B?QzlVNnhRQW5BSzd0cENQcS96anc0cndwaDUrMkVxWU1IczlGQmhwYjl2YzZQ?=
 =?utf-8?B?Y0duMFZkQmVXc05PZ2lQQldOSFZsaENCZlZCRWtkcXBwRmkwbElvQVE3VFF0?=
 =?utf-8?B?RHNxbWxWLzJhQ2VHd1lINW5HOHc3WHY1Vm1kNUoxOGhobmlzeEZiR0VEL1Rk?=
 =?utf-8?B?MmhpM1FJajFqMTdxcmNlZjd0SWlDWjUvYVpPcXYvYmVaQzdkNWxWRExDOER1?=
 =?utf-8?B?SWNnaTIrcjhsVjVCTkxVdTBwV1lCaEpyVFE3RTdROG1zSEVNek1ZcDc3UzI0?=
 =?utf-8?B?VUhFczlxSEhiZzVBYTJOanZjbW43aklxWlRnbzE0VlAyaDhPU3krc2FzRUVF?=
 =?utf-8?B?ejc2K3JteVZXV1hoTENsZDZtM29zVkxMeW9XMmY5SnQ4QXpUU2J6QklxM3h1?=
 =?utf-8?B?V254b2pKRnp2RWZid2FDOEdDWVUva1M1YlhXNWw1b1RVWVAzZjNOOUV0ZHIw?=
 =?utf-8?B?TnZSSG1HOWlUd1NWbis4SlpyVjRab1p6NGQxZC9BYTJrblRTRXBUK1lsbzhl?=
 =?utf-8?B?NDFteHVRMXMwdEZtRzZxcVpXUGgrLytRcmFlcTlWMlpwQ3JPVWVEdzdqY3dk?=
 =?utf-8?B?MVVXWWlscnU0djZBR0dwdCt0N0xGWVVRMUtMZnZOb00yRjFrenhER3kwVFFJ?=
 =?utf-8?B?NHlHcEdOSG1PRFJoVm5qQi9uUXBwZnlTK1B0RHFpNVdrZlJuK2g1TEJReXA2?=
 =?utf-8?B?Y0xlMmd3UXNSdnozU3BMUmxaTHBieHl3NENzS1JRejdVKzlZTHFCRkdhODg5?=
 =?utf-8?B?SkhaSWE4bDhvZzlhSUk4cStadXFlY2N4MFc1dXRqc3pIS0k3Q1l4QXlGN3hi?=
 =?utf-8?B?TXM5SDJmV1V6bHRHRnFjcU15ZFU0a25wblV3cW5wOEd6aFQyR0Z2cjJpMkdo?=
 =?utf-8?B?TTZBYWRqbUdtc3M3ckZCYTFqKzNKTXd3U1dsbVJlZTZ3NlhCREdTVmVEbUw2?=
 =?utf-8?B?NnBDVTQzOTRBQ2d0M083UFRlQk5xVllrRWJLdzFPVXFuZHFzUGE0eGYxdGt3?=
 =?utf-8?B?NTdUNWdLcXd6c3BoTmFwMXNEN3BZS1NvTWJtRjZxOGc5MFBQbDl0cGFNNEww?=
 =?utf-8?B?TXBQMmlBNk5DWXNaYmdyRmgrb29Wclpyb1RYUHV2WUVzc3dMM3pmVHZ1ZHY4?=
 =?utf-8?B?L3hIU1hkSDZKNkl0aXRIZ1BjYnNkeEJ1VlN5eHFqU1liUnVUenVNWkdNMmhq?=
 =?utf-8?Q?FOAYmqcxlXQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEtuY2YwZnJreGJ4VlF1dmwvT1YzNXVIZHRBeUVsK0ZpRXdxV1NJTUcvaEpu?=
 =?utf-8?B?Qzk1aFJhNnJpNTdwQ1YvTHdyVGFVYms3dUVCWEs3aFN1ZUppUUp3QVRDQ1Qy?=
 =?utf-8?B?U1V5elJ3ejVDT0htbFpWUmtHSklFb2ZnU2xOa2RqNHBSZi9HVytRa3FmclpJ?=
 =?utf-8?B?WVJqRHA5SEZNRmRmZndWTmJPUVVuWThaMTJmOE14VjBkTFo5bmU2aExzL3Vj?=
 =?utf-8?B?WnpJbjhlbHRpUE1kN3FWQ3NFVmw2RXFUOUdGNXh3dlljbFBoaDM0YlkxRGQx?=
 =?utf-8?B?cWRSV0tycGlsTjR5aGMzbTNrbE1UQ1pTU2FzTS9sUkdSZ3BJaGhnRnhXaE5Y?=
 =?utf-8?B?N0VZeDJIYnpnanpVUGhFbmp6Rlp1OUkyK3FmSjVwTE1JUWhBR05pWkdWdW5D?=
 =?utf-8?B?NWdBSFVNcVNGR0ROcEJQeXAySlkrb3EwS1JZUmwzTXQ4YktleTlJNDdEVXBs?=
 =?utf-8?B?bFN6cVVsYjkrN3hvcGJaekxjZTZ3YVNYa1UxTDVBZS9zaFFhNXVjSVVwT09a?=
 =?utf-8?B?bG1jRlRMUVA3Y0hKYzJzK0h1emtKbzYvcnhzOVRzV0djbTQzdVdSdmVoZnhP?=
 =?utf-8?B?VXdpM2U1ZVNwbnlNb1l4L3dieEFLZnIyOWhaOGhIVVR3RWdRQ2Mrb1dzaUtj?=
 =?utf-8?B?Q1cweW9WckVOM0pZeS84QnRxNXVoRzRBaDI2SjdKclFUeGFPczQvNFVaVGs3?=
 =?utf-8?B?SkpYMzBQTG9wSklWdzdVZzdKUG8yaXJhTUlsT1VFZThFeWFRdVJBVnRSQlFr?=
 =?utf-8?B?K0lzRVI3MklIWlYvTVE1UUQwOHRQeWZVa3Job1BEYXBsSm42bmM5T0ova2hB?=
 =?utf-8?B?UW1JTStLS1pWY3lWVFFoNDVwZEZYeTlDa2puemxFek1Gd1RPV1pJcW4xeERo?=
 =?utf-8?B?Rk1Ca3FjRld0QndzVGhYU1JxZmZqU1ErbkFUbFJsTkxuMjZ0NGl6R25BUjNR?=
 =?utf-8?B?WXBCSmpmMzdvZFRSc3pTODNhWjYvZ3JVNUZzMCtUSkJNVlFVMHRBMVBkYzZJ?=
 =?utf-8?B?SVNVdmZHOWlIVUllVklnaWZncUpiblFIdithMzlvTzRHWE85N2pnbjZvNjZ2?=
 =?utf-8?B?YndxWVYwMGNvYWFSTzNia0tPUmdCWmJSTGlxeG54Mi9ZWk1weEV6QysxSnRK?=
 =?utf-8?B?UGZBOTk5b2RuTVd1Ym9ST205ckN6MXB3SDJxYkl6S05WbTNMK1g1SndIZ2lP?=
 =?utf-8?B?YytzV2htRlNtMjJ1a3FtRUZ2enhGUUNYWDdGdllzc1FCVEQxZ0NKNVVtNkFZ?=
 =?utf-8?B?c1VMQmprL2JhS2lIOFBMQUdwcUEvcjFEQlpNYjFZMkZuQWJNMVlQRmhIQ3Uz?=
 =?utf-8?B?TDdVeGtGQjI0MUYxLzV4bnpQa2VFTmhPdnc4N2lyUG5lcDM4bzc0aWF5VHNo?=
 =?utf-8?B?MkQxL29DQXhCZHJETmgzZUtmNWg1OEJ3cU9MUktqQnhTaFBXd3pCeWlOSTc1?=
 =?utf-8?B?Z0pEbTU5YzMxWTMxeVAyUXRrQVovYXZFbGhaOVhsaWdtTXg3djlaSm95MlB0?=
 =?utf-8?B?cis5bFJ2cVFIZkN2U1pjQm10NWhjTUgyejFGZUxWbDl0MllZM3BJK3l3cnlJ?=
 =?utf-8?B?RTRGNlJLVlMxWURVMjBsTGx1MzB4TGQrMFh0Qms0bUZQaDlzWUdZVUZ2N3kz?=
 =?utf-8?B?KzVsUWRrV3Q2SEVEcWZxUzhDeU5RdUlkSHQrVkZUczFPZjZacjNEWGpwdHFr?=
 =?utf-8?B?TEgyeC9NZGh1NjJjbFgvL1Z6c2J6RGdTZkd0RktiZVFGdGJpZTFIMXJjZzV6?=
 =?utf-8?B?SHcvTE02VTJpQmRXTXdDTy92a29Ud3lNMTQ3dHdwVkdWbm4zSHl6dFN5bkJV?=
 =?utf-8?B?UmZiMmp1T01VN2dwRUIzeVB3allsZi9RdmhySTk0TUluaEF1Ync2N0FqdE15?=
 =?utf-8?B?dVZkaTIyNEMzeWZLeElLQlhSQTl6MSt5MTN5a2Z2ZGhuRnJsR3hrd1pOSW1y?=
 =?utf-8?B?RG5aS3RoWE1NT3R1ZER6MnpGZ3dyV2NEZ3crVHAvWVc2N2ZNQkVJRUFXcFVt?=
 =?utf-8?B?YjVFN3E3azJndDFnUmdEdStqT0w4eWtBc0lQSno2SjlBQTVFSlBCUElqTndM?=
 =?utf-8?B?Z25iR09KZkd0RjZBUzczUXlqV01JYkliS25CU25JdTJiWGh6cXNOTkV4bWtX?=
 =?utf-8?B?N3RGTjlJdHAxenZMdEtPSG9pSnl2TkgzdWR3ZmIrbFNrdWJCVzNPTHFqcnE1?=
 =?utf-8?Q?vFmWvzIM45Oh5Ml0w5zRwaLlmexfPlJD4VOO+7b23WdC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17c4d48-df67-4222-f5a3-08dd871c1cec
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:48:17.3572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1p/tlCoMVKCWf+qifOsNcytZIEZg8RUar96AheRBVlUBVlhtjRVvk83gaWo1zq4Un7Qj/kKpfzBwbeYDSQTNXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD6BF22047
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

On Tue Apr 22, 2025 at 8:36 PM JST, Danilo Krummrich wrote:
> On Sun, Apr 20, 2025 at 09:19:40PM +0900, Alexandre Courbot wrote:
>> Upon reset, the GPU executes the GFW_BOOT firmware in order to
>> initialize its base parameters such as clocks. The driver must ensure
>> that this step is completed before using the hardware.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/devinit.rs   | 40 +++++++++++++++++++++++++++++++=
+++++++
>>  drivers/gpu/nova-core/driver.rs    |  2 +-
>>  drivers/gpu/nova-core/gpu.rs       |  5 +++++
>>  drivers/gpu/nova-core/nova_core.rs |  1 +
>>  drivers/gpu/nova-core/regs.rs      | 11 +++++++++++
>>  5 files changed, 58 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/de=
vinit.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ee5685aff845aa97d6b0fbe9=
528df9a7ba274b2c
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/devinit.rs
>> @@ -0,0 +1,40 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Methods for device initialization.
>> +
>> +use kernel::bindings;
>> +use kernel::devres::Devres;
>> +use kernel::prelude::*;
>> +
>> +use crate::driver::Bar0;
>> +use crate::regs;
>> +
>> +/// Wait for devinit FW completion.
>> +///
>> +/// Upon reset, the GPU runs some firmware code to setup its core param=
eters. Most of the GPU is
>> +/// considered unusable until this step is completed, so it must be wai=
ted on very early during
>> +/// driver initialization.
>> +pub(crate) fn wait_gfw_boot_completion(bar: &Devres<Bar0>) -> Result<()=
> {
>> +    let mut timeout =3D 2000;
>> +
>> +    loop {
>> +        let gfw_booted =3D with_bar!(
>> +            bar,
>> +            |b| regs::Pgc6AonSecureScratchGroup05PrivLevelMask::read(b)
>> +                .read_protection_level0_enabled()
>> +                && (regs::Pgc6AonSecureScratchGroup05::read(b).value() =
& 0xff) =3D=3D 0xff
>> +        )?;
>> +
>> +        if gfw_booted {
>> +            return Ok(());
>> +        }
>> +
>> +        if timeout =3D=3D 0 {
>> +            return Err(ETIMEDOUT);
>> +        }
>> +        timeout -=3D 1;
>> +
>> +        // SAFETY: msleep should be safe to call with any parameter.
>> +        unsafe { bindings::msleep(2) };
>
> I assume this goes away with [1]? Can we please add a corresponding TODO?=
 Also,
> do you mind preparing the follow-up patches for cases like this (there's =
also
> the transmute one), such that we can apply them, once the dependencies di=
d land
> and such that we can verify that they suit our needs?
>
> [1] https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@=
gmail.com/

Good idea. Added the TODO item with a link to the patch.

>
>> +    }
>> +}
>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/dri=
ver.rs
>> index a08fb6599267a960f0e07b6efd0e3b6cdc296aa4..752ba4b0fcfe8d835d366570=
bb2f807840a196da 100644
>> --- a/drivers/gpu/nova-core/driver.rs
>> +++ b/drivers/gpu/nova-core/driver.rs
>> @@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
>>      pub(crate) gpu: Gpu,
>>  }
>> =20
>> -const BAR0_SIZE: usize =3D 8;
>> +const BAR0_SIZE: usize =3D 0x1000000;
>>  pub(crate) type Bar0 =3D pci::Bar<BAR0_SIZE>;
>> =20
>>  kernel::pci_device_table!(
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 866c5992b9eb27735975bb4948e522bc01fadaa2..1f7799692a0ab042f2540e01=
414f5ca347ae9ecc 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -2,6 +2,7 @@
>> =20
>>  use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
>> =20
>> +use crate::devinit;
>>  use crate::driver::Bar0;
>>  use crate::firmware::Firmware;
>>  use crate::regs;
>> @@ -168,6 +169,10 @@ pub(crate) fn new(
>>              spec.revision
>>          );
>> =20
>> +        // We must wait for GFW_BOOT completion before doing any signif=
icant setup on the GPU.
>> +        devinit::wait_gfw_boot_completion(&bar)
>> +            .inspect_err(|_| pr_err!("GFW boot did not complete"))?;
>> +
>>          Ok(pin_init!(Self { spec, bar, fw }))
>>      }
>>  }
>> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/=
nova_core.rs
>> index 0eecd612e34efc046dad852e6239de6ffa5fdd62..878161e060f54da7738c656f=
6098936a62dcaa93 100644
>> --- a/drivers/gpu/nova-core/nova_core.rs
>> +++ b/drivers/gpu/nova-core/nova_core.rs
>> @@ -20,6 +20,7 @@ macro_rules! with_bar {
>>      }
>>  }
>> =20
>> +mod devinit;
>>  mod driver;
>>  mod firmware;
>>  mod gpu;
>> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.=
rs
>> index e315a3011660df7f18c0a3e0582b5845545b36e2..fd7096f0ddd4af90114dd111=
9d9715d2cd3aa2ac 100644
>> --- a/drivers/gpu/nova-core/regs.rs
>> +++ b/drivers/gpu/nova-core/regs.rs
>> @@ -13,3 +13,14 @@
>>      7:4     major_rev =3D> as u8, "major revision of the chip";
>>      28:20   chipset =3D> try_into Chipset, "chipset model"
>>  );
>> +
>> +/* GC6 */
>> +
>> +register!(Pgc6AonSecureScratchGroup05PrivLevelMask@0x00118128;
>> +    0:0     read_protection_level0_enabled =3D> as_bit bool
>> +);
>> +
>> +/* TODO: This is an array of registers. */
>> +register!(Pgc6AonSecureScratchGroup05@0x00118234;
>> +    31:0    value =3D> as u32
>> +);
>
> Please also document new register definitions.

Thankfully Joel's documentation patches take care of this!

Cheers,
Alex.
