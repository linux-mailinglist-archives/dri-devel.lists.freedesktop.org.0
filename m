Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D5BBD80E
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 11:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6C410E3CC;
	Mon,  6 Oct 2025 09:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CzX+pVIX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012002.outbound.protection.outlook.com [40.107.209.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8658710E3CC;
 Mon,  6 Oct 2025 09:49:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPucBPg1wXwWyGht+YKmz+ixQE756m59SGmIZ6GTRAWCimES5J195tnV4gzhrlc9JFGM12f3MTzloYcfx7KffItBXjlSFBx/OMS558/NwbLc1cFYoPucBXHysOz9bQq7hqTJ0SIOILfy4b87du2mVa+FKPPB3WDnjSOg+fePBeBsXshsIagD7rUlzVTtvaVZVScg9acvVTzuo2ZhxF447+M5Np+GGnSK0tyK8tWmYdNhPxsZqG6Tc6UyJXQKhdHM4BSJ6Pi/p+0hzucRImphtV0iDZPzQN93vb+D1fR4jJP+Z9tW69BpPGU338Hws2wls2vZx1Km5O3iHV+Fo8Xz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdXNs4fN6lAajxJtcWwGLZr6rw2wVSYG+tZodzyCRrM=;
 b=tup9dtic9aUvgFDj/iuAN1nXU9kT7MpQG6jC7J9rgvAYe0Um5fDhKeNybsfBYdRIQcOwEhLDp014arFzGqcdsRZUmQ8DzwwzLMjxDlrGnRy87hHclfIZ3xd/5oH6hriUYYhyQbRHNtCVxmP713IzLImwMbwIuH1vkzotG87Ppi7KDQbnEchfjszLNG5gbGytgIq+VmhAugIkw+qns7hfs3yMKvQMW41A+GBvJehe+HqlJ5kgx5FDcoEC/QL9ImoPzKmDPPMlol1xajNM2ODIGW3K2lsifJyslvd6c+WRgzLdTnnITJowcFefSsKnVKEhhRS5qVwnQQtaQHcARamI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdXNs4fN6lAajxJtcWwGLZr6rw2wVSYG+tZodzyCRrM=;
 b=CzX+pVIX0CG4FR0+Hu2AC03r+StHTjSOCkphJI4rS/dzrHsdHH2PC3Bvl8eUTF979udHHixHe2b+JpBoC1zLRvBV0PKxHAQ4NTa0S8dIjTlWnZql1HdmjETTFetCBhxmpaCJ2qbcvKwuvkAwLNtOhtw+dWe+eivwN8gCZybw3KU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8272.namprd12.prod.outlook.com (2603:10b6:8:fc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Mon, 6 Oct 2025 09:49:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 09:49:45 +0000
Message-ID: <dddd1c34-94ba-487f-ba0b-14e10410dd12@amd.com>
Date: Mon, 6 Oct 2025 11:49:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 4/5] drm/ttm: Allow drivers to specify maximum beneficial
 TTM pool size
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
References: <20251003135836.41116-1-tvrtko.ursulin@igalia.com>
 <20251003135836.41116-5-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251003135836.41116-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:208:c0::41) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: d3aea18e-c0aa-4ede-8d5d-08de04bdadec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OG1tSmw2UDIxZEVpZjR6cXRCK2hWd2YwV0NRTUFEV3ZIZVErelJnQzB0NXJN?=
 =?utf-8?B?c1p2YUVIQ05QZ3RXbmZlTFN4cmozNHFjYy8zSm54SGphWXVVM1B6M2dvV1dx?=
 =?utf-8?B?b2FENVRMNlZKZ1JVV21rdDhqZUtHWm5qNlVuUnVTTmxTejlaL2xJcE1oM3dz?=
 =?utf-8?B?dlZleEVRWHlYbFd1bmplR2gydWc2eDRVamgxS3JVTFF0TzZBVExHZm5RMXBO?=
 =?utf-8?B?eHQ5QXQrMXgwTjRvU0ZWZ2RWb1I4WjJmaHdDZ3hBZldUS0hseTFOVmdrUUVF?=
 =?utf-8?B?MFNSVFBYdHRzRy93MFBvNUo5TG1xZWIvYmR6RlcwSTJXL0U2N1JrUXQ3Qkt0?=
 =?utf-8?B?YnN5Y3VJMG5Rd0tlOUVqcjIxNlBCRklTaHFPcmlVYU9Gb2Q0RFpWSjhpU3FG?=
 =?utf-8?B?VndCdjNQancxTlBXMzdjcGlDY0N6YWY5UHNxUVV4SktSbC80d3dPYlVod1dk?=
 =?utf-8?B?VElod0NxREYwSzlOTlVMVXNzVHRORUZ5VjAwUEh3Rks1WVpHOXYwUlVDU1g0?=
 =?utf-8?B?dzUwQ3lFdTk0MnN4dkI2ZmZBNHVzRFlOcW94MkdNcDIrY3hoQ0R5QlBnb3Uy?=
 =?utf-8?B?TGJ2QWJZVjJIbWp3dVhPV3RIVkhmQVdCRkFoZTJ5TDRIdDlBTnpOd0NaVUJ1?=
 =?utf-8?B?b0IrRHRPWFpqV1ZDQU1CVkQyZFRuR3dPdWhET1BiL2J2ZE1PeTVUb2R1QWVy?=
 =?utf-8?B?a0FPOHg1aHpWWWJ5aWdvaVI2ZE5HcXF0WW1JNy9LRWl4VHhFbHpJSmJKMys3?=
 =?utf-8?B?Zmhjc0dDdXVobHhiTW9WSlVoVW9vN0Q5Z25UbWtCcG9EU2VaYkdMWFN5Yy9q?=
 =?utf-8?B?WjdKTE4xKzdzWkl2SElaUGVLQzdoc1k2ZVBTVnZTNjVJS3FmeUhMcWJOckRR?=
 =?utf-8?B?cUx6Vk9NcHVES0p5SVlSQWExWXRqSzFTRGhmTVkrTnpZK1hSdUgzc2hqLzgy?=
 =?utf-8?B?UEc3SGVoTzBiSHdEUzF3YTF2NmJWbmM4eEhweTIranpSWmJOQVhsNy9aVzdH?=
 =?utf-8?B?NzVDZzZ2NDVjdXkvMVpsUXlocG9uRkF1Zkh1L05Ydk0waXlmcjZ6UVNieHd0?=
 =?utf-8?B?NFlGanJUSHh2R1V1bkxXT01uQkh3cFVOeTdTR3U2aW1MVW95bEJtUVVmdWho?=
 =?utf-8?B?TzUwNjliaHpGbXpoYWdqQ3lUWlRkYWE0T05xM2VWbzdGUVNPWkV2K3o3RHc3?=
 =?utf-8?B?NW9CV05tU3c4eXlUeWVsWjc3TW9VNm1IRUcydzE5RElFdy9EaGp1bW9UcEJv?=
 =?utf-8?B?QlllM3UvazNTQTBWMDhPaW4zQTVBTlVFQVFNbVlYbFNtaHBTUUY1S0lkZnRa?=
 =?utf-8?B?QnptV2tTRjlFclAyVjlVZkhaZDd4SnRqL1Q5U0loN0RxOTF1VWZVUmhYZTZC?=
 =?utf-8?B?aXVtRmhTRkdlVitEZno4czRwWnZmWTh2ZnMzRDQybDUxMVBkdzhjd3hheExD?=
 =?utf-8?B?WlVmQVBMUWQzS2VuUmZ3cFE2NTZMZXI0Z0YvL0tzN3p1bzB1R3dQdDYvK3dP?=
 =?utf-8?B?Z1hHU1B1blNuWk5SRHRhV3VhbmZmS2J2c2VNMk5idGJyQTk3dzhhZnorYUxY?=
 =?utf-8?B?ekFIZmMwdUIyQk1vOHIzRUtxd1N0eWRvQWZLak1xZGY4ZWtGcE54MTlvbTZH?=
 =?utf-8?B?cjRvbUFCU3BIajY5NmVZTFRoUVU4aXJILzRBZ2Y5QTZQUWtOdnB0bFg2TTRT?=
 =?utf-8?B?cTdja0hOZkllSFNWSjdva3FycmZxTTJZOFcwbjVTS3RwY2VUTEVnS2NHTGMr?=
 =?utf-8?B?MUVsc1NWdEpTbGp6WjNQcTZ1YW45M3doMFFLRlNENStZRjVhQzRIeUg5VlNO?=
 =?utf-8?B?OWQvQXVUMkFicXpWS3k3NExWRU5jekRFOE55ZEZhR1dKeGpmemx4eVJxYWpj?=
 =?utf-8?B?MUY2RERkaUNRZEtXdDhuT0FtSTg0UWliM01qeVRhUzNXMHNjNWIyMUtGRmND?=
 =?utf-8?Q?rESGg3z2fwn3LA2FqaRYgsvFGxTa+rkF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW9PTUFkWHdGOEkreStldUVKendsRjhtQ2NGRys0cDJzY0lnTkI4Y0lia01l?=
 =?utf-8?B?QTBJcHBFV1dvRWh1eEpjRDZINU5tOWVBdzZuNzlDSjRMUVFTdUhZbkhRMGRv?=
 =?utf-8?B?YjBOcllYWDhhYlpML2pZQ2pTYmlra3YxOVV1dHJLSHdRMEtVQmt4RmJyTTY3?=
 =?utf-8?B?Wm82azRZQ0hwa0VtMk9WM1N0dTYxK1JyU2RrVUp4VTJsSHpRVzFRREl3NEJw?=
 =?utf-8?B?R1ZHenh6bG1OQWdmVDRKamVJZHN1cEZpWVRWOFRVNGdrblJJVWRMeDhyMzBI?=
 =?utf-8?B?V1NnMTBhWkRPajlJUWJGNFUvejhIaXVxVTYzSG5PMmZwSllIdEVhS21nUmts?=
 =?utf-8?B?Y3pMSVZiUkY5VHArNkhiRWJOdnYreTlIR0xEVW1kMmtZTSt1WFhuQkVDWCth?=
 =?utf-8?B?WW5KY3NrcGxPN2hnSm9lYVZCQmFzeHNYRmJnWFhwUG5wR2pnVldGeUlkL3A0?=
 =?utf-8?B?bVlXOEx6c05XR2kxUTE0S2g5bUkxb2NmaEkrN3V3TngzQ3BKKzNnUDMzaG52?=
 =?utf-8?B?OXMxTVVJNU40V2gzODZTWU5GWVJiT2phVnNrWVNjV0p0NnVncGxxbmpwTzRT?=
 =?utf-8?B?NWV0Umh6a3FHdUVmYVZrSmhIZHE2bXNRWkx0M2NJM1IxQlhkc2dwUytKaTFl?=
 =?utf-8?B?TmxUaHo4VlVlMVp4TTkrdkFRWncwQUlPNm1kaHlOTHBtU2Q5TlQ2b3pyZXk1?=
 =?utf-8?B?Z0NnSGwzNVNMWXpOOVpveVhraFNOR2M1NmlxNmUybE5HeCtsb1RpZCtJamxU?=
 =?utf-8?B?N2JBeUZCbmtHOFVmS2Nod3dDUDRqNUxwL3ZRNTVOeFJlNXNhT2kzQWZNSGFI?=
 =?utf-8?B?eUd0L3JRelFMVjBhZjNTZVhWMU5TV21neTlSRGQwd2pRUzhRUWJteUx4aSsw?=
 =?utf-8?B?Ri8zUFNtZmExM1ZUbU80dHhIc2Q1YmhERnZ3aWREb0RDNDNQSEY1dCtOOVUx?=
 =?utf-8?B?QVhEV2c1SVBXQ09UcmhXR0xta2l3Qnp4clczY3pDWWVDWm1nYTkwYTd3TE1u?=
 =?utf-8?B?WmRsSzJJaTRiQzd4eXhUZzJobngvVjlZc1VudkhhNWNBYWcwbjh0VzJoNjRE?=
 =?utf-8?B?RUlsTzlKSEovTjRHMTRSOUtwalR1ZUpDTTVFWDZDR254cnJYUGF2ZURXN09J?=
 =?utf-8?B?M25ZTldzOElxN0RkRTBQZ09BcDA0Qm45YUNxa0FIMkhZNEtPa2Z2djlBTlVW?=
 =?utf-8?B?bFNlRStBcXBadlZRaGNxaENoU2dMZ05oRm4vemtYWU8wSVVoZG9keGpYSWZD?=
 =?utf-8?B?WFlJNUJERHd3OFBrQXlIM254WnJnOWo3M2NueVA3Vzd0T1hYMThoSmZxdXM2?=
 =?utf-8?B?bytITW4xRWk2eTNmaURZVkZ6VGFJTkJPMTByVjhUVUhRbGF4bjljdEFSTCs2?=
 =?utf-8?B?UXY1b3NkTWF3eXdGQkJNTklRTk93VTVubXdjeDlVVmhUNzBxWStnRzM1VVRI?=
 =?utf-8?B?aDFHK09QMlZhNDZ5RnhiSkhvV0wrS0ZjYWdERnlVMGsyQnZLSHBhVlBQd1lT?=
 =?utf-8?B?OVpVQjhXQWRTcFd3ZkdoMTlDbW5oV2gwUnAwZ1R2MmxwYmFEbGYxRWllWUc3?=
 =?utf-8?B?Ym16Z0pNb3RZWmhtSXZ4UWlic3pkRUtOVS9GVjZZeHIvZFBEOUtvRFcyTlhV?=
 =?utf-8?B?SVFYQ2djbkpnUW1wOU52Z051NU8xY2RjUEd1bE1NSE5lejVxVk5uam1uZEFH?=
 =?utf-8?B?WVA1UnR0NGRaS0QxU0J3anhVVGROZmVSanF6V3BqVUtockxJTjFTdWlnTG1q?=
 =?utf-8?B?Q1dYZ2JzY29zTW5jOVVGRFJxT013LzgyWEZGNHE4OEJWNmExVTRPUTg1SW5F?=
 =?utf-8?B?RFF2eXVrS2UxdUQ4OG1ZT0c0Ky9Sd3pObGpCRldKMFJNRGZPQWtKUFpQc3Jo?=
 =?utf-8?B?L29pSjEzY2JuOWY2REZUcjZHaWJ1NjJJb2U3dGg3MkFHb3BqNDhZdWVCQ3dO?=
 =?utf-8?B?T3dSbWU5emVGc2tZY3E3NnNSaElsbEU2a0MxN3hBdXRhamJYT2d2UmVWQ0lv?=
 =?utf-8?B?N2dseEhlcWg0RWpNQlNRdGZUa3l0Y2JTQlY0azNobkVtRmFheTdOcnRMZVZK?=
 =?utf-8?B?aWdBYWhSSjd4dGZmNVJxR2oycHQ5K0dmUU90bFhmK1Nab3I1RzhQZXZ2aG5E?=
 =?utf-8?Q?XoCo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3aea18e-c0aa-4ede-8d5d-08de04bdadec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 09:49:44.9052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+ZZF1erttPtcPQ1udw+qi9guGlFrBAyIaOjD3kZIN6dQi/4bVqiwRxcCbR/RDkt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8272
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



