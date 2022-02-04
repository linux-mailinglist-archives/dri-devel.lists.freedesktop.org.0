Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED3B4A9CEB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 17:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1B610E5A1;
	Fri,  4 Feb 2022 16:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B51E10E5A1;
 Fri,  4 Feb 2022 16:25:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhX1ybJW/heqwakzJlcqH++tK1yNMZpSJtfigX7+Nd7SvKkQKwrsGnYfa865ooUR1tlXlHhkIPU4Wxtp9fYyseLN05faOhqxFw5NwYM3mutl3iiiEk9g3cE/urTBIGuC98Ei88cDF3ZgVm1JvHG5jqYPrCYftCBwjrLYDL2J7eLcVW8gyHXWl2G1vBxhMWlWJQrGCxUVEuYJNM9W7/OQKGcAoB9PT2GTd2Kfv61x89P3AneaCdNzK/rCo6pW/WCvYf7Vbb+n4Ia1uFkbQgtiAOQH8vkacgGmNsA0JM7nNjAFHP24LvdonImyxpnTlAuXtxWgZMxGZgvLooUy22krWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdYjLck45q12hqViQENMpfMrK5C1zMUwL8eAp3QEYr0=;
 b=J9EaMYi6lOdYWr0+Jwk2QliwqIqrBbF0NRko1E70b8CC4N6XHoR8R6LzsTv1PlzBiHeco4zAtvL02FNMq5VNh6sFwrRX0ZmTruIUjNJl47XglwbYhgAF3aZQgZG0OZYJCd1DWgOTdTEhCPvaRlkGCZWHkLkJ17cleZLmt7RGpiifHSOp/6WO87XNs3atTynY6LaVVEx6ykMnX/T5BMXfbLOLnB4pW0mccv+lKpWM1MVOTOPzdc3LiPfP1ihqE9pz3mvXs6MxsK8GXilrubTxwo8aGVTgEZmtkzk3hgpczs90fckBI3SEOZ189iNOS7UPITLkEoj4HsFPI77VmBG26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdYjLck45q12hqViQENMpfMrK5C1zMUwL8eAp3QEYr0=;
 b=cjMuOCtDb/bAl6qtLEHF5VqMBkM8BSpWbGXx1cSCylLrKo1J5LrPeEFdjqLiyk5/qyhQmyO0r7q45NDwuRpSYdLng4ucu+GYfi0Kh60MqS1eI0eYopoaWmiORSTXJ6t8zLgu8qzwiI0t0LpEs0pxjCd7cGLM/biwxbFAOPtJSD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR12MB1415.namprd12.prod.outlook.com (2603:10b6:903:43::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Fri, 4 Feb
 2022 16:25:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 16:25:26 +0000
Message-ID: <54b1c542-cef1-975b-0749-b30f3d5b2a15@amd.com>
Date: Fri, 4 Feb 2022 17:25:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: Fix recursive locking warning
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220204031139.24717-1-rajneesh.bhardwaj@amd.com>
 <c76050e6-6bbc-bccc-01df-1825ecd29387@amd.com>
 <ee0add19-530f-a289-4c91-4d4b2969a084@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ee0add19-530f-a289-4c91-4d4b2969a084@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0184.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcb67e70-61f7-444f-3363-08d9e7faf337
X-MS-TrafficTypeDiagnostic: CY4PR12MB1415:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB14158F4D8528BD468F30AF0C83299@CY4PR12MB1415.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iqR5RwtZk89THKyoBCrmexCUhBhofiDS/2D4XNgcv1hWA4Z/VRkBVDKe1sZpW8yGK08X9OXSXGKqOh4rkIACsRzEPMW7Om5hYvvI9Y27rvH2YB9UupZkq/wd5mChkWBUKkH5MvhsNxSsXsfnIG+OIFPF5prmhM0RTQlPOxP7z4QMgHDTq7+L2c6MMyfhgDSWRdJWaEVQOmKukXTrVIUmHV6i78DGkKeFGSYWaZOislZH4K9jB0HfklefN3C+H0l5YMeBVFVB5FOXLENVPf52h9iMrA6mWm/RJ/723zoY7/XN4Z2mJuESwzf78q2n/VP+Im56aDJCCwrFftb6olEUT+LGop6WAPrEPgyWR9BFIJxY+GCLFoq0NANJhAZQehpmT4eax44Wj0eTN4lRhPTVE78KjkdSAlLbIqPxu3OZRtDosiR7RTfrMd5SBfnBYlS731Vhy4jlWmRQWb779loJBDLNkJBjqslh+d+Mfj5CzmDtYYkSwb0ISD99sTgeXCepflol3bXjVdDNSf64BeotDfSgDfYkQZzZJ13CsBaIQuUBzMftTpM4PgbbIVbMxo1uHwbgYywjehDGzIHbHQrJ0Tatlkd+5Y2wlB0/1wnVBFA/InqjzGAByLsWG1eDUazn988boc7ibGkB35PsgeWVoGXPdv5Jz4qefx/Ymw4cYtcDUSDvnA/Fwzr2tN9hr9urfLqJPhSagEK6UACfQ926KyUh3tNJl1PpgOoVUp5H2tQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(2616005)(66476007)(83380400001)(31686004)(316002)(110136005)(66556008)(6506007)(6512007)(6666004)(31696002)(8676002)(4326008)(2906002)(186003)(8936002)(450100002)(66946007)(36756003)(6486002)(508600001)(66574015)(38100700002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHhMSm9xOTlUZnRwZ3ZZVUFWdm1qdjFwMkthVEd5Y2pYa3JZUlJFSkMxZVNu?=
 =?utf-8?B?Szk4OTVIY2pDMmZXb0l6d2tEOTZmanNQK3grcDRjdEZrVU1UR0xnRmI4TTJC?=
 =?utf-8?B?QUJSQW5OVGVhaTdVZW1CN081c3UyZTRoRjFOVWtITFNnUVZFRWFwU3VrVHRi?=
 =?utf-8?B?WGE1VGNlTUhYZ1NvZVY0aEhidE1vb3BESVJEbzdJSWxxSUNPTEthT3pkM2dE?=
 =?utf-8?B?RTRKTkk4WEtyZmZ1Tkk5dHN5aHdPMXlMY0paU2NnTkNydUtHNisyakJ4TTQw?=
 =?utf-8?B?d24ySk5pc3p5cVpoakhhRzJ0d2dEc0VJT1RUOVoyQ1NYaTQzVFAyVnJuRFR5?=
 =?utf-8?B?aTFERFNEcC9BS3F5RDhFSTZCYjJncXdhaGwxV3M2eFJIcGNValZXZi8vT05W?=
 =?utf-8?B?QzRyRmtnSndQNGdKdFkyZ2thdHdiSWJjV3Nxd0g2Mng4K2prL3ZuZ2FFNzUw?=
 =?utf-8?B?Wkx3ZmlLSUo2KzNXT09hSDQ3TkhCYkgvRGNwQ29LbkhLc2NHK0tuM085S1lr?=
 =?utf-8?B?NkhqS29LOEZFNk0rcGI3cUFoQ2U3akVuRUF5WDhlUlowTEthaTdwU0lnS3Nk?=
 =?utf-8?B?cndmcnNQUGRMVmlzWldjS040a01ZaUhTUW9SUURBQlJkQjU4Z2N2WGtZTHlq?=
 =?utf-8?B?Vmgxc2VtTDU1SEpSQXlEWU96Z3JIcTlwV2pTa0VRaklZOGtRalJyYWZtd0k2?=
 =?utf-8?B?QmtWWWsxME9ZZkxYUUxHMVdMNkdhTThGYi96UHNpU3BhV1lZM2RxMm5EZE9j?=
 =?utf-8?B?ZWNkQ1FRYW16dk9XcHhPdzVJdWZjeWZ5dmxvYTNpQjlLMkFJSTNleHFyamo2?=
 =?utf-8?B?dmtIdk0vWkJHV0lxUlhnYVh4SWhrc2FDZi8ra3k3bkNkQzhwVmVRYW5CMHJ1?=
 =?utf-8?B?VnVvUFRDVDlFTEhmRUY3SWtOWkVCcDJvTGlRUkFKMlIxUGFzbG1lcW5kMzJp?=
 =?utf-8?B?R3lRQ2VlcUJaUkcvenorZGF4R1E0ckhZdjNrTmd3Z2QwK2ljQnAwVlFSSGJE?=
 =?utf-8?B?NmtOOTVPeXFwdlN3RDhhL3IwaFpHZ2w4bWZrblN2SEduZFZ4djE1NU5FVGhu?=
 =?utf-8?B?QWVpNmticDlFVnoweTJoN2ppbFZLWFhWbTlFV3VqYXhCNmM3YkMvNXhIUHY5?=
 =?utf-8?B?UnRnVXBMK1lML2FwRHNTZXQ4Mll0Y0ltVjRUMk5uTk1TamlldFBybVhJYUNj?=
 =?utf-8?B?aTZrY2t5cGlBWGNtYmc3ZnRrVGZnTGF4MXdPbzhDMjRKTXJqR1lmVktMMThL?=
 =?utf-8?B?NDNBdWpwcTZOZlNlcWxhZ3piQ0FGM29JZVk4TmRiWkFWem5EUEYzaEltU2FI?=
 =?utf-8?B?dXlYelJaYWgwRDdpK2xKUVBNQW9vVldzM1U3SGJpWittOG84SXhva2Fub0VE?=
 =?utf-8?B?SGdiNEl0R3N2cTY4bVRnNk0zWmszU2JDcUhrRW44V0R6TVYxRmc4bU80dWtJ?=
 =?utf-8?B?ckNvTGl0eHkxZ3Z1MnZmRHczNE1GZFd0MUhMZFNzelpXUjFYTVRZYXpmZVht?=
 =?utf-8?B?SWttb2YrQytBRHljQTFnQXlmUDFGT0JpUDBHUUZJbmNRcDFqam5pWjY2VWpl?=
 =?utf-8?B?Q0s5VVBabm9BV3AvRUtVV2VGVkpmSjY1bXRJMmNOWWRmcEJIM1RDbmtMVXZ0?=
 =?utf-8?B?R20yVjg2ck1NOXdzZTJpeFRRSHlDMHU2VGFGQit3Z0lJS29SbTZ2OURXRUI5?=
 =?utf-8?B?ejVBYXo1b25SWDJRQXRrV1dmTEduQkYxeVlrTG1ua0FnTGRZaGdIUEpKVEhY?=
 =?utf-8?B?Lzd6MnhzbVhobEVBV2lkdkNzRXJMMjIrM0dFQ2t5RzlEYXdQOEtkVnI2SmhL?=
 =?utf-8?B?ckJrRnJpbnhyU3d4em1LU1dJUHlLRlZpMXRndy93RnBPN3AzUXJ3MlA1UFhM?=
 =?utf-8?B?TWw3TmpKZ3FoRm1JLzZXZlJVbTNTNlBpWUsyaXJTWlB4S1MyUWlpVXdSS0J5?=
 =?utf-8?B?RHdrUUt5VmJ4US9hbDgvRVVPU0lSUUY0UWdKemR4am9ndmZVSnlqVy9PNkJv?=
 =?utf-8?B?d2hCdTJWWlp6T0RPRFJlQ0piOGtRV3pUTWpmb0pXdGEzMTVNV3ZiZmgzalJ5?=
 =?utf-8?B?dmc4ODJiMWdaUlBYMW82QkJjeUs5eElSZ1F0V3ZxMzhacDNQTE1hUHR6Wkl4?=
 =?utf-8?B?SkVFaGVZeUg3YUlob3VTbWNnaHBtRld6QzBONngyRXZhZ1dVK3RHQ2FjVlg0?=
 =?utf-8?Q?nTszXbvIHV+l6AdJtbkb7nY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb67e70-61f7-444f-3363-08d9e7faf337
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 16:25:26.1863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUFlIDj0/6NvPSYHpnuXO5O1RVt4BobBNC5RpJBdhUp43cl7xtdG7e/KIotnxEYi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1415
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.02.22 um 17:23 schrieb Felix Kuehling:
>
> Am 2022-02-04 um 02:13 schrieb Christian König:
>> Am 04.02.22 um 04:11 schrieb Rajneesh Bhardwaj:
>>> Noticed the below warning while running a pytorch workload on vega10
>>> GPUs. Change to trylock to avoid conflicts with already held 
>>> reservation
>>> locks.
>>>
>>> [  +0.000003] WARNING: possible recursive locking detected
>>> [  +0.000003] 5.13.0-kfd-rajneesh #1030 Not tainted
>>> [  +0.000004] --------------------------------------------
>>> [  +0.000002] python/4822 is trying to acquire lock:
>>> [  +0.000004] ffff932cd9a259f8 
>>> (reservation_ww_class_mutex){+.+.}-{3:3},
>>> at: amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
>>> [  +0.000203]
>>>                but task is already holding lock:
>>> [  +0.000003] ffff932cbb7181f8 
>>> (reservation_ww_class_mutex){+.+.}-{3:3},
>>> at: ttm_eu_reserve_buffers+0x270/0x470 [ttm]
>>> [  +0.000017]
>>>                other info that might help us debug this:
>>> [  +0.000002]  Possible unsafe locking scenario:
>>>
>>> [  +0.000003]        CPU0
>>> [  +0.000002]        ----
>>> [  +0.000002]   lock(reservation_ww_class_mutex);
>>> [  +0.000004]   lock(reservation_ww_class_mutex);
>>> [  +0.000003]
>>>                 *** DEADLOCK ***
>>>
>>> [  +0.000002]  May be due to missing lock nesting notation
>>>
>>> [  +0.000003] 7 locks held by python/4822:
>>> [  +0.000003]  #0: ffff932c4ac028d0 (&process->mutex){+.+.}-{3:3}, at:
>>> kfd_ioctl_map_memory_to_gpu+0x10b/0x320 [amdgpu]
>>> [  +0.000232]  #1: ffff932c55e830a8 (&info->lock#2){+.+.}-{3:3}, at:
>>> amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0x64/0xf60 [amdgpu]
>>> [  +0.000241]  #2: ffff932cc45b5e68 (&(*mem)->lock){+.+.}-{3:3}, at:
>>> amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0xdf/0xf60 [amdgpu]
>>> [  +0.000236]  #3: ffffb2b35606fd28
>>> (reservation_ww_class_acquire){+.+.}-{0:0}, at:
>>> amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0x232/0xf60 [amdgpu]
>>> [  +0.000235]  #4: ffff932cbb7181f8
>>> (reservation_ww_class_mutex){+.+.}-{3:3}, at:
>>> ttm_eu_reserve_buffers+0x270/0x470 [ttm]
>>> [  +0.000015]  #5: ffffffffc045f700 (*(sspp++)){....}-{0:0}, at:
>>> drm_dev_enter+0x5/0xa0 [drm]
>>> [  +0.000038]  #6: ffff932c52da7078 (&vm->eviction_lock){+.+.}-{3:3},
>>> at: amdgpu_vm_bo_update_mapping+0xd5/0x4f0 [amdgpu]
>>> [  +0.000195]
>>>                stack backtrace:
>>> [  +0.000003] CPU: 11 PID: 4822 Comm: python Not tainted
>>> 5.13.0-kfd-rajneesh #1030
>>> [  +0.000005] Hardware name: GIGABYTE MZ01-CE0-00/MZ01-CE0-00, BIOS F02
>>> 08/29/2018
>>> [  +0.000003] Call Trace:
>>> [  +0.000003]  dump_stack+0x6d/0x89
>>> [  +0.000010]  __lock_acquire+0xb93/0x1a90
>>> [  +0.000009]  lock_acquire+0x25d/0x2d0
>>> [  +0.000005]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
>>> [  +0.000184]  ? lock_is_held_type+0xa2/0x110
>>> [  +0.000006]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
>>> [  +0.000184]  __ww_mutex_lock.constprop.17+0xca/0x1060
>>> [  +0.000007]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
>>> [  +0.000183]  ? lock_release+0x13f/0x270
>>> [  +0.000005]  ? lock_is_held_type+0xa2/0x110
>>> [  +0.000006]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
>>> [  +0.000183]  amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
>>> [  +0.000185]  ttm_bo_release+0x4c6/0x580 [ttm]
>>> [  +0.000010]  amdgpu_bo_unref+0x1a/0x30 [amdgpu]
>>> [  +0.000183]  amdgpu_vm_free_table+0x76/0xa0 [amdgpu]
>>> [  +0.000189]  amdgpu_vm_free_pts+0xb8/0xf0 [amdgpu]
>>> [  +0.000189]  amdgpu_vm_update_ptes+0x411/0x770 [amdgpu]
>>> [  +0.000191]  amdgpu_vm_bo_update_mapping+0x324/0x4f0 [amdgpu]
>>> [  +0.000191]  amdgpu_vm_bo_update+0x251/0x610 [amdgpu]
>>> [  +0.000191]  update_gpuvm_pte+0xcc/0x290 [amdgpu]
>>> [  +0.000229]  ? amdgpu_vm_bo_map+0xd7/0x130 [amdgpu]
>>> [  +0.000190] amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0x912/0xf60
>>> [amdgpu]
>>> [  +0.000234]  kfd_ioctl_map_memory_to_gpu+0x182/0x320 [amdgpu]
>>> [  +0.000218]  kfd_ioctl+0x2b9/0x600 [amdgpu]
>>> [  +0.000216]  ? kfd_ioctl_unmap_memory_from_gpu+0x270/0x270 [amdgpu]
>>> [  +0.000216]  ? lock_release+0x13f/0x270
>>> [  +0.000006]  ? __fget_files+0x107/0x1e0
>>> [  +0.000007]  __x64_sys_ioctl+0x8b/0xd0
>>> [  +0.000007]  do_syscall_64+0x36/0x70
>>> [  +0.000004]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>>> [  +0.000007] RIP: 0033:0x7fbff90a7317
>>> [  +0.000004] Code: b3 66 90 48 8b 05 71 4b 2d 00 64 c7 00 26 00 00 00
>>> 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
>>> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 41 4b 2d 00 f7 d8 64 89 01 48
>>> [  +0.000005] RSP: 002b:00007fbe301fe648 EFLAGS: 00000246 ORIG_RAX:
>>> 0000000000000010
>>> [  +0.000006] RAX: ffffffffffffffda RBX: 00007fbcc402d820 RCX:
>>> 00007fbff90a7317
>>> [  +0.000003] RDX: 00007fbe301fe690 RSI: 00000000c0184b18 RDI:
>>> 0000000000000004
>>> [  +0.000003] RBP: 00007fbe301fe690 R08: 0000000000000000 R09:
>>> 00007fbcc402d880
>>> [  +0.000003] R10: 0000000002001000 R11: 0000000000000246 R12:
>>> 00000000c0184b18
>>> [  +0.000003] R13: 0000000000000004 R14: 00007fbf689593a0 R15:
>>> 00007fbcc402d820
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>>> Cc: Alex Deucher <Alexander.Deucher@amd.com>
>>>
>>> Fixes: 627b92ef9d7c ("drm/amdgpu: Wipe all VRAM on free when RAS is
>>> enabled")
>>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>>
>> The fixes tag is not necessarily correct, I would remove that.
>>
>> But apart from that the patch is Reviewed-by: Christian König 
>> <christian.koenig@amd.com>.
>
> I suggested the Fixes tag since it was my patch that introduced the 
> problem. Without my patch, page table BOs wouldn't be cleared here, 
> and it wouldn't get that recursive lock warning.

Yeah, but the problem existed before that. E.g. it can happen that we 
drop the last reference during validation as well.

So this is valuable to backport even without your patch.

Regards,
Christian.

>
> Either way, the patch is also
>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>
>
>>
>> Thanks,
>> Christian.
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> index 36bb41b027ec..6ccd2be685f5 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> @@ -1306,7 +1306,8 @@ void amdgpu_bo_release_notify(struct 
>>> ttm_buffer_object *bo)
>>>           !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
>>>           return;
>>>   -    dma_resv_lock(bo->base.resv, NULL);
>>> +    if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
>>> +        return;
>>>         r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, 
>>> &fence);
>>>       if (!WARN_ON(r)) {
>>

