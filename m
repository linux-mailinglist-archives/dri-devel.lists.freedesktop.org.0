Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730279A3946
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 10:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C8310E8C3;
	Fri, 18 Oct 2024 08:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CfEstjYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D34410E8C3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 08:56:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5UH/hYIX9A5wZMaTVeuMkZMQf6Xa2JcmTq/vx+tWvWf5LqoNwyI0o5/HsFSDO5vN2gJlNVlRlxo0lfBwYctwWdtaQHmaoxnwf8bS8M1Z6pGTxNsXu5WE+L2ayMfoBoWq/i+9CHG1FBEYjJj7rZDREsqyAMhw3iDKUpnvBsHlGFKMi1nOFAzat/KLAFNhzO8mzVXLB0ozy5XI79mLwBIfsjEEh9nG0A2DjcZSwKzYMuEHPg6qviXwi+cse/K4pmvk7KKvFn7ftLPvt3bxDXoDK+h2OrFfliHiNPWtREovngr0m8QhzAgM/Kvn9Be4gOfM4n8yBv8P2NRoo8o7bsTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E29KVOWiaITK7dWAoTX2+uP9/aN4oCBx8OsOvE5Ts2k=;
 b=hcUYsl8KAtcPBLcegZG/I4+1cAxuWLftSVWo5AkQXU09wnhB4G+2tXBcKhybh+DznRHCP8OCR2KgKDjMs5W0qPtS8KGmDLhlGpqxahsTCF0Lwq5p1rokIiyF8SYndjB7OpyZXX25KCPlViaElYbbil8v0f0a9Z+l8Sb5OAxqTCFsVg9VlvpaQqrNUConDEL8GAdKGOIZ8Pd+VtABAE6YEqnkRrgJ6CvNKV5v2cZRGR0MpKJhvEXVpgEqZ0yy613Y5ydRDC8pUkiXHbSyFcIKEuKhEqLC5DfhMd1L4ewlB6XJstrsjn0kjwBuCooRf6JKE7r43SzsFaCA8MCYLoSZRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E29KVOWiaITK7dWAoTX2+uP9/aN4oCBx8OsOvE5Ts2k=;
 b=CfEstjYJTwfVDpSZuX+97AgYBAJWDReSkhhk4ugKT9NuFw5f1+kK+MSbc7bzl1kW053ZijJ7Rmk3zSbGUoh9r2WmBnJuswBNBVtmNKe/q7/T7Jj/lb2GO96og8PFozCf63R3S23RiPrXE8pptsgIQ5nUmgU8fUk8tFU8+lDuA/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8691.namprd12.prod.outlook.com (2603:10b6:a03:541::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Fri, 18 Oct
 2024 08:56:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 08:56:25 +0000
Message-ID: <b2832f2b-16fd-4c1f-864e-ecc32f7e8009@amd.com>
Date: Fri, 18 Oct 2024 10:56:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Eliminate all duplicate fences in
 dma_fence_unwrap_merge
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org
References: <20241018054608.6478-1-friedrich.vock@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241018054608.6478-1-friedrich.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 522736ae-9f59-4639-23de-08dcef52bf41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2U3allnQk5CTUVSTWN3RlhlcVRzSTBjdllna2RzUmxnR1JqNlVkOUlxVGlY?=
 =?utf-8?B?QTNHdE81Mm5NeElkL3FRUXFwNE5tSmp6Zi9hUExGbGZtOFYwUWhNYnovdncz?=
 =?utf-8?B?b3FNU2ZuU2thSjRCTkhVVVB2UEtuaFdsRmVjVnVpSEQ2aFJ2TGV1N0NzRk9L?=
 =?utf-8?B?ZDFLM0swdEJ6Z3BLbUhya1h3eHFiZVdRNjB6Y0RCR0NKbXRsZGFDb2RKUVd1?=
 =?utf-8?B?ZGZ3QkFJWUdvWlp1K09DQVJzV3ZpU2JBaEg3K3kyS2dKbUJ5ZmwwNC9MWE81?=
 =?utf-8?B?QXdlS0wrK2RmcUJZYk9BM0ZrMjJLNDhwRU41RFhSUTczSWlYNHZhdUwxa296?=
 =?utf-8?B?aVJYVDB5TEZQVUN6QkdUOFZSQXVmNG9SeXVsblM1NGh6S1pqVEovbDk1MmNQ?=
 =?utf-8?B?ZVpBQW1RODhXU3c1OHI2OWx1cmxYOE1DQ1E1Y1I5ZnFhYlVhdXhvQ2t6cXU3?=
 =?utf-8?B?azZNUVdBUlVtWXBxZmtqajM2TGhrNmYzamcraG1DQWZldzVFSE00Lys2UjhX?=
 =?utf-8?B?QkRFWVI0amxlcHoxaGIzaExreWVaak83Vms1b3ZhVUZibmdCRTZBdEdabW5W?=
 =?utf-8?B?bFRSK3RyVVNSWXJEL1FVMjZFVFBoSEpQbE5lb0pVbmxlclBFQUp1bFF3UnI4?=
 =?utf-8?B?dXhSWXU0RHRvNENYaWwzMW1kUlFIaHp5NGxSUFhFQjVXTTlWQmk3U0t0WWpS?=
 =?utf-8?B?aWhobDdRYXN0SGcxQlR3aGtYc0IweG00U3FmNmMvK0hDc3Y0TWQ3S3VVWlZG?=
 =?utf-8?B?Y1h6cVVHMW03WlRmQ2dYZ0Q3VVZWbEZqRm1TeDIvNGpRa2VPNUxuZXJsUUhn?=
 =?utf-8?B?dmV3YW5mZlNIOXNyQThxcEVKWlNqelB2bWc2TklpVHlTZWNtOFVmNldQU2pn?=
 =?utf-8?B?VnY1Rjh1MVJiOXZTUmJUNE9wMXkyMXZBVlBXbXo5TmlVRkpKenY0MVk0Ymo4?=
 =?utf-8?B?dGRIZXFmRFNmWElZQmR2TXBZY0ZBVWRDdnR6bndCUUtsZ3ZlRnovS2c1RVNF?=
 =?utf-8?B?dnZNd1FOSXdEaHBadzY0T0Nvck8yeE1oUmtVZG01N3ozZFR2eW5zWGdyclN5?=
 =?utf-8?B?S2Roc0o0UCtsZ0dmM3QzaFV5a0F1eXJyYzF3Tmdtd2hOcmswbWlXUGVXbXhX?=
 =?utf-8?B?bXo4UEE4bmVGY0RkZVVIVVB5eEVQM3JubjZJUGtmT1UvUnZ5NHVwck5IS2xw?=
 =?utf-8?B?MDM4bDhlR0xPSTB1TFFUWGNwSk9TSit6NzN1MnRRclNXQ3MwMWJJL1FCd3Jl?=
 =?utf-8?B?cmxhN3hhOUFIY25xckdsa053a3Q1d3d2Z2hYdC9vSnZ0NlJVMmVYbElndkpU?=
 =?utf-8?B?ajlCa3duVzBQUkU0S0xaQ09DeitINjVNN2xDeWtwTXM5d1RBMFhUTWsyKzhm?=
 =?utf-8?B?T0xGYmx6MkVHNTJ0UkVsTnFQYmFVRVJVMjI0T3NzRVE4ZlZJSFFUV202cHBs?=
 =?utf-8?B?c1Z2RmhPL2ZCa3g2OEhhYjgrQUJ6Z3FESm05MndQd3pWRDZXa2V1NjZ0NnNJ?=
 =?utf-8?B?ekRwZzhWS3V1aG9IT3FxVmZoTW8yZlhSTHZzWlJ1QXlqcXJJR3ZLcWNsRG1j?=
 =?utf-8?B?RHlOSDdGL0dwcmVBdDRvbmptZTJNdm82eGt2WS93aXF3OG8rK05xYW9CUzNZ?=
 =?utf-8?B?M2o2WFdPbVhlK3F5emswS2swaVN1V0UvclVMWUdPMEs3MEViYVdkWnlUZjAx?=
 =?utf-8?Q?ghj4iyokr/6Zg70qTxAU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVg3a0h3UUdWYXk5NWY4SXlodUpPQmE2bm5tcFVoMytSaHZNTU9hZVN5dU5a?=
 =?utf-8?B?MUJCbUI4MHdyYkNFUTA2NXFscmtIT1Bza3F0OENOZVZSTGVhTFhGUjlyeGtN?=
 =?utf-8?B?c1pjMjJKdXcyRXJyR2ZTNVVOMmp2Ym9menN2eU9KRG9Idlh4dVltM3FtMGxx?=
 =?utf-8?B?aHVYTlZaNkhPOC91bk9JRHRPSWhnSDhjcXNxczk2aG85YjBLV3drK0FOUFZs?=
 =?utf-8?B?Z1lDWnNVTnNzcUJqa29yUU1ZcWljUjdZeFlJWkV1UFc1MWN2TUEwanR5N1R5?=
 =?utf-8?B?US9JTEZXVWRIZVNWUnBsRFkxQWFPNkpubjdJbVF2cHEvc1pyd2hKbjNZSVJh?=
 =?utf-8?B?S1liUVdzU3ZsOUF1S0tHTEt6Zk1iOGcxTG4xMkUzS0d2ZitoajUzU3Q1Zk9I?=
 =?utf-8?B?K2o5TGdOcFRmR2pPdFp5MWVmYmZRMEk5YXFWa1JyTXBRMHhwaGJrd2g2SlZm?=
 =?utf-8?B?dTkrVTI1UStlRU1Nai9OMEh4aU1XS1RtcXRhTVpKWTRBdThHd013b2d1K2JV?=
 =?utf-8?B?aUZ5ZVlMYVpSa1owNU1sWjJpN3A0WjVxeXNEYXFuV2RTclZlUWpnNVVNQ2l0?=
 =?utf-8?B?eThtbUNJWkhHclp2aU45UkhJTmZZYmZkZUs3U2ZoMHlXNXc4S0RlOWVpZlEv?=
 =?utf-8?B?NE1vRzBpemdTcWJBVVFLdXlFd1ZkWjExRUVOM28xU1p1WFJobjRIR0F1YlZr?=
 =?utf-8?B?Q1l1UFg4dlk4UHkwWks2MXUrd1FpbFRFMkZqVmM5YUQyalZLbVNTbG0rSzgw?=
 =?utf-8?B?Mk11UHpzM3UxL3pJNGRXZW5oTHZaUnpLR2J1R20zLzdESWtiMUZDTGlobDBa?=
 =?utf-8?B?bG53Q1lNb0taSWJxZzF1cFFGMDl2UisxYjFsWUk5M2I4STFUVDU2QUw5RUpG?=
 =?utf-8?B?N1FEL1phT0M0Y042RjJueVU5cUpnTXhoSGVHSEdKQW5UY3JOcUZtd2Y2R0I0?=
 =?utf-8?B?TlJlTE5sK2NMZVQwVS9wSlJNNE5DQzZPRWZ3TEZyZ3RvWHcwekJ0MnRXTXJy?=
 =?utf-8?B?MGNyS2xLMHB1c3RCMXV5bXppY1RsMzlvWnFTVTBuU1dicis4czgwZWtlRjBB?=
 =?utf-8?B?eGx1M3I0cG1JeFQ0TEk3aXRDYlk3ZUtzc2xwcFpRSUtBaWJ2TU1DOUNia21Z?=
 =?utf-8?B?UWJTZ2thVmxSNXIxNlhWOHJUWVh6a3ZJcUR4UmlFUmVKTzVNaXl6dnhaSHVn?=
 =?utf-8?B?dHpUVmx6VUxVYkVhalJlNysrUDgvYndabkt2THEzb0FNREpSRlh2V0thWm5Z?=
 =?utf-8?B?enlWRlQzcHBXZXFsRVg5OElBSFdyS0dmdnVRbTFtaTRJTUQrbytLMzgzUm9R?=
 =?utf-8?B?dDYxZlBlRjVnV2Eya1M2OFJBTWtiKzVpZE8xcXVPNjBiUENwOVNKcVh2R2JZ?=
 =?utf-8?B?ejQxeUt3MHFwcUlJeWMxcEtuNFliVWk0Z1lBdHE3bjhBYXVoTG1qUmNLZFho?=
 =?utf-8?B?NVljenI5VG41TjFVK1hrZm15a0hiZzQwdnFqV3d1N2V5SUd6TzVXOVRLVGtx?=
 =?utf-8?B?V1IzdlU1SHZZUjBhNU5hYmFNelRDSmxldmtQaFc3SjVJcTBrbWdyLzJRNVF5?=
 =?utf-8?B?b0hhWVczMmlLY1dBN2FMcEVMTHBWd0tIZk9ldjlaSEkwajFaTVcvZnVRZ2w0?=
 =?utf-8?B?aG9YcFpXbjBSM1FRek9kMHpJVGh4SmFuVi8vVUFjU09sdlpzeG5sK0l5Q2c2?=
 =?utf-8?B?ZE5SYm0vKzBxbWpsdG9EZGJzQTZwYW8rdnl2eHFIZ3grTFprblUwZWVTY1Bi?=
 =?utf-8?B?cUh4aVVRdDJScittVVZ5eUthMmpmaTNMTWdSRkdwcDNxUnY2TEp4MUV0OG9I?=
 =?utf-8?B?OGxrYXpCbG1WaGUvU01MMlNZMEphaGEvTytlSVh6TDlWSFVTSlV3RDN1ZTZS?=
 =?utf-8?B?cEYzRWxIQVpsbzErcyt3bHl4Q3FUMkxkUUJHNk9VYUNLQnp1UDFuaDRvRjFN?=
 =?utf-8?B?L0Uvd0xTN0JEWkRWcURRSCtGUkR6R09oM1ZFSEtqTmY3ZmJYZWVobStSR0Z2?=
 =?utf-8?B?cHR2T0IzakJDbVN6dlcyQVBiazJjbnVyRmp2Q1VMaDZjLzZ5L1RaUWF5WUhl?=
 =?utf-8?B?WU1lQUdtNzRkOG1pSHg4STd3Qlp6alQ5cmVlTTI3c2NWeHdiaVlTcWxZckZU?=
 =?utf-8?Q?m1aQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 522736ae-9f59-4639-23de-08dcef52bf41
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 08:56:25.5706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m50PYL8YZF7YwqhHjmuBvzVZwTjzTtHb8KJfxTiMgNiWUdBsMSzx3fdZ+8gJlJd9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8691
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

Am 18.10.24 um 07:46 schrieb Friedrich Vock:
> When dma_fence_unwrap_merge is called on fence chains where the fences
> aren't ordered by context, the merging logic breaks down and we end up
> inserting fences twice. Doing this repeatedly leads to the number of
> fences going up exponentially, and in some gaming workloads we'll end up
> running out of memory to store the resulting array altogether, leading
> to a warning such as:

Ah! I was searching for that one for quite a while now.

I own you a beer should you ever be near Cologne.

Please also see my patch on the mailing list to use kvzalloc() to 
mitigate this.

>
> vkd3d_queue: page allocation failure: order:7, mode:0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), nodemask=(null),cpuset=/,mems_allowed=0
> CPU: 2 PID: 5287 Comm: vkd3d_queue Tainted: G S                 6.10.7-200.fsync.fc40.x86_64 #1
> Hardware name: Dell Inc. G5 5505/0NCW8W, BIOS 1.11.0 03/22/2022
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x5d/0x80
>   warn_alloc+0x164/0x190
>   ? srso_return_thunk+0x5/0x5f
>   ? __alloc_pages_direct_compact+0x1d9/0x220
>   __alloc_pages_slowpath.constprop.2+0xd14/0xd80
>   __alloc_pages_noprof+0x32b/0x350
>   ? dma_fence_array_create+0x48/0x110
>   __kmalloc_large_node+0x6f/0x130
>   __kmalloc_noprof+0x2dd/0x4a0
>   ? dma_fence_array_create+0x48/0x110
>   dma_fence_array_create+0x48/0x110
>   __dma_fence_unwrap_merge+0x481/0x5b0
>   sync_file_merge.constprop.0+0xf8/0x180
>   sync_file_ioctl+0x476/0x590
>   ? srso_return_thunk+0x5/0x5f
>   ? __seccomp_filter+0xe8/0x5a0
>   __x64_sys_ioctl+0x97/0xd0
>   do_syscall_64+0x82/0x160
>   ? srso_return_thunk+0x5/0x5f
>   ? drm_syncobj_destroy_ioctl+0x8b/0xb0
>   ? srso_return_thunk+0x5/0x5f
>   ? srso_return_thunk+0x5/0x5f
>   ? __check_object_size+0x58/0x230
>   ? srso_return_thunk+0x5/0x5f
>   ? srso_return_thunk+0x5/0x5f
>   ? drm_ioctl+0x2ba/0x530
>   ? __pfx_drm_syncobj_destroy_ioctl+0x10/0x10
>   ? srso_return_thunk+0x5/0x5f
>   ? ktime_get_mono_fast_ns+0x3b/0xd0
>   ? srso_return_thunk+0x5/0x5f
>   ? amdgpu_drm_ioctl+0x71/0x90 [amdgpu]
>   ? srso_return_thunk+0x5/0x5f
>   ? syscall_exit_to_user_mode+0x72/0x200
>   ? srso_return_thunk+0x5/0x5f
>   ? do_syscall_64+0x8e/0x160
>   ? syscall_exit_to_user_mode+0x72/0x200
>   ? srso_return_thunk+0x5/0x5f
>   ? do_syscall_64+0x8e/0x160
>   ? srso_return_thunk+0x5/0x5f
>   ? syscall_exit_to_user_mode+0x72/0x200
>   ? srso_return_thunk+0x5/0x5f
>   ? do_syscall_64+0x8e/0x160
>   ? do_syscall_64+0x8e/0x160
>   ? srso_return_thunk+0x5/0x5f
>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> It's a bit unfortunate that we end up with quadratic complexity w.r.t.
> the number of merged fences in all cases, but I'd argue in practice
> there shouldn't be more than a handful of in-flight fences to merge.
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3617
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/dma-buf/dma-fence-unwrap.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 628af51c81af..46277cef0bc6 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -68,7 +68,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   	struct dma_fence *tmp, **array;
>   	ktime_t timestamp;
>   	unsigned int i;
> -	size_t count;
> +	size_t count, j;
>
>   	count = 0;
>   	timestamp = ns_to_ktime(0);
> @@ -127,6 +127,10 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   			 * function is used multiple times. So attempt to order
>   			 * the fences by context as we pass over them and merge
>   			 * fences with the same context.
> +			 *
> +			 * We will remove any remaining duplicate fences down
> +			 * below, but doing this here saves us from having to
> +			 * iterate over the array to detect the duplicate.
>   			 */
>   			if (!tmp || tmp->context > next->context) {
>   				tmp = next;
> @@ -145,7 +149,12 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   		}
>
>   		if (tmp) {
> -			array[count++] = dma_fence_get(tmp);
> +			for (j = 0; j < count; ++j) {
> +				if (array[count] == tmp)
> +					break;
> +			}
> +			if (j == count)
> +				array[count++] = dma_fence_get(tmp);

That is clearly not the right solution. Since comparing the context 
should have already removed all duplicates.

Going to double check the code.

Thanks,
Christian.

>   			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>   		}
>   	} while (tmp);
> --
> 2.47.0
>

