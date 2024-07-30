Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72471940AAE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 10:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7055110E235;
	Tue, 30 Jul 2024 08:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HIszpBHh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4361610E235
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 08:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gz0EfuTR89UBiN8Mdv+I7/s9eRzD/jc37syw467ltmPpQbPLE3EMqBRgjvCLwC8v2JHg1CTXOBbwU5T//wIE7bWB1JpWiuGbiyA3Yiu8XkhBS4GO+RccZafSFqca+WDqccNYjXoMGfMKu+wrJFyIuiV/wWg6k9FC3MH72GILc+Gv6fGPyealHb0l1pt5XUmG8hVMiSa7Fo1AiWAMyJsDNwZSPJysZ/BQlGzN4B5xhXK4fqK3+FZcVHv7Mloue4VPedLgIICw3VNYzjaXRWfHOmCGwy0sISSPd67LXN+/rISR1XHvlX6e9R5geeChfZ/VeC8+BIEOAjQnMHpkCsNLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2WLJcWQROisr0vFTdIIOxJw03oSKe+OlnavaH4j7Yo=;
 b=f372Y7zpu3oBbbdjXuXqcUEMCV+9tX1ueDMsNJK8AQpcCBFZ3oQJAzE6BpYnNCxkgFSknjXQ9Hyv09GduLP3KZj+kYCQTVPK7pnC+lJmOhWC1d2kpGJYhGoccHVb2R2WvKdzJJGJqgA0Hs8r9xmCxBi2hqFAQQdJZ5DeAM4wwU0nqBFWuQwNC/bDsqrvQ1NKLhJzLUKJmPli+u96dSLlwX2FoicToodz8njGErcZJpnWcajRK6kkduzrToDSVPHSH16HTzertH/wWSG8AtgqgZ+moNmL0ftxqrZPtKY8d9zhem2GF47sibORveRUyy7JOviaG5glyMrN7QT0rWq3hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2WLJcWQROisr0vFTdIIOxJw03oSKe+OlnavaH4j7Yo=;
 b=HIszpBHheGxnz7x32YXd5D+UO+OsVyF9XsVKhY7EaX/aOOA+YnBnZY4bZEvOSL6TWfdWdGflhSY+ZFJLtPrtRbuwWO/7v5/UdfoxLbRVXzaxVHoPkPBtXCFC91VDK5eEM7WV3G3Nxs0YGd2KqTMpExMqwkiWuAoGP2NTU8oASto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB8106.namprd12.prod.outlook.com (2603:10b6:510:2ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 08:03:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7828.016; Tue, 30 Jul 2024
 08:03:45 +0000
Message-ID: <d2f56198-a3c2-4f7b-9d10-616deb348351@amd.com>
Date: Tue, 30 Jul 2024 10:03:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240730075755.10941-1-link@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0269.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 72fba75f-a770-403c-6b3b-08dcb06e226d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cCtLUWxzalJhekIyNUViWFVtSEVZbmk0UWJldlhZVXNtWCtQMDFBbWtEcGRN?=
 =?utf-8?B?eXFzb2NnbU9wVHpZYTI2NmZ6OXhOcXF5VkRieU9KQ0NjREZaL2x2VDE1L2Vh?=
 =?utf-8?B?MnNCRkt5cVhYVlRLL2o0VHhOdVVHNUMwVHdxVVR2cXliODZEMkVBNkNvK0pu?=
 =?utf-8?B?RDd5SHowUmxTK2lkc09maXo5ZTBEZk9pZ1MrbGNqcGUvT1RXREpSUVlWUUlt?=
 =?utf-8?B?b0ZHWnNvOTFVTndWZys1SWJKQUc2dGZVM0phWlJ3bGdYeG53K1dGcWRyM1ZR?=
 =?utf-8?B?ckk0aURzMVBuNW9XazRjcWkwRkMveGhUQWs4Yk9ZRVFmYWxrOHRkZEpqRVI0?=
 =?utf-8?B?MXdpSk1MaFp3b0dJT015OFlRMTIvR29LY24zZVdyVUlRVisvT2NzV0ZJOGpM?=
 =?utf-8?B?ZG12MzlPR08yRGJmajl2cDYyVTI4QXN5bmJUL0gzM0JSc2ZScGQ2NTZlS3dM?=
 =?utf-8?B?enZjTUVFajRaWThXWU1XVDdFbjN1VEZpM1NIYnBUZzlPbHJRZmt2TFdRNGVs?=
 =?utf-8?B?VVNqRER0UUNTcHBBamF6UmE1YmZCSXRqYnF1SGFIeUVRWG1hd3laOFVDaEZZ?=
 =?utf-8?B?SEdvTUNIdGNWV3NEeDdvclBUMXE5OEE2NEU0Zk1xUTEySjMvYWhXZjJkVThJ?=
 =?utf-8?B?YmN1MldaNUJUZ3Y3UkFPY2lRMmhYMDA1NXhpZnd5QTBVeHVzcGxWMk9aUWpQ?=
 =?utf-8?B?cE1QZVJyTGoyZUVXSGNTMlQrZjlneTJTVGNNcWRUUVRpSHlFQW9Xb05LVnpT?=
 =?utf-8?B?bXdMMjJZOUhxM1cwUk9UNVdyTTZyT2c0eC82dk5Yelc0am9uYjNXczAxZmZC?=
 =?utf-8?B?bjUxV293NDdWb0YxMXhyS0txTFViNmNWZlhFdTRBYVNVbVlsblZ3YTIwZFBw?=
 =?utf-8?B?SlNrMnhxaWVKTTRicnBhUEVFaGhBS2tBQkdPZW9XZWlYUU1kWXJzUTNrVkJY?=
 =?utf-8?B?YVkvTGE2ZmMzQlhKTDRQOWppZ0JQeHM5SEVvR3pJaFVRc0N1Q0xhZWpLR2ZB?=
 =?utf-8?B?QVJxanByVmFmS1JqR04rVVNEblBraVEvNTB1VWl4SlZFSlJSREJzeW9XZi9x?=
 =?utf-8?B?RGljb05VRHNsVWVIcVRqeFRkVkdQdTNwa05pNU9GdHZIU00vaGdFcGNEbnNu?=
 =?utf-8?B?YVR1UkxTOGtXazlDRmZrUjYxL2RpaGJCWnVFVFBGb1pJR2JNTGtRWm5CbGY5?=
 =?utf-8?B?MTl6a0c2UExqNENqU1paYVR3a0xhMU8reEpTcmVRaUhwMWllUkcyU3ErUXFx?=
 =?utf-8?B?ZG05T0NqVUNpTjlLZ0FpR05LNTRGM05odHp5Yi9rRnJUS0hZUnZWN0V2K0pX?=
 =?utf-8?B?MmRaMmRENG41M0EyUEFWRE44Yk16MEZ2Z0IvRjVFR2krZS9ULzIwelBYZjBv?=
 =?utf-8?B?YlkvQXEvSDN3aEpkSTczeTNveExQMGhybC9GZXNSOW5tTUl0bFgrNVNGWXNP?=
 =?utf-8?B?ekhKakgxemNTVkx6dTFLSDZXYzg4bXNuMTdLQkEyRXpIK1krWlk1bk5MbHRO?=
 =?utf-8?B?eFR6M3pXSHo1L0EvRHA0eUk3WXFCc05jYVpoZ2xWUWxkditHTVdmb2xuWFNH?=
 =?utf-8?B?bWxYSDFNWm1xTnh4ZllSZkI5c1pRTk1QMk9vSjBETlhiUzVPb3VBT21RbW9j?=
 =?utf-8?B?ZDUzMDh0UmoveFdyaW1qclkwZFl3RGYyTmtsMi84czNLT1c0cjNoOUhkK2RC?=
 =?utf-8?B?NzJOOTgzaGZlQ3U4bE9tazlpNlhwQUpnRWgrZzR3UW4wOW1VQm5CSzVGYXVk?=
 =?utf-8?B?SWR0NzNZUVV6MVJmUFIwTGRDS1ZLVUJkQ1N3Ly9ra1RtMTdTUUJzZHZLbVhh?=
 =?utf-8?B?MDJDanc3ZHplUHc1NU1Ydz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlRIK3Q1SHpMYWg5NmxvZGRpVHFyYk1VUnBsblJCNGdGeHJkV3MvRTVlWG1y?=
 =?utf-8?B?NFBBYk9ZcG5DQVN3NWdnK2VhOWZYQTFrY2xTQjR4NzBIMkV2QktsRStKQjdv?=
 =?utf-8?B?cW9maStzOEJDSE9yV045N2FabVArMjVRZjNIaUVZVzd5dy9zMjVGZitzdjRI?=
 =?utf-8?B?SXJvN3Awc2FoZE1PTDJBSGtKMWtBYlhLVkl0RkdoSG4wekJQZVoxZWE5SndO?=
 =?utf-8?B?a2FhZ0xLOEp3Q3VMNEVrcEZpaEdlb212U1FCZXBGVjJUVFUycThtaEZJN3BI?=
 =?utf-8?B?dndSTlBPRFF3T1loL2JsSGs5OHBsTFRreTVSMURISU9yM0xRdlZzdU8xdmp1?=
 =?utf-8?B?dnM4RDRudS9peHFRVE9SODZGTUhsYmVQRnZoa0NiaXU4Q0hxcXVxbm0xemlP?=
 =?utf-8?B?aEp1TGhMR2Z0QjZnWENlMXpjeW80TjB5Tnl2b3hrb1NwbUF1V2JmbjRuT2Zh?=
 =?utf-8?B?K3RRQ0ZERG1HZGorSllIaVN1bmdDWnN6ZHB1MFFMdEFoSHYzRWxGZ1BhTlpJ?=
 =?utf-8?B?WVhrNFVWd2xVRWJuRDk2YU9ocjJkbXVJeENnakplWXJ5VmtDTHRkS1J0VFVC?=
 =?utf-8?B?Q0dJbTZuR0ErcW5EZGtod1BVSDNieVNGOGR0T2RwUG5SYlVLWVRCbDVoZHdB?=
 =?utf-8?B?MVNRYk5QdVdrVDU5RTNVSzNzY09hK2FZd3E3NHRhOVNBRVJKdTN3dDBJelgv?=
 =?utf-8?B?OXViUGVRY1Yra3B3MXA0ZVM3dGo2M1FtaW1ZdWdhZ2FGbU1SS3dOQ3ppdlFN?=
 =?utf-8?B?eGFzc24zQ09zU28wTkY5N1BZQTNRbWVveFh2VmJmYS9qZ1dvN2VRaXhHUXJN?=
 =?utf-8?B?YXI5M2lYaExpV0M5KzJocjRnU2NPRHl0N3JMS1ZPeDI3alBqN0tROUFVVEhX?=
 =?utf-8?B?REpmQXNpTnF2eGhhNnJIblNxY0N6RWlCR05MVWh6T0VOR0NOUmYzd1Rrd1hH?=
 =?utf-8?B?N201eDdXakx1ak9EQmZsOVZQYXhSeGZHUFdQQnVFdHViRDZpUHVrSDFYL1F1?=
 =?utf-8?B?Ky9PTmFIRlpMd1ZFZEowN1Jldkp0cjRGSkRjUTVOSVpERk9kVkNzck1RY2J4?=
 =?utf-8?B?MUUzMFhGRXlkOXY4Z3lQdnhLMldydEM2ZlJMeDZJK0QvRFdKVHd5UGJOSGxB?=
 =?utf-8?B?alFBb2U2dlVJSDFjcWNiWVp5OHdmV1ZIRnM0MnRnN0VNRW8rTjBaNEZMUmRy?=
 =?utf-8?B?dDU1dnZyTFJyRjhpYUdrR1hhWlhuN2ZuUi9USGxNS0pCTXlGVEd6NFp3MGJY?=
 =?utf-8?B?QmdjdjhtWWRBRlFSdjVsRERLVVg3aUFuNTZtdUdWWTR4Z1JuSXFUMFVTdHcv?=
 =?utf-8?B?VWVkdmpIODRkSmZnZzBDQlNWYVdianI4SGxMODhybUdNamF2UHdPY095cFBz?=
 =?utf-8?B?dEJQWkVhak1ETnRZTnByYWxwV2NnaGJEQjFONnhqNHkrZ09lY1BzY3FTMHNp?=
 =?utf-8?B?VlNnRTVMRWtoMnZ6Y3NDQkk2cHltWUFOWHNxYlVLTWZjUXhRZUhYTitpbk50?=
 =?utf-8?B?Nm04UjdXUHRlSDZzd2dYNmZ3THFvZHBhWW5xMndTM3hVdWgwbGt0YWIvOHI5?=
 =?utf-8?B?N0ZRZDV4WHptN3AyRUh1cldJY3k5c3I1TEF5UVd3ZEtmNDBETXp3dW5hVjcx?=
 =?utf-8?B?L205TFpkdThOWThLRi8yYlNsNk16M1VYZE82eGQzc3JGSFJCaFZkTXhhQmJ1?=
 =?utf-8?B?NzU5dXJiQWxlc2FBZThQcDQ2RmhjdlJrQXMvd2hNdDlxZnhPUmZncWdNMWZC?=
 =?utf-8?B?RFREc2Q3eEkzS3cvWVRVT1JHVjBVQ2ZjOUNIdTJ5YW5nTTQxYVpqWExoNVJm?=
 =?utf-8?B?clpwV3QrOThScm8wYTc0WW1QT1BSUTVyUGVFV1pzUlo1Qi9ybzROa3VkVUZU?=
 =?utf-8?B?VDVQLy9CUjdEUDFVeEVOVEx1Ym5wS1pnVXJRdnFpRlZnM0wxaHplU1l3Ujlw?=
 =?utf-8?B?NkZPQXQrc3Y2alRqNXQycXdEalFqd2ROU3VCV0V0Smg5bWpVN3N2bmc1ODdT?=
 =?utf-8?B?MUZOdUtxc09rS1d6VmZXS25ad0VNMllONWpvZnhSMHJqMkFkVkNpc3d4S21X?=
 =?utf-8?B?KzVveDlkU1dPRTI0d1RkZkRNWUtQRDRYV1d0cFdueGpmY2FyWVVpdmwrQXNB?=
 =?utf-8?Q?dCcDK8DUENvNdxCBJzxzuzqt3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72fba75f-a770-403c-6b3b-08dcb06e226d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 08:03:45.0931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GT7zoJLBaAiAqPG7wLBfcYNScBr+yoI5360ak8BytjEo/krMa4wKI5FgYKHMKKEZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8106
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

Am 30.07.24 um 09:57 schrieb Huan Yang:
> Background
> ====
> Some user may need load file into dma-buf, current way is:
>    1. allocate a dma-buf, get dma-buf fd
>    2. mmap dma-buf fd into user vaddr
>    3. read(file_fd, vaddr, fsz)
> Due to dma-buf user map can't support direct I/O[1], the file read
> must be buffer I/O.
>
> This means that during the process of reading the file into dma-buf,
> page cache needs to be generated, and the corresponding content needs to
> be first copied to the page cache before being copied to the dma-buf.
>
> This way worked well when reading relatively small files before, as
> the page cache can cache the file content, thus improving performance.
>
> However, there are new challenges currently, especially as AI models are
> becoming larger and need to be shared between DMA devices and the CPU
> via dma-buf.
>
> For example, our 7B model file size is around 3.4GB. Using the
> previous would mean generating a total of 3.4GB of page cache
> (even if it will be reclaimed), and also requiring the copying of 3.4GB
> of content between page cache and dma-buf.
>
> Due to the limited resources of system memory, files in the gigabyte range
> cannot persist in memory indefinitely, so this portion of page cache may
> not provide much assistance for subsequent reads. Additionally, the
> existence of page cache will consume additional system resources due to
> the extra copying required by the CPU.
>
> Therefore, I think it is necessary for dma-buf to support direct I/O.
>
> However, direct I/O file reads cannot be performed using the buffer
> mmaped by the user space for the dma-buf.[1]
>
> Here are some discussions on implementing direct I/O using dma-buf:
>
> mmap[1]
> ---
> dma-buf never support user map vaddr use of direct I/O.
>
> udmabuf[2]
> ---
> Currently, udmabuf can use the memfd method to read files into
> dma-buf in direct I/O mode.
>
> However, if the size is large, the current udmabuf needs to adjust the
> corresponding size_limit(default 64MB).
> But using udmabuf for files at the 3GB level is not a very good approach.
> It needs to make some adjustments internally to handle this.[3] Or else,
> fail create.
>
> But, it is indeed a viable way to enable dma-buf to support direct I/O.
> However, it is necessary to initiate the file read after the memory allocation
> is completed, and handle race conditions carefully.
>
> sendfile/splice[4]
> ---
> Another way to enable dma-buf to support direct I/O is by implementing
> splice_write/write_iter in the dma-buf file operations (fops) to adapt
> to the sendfile method.
> However, the current sendfile/splice calls are based on pipe. When using
> direct I/O to read a file, the content needs to be copied to the buffer
> allocated by the pipe (default 64KB), and then the dma-buf fops'
> splice_write needs to be called to write the content into the dma-buf.
> This approach requires serially reading the content of file pipe size
> into the pipe buffer and then waiting for the dma-buf to be written
> before reading the next one.(The I/O performance is relatively weak
> under direct I/O.)
> Moreover, due to the existence of the pipe buffer, even when using
> direct I/O and not needing to generate additional page cache,
> there still needs to be a CPU copy.
>
> copy_file_range[5]
> ---
> Consider of copy_file_range, It only supports copying files within the
> same file system. Similarly, it is not very practical.
>
>
> So, currently, there is no particularly suitable solution on VFS to
> allow dma-buf to support direct I/O for large file reads.
>
> This patchset provides an idea to complete file reads when requesting a
> dma-buf.
>
> Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
> ===
> This patch provides a method to immediately read the file content after
> the dma-buf is allocated, and only returns the dma-buf file descriptor
> after the file is fully read.
>
> Since the dma-buf file descriptor is not returned, no other thread can
> access it except for the current thread, so we don't need to worry about
> race conditions.

That is a completely false assumption.

>
> Map the dma-buf to the vmalloc area and initiate file reads in kernel
> space, supporting both buffer I/O and direct I/O.
>
> This patch adds the DMA_HEAP_ALLOC_AND_READ heap_flag for user.
> When a user needs to allocate a dma-buf and read a file, they should
> pass this heap flag. As the size of the file being read is fixed, there is no
> need to pass the 'len' parameter. Instead, The file_fd needs to be passed to
> indicate to the kernel the file that needs to be read.
>
> The file open flag determines the mode of file reading.
> But, please note that if direct I/O(O_DIRECT) is needed to read the file,
> the file size must be page aligned. (with patch 2-5, no need)
>
> Therefore, for the user, len and file_fd are mutually exclusive,
> and they are combined using a union.
>
> Once the user obtains the dma-buf fd, the dma-buf directly contains the
> file content.

And I'm repeating myself, but this is a complete NAK from my side to 
this approach.

We pointed out multiple ways of how to implement this cleanly and not by 
hacking functionality into the kernel which absolutely doesn't belong there.

Regards,
Christian.

>
> Patch 1 implement it.
>
> Patch 2-5 provides an approach for performance improvement.
>
> The DMA_HEAP_ALLOC_AND_READ_FILE heap flag patch enables us to
> synchronously read files using direct I/O.
>
> This approach helps to save CPU copying and avoid a certain degree of
> memory thrashing (page cache generation and reclamation)
>
> When dealing with large file sizes, the benefits of this approach become
> particularly significant.
>
> However, there are currently some methods that can improve performance,
> not just save system resources:
>
> Due to the large file size, for example, a AI 7B model of around 3.4GB, the
> time taken to allocate DMA-BUF memory will be relatively long. Waiting
> for the allocation to complete before reading the file will add to the
> overall time consumption. Therefore, the total time for DMA-BUF
> allocation and file read can be calculated using the formula
>     T(total) = T(alloc) + T(I/O)
>
> However, if we change our approach, we don't necessarily need to wait
> for the DMA-BUF allocation to complete before initiating I/O. In fact,
> during the allocation process, we already hold a portion of the page,
> which means that waiting for subsequent page allocations to complete
> before carrying out file reads is actually unfair to the pages that have
> already been allocated.
>
> The allocation of pages is sequential, and the reading of the file is
> also sequential, with the content and size corresponding to the file.
> This means that the memory location for each page, which holds the
> content of a specific position in the file, can be determined at the
> time of allocation.
>
> However, to fully leverage I/O performance, it is best to wait and
> gather a certain number of pages before initiating batch processing.
>
> The default gather size is 128MB. So, ever gathered can see as a file read
> work, it maps the gather page to the vmalloc area to obtain a continuous
> virtual address, which is used as a buffer to store the contents of the
> corresponding file. So, if using direct I/O to read a file, the file
> content will be written directly to the corresponding dma-buf buffer memory
> without any additional copying.(compare to pipe buffer.)
>
> Consider other ways to read into dma-buf. If we assume reading after mmap
> dma-buf, we need to map the pages of the dma-buf to the user virtual
> address space. Also, udmabuf memfd need do this operations too.
> Even if we support sendfile, the file copy also need buffer, you must
> setup it.
> So, mapping pages to the vmalloc area does not incur any additional
> performance overhead compared to other methods.[6]
>
> Certainly, the administrator can also modify the gather size through patch5.
>
> The formula for the time taken for system_heap buffer allocation and
> file reading through async_read is as follows:
>
>    T(total) = T(first gather page) + Max(T(remain alloc), T(I/O))
>
> Compared to the synchronous read:
>    T(total) = T(alloc) + T(I/O)
>
> If the allocation time or I/O time is long, the time difference will be
> covered by the maximum value between the allocation and I/O. The other
> party will be concealed.
>
> Therefore, the larger the size of the file that needs to be read, the
> greater the corresponding benefits will be.
>
> How to use
> ===
> Consider the current pathway for loading model files into DMA-BUF:
>    1. open dma-heap, get heap fd
>    2. open file, get file_fd(can't use O_DIRECT)
>    3. use file len to allocate dma-buf, get dma-buf fd
>    4. mmap dma-buf fd, get vaddr
>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>    6. share, attach, whatever you want
>
> Use DMA_HEAP_ALLOC_AND_READ_FILE JUST a little change:
>    1. open dma-heap, get heap fd
>    2. open file, get file_fd(buffer/direct)
>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag, set file_fd
>       instead of len. get dma-buf fd(contains file content)
>    4. share, attach, whatever you want
>
> So, test it is easy.
>
> How to test
> ===
> The performance comparison will be conducted for the following scenarios:
>    1. normal
>    2. udmabuf with [3] patch
>    3. sendfile
>    4. only patch 1
>    5. patch1 - patch4.
>
> normal:
>    1. open dma-heap, get heap fd
>    2. open file, get file_fd(can't use O_DIRECT)
>    3. use file len to allocate dma-buf, get dma-buf fd
>    4. mmap dma-buf fd, get vaddr
>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>    6. share, attach, whatever you want
>
> UDMA-BUF step:
>    1. memfd_create
>    2. open file(buffer/direct)
>    3. udmabuf create
>    4. mmap memfd
>    5. read file into memfd vaddr
>
> Sendfile step(need suit splice_write/write_iter, just use to compare):
>    1. open dma-heap, get heap fd
>    2. open file, get file_fd(buffer/direct)
>    3. use file len to allocate dma-buf, get dma-buf fd
>    4. sendfile file_fd to dma-buf fd
>    6. share, attach, whatever you want
>
> patch1/patch1-4:
>    1. open dma-heap, get heap fd
>    2. open file, get file_fd(buffer/direct)
>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag, set file_fd
>       instead of len. get dma-buf fd(contains file content)
>    4. share, attach, whatever you want
>
> You can create a file to test it. Compare the performance gap between the two.
> It is best to compare the differences in file size from KB to MB to GB.
>
> The following test data will compare the performance differences between 512KB,
> 8MB, 1GB, and 3GB under various scenarios.
>
> Performance Test
> ===
>    12G RAM phone
>    UFS4.0(the maximum speed is 4GB/s. ),
>    f2fs
>    kernel 6.1 with patch[7] (or else, can't support kvec direct I/O read.)
>    no memory pressure.
>    drop_cache is used for each test.
>
> The average of 5 test results:
> | scheme-size         | 512KB(ns)  | 8MB(ns)    | 1GB(ns)       | 3GB(ns)       |
> | ------------------- | ---------- | ---------- | ------------- | ------------- |
> | normal              | 2,790,861  | 14,535,784 | 1,520,790,492 | 3,332,438,754 |
> | udmabuf buffer I/O  | 1,704,046  | 11,313,476 | 821,348,000   | 2,108,419,923 |
> | sendfile buffer I/O | 3,261,261  | 12,112,292 | 1,565,939,938 | 3,062,052,984 |
> | patch1-4 buffer I/O | 2,064,538  | 10,771,474 | 986,338,800   | 2,187,570,861 |
> | sendfile direct I/O | 12,844,231 | 37,883,938 | 5,110,299,184 | 9,777,661,077 |
> | patch1 direct I/O   | 813,215    | 6,962,092  | 2,364,211,877 | 5,648,897,554 |
> | udmabuf direct I/O  | 1,289,554  | 8,968,138  | 921,480,784   | 2,158,305,738 |
> | patch1-4 direct I/O | 1,957,661  | 6,581,999  | 520,003,538   | 1,400,006,107 |
>
> So, based on the test results:
>
> When the file is large, the patchset has the highest performance.
> Compared to normal, patchset is a 50% improvement;
> Compared to normal, patch1 only showed a degradation of 41%.
> patch1 typical performance breakdown is as follows:
>    1. alloc cost 188,802,693 ns
>    2. vmap cost 42,491,385 ns
>    3. file read cost 4,180,876,702 ns
> Therefore, directly performing a single direct I/O read on a large file
> may not be the most optimal way for performance.
>
> The performance of direct I/O implemented by the sendfile method is the worst.
>
> When file size is small, The difference in performance is not
> significant. This is consistent with expectations.
>
>
>
> Suggested use cases
> ===
>    1. When there is a need to read large files and system resources are scarce,
>       especially when the size of memory is limited.(GB level) In this
>       scenario, using direct I/O for file reading can even bring performance
>       improvements.(may need patch2-3)
>    2. For embedded devices with limited RAM, using direct I/O can save system
>       resources and avoid unnecessary data copying. Therefore, even if the
>       performance is lower when read small file, it can still be used
>       effectively.
>    3. If there is sufficient memory, pinning the page cache of the model files
>       in memory and placing file in the EROFS file system for read-only access
>       maybe better.(EROFS do not support direct I/O)
>
>
> Changlog
> ===
>   v1 [8]
>   v1->v2:
>     Uses the heap flag method for alloc and read instead of adding a new
>     DMA-buf ioctl command. [9]
>     Split the patchset to facilitate review and test.
>       patch 1 implement alloc and read, offer heap flag into it.
>       patch 2-4 offer async read
>       patch 5 can change gather limit.
>
> Reference
> ===
> [1] https://lore.kernel.org/all/0393cf47-3fa2-4e32-8b3d-d5d5bdece298@amd.com/
> [2] https://lore.kernel.org/all/ZpTnzkdolpEwFbtu@phenom.ffwll.local/
> [3] https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
> [4] https://lore.kernel.org/all/Zpf5R7fRZZmEwVuR@infradead.org/
> [5] https://lore.kernel.org/all/ZpiHKY2pGiBuEq4z@infradead.org/
> [6] https://lore.kernel.org/all/9b70db2e-e562-4771-be6b-1fa8df19e356@amd.com/
> [7] https://patchew.org/linux/20230209102954.528942-1-dhowells@redhat.com/20230209102954.528942-7-dhowells@redhat.com/
> [8] https://lore.kernel.org/all/20240711074221.459589-1-link@vivo.com/
> [9] https://lore.kernel.org/all/5ccbe705-883c-4651-9e66-6b452c414c74@amd.com/
>
> Huan Yang (5):
>    dma-buf: heaps: Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>    dma-buf: heaps: Introduce async alloc read ops
>    dma-buf: heaps: support alloc async read file
>    dma-buf: heaps: system_heap alloc support async read
>    dma-buf: heaps: configurable async read gather limit
>
>   drivers/dma-buf/dma-heap.c          | 552 +++++++++++++++++++++++++++-
>   drivers/dma-buf/heaps/system_heap.c |  70 +++-
>   include/linux/dma-heap.h            |  53 ++-
>   include/uapi/linux/dma-heap.h       |  11 +-
>   4 files changed, 673 insertions(+), 13 deletions(-)
>
>
> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890

