Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91383BF3B99
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 23:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441B710E524;
	Mon, 20 Oct 2025 21:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wekg1rEJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012005.outbound.protection.outlook.com
 [40.93.195.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136BA10E520;
 Mon, 20 Oct 2025 21:25:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stUxXz5tI99wjIgqkOjcGOMbwypcdcwMhb99Fi6WX6MukEEA1HR0XfvXIBUGeu8XLT2Ym7DwyUGMXfhxewY/0NOjSAsmtt6/Dk4NqAr/9out0JiTVJp+q4/NKhMyhtaLjQccPEY1TJb11FrMtWHuqAN/Aql+3WQTtiygZ2E/v3FimApqmrzUW+uxQj0fJxxeGuGEBK7Anmjshyf+vZaVAKlVs43GGMB0X3oNNaIl2itoebS9gu4h5nPzAkPwWk3+XgED9Maccv1PywG12pe5mds4N3I/0t50ZaxxvZ7v/rbookPcvFGEYheS2fp0uusdSOKuW9kFoDl6Af9T5gIt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuxR9mjiZs1al8raGfyNrD8BM5rNn5uJiXOd/wCZFo0=;
 b=V1tARDmX/ed+9cP3aPaCEeOmzy47JFXvWByTLjzNPHEb15ex7Nz9durPyx3xzzu//fY3OwT7F9/Od/3R38dZld8BRJqRPMt89BT6ANlaz7kTK0rkjFcGC8talaceJHGB2sf6yY4Vfdm92mnhs+nvQ4AdZWPsNw/rjwsyNu8hwWlAt7Pa3z8gmAMmVDNQKDqzepRPjOxYKnoRop2KnsqLljS/Dicp9Vlp+3QjGsdhCNDsL3em6FIoko+m8DRQA5C9SEWWmhUvwnMD4w1uUW04vM2F162R1cRfrp1DvT8YZDI/fG0e3vRHZeCaxWGZMFxD+FIGYbfSz6l1KsOIQEYkCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuxR9mjiZs1al8raGfyNrD8BM5rNn5uJiXOd/wCZFo0=;
 b=Wekg1rEJUDv3xHDOaJCGr3adl45kTtKR0SeOGmRCoVhgyZ1tez23OutdxpcXXG0JHO8bPzyijjliJ0Qspb3HiIVHElLQRySysyhvUUPObUS+/NSZqG4AA2XM/SjZht6X3Ib2SEPcZYXDpxMpl0Hol1cBcKwGBouFrQQvuMf6guM/JLVMKwdgy0JNrirukIm/iPVi3mIBfTPKIyn/UYg1FtNFkovEDJ9M4vbzSw6W6s+PWG82TSc7SMs78uXWnEon0FfDD2vusdKfnzq1fSGC2lW9fpScqwi6AGfi6oPud+jGTMCSsDQdxfiPTKKmyMHvffDeU3I1QmbeX4Ri0EqFZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS2PR12MB9637.namprd12.prod.outlook.com (2603:10b6:8:27b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 21:25:51 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 21:25:51 +0000
Message-ID: <bcea1756-d8db-442a-afed-ece32ba34aa9@nvidia.com>
Date: Mon, 20 Oct 2025 14:25:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] gpu: nova-core: Add support to convert bitfield to
 underlying type
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
 <20251020185539.49986-3-joelagnelf@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251020185539.49986-3-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::40) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS2PR12MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: c41266d8-94fc-4da2-8090-08de101f3ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDgvUVI2akNWdnR4UWIyUkd6cXBWVjV2VmRteVJxNXJyNXVMU29LRUVIU0dw?=
 =?utf-8?B?M1h2MmNuUXdpTW1ZU1hxZEZwMXg2Uk96K3RrUFNOWG91L0JGL0NlYUFaU0V5?=
 =?utf-8?B?aDY0NXRCZEZxd2NCMW5DRWUvOUtYYjdrYzJGYzlxYUlTNTVrekpCZzh6djc0?=
 =?utf-8?B?L3p5cEgyR0VqaFJHc1dzcWhYUjJKM1FiZ3g3bGdGbnRseTNBbkpRMC9QQ1Jv?=
 =?utf-8?B?TlpXdmdQV0lMMjZwQ2M0eUlzbEZ1RUVzOHQwV1ZyVmxMMkNnZGNsYjU1K2JG?=
 =?utf-8?B?MHZOUThKVEdCQmtJdTJMTVUrVG1XR3ZYTUNVZ01GM0xldHpYQzlVRFJ4dDNZ?=
 =?utf-8?B?Um1jMlpDUWhGb3Q4cExtK3U4bkRIcVBUSS9nVFl4MGZuMmhqSHdOOW03cTk4?=
 =?utf-8?B?dTBJYmFveGJqUHprNGdKMGVYYTVVWWJnT2pLU2NTdzJsdmY2bVdLM3FYTldw?=
 =?utf-8?B?MEk3bEl1R0p3WUhJVFZjWUVhY2wyVjRQQzQvbFJlMmhBaWtYVVUzM3ZPN25i?=
 =?utf-8?B?YUdqamJlQm5iQ2FPeXdlQjJNSUJQQzR0QVNaRTExSUZtT09oMlEvV2lvSVEv?=
 =?utf-8?B?K1RJcnRTV05lcEczYnpmTDVWcEVmdTFtTXNjOUZWTjZQZXBwT3VrSTBhekJh?=
 =?utf-8?B?NUpQd3ZncGdEVmV6bVU1S2ZZWmlXYlRYeHMyZHZyUW5VVlZpVVQvbWtpcjVt?=
 =?utf-8?B?NnR4RG1KQ0trUUI2cHUwaXBPL001Y1BWMmN4YUtLNVl4ek1lYVF5UkZCYzN0?=
 =?utf-8?B?SEdnUnpsVkF5aVRNWVdHQXZzemZUTEUveERnR1JiSHR6eUN5V0tNcU5MME1E?=
 =?utf-8?B?ZTIvRVRPN21ieVphcldVUnQ2N20ra3pHZjJkeGR6dDk0OUI1OXFFbXBKYmhv?=
 =?utf-8?B?SzU1TjB1cmlzMzRUNXVnNU1hdy96VzU3WGlxc0F4ZXFKVFljSWVSSzNSTFR5?=
 =?utf-8?B?Mjh5dkJiTXd3N0RkQ29wc2hlMm0yZFFKemQ3MjREYk5mVmZscjZGRjNyUEo3?=
 =?utf-8?B?ZG51d2M4Ui93dlBEM1hCKzFQeW1FR21tN0w0eUVKZGtJdDhWeXA3Yjlzdmx4?=
 =?utf-8?B?Q0dCTEZMNWpMd0EzU1ZmN255WSt5UFhZRFoyZytVcFZJQjBvSC8wblRVYm9s?=
 =?utf-8?B?RlkxMHpJZGc4Z21pU2dOTlhvdnJuWC8yTHh5UU9uT21xMkRFbXNPdjdiNG5p?=
 =?utf-8?B?ZlNOTFQzaHJONzVEODdrTW1NSEw2bWgrdUZkeUZhUlhyRDcxdWhkb1BqTm4z?=
 =?utf-8?B?QjBlSFBGODMyNEFZME9kSnpHa2FQeTE2L0ZCZlhaMjI5QUlqUkRadEFFOFY4?=
 =?utf-8?B?OG1MSzRGeEJvT3NJREhsb1MwQndTdzEwM1Z2MlNKNkkyd2hvL3JrUmY5MW5E?=
 =?utf-8?B?NGcxYjhXb2lpY3BhRW4zTTZsWEQreURhSjBERWd0WTkvWncrRDFmdytMRnRN?=
 =?utf-8?B?c0ZxWnc0MG54ME0rdHFqL2xIaUVsemZ1L1piNFRQd3F5UnJmeDhqdWxDTFVU?=
 =?utf-8?B?SjRtZ284UkhHS0ZNZk5zc0U5cGRKb2JqWG4zQ0hHbWhNS0ozMk5rb2M0UUJW?=
 =?utf-8?B?VXRoYW1sWnVlaTRlTU5pNmo1bGhyYmZsSkxuMFRVU3lkR1J2RGtyTlB1Zy9X?=
 =?utf-8?B?TUtUeWM1K3ZqaWJrSTlGeHRzSXFpUnJXdVpLM0E5ZlpUa3FrSEtPWkJQWjV2?=
 =?utf-8?B?b3A4d0VKbmN6aXJndHQ3YjczRUExUUtHblNETjRFZGFuRUFBN2IvZWF2UTVt?=
 =?utf-8?B?YThrMFV1eFZqb3ZTK2VXNG1VZnUwUWUybmtMS283SldwOVl1V0NBK1FkYzZt?=
 =?utf-8?B?eFdzVlZzMTZjWGZ6WUx0WWYxSmFvQ05LYnFVM29HZEtZeS8rRDBlN0ZmRFJM?=
 =?utf-8?B?OEErckp5Ni9aakdpTlkwblB0N1JRSzlLWTRPd0hDY083UzlBelZjbS93OVV0?=
 =?utf-8?Q?9ebD+V1zVLQS08Wd8khRYQfDDvWycpUh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QktEc2JNajY1bm4zSUdTVmNzeGMwQU9KM2RYN1BRUjcrSm5wVzFwWlFvYnVa?=
 =?utf-8?B?bVduNEJtTjVRV1J1N29Md2daOWdGMkUvTU9XUHJSa1l4ZW5SV3d2OWxyZUlR?=
 =?utf-8?B?bkRiSlduMXI2TldiNkl0NUhMWTRsSFcvc0hJbDFxd3JudHhFcGt4MitsQ2Jl?=
 =?utf-8?B?cmc5MEloYzNEOFRheGg4c2FLdXZJRURVV01TUzl0RDYvdjZNS2F5NXZVMzFm?=
 =?utf-8?B?TTUvZFFyL0VJOUQ3YUxuMUxMSWQ3aTE1b0E5L0hWUWpjNFZBem1GaVBHVTJK?=
 =?utf-8?B?UlM5Qjhjc21hYkZDdDNleWVQa1RCbnVFSW5TM0xYOHAvaWdocXZsUGxxM2NG?=
 =?utf-8?B?WWVWRHh4ems5cjkrSjdjV2JBOXdwTjhlS29BUXFYU1VVN1NiMnU1V0tsdmVH?=
 =?utf-8?B?cHM5MVZFaTdWRElSS0NTeVJRQ00zUTVpVEZUQzB0WGROYUgwdDZtd055ajQ2?=
 =?utf-8?B?dlN5dnR5S3pJYTlYTlFVU2JySCtCZHZaTmllMDBBbnhlQlVKdUR4NmROdWQ0?=
 =?utf-8?B?S1dBRmlxOHhHclFJWWMrZnRmVHBTSllFdUFBaWdHT1g0WGM1bEJWcUZWUTN3?=
 =?utf-8?B?a0t5V2szTy96TjZOU0FxYnRuc0lyUVBScTVOSURzTmVMYXRaRllwNCtvVnJv?=
 =?utf-8?B?K0kxeFJaM0NUand2UFRrZGRvU0VYRTJjQ21xMWhJaG1pY0xHajJ3cElyTlIz?=
 =?utf-8?B?VXpqTk42MGhhbytmNklUODRhaTMzeXhIb29qb0I3ckZqWXhOZE5lUkZjbE1E?=
 =?utf-8?B?ZEc5WXI3YWd6S01EWDJadTlqQXpMOHVXd3lOVk4vYXBsLzlwc3UwWTVsT1hh?=
 =?utf-8?B?MHRSbjJUaWYyeGhkV2lWaVM3Z0lzaG9LWmNwem42YzFPWnllaHZtcDlrZVRx?=
 =?utf-8?B?WVJaM3lsa0JuRFlYWW1hdXdvSm1GYld0cEJjSW5EQTh2cE5KMnQ5dUtoZkY4?=
 =?utf-8?B?YTRsZWw2NnRVVkJYTVBscnlwYjFabHJEM1JRVk5kUXQ5UFFCT1lQVUZUUFBT?=
 =?utf-8?B?dEVvUGNMVkc1SVo1NURYWnkvNStRTWFiZGlKaEVtblRabXE1N2JHNDBvNEl6?=
 =?utf-8?B?SU9DWWJRZW8zWUdJUkkwTjVMSEYwNFFBREgyUVNNYkF4UVdqeVZQSlpBcnc4?=
 =?utf-8?B?YXJRV3k5TjVwQlZrT2FCWDd4UUxtNXMyZ0ZlalA4T0hFM005Qml3Z0Nvb2lS?=
 =?utf-8?B?MFFzZG0wM0ZybkIzQnR5RmxvQ1ByQnRWcTRnN3prZ3k4U0dkSDVOWXZ0NS9p?=
 =?utf-8?B?YkVDYmZGc3pkbG1FM0J5Y3ZaaG1rQW9TN3F1bkVkY1pJZ0p0NGlYNlh2WUFi?=
 =?utf-8?B?R1gxbmFkLzFLVDlEbmd4OGNkeVZRMHZtcE8zaDRpcE9OYldLUjk3VjVNZVB6?=
 =?utf-8?B?ZmFIekEzbm51TEFWTkZrN3QyZzFYYzY2M3k1dGlJZHUyam4xMGU2RUEzM1Vl?=
 =?utf-8?B?ejZRZUdEM1ovTUJGaWdNQzV3RlArR3M5NnlYUnkzRi8vK0ZkSDBVeWJydzZt?=
 =?utf-8?B?d3FkQXpvK1VBd01tTVA2TWJIZXFzbkIrWkcvaEJWODJnWmVoZ1NoaTlkVlZ6?=
 =?utf-8?B?UE5tRk5jQys1b0krUmFyc2ZEK2hMUEdqejloaHdBQ3UvYnVHVHEwNG1ucURP?=
 =?utf-8?B?akg0Mm9sY3E3eWJ2dW5hMHgvVDBzUGoxRU9Sc1ZXcmUzdFB6Zkp4cFRoV3V2?=
 =?utf-8?B?ZllwWmVyRmVJZThhYkxha1Nna09RMCs1enlTc0owQzQ3ekFWNTFCMjhObDVw?=
 =?utf-8?B?dHh5Q2RPZnhsK0VndzZRd0cyVHdISjhDVVdKbXhDMGRJZjRaZFVMb2NqNlJK?=
 =?utf-8?B?bTNVNFNWbEhhY294VVJPcm1BMEVzdjRqbm5WUG1ibVVqY2pacUNNRkxTdHgv?=
 =?utf-8?B?TmJhRFBDMC9YKzM2VFNCTlRwSHBzWkpuYmJPMGh3b2xESVNSbmx3ZVRvN0h3?=
 =?utf-8?B?U3JsT1dSdW5HVUlkRnNib3BuTmJ0MTRuaWV0NDZuNk84V1N5eTM3YlN1YXlN?=
 =?utf-8?B?aktOVzFrQUR6dWdHK3BaaEs2VEJtRTJlQVR0RG1yek1VOWJHMTNMaGF3ckdJ?=
 =?utf-8?B?VkZKcTRaNDcwWGVadG9JdmV4bmxNYlNnZTNBR1JtOWZoaTZaRGgwVXRKeU80?=
 =?utf-8?Q?9sppqIa8ymBCnT6hBPXLlWmGQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41266d8-94fc-4da2-8090-08de101f3ebb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 21:25:51.6806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zeMoIiH00aDoMpwSY/TPo5sXZNL6B5V3K4Dg7hyGASO4CGJBsRFvR308K7nUrEKm04iluJYl2syn8RdxL6ymfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9637
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

On 10/20/25 11:55 AM, Joel Fernandes wrote:
> To support the usecase where we read a register and write to another
> with identical bit layout, add support to convert bitfield to underlying type.
> 
> Another way to do this, is to read individual fields, on the caller
> side, and write to the destination fields, but that is both cumbersome
> and error-prone as new bits added in hardware may be missed.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/bitfield.rs | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard

> 
> diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
> index 0994505393dd..2266abc3f7ab 100644
> --- a/drivers/gpu/nova-core/bitfield.rs
> +++ b/drivers/gpu/nova-core/bitfield.rs
> @@ -72,6 +72,7 @@
>  /// - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
>  ///   Note that the compiler will error out if the size of the setter's arg exceeds the
>  ///   struct's storage size.
> +/// - Conversion from the underlying storage type (e.g., `From<u32>`).
>  /// - Debug and Default implementations.
>  ///
>  /// Note: Field accessors and setters inherit the same visibility as the struct itself.
> @@ -117,6 +118,12 @@ fn from(val: $name) -> $storage {
>              }
>          }
>  
> +        impl ::core::convert::From<$storage> for $name {
> +            fn from(val: $storage) -> $name {
> +                $name(val)
> +            }
> +        }
> +
>          bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
>      };
>  

