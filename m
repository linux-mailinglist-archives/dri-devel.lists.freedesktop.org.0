Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB779B54537
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 10:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D9910E447;
	Fri, 12 Sep 2025 08:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="d7pT50r8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2071.outbound.protection.outlook.com [40.107.96.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A752510E447
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:25:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdVZEG7ypxAc82KDHnWbKbkr/IMbj2B1HCAhMB/9bBIaxdiPSyjed8WN4vkW3OXSEyLljHCISbaU6ucGEkHWGgar+YDJoyNo4mldLTnODRQMDRmFlhaJRYsK8oVqxVHWxzGxLuBE0+FoRe+OzsCaxsZ2qKf7LfKKWVDuORH+CT9czgF7J3XRK+oiGBBzZGwpyzdaORFYXbd/eaaLk2CbwNymzO1d/T5gydXzdL7tPYnwfuEH4I9c9hU209E76CgS9eTV8z35cvkCkPcreruXvROPbjDJvAgCrKu9gkWN78YC6pelmffLsxpSRu7ZNuCG4wwto73g/kn1cZIhCXzcCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3s/pD2eU7qe7rgmdwwQEoFyNudkuPMCYuzln+NftpI=;
 b=wblXBdD69wec+2OvOn7c+eCAZp3uZ6rVnbJLGZjn/Zrxqvhk4W8GjaQe0LMUl2hHONx2EOpyv4pM7bgkWJwxg/+Cq3Fz9+duR8T5WNHCpeyqFrAlcRl4OA1LweMD9U/77G3c1N9Pn/D7G2So2RH95QgSnhrXfJm7C5bmvdrNKzLv//OesJl2uhisrtkJNEQ0n0Ya4klurJeYWnZd08apgGLNAYG8JJBE2mliNg53jQy877et/i3GfVTPhd2gFOW2Q2qduVjs0FNivGmBs6tDQBQJwZDOqXol68MW29SDQV4MFleuOvbA3kxri7K8PqAyJmmWPj2bKG8wyC8HFSvsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3s/pD2eU7qe7rgmdwwQEoFyNudkuPMCYuzln+NftpI=;
 b=d7pT50r8R3DRlvwS14AEHgyjUfFYUVlWu9NpPNol5YUzHdczyvhLJ6LLn/DEf6JrMZ7sQgFhyiVGxhkDJAahVrEOPMzn1e+2UaIAfeBAaKpUhtdCBALcA4OKje2czmaQTzTGio4EPhx5X9qxzfHTPJFD6InKApteLEi7LEY95Xw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8752.namprd12.prod.outlook.com (2603:10b6:930:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 08:25:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 08:25:30 +0000
Message-ID: <14af50d2-f759-4d89-ab9e-0afc7f9cb280@amd.com>
Date: Fri, 12 Sep 2025 10:25:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rust: Add dma_buf stub bindings
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20250911230147.650077-1-lyude@redhat.com>
 <20250911230147.650077-4-lyude@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250911230147.650077-4-lyude@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:208:23d::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4cb498-1d9f-4220-03eb-08ddf1d5ef2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alpoTHl5UUE3eFhQSDY1bVRlazR2MEhEVXZ3Y0cyVWEycVoxTWpPdVVnRlQv?=
 =?utf-8?B?Y2Z5Z3hsaGR0SUJXdEdtZUpOTlNzemJTYUpUWXFTbURSMWJ0ZC8wMFRYVCs5?=
 =?utf-8?B?WHpzS016dmdqK1BHelhEMXUrUXZEOGZoZ29nci9ZcUd0Z0FSdTAvOU5zSmUz?=
 =?utf-8?B?TVBMelVXZ3JXdFhCOFpEQ3d0UVFvMVZoc0prYTFZanFSY1pjQ2NKRERRWS94?=
 =?utf-8?B?SjYrZ3VaRzVabDVwem5WYzhQVy9WOUFGVWlJajRobHAyWGptZzdOemR1TXhh?=
 =?utf-8?B?QjJHOTFJMENsUkpJcDNoRnBMR1MzQ1liQlAvSXFHeXZDZHZVQm5TenFLQits?=
 =?utf-8?B?eUZlRlljdmFFQ2pvSTZlbWRIOEtXY3dNMFE3TEVHZW1WaHQvNEZkMEJvMSta?=
 =?utf-8?B?T1ozVENXMldhYmVYK2pIQzhnQk1UbmhMZnlPbTJneDU1dWF0eUZINlhmZ3Ja?=
 =?utf-8?B?V3pDRUFuTDgrTXMwLzhMTXdYSzZRcXZadUs0NnNPUjNGSG9vRkNsSlp0SjlU?=
 =?utf-8?B?b2NuZUFVbWVqS3V3dGNBVkhPVUpQYVJnU2Rad05CT0VjYlVQeDU4QU8xZmZE?=
 =?utf-8?B?WDJKdk5PZ3BMNjM4MHZYZ0lPMEJhVXltOEljZXZJVDU0UGVvbk1CTmRzSllY?=
 =?utf-8?B?NFFFTkxINVhWZ0FPaFpnQnhTckNuOG5RQ3FHTGtmNSthajY1ZytHVndnZVlB?=
 =?utf-8?B?bXFFZDRmTnhQWVRGN0ZDRWhwaEVKVVVMcmpCZUVqci9YenBQRGhuU3RGRHRl?=
 =?utf-8?B?ZWdnWmM4bVhwdHp5VDkxakJZQ2VieG5CbVhFLyt6N1BOR1hWTGo5Z3JYcnJq?=
 =?utf-8?B?dmFIdVpMUHhyTC9GdFpuekdTV2xETTdNak8zbjllTTJjTUdTa0Q2cVJGRWt0?=
 =?utf-8?B?bHR3dHlRYURuWFdFNGVlN2g4bzIxVkhoWFc5Mmo5ZjBSM2EwRVN1dlBPc1V5?=
 =?utf-8?B?NXhmUEZaejZRaTV5VDh4OEsvUVhVQXZhR0xlWlhwRGFYbWdZWk5LUWpRR2JQ?=
 =?utf-8?B?eXhzYVVBcjBOTW8xaDM5b3g0UEZTT2IrQ0p4NjBITEREN0JQRmNuSG9BSDJn?=
 =?utf-8?B?ODhWRHdaMU9tekZrbnc5cUVHRDhDalkyUkRVVWFHSkUycS85dTBTNzRBella?=
 =?utf-8?B?NEsxUEJjNGdlNnlUdGJWTG0xMlVpR0FiTUxDbUxwREhBQkJ3Q1ZZZ3FMcXJl?=
 =?utf-8?B?TytiNERVQnFaMmorUERQOEZYdmNJYThlNkNhQlc4am5USjZNeEN2R3RsNG9N?=
 =?utf-8?B?bGtOTFVmV0JNRkpOQ3NxYkI1NWF2YkdBV0NYV3ZiYmpsYURlNDllN2FUcGdL?=
 =?utf-8?B?M3Z0UEx3cEFkdG1VZmIzOUdzT3JKVVEyRHROVjJDMWtJdllFb3hLbEcwR0pt?=
 =?utf-8?B?MnhMOXZnTmp5R2pCSnpQUCs3eU5KRXR1SXdQWDJtTFNyNlVtWnl5ZWFGR3Fu?=
 =?utf-8?B?STFYbzZjRm4wYXZ4azJFbjhucGJERWhsaENkWDU4ZmkxRWpuVURjQ0dzM2dF?=
 =?utf-8?B?SkdNVmlXWk9QMFpEQlU1czRoSkZ2ZzhnUDlPVGNsTXhVSXdKMVl5d1RZSWpa?=
 =?utf-8?B?NHJXNFEzSGFGcTdqckpqSml1WXk2VlJkREtRdEloamVHWVg3dEZ2Qm9OVmww?=
 =?utf-8?B?cmtnWlVnOHB3amxLSkN5Yzgzc2JGZzZqbG4xWjUwN04xdUFmaEcwQTQwcktv?=
 =?utf-8?B?WWtTZC82d013N3JacDVWWWVJai9pQkZib3VrNTBoYTFzRTF0SHBmbVpzUkt1?=
 =?utf-8?B?YTlhemIxTmFFTXZka1BVUDRid1dzOUFCRWsvdVRQdXhOLzkrT2ZuVjdWdWVp?=
 =?utf-8?B?NmdpaklBSHFwNjk4cms3NjVOODgrL2pYWVB4OU45dnVpT0s5ckh0TTYyaXFa?=
 =?utf-8?B?K1BMR1ZFM3FTTVVQa1Rwdy9HdUJvdEQ2cm51cmsxU21NalE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzNIMXpJdGNlc1M5S2t4NjJMN0JTMHVpTndVbDZ1K0tkS3NlQ0grSGZxVERq?=
 =?utf-8?B?UnlKaERKZEpabzV6WXpyQkdNTnJPUW56YkxqY2hZS1RBVlN6TWkxK3puemxC?=
 =?utf-8?B?TjdXZllMWGlscGoySkk1L084dGxVR2MxcWJITTM2YUlXU250R3FaQVBqTkt5?=
 =?utf-8?B?YmpZNTRGMVBSZ2ttUTdxVnZaQ0RObUxpU2FxeGFZbWhYVEFYbkVpdC9BTE9O?=
 =?utf-8?B?eHc1bGVoUTdwd3ZFWVZ4S29TNDhMTGcwemFEbWp3QkRvcCt3cnQycDUyQ2tF?=
 =?utf-8?B?YTREajNEVVMwbXdmVEYwTFlNYldkOVJ0aWpmNndZb05STmU2cHFRYWJxc0Mv?=
 =?utf-8?B?WmRMNzU5VmJvb05tamgzVGFqWXJyb0VhbDhCSGF6OHdkQ0NNVEhtNGpRVXZr?=
 =?utf-8?B?bnllek9jVXlIKy96Q20zVUtaZElHQVV4SGdOYVFrNXZJTERLN3pnYWJsb0Jk?=
 =?utf-8?B?ZHp6ZlM5QWxwZFZRVk1sb21lREh5SFBjYTVLcC8vSkdGRHptVHM1amQvUThw?=
 =?utf-8?B?ZEJuT0srM2lEY0ljS2k1YXFuRGhKaytJVHBrZ3ZxTTNBekRTeU5WMlhFQi9u?=
 =?utf-8?B?YlF5NjQwWFkvcTNNV1dCUEZWUnQ1NnZIR05mcTRVZ3grNENVdDlxUFR5bElR?=
 =?utf-8?B?eXdDcEFycGhhY29oU1l5bitwUWlxbHc3eXgyQXkvekFBdlJEejVyMTNKR2xx?=
 =?utf-8?B?bUpER0l0OTJCUzJoMnI5dUFkd254REtYSVNldnFpK2t6dTRuM29IR2tzSVFi?=
 =?utf-8?B?R21ncHExdW9jOW1iaVgxcStkWGZFZVhWalROVkxjZnpKN2xWRjRDcTIySUJU?=
 =?utf-8?B?ejhjMWIrTXJsQXkxbzBmZldZRHJaSDNIcllNUG9sbms0a1VXYTFRWEZRRHBi?=
 =?utf-8?B?STZ6ZUJ2MWNkaEN4V1V3cnBtclJGVzVKRTV2dUNCSmJyYU95UVFoeFBiU1J0?=
 =?utf-8?B?R0pmWG5BV2UxSXF5bWlTLzIwWWZJdElVbmE2NU9FdTNrK3M2YjM5djVHTjA2?=
 =?utf-8?B?dkJCUlY1R2dXeU9PeUFpS3NmcGNVSGNmUk1hVGV3eDBpZlBrbjFINkFWYVRq?=
 =?utf-8?B?KzkyQjQwMmEydFRRUHNhWlltTGdKQzdCaURVaDZCTDJkNU11aWgrZ3FEMXoy?=
 =?utf-8?B?VHRWcVRydjhXZEcveDdWQllod1dZYmNmQlp6bFd6dDlYeCtQSTRzbng1cXl4?=
 =?utf-8?B?Njk0UEpYUHZwTG9KS0tta3hZWm5hSVlNK1FYNUUyMXFLdG9FNC8zSjJjeFNE?=
 =?utf-8?B?UWVFYzhkMHgrSGZpay9sczJjVHNWaDk5SUpIejdlMGF1czdqcFJCY3dxTzNx?=
 =?utf-8?B?cWFBRjhUQTRIQ3JvLzNnVmw3YzhZcGl1b3B1Vllob2hVZU80UHNHMjRKMmI1?=
 =?utf-8?B?MGEycGM2V0c5aWRmWVVXblNBS1NmQzZLRktYcksvYk9GbEYveWM0NXlXQTBz?=
 =?utf-8?B?ZXpEK2xaVnJzNVNOMmNRb29wclVoVTZoUUFUektDcGFpWHpuWTdrb05rWVV0?=
 =?utf-8?B?eXhWZmsxdVJiWHBkTnRkaFpHelRuZEh6c2pXcE91ZkhNKytoSldlY29TdzA3?=
 =?utf-8?B?azdmMDR4RnJVZVpkS09kM1pQYVZldjYwRzFmMERCSlk4ZnF1aUtNRWd4djhX?=
 =?utf-8?B?d2s1c0Z4ZXdsUktYTXNjZmgxRWRJRkxYWXFTUk9WVCtPakZoemVUUlY0QTBF?=
 =?utf-8?B?OXgwQXZNN2YvYlJ1QjhoUHZHdHh4d0M4V1pYSStvRllsbUdzWTBIUnMrU1hU?=
 =?utf-8?B?cUJoeEFwRHlobnVEblN5eElzZnVqdFphVy93WDd4K1dKS2FRblcxV0JWSEtS?=
 =?utf-8?B?Z1dzMGdTUlh5a2YzdG94ZmFSVlMySWhwcjNmRjNQVGF0TGNnWjdIY2wxclht?=
 =?utf-8?B?bGpFZytYQ1I1U3VPeHpuVVAwOHAyTVE0dGl4bmtiTXluZU52bU9SaUxBdVFi?=
 =?utf-8?B?b2NCNlNQM0VhR0RJYXMwWFZiZUpIc09OOHFYcHkzWlcrbVdVU0lYTGticWRs?=
 =?utf-8?B?RXQ3emVWRzdyS1M0UkxabHI4eWppc1ZmR3FYY0N0OENUdjViejNraTBKcFFh?=
 =?utf-8?B?SGFKMzVtb3AvbXorUWprSGFhTzdvdSt5bTFESExnOWo3RGJ3MXZJSjlhTkNq?=
 =?utf-8?Q?iW3THzhXBi5a7kyeiIkgFcd72?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4cb498-1d9f-4220-03eb-08ddf1d5ef2d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 08:25:30.1144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSKcTFaybm3L3zQg9rb5uVwKsvTCwCXJSwqevgR3Vic4tiprmaClYx4L52X1bw/B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8752
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

On 12.09.25 00:57, Lyude Paul wrote:
> In order to implement the gem export callback, we need a type to represent
> struct dma_buf. So - this commit introduces a set of stub bindings for
> dma_buf. These bindings provide a ref-counted DmaBuf object, but don't
> currently implement any functionality for using the DmaBuf.

Especially the last sentence is a bit problematic.

Wrapping a DMA-buf object should be pretty easy, the hard part is the operations on the DMA-buf object.

E.g. how are locking and sg_table creation handled?

Regards,
Christian.

> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> 
> ---
> V3:
> * Rename as_ref() to from_raw()
> V4:
> * Add missing period to rustdoc at top of file
> 
>  rust/kernel/dma_buf.rs | 40 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs     |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 rust/kernel/dma_buf.rs
> 
> diff --git a/rust/kernel/dma_buf.rs b/rust/kernel/dma_buf.rs
> new file mode 100644
> index 0000000000000..50be3e4dd4098
> --- /dev/null
> +++ b/rust/kernel/dma_buf.rs
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! DMA buffer API.
> +//!
> +//! C header: [`include/linux/dma-buf.h`](srctree/include/linux/dma-buf.h)
> +
> +use bindings;
> +use kernel::types::*;
> +
> +/// A DMA buffer object.
> +///
> +/// # Invariants
> +///
> +/// The data layout of this type is equivalent to that of `struct dma_buf`.
> +#[repr(transparent)]
> +pub struct DmaBuf(Opaque<bindings::dma_buf>);
> +
> +// SAFETY: `struct dma_buf` is thread-safe
> +unsafe impl Send for DmaBuf {}
> +// SAFETY: `struct dma_buf` is thread-safe
> +unsafe impl Sync for DmaBuf {}
> +
> +#[expect(unused)]
> +impl DmaBuf {
> +    /// Convert from a `*mut bindings::dma_buf` to a [`DmaBuf`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller guarantees that `self_ptr` points to a valid initialized `struct dma_buf` for the
> +    /// duration of the lifetime of `'a`, and promises to not violate rust's data aliasing rules
> +    /// using the reference provided by this function.
> +    pub(crate) unsafe fn from_raw<'a>(self_ptr: *mut bindings::dma_buf) -> &'a Self {
> +        // SAFETY: Our data layout is equivalent to `dma_buf` .
> +        unsafe { &*self_ptr.cast() }
> +    }
> +
> +    pub(crate) fn as_raw(&self) -> *mut bindings::dma_buf {
> +        self.0.get()
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index fcffc3988a903..59242d83efe21 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -81,6 +81,7 @@
>  pub mod device_id;
>  pub mod devres;
>  pub mod dma;
> +pub mod dma_buf;
>  pub mod driver;
>  #[cfg(CONFIG_DRM = "y")]
>  pub mod drm;

