Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A95EEC918CE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 11:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A91010E8D3;
	Fri, 28 Nov 2025 10:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lS8l+2xO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAF910E8C1;
 Fri, 28 Nov 2025 10:01:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUnxERnnGi+xsH6afjOHHei1MsLvnm0fCIhq2tMZk0D1npzdCFKw+IQLTA1HkPQWoKPCqGoca1Gwr7qUkz1y40HOBtfHPGeT57IgJdN6nl2KJXS/61JisSDLawmVgNN0CoPg3nO43ZMXyYI6/V3ne01VlaNxSm3CDR6NPoURmTYHTaosuEbyHUXWiYaT5yNCcerYjfV8+73w+UpBBpHylibP15RoRiXiCG9NrdDZWM1yG72Lrl1qgB54qUxRLFtv2BUDFQxzIvh5tILsRU1vX95d1CUhEKsa8UeS0KeFAAXwyp4k5IabSBmfotkp1HcUXuxfiPmoW+lX525ef1l8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSNdZL51DhPMGA5l/0KHK6V4btyETg8rqRnNZ1TLnQI=;
 b=pWFkle+y8FntnN4/pa84W9/UM/Cqp+2/wYPcFGkikjzZW9JU+N153niHruIWk4mkW5CpcQHGPwIUDerkzdDiejWB+AvjJRxjn32fx8yVYksyPim1WQrwN7GGB0KqhSlhUTyh2pF12EitIHR4dYocg+Ix2XWNQY+KejalqjNj604PbnP8awv/yu5u25lSkvZ3/GwL6lVQ+dxpVjmAZAlq2MTwHgVIreFqqGBlfWppWXwR7FFPVhVTMDsnRgI4NmUfQdLXQuFdp0ePktWLJC9OBf1Lj4ObMPFtMv/R/ywQ6nFdLHUkbIk6YGgXRsl+dFZO0E2Km1KpGlB3hAR83qVayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSNdZL51DhPMGA5l/0KHK6V4btyETg8rqRnNZ1TLnQI=;
 b=lS8l+2xOnkj4lLmcvlgBX/30JitJ948U/na236wxvhNaQX/8GkYeCvP9qsy1WdWsa9z6CHjSJXcgshEHow/oQE4UOZ+7S9ZDi8Hk92HAeyVUUAvqG/ein4N7KOYQgm8neUt+teGEUoXRUOu9JtGpSWGipx1mJkvX3EAX4FkZKbQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN7PPF02710D35B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 10:01:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 10:01:12 +0000
Message-ID: <c3adc77f-aee5-458b-aa3c-30c3b2b3bd27@amd.com>
Date: Fri, 28 Nov 2025 11:01:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/18] drm/amdgpu: fix KFD eviction fence enable_signaling
 path
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-10-christian.koenig@amd.com>
 <cbf607a647ab40ef800b3deb23f7b9c14f0b38e7.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cbf607a647ab40ef800b3deb23f7b9c14f0b38e7.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:408:143::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN7PPF02710D35B:EE_
