Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59E5C5F59B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 22:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BF010EB19;
	Fri, 14 Nov 2025 21:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LvGmidU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012048.outbound.protection.outlook.com
 [40.93.195.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C336610EB19;
 Fri, 14 Nov 2025 21:23:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJpqY9gGaG7SdNhOg6BlPukUgo336/Qf06iahMEJcDdBfxWIggcMIkJEraFUmGHs1w+gm1/MbXO8xGpyBsQUX3WOzZMzjhhCEhJfZyVH64ZGETybHtYg8E1vxM/FkckrAXlcu7gxZLSsMIw+OHP5HyX1VfC9PEvPe+lFEQL8oDezIcUsciNfXj43Ahxi4oO15hJCiX6lYfvyJvLeXqR9bMLcpQUe1ObZDu18f8PBBkCOo8edzdAErKZumGZNmz8T6dJVusWDig30CY0F6AXr0LTbnsPBsm9IJSfs+7glvWa+V5L366q8ZRhkoHb9t+gbSPUVeDfeGW6sCWUWvE8SUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ic6XHRTfl4C8wEg7GiVv47n65qZIgbh9klwqOuI0cSA=;
 b=jLTOdLYGG+UMT/anUdrWg+gJwRj8sIJ2DQ6LsihXwZlSXTqaAs2kVwVku2iNTO1apP0se8ke8eSr3lyYdhZt9YZxx00rffg2MeNS3pY0+UFOxdKISwK0q/9YzqIYDXroMEZZXAon17UmwNpr3W25KMqlOUGPT8ZGBXP/qztp1QUXdgn7z5meOz/iRk+H92nM6nfskkwx1l5jPHeTrOMOD5x8NwOnlAAkHvmqkdnILibTqj42oZ6TzYdvXCdeHaQ5dcLsgtShz8/RNUFecNj3i8Fo9BE3mFOIR2MJYrWwLbnAXty9Ib+0E2o4xDPzPiGhnn57gzjxIZvOWhkY4G2bJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ic6XHRTfl4C8wEg7GiVv47n65qZIgbh9klwqOuI0cSA=;
 b=LvGmidU++a+STbJFI1T25YoWU3QkodJ0m7WpQ+cKQ0I6+3cpsFWODfPNJIxMa7QlUI3rR9GHJzEbfQwdE5VI+me3kEMYv3aCvdQ8xZJ7sI4c2aWN6EteyHWCnv/Lyiy8rhdeNjEAjBJNrCN2iPW5DCwl40cqpnd5arNFGqM86CQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN0PR12MB5905.namprd12.prod.outlook.com (2603:10b6:208:379::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 21:23:12 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 21:23:12 +0000
Message-ID: <6847dfa5-d8dd-49da-a0e8-ac383b7aecf3@amd.com>
Date: Fri, 14 Nov 2025 16:23:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/20] drm/amdgpu: pass all the sdma scheds to
 amdgpu_mman
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-16-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20251113160632.5889-16-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::18) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN0PR12MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc43166-5b0d-41f7-400f-08de23c4042c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THNabGRtWDdLc0cwZ2phb0NpOVJFdG51S1pXU2VUeEdmWGV2WnNRZHdVVVNJ?=
 =?utf-8?B?cnJJQUs1SnNzUW15bXhoeVAyTlFhb0RKdmlHTnM2MmFvQjVONzFLNE8rYS9N?=
 =?utf-8?B?N0pGdVdmdGhENjU4MEFUZG5ibmpZbkJYTEZEZlNyR0Y1anpRK1djaExGZWRv?=
 =?utf-8?B?eVR6TmNJcTBxRVdKanVyeXZoNm9kOUNrTFdPVFNqNmpZSVl5dzRrZC9qTkln?=
 =?utf-8?B?SXBmMFJyTUQrbHNTcVlNTWgrQnVnTHlPL2U3eVMvcFpYQWpJMUc1eFpEVjVI?=
 =?utf-8?B?UGp1Q1JnRjhtSFVRK0NqazRXR2MyVkhGQ1M1WGdERm5XTzBMZnVhMkxjK3Ay?=
 =?utf-8?B?Qkp1bWZCeEJoZm5mWVA0Z2dOQlFGeDRaT3ZEeFhpSDJrTUwrdTdETGJqL1du?=
 =?utf-8?B?cHhzN2F4MGxUNEFVQUZPc1I5Zm9IdzQ3SlhIN1Q5bWlpcFg3YXlpUkFzV2I3?=
 =?utf-8?B?anFhTlZjNGFQN0pEd2lDVHZyT210Y0JKaERNek1VT3lsa0RQVmdpREd1OWpv?=
 =?utf-8?B?Z2pVU0gvOHk1aXdXRUd3K1JvZ0R3N2pjV253SU84WWc5NDhqMHRRenNzazFV?=
 =?utf-8?B?TEw4eU9pTURrQWlyV1d3OEQvOTMwOGkxbkdJTVNmVDI2Sk1qbUZJc2lsaEJJ?=
 =?utf-8?B?QmZhVHBBcitmV2JzcU4zUlRTMUg0QmJjTk5JYSt3Yzl1ZklIZDEzek9ncm9y?=
 =?utf-8?B?OE9ubzVkWVJGUDk4TTdJdnF4M2tmYjFidGNCTGIxZCtkQnlhcCtKUzlKVXJy?=
 =?utf-8?B?VEZLN3NuNTF5b3F5TkhGbDJUOW1Pb09UNlhVNVFiWkNwZlZDUVc0R3FmZ0hY?=
 =?utf-8?B?MURNVDYzeklVbjA1NjVPcU01QUtrWUZWZzJnd2ZYRkFJMFVvOVd0V3ZhRExj?=
 =?utf-8?B?cWx3cVAzNE1tOVRwOWlPaDNGYk5UWFlqT0d3eU5qaVduY1JSTnVqNytDMWRz?=
 =?utf-8?B?T0FaMkVuMXBaMGxpVjcxUHR4U2xFOU5Ld2dPNDdVV08zRGRaODQ0eThIeGxK?=
 =?utf-8?B?WUpvOFRweWhOWGszTE0rK01GNGRGK3NwdUoreFpZeTZBOHdZSEVUeEhUWC9F?=
 =?utf-8?B?RXlRUW1DVEZtNE5mclR3NzZhNWJBUS9menJ6T09xcmIrYjJiTXJOUUNmcC9V?=
 =?utf-8?B?ZVdTUHlycE4yWjlCd0V5UDIvUlM1enRORU54SkhYWmhyU2dDUk5Idk9xQVJZ?=
 =?utf-8?B?d3d2RFgwYnhmZWNMSWozdHYwU0xGUm8vWXB2NUpGQXJuek5VVEVyT0tlNENp?=
 =?utf-8?B?bDV1KzYvaWhzUGFQZ3drMGo3a1pFNytMMHRsdExSdE0xbHJYVHd2eDhta0tT?=
 =?utf-8?B?bm5LRzhFa0JPaUdNeDdrcjZad2ZJbkdHcW90c2N1djlqY2U5VnRhMnFCNHgw?=
 =?utf-8?B?aCs1U250cVBGeE1xakxzcFlYVS9FRmJDK2QrQkVaYTFHOW0vVkEwcmJ6UlNm?=
 =?utf-8?B?clNZUzk1RllNOW5SSCt6MlhQUUZHbkJRanFJY2xTOVVUK01tUFg4TmdkYk9x?=
 =?utf-8?B?aU5scklSMFpGTVU0alRwTXJsY3R0M3FxQXFkVHpwN01YODNyVURBZEEwTmxh?=
 =?utf-8?B?RWd0YzNYS1haWTJqa1Vvd3NmQ25KRW1RT29ZNFZUeWI1ODNSSnhUbzVYbFNa?=
 =?utf-8?B?SWltbWg3ZnVBdzF1ZXQwRDFBcUhhOVZsRTkvTnN3S0V1TDh5cUtVbUladzdu?=
 =?utf-8?B?MVNsUTJraC9pdkJGcUxPSzJGL0N2NDRHc0QvbmN2NkhvOWkwcXZUSlJaeVRM?=
 =?utf-8?B?K3dPeW5qRjFwd256SE9kT0pWTFJpZnhJOGFQRkNwcDZDeTU3R3lKSnNnOVZu?=
 =?utf-8?B?NUxsRVYzSGtEc1VveTUwUTNJMHN3R2hIaG5zMVQranZ5ZW42TGhQWU1ZRy9P?=
 =?utf-8?B?b2w4N2xJVDhOdU4rRE5CQU1ianJMMkZqRW5LS21WcVFkSDBnU2thVEJnUmh0?=
 =?utf-8?Q?ZgLKos5qm3M2danpaSX6IiopH3cQEwjh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUZvYm9pM1BpYitPRGd1QXM3QUpCWlpycEdGUWxVWVVGT3ZpQmJUVW05NjNv?=
 =?utf-8?B?S05TYWFVOUtWenVnYVFVYjFIQVJtZGJmRVpIWDVtY0ZVZGdYR095dCtXRDVm?=
 =?utf-8?B?YnlYSjV0SHFDWklwMW41SENaV2dJaXJJamRsRkwwdlpQeVJmakh5eEIyS3pN?=
 =?utf-8?B?MzRpdmV4dE5penEyOGlRb3BFSGsxU0ttbTB1REtnanRUQU9oZTlNbEs0TXI1?=
 =?utf-8?B?YllBdEltRGE3cHQ3VDRIMERFWEwrMGJjL3Vhc3AxNS9mYmZ6ZlBRbm5JL3pD?=
 =?utf-8?B?TDkzTnQ4a3l3MDNRUDAxRW91RjVjdnBDeWUyOXdKc3V6RStNVVdsY1BaQk9j?=
 =?utf-8?B?ck5XNzB1aGZzVVpEQThyaGdhN2x1UEgzTjlaTUh4dXBtYUpiaVRreER0bHlx?=
 =?utf-8?B?YnRya1BmUDhobDVSYTJDaGpkVEJ5ZkdwMStITkFKWnJDZ00rRHpHUzNCbVgr?=
 =?utf-8?B?eFRkMndXUHJNcEFrL0xoYVFMUG92S1hDZE0rZG1DcHVQc2pxVUtNeTUzR04r?=
 =?utf-8?B?RlZxZWZVR1gzRjFXR3dGcmFJaHhvcGR2cUsyenpyL0ZvdWlNb0E5M1VoM3Vo?=
 =?utf-8?B?U1o5L2NsZHZGQVZWdlNHUG82eks5Tm1pT0FXNFJFUGZUYTF0OXQ1bXk0amNT?=
 =?utf-8?B?QUNxRnUrWG13V0I3YnpjejZDZHoyR2FiUzVpK1FSOXFKMWZwbmlpWFRvaUJn?=
 =?utf-8?B?OVJ0WHU0Z0lmdU04MXJOUXB4Z0RyM2p5UHN1RFBaT1liQndjQmY3enZwbDNG?=
 =?utf-8?B?UWZobklxWW84dXJIa3hpcUNaNnNpeWhtVmVlL1VHZ3JYV2cwMDNEQ0wrQU1B?=
 =?utf-8?B?SlBHcWNYKzNxbnZJWjRqbjQwamxTRXJ2M3ErSzdTbzhyamtscmxDTFZ0N0hP?=
 =?utf-8?B?QkRNTitrY0plMGtyUDFVNFcwaHJQZzdCNUU4UU5BNXA2SWUwNDZXb1RKcmJv?=
 =?utf-8?B?bC9LeXRjQ2xQZnNiU0p1WkZwVUM3RnQ5cUtUdUIzVmFlU2VKcW91bEFIT3ND?=
 =?utf-8?B?VmxlQ0o2MTV2dGl2UWFCVTVhanBiWnBWV2NNKzkxS3hsaU91M2NwVUpiQU0r?=
 =?utf-8?B?dEM5Z0VCcXQyd3VaZVVNN2t1dkh4ZVdWclRBcGNESzRtaEVLSmZCdklGKys5?=
 =?utf-8?B?MzNEeXRWSEJCbjNrOElXak1HTW5hMFNxREgzL3I3YStLcy9uYWg2TGU3UjV6?=
 =?utf-8?B?dUQzVmd3SG5adEFrRGhGdUNzZVJkWlc0OHVFTFF3SllMd2RiTlgxNThjbGpi?=
 =?utf-8?B?MGlEUFQ2RFY1WGJvODFYWjZ2bmI0U2hqUGRsU1ZNQlFpOGtDNUI5VUFkbk9i?=
 =?utf-8?B?UmVoVzExTmZKQis1djlwMDgrK1kwdkhRS0dDZElDc21jR0JWRlpGaWhNYUFW?=
 =?utf-8?B?WVdYR3lnbmUvQmZKNFM0a0VveXpKWEpjRWpzS2Y5b1lVeHQ2d0phbXFraTRn?=
 =?utf-8?B?UjVlM28rWW90RksyM0xLQ3dFcG1UYnpuVDhGc290ekRDTFhjMWJTaTdJdEpE?=
 =?utf-8?B?ekxjNE91Nyt5VFlJQUoydEtRczl4WHBXaU9LSm9ZVmQxSGJIMDBtY0diaHlu?=
 =?utf-8?B?enVodXZtMW12bndpdG1aNmtLOWcydytlRDREUHZ2ZExFMSt5WlRkN1VkNVpr?=
 =?utf-8?B?SGNSSGo0b0Z3aGFkL2Y3dUJhZXdDUjc4TFVFQlVZVS91TThJQnp0YXdwQm1M?=
 =?utf-8?B?aUhqMnk3eUxlY3lVUUZnbXNaZTc5bUZzYUx2TG82bk56UEs1cmxRRFhCc1Nx?=
 =?utf-8?B?cGZXY1FtandDMHl2MDZNK0d0czBvR3lrN2EyZTVrRFFPaDR3THhOUFNZU2c4?=
 =?utf-8?B?QlV4emU3cmcvaVN0b2l0Z3Z2a3dhZjhyQ1JlMnk4d1RhN3Z1VFM2dnBLN0lh?=
 =?utf-8?B?Qk0xbWZGYWVhVUxGbWdXRXpzZzA3VENkNS9sVHU0SEV3cThZSTJFcTlQQ3Ir?=
 =?utf-8?B?T1h5OTNuVmw4SGpJajN0cFBzTndjV1k3QklaZ0JiZXlPdkRhRFJCWUF0Q0x4?=
 =?utf-8?B?TkpNNDc5Wm1wWitMcmR6SkhEMVVQSWhkb2RYbHB4U3NwaHFYYXF6a3FGVFVy?=
 =?utf-8?B?MjZrMzFTT3MvMmdXQzRrNWJmVHFCYkFabzVLcGtFaUdVSUJpZmc4dTdmQk5M?=
 =?utf-8?Q?KSBCYifwPlVYNDOPqXV4rqQM8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc43166-5b0d-41f7-400f-08de23c4042c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 21:23:12.5721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1KstjzFOwVJrXUvenv1kr1k3vSWo2nnBb8Yo+c4RAD46jsYrr8S8DlXF1750I7HIbtH8VDjfZxTTvpFHW+Hog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5905
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

