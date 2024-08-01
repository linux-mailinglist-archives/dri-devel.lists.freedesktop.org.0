Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573B39449C4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECC110E908;
	Thu,  1 Aug 2024 10:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YsGvA+HS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2071.outbound.protection.outlook.com [40.107.212.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C731410E90D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:54:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sy3KA2Zdl9GxUBL8BKsOO35389EzBL0RnQfdQcK5g854/ObOP8YIv3BfXhM2aonP/NNkbyFE3gSi82Q1y6NOWtWKQxPERKdIK9YDHjVBsTh7bGIM8nxcAaG16dHK+TOsSbMe+m7QFS3I7gMq+xmKm+3BhqQc5rixRfJsDtiDhBJpjHxSUfdthRo/lOI92+xHYQHjql3HFgPvWAl7vCUMpZNr9MQ08bcZtaYHYLISeonLA4phBXghfAfUqQ2K5Xqk2NIWqSTrA6i5KOrhOrSi7ilxbPO2Jw86SPbfYRP+cngx32oczufKkky0EIjFmK1J2Uyj0DhsFKN3Zm+x+SDaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmL3JiKBQl2gFWYzE35YZjs8sHYypIWK0NiNAlww6Ak=;
 b=vlZCRFDT26ddEtXYzUYp+PqjqXx7n3Y9WE075ihk02O4gIlLICEXBupg8Y0N5cixFslToU0InvdQIWi5g2LfKFIou52uHsBWulv2sPlc2giTHX6daLy/NOvvdspaWc9C1yA6nTIjFBrFkrPBaVkgsWjDuXe1Ni83cTJNnL7qKybQTVOL1nwXZbcNg1Qzmw0hfuF6mnOHNlPCZCTm7YvZqm9zAlejzfsHN6RFo4FvbRnSV6xI8Z2nbRAYBAaECmmz0d/XP9SA+OtIZTnnQPGluUamOfVjfTDhW6Lj7w0jv+Yu4FiE7A90m1PunSL+35c8vtBAZpfgWs6/MO7Isa0PpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmL3JiKBQl2gFWYzE35YZjs8sHYypIWK0NiNAlww6Ak=;
 b=YsGvA+HSuBxSeJ+DziybzkNs/CEWA/U4iigOvUc7i+yJMbYy2ADy3THfoTdLbdASeJuMFxrLrKFevdTqEgxfcRApl7SMz1PvHSLxAWWn+EeWCDv4t/x2IhCdvoecKzpzwaFGsFucxPk5Yir1Lj4zbHq4WuCaS454eyQsHttLZd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 10:54:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 10:54:26 +0000
Message-ID: <e838be76-e0c0-4e87-b77d-a968318e704d@amd.com>
Date: Thu, 1 Aug 2024 12:54:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] udmabuf: change folios array from kmalloc to kvmalloc
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240801104512.4056860-1-link@vivo.com>
 <20240801104512.4056860-3-link@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240801104512.4056860-3-link@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f2cd3b-720d-4c85-5766-08dcb2184f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlRrWmtUdnkreUZpRTVVdFhuMEE1RE5WTWR2NDZOaytjMEtNWXg4TVVIbHFI?=
 =?utf-8?B?d05Wc21RanN2ZkU2N3l2QmxmSk1hQWszMkRHL1R2NE1STXBQdjV4ZHFLM0tv?=
 =?utf-8?B?OVZPdWFqbDlaOTJ4SnNEZFl1U3hJcFJabGVRdU9vOUNubFRPUFdJTEtnTndu?=
 =?utf-8?B?ZlJOdGtvdkMraHZMWVdLdnpxTE1VQXpQb01nb0FlQ2VYelQ0ZUZ5d0tBU3lV?=
 =?utf-8?B?L091YUVlVWJ1dmxDaE9KMHNheVFXSUxGZytheHBBM2RkVElpWThUaS9udjVY?=
 =?utf-8?B?Qndpa2w5YUFncjRjN3lHWTZXeVpWZCtFakhVZWVmWjhEVXB2bDFiaWZvTUh3?=
 =?utf-8?B?MnpWVUlqWW1uY2JjZ2w4Ni95VVFjOUtyZHArSjdEUGpid0FPc2ZNQzBtTjN6?=
 =?utf-8?B?bk02WHAxdFR3OEZWS0pTZTJvWVdwb2o1aGsrZTNNVDd6TS9rVVRkZXhOMlJU?=
 =?utf-8?B?eUN0WDVrWGZXaUtaRjFWQlFEc1JvZW5sNTB2T2NZN0ZqMjB4V0JOeWxIMVYv?=
 =?utf-8?B?VVVKZTR6TzF6K1VFeDV3K3hqZTJwRnlZVWwybG9HL2pHTXFyWE8vbzkxblQy?=
 =?utf-8?B?MG9RZ2twQ1I0YWRXdGVxRHdjWHdUMEd6NUdlSmVDek45UGNWWjVacnJqSUdr?=
 =?utf-8?B?bDNid1NUZFpoUVEvMUw2Nm1BOUh4TWlZNDJFb2pUMStXYzFuZHRLWVl4M2lo?=
 =?utf-8?B?b3RRaHZjY2liMEp0d0NJUjlLeVdsWTQvV2oycDBEMTBaWXBKUUJXVStZd3Vl?=
 =?utf-8?B?TUFuT3pacm9SQThiRXRyMGxoWHZLNTVIU2tlSmhta1Y4ZEZ6WVJsQjByOE01?=
 =?utf-8?B?UGV6UWpkMEF4K2hWMEdBZ1hzLzdQUkZLRlAwZld3bE0ydm52N3k1Z0h0NFg1?=
 =?utf-8?B?MExUclpyZWt1QU5PeC9oNkwrTmhrdTBtQkU1ZUwvRDdrUmRXZ3pZYk42SHFV?=
 =?utf-8?B?eTZZa3ROclcrQnc1Zy95cDlBZ0tSb0lubmZ3UGdvM01MeWJkK3NHYU1FMWZo?=
 =?utf-8?B?NENlTzRwTHlibENoNDNyc2M0a0tuWEw2bXR2TkVnZnVzaHFIcHNFZUZyMTBB?=
 =?utf-8?B?RTZINlpZU0o2UW5NRklQUnd2WWFHc0FONkFWYVRSRythQmpIaGZQQUZiZG1x?=
 =?utf-8?B?dlgyMVdwcGZEV1ZyYzI3NkV1Z3UyalQ4ck8ya21KTjFTemdMZmtwdnFlb3or?=
 =?utf-8?B?UGEvN1poeGs5WWVXUGVkcUVJYlBHMEh2RDBBSjNlS2liUlFtNFNSWG9Femoy?=
 =?utf-8?B?bFQrVlpUdGNvV1RJWjZ4OVdPdFpEYmVzVW5tZ2kwWXpkZS9PR0tGbE9JSGRX?=
 =?utf-8?B?b0t0M1dRYVdONUFpLzBMUy92SHNwdm5kRHZKUnJRNVdGOEYxQXNJd0QvWDdH?=
 =?utf-8?B?aysvNzh3dmxoejFaNE9BZTgydGc5c1d0bXJvM1FuV3BUVXczNkt3ZDJReTVY?=
 =?utf-8?B?Mm55aWJmTldxcGhORHE3WkpnMTBQSjRqamsrMXlyT0RKWnljMGNsOStzUHpD?=
 =?utf-8?B?SmFPZkdnaFJrVmlxZmVCUnROK2pxM2pLM3lwWWFmUnZ5RzNJTExQVFV4UUFF?=
 =?utf-8?B?NU1kVWF3UjBkeUdyaUs5YTkyNjcydjlwYUpRcFdPWkxFSEtJZkNUOTlxUjFx?=
 =?utf-8?B?MjR3SFBIWDYvUzhickpwTjFWSm1PdmdGakFiYlJjVmEzQXFWK0psRWZqV2Jp?=
 =?utf-8?B?SXZJMjBZbjNRcEJtcXptRlBOd2I5blFUVTh0SkJKSERRSVFuR3JxR0JSNlNI?=
 =?utf-8?B?YU1RbGt6eDVZbENyd2kycnZ3ckFpMXRISURJRHRvd0o1N3krK0xaZjNZT2tq?=
 =?utf-8?B?a3hha1lHczBid1RlRnBYZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUZubU9yd291ZEtzYkJ0emF1TVRjNFFaQW9OZ2RlNC9GNnRMOU50RHBBNHph?=
 =?utf-8?B?d0lwSW5pQXVTelBEQjNLVndUVngvQzkxYUlYVFA0b1FMZ2xuc09TbXdQcEw3?=
 =?utf-8?B?VnFyTmJvSmd4TXFPYUsyb24xL1dmTHM2TEVJcGFVQmZhdXRzT2E3ZHVUMUd1?=
 =?utf-8?B?c3ZNMkhFY2FKTDJqWWRCaXhHeHVKdXY0MXlTU2dIalRNbkxzQTh4VlJlNFZU?=
 =?utf-8?B?enZTSkZrUGFIVVlxZU5Rckk4Vkc1dVlKcXdiVDJwb21OdTg0U1N1ZzRnYXB0?=
 =?utf-8?B?am0zL092cmVTVlpWUkduZmdKTTUwTk85NnFxMGo1UlY1dFFuK01QR2NlZEpx?=
 =?utf-8?B?Rmdqc2drODM4cDhmUXd3ay9TOWlqanorYzQ4ekdtOG1tSjlHTUY0K3NaZzFP?=
 =?utf-8?B?TWN6em1OeGE5clJUd2s5SGZ2eHRZandyS3FWQk15Qi9kZktBck01aEpueDFG?=
 =?utf-8?B?OS9iVHRlemFMaE81cmwvblJrQ2ZraHhTeXJ1aDRvdjNSSEp3MExhd3gxOTQ3?=
 =?utf-8?B?SXNVVEduRUhIbWY1WFN2dTRJeVBkT2phWjJuU3NVV3o0ZUZ6dythaFVXdXFZ?=
 =?utf-8?B?dkhuVHJGcWJaSjRIbjFGdWFscVZIaXdZTnVJaEs1UFlPU1NrZVIwMWtBdjBU?=
 =?utf-8?B?L0JkUGw5UVhnT2RjZkl5b0hWZk5wU0xyalJEVVJTeDc4TGgrZEM4Y0JaeUx0?=
 =?utf-8?B?Vk9mVGpwOEFqQ2Y3Q1BIT1hHbEFSU293QkE2eXBta2h4S3FDa0RobzVsT1hy?=
 =?utf-8?B?eittVDZTZTZJUjYxcG5mRWpTZkxHRVNVQTRoSEwrb1dzWFd5NGJaL05sT0gv?=
 =?utf-8?B?cDAwRmNDZndlSldGOXU5b3hvdk9HK2h5MnNuTFdZL1c2N2FWOE1SdXN5VHhI?=
 =?utf-8?B?YWhuYlp2T1c1MFNtdUpMREJKajRvTVVlTEZPRWczYU5tV0kyT1gwd3ZKQzhs?=
 =?utf-8?B?RURUMUs2UkJsSXd6ZTBRM05ZekZsMU10cG5QSkxPTnR3WEo0Sy9TRXpZSEFh?=
 =?utf-8?B?dHB3NDhXYXFjR0tjbFdVVGFYVkRlbG5CZDVsZGRIL05SWHhOejhjMmhoWHNR?=
 =?utf-8?B?dWlhRVpNSnNwNWp1WlNVMDh5MEpxLzJCTTkzbHh4bkgza3p0UWxmayt6UkQ2?=
 =?utf-8?B?cUF5b1RWZ1lnTklpWitWRHU5VHVBZE8xdXpDSmJ4ZmdxK2M4OTRLeGJsMk15?=
 =?utf-8?B?dkdhRkVZTEwzVlZOS0JPVUpXdWNnejlqdC90ZUcyWTVkVUlTb0xHdUJ5L3RD?=
 =?utf-8?B?bG5QYXFiVFd3czVrTFovbEpHelU4SXdpQ2d1UDVVK01qYXJKNS9VUENMN0dW?=
 =?utf-8?B?czNDM1FlY0F4SGZNVHVPTHZlVmFXdERSeFU5S1RhQ0Z3cTNSUlViT01BYU15?=
 =?utf-8?B?SE8vNFFML1NXN3ZtUFkrSWxsbE1vT1pXdUsrTWJiZnpTM005M2pFR0lWMVZP?=
 =?utf-8?B?TjJObS9nUVFrUHNQZ2R6L3B2VGVVRnl3eFptV2czQ3pva2RuOUJSUlg0dzVI?=
 =?utf-8?B?QlBET1ZJakFDTWF0ZmgyZkhWeXQxUi9HV1Q2YWUzcGNuOHdibG1XZTVnTVh5?=
 =?utf-8?B?N2VwM25paERoVWRwSkkwYjgySTVzYk1ESm9yb21hRCtCb0g5ZzhLVHVvSWZP?=
 =?utf-8?B?ZEtDd0VnMXh2OWpBbXJ5ZDBxaDcrM3lnL2lpV2ZkT0NQejJCS2loTVNxcEMx?=
 =?utf-8?B?Zmt5d3p0cnk3Z3ZBSWp0ZGYwdUFXSlIrQ1BYZjlsQ3pjaTJ1ZmduVTZwWHJB?=
 =?utf-8?B?N0JKZGp2eUtsZGNmK3Y3T0hsSU1SejhOTk5Yai9mYitaRlFTckVqUFBMOGVK?=
 =?utf-8?B?UWFFeDNPcjVBNWdMUGppVzQ3QzM4MVhRT2FVT1Rld2svU1VuLzdSNDgweHFD?=
 =?utf-8?B?V2Y3bXNYbHJsenpoR0FiaGhJclUxQjRWS1NrOERDUEpKVlJmTGpmTmY2VHFU?=
 =?utf-8?B?TU9zVUlNc2ZPSHNpTUsxcHlGUGp6Wm9TaTZQZyt3eXlPN2FqcEdXRFRCdHFM?=
 =?utf-8?B?WU1nNTI4QW5rSk14b2JKQnluVGRMTDJ0UkJSQU5oblhXNnFuQUV6TDNIK1RS?=
 =?utf-8?B?enhMb3hiSFNMSUxsMTdEWjM3d0Q5RU13cXVrRTBYZXZ1U1dnRGd2YUh1QWRz?=
 =?utf-8?Q?i9KLJU32SdWH5Wou5olOntoVD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f2cd3b-720d-4c85-5766-08dcb2184f33
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 10:54:25.9547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFaU4WtWFUM3aoj6rbJnce6hctLbG0BqOVPJXe6xTa1ecukjhCNrVVHeGv0ZlQ61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028
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

