Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3366FC7A695
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF3710E8B8;
	Fri, 21 Nov 2025 15:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ccq7Tz5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011048.outbound.protection.outlook.com [40.107.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED8A10E8B7;
 Fri, 21 Nov 2025 15:08:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFhOxuyUAxDHl2jl6ZEPIe0ygOHNhm27uCW6BFmoUc1OiYBkQjzbko4h0HRUv88QLnwfDJb1N7jzy1gGWN+pvdC8BEwZwCt4F2Lzl8RUZYhJvdikmTGX8MXON8Cl5TunvfXn5Pfs2x4qcBEsXpoy8A0ytuKtOtUFJvf0C7vXAaukfPPp1bcz2JKPo97wIkcpSyZ0HcvFDojYuz+3mF8BlhfkBuZo4kajSm7PCzJ+bnwva8/p+huVf2ANCtAuBQAPBZ6N/IMX/dHVNWdkKqsngeuu5+zvT4tVfVOJJir2SFdAS08ESHLDhWH7sC5YiQkT4mu1pA+CO4GerYABV+Fmag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQFD9Rv6SHu4o7q1pc0J0aqJTUIsSTrR0kDlLdz/C/s=;
 b=W4KQAvWaW/3V52Cjr5nJudJhYENAoGqNaTNcH1772p+i5QyXXgVjedLsQrVfYgyiOM3Pt/o2QA8i3VRtV+gpoQOh0i9RRmuWhUVN71lsFhthm8vtlTnwXjAquKPD6PU3hekSxdRvwO1xbZi8r7RPAqxB0mArEZxPVYogFsnqG+O1+H/0EdYx0D6vMtlkbCMRfXoLQfOb08XLBuV3IOrv7LkWDCBV8vQIrFxeuxd5lwMBIELq5oMVpLd2aYgV9PqjYW4rp8QRC5Z94MBUJIEVDXFGP0EADXWxdGwAL6JC9mGx9enq7+NNRbTz5lx4MhyHiV8gd2D/PKlglfWYvHOKeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQFD9Rv6SHu4o7q1pc0J0aqJTUIsSTrR0kDlLdz/C/s=;
 b=ccq7Tz5Em1aPeXe+phezEEY4oFwrSMiWOt5LrNmBPH9VLJvR1SURKp0+AshOklq5o7D0V7QulILeS8DX+EpHR5TlZ4yA3s4P1KrQ40KMUEZHA52FLeBqN8GpdV61QhsUcDr6gRPy0g3nN1wyBmLuGiMVQKpTBsJrcS9E8SlP/zU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:08:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 15:08:16 +0000
Message-ID: <1afb2956-af6c-4218-83b3-85f241332ec9@amd.com>
Date: Fri, 21 Nov 2025 16:08:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/28] drm/amdgpu: move sched status check inside
 amdgpu_ttm_set_buffer_funcs_status
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-19-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-19-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:4:188::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b68c612-ea57-443f-a2ee-08de290fcc25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDNwQXJQbWFFNUJzUDNMcTdISTVTRU81RjhjZVFFeDlEV0JubE00eHdEdEtm?=
 =?utf-8?B?TTA1WW9pcU94dnI2dmRTai84ZEYvaVZaendlNUlJQkhqZytvdEE0TEFmcjZC?=
 =?utf-8?B?RXZ1bGpTbXBPZFFEcDJzeTVuMlNqcktiWG9OYnM2dytNUnNnQmo0S3JCai9E?=
 =?utf-8?B?VEdwelBXVHJWTnZ5WEw0QUlLWk1NWExoa1A4bkhPN3UwOW5KOGhwL2c3L004?=
 =?utf-8?B?VGZ3MWc0NFQ3OTd1MmVVOHU0QmxVV2ROTEhXN1pCRHc0M2dUcjVPVkZJL1Bw?=
 =?utf-8?B?b2QwN3FEaEZGU2dzSVdOU1hPVGU2NVVDUkpibU01MkYvYU1sNzFQQ29BVzRP?=
 =?utf-8?B?UlVSV1M5YTViYnZQa2ZIM2lBMndxeDRkUUJEWlFQMk80NkhSQW9uZVgrbmhu?=
 =?utf-8?B?SHpZRkZQZ1Y1bytEU2dZSjRTeXVqVVo4SmhyZGdFUjJNM1JFdXBya2lmYVpJ?=
 =?utf-8?B?anJHcm9GQUoySTdxVGg2TzVHTGFmWG9WVldDV0xRSldQVDZmTGJ6cEI2a0g0?=
 =?utf-8?B?TllZYTBRbmFZRFBWWFhUbGo3YXFiOFE2K20xZHovTi9oWVhYMUErclM2QVVt?=
 =?utf-8?B?YUNodDhPWVdBY0NaTVV3UzlFTlZQSlRMTklSbCt1Z0lRTlM3YUJCdjF1QlBs?=
 =?utf-8?B?NXJwdE53cDRrNElBaG5TczVMZzBRS00xR2trV2g5K2x5eEpXUUQzcFRlemVV?=
 =?utf-8?B?UG5RTlJKdlFRQUVPRldHNS9XRk5sa2JISU10d1pxNE51Mk1EQ204a3F0THNT?=
 =?utf-8?B?VGNObWU3Y29ZdnNrVnNVbnhURTlPdWp6eU1XWEl0Zk9pdjJpZDlSVGk2Q0Zk?=
 =?utf-8?B?aEw0Ty9TdndKWkRTTDVZVkU1NWxZTlpWbnBlbjRjNW5wbHBHS2Fha2hqcHZK?=
 =?utf-8?B?OVZiT3UybHdQTzg1a2tvN2RTeUVRckhVVE9KWGhGbURYU3g5OXZaQjJJTUVK?=
 =?utf-8?B?ckloSGRoaEcvbjQwSE8zTmlXNURMTWtURkF4NXk3UU1RLzlWT0hJOVUxdUdP?=
 =?utf-8?B?SERNVm9UYXRySVk4cXNickdDRVFvNnZkS1FUUHhXdVo2cGpzTVgrSXRqL3Ra?=
 =?utf-8?B?UlB0ZERjMCtRWURHOUFoRnVqTnlJRGg1aHcvYXk3bUY1SWd4VWM4OUtrVmJu?=
 =?utf-8?B?RzNwcmhjNHJ5Ylh6TDdFblkwUnp0OEpydDlLUFdEUmRBeVlRaWhyWmdEVkJ4?=
 =?utf-8?B?UXJWS2JPL3MyZDFOWnNhaFpyVjl4RnFzZWQxTzNRSFdXZ1g4YnQrRXBLZTV0?=
 =?utf-8?B?SkY1Y1o1R2czbjJjcmpYNnBpL3JIcW5kUWtOc1lOYXl1Q1RJUTNIZXZsR1lU?=
 =?utf-8?B?NmxBYjdYZFM1YW1RTEhjQWZMZGVLelNTQzd4d214M3JlSjJuZFg2THhlQkly?=
 =?utf-8?B?THR4QUU2MWJGSFNzRFdnTDBNMGZmdHRHVkY2Uk9aMDJkRFI5RzRRL3BiTG04?=
 =?utf-8?B?YUlpNnJ2SW83UUtlaldtNGtHUjdURWJySTBXZzluaTZ2R2dkelNrR3Z2ZERT?=
 =?utf-8?B?OXEzeGVGYStlSndTY0x3NzM0OXpoR2psc0FhQ2lGbE5BaldMQmtTSjZma3Zu?=
 =?utf-8?B?cUc2R3FhRHFJOUw4UE00MTRkcjlESXdDRXUxeDRKdGx5blJDekRJVHNGTlRq?=
 =?utf-8?B?WDBWR3pGeE5QeE9OeHpwM3V2Nk9oaWRMYi83VkpWQkxqQWpQTzRBYWdQVndR?=
 =?utf-8?B?MlgyVTlGMzQ4ZEFKZzF5dVI1SnRjREVBK0h6c0toRE1nK0dVbTVJNjlkZnEv?=
 =?utf-8?B?TUVJRS95cE5ta3BLSm5YZzdLZk9wL0sweDJXWEc1V1B5ek1TWlN5dEc3WmJX?=
 =?utf-8?B?cjcwenhUNFQ3c05nV1NjSHEzUXVZTVM0QllFYW9lTnAxaHNHbVBwZ0hSNE4v?=
 =?utf-8?B?ZXJ3Vk5kOG9MNHV1azlGQWZUOGU4YjBJa1RzK29laFAyaFAzcmVTUktyOTlm?=
 =?utf-8?Q?RQCi7vui4qlxWaIFllUOP2N88rHOgfIS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0JwWUozck90Nlg3ME5kMERWTjl0NTZLWDNwY045ZURMbEpkK2VxcGlsM0Y0?=
 =?utf-8?B?am5ULzZvclhXQVZYL2hDK0lVdm9xTGtkUzUyTnpwRHMxV2VOSzA1OWdlVjlw?=
 =?utf-8?B?MUVuQzN6c1VxZDRhNzlPaUJqMlNTc2NTT2Y0VTUwcTVXVjU5NTBRZHcvdVdn?=
 =?utf-8?B?VEVWR2t3RzE4bWxjaTcyWmFYcWlpbzBPOHEvaHpxdU5XT0EybGFYaHhuZUtE?=
 =?utf-8?B?dmpwdWJjcnBUZzZidFZMSzdnckhCeHdVc1dINnZyQmwrcndlYlQ2eDYwOVJR?=
 =?utf-8?B?NXdWQVJPTGJ1L1djbzV4eWNEakpaNGhibEZlTTBmK3JUUWZvUUxWOG9oZHk0?=
 =?utf-8?B?U2Y0eVY3SFZUcG13MVNjWTI5NHRuYmxEV3NsVDB1WGlTa1Z2RGh6VkgxVjJi?=
 =?utf-8?B?cEF3VFhoeG02SzYzSmFkNHAzQmt0bVpNcGgrLytQWHhIQnBpZ0NPTkQ4Q3FE?=
 =?utf-8?B?OGl2RHl6ZDNBdVhEQW9DRitZQ3NLd3RSaU00V0RXY0ZNRC9uWXlzcXBVUkFL?=
 =?utf-8?B?bzlZT3BKc1BpL2ZpbXJ5aFlQQkltcnRZM3FOVll5eDZ4R2h2Q1dITk1WYkgz?=
 =?utf-8?B?U0Q2UlI3eS9vWjN2TGtpTjFZVUdqaEUvQlFPS0ZRNEFpaC9XSmpCTHVaSytB?=
 =?utf-8?B?d052YnNDZ3RNeDgrQTQrRmI5dzF4U2lkN3lQaXlRV0QyMzZQWi9PMTV3YUVt?=
 =?utf-8?B?L0g4czhmUlYvMVNlWm1HN202bFNBWlNXM0wyVDYyRGdjczMwa0NaeHoySWNv?=
 =?utf-8?B?YXE1N1JzZWRKOEdoUWxOWHBtMVJGY3Zoa2o0dzRDZzJ2ZmllUGE4Q09UR3ZY?=
 =?utf-8?B?RzVYbWJUNGNnMENubHEvN1N6cjNWcFB4NlZhdnJmL2w0OC9MUlIvbExHeUNU?=
 =?utf-8?B?ai9yTjduMW5wUE1WMjhnNEh1VG9ncTNQZ1pNN2NWWUpxR0JxR0VLeW9PdlNl?=
 =?utf-8?B?S1o4aU16TlVQa1BuK2xHTGhWMzFVeHFBbVoycHN4VThZUXNVNEcvN2ZUWDJT?=
 =?utf-8?B?TEtob1Z1R3JzcXlDWDNRenh6RTZxYklpcHZ3N1BDU09pam96aGtMdUdtQ3dM?=
 =?utf-8?B?YUJZSlVraXpmQnVHcmxJa05uV1lTT2hvL3RvNFh3Mnh6TnJUcit6Ulpld0th?=
 =?utf-8?B?cWRyQ2xvMWJUNHlyRmZzTnBENzl3OW1vVFg3ZzFIM1NUd0tEQTVqOWNVMjh4?=
 =?utf-8?B?R3hQVlVYOGtselhXdTgyWTNJQjZzdW9FRXZTSzFjeXlrYTBDT1BlQldLeno3?=
 =?utf-8?B?NGg1Zm4xa1BUWDd6MWMrTm9ScVJYT2NteUNuL0RnV0tlMDVVYlhFN3REN3JL?=
 =?utf-8?B?SWZhMnB0RXBDYk1sS0ZaM3VaRHM3Y29oM1lpWnIvbnI1NW5IZ0crREpad1JX?=
 =?utf-8?B?M1RPTk5sNnB0UUlhaE5yOExrQ2dpMlhFUkd5d3crdStwQkhTUVRoa1Z1bUZu?=
 =?utf-8?B?K0hqYlo4T1VVQU1Id25RM243b1dxQWFrU0NROU05QThjam1VUXYrOWtaTlJk?=
 =?utf-8?B?amFhQ1dqTVJRLzZvSGJvTGpoZFp5VU1xSEdyQ2cvUnZFNkZJSThuWXNzdG8w?=
 =?utf-8?B?a1RkZkxhellWd0hmS09jeTlSWWV2SDUxd3FZNFY5SmdoOHNHdEVYOFFvRGhC?=
 =?utf-8?B?VzRhdWtpb3lYUHY0UDAzeGZ4dVUvb1l2OFlsRW53UnIrSUJ0cGoxOTluT2ts?=
 =?utf-8?B?SjR6OXMwV2xtQTFCdjJFMDhIaG55YnBOVVE3Uk80ZldCd1NyUnNLRGtzR0xI?=
 =?utf-8?B?b01VUnRYWGVxWGM1Vlhnclh4akQ5T1VnOFh6YlFvVEk4ZXpFdUUxWVRuaDRT?=
 =?utf-8?B?SWFGNmgzdXdKMU1QVy9qL2xZMHlVanRUc3VPRzltZldoQWFJVFY0cFdxN1Jj?=
 =?utf-8?B?TE9TcG42KzhOd1dCaVdUaHZnZ3NqN01GbEZ0TnMvdGpTd1ZpK1lvUU92V3R6?=
 =?utf-8?B?b2o2dnJ6R2x4NGNFNGg5RmN6KzZXU0U4NjdPbzFoeHljbjBVYndvWmd3MG5C?=
 =?utf-8?B?ekx3d3Q0OGwwSStCQTFMN1JnZVBQaHRvR3R6NTFSOUs4VEhXSEg2TyszNEpq?=
 =?utf-8?B?dzdudXdwNlhpNnhiUGd6NFVmdDNNL05ZZG00RHR2Y3MzMmV0RkkrdElvOXpq?=
 =?utf-8?Q?6CtG+gDQXLNCmxuaNRcuecEdD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b68c612-ea57-443f-a2ee-08de290fcc25
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:08:16.1669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqTtBE6Whyr138LjOEdNr+2+mbcQ1JrbIPIdRs0Fb0HJYiB842QniAb4RtJ9MM/S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6420
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



