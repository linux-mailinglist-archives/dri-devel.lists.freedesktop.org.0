Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774D988768D
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 03:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166FC10E377;
	Sat, 23 Mar 2024 02:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s5ahaKs4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2077.outbound.protection.outlook.com [40.107.100.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FCA10E155;
 Sat, 23 Mar 2024 02:02:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSic5HLf0GUbBs1J31h1aHA2ga1v1GQMRYWR5rfvXkEs0wy0Bje2+X9R8EZx6lRtXovApMSZBX0dy5kKHV0FlL2nVpL9/WjOXgvvQm6m2wX1wc2gP1Tq2VqJ/RTnG5OSyie6QjNoyUO51j2e96iam1q4QKe0dgwMMTXwpAGe8Zu1DAZx3r74MtIjbmnFpqDLiX+WrTer+jh9rde79ne2kXU5udKNA6AXHNCtpeTUOK9UQMVD626nZulTplvfkBDkLZ9KHE+ABCG0+ardMZIVPXLxsnNkZivTtaWfk85bvJfhkR7Qcl6Qk+da5R3HII2xWSwefGPhB7r6MWolKPJprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eR36tZXwzwx6uywzoQsR85Duq4GUtS5RjFGc0kDl74=;
 b=F20Fw2X93NdS9wngtUQ3BvxsIOQBsa/EuhaAiaHyLn61HWVOSnzrPKDZdx/qxqrwpfG1sYtVj8+3gq8bnTO9D/BnvgJCX0BSOmrIpoTBAS+40sqGHQqKS4e617RBF+yrNrEV02wF1lEk/4Hzdrpy1de+d09FjNmwwmegIsz2fXpf5uoommkpqnSt7K2eWvLOkxt4ZG388rvmEEnxR3KHFoCDQwaMRBN9LS3vvfpK6P7ZeOJP2wlPuetadg+19hKqMjY5Ew1IacD+sZXpBIprto7gqLKv/F0Occ4eEa8YzEbRKliD/5kcx31QEZ2WDPEw3zNMGPhxqIHLZkxD+tRGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eR36tZXwzwx6uywzoQsR85Duq4GUtS5RjFGc0kDl74=;
 b=s5ahaKs48rKdFZVR2qVUwQKYBDvV7lRaEgc1cytruq+II7TZkimXYma83O7UD/cSFG9SDAZRTtrfnShgrknEE5NrNRV3UtP+izNkG4fXH1IBEbvvB/7JiSRdcSdR+S3Rn4maZkUPku8m1UK5PfPrhgvydGZQ6GXGvMAaYIhlJ78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) by
 DS0PR12MB9424.namprd12.prod.outlook.com (2603:10b6:8:1b4::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.37; Sat, 23 Mar 2024 02:02:49 +0000
Received: from DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::f405:814f:a551:4b85]) by DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::f405:814f:a551:4b85%7]) with mapi id 15.20.7386.031; Sat, 23 Mar 2024
 02:02:49 +0000
