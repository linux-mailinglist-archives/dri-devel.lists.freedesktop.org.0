Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BE6BB7F82
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 21:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C6E10E15E;
	Fri,  3 Oct 2025 19:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z0RfRdup";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9C010E15E;
 Fri,  3 Oct 2025 19:20:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1JDHEWMJoc65+ofSw/nIEr43seXYeRusS9RPVRSF9cxu+FkJ+osD0a8dvzRRlddN0L3ZIi8FXhyF4+QL5YeMNouZCVNXBrPIToh7VsLNBB+ZyXM/94fCqi+dImy9MOToTfjbTBphS+VYJFUiMcEefHlmKlMRmZhlHbe1DAK2xLT8l/aQZiYpOKVcQXs7FqN9LrmO+FBeRQ19iX5N+V9UdSghipdVJmWm8+OWOnVfyOk49pkOGJFKFeeGXBawvfBBx2if89Jbz9xG7IxO5mDgnrjsbgJHDxY7xAZ1ewwfP4qAHnVO3msSpvneQgFY0Dv0ajnaPek+8qoR6gghTqquw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkJbDFNWtHCWillIyPBL+HLFV6J6DAVtjM4eQVDU6Uc=;
 b=ebE9jLqdF6btH07EuL7ExvnHjvsSI9YU22WhzGABh97QeMvEnqBbp6NMKtS4uJWeNiWSX70M+7gfvG/KgV0QVYdrs2kk3HuUQ2d6Vysh5qt5k1ImbXTayX+34FEodGG0HcC291dpUrKithlHoC/6AwNQaJ+oskSrcjfIafdNLT1iGjgSY23cIEJw4V6WnfLrTVMkE77ZHK6PwwUamZPSR7TULsm0ZA44edxXXlyf4yAsZD74/IWqBIMrXIhdseVH4MDWxdBW2bv9Vx6u82SGtaDig0BCVmZifWBfzO/JSlKqXPjvCurBaYmXwCUGzJnJ9E14jx4JnL4P/uTOmnsuuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkJbDFNWtHCWillIyPBL+HLFV6J6DAVtjM4eQVDU6Uc=;
 b=Z0RfRdup5zoYFzJBzTZVJa5fm8UYV4a0fn6FcwoTqyjq+gStfkuFxML2UQCe8Gb6iRevBAcECOJFCVOeCgFPrpNrQ0+MA6LUTjTf0lSLrYTYDUWqQfJ/c9sBJXFgRNVv5dgBOq7ZZjrUp4cvP+SlrrP43QDppUroBjUZfb/ftXnk5BeqjBgm2EgVZqqWBdyIXMQBvgXEk55nwjs1xXsBZBHn95IomXLnfj8nHrgPbcikV4oCrAIieMvWZ62xE88sopO9f44qBh2FZi1zU/YLojXO4T7zzpxAHNMlgWWykVmxHTjfwG2eZ336PeB+Ll0t83nJlqMsY5ZR97jEux5RXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB7983.namprd12.prod.outlook.com (2603:10b6:510:28e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 19:20:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 19:20:27 +0000
Message-ID: <5f01316b-e685-49fe-b2b1-270c3ff84e5a@nvidia.com>
Date: Fri, 3 Oct 2025 15:20:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: pci: Allocate and manage PCI interrupt vectors
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org, dakr@kernel.org, acourbot@nvidia.com,
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
References: <20251003173324.GA361946@bhelgaas>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251003173324.GA361946@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0505.namprd03.prod.outlook.com
 (2603:10b6:408:130::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH0PR12MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 86dbd8dc-930e-4918-8922-08de02b1e8cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG1BSUE4OEF0b3BOanFxallVdTVaaEJYLzZ0N0RWcDltREgyaVcvc3c3aXVF?=
 =?utf-8?B?c29KZzdScnJvWHZGbUNJL3RCUWNJN2l2MUoyUTRWSEltUkQ3VnNla3FvcGh4?=
 =?utf-8?B?YXJWSHlvNGdWVXlVU2dNT1lhbkQ2dXp3ditubEh4d1JQR0JuWVRuSWdHL2th?=
 =?utf-8?B?aGR5ZEhkTUZyWnBkamNFZWlHaFEwUmYvTkNBM214RGhFdFRDTkZuQXcvb0o5?=
 =?utf-8?B?aURzYXQwZDVjR1BLK01FRTk4Y1ZqVVAyRHNJZVdaTmJlWTkzTlU2MENKK1da?=
 =?utf-8?B?VzZrWnlMMXh4M2grYkdRV3UvbStNeFhVUDQzZ2lxUlVrcklSY1ZjaVd1aDdr?=
 =?utf-8?B?cWFUZFFSSUlZVmRDbTk1VjVHMmh0Zm9HZjU2eFdvUHBWb3E5WDhZeGdqQ1gv?=
 =?utf-8?B?cnowZ0NxUCtGTytTSHJzVmF0Y1NaZmhzSDhrSEt4UnVWZ1BFM1N0SkpwZWdx?=
 =?utf-8?B?L0l3ODBOZDNRSnhtQTV0eGlQQW96ZE1oZlBxOFkxQXVLUVR1d21hS3dxOXY5?=
 =?utf-8?B?RWF2b2lCNTBqaVRwY05vWFhqclFoa1U2UTVyZ0I1MEpvMC9OUmVMK1l6UWlH?=
 =?utf-8?B?Q3FWb2J3MGUwcWFwN2w2aXZ1TXlzZHVwdEEzL2FnaXNNNzE4K0lidW5VM2gz?=
 =?utf-8?B?bnBtN3pkNEhkdjZRTkdBVmxiNHpHTW1aVW1GcDh5a08zTXFrK2RjRDB3b2pT?=
 =?utf-8?B?dS9zSXBCbHdZYTRJbm01THFBT29FckpjRzNMTGRMMGY4ODBvaEJ2eE1QS2tX?=
 =?utf-8?B?ZU0yMlFSck5vU1BEMklsZkhCZ2NZUVFPSk1mQkErUjZQVS9PUDRHUFlGa2tX?=
 =?utf-8?B?eGErY3ZGMXlxVmxtczZIRlVkN1A0Y1ZlTGlnTlJJZHNOTWxyOGlPaklxZlMz?=
 =?utf-8?B?NHUxenFxTVIyMkRpSzhPU2hJaXJFRkVlak5PajdWZjFjb3NkMnVlY0VvZXNK?=
 =?utf-8?B?L1RYdTNLSUJhNGZtZHFBWDFtYlc1OUc1S2tZdW50WCs3Z05ZVk1BZjZhMUdj?=
 =?utf-8?B?ZnIxQkZ0QmNIL2UyWWpzeWpzT091MG5ZT0Z0cFQxOGVSaDQrMXQzQmUydzBz?=
 =?utf-8?B?ekV3cm9Ba29YTFZZdU5WZmFLeEdhelFiY2pZR2tlR2I3eUFObjVWZmNUbitY?=
 =?utf-8?B?eDFaSFV6aTFLY2ZiQTBTdFlha2d5VkdlZzdJcUVpVENLZWZxTitPbngrRGQr?=
 =?utf-8?B?R1FkVEhValUyVVVCWE5talhjM2pBckhPNGlkd2swYzBoaEdzK1F5TUwvNHZK?=
 =?utf-8?B?R3JWN0VMeTJqZ3lOaWtvY1Jjcm1nYXVzbTJDZnl2RStXQ2ZhTXNMVUprbWdr?=
 =?utf-8?B?SzJwSWtBc0QrV3pRYlJCVjN0UG4wOE1oRU9GR2ZZOHZUSUpKd2FnaVFrZlgx?=
 =?utf-8?B?b1U3WEtUUjlkdWZqZldxT2NOcXFvWGVZdmdmQ20zNGtNNzMvM1Zma0crNGtw?=
 =?utf-8?B?bzZvc2FWWGlkdVVmQzREcTNTYVpyMmR1Q1lkR1BzbXpUR0FHeHlzWVkydHB2?=
 =?utf-8?B?VW5QQWU2QlBkUTBDcXgxU3NhTUxKam9LaUw0NTJrZEpud2lUNFErTUVNN05q?=
 =?utf-8?B?NTh0THZCOFRkcXlDQ0pqaDRLeExQbkJSdU0xNEFMRDVLTGdPdytJUGFJNklF?=
 =?utf-8?B?Q25mSHVVbU9LQU5TcERLYTU4T1lPYVA3UVRnbGxveWErQUt1UUMremVKc3F1?=
 =?utf-8?B?UkhyU3NhZDkyOUh2SDV3bzYzbjdoMWJqYndhNnZPZVJhZFlkMStsbWIxWDkr?=
 =?utf-8?B?Ujk2OUlyRFdWb3RFU2o0THR2M3NMOGFnVmJyT3dNSHJDTHNXYzludm1YQVVq?=
 =?utf-8?B?M1lNUFo5RkxhUlBJWmQ3M0ExMXQrMVYvM3ZOQkZXeDdMZ2ZwbmlHNFRHbUs2?=
 =?utf-8?B?NHVaRDhtZ2pSUUpZQTlBOU56RXdKdGNlcnFhVHdjL2lPQWNaNUFGb3VaYm1X?=
 =?utf-8?Q?+LneGfu/vt7t7ZXI5hDEbsBsfPkeI4CE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y09oYnRZWFRFOHBxb2dPellmenl1bWZjVkhadW9SWHVEaEdLZGpoSmx5WCtB?=
 =?utf-8?B?Q0ZZWXJVMjNHdXRSeXA2TzlOQTJYWC9oNTh2emwzWHE3all5akVHQnZWMTFX?=
 =?utf-8?B?R2dpU1hrd0x0OGxla0JqMUg2aVhZbnVtaEdaSHFNdzdmR3h0TXhzb1lmYkRW?=
 =?utf-8?B?MXd1NGczNGRraTZHWTFORHNqRHFhK3RSclZYQnRaVythZG84ZFljeXVoaHlP?=
 =?utf-8?B?aXVVZGM0a0NoY3V0VU80QnRxV2pvendZMGxmamZaeTBaV244dmVieHpwWWFj?=
 =?utf-8?B?a0RjQnFPOHVqeVRCZWtoTGVVQmFKbVhkOHNpeTlaU2lyTi9ZeFAyakRUSzdo?=
 =?utf-8?B?WExUcVlTaDQ2Z24vVWhia2VZMHdNR1g2ckJyWVc1dUtabUdYRnNmbGI2Zjcv?=
 =?utf-8?B?TWpzZ1pEdllPRnA5dURkUE5jdHExNUY5QU12azN3cTlrdjhiYVI3Q3dubTBM?=
 =?utf-8?B?MlZTdm5ONmNiU2NudFpYNHpqeXhsekxPZXJQVXV5d0xvNHlXS3lBdCtxM2Nz?=
 =?utf-8?B?MGp4c2twQXJtSk1DaE1RSEo2Q256bjBkNFdhb2pMTWdLSVB0c2ZPV1JhUjdr?=
 =?utf-8?B?b0FPNDByalBUY0hCR0tSRGVVU3NWOXBkR1NnSHhwZkRmYzQ1NFZ4dEFmQTVs?=
 =?utf-8?B?NVV2RkhXRllYR2txdTBUNlVHWGhtellIc3dxZXpVZmltR1pkanQ3czhQeWVp?=
 =?utf-8?B?WDJBWDRFSmd4T3NpaUt2bzRGUzdSVXE5V0VJOFNLQmhFcy90eFhKYlR3Undk?=
 =?utf-8?B?QjFjNnpCSVN1WWhVNDcrUnpSeXlpV0ZrNFRHOThYM0h2ejRWUFl1NDNqZHc2?=
 =?utf-8?B?b21kTENrbUhtbW9tcGRIVmxmQTMzVDlZUFVkYjl3OWlkazlrUnZsVFNNdXhW?=
 =?utf-8?B?em9LbTBvdGFUR1grUllKb0tzU09IeS9RQUFzSTZ4TnZ4WDlJRzdSR3BXanRr?=
 =?utf-8?B?bE9VVi9JeTZKN2FBZW12NStRVTEwTFM5N1RmVWFzWmRlajV1bWNEL1F4TVY1?=
 =?utf-8?B?N0xraHJBWndKVWpxTU9NeUFRcEpQOTU5RFJqK1lrTlBneEdYUDNYVkF1NzNO?=
 =?utf-8?B?UlBqZ3NRcTMwVzlIY1JOTGxsUFBVcnV0OE40OXJNRHJYV3NBMXZlank5OTdu?=
 =?utf-8?B?TDNCbHFUUkV5aVVOSVpTK3F6M2JjbWV1SGNaZFZoWVloY2pKeHpuNGpxcmFr?=
 =?utf-8?B?UG9uanV5aUZRSHJ6Y2hILzFNWkZqeHhKLytodDdiN1JaS1d6RkQ5NFhhWm1o?=
 =?utf-8?B?WmJtMU41R3pvZzM4ZUFxMG1lQkx6akNRV0x0TmY4NjA3ZmRMNlpUNkN4Y1Zw?=
 =?utf-8?B?UURFT0UzSEEvUG1EanQrSkU5b01vL3dPMitTUnhHUEhwaVpCbXBKQzR5Y0pQ?=
 =?utf-8?B?MzN6VlB5dkpzWllPTEVtMVhpUHdYNVNvSml4ellwbHdsK0F3SVcvaWtORGs2?=
 =?utf-8?B?c1QxV25UQlIvdjVSVHk5NjJWV1BCS3BwWS9mNTFTYkE1N0xLeWUrZ2dmdDFy?=
 =?utf-8?B?bGZ1MTN1bUl4ajlYUXhvNVliWE0vNTU3RVh3aHBpQkQyMDFsRWREZ3Fsd2xY?=
 =?utf-8?B?ZEllK202RHpLQi9UcTl4ZWVwQWhPRjNRemhVZlZ6YW5qQ3lzU0NtSVRvT3VL?=
 =?utf-8?B?b09Zd2tnbktDQUxHY1BQZzZsRk9aZE1SNVJFMUwvVUVXMDd6cVo4dWd6bnNu?=
 =?utf-8?B?ejRDTjVFSjJoYVh2QTg1WStBV3dwTVlndzNyRjJ3M254QWpCMGUyK00zYklX?=
 =?utf-8?B?OHBQMzlWU2xvd0M0QkE1MCs2TU5SSkhnY0Q5dnJXSTMrN20yZURjN2FuOThk?=
 =?utf-8?B?V0Z5RCtoSXFaU0pEWUxRSFZqWjNIZmlHaXVSZUsrdFc5cW1MSVlYN21MRytD?=
 =?utf-8?B?NnVaVEIyQXNnWnJNc0FQOGVyNFU0U1g1aklzUGJxbm95ckZ0VGlYVVdMUDE4?=
 =?utf-8?B?OE9tR1dSNDRTSUtsZ3BSYTFQVnY2UWZJd0h6K3IyQTZmdU9VME9rNkFQMk82?=
 =?utf-8?B?bHVBVUhxL3B1MXZDZEp3bUVBWFA2Tml3d3J4THRoOWZVeWJnVE41QnFOSlBQ?=
 =?utf-8?B?VHo2bDFSM09wSG5ZU0ErTERKYWJ1b0NHS3d0bWJ4N3BEZ3hUdllSSTMxSDhj?=
 =?utf-8?Q?0Yi2VOfojMWOLbe0ZMpxJ57DI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86dbd8dc-930e-4918-8922-08de02b1e8cc
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 19:20:27.3097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AgJe9hkdlJr2obOpx9PtRLz7UJOm4c6CshAKMFoQ3JUBtlMVu79rG9/MPjkn8Tsd2WjaAsyFT/YvBiUbrGj1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7983
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



On 10/3/2025 1:33 PM, Bjorn Helgaas wrote:
> On Thu, Oct 02, 2025 at 02:39:12PM -0400, Joel Fernandes wrote:
>> Add support to PCI rust module to allocate, free and manage IRQ vectors.
>> Integrate with devres for managing the allocated resources.
> 
>> +/// IRQ type flags for PCI interrupt allocation.
>> +#[derive(Debug, Clone, Copy)]
>> +pub enum IrqType {
>> +    /// Legacy INTx interrupts
>> +    Legacy,
> 
> FWIW, when I can, I try to use "INTx" instead of "legacy" because
> "INTx" has a specific meaning and is used in the PCIe specs, while
> "legacy" by itself has no intrinsic meaning.
> 
Sure, I will avoid using the word legacy for naming. thanks,

 - Joel

