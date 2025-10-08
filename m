Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E86BC640B
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A64710E882;
	Wed,  8 Oct 2025 18:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="itUE0L1j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012071.outbound.protection.outlook.com
 [40.93.195.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A10610E87D;
 Wed,  8 Oct 2025 18:12:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0gjLqstXyh/ODOwNtHsUZQ/S2oznJkT9mQFKGcG5lAeVHWKoZdDfE9H4S6np53r4U4VudPehFRW2cdD9zfzOKjqBM9mKFmymA4nFaUjBmd85FSXVUaUHg/CuD3wuKvUH9kZnEKsKonUDl9hOXeRS+Q2POBPDT9ls7rWGu+F6O1bgbuuCRe++iY4uzhMCx4lpyetuzx0cLCyVYXMensbEev3BVuJDDLlPEp93aXzlei0MZf6F8HZLFF9EJnIFU1Aes4tkeqx4cOCecUMjIInYKm+Wg260LpkJxCDLtybZr0J+tqDZBKoaB+00ZeqZuxcST8bPduCtM1eZZBurMfaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwX231R5TfrpxvFcNI+cz++4mFlJrIv0mOahj3mwTDc=;
 b=Teuvro3Vk4hkgPcyw9ai9y1D4mK3Ek+Btg0/Y2qDFDjeRec/9S1ueFVVN5/ZRUnrxFEhsYABOV7GM1+/C8zKSB0qP8NH9zUml3lTDCaP/td1MHfTD5yH4ius/CauAqTtWEfKs1wwWnVtkBKBmb1Eoacv0JDh5PvR/1gru/tKyLFELTrReAi10eLBKAUh560BRzXqimoG1Mjn5IYGosYunlUw68PfrFI0vuFgNnX+/zPO6kBxL716sExefrWQLxARR9VaysWgx99593J+swiSsOTHxrBBTPwjVeBrlZf/u6fmTAUUr+ysAI8iXL6mVwNmppglAqBeafAD4lBfFuq4XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwX231R5TfrpxvFcNI+cz++4mFlJrIv0mOahj3mwTDc=;
 b=itUE0L1j/6n9z3QRAebPpWr0lGU7sVTQVuhIxkEGdYbb7V7YeyRzuX5+Sj3YsR5kD148h04leTbbGVWMJi+T7O4b0TPNh6A4zIEcrw9tNrtCemMGYKVXFSWlIUzuRyGB/F+ZOUcJWXNqM+rO1F5jEDtLWvemublmYOETjrnxQG4ACWQ3EduDoLgxv2mHObmsp4E2VwEd96HJ7zm0YkQQaLqDezgWZi3EQqoeVwlz5GEuQyvGlaoLFt5vU6DevLhnVjZEiaK/3k10WNOiRZ9yAjd+YFQluWQuIYOfoYmfRY1xqcY/GDEz4DkkexwPu0svBbe95gTRt9akfMS8lvT2DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA0PR12MB8973.namprd12.prod.outlook.com (2603:10b6:208:48e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 18:11:57 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 18:11:57 +0000
Message-ID: <e9f4711a-04fd-48d2-ab13-03ea94eeac5d@nvidia.com>
Date: Wed, 8 Oct 2025 14:11:55 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: pci: Allocate and manage PCI interrupt vectors
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
References: <20251002183912.1096508-1-joelagnelf@nvidia.com>
 <DDAEL8DQFWKX.1BSBDMMN9I5B0@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDAEL8DQFWKX.1BSBDMMN9I5B0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:408:f5::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA0PR12MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7a9b25-aa7c-4e3f-e9b9-08de06962b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TG5uNzM2MHlyMlZRWWR1dDZrZTk5OVpFNks5U01yT3g1OURSY2VTYTh4K1Zr?=
 =?utf-8?B?bXBxTU1UbWg3ZEVhbThhNjdHNjRmOXRRdGxqRDcxWUJ6S0d2cDFPVUpiaGZO?=
 =?utf-8?B?dEtNNGhNT2hydk1QVzJqZFZpZnNBc0M1WDljbXNXSUdYNzkyZFFDTXBFajF5?=
 =?utf-8?B?a0NkSlVrTGdRdWRKOEo0aHJwUTY2cW9ETC9BcnI4MFdONzE5OHgvdkpXNGtu?=
 =?utf-8?B?SU1nemFqZHQrY0g3NTViVlQ3dHFrM0xaaTBSODVYcE0vUkllQnk0c3VzSVdB?=
 =?utf-8?B?ZGZUZ1FYQ1NCZ0FCbGlMWmpYczE0Z1pEOCtoM0hsOTZPQzlyYWl4aVFNMlVX?=
 =?utf-8?B?c1dQV3hWQVV3aGUyaG45VFBJL2hoSkFmVmpGM2c1aHQ5bjMreXhqOENvUnIr?=
 =?utf-8?B?NFg3THB2aG1CWUFJNWxhQkNhNlRhcVRHQ3NDSFZ3bU5OUm5XU1dsZlRuc3I0?=
 =?utf-8?B?M0hmbHZ6Z003RjN4dmJQOUVRRWtVaTZGY0pwWHNQcE8yYjY0ajJLVlcyNlNL?=
 =?utf-8?B?Ky9hVlU4ZEtXc2Rxa09WSEVMNFoydXB1V1F0cU9ZcjQzTHhpR1pQQk5XczlF?=
 =?utf-8?B?RVlIUkxEYlpnVHp0NEZhTGcrSFh4elNiYjhtWTFrbCtFYzF1N2JBY3VkT0d5?=
 =?utf-8?B?MzlJUE53RjRLOXFoQ3hldGZJVUxDcjZWeXBmdDlXZ0hlc1hZc2pHcTYyZVVx?=
 =?utf-8?B?dGhuSlMxSGdLTXhUMGVrYUU5U2dFYUVzQWhtV3pIeU9LV1ArKzhndlJ5dEph?=
 =?utf-8?B?MXdFUmlTOXA1UjFPVE5hZCs3Q0ZVT0lJSENPNklqRmxtVmF6ejkwUHhkMTVp?=
 =?utf-8?B?dzdISFMwL0dDaW5HOGlqWXlxWGxZSVdYNi9maHNHcXp0Qy9vTDdsS21YY2Er?=
 =?utf-8?B?K2s3eDNXTDNJY3E2d2prY09iUCt4NVFUZW9WK3QxSzk5WlFCZzVtUlptVG9Z?=
 =?utf-8?B?YTNidEx5dFBUaEtUYUVtQnBSWlVzME00MHpLR2c1bm9yWHNKVnVYemRYM015?=
 =?utf-8?B?eE9PUnFpOHcvencvVkVlSndXRXdiNVYvMEhXMVUzRytKcTRvbFFSZ2htVjR1?=
 =?utf-8?B?QXVyZUpNdWo5VzllOXlGRWdzMS9YRnFyYVg1TThIcFVXYm9QczJLMCs2b0Jm?=
 =?utf-8?B?OUJGQ1Q0MzVraklBQnZoY1BxbjRQNEFLUFpqanZJQ3VWWjZ3NlZxWG1nTkJG?=
 =?utf-8?B?TGZRczk1MVJJL1EzSFlWbFVzUXIzTTdYeEJBbll6N0cvVjRMS1pTWnpQaFFF?=
 =?utf-8?B?ZThjNXBhU3VwMWpKKzhpUHJzK0c3WjNTTGoycWJadnlaOThpdVdrS1h0ZytJ?=
 =?utf-8?B?d016ZU8wcldNRVEvbnBPVTFuYlh4QzlOWUFXeUtqTDFuU1YxMW9YMGRqYm1U?=
 =?utf-8?B?WmxhVVFFZVR0T1orNG4yWnF5NXFMeGl3TDBNbXZNRlZLUlZpNUZ4MFQxd2Fw?=
 =?utf-8?B?dG93amhib3V2YlFxcWM0TS9KTGpqUVU5SVllYXN2UVRmeHZnc2lBWXhZZHg2?=
 =?utf-8?B?OXRxeTFReVNuanVJRWlicmJSYlg1K2hyb2R4YXdUcVBrTjRkaDFSbExGc0hB?=
 =?utf-8?B?c3N2Um1tbTU5Y0xuU00wY0RSOXU5RzNnRks4OExhdDB3VHVYSC8wWWJRUm1K?=
 =?utf-8?B?ZWVQaWNjOEtyakEyM25pV0VEOCt6TEtrNCt5YmhmS3RkN0lKVHh6TTN1eHJ1?=
 =?utf-8?B?SGt1TmNBM2t4dEZQbUxjK0NsK3RrV0Z3b1p6MWl5aFlkQy9CaERMS1RraE13?=
 =?utf-8?B?eEFXN1YraVlNUUQ2dXBvNEJrK1hiTzRzYkRzb2l4VHA1b3FXejA4Vlp5YUxj?=
 =?utf-8?B?MFh5clFQUzByc1N1ZlUzWmV6bnNhV0w0MTMyL1JTZmJOajdwdjFYRnJ0T09Q?=
 =?utf-8?B?OFRsblFTemJobkRRSTVHWnVrZkc0L0pRSTVQQUNYT0hvMVk1dTdybXpZWnZL?=
 =?utf-8?Q?wyG1jgPs/eCEzRUbofGGrO8x+zFpuJO0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUZ0QXhBaElXNGJlNG56VHNWRlVlM3N5alZwZnp2Wmt4ZVN1cFVOQW14SzBP?=
 =?utf-8?B?WkZzK0ViVzEvMEpyUTcrRzIrUlQrN1ZtMjl1dGZlZ0FHNmxKRzRpblJQL1Zv?=
 =?utf-8?B?eEZVUmJrRFZwcDd0TFY3bThvUmlDNnhZeWJrSnVWRzkrTEgva3h1eWs5REFH?=
 =?utf-8?B?NGdBZm5vZ2poYU5MSWNQVFJoS3EwYlc3OUhKSDZqZ1dqRkM2dDJITmIyVnNR?=
 =?utf-8?B?M3p6MkZ3emdUZGMwZXhyR2FoVzZPbzcxK1R4UUFBZEhmczh1SnlhdDhzWXNV?=
 =?utf-8?B?R0pyYUsrL3d2OWE4WUw5bUg3V0R3bVFuTGVIb2k5RFNQTGJXUURFL1F3ZjFH?=
 =?utf-8?B?VHNFRWVucENQNXhVZGd4SmF2WDZlNUJ4Q3d0dlltWkhQZGhoTnoyMWZ4Tzd6?=
 =?utf-8?B?aERLZUZVMExmazZHUHQ0ME95NVA1MFBqZ3VZSUFWS1RmVUNwcUtOMFBKaVBX?=
 =?utf-8?B?VWlJcjlRSXNtZzdWM2NFT3BlUnp1ajNYUEtwUHB0REFPNXVkTUczZjdpem5X?=
 =?utf-8?B?eCt0R280ZGI0bGF5SW5yYUFsOWdjczFTWC82KzdjcXhtT204ajJ4U080MDRP?=
 =?utf-8?B?RFIrZFhhc05OUWxSWVp3QUtNTUY5N1lnRE9mQkhkM2dGRlgwdjlpRVF6eWxv?=
 =?utf-8?B?aDdwMDdZd1dmbXk0bWtWVzlPSk1EMjhsRURyTXBob2NNTjZuMFpSem8xTE5I?=
 =?utf-8?B?MlNFZjcxWGxUL3BkK0NTN1Bxa09oSWdQU3M3bStUZk0rRVhjUEZOQXpSclhE?=
 =?utf-8?B?eDZDa3dYVkFzNFBZME04SFZLbG1YWE1zUS82dSs2TTR1bjJuTnpsNkNYNTVN?=
 =?utf-8?B?c25PZUR2ZFZ3VklLRVpsbUx4dFdXSTZ2N3dXZWZwTXJ3OHJvQXZsN0dZSEtE?=
 =?utf-8?B?TXBmNkoyRDBoT0k0ZE9ja09lTEVHRkU1WGxGUnlXYm85NUh4VVdITTcrdStF?=
 =?utf-8?B?SFJVU1lwQm1sYmtkd3JUUmRRSkw3dnVoeEwwVVB4M1I1YlVPVHpsR29pbUlZ?=
 =?utf-8?B?eWFTaVZPbTZ3dVoyRlNieWpZeUpsOGlEMi81NjBGL0VIdWt3REFHM1RpS1gw?=
 =?utf-8?B?a3pHWUIwaXVzek1EMnpMZmxQTkJtSjFkOHVEZ1IyeFg0RHNnZ0pONWs1VERG?=
 =?utf-8?B?ZFhpWiswdERKQWRTRExmYVlEMWRtWjZYUC9jTkd0cTNyQ0s3RHFoNUpyY3cw?=
 =?utf-8?B?SmlpbUxLWmxJUjB4UUROZWdlcTUxNC82VGljdkNiV3ZsVEM0ZXNmcTZzQmhw?=
 =?utf-8?B?QlM0UHRkKzhVYTNhdjVUeTRNNW8yRFAyQjJCdk9HNjVhdlBmL2V1c2lrQzJM?=
 =?utf-8?B?b0gzKzdLR3RucXRqZVlXZVJrM3hVMlB2QmZGWjJUQ3RHS3VLK0VzWENtN2lM?=
 =?utf-8?B?cFRYUmJHWHQwWEVSK0Q0eVNOcW5TZFN3SngycE9GYmRhTXVkclI4b2U5dk9D?=
 =?utf-8?B?Uyt5SkNoSEEzTzlXenJwUWh4MlZkTzBkL2NPTEJweWhYYXlQNXlyWlRKT3Nh?=
 =?utf-8?B?VzF2N0tsTnk5S0VVZmxRcnlveklabkpDbGgxM2czcW9hTmdpZDB6aW1xRWFn?=
 =?utf-8?B?d0xINlR0S0xRYU9odXczT1R0YzJBMkVrUkFaL1Z6ZSt3emFKUXlHZmh3SkQz?=
 =?utf-8?B?RXVpM0QyQ0I0TU1LNFU4UVgwRjZuWllTcEZETDVLOGNZNytmZmcrdG9NekNB?=
 =?utf-8?B?M3piL3YrSDRYQkhGYjRmY3RKeU9hMW1IRXc3KytuUEtGNHBkMkg5RDVKOHNS?=
 =?utf-8?B?Z3RvbTByRlp5OUdXODZBSnBEcGFFWUhmb1k4SzdJZHJWTUxsbzJhcmdLT2FZ?=
 =?utf-8?B?dlpvTmpJR1Y0MTFGZjVhcVA0cHJrNFVPKzRNZTFBbkFOVTh3S2d5bGdJQ0tW?=
 =?utf-8?B?L1dLRURZL2c0bGdsMzhjN05WNVJ1b1NKN01GZldRcXVkRVpRU21vVFN5L0VB?=
 =?utf-8?B?cU84ajNwRHVSQjBZVkplQUdrVUpNb1lMUTdqcDBvdUt6VkhxbnArYXNFSlRI?=
 =?utf-8?B?TVpJZTk5STRXZnZvbkpZbkUyZS9jdU85bHg3OTJHaFhnc3RnNXJnb0ZRRHk5?=
 =?utf-8?B?MjVldGZaNjVUWUhiRXYzandDakYzNGV1VmpTdGpremNZclFsamJOVjBrK3A4?=
 =?utf-8?Q?uS0uPtBA5ONZsGyfQarRsGb9K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7a9b25-aa7c-4e3f-e9b9-08de06962b54
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 18:11:57.6656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hm8LDNFW8QuIfpMhSit0qqztldTbqvaC0aceBrzE4Sx/KRfyK3g7j0EeJQeuTgILDxmqp9Urybujo29tySzWug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8973
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



On 10/5/2025 8:56 AM, Danilo Krummrich wrote:
>> +        let ret = unsafe {
>> +            bindings::pci_alloc_irq_vectors(dev.as_raw(), min_vecs, max_vecs, irq_types.as_raw())
>> +        };
>> +
>> +        to_result(ret)?;
>> +        let count = ret as u32;
>> +
>> +        // SAFETY: Vectors are 0-based, so valid indices are [0, count-1].
>> +        // pci_alloc_irq_vectors guarantees count >= min_vecs > 0, so count - 1 is valid.
>> This is a justification why the range makes sense (which makes sense to keep as
> a separate comment), but it doesn't justify the safety requirement of
> IrqVector::new().

Is the following better? Or did you have some other reasoning you want me to
mention? The safety comes from the fact that both start/end vector indices and
everything in between are valid.

// SAFETY:
// - `pci_alloc_irq_vectors` returns the number of allocated vectors on success.
// - Vectors are 0-based, so valid indices are [0, count-1].
// - `pci_alloc_irq_vectors` guarantees count >= min_vecs > 0, so both 0 and
//    count - 1 are valid IRQ vector indices for device `dev`.
// - Vector indices are contiguous, so all vectors in [0, count-1] are valid.

Thanks.