On 03.10.25 15:58, Tvrtko Ursulin wrote:
> GPUs typically benefit from contiguous memory via reduced TLB pressure and
> improved caching performance, where the maximum size of contiguous block
> which adds a performance benefit is related to hardware design.
> 
> TTM pool allocator by default tries (hard) to allocate up to the system
> MAX_PAGE_ORDER blocks. This varies by the CPU platform and can also be
> configured via Kconfig.
> 
> If that limit was set to be higher than the GPU can make an extra use of,
> lets allow the individual drivers to let TTM know over which allocation
> order can the pool allocator afford to make a little bit less effort with.
> 
> We implement this by disabling direct reclaim for those allocations, which
> reduces the allocation latency and lowers the demands on the page
> allocator, in cases where expending this effort is not critical for the
> GPU in question.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c |  8 ++++++++
>  include/drm/ttm/ttm_pool.h     | 10 ++++++++--
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 0323531d216a..c0bd92259394 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -135,6 +135,7 @@ static DECLARE_RWSEM(pool_shrink_rwsem);
>  static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  					unsigned int order)
>  {
> +	const unsigned int beneficial_order = ttm_pool_beneficial_order(pool);
>  	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
>  	struct ttm_pool_dma *dma;
>  	struct page *p;
> @@ -148,6 +149,13 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
>  			__GFP_THISNODE;
>  
> +	/*
> +	 * Do not add latency to the allocation path for allocations orders
> +	 * device tolds us do not bring them additional performance gains.
> +	 */
> +	if (beneficial_order && order > beneficial_order)
> +		gfp_flags &= ~__GFP_DIRECT_RECLAIM;
> +
>  	if (!ttm_pool_uses_dma_alloc(pool)) {
>  		p = alloc_pages_node(pool->nid, gfp_flags, order);
>  		if (p)
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index d898186765f1..b2114e2d0695 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -59,8 +59,9 @@ struct ttm_pool_type {
>  	struct list_head pages;
>  };
>  
> -#define TTM_POOL_USE_DMA_ALLOC 	BIT(0) /* Use coherent DMA allocations. */
> -#define TTM_POOL_USE_DMA32	BIT(1) /* Use GFP_DMA32 allocations. */
> +#define TTM_POOL_BENEFICIAL_ORDER(n)	((n) & 0xff) /* Max order which caller can benefit from */

Looks good in general, but I'm not 100% convinced that we want to mix this value into the flags.

On the one hand it makes your live easier because you don't need to change all drivers using it, on the other hand changing all drivers using it would potentially be cleaner and document the value better.

Christian.

> +#define TTM_POOL_USE_DMA_ALLOC 		BIT(8) /* Use coherent DMA allocations. */
> +#define TTM_POOL_USE_DMA32		BIT(9) /* Use GFP_DMA32 allocations. */
>  
>  /**
>   * struct ttm_pool - Pool for all caching and orders
> @@ -111,4 +112,9 @@ static inline bool ttm_pool_uses_dma32(struct ttm_pool *pool)
>  	return pool->flags & TTM_POOL_USE_DMA32;
>  }
>  
> +static inline bool ttm_pool_beneficial_order(struct ttm_pool *pool)
> +{
> +	return pool->flags & 0xff;
> +}
> +
>  #endif