Message-ID: <3b20f546-7883-459a-af9e-7d135f524497@amd.com>
Date: Fri, 22 Mar 2024 22:02:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Implement strict NUMA pool allocations
Content-Language: en-US
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "felix.kuehling@amd.com" <felix.kuehling@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Joe Greathouse <joseph.greathouse@amd.com>
References: <20240322070753.69324-1-rajneesh.bhardwaj@amd.com>
 <DS0PR11MB6424E8F84BC34DD6EBB6279DC1312@DS0PR11MB6424.namprd11.prod.outlook.com>
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
In-Reply-To: <DS0PR11MB6424E8F84BC34DD6EBB6279DC1312@DS0PR11MB6424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To DS7PR12MB5933.namprd12.prod.outlook.com
 (2603:10b6:8:7c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5933:EE_|DS0PR12MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 882dd5bb-1730-4978-a650-08dc4add5766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a8yHB8C4nkn+lx3yvBsogxJT22bereY8POTZBinKUooF95g+o3cLK4zY/Qehj1uWnXaH4fJn+TM0Um8eSsdFhl/gWla2ekKnowstDRZOkHPvgDJNYOrAd7LoRvMMFdipiOdxKMjRcvJhKBs1OLrL3B95Q3Dq4T6jyRJWKvi5sDpFzO1Ms5p1us2eoorZRwZcF8tIsR6Ju2KJvg8ItRwHdl49UARom6anAgDqU/Ref+WuUPpyEHJBKU+tvskxw2TdKXvBWiMkJVf3/MkXaME7NgFS5zQs9E6788EWXzINKERiVVnS+wl0cLAiH1BKI8JeHNpo/krX0RK/qYTjUOqpOgYcUowyM+jA27XGLLR8caC9cpnjzbe4+nU0HLjJmqVw4ROCY9vFJvMAkewe1UvAdgOZFYb9Rd5cxmuhxD3EQ+nNOQSZp8LOGAKqg98HvL2kx6oyds0Aj0Lnnskw511f9OuFSKqHytL+9+NZ0LztRWHHjAzQQ5tOahPZLmrKFC5M/MK2C+8cOIPJ40wkIDqEe23HT/doIF6lphcI5zchh7M/5OqBUwDHcPSzn8MKaes1iKqE9HcdQUeF1katXUpN+83HDOkURYIQF74ZU6LzLqyHO6//sjjKOBQV4kDwJ2V/q5mLfewkGOnvwJn2gsVuz4HMDsxBR285f+y/8zDGMA0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB5933.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym56VTZoS1JQZUZOYis2am1rdUFLb1pheFNiQm9DaFhhSWNtbUd0Z2N4TDJN?=
 =?utf-8?B?b2NPazEySEZ3R2ZKR1NZWitjVUNHQ3VJV0pVMC9JdGRQVmVSdzlEczdwQ3k0?=
 =?utf-8?B?bWExNC93cXo3MjRFcFNldGZkMk1YRHdGcE1zcGFFRENGZDNwVG1iVzFTaVhS?=
 =?utf-8?B?c1Q2dTNXY0REcjZQSzEzeDI1aC91ekVpOXZmREZGaFJCNWZHWXU4NjVBdXF1?=
 =?utf-8?B?eWhjam4yVGNrT21td0k0MUliUmtxOHpOTG1EQWtpbCt5VWZINjZiSVRKRmpZ?=
 =?utf-8?B?OW0yeVV1NTlXRmFabXJyTE5XSEQ2RmZxWDhnWWlLRkkrKzdUUVREek9XNjk5?=
 =?utf-8?B?QmxFQ2ZPQnNicTlYb1JEd2VpaVBOQ3lQVmplQksrL3gzeC9JdjZJMXFXdDUy?=
 =?utf-8?B?dG5JbnJVWkw3UFFHNTZzTXh6Vkd4T1dEb0ZjMlVGcm5aYnM4Z0hJZWlubU5I?=
 =?utf-8?B?czhkbDFkNXF4cnBvNDZvc1FSaFFuSmV4ZDA1RmkyQmpLYkd0Lzl0NWwrNUdE?=
 =?utf-8?B?VGxQSlJWRFZaam9LbzlRN1lXaWRmWjRFT0cwNkI1RDJHNGd2MncyWUJWWHV2?=
 =?utf-8?B?MlpRNFpyVEZlZU9ucEN1ajlWTCtvYlkwb3NoeTQwRXd0bDBLN0FzaDlWR3RT?=
 =?utf-8?B?SklPYUh2Y2oxZFhyd0dvZ2F3dW8zUGZrWEZLNE4xQkMxaWxZL2NROWJrOWNR?=
 =?utf-8?B?Vm5jT21zRXdFWFB1QTloaXV5Y0JvRmNoM1NneWxTZ2Y4NCtvRDVEbTNLdDQ2?=
 =?utf-8?B?OUFER0prOTZQdmJpZk1vc2VsMnhyQTZNVjRKc0g3TUVhcGVsU2RTamxMTzNC?=
 =?utf-8?B?MkNxa3Q1ekw4RE92aHFQRjJoMlRWdjh0SVhLOEtVUjNDdFU3ZG9MeDBPNnFZ?=
 =?utf-8?B?VUJMdUNRc1l5YTZ4ZndQUkthdFNsd2x3bVB4NmxCNCtWbjFxOTZ1VW9sSllr?=
 =?utf-8?B?NDBNYmtSb21HcVFJU1VIRXNRY0J3SUxnMHNTZFZVTXFqbkl5OTRUSnhhelhV?=
 =?utf-8?B?R1YwbCs2c011cWlnOG5TT3p4alE5SWlHc2xtY0duQ0txSDdCMUNpR3hBYitl?=
 =?utf-8?B?dEg5dkYzUmtBaFllMWdhTTlVZFRjL2dJaE9pRTJYdmVqNDVTZUhEcmlxZEhK?=
 =?utf-8?B?QUZGRzNuajR0L1YyQUxNMGMyK1RjdjV6c2VkTnBuUno4UjBodUI0OURBLzhZ?=
 =?utf-8?B?c09DdDh3ckRUWDJvdGprRUxuNjdNTHRidDFYVmVkZ05OOVQrdnk5bnNFVEs1?=
 =?utf-8?B?RlVrSTBWZW9LdFNTQWJYWDFya2hxak1jRlc2MWVidkpKMlRldFdtMTNNbis3?=
 =?utf-8?B?eDBaRVhwM3lTZ0xCSFBtM1FuMmsyQWI5SXRxRVc1VVJ4K1ovdDNEMnNWaVhF?=
 =?utf-8?B?bmx0b3hKY1UxTktKaUl3U01MelBmNWt2bnhsMitoQXdPMUhlYS8yMXBNc1px?=
 =?utf-8?B?QWhPOE5DZkY2anZNVjdvMFptOWJLUXFOSmdsazlYeFZJSmZiZVMrL3VYVXNL?=
 =?utf-8?B?UFdqOWhyNlJQeFdtOWZwS1ZrWWxPWG41R1BvVklucVdYS0x4MDVxSE1kRG1R?=
 =?utf-8?B?bmlnMlBoclAxRGJqRDBRK3YzeW9iYXpUN0dWSUNTRDJmdEpFRXY1cm5aV3cy?=
 =?utf-8?B?T1REWU1lNitJNEIra3Z4UDFYRWJKSTFxSzZHa1VDWURSV0VvMzJwSUFmRm1D?=
 =?utf-8?B?L1J1Q1ZrQjlBbkcxd0V0ZDhzU213ZTR3VnhBdXBwd2hRN3NPYXFTNlJYdHRh?=
 =?utf-8?B?N2VJS0toellsTk53dGd4TjFFdE1tR0RycldzQzlhbHFZZkcwaWVGeE5jQ0xX?=
 =?utf-8?B?cXo3SW1lc0szRmpSTW5IbmlkZXMydHFjOTk3a2FNeXVOQThXZlpzaEEwQ05o?=
 =?utf-8?B?dE93cHVjcjFFWkwrZ2RPbWJVdmV5ZmV6SjVLcXA5aHNBVjc0dXk1ZCtONG5S?=
 =?utf-8?B?MUF3VkpYeDljUitQRDc5S2p2cERrQy9IU2RhWWwwbStBVTcxeW44a1ZiZlVM?=
 =?utf-8?B?cVZrNHJuQnpqNzBjZUpCWFZuNUR0OFpjZ3VoaHM2RnY2RWdsVHVRNnEwS3Vv?=
 =?utf-8?B?WW8wNnQrVVhGMVRiVGVOYStIUnZldnN5Y3FNTlFTQnFoRHJoUCtvWjJDVTVu?=
 =?utf-8?Q?zAGdW3PVF3mNIkVF+vaU2gmls?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882dd5bb-1730-4978-a650-08dc4add5766
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5933.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2024 02:02:49.5267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6xL/ifu1KIJxmLdG8N6x08+DmFgUOlBq0vLsb2TFGTtHQeHB444JIP+gJiTdO52FCfkU8dHo8UezzRZ5a/fmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9424
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


On 3/22/2024 11:29 AM, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Rajneesh Bhardwaj
>> Sent: Friday, March 22, 2024 3:08 AM
>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: felix.kuehling@amd.com; alexander.deucher@amd.com;
>> christian.koenig@amd.com; Rajneesh Bhardwaj
>> <rajneesh.bhardwaj@amd.com>; Joe Greathouse
>> <joseph.greathouse@amd.com>
>> Subject: [PATCH] drm/ttm: Implement strict NUMA pool allocations
>>
>> This change allows TTM to be flexible to honor NUMA localized
>> allocations which can result in significant performance improvement on a
>> multi socket NUMA system. On GFXIP 9.4.3 based AMD APUs, we see
>> manyfold benefits of this change resulting not only in ~10% performance
>> improvement in certain benchmarks but also generating more consistent
>> and less sporadic results specially when the NUMA balancing is not
>> explecitely disabled. In certain scenarios, workloads show a run-to-run
>> variability e.g. HPL would show a ~10x performance drop after running
>> back to back 4-5 times and would recover later on a subsequent run. This
>> is seen with memory intensive other workloads too. It was seen that when
>> CPU caches were dropped e.g. sudo sysctl -w vm.drop_caches=1, the
>> variability reduced but the performance was still well below a good run.
>>
>> Use of __GFP_THISNODE flag ensures that during memory allocation, kernel
>> prioritizes memory allocations from the local or closest NUMA node
>> thereby reducing memory access latency. When memory is allocated using
>> __GFP_THISNODE flag, memory allocations will predominantly be done on
>> the local node, consequency, the shrinkers may priotitize reclaiming
>> memory from caches assocoated with local node to maintain memory
>> locality and minimize latency, thereby provide better shinker targeting.
>>
>> Reduced memory pressure on remote nodes, can also indirectly influence
>> shrinker behavior by potentially reducing the frequency and intensity of
>> memory reclamation operation on remote nodes and could provide improved
>> overall system performance.
>>
>> While this change could be more beneficial in general, i.e., without the
>> use of a module parameter, but in absence of widespread testing, limit
>> it to the AMD GFXIP 9.4.3 based ttm pool initializations only.
>>
>>
>> Cc: Joe Greathouse <joseph.greathouse@amd.com>
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>> ---
>> drivers/gpu/drm/amd/amdgpu/amdgpu.h       |  1 +
>> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c   |  8 ++++++++
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c   |  7 ++++++-
>> drivers/gpu/drm/ttm/tests/ttm_pool_test.c | 10 +++++-----
>> drivers/gpu/drm/ttm/ttm_device.c          |  2 +-
>> drivers/gpu/drm/ttm/ttm_pool.c            |  7 ++++++-
>> include/drm/ttm/ttm_pool.h                |  4 +++-
>> 7 files changed, 30 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 9c62552bec34..96532cfc6230 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -253,6 +253,7 @@ extern int amdgpu_user_partt_mode;
>> extern int amdgpu_agp;
>>
>> extern int amdgpu_wbrf;
>> +extern bool strict_numa_alloc;
>>
>> #define AMDGPU_VM_MAX_NUM_CTX			4096
>> #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 80b9642f2bc4..a183a6b4493d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -781,6 +781,14 @@ int queue_preemption_timeout_ms = 9000;
>> module_param(queue_preemption_timeout_ms, int, 0644);
>> MODULE_PARM_DESC(queue_preemption_timeout_ms, "queue preemption
>> timeout in ms (1 = Minimum, 9000 = default)");
>>
>> +/**
>> + * DOC: strict_numa_alloc(bool)
>> + * Policy to force NUMA allocation requests from the proximity NUMA domain
>> only.
>> + */
>> +bool strict_numa_alloc;
>> +module_param(strict_numa_alloc, bool, 0444);
>> +MODULE_PARM_DESC(strict_numa_alloc, "Force NUMA allocation requests
>> to be satisfied from the closest node only (false = default)");
>> +
>> /**
>>   * DOC: debug_evictions(bool)
>>   * Enable extra debug messages to help determine the cause of evictions
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index b0ed10f4de60..a9f78f85e28c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1768,6 +1768,7 @@ static int amdgpu_ttm_reserve_tmr(struct
>> amdgpu_device *adev)
>>
>> static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
>> {
>> +	bool policy = true;
>> 	int i;
>>
>> 	if (!adev->gmc.is_app_apu || !adev->gmc.num_mem_partitions)
>> @@ -1779,11 +1780,15 @@ static int amdgpu_ttm_pools_init(struct
>> amdgpu_device *adev)
>> 	if (!adev->mman.ttm_pools)
>> 		return -ENOMEM;
>>
>> +	/* Policy not only depends on the module param but also on the ASIC
>> +	 * setting use_strict_numa_alloc as well.
>> +	 */
>> 	for (i = 0; i < adev->gmc.num_mem_partitions; i++) {
>> 		ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
>> 			      adev->gmc.mem_partitions[i].numa.node,
>> -			      false, false);
>> +			      false, false, policy && strict_numa_alloc);
> why not just 'strict_numa_alloc'?
>
> Is 'policy' used somewhere else?  Not sure this adds clarity...


Thanks Mike for the feedback. I could remove this, just wasn't sure 
about the initial reaction, so just kept the switch off by default so 
keep minimum impact outside of where we want this.


>
>> 	}
>> +
>> 	return 0;
>> }
>>
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> index 2d9cae8cd984..6ff47aac570a 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> @@ -87,7 +87,7 @@ static struct ttm_pool *ttm_pool_pre_populated(struct
>> kunit *test,
>> 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>> 	KUNIT_ASSERT_NOT_NULL(test, pool);
>>
>> -	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
>> +	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
> Is this really an acceptable interface (three non-named Booleans in a row)?
>
> I have no idea what "true, false, false" means.
>
> Would having a "flags" parameter and then
>
> USE_DMA_ALLOC 	BIT(0)
> USE_DMA32		BIT(1)
> USE_STRICT_NUMA	BIT(2)
>
> Make this more readable?


I agree, I just followed the existing convention. If this patch gets 
moving, I could send a follow-up patch to cleanup and document a little bit.

>
> Or define your Booleans:
>
> USE_DMA_ALLOC 	true
> USE_DMA32		true
> USE_STRICT_NUMA	true
>
> NO_DMA_ALLOC	false
> NO_DMA32		false
> NO_STRICT_NUMA	false
>
> So at a minimum, we might know what these parameters are?
>
> What is the relationship between this feature and the nid value?
>
> Is this value used for the allocations?
>
> If this is not NUMA_NO_NODE, would this do the same thing?
> (or is the STRICT flag the only way?)
>
> Just some thoughts,
>
> Mike
>
>> 	err = ttm_pool_alloc(pool, tt, &simple_ctx);
>> 	KUNIT_ASSERT_EQ(test, err, 0);
>> @@ -152,7 +152,7 @@ static void ttm_pool_alloc_basic(struct kunit *test)
>> 	KUNIT_ASSERT_NOT_NULL(test, pool);
>>
>> 	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, params-
>>> use_dma_alloc,
>> -		      false);
>> +		      false, false);
>>
>> 	KUNIT_ASSERT_PTR_EQ(test, pool->dev, devs->dev);
>> 	KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
>> @@ -219,7 +219,7 @@ static void ttm_pool_alloc_basic_dma_addr(struct
>> kunit *test)
>> 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>> 	KUNIT_ASSERT_NOT_NULL(test, pool);
>>
>> -	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
>> +	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
>>
>> 	err = ttm_pool_alloc(pool, tt, &simple_ctx);
>> 	KUNIT_ASSERT_EQ(test, err, 0);
>> @@ -349,7 +349,7 @@ static void ttm_pool_free_dma_alloc(struct kunit
>> *test)
>> 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>> 	KUNIT_ASSERT_NOT_NULL(test, pool);
>>
>> -	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
>> +	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
>> 	ttm_pool_alloc(pool, tt, &simple_ctx);
>>
>> 	pt = &pool->caching[caching].orders[order];
>> @@ -380,7 +380,7 @@ static void ttm_pool_free_no_dma_alloc(struct kunit
>> *test)
>> 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>> 	KUNIT_ASSERT_NOT_NULL(test, pool);
>>
>> -	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false);
>> +	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false, false);
>> 	ttm_pool_alloc(pool, tt, &simple_ctx);
>>
>> 	pt = &pool->caching[caching].orders[order];
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index f5187b384ae9..540e8a44f015 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -215,7 +215,7 @@ int ttm_device_init(struct ttm_device *bdev, const
>> struct ttm_device_funcs *func
>>
>> 	ttm_sys_man_init(bdev);
>>
>> -	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc,
>> use_dma32);
>> +	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc,
>> use_dma32, false);
>>
>> 	bdev->vma_manager = vma_manager;
>> 	spin_lock_init(&bdev->lru_lock);
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>> b/drivers/gpu/drm/ttm/ttm_pool.c
>> index dbc96984d331..73aafd06c361 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -447,6 +447,9 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct
>> ttm_tt *tt,
>> 	else
>> 		gfp_flags |= GFP_HIGHUSER;
>>
>> +	if (pool->use_strict_numa_alloc)
>> +		gfp_flags |= __GFP_THISNODE;
>> +
>> 	for (order = min_t(unsigned int, MAX_ORDER, __fls(num_pages));
>> 	     num_pages;
>> 	     order = min_t(unsigned int, order, __fls(num_pages))) {
>> @@ -555,7 +558,8 @@ EXPORT_SYMBOL(ttm_pool_free);
>>   * Initialize the pool and its pool types.
>>   */
>> void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>> -		   int nid, bool use_dma_alloc, bool use_dma32)
>> +		   int nid, bool use_dma_alloc, bool use_dma32,
>> +		   bool use_strict_numa_alloc)
>> {
>> 	unsigned int i, j;
>>
>> @@ -565,6 +569,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct
>> device *dev,
>> 	pool->nid = nid;
>> 	pool->use_dma_alloc = use_dma_alloc;
>> 	pool->use_dma32 = use_dma32;
>> +	pool->use_strict_numa_alloc = use_strict_numa_alloc;
>>
>> 	if (use_dma_alloc || nid != NUMA_NO_NODE) {
>> 		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
>> index 30a347e5aa11..6b7bdc952466 100644
>> --- a/include/drm/ttm/ttm_pool.h
>> +++ b/include/drm/ttm/ttm_pool.h
>> @@ -72,6 +72,7 @@ struct ttm_pool {
>>
>> 	bool use_dma_alloc;
>> 	bool use_dma32;
>> +	bool use_strict_numa_alloc;
>>
>> 	struct {
>> 		struct ttm_pool_type orders[MAX_ORDER + 1];
>> @@ -83,7 +84,8 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt
>> *tt,
>> void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
>>
>> void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>> -		   int nid, bool use_dma_alloc, bool use_dma32);
>> +		   int nid, bool use_dma_alloc, bool use_dma32,
>> +		   bool use_strict_numa_alloc);
>> void ttm_pool_fini(struct ttm_pool *pool);
>>
>> int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>> --
>> 2.34.1
