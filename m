Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCRyDGxtfGkqMgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF90B875B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAC310E95D;
	Fri, 30 Jan 2026 08:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lhjtGQci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012032.outbound.protection.outlook.com
 [40.107.200.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BB010E95F;
 Fri, 30 Jan 2026 08:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjTgju9BYp7PuVNl3LaQm6OLEn7oZeJp1FF34OB+NtCWm8mdA7+iqyt3YO94ll7WCXKMxTSnsNwrP0K5KgSQgg05P+p+yXy8y4bW0cED03vxduC58Nmlche3uTeO9tEDEZ7X9JUYyHglDp2ZDJlnksq4zhEamqz1FqVRuTUHWdew7ATvwJd86IjoF9epoOqzs2OycQQVKTPyOCS9VO8xluxYK1FTjzwwZMz1so3cKnLvhW7FTafRHWsYfGSxKpHkkdPXZqCgemWa5/nVxm+LP3Xpg9iIZ5uJ933QbIcDEEz8oqtlwriFp46MLF3YOQgCcdkJNayUWbZVHTIzmbnfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJd4VbjvDvJ2z2+3N1UXraBd7OGjX2o33ATkIU4iR7Y=;
 b=PZiz2GNqu3RhdGUc5A6Zn0qvYLBmBUDIDW4b5kmCungKxaq4qdoN2bda6klBnuMDvySIXRPCT21PplLME+Tq4rMcr4us6pq+4JUBX5KpVfp6QGw7aOjoffsjm7Lhplg0LnOICyL2d01IubtdkFCrcBcOTtAl/4wpl28dbu2m57WpF7pYkDxMMef41dg3bnzE6fRB7V4DqECB3pxcgqb0J4cexJgPi+iZfFlUeoU1PhZSLgw6eoobHuRNe106kMahDGhIs9ZdiZ36wR5iZHqOP9MYaohCclY2/oxCiKx2hSuKQgYOG0W8k4YP9pYgu9LaR6a/YCi0mYAreN7bogWhvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJd4VbjvDvJ2z2+3N1UXraBd7OGjX2o33ATkIU4iR7Y=;
 b=lhjtGQciYamJO6BpZH991bJluoPI2z/flFNfXR08soUMPAIi0CNxnxkpfAsPvOeZqspfS6l3z7vYNWaNTqWjTqSiYgXvqVwKivZyYWlX+/ZYZrpcyiiAanQpkQRwMgSzcJnnPTfSZj/lQqhMJOWni2zyskHqm7A0akqeB1qKSdCX2luTxDObbEBURFvr6DPv5tb/VpFZJkJRa3i2I1bz9MOAfni+eXyl021E5cdDLDKE9wYUE/KkQE2FS9jQKLGaS9LujL1F5NTnlusvpo5kpqiaP60r9+iMiOK8vGLUG/7WL8obhMYyW7h0Ev5Va1IWTLwhcWewEOJjCyfRVnEFXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB9400.namprd12.prod.outlook.com (2603:10b6:8:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:35:44 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 08:35:44 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 30 Jan 2026 17:34:08 +0900
Subject: [PATCH 5/9] rust: dma: rename try_item_from_index to try_ptr_at
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-coherent-array-v1-5-bcd672dacc70@nvidia.com>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0218.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::17) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: fe432342-a71e-402f-e720-08de5fda8ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmFTZWFzOUxaYjFUMEM5M3NTN3dudktyNWcvMnFxVkpleC80OEZsMGRxT21M?=
 =?utf-8?B?SEhYMGlOdlV0WUIrcDQ3VGZ5dC85V3ZYTk9hdVNIUnpxdDFUcTJUb29EcTZw?=
 =?utf-8?B?N1hNeVQraDVBN3R0R0t2c0NyMTl3MEkvb2ZmR2RZcFkzMzRVek14ajQya0Va?=
 =?utf-8?B?b2I1cTV6bm8xN0c1ZjZCeTVkK1NadkthMWcwTlBISkhHc3Mvc0VkblV1bFR3?=
 =?utf-8?B?S1R0UXYxTW9aQnZzVE14VGpzU3hIbS8xY1IzL1VrUmtkdStKN0gweDBsZ3g4?=
 =?utf-8?B?RHM1WjlCSkNZQ1NSRUN0TXpneU92UDg5eGg5RGNCeWszK3MwZ0dNWUc0SnZT?=
 =?utf-8?B?SGw4Wm9mdVk2eUdvaVBRQlNJbVZ4WUlSNGpoSithcXJSMk5jdS8xY0FPYjJ2?=
 =?utf-8?B?T2oxd2d0d21ZakFKZWJMRWNEYVQ0NnBvbUFJamttWjhFby9UajdUYno1Wmpj?=
 =?utf-8?B?aWpKT3NGNDVLZ3J1WGdSUXVwRUMxaTFoV203cFJyR3FqRVYzeEtuSjE5eldV?=
 =?utf-8?B?dVNrZDN5Y1FBblNCbGw2cUdUZlBCbi95YXJ0NkNUenRmNmd3YURIaERDN0x0?=
 =?utf-8?B?Q3lZY3IwT3Vrdmk2S0EwVENSZmFFeDZYRnZPUGFUNzlVVXM5VVNBZUdPYlVo?=
 =?utf-8?B?TjVWTVhjYnpyZlF4TjJRU3AwQWhYRGt2eGl3WmFCRCtjT3dFN3pLaWRaS2tK?=
 =?utf-8?B?SFE2VUdWaXFUaXluOEhKckZLLzlORnFtdmc3M0NXQ3NYR3U5RzZYaGNIVUlv?=
 =?utf-8?B?Vk5PcWFYY2hOMldvb0lHaS9yOFcrQXRuZWFPN09qZ0JCNXVNcjQ4K0pyQjRK?=
 =?utf-8?B?Q3RDRmMyL2NsTnVYcHpSUW5FTHBRdXoxajc4U3F3dmpwTXdOVnkxdEYxSTdt?=
 =?utf-8?B?bHY4ZUxxWmM4bjJIdDdBTUtkakdGbk5oVUJWUlJVZ1NnUmxRQkNDeFBlb1FS?=
 =?utf-8?B?S1dmV28yTFZTQXFDeDRCTmVzZkxCQWM5dFlFa0tRYkljVzFFbzYwR2NqOUJ4?=
 =?utf-8?B?Ty9Ta2VjRWZHVGlhQVZ2NDYwTkhXaWI5RGxNVjZxaFdrUTFZVy91ekovTmtD?=
 =?utf-8?B?UHBJdDFZVis0YTh3dGxTU0dGbmR6QmNXQ29PMC9UdmJrc3llOFJaeDZncmNu?=
 =?utf-8?B?cU5iMmVjRXJReVM5ZjlkYkgzQnBSRldIWFpvV0toSlN6L2FHTFNMaEZ5SjJX?=
 =?utf-8?B?amduYUI1a1RwR3B2aXQyWlRXc0tvdVlNK0VXUFBIQU4xWllZRnhsZGFzWjdo?=
 =?utf-8?B?UjdEb0dZL2FDSFRhSE8rcGJyRmUyOWZ2cXVsR21VN3ZyL0hYOEFHMDQ2TktW?=
 =?utf-8?B?NlBVOHdISFpaanlaOUhBalBPZEJzQ1VIM3BPMlk2TUFDR0VDS09nRUhZZWxy?=
 =?utf-8?B?dkUxbUVCVmNCWDZVaWdLVXVTNDk5eVVISjFoajhtc3A1L2p2QkFHYlV5Q3RC?=
 =?utf-8?B?OVRsTzd2SGFFblVaMDF2YXQ0dFEySGtKa0lHWm94bjhkSTRHcnF1bzNxUjdx?=
 =?utf-8?B?Q0o2QVo4TGlaY05UcmhkMmozallUZjVUSU1pb1B5eUZWRHNYa0lKRTd1dzJ3?=
 =?utf-8?B?emhjQm96N0NXcU1QZFRjNXIyTXR2R2ZnSWtUR2xQbDZ3L3Y0NU9jU2pTdUlX?=
 =?utf-8?B?K3J2THdyUDdxZGRFSjRFMWJpeWVKWG1SbE82UEk2NnRIUVo5SDROYVh5TjYz?=
 =?utf-8?B?bFUvMEE4QlN0d253c0poOVpCR3RNaENMSzBsVnZEa21vSWt5bjA3bzlZWEE0?=
 =?utf-8?B?RnZIbmYzd25MTkllaFp4WmYzaXhyM0NrbzQyUkl0SGRydEtlVmxCWDRNbGlr?=
 =?utf-8?B?RU9UVU9vb2l4VVFjMGg4ZysxdnVVa011cjVvTVVzaUtCUzJRTUFMamdEd2tF?=
 =?utf-8?B?QzNBUWRWVkJRQmY1VVBIbVZ6ZUQxK0NUb3BiaGVGbFZVbHVocVNOYzYrdXlU?=
 =?utf-8?B?MzNWV0RwaFVJc1ZXWVRpNlNOVkNuWk5CQ1B6bHFLUDhzR1l0blNHUmZML2xM?=
 =?utf-8?B?YU1ZWStIWm5keGRPTkx6QVJGb2I4VUNzN1FEMXNJdUNCY0RTN1dhck4wTzZ3?=
 =?utf-8?B?eWY4dVNESkJLSEovQjRYRnlHUE9MNFNtYmtBN2liRk9kelFyblU0TnlLdFN4?=
 =?utf-8?B?RWd1TkdqY3pFQXg2WnlYbXZ1NW1jbFE1NnNHK1o0UUtrZ205N2V5cFF3N3dr?=
 =?utf-8?B?K1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlBLRTY3TWtqVk00Ky9taXl5cUZHcllZclRhNFk2ZjRoemFQL0NMTkVlTUV4?=
 =?utf-8?B?dnA2bXNtWkJnbHpJU2VXdG9rZDVuN0RmejJIcUh0WmtpZnBQZU95WXVrczdF?=
 =?utf-8?B?N3l6QTA1ZXFwckFhVGo0bW9EMnZxZjhYU2JBT1Y3VWdKaTNocjJTaEw1Tk1C?=
 =?utf-8?B?V2FnZjc2dXJDUjU5Njhhcm9BVGdOSUZpWmV3clk1YzM2L0NZam4wNllqUGpy?=
 =?utf-8?B?SU16cXNzK3hVK3JlVmo1VFpJM2ZubUJPcnVXdUxqbWVWaFRweC9CZHFFbzBu?=
 =?utf-8?B?NitGOFdnSEdaL04raE5WOVQ1bUcrTlkramVWNFlMYVRadWQ3MThmcjZLdnpE?=
 =?utf-8?B?VGJaUVR3WWcxbStOSXliQ2NxRUEzamxnOUtvT3ZVQjc4RC8zbUFaRG1qeVU4?=
 =?utf-8?B?MVB4TnFYdENFSkIwRCtkVEJHdVlwRTlRK0dUbEtkZjRJVHdINXR5Sjg2MU90?=
 =?utf-8?B?cWhOdHgzUHllTE9CUUo5RFArRHdmNWpZMi84K0V0UWJVR2pCWU52SVVIS2tX?=
 =?utf-8?B?MlU4cGpVQkNQaE1tRkg3SHVrSUd2a3FLMjZCVlIxcWd0NWZIbjlVK3ZlM3Zp?=
 =?utf-8?B?MG8zblh5RlpocnlNRytxVUE5UlIzbDhZaElCOTdyOHlWVmYyUWVFekVhd2Ez?=
 =?utf-8?B?OTVMeUZSUkhWSXFkSnB0akdTM1BwWkx4a1lJdEFRVHVqTnhaVW5Xcm5IVmdE?=
 =?utf-8?B?OXZCK3I4aVpJdXhHZkx2RXhyNTZKbmg0NU5JV0NhRnZUUHB2MEsrRW1YNUh2?=
 =?utf-8?B?dE1oWHVETEhIZjluenllWmMybWJRbDI5TE0wQ284TE1UNlVaUzJ2V0NTdTdp?=
 =?utf-8?B?c0FoditmTUQ4dWJ6ck9mOXIxRjRFREJHL2tWeUtOWTRtYzA4WXNPMlBjUzdN?=
 =?utf-8?B?cFNhUzlwenYzbUdHWFRGUkdCd1ZtK2RsTThJNXRXeU9JajB6cGNtYllYU0Zy?=
 =?utf-8?B?bUNtZ1h0NzJkRWtHRWcvQWliNFViSy9qa2VMM2FZemtCQ2lGOWRsNXBnd2JE?=
 =?utf-8?B?UkwrbmM5M0V1aENrdkc0dENVMERpTDFJM2FUZmxDMDBtSXBRZVlZaDFCSUZJ?=
 =?utf-8?B?MXpNQUd6YmluMUQyZFFrMzJkNk15UHc3SzhVMURIM0Nvcnc4emsvbjNVVXNx?=
 =?utf-8?B?TDNwVzVNaVN2ZndHSXJJYldGRk94anpiK2lYN3ovMTloZFJMWFdkUHVyS0VF?=
 =?utf-8?B?ZGozbXRuNmJYQllwbllVMVE2bWJtOCtrcnd0Uk50NHJVY0hWakYyTTVBRFdE?=
 =?utf-8?B?MU5JRmVveUU5YU5CU1RmNVROMnlFMk1sWVZIenkwRWpBTytkUUNxVGFyMTB4?=
 =?utf-8?B?MU5pNlR1d2JSK3VTNFpWYWUvbW5DMjg0b04wNm9jU2UwV2l3YXlwcUEremZa?=
 =?utf-8?B?ZmZvNFRIMjIzNURrcDVPTWJQZ3ljcElpNnZ3UjBlU08rYWNVY2NXOGhKMnlY?=
 =?utf-8?B?TUV6OHA5dGV6RUxnc3BVUU9ua0xwSG41L3g1NXMyK00rTFh4dHFXbytVV2ph?=
 =?utf-8?B?RXJSMnVPd0RNUm5NYXNoUktUakw3K0tXWlZSY1ZxS2JJUlNtUEt6SnF6ZWFi?=
 =?utf-8?B?QWJWTjFZVk5nYjZJU1QyZC91U2o3Nk1pWDJnZEpDc21MdVhCRVhPakI4bHhT?=
 =?utf-8?B?ZzQzMTc0UkZUUlIvMnpaRWlJcVpFeDQxYUdFSENoclRFUlZVeDRybEVaWitB?=
 =?utf-8?B?YlV5YXhIMTJqNEJPTjNrMWhQd3A1YmhUdHlWRUV3SldKNVBOZ0FRNnF0MVdl?=
 =?utf-8?B?L3VEMmpUNlNOSUd4R3hsd1BpdGxFMi81MVFmS0RSejBkL2FxTE8rVmR4TUZB?=
 =?utf-8?B?emQ2Nm5ncDhUVUYxYU9mYnFlaGV4TlphN3RHQzkyNHkvV1RKR0VzcDlyQXBP?=
 =?utf-8?B?dDJNc2pPUmd3OEFHdEM2NlZzRlZ5dnBQbnZEWEk1VDJUcUJuK2pSN0dMS1lp?=
 =?utf-8?B?a0FRbDFWTTNleEtSWGM3MkpVTlhZM3FFL3dqa011enpiQ0xIa2Q2OGJQc3RH?=
 =?utf-8?B?d2VpQzdRZU9UWTRFUjk3MzAwenFJRG5wTGFLeTlaN2pVSGZ6UVM0b3d5cDJ0?=
 =?utf-8?B?RDVvWkUraS9LajB1ZWEyMlE1U0V5REpTb1ZBWGhDcnNqazVvMTJNaDhnSGox?=
 =?utf-8?B?TkRTNzMwTHp1OEVVWHgvOHByUjRtRE9WSy93WTRFTzNZTEJZUmdLS3MzSU45?=
 =?utf-8?B?UHlGVnhndWhuZnhIa1R5ODV0T2FwdlgvU1RRdXZmMERwQ29jYUlha0wzU1NC?=
 =?utf-8?B?Yjh3QXJwTzRGWElDa1NFQms3ODhDT0pReWVsS0RwWU43SWc4VjVHVjhwaG94?=
 =?utf-8?B?ZW02OHdJc2YvL1lPVWRuM1RSZzZiR2ZjSitEdG1sZEF2MkJIRU14b3c5ZEhF?=
 =?utf-8?Q?Ns3PvNhGT5cRLYeQ7I4k+dSx16Qb5Ou2Ndi5L00Fvzt7x?=
X-MS-Exchange-AntiSpam-MessageData-1: UxkkLOTUVtBSNA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe432342-a71e-402f-e720-08de5fda8ef0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:35:43.9801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bI+tirzKltW6OSBqrMDdIvwjoA4sb2Ki/yNqgur5Eh9gUmU0BMDH9EPtFIff0DoCDvS8DSqeLj5ABEfIfEgiFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9400
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,collabora.com,arm.com,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 8BF90B875B
X-Rspamd-Action: no action

This function returns a pointer, so rename it to be clearer about what
it is getting.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/dma.rs | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 03fc001eb983..e4bca7a18ac1 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -559,7 +559,7 @@ pub unsafe fn try_write(&mut self, src: &[T], offset: usize) -> Result {
     /// Public but hidden since it should only be used from [`try_dma_read`] and [`try_dma_write`]
     /// macros.
     #[doc(hidden)]
-    pub fn try_item_from_index(&self, offset: usize) -> Result<*mut T> {
+    pub fn try_ptr_at(&self, offset: usize) -> Result<*mut T> {
         if offset >= self.count {
             return Err(EINVAL);
         }
@@ -863,12 +863,12 @@ unsafe impl<T: AsBytes + FromBytes + Send, Size: AllocationSize> Send
 macro_rules! try_dma_read {
     ($dma:expr, $idx:expr, $($field:tt)*) => {{
         (|| -> ::core::result::Result<_, $crate::error::Error> {
-            let item = $crate::dma::CoherentAllocation::try_item_from_index(&$dma, $idx)?;
-            // SAFETY: `try_item_from_index` ensures that `item` is always a valid pointer
-            // and can be dereferenced. The compiler also further validates the expression
-            // on whether `field` is a member of `item` when expanded by the macro.
+            let ptr = $crate::dma::CoherentAllocation::try_ptr_at(&$dma, $idx)?;
+            // SAFETY: `try_ptr_at` ensures that `ptr` is always a valid pointer and can be
+            // dereferenced. The compiler also further validates the expression on whether `field`
+            // is a member of `ptr` when expanded by the macro.
             unsafe {
-                let ptr_field = ::core::ptr::addr_of!((*item) $($field)*);
+                let ptr_field = ::core::ptr::addr_of!((*ptr) $($field)*);
                 ::core::result::Result::Ok(
                     $crate::dma::CoherentAllocation::field_read(&$dma, ptr_field)
                 )
@@ -904,20 +904,20 @@ macro_rules! try_dma_read {
 macro_rules! try_dma_write {
     ($dma:expr, $idx:expr, = $val:expr) => {
         (|| -> ::core::result::Result<_, $crate::error::Error> {
-            let item = $crate::dma::CoherentAllocation::try_item_from_index(&$dma, $idx)?;
-            // SAFETY: `try_item_from_index` ensures that `item` is always a valid item.
-            unsafe { $crate::dma::CoherentAllocation::field_write(&$dma, item, $val) }
+            let ptr = $crate::dma::CoherentAllocation::try_ptr_at(&$dma, $idx)?;
+            // SAFETY: `try_ptr_at` ensures that `ptr` is always a valid ptr.
+            unsafe { $crate::dma::CoherentAllocation::field_write(&$dma, ptr, $val) }
             ::core::result::Result::Ok(())
         })()
     };
     ($dma:expr, $idx:expr, $(.$field:ident)* = $val:expr) => {
         (|| -> ::core::result::Result<_, $crate::error::Error> {
-            let item = $crate::dma::CoherentAllocation::try_item_from_index(&$dma, $idx)?;
-            // SAFETY: `try_item_from_index` ensures that `item` is always a valid pointer
-            // and can be dereferenced. The compiler also further validates the expression
-            // on whether `field` is a member of `item` when expanded by the macro.
+            let ptr = $crate::dma::CoherentAllocation::try_ptr_at(&$dma, $idx)?;
+            // SAFETY: `try_ptr_at` ensures that `ptr` is always a valid pointer and can be
+            // dereferenced. The compiler also further validates the expression on whether `field`
+            // is a member of `ptr` when expanded by the macro.
             unsafe {
-                let ptr_field = ::core::ptr::addr_of_mut!((*item) $(.$field)*);
+                let ptr_field = ::core::ptr::addr_of_mut!((*ptr) $(.$field)*);
                 $crate::dma::CoherentAllocation::field_write(&$dma, ptr_field, $val)
             }
             ::core::result::Result::Ok(())

-- 
2.52.0