On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> It avoids duplicated code and allows to output a warning.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 ++++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  6 ++++++
>  2 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 54f7c81f287b..7167db54d722 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3309,9 +3309,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>  	if (r)
>  		goto init_failed;
>  
> -	if (adev->mman.buffer_funcs_ring &&
> -	    adev->mman.buffer_funcs_ring->sched.ready)
> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  
>  	/* Don't init kfd if whole hive need to be reset during init */
>  	if (adev->init_lvl->level != AMDGPU_INIT_LEVEL_MINIMAL_XGMI) {
> @@ -4191,8 +4189,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
>  
>  	r = amdgpu_device_ip_resume_phase2(adev);
>  
> -	if (adev->mman.buffer_funcs_ring->sched.ready)
> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  
>  	if (r)
>  		return r;
> @@ -5321,8 +5318,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
>  	return 0;
>  
>  unwind_evict:
> -	if (adev->mman.buffer_funcs_ring->sched.ready)
> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  	amdgpu_fence_driver_hw_init(adev);
>  
>  unwind_userq:
> @@ -6050,8 +6046,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
>  				if (r)
>  					goto out;
>  
> -				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
> -					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
> +				amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
>  
>  				r = amdgpu_device_ip_resume_phase3(tmp_adev);
>  				if (r)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 489880b2fb8e..9024dde0c5a7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2233,6 +2233,12 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
>  		return reserved_windows;
>  
> +	if ((!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) &&
> +	    enable) {
> +		dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
> +		return 0;
> +	}
> +

Only check that when enabling the functions. Could be that when disabling them we have sched.ready set to false already.

Apart from that looks good to me.

Regards,
Christian.

>  	if (enable) {
>  		struct amdgpu_ring *ring;
>  		struct drm_gpu_scheduler *sched;