Am 01.08.24 um 12:45 schrieb Huan Yang:
> When PAGE_SIZE 4096, MAX_PAGE_ORDER 10, 64bit machine,
> page_alloc only support 4MB.
> If above this, trigger this warn and return NULL.
>
> udmabuf can change size limit, if change it to 3072(3GB), and then alloc
> 3GB udmabuf, will fail create.
>
> [ 4080.876581] ------------[ cut here ]------------
> [ 4080.876843] WARNING: CPU: 3 PID: 2015 at mm/page_alloc.c:4556 __alloc_pages+0x2c8/0x350
> [ 4080.878839] RIP: 0010:__alloc_pages+0x2c8/0x350
> [ 4080.879470] Call Trace:
> [ 4080.879473]  <TASK>
> [ 4080.879473]  ? __alloc_pages+0x2c8/0x350
> [ 4080.879475]  ? __warn.cold+0x8e/0xe8
> [ 4080.880647]  ? __alloc_pages+0x2c8/0x350
> [ 4080.880909]  ? report_bug+0xff/0x140
> [ 4080.881175]  ? handle_bug+0x3c/0x80
> [ 4080.881556]  ? exc_invalid_op+0x17/0x70
> [ 4080.881559]  ? asm_exc_invalid_op+0x1a/0x20
> [ 4080.882077]  ? udmabuf_create+0x131/0x400
>
> Because MAX_PAGE_ORDER, kmalloc can max alloc 4096 * (1 << 10), 4MB
> memory, each array entry is pointer(8byte), so can save 524288 pages(2GB).
>
> Further more, costly order(order 3) may not be guaranteed that it can be
> applied for, due to fragmentation.
>
> This patch change udmabuf array use kvmalloc_array, this can fallback
> alloc into vmalloc, which can guarantee allocation for any size and does
> not affect the performance of kmalloc allocations.
>
> Signed-off-by: Huan Yang <link@vivo.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/udmabuf.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index d69aeada7367..a915714c5dce 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -83,7 +83,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>   
>   	dma_resv_assert_held(buf->resv);
>   
> -	pages = kmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
> +	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
>   	if (!pages)
>   		return -ENOMEM;
>   
> @@ -91,7 +91,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>   		pages[pg] = &ubuf->folios[pg]->page;
>   
>   	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
> -	kfree(pages);
> +	kvfree(pages);
>   	if (!vaddr)
>   		return -EINVAL;
>   
> @@ -203,8 +203,8 @@ static void release_udmabuf(struct dma_buf *buf)
>   		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
>   
>   	unpin_all_folios(&ubuf->unpin_list);
> -	kfree(ubuf->offsets);
> -	kfree(ubuf->folios);
> +	kvfree(ubuf->offsets);
> +	kvfree(ubuf->folios);
>   	kfree(ubuf);
>   }
>   
> @@ -330,14 +330,14 @@ static long udmabuf_create(struct miscdevice *device,
>   	if (!ubuf->pagecount)
>   		goto err;
>   
> -	ubuf->folios = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
> -				    GFP_KERNEL);
> +	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
> +				      GFP_KERNEL);
>   	if (!ubuf->folios) {
>   		ret = -ENOMEM;
>   		goto err;
>   	}
> -	ubuf->offsets = kcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
> -				GFP_KERNEL);
> +	ubuf->offsets =
> +		kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets), GFP_KERNEL);
>   	if (!ubuf->offsets) {
>   		ret = -ENOMEM;
>   		goto err;
> @@ -351,7 +351,7 @@ static long udmabuf_create(struct miscdevice *device,
>   			goto err;
>   
>   		pgcnt = list[i].size >> PAGE_SHIFT;
> -		folios = kmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
> +		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
>   		if (!folios) {
>   			ret = -ENOMEM;
>   			goto err;
> @@ -361,7 +361,7 @@ static long udmabuf_create(struct miscdevice *device,
>   		ret = memfd_pin_folios(memfd, list[i].offset, end,
>   				       folios, pgcnt, &pgoff);
>   		if (ret <= 0) {
> -			kfree(folios);
> +			kvfree(folios);
>   			if (!ret)
>   				ret = -EINVAL;
>   			goto err;
> @@ -390,7 +390,7 @@ static long udmabuf_create(struct miscdevice *device,
>   			}
>   		}
>   
> -		kfree(folios);
> +		kvfree(folios);
>   		fput(memfd);
>   		memfd = NULL;
>   	}
> @@ -406,8 +406,8 @@ static long udmabuf_create(struct miscdevice *device,
>   	if (memfd)
>   		fput(memfd);
>   	unpin_all_folios(&ubuf->unpin_list);
> -	kfree(ubuf->offsets);
> -	kfree(ubuf->folios);
> +	kvfree(ubuf->offsets);
> +	kvfree(ubuf->folios);
>   	kfree(ubuf);
>   	return ret;
>   }