On 2025-11-13 11:05, Pierre-Eric Pelloux-Prayer wrote:
> This will allow the use of all of them for clear/fill buffer
> operations.
> Since drm_sched_entity_init requires a scheduler array, we
> store schedulers rather than rings. For the few places that need
> access to a ring, we can get it from the sched using container_of.
>
> Since the code is the same for all sdma versions, add a new
> helper amdgpu_sdma_set_buffer_funcs_scheds to set buffer_funcs_scheds
> based on the number of sdma instances.
>
> Note: the new sched array is identical to the amdgpu_vm_manager one.
> These 2 could be merged.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Acked-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  8 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 41 +++++++++++++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  3 +-
>   drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  3 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  3 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |  3 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  6 +--
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  6 +--
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  6 +--
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  6 +--
>   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  3 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |  3 +-
>   drivers/gpu/drm/amd/amdgpu/si_dma.c           |  3 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  3 +-
>   17 files changed, 62 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 3fab3dc9f3e4..05c13fb0e6bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1615,6 +1615,8 @@ ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
>   ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
>   void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
>   				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs);
> +void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
> +					 const struct amdgpu_buffer_funcs *buffer_funcs);
>   
>   /* atpx handler */
>   #if defined(CONFIG_VGA_SWITCHEROO)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> index b59040a8771f..9ea927e07a77 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> @@ -32,12 +32,14 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>   				    uint64_t saddr, uint64_t daddr, int n, s64 *time_ms)
>   {
>   	ktime_t stime, etime;
> +	struct amdgpu_ring *ring;
>   	struct dma_fence *fence;
>   	int i, r;
>   
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
> +
>   	stime = ktime_get();
>   	for (i = 0; i < n; i++) {
> -		struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>   		r = amdgpu_copy_buffer(ring, &adev->mman.default_entity.base,
>   				       saddr, daddr, size, NULL, &fence,
>   				       false, 0);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index b92234d63562..1927d940fbca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3303,7 +3303,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>   	if (r)
>   		goto init_failed;
>   
> -	if (adev->mman.buffer_funcs_ring->sched.ready)
> +	if (adev->mman.buffer_funcs_scheds[0]->ready)
>   		amdgpu_ttm_set_buffer_funcs_status(adev, true);
>   
>   	/* Don't init kfd if whole hive need to be reset during init */
> @@ -4143,7 +4143,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
>   
>   	r = amdgpu_device_ip_resume_phase2(adev);
>   
> -	if (adev->mman.buffer_funcs_ring->sched.ready)
> +	if (adev->mman.buffer_funcs_scheds[0]->ready)
>   		amdgpu_ttm_set_buffer_funcs_status(adev, true);
>   
>   	if (r)
> @@ -4493,7 +4493,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	adev->num_rings = 0;
>   	RCU_INIT_POINTER(adev->gang_submit, dma_fence_get_stub());
>   	adev->mman.buffer_funcs = NULL;
> -	adev->mman.buffer_funcs_ring = NULL;
> +	adev->mman.num_buffer_funcs_scheds = 0;
>   	adev->vm_manager.vm_pte_funcs = NULL;
>   	adev->vm_manager.vm_pte_num_scheds = 0;
>   	adev->gmc.gmc_funcs = NULL;
> @@ -5965,7 +5965,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
>   				if (r)
>   					goto out;
>   
> -				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
> +				if (tmp_adev->mman.buffer_funcs_scheds[0]->ready)
>   					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
>   
>   				r = amdgpu_device_ip_resume_phase3(tmp_adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 2713dd51ab9a..4433d8620129 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -651,12 +651,14 @@ int amdgpu_gmc_allocate_vm_inv_eng(struct amdgpu_device *adev)
>   void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   			      uint32_t vmhub, uint32_t flush_type)
>   {
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ring *ring;
>   	struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
>   	struct dma_fence *fence;
>   	struct amdgpu_job *job;
>   	int r, i;
>   
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
> +
>   	if (!hub->sdma_invalidation_workaround || vmid ||
>   	    !adev->mman.buffer_funcs_enabled || !adev->ib_pool_ready ||
>   	    !ring->sched.ready) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 6c333dba7a35..11fec0fa4c11 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -308,7 +308,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>   				      struct dma_resv *resv,
>   				      struct dma_fence **f)
>   {
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ring *ring;
>   	struct amdgpu_res_cursor src_mm, dst_mm;
>   	struct dma_fence *fence = NULL;
>   	int r = 0;
> @@ -321,6 +321,8 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>   		return -EINVAL;
>   	}
>   
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
> +
>   	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
>   	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
>   
> @@ -1493,6 +1495,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>   	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
>   	struct amdgpu_res_cursor src_mm;
> +	struct amdgpu_ring *ring;
>   	struct amdgpu_job *job;
>   	struct dma_fence *fence;
>   	uint64_t src_addr, dst_addr;
> @@ -1530,7 +1533,8 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>   	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
>   				PAGE_SIZE, 0);
>   
> -	amdgpu_ring_pad_ib(adev->mman.buffer_funcs_ring, &job->ibs[0]);
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
> +	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>   	WARN_ON(job->ibs[0].length_dw > num_dw);
>   
>   	fence = amdgpu_job_submit(job);
> @@ -2196,11 +2200,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>   		return windows;
>   
>   	if (enable) {
> -		struct amdgpu_ring *ring;
>   		struct drm_gpu_scheduler *sched;
>   
> -		ring = adev->mman.buffer_funcs_ring;
> -		sched = &ring->sched;
> +		sched = adev->mman.buffer_funcs_scheds[0];
>   		r = drm_sched_entity_init(&adev->mman.default_entity.base,
>   					  DRM_SCHED_PRIORITY_KERNEL, &sched,
>   					  1, NULL);
> @@ -2432,7 +2434,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>   			    struct dma_fence **fence)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ring *ring;
>   	struct amdgpu_ttm_buffer_entity *entity;
>   	struct amdgpu_res_cursor cursor;
>   	u64 addr;
> @@ -2443,6 +2445,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>   
>   	if (!fence)
>   		return -EINVAL;
> +
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>   	entity = &adev->mman.clear_entities[0];
>   	*fence = dma_fence_get_stub();
>   
> @@ -2494,9 +2498,9 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>   		       u64 k_job_id)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>   	struct dma_fence *fence = NULL;
>   	struct amdgpu_res_cursor dst;
> +	struct amdgpu_ring *ring;
>   	int r, e;
>   
>   	if (!adev->mman.buffer_funcs_enabled) {
> @@ -2505,6 +2509,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>   		return -EINVAL;
>   	}
>   
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
> +
>   	if (entity == NULL) {
>   		e = atomic_inc_return(&adev->mman.next_clear_entity) %
>   				      adev->mman.num_clear_entities;
> @@ -2579,6 +2585,27 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>   	return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
>   }
>   
> +void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
> +					 const struct amdgpu_buffer_funcs *buffer_funcs)
> +{
> +	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
> +	struct drm_gpu_scheduler *sched;
> +	int i;
> +
> +	adev->mman.buffer_funcs = buffer_funcs;
> +
> +	for (i = 0; i < adev->sdma.num_instances; i++) {
> +		if (adev->sdma.has_page_queue)
> +			sched = &adev->sdma.instance[i].page.sched;
> +		else
> +			sched = &adev->sdma.instance[i].ring.sched;
> +		adev->mman.buffer_funcs_scheds[i] = sched;
> +	}
> +
> +	adev->mman.num_buffer_funcs_scheds = hub->sdma_invalidation_workaround ?
> +		1 : adev->sdma.num_instances;
> +}
> +
>   #if defined(CONFIG_DEBUG_FS)
>   
>   static int amdgpu_ttm_page_pool_show(struct seq_file *m, void *unused)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 4844f001f590..63c3e2466708 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -66,7 +66,8 @@ struct amdgpu_mman {
>   
>   	/* buffer handling */
>   	const struct amdgpu_buffer_funcs	*buffer_funcs;
> -	struct amdgpu_ring			*buffer_funcs_ring;
> +	struct drm_gpu_scheduler		*buffer_funcs_scheds[AMDGPU_MAX_RINGS];
> +	u32					num_buffer_funcs_scheds;
>   	bool					buffer_funcs_enabled;
>   
>   	struct mutex				gtt_window_lock;
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> index 5fe162f52c92..a36385ad8da8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> @@ -1333,8 +1333,7 @@ static const struct amdgpu_buffer_funcs cik_sdma_buffer_funcs = {
>   
>   static void cik_sdma_set_buffer_funcs(struct amdgpu_device *adev)
>   {
> -	adev->mman.buffer_funcs = &cik_sdma_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &cik_sdma_buffer_funcs);
>   }
>   
>   static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> index 63636643db3d..4a3ba136a36c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> @@ -1228,8 +1228,7 @@ static const struct amdgpu_buffer_funcs sdma_v2_4_buffer_funcs = {
>   
>   static void sdma_v2_4_set_buffer_funcs(struct amdgpu_device *adev)
>   {
> -	adev->mman.buffer_funcs = &sdma_v2_4_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v2_4_buffer_funcs);
>   }
>   
>   static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> index 0153626b5df2..3cf527bcadf6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> @@ -1670,8 +1670,7 @@ static const struct amdgpu_buffer_funcs sdma_v3_0_buffer_funcs = {
>   
>   static void sdma_v3_0_set_buffer_funcs(struct amdgpu_device *adev)
>   {
> -	adev->mman.buffer_funcs = &sdma_v3_0_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v3_0_buffer_funcs);
>   }
>   
>   static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index 96a67b30854c..7e106baecad5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -2608,11 +2608,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_0_buffer_funcs = {
>   
>   static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev)
>   {
> -	adev->mman.buffer_funcs = &sdma_v4_0_buffer_funcs;
> -	if (adev->sdma.has_page_queue)
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
> -	else
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v4_0_buffer_funcs);
>   }
>   
>   static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> index 04dc8a8f4d66..7cb0e213bab2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> @@ -2309,11 +2309,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_4_2_buffer_funcs = {
>   
>   static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev)
>   {
> -	adev->mman.buffer_funcs = &sdma_v4_4_2_buffer_funcs;
> -	if (adev->sdma.has_page_queue)
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
> -	else
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v4_4_2_buffer_funcs);
>   }
>   
>   static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> index 19c717f2c602..eab09c5fc762 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -2066,10 +2066,8 @@ static const struct amdgpu_buffer_funcs sdma_v5_0_buffer_funcs = {
>   
>   static void sdma_v5_0_set_buffer_funcs(struct amdgpu_device *adev)
>   {
> -	if (adev->mman.buffer_funcs == NULL) {
> -		adev->mman.buffer_funcs = &sdma_v5_0_buffer_funcs;
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> -	}
> +	if (adev->mman.buffer_funcs == NULL)
> +		amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v5_0_buffer_funcs);
>   }
>   
>   static const struct amdgpu_vm_pte_funcs sdma_v5_0_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 7a07b8f4e86d..e843da1dce59 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -2076,10 +2076,8 @@ static const struct amdgpu_buffer_funcs sdma_v5_2_buffer_funcs = {
>   
>   static void sdma_v5_2_set_buffer_funcs(struct amdgpu_device *adev)
>   {
> -	if (adev->mman.buffer_funcs == NULL) {
> -		adev->mman.buffer_funcs = &sdma_v5_2_buffer_funcs;
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> -	}
> +	if (adev->mman.buffer_funcs == NULL)
> +		amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v5_2_buffer_funcs);
>   }
>   
>   static const struct amdgpu_vm_pte_funcs sdma_v5_2_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> index 8f8228c7adee..d078bff42983 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> @@ -1884,8 +1884,7 @@ static const struct amdgpu_buffer_funcs sdma_v6_0_buffer_funcs = {
>   
>   static void sdma_v6_0_set_buffer_funcs(struct amdgpu_device *adev)
>   {
> -	adev->mman.buffer_funcs = &sdma_v6_0_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v6_0_buffer_funcs);
>   }
>   
>   static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> index cf412d8fb0ed..77ad6f128e75 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> @@ -1826,8 +1826,7 @@ static const struct amdgpu_buffer_funcs sdma_v7_0_buffer_funcs = {
>   
>   static void sdma_v7_0_set_buffer_funcs(struct amdgpu_device *adev)
>   {
> -	adev->mman.buffer_funcs = &sdma_v7_0_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v7_0_buffer_funcs);
>   }
>   
>   static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> index 863e00086c30..4f6d7eeceb37 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> @@ -826,8 +826,7 @@ static const struct amdgpu_buffer_funcs si_dma_buffer_funcs = {
>   
>   static void si_dma_set_buffer_funcs(struct amdgpu_device *adev)
>   {
> -	adev->mman.buffer_funcs = &si_dma_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &si_dma_buffer_funcs);
>   }
>   
>   static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 943c3438c7ee..3f7b85aabb72 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -129,13 +129,14 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>   			     struct dma_fence **mfence)
>   {
>   	const u64 GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ring *ring;
>   	struct amdgpu_ttm_buffer_entity *entity;
>   	u64 gart_s, gart_d;
>   	struct dma_fence *next;
>   	u64 size;
>   	int r;
>   
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>   	entity = &adev->mman.move_entities[0];
>   
>   	mutex_lock(&entity->gart_window_lock);