X-MS-Office365-Filtering-Correlation-Id: 1acf1a20-5636-40f2-a0a1-08de2e650fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWhpUHZEY3ozdFVVNlZ2VEphWVRpakM4SWZKL1BqdE0rdDFUaXk4ejZadjdh?=
 =?utf-8?B?andPclA2V0p3VndObzNHWVBlUzVUMnFUaU0zZWxQcm1OVERocUd1V2hBTFpE?=
 =?utf-8?B?clBxLzhmaHpGeVBBNE03azhsMGtseUxRaWlESURkeEVWRm90MlBBK1Rnc3lH?=
 =?utf-8?B?ZkNKQytEYzQ5cHY5NGtnQmZkZHFGeFR2UFR1LzhFcyt2TCt3THVTZUJzKzFz?=
 =?utf-8?B?ZDFuLytXMlZCYTNrMkZMSkFSdER3bFlaem40SHdZb0c3TVNhTmU5M01vRElj?=
 =?utf-8?B?MFBkbVpSQTRYd1ZGQ29BMjBvTlBWU1RwT0pYRlh1eXc0QmtNRmlWaEduRzVK?=
 =?utf-8?B?NHgwaGxsU3Z1QUJQZWNBWkFxckx2VHh1SUR1dVdoZHlqOHFFY0RGMHUwYTdB?=
 =?utf-8?B?enpubEs1MkFaVDlSL05GZXdsQ05xUDJMUndNTDFFM1d1c3RaRGpReFRDb3R3?=
 =?utf-8?B?aVd6SXk1VG5HSHRkTTZ5VlFXZGEyRFB0NitCUkp4S0RSMXUrV3piQ1FqN2lN?=
 =?utf-8?B?bXVzYTdFclhlcVl0OUVyZWYwWU5QZWg1a2FMZVBSUVV6YnlsZG5xTFM1UWJr?=
 =?utf-8?B?TmdTcXJWZldsRExYcjJBTVY3NXU3TEMyendjTUpGaXpqY2RZYW1oeGljdlIz?=
 =?utf-8?B?WVdLMmF3WE1XbWNsRVY0YUJ0QXdJenZIQkYyN2s4ZmhMd3Jva3BjS2RLcDRp?=
 =?utf-8?B?YU54Z1RRVVFlTUEvUjJZZGc4VGJLb080MUZ0TDd1NmlmZ0YyeEZoUUkyUUNj?=
 =?utf-8?B?b0JEZmZLazgwQnRYVUpKa2d4OUJtWEpwNFI5bm5uSTcyelpUQnViMU0zNG1N?=
 =?utf-8?B?bFZGVFhYWlhpZGxsVmxUWmlEYmJWYkVadDNYTUdJMDNqdnFCajV5TE9GZ2ow?=
 =?utf-8?B?WkFTZFBHMGtXTzJVRS9wbjJ5Zk50cVRJeGVqWWZPN1FDT2tqNStFY01Pa2o3?=
 =?utf-8?B?SHliU3I5SU4xRGorZnFsZkVKV3NtTElNU3ZWUUhvNTJscUtDU3ZNU0kvdnls?=
 =?utf-8?B?RVRld09BTE9qZWMvODVvaGh0Vmp6dzZ4QysvUTIvOW81V0k4Rzd5ODZFaTM0?=
 =?utf-8?B?M2RoTXc5MG1ta1V4K1FLdkFObXIzdWRZcExYdThBa2xGVktuTU5JKzZGMDdx?=
 =?utf-8?B?dFU5MFBmS2hySUNDWnFRek1ENlQzNTkzYXdxVnFrd0VDQ3NzUGZXTTRoTXla?=
 =?utf-8?B?VWM0WXFzdnB2MlB2ZmVOSmZCenBHTFFGZm10eGd0NHk4K0dBVVYvNVArVVNv?=
 =?utf-8?B?TkNaV1hPeTUyWXdZMlFrL0tiT1Y1NFkzSWdzN0l1Y3hHcDc5NXBmR2NsdkZH?=
 =?utf-8?B?R3ZQekJCRzV3OC9hcDNUL0FrZ2pmVDJCL2tZcE9hbzNNQUthR0s5L3JPYWJt?=
 =?utf-8?B?WitEemI1cWNnUkhCUmt5dy9kY1gzQ3B5YjlnQXkzWHJHRkd6cTZHVDBLQkNB?=
 =?utf-8?B?anIzaWZZOHVEMWRBWmV5M05UdjFhc2JyU1FyM2pUY3JUb0lGR0VYYU1GbzZN?=
 =?utf-8?B?LzVIUTBaZ2N0eGZ4Q053WWNBSndDSytPUkoxSVNaTmlnYWUrK2tQK1JoVmJS?=
 =?utf-8?B?czB3MmZJd0NVTSszYjc3VXBwUzdrSy9vcVVOMUMzMEh4a1IrUTJGTHZINlBX?=
 =?utf-8?B?ZkxBZHRLWUNQSDFuZEYrQXdNRCtaMEJiSHE3QUFWMlRVY1JCRTQrQkMzWGNV?=
 =?utf-8?B?a2ZxZmE1cWVIbzRqZW5IbUJza2N4cjRYakV6WDUvdkpMLy81ZnVUODY0UVlj?=
 =?utf-8?B?K0xweW5qMXBKQ1lRT3JyaGRtejZFZXpZUTd1djNwUXh3TFNsV0Q0cUdFNW5O?=
 =?utf-8?B?Z0VrZFZhOVdneTZIRmo3S0w0YzUvTWNUY3RCL3NEWktoamUrc1Jpcm50MHMv?=
 =?utf-8?B?TXFicDJHbHVBMFFLZk14cC8vYUp6QXRwTXdBK3FhWFZiTXdXRDkvWXRBUEV5?=
 =?utf-8?Q?CXtd/Pe5g9+rywldRp6UPVtdHGPUzzjt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eS9NMDAzYnkyYU9xMXlTTnljNmN6RHEwSzZZS1ZiOGdQTk9xUzVqUWdjQXEv?=
 =?utf-8?B?UlBkTFQ5UFF6QUFGYkxMcS93ODE0ZUNxUytuQUlGN3Mxem50dzY4TURJcEcz?=
 =?utf-8?B?UWtvTWJTZGhqdkhVUzRDMHFUR044dHJnTW1NY0NrV1J6Z1ROUjVSSmJ1UzVV?=
 =?utf-8?B?TGFhSWNZaWNZSEZOZzdyVnNoQXVJZVNleUdIWjB6MmFsMWVJNnpjN3lEeE5P?=
 =?utf-8?B?WDFqM1ZPSjBOZmE2MnhKZlV1RFlUbmt0TzZ0TzRVYTUyNmFwZGJVQmN0Rzhy?=
 =?utf-8?B?c2FKR09QaWVMc29maDV6Ri9zbjA5WldrSHdMaUNuQzhtN0g0NGkyemFTVGky?=
 =?utf-8?B?eG9xVWR1WmRnVmpZQ2NhQitFc3pUSFlPakhLU1lnMjdsbHAwYU1WTFVRYUlO?=
 =?utf-8?B?MUlRM2hvc0dkVUFUbEhHOCt0TnVVQUlwUFFJeVhRZnovZ3c1WmdDOXRDS2ZB?=
 =?utf-8?B?aDVuQkNMdmZLVWdYdDdkWWhoNHpzSkg2WVBhYS9ZejdVSVlpN2FTSGVhcW9o?=
 =?utf-8?B?c3JOQkFWYVM4MjFWejlsb2t1SnF5dGU2bTNwc296K0hWdndDcUpPS3NsTnpy?=
 =?utf-8?B?azZiMTRUMW1uY1ByQ28yRUhHUThBVkQ2NHZlUlBTTzZ0d0EvSDJWU1c2dGJW?=
 =?utf-8?B?WDNYVU9YWnRIbDVIM1ArK1NxSTMyZ2VRclIweDdkNEhoS1FvaDM0TkpXOHhH?=
 =?utf-8?B?OFZUalRNbTYyTVNJeThVdUFDZG4rbFlhcTVYa3g5Q3VLa1JJTmZXZ2REbXdO?=
 =?utf-8?B?ZHFOZnJVVE14MTdBbDh5dXFpdEVqOFVvNEtkMTFzNjJBZFZMRC9zZjFOa1pU?=
 =?utf-8?B?NXd3U0wwNHBPN1krYlNQdmZIK3JRVGRYOUFwVm13M09XVFlHM1lHWllIUkZN?=
 =?utf-8?B?aVVFUG9ITzkyMG9mdGwzd21wK0hCaWgrQzVmdFFrZWhic0dJQ1lXUEYwSnUy?=
 =?utf-8?B?YkN4SG42N3lhK2FOR2YvSTRRU3VqY29zRXBpVWNPei9aN3BVZElJb3lMaDVk?=
 =?utf-8?B?YisvQWo3bHl3ZllxV3Q3cGE0dG1yQjR3M3RRSWVvTlhuc0hnT0hMZVRHbTQr?=
 =?utf-8?B?RlNoSW1NYkJWYzl4ang2a2FZWW5DeU1VTDR4SExqRktQb1JXRkJ2Zng4aWdC?=
 =?utf-8?B?NEZPOVUyOVUyZ3dxVGZKRWJ4eER5a2VjV0F2YjBlMjBkY2tla3R5SFNTRGxl?=
 =?utf-8?B?OFFISlFHVFhIcDlKNGlHNzAwZTYzVVBGWjVDS1FXaFhZelVjNUdlV0p1VzdY?=
 =?utf-8?B?Yk4xSHF0RjROQ1F6UTExdW9DdnVSKzhjWVFLVW50ek5EcHQ5Y0FkNlBEZG9V?=
 =?utf-8?B?NVZ2d1h6cFQrcVhOV1BDc0d4RlJOK254dktvY1JBbm1VOGJNRUxyUVh1VTMx?=
 =?utf-8?B?WnVOZWgzbTFkcitGQzRnZWZiUFAyTjRuS3Fhc1lTK1pKdTQ2eG1pcFVTNlAx?=
 =?utf-8?B?M1ZhZTB5QUJsY0hPRWNFenlVWGJwRHVmYjE0UnhCd2lNNzZBcXVCSGZGRjIz?=
 =?utf-8?B?QVM2SUN2SkpNS05iSWg2SEF5SXliMk5pM2NrYmE2RmNVQlBDY2dhZWZwa3l2?=
 =?utf-8?B?T252VXp6Q0pwamR1VzVCb0d1QWNTT25vZnVzL2o4Rk5BWmdwcUo3aFVhbldC?=
 =?utf-8?B?SlBuZEg4cDUyRXJkNXhFMVdHNVNPRlYzRTVYWFJOMmNJanJxM01nOFVuYVNu?=
 =?utf-8?B?SVNEOG9qbHU5UENxWFJPODdTZkVhbitaUzZSMkt3bTJ4QnlYUHZnK21Jdm9N?=
 =?utf-8?B?RzNqekRaVkxVK2tUblo5aGlzSDdFL0R5QTZBMmVIZ3VUaDYvN21IMWwrS2dw?=
 =?utf-8?B?d3hRTTN0WHVNc0FlSkZ0NUhoRm9vU0h1ckd4d3NBa3l0UmFraGl0dHhVY2k2?=
 =?utf-8?B?SFlBRkx4UkpOOFZORDNkNjlUN29qSHJmc0l3akhWbHNoc0dNQ2JCSUxwVmNN?=
 =?utf-8?B?VkxwbDVJQTVnc2pab1JkQUJjSjlLUWhDalFqTU5rdTB5Kzk0emJGQlVpblRM?=
 =?utf-8?B?bjQweFR2blJBb0dNMFpOTUpSTHBtQWRYQVVydEZaTzc4Q2NPd01DVXVXR1JB?=
 =?utf-8?B?NUYvVFJxVDhTT3paQzkvdGQxR2ZRZVBPSnBMMUVWeTc4cDNhSUZVMGZpVjNY?=
 =?utf-8?Q?KZTE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acf1a20-5636-40f2-a0a1-08de2e650fae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 10:01:12.5654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1HDPyYx2OrPFlXXVQh8UuBATNO2hi1odnxXO8UggUAQdMu1+JGPb5k6gQsCthJ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF02710D35B
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

On 11/27/25 11:57, Philipp Stanner wrote:
> On Thu, 2025-11-13 at 15:51 +0100, Christian König wrote:
>> Calling dma_fence_is_signaled() here is illegal!
> 
> OK, but why is that patch in this series?

Because the next patch depends on it, otherwise the series won't compile.

My plan is to push the amdgpu patches through amd-staging-drm-next as soon as Alex rebased that branch on drm-next during the next cycle.

Regards,
Christian.

> 
> P.
> 
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>> index 1ef758ac5076..09c919f72b6c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>> @@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
>>  {
>>  	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
>>  
>> -	if (!fence)
>> -		return false;
>> -
>> -	if (dma_fence_is_signaled(f))
>> -		return true;
>> -
>>  	if (!fence->svm_bo) {
>>  		if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
>>  			return true;
> 

