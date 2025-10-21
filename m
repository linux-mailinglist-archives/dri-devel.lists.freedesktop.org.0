Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B958BF80B2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 20:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E17A10E325;
	Tue, 21 Oct 2025 18:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NqllIWfN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012011.outbound.protection.outlook.com [52.101.53.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE0F10E325;
 Tue, 21 Oct 2025 18:27:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmgF9hTX12XgZBTDQOVK0csWVg9n8wd0Zv4ay/Z6/r4c2mECpR+HiMEbzGCpmPcOBJQEXEqkCc7syFLrljqoU2rZADUjt58Hy0W5GZ+4bu0HnCPCvmY8j8dF8U/2fl2d9oKg3MRVtBTO4iKxA8xadmzXYO9WK+vmD+iIwKLSF5HgqHwhw96EnEV4dGGPM6IhTE+BUOjV1CI42l5MHlTByF8lvAh2mQw0O0E0lYxxx9r8CQisJ/O1Q5klhgjoOcyzYgUgME1h2G1WuLZ/GwbXvcuYmHE9aOfC65XsBcro76XnlE9oFL/6GHfDtFy0WGulmyXkOcgflXYOcMAksDPsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrBy3OkEwdo/C285NdmDzxPEmoIUqIzugNwszElhv5U=;
 b=k/bYAy1IzT9QXvQxRixwjyqLdRR5ZEBe5cM5fHvn/7daR8XuwfSB9iTmU+jUQkqEBg2aQkoqcIczrZTLaDTVxF8ckR0bdnLFnSCag3lykrSWxvdP5oYGOpstN9U7E3P+yqRmWq6hRqyLN7F5uipIOwrNhgaRgRwWkau96jKnbggeS46HwJ46v3ZXriSFRdTkR6NXLh6dqTffUGx37m5KzEebd32K5Z5h+DYjOyo/lI8op8n9f0O6ak09U8dB4qdChordK/wG/hahRlHu09xVTcoLr1qpyFyaHPPWN5MMnNwvQgTI4p4aQt7cmtjYdwnIlpTxU0LAcE94XjgRIcEasQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrBy3OkEwdo/C285NdmDzxPEmoIUqIzugNwszElhv5U=;
 b=NqllIWfNs698cnL0KJRBn3XhhgDoUiNGqwXvYfauLB7tbiW9iffJrz8VIDqSVUMrYmstH5EpzcdUOiIeKfG+7Z/0J4mN3QR4Pk2NkVheDrkSccmWZ9AKp7ujbm8v7B2UUYARxAM9awHBLGk6pOc1fniZu59xoRDbehLcSvvNb3cHT5FHh9O9r82XmQrhLwfUNFroulX/y3sdeUllxMlXhLBcl9JS+U5sCTsAcoAA08/wHl5FMg92mXXh9kN/Ttf+F9NX6I2MLkT7a4FyIrzedTXJJ2oMNyKUxnD4Lo4JulVhaOi4ejA+b8B5rbwQFgcKgBNQU+KJI0FdZeLh88KDyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN0PR12MB5979.namprd12.prod.outlook.com (2603:10b6:208:37e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Tue, 21 Oct
 2025 18:26:54 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 18:26:54 +0000
Message-ID: <a4241841-b9cc-46ce-baa8-91545c2aa4ee@nvidia.com>
Date: Tue, 21 Oct 2025 14:26:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
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
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <8680705c-7298-4a33-979c-d91bd4e65b1c@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR0102CA0052.prod.exchangelabs.com
 (2603:10b6:208:25::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MN0PR12MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3110f2-6c08-4db5-c76c-08de10cf68f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGR6cFVzZ1Y0UnRnakRNUjcvZ1JZbDlPZTdUSGt5WEJZV1J3UWUybEI3VGF1?=
 =?utf-8?B?UEJ0OXBXVkkzWGFOVU9nbS82MWRzTU83V2ZvODVZdWpGTEJJK1pmQmtHWTlr?=
 =?utf-8?B?bVdVSDVCUmE1eTB5aTBVQWtHeDhXQnFNdHRzVm5MOGxOWEs1a04vSjBqaHR1?=
 =?utf-8?B?ZEhMZ3pqeklKZkJGRXRvRUN4eXU3dCtWKzhacmxwazFvb3VHZ21SdTk3L1o3?=
 =?utf-8?B?RncyTnkvY0hYdFluVDg3YVJCeFZubmIyQ2F6TDlRRWNiamJjY2szTTJVdFVU?=
 =?utf-8?B?U0xickhmeFZCR25YaWxGM0ZqNEh1cXZ2MTc4cmlvRjZheVhHR2U5anFsNHJG?=
 =?utf-8?B?czY2VWYvQjRxWHY2ZHl4TDc4dlFWNHpvK2hjQUNVMy8zRVFDSE1mMkl6N3pE?=
 =?utf-8?B?Nk5DTURuUWEvN1hla2VYcUorYnEyaDB6amtNd0tzWktWdWVWM2JBRk5HV2Vj?=
 =?utf-8?B?TzNaS3kvSXl5T3lVZk1GMndMVHliYzY3VDZodnpFMDhTWkZhZGtzT1hBWFJo?=
 =?utf-8?B?dCtCc1BZenZia0VicnZhUFZFZlZGYWc3b0d4RlhOMjA2K280VjRaREFWTCti?=
 =?utf-8?B?UlBpNGNQY3dZTExBLzhYdWhkLzF4S3BXNUhIbGdIeEFxWXhHUUhHeXZZUWZ4?=
 =?utf-8?B?ZWlIWjcyalF1V1lBUEc2RzZrRmZJSGd1RzZsdzAwRGVCZ29pUk1BM0FsMEpt?=
 =?utf-8?B?TkNBT0dNOFRnOWtkOUhMY0o3YWJYdjVKeWZ2NG5LRmpTUG9QbkJQL1RYL2VZ?=
 =?utf-8?B?d3NxKyt6cnBNOGtLY1FmYnRydkFzT3B5NElyUG1YNFFDY3l3alhxa2lIWkQ5?=
 =?utf-8?B?TG1tMElVekp6T20yVFN4RUswTHBZTnlRZ0FjOEdENnpFaUUrVEtZdUNNaklv?=
 =?utf-8?B?YjRNRFE2K2VIWXdtaTR4dDRZTEUraUtRZkdzSzh4ZUw1Z3R0Rk9hZ3NRbWI0?=
 =?utf-8?B?czBiejF6VmhLcEVLd0psUkdYczFlMkluVzZNem9XOUIzV3BBb3VjNlhUSTBP?=
 =?utf-8?B?SGtVRXFkWHJ6cGU2MkNsV1V3cGZVdmFBLzFRRkZtbUUzcGxhTFpUT3lVakVz?=
 =?utf-8?B?c2p4M2dtK0xIL2daSjJLY1JOZnlVMWk3UEg3MlV4Qzk0ZGd1SjZ6NFUzTTlm?=
 =?utf-8?B?OXBkMGZNQTZ6cnowUE96L1pOZ2h1Qno1WVIzWjRNQVIvRWdiMkNFMDduN0Qz?=
 =?utf-8?B?U2NJajVCM1BFQ09rK2w4THc5UEpBWThCTSt1RUhySnVIRExkSThxM2FSVk5B?=
 =?utf-8?B?SjhaektxU09XdWZUK3BIcnNZSFlTbDAzYWdUS1JMays4Y0hxS2dObXBoSjAx?=
 =?utf-8?B?VmdscWlhYTJ1THcxc1ZuS21VNDcrMmtSdVgwWjlNU2ozVjF3TmVlS0lzeVI5?=
 =?utf-8?B?YnRKaGhQeHVIZEU5MlNtSFE0SzFwMWYwd2tWWlg0S21WVm9OQ0ZwOFVZd1ZZ?=
 =?utf-8?B?Z3J0aFYvK1V1bXlwWjdpL1Jyak93K1hUajhubWVrSzdmYzFsTFZOMEpoVHFI?=
 =?utf-8?B?M3Y5N1Y4MXpjampJR3RRU2MraHhRam1DYllSY0tnRlRub0ozMCt0eWh3Q3JP?=
 =?utf-8?B?MHIvUUJjeWJHNjlzMm5pelJxazJsN01JZlhKcytDZnVwTElWK1NqM2lESGwz?=
 =?utf-8?B?RVNWR1BOd1Nwck01MWszRktLOGdCVUd5RnVTdlI0VThzK0x5VHd6bkdSbHVV?=
 =?utf-8?B?OXF5VURNZW5OK1QxL3ZDajQ3WGlsbkR2WGJLN1Fmemh2eHg4a1pZVFU0QVFM?=
 =?utf-8?B?V0FiQTlXallXbjkzd0hYWWZ5WGtoeHZaZ0ZTRXk3ZDM1d2NNVFNGN0JFcVVi?=
 =?utf-8?B?cFZzSkFJb2tFNW9ZblNqMVluakJ5dm8xSEh6MGRQZHM5S0hJazlIMnc5L2Y3?=
 =?utf-8?B?cjczMWY1M3dOelFUaTRhMnJrNWJnbDVYbFV5dStnalRDMXlWOWRHc3FEKzl2?=
 =?utf-8?Q?M53lX/7T5SHchgU/YJBuOoHyXmTOvqNJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlowSWxBMTQ5SEJGeU5aN2hBcUYyd1pBWXJwSDhZd2Q2cTA2TlJkU2RsajFJ?=
 =?utf-8?B?V3lmOUliRkgyTTlNYWkyREsxNXhpbTlGMFE0MGc2ZmRFdmtSWlU5T3dIMFBS?=
 =?utf-8?B?VGQxZmI1bi9HUUFFOHZtQTJBT3NUNWM2c3dMS1RRdTJHWnBUMVU1d280THAr?=
 =?utf-8?B?b3hsakx3SUorUHZISmFveGc2VHRYellkK2Y2SkdHQ2RuMlJ4dUJyeUMyOVFW?=
 =?utf-8?B?NTVvL2FRanlmSVdxZVQ3aGRNaDlsNk1udm9ydElpQVkwRjBjM3h5RmNPZExw?=
 =?utf-8?B?dTdBeU5qZlA3M21NMTNFaUl2VDNuV1FkcCtmZTRmV3pzUEdiMWx6bEJST3Iv?=
 =?utf-8?B?UkF2aVBUMWVwN1pNLzMzUEVOZG1wVUFGQU02ejRzR2FaMmV5MC9qYzhMb3l3?=
 =?utf-8?B?T2tMalJaOXFDdm9WYys4a2tqc1I5ejJIankybXNpSUhrL3pGVDBoajdIM25K?=
 =?utf-8?B?QWRBb2prMU9oanJFbFhKRkFUN2doK3pTamtlMU0vOSswNzBjcThPMWNURENW?=
 =?utf-8?B?NWcyemp6aXhkTXJQcDFzZndkbjQ5UllJbDZPQ1ZFazRld09SZEdQbU45VnlK?=
 =?utf-8?B?c0NVR1laa0tDalBjZ1JFNDAxNUF5YmFRdzZaMWpjVjlDd0NvWXl0N2dXMDN0?=
 =?utf-8?B?Skg3VzlYUWpYdWx6c3RKZ2I2eURPZkk2UXN4YmlYOW82QndWdThjT2N3UmJi?=
 =?utf-8?B?cGFVNE44d1ozUy91a3Y3YXZNUEYwS2FPNDA5TGFGUWNDaFE2aTVLRUJQT1E1?=
 =?utf-8?B?bGp2SGVzUnUxVmQzMlAxRnFNRFFjQ3ErN0t1b1poa2VoV09qZW9JakM1TUhC?=
 =?utf-8?B?RzEwaFV1d0F1N0pQbG5IL1ZNTzcxZE9wODFPUzFLQWxmYmVMVWpCR1RNWjlp?=
 =?utf-8?B?RmMzQmN0VG44RG5heUhqdGJqa05XdkdrSk9taVFtZk5NdFBYazFZTG8zRTcx?=
 =?utf-8?B?aFZ3NVRpN0ZSbGphUDFReFp2QnEraHJ4NDhHZ2RlUDYrMzZmbXRLUnVJZkpz?=
 =?utf-8?B?TklwZmNNYU13R0N5bWhaN0hCaG9LcHExVkJkZWs5Q1lBYW9UK0JkTyt5M0lj?=
 =?utf-8?B?bTBnWDJHZVpBN0lhTGVQY1ZOenUvQTNnZ0dwS0t3L3R6ejE2WTlRNkhCZ2pN?=
 =?utf-8?B?UDF2TWJSMUdsOGF2M3RIQlFZbmlsRU5qUGphOWdyUGNPc2o2QWVXeURhSVlj?=
 =?utf-8?B?dEM1Q0p4MjJRY2xHNm05dER4Q3ZOSnFyODVwWFRzN3BqYm9DQzluUlR4bUtD?=
 =?utf-8?B?Yi9ld0RUQmtHS3J2SmdWbGtzUm5aZmRpZW5iWnpUanQ3c1RHZURIMEhSL2pB?=
 =?utf-8?B?OGRSSmZWcFJZZXRZODJBSWp3VDhrb3JFRnRrelF4RHJTYVp0VXdtYXFEMUli?=
 =?utf-8?B?aC9rT3pWc2RydGpFTmU5RnBkSzBZQmxZcGxoRUZoVHM5SFdST0pOdnpzU0pR?=
 =?utf-8?B?YmRjdkhicmdYWHdNcG4raEl6WTVUZWp1ajIycm5oZHkvNjRyRSs5TG5MVXc0?=
 =?utf-8?B?aG1QRXYrVVJpYWR6VlNWanpzVWQ3Wk5TTVJzT0QxN3hmK1RJL25PdjlOM2NU?=
 =?utf-8?B?K3RPR1hjSUJNZ3QvczRMWGx2K0ZjM0JPYVJaOVZlK3FVK3NjOWJsaDhnNXZ5?=
 =?utf-8?B?Z0Nsa3VFd0RlR0lFbHJtQzluRkRRbEp4Mk9MWnBBcVF1WjlHaXZVTzh0aStT?=
 =?utf-8?B?ZDJoNVlpaC8vUE4xenJSeXlpU1Q3VlBDUWVjbFAxaThBa3FwZWNyNmVGZmxs?=
 =?utf-8?B?VGtUSjV3THlWL3FLQVU0L2IzeWhQVkhJazdIS1phMjhJbEIyQkhydEplN1FM?=
 =?utf-8?B?Uk5EaUtMS1YyTVp3eW5FYlpiaDVjd3M3QldheHFOWEt2cXNUQnNiYkhnL1Z0?=
 =?utf-8?B?L1BNSk1zeWR2OUpYcDlXRGFyUExicWJuek4yWFlQNXJGMThhV1gvWjdLYUl2?=
 =?utf-8?B?Ym5lMkI4eDA5d0Q2bE9oZXVCRVNMV3U3QzRuUTZuUTlHdHYxRlVNc3oxTmJv?=
 =?utf-8?B?WWQyV2Q2R0M3MlRzOEhQOFBRTGhMTVJacC9Gdm5iNW0xNHk4TWtVSm81bWM2?=
 =?utf-8?B?bHZFdFVwak93dklrVXY5MWl6cExEc2VjRHROd3dKK291WHJ2ZzJFN3ZSdGhL?=
 =?utf-8?Q?gC+SnfTvL+oUTziSesnbePnVD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3110f2-6c08-4db5-c76c-08de10cf68f9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 18:26:54.0642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AFxoiknPGxZGd8df+trl60+kQQxm5mmWUXKVAEKYErnSsfDhmrFA91jLQcEHkPhhiZBVRTNJ254E7x9ba4Vdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5979
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

Hi John,

On 10/20/2025 4:59 PM, John Hubbard wrote:
> On 10/20/25 11:55 AM, Joel Fernandes wrote:
>> Add data structures and helpers for page table management. Uses
>> bitfield for cleanly representing and accessing the bitfields in the
>> structures.
>>
> ...
>> +bitfield! {
>> +    pub(crate) struct Pte(u64), "Page Table Entry (PTE) to map virtual pages to physical frames." {
>> +        0:0     valid           as bool;    // (1 = valid for PTEs)
>> +        1:1     privilege       as bool;    // P - Privileged/kernel-only access
>> +        2:2     read_only       as bool;    // RO - Write protection
>> +        3:3     atomic_disable  as bool;    // AD - Disable atomic ops
>> +        4:4     encrypted       as bool;    // E - Encryption enabled
>> +        39:8    frame_number    as u64;     // PA[39:8] - Physical frame number (32 bits)
>> +        41:40   aperture        as u8 => AperturePte;   // Memory aperture type.
>> +        42:42   volatile        as bool;    // VOL - Volatile flag
>> +        50:43   kind            as u8;      // K[7:0] - Compression/tiling kind
>> +        63:51   comptag_line    as u16;     // CTL[12:0] - Compression tag line
>> +    }
>> +}
> 
> Hi Joel,
> 
> What GPUs is this good for? I ask because I seem to recall that
> the format has changed over the years, on a per-GPU-architecture
> basis...

Yes, there's different format versions.

This patch supports all Turing and later GPUs because all GPUs including Hopper+
are backward compatible with version 1. However they wont be able to use the
version 2 and 3 features with only this patch.

I kind of intentionally did this for a first cut. But yes, I could split it into
versions. The 3 MMU structures (PTE, PDE and Dual PDE) are versioned. Version 2
is Turing and later. Hopper+ is when Version 3 got introduced and it is also
backward compatible with Version 2.

We could eventually support versions 2 and 3 (instead of just version 1 as I am
doing), however my working MMU translation prototype is based on version 1 (I
did not have to configure anything in the MMU to switch versions, this was default).

There are a couple of options:

1. For starters, support only version 1. Drawback is, when/if we want to use
version 2 and 3 features, it may require some rework.

2. Have the following hierarchy:
mm/types.rs - all common structures (stuff that is generic like Pfn).
mm/types/ver1.rs - Version 1 specific types.
mm/types/ver2.rs - Version 2 specific types.
mm/types/ver3.rs - Version 3 specific types.
The advantage of this is it keeps the structs namespaced. So it'd be
nova_core::mm:types::ver2::Pte or nova_core::mm:types::ver3::Pte. And the
nova-core MMU code can pick the correct version.

3. Keep the single file types.rs and just suffix the structs with version
numbers. This is attractive because there are only 3 types that have version
flavors (pte, pde and dual pde). So instead of Pte, we would have PteVersion1,
PteVersion2 etc, and a helper abstraction can pick the correct struct.

4. Any of the options 1-3, but dropping version 1 since Turing+ supports version
2 and later. I do have to figure out how to configure the MMU to use a specific
version (which is reasonable).

5. Your options here.

Btw, I used Nouveau as a reference as well, so likely Nouveau doesn't support
version 2 and 3 features. Not that that matters (we should support newer
features in nova-core), but just thought I'd mention it.

Other thoughts?

thanks,

 - Joel


