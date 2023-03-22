Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8396C58DF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 22:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A64E10E142;
	Wed, 22 Mar 2023 21:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E6410E142;
 Wed, 22 Mar 2023 21:38:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QI2T+aAanvH926KbgY36RBwnwDdVEzdh0La3Qre3j5BgYJN2kW5miiemEzXcVgetVpzKkPf1W4IMfq25r/xUHg1gMOGyfSTRguOj/rYiBDeaNVxbIY7xoasWtb0MufPSx+w7o0pj4v4JXoSnwp/oD0XAhKDZpppXZmIw5AWEBbtCusEs2ntCuxbCySbiUbKUqoFIMd0C6RSMdqCyJPrQXQhJkZybCPupKyxpvunFFCo0t4Oj/CD+Kv2w+MKPw9WkTntymvJBrXeVNqbyNfi++0lQP06MR5BVAwSI4bvGOykkab2nkVkmnIEuog2qWKUlSB144tZg8Lfdx/k3IV2qxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0ckhGGtx4Eb74J91Nh7osFdOeR66lxYJeRnSrNA6OI=;
 b=SPue595Xf7wSbot20pd9uu2q+3Qld2nnYlYOml8oSQYXmtvIz+8YEyoYLlUz68OHKFpG+W3EsscdgKoJ3T/v3BWdhclW7Eq5hRdFU+xapMV16nw7HMz7I3HYISqipd2CVNkRAj8aTDQ1F66PNRXPdC9z5PrLXS9CwhWwImOcbKuf1UVOVjv2DsYYRjnXfwVijUsaGBTr6W3MNrPjwe/4NVITDsnMiXMk3xZmIArElaENy2KaVO58GTxPW1W5VjtV6S8dvBn9UhYDzfRJDl4aSfNZtwxtisplxRBlg2XW7Yd7Nnf7VFQZKf1fL/ldlPcwIyRoMOm0fanamQ0OOsipMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0ckhGGtx4Eb74J91Nh7osFdOeR66lxYJeRnSrNA6OI=;
 b=TmEx3wGBQzsMqqOpEMBNdZ3E+isJLaRekA39Jo6D2WsuXEV1rr4vRy7SQCE+7qQMRqSRuKHKJ7Ql9FGre2v/rBZ/zzXSqFsoS8GBAgEbnTbtMKrEWg2o48X7sCQ1RLSc3guMYuX9ERKgrFUxQQJ2E4JDuaDb/9W46ZD9Kt3JWMg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB6307.namprd12.prod.outlook.com (2603:10b6:208:3e5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 21:38:02 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 21:38:02 +0000
Message-ID: <bf637275-d2f4-f6a9-e594-65b26cd975df@amd.com>
Date: Wed, 22 Mar 2023 17:38:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 26/32] drm/amdkfd: add debug set and clear address watch
 points operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-27-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230125195401.4183544-27-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0295.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::20) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: d6377c97-92e0-4c97-aab0-08db2b1db6e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AMR6WDsR8JRW5iH8LM21G/i/iPlDgM/Ei+r0ncQVoprXYMKBqW03pWZkYGwwoqr8RDCNvzGsdrse8LyWVjleQ6Co6zeDClgulsnx/nZBXbyCCkdV3kV3g/V0MtFQkBxbE4xTB1JDTcpWwuRMTiPq+jMAq21py5vrQGe/2zmV+VElCLotXgw9qEzOOCcAa0JVbzHOZ/Hl8/BiBmDQJLlrKrGMYrRWoDz/GpRqM1sSMY3r+sT15m2fwKhD3/pR1qPi3OWy9nQg6iK4YGrXRsPnXbdqUCZpzYEEB1h4RhC7FbLNJPsPaJjgl1JQIoQzClknLjq+XG3LAe9iWXux0/pGNRcxtA7duXjmk44KUHfZA0QjAkq/aeJw6IgsuDVcQur9KhQuunPLJFruuGx8Hqh6enRGT7mbXNKxyRyMCjgCH5XEHWRPoG3JE4tU3AilpHFEisUtc8wktx/8y8FgTziwpuuBOoTkzhXLWb9+uUGvd3yI+tIUETsqqvuQ0RFvoESFXPdH2hBSUMGLwVGczmpj1vrngAeBWdyonoRuF/5TXl9MSiKBX9+vxogQLHRlWmmlNfl2EfZj5bAcNAUMyzPQnq3+ArcLsd0leDA60xNaH2NuH3BN81uMyHvrgN5jd6tZl/TwH0spvaoTFd4hzW9Zya3ZDWuxPVARLWvHzghy0e5SRA8v78O+pHWgJLFdGj8Qzav5VoRaFNmsvxuKbmJjA053R1cG07gTgqfyFgfGASk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199018)(6486002)(186003)(83380400001)(6506007)(26005)(478600001)(31686004)(2616005)(316002)(450100002)(8676002)(66556008)(66476007)(66946007)(6512007)(44832011)(5660300002)(41300700001)(30864003)(2906002)(38100700002)(8936002)(31696002)(36756003)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXJ2ZWVHd0gxSzBSYmc1VU0vdllzOUdCS25Rb3NjRDRDSkxjWHRSVWhPYXg0?=
 =?utf-8?B?WDRLMnlOMDVTYUFSWGg5NHdjKytOU3RwclREOG1wS1o2czVtSENkdndlYWMy?=
 =?utf-8?B?MFdlcE5mclczamg3c2ZNUVJBMWJ0V2JFM1VVUEhEYlg1SERNR3hnWW5iS3BH?=
 =?utf-8?B?UVhoR2lNOE0zR1daVkhWbE9vaHdmWkNnQWR0STVXaHMvYTNPMlJPbU1PeFEv?=
 =?utf-8?B?enJUYWdidWJrNVBHQk1RN29xbjRXNXdadS9QYnE2aWdkaEtadGllTmFxTEtr?=
 =?utf-8?B?TlB2THFQdExpc2hUVWd3Z3ptZThWOFc0K2tYd3JabzRYNGV2eW5hSGJXbjhU?=
 =?utf-8?B?V0hZNG0wanN2bHNXZ3pYU0FPNHlsVmszcmJkTFowTmlENW1YMEFOQ3d6dDZp?=
 =?utf-8?B?SXM0aU41Uzdqc2I3ekUrUHFuOWlFNTd1L2xTWVNrbWJEcHFvdkpqdDMyQnAv?=
 =?utf-8?B?cmdRbURoWVJzRmZyRUhXeEIwdDh6emRlRTdIUEl0d2h4bTUzYzRBay85VHEv?=
 =?utf-8?B?UktjM0pUV2doRkhsWlk1KzU3MC8xcXVIam02NktwRlpkVmVEY0lINlUwQmk3?=
 =?utf-8?B?TzFGdURkb2t4RmJHNXBOYUNYSldxM3BUQyt5OHNYdElVL0RxdzVHNVVaek1Y?=
 =?utf-8?B?WVh4eTVPeHY4aWVaUkVhUXFnSUd4Y09LMW9KZTFFUHlyVGZEenNwemN3aEVH?=
 =?utf-8?B?a0JFQllXVlRnMDZFaEE1ZXJyYmtDdks0Z2dVdU9WbXdBendaOTEyNGkwWFJJ?=
 =?utf-8?B?SEhDUC9NdC96YUdaTUQrdGZXbXJ0ck5XcUgvNzByUXRTYVhkK0J3YlVyY0VE?=
 =?utf-8?B?YjJPRlM4ZVZDczZvL1Y5UjJUQ2Z5WXNuT1VYNXYva01KdlZOQmxDenhuR0h2?=
 =?utf-8?B?NEczcGxMYmFRbGtyajRpb0J3STg1My95bGUxTFdxOGg4QmxpZ0VjRmFGNTgy?=
 =?utf-8?B?UnlXMTZ5Z0phaGdlWjNvaUtWdmlNdXA2dWhDMHA2T3c0YTBIUnZid1R5cDRm?=
 =?utf-8?B?VEJYZGlqbFB2Z1VUN1NWUnBMSTRQd1h0OXhsUUhQTjNrRTdDaVFhOFpuaGtv?=
 =?utf-8?B?a1JoOU9tUTZzTktrT21qN1JxQ1NQeWlsY1doRnRndUFpWXlTNkZ5S2syVTYz?=
 =?utf-8?B?Tm9GR2toNTJLWENWVHBTTE1VNGNueTN6ek9zTkkyQzNnYks0eVZSWjd4L3pT?=
 =?utf-8?B?UWh4enlSNCsvTDljVnNtY0ZuYnNjZ3piM0pYbVFia1ZmZ0x4bmkrRmRBK05O?=
 =?utf-8?B?ZEF5RTY3UXJOSXBDUEd2aXVHcFk2QTBxdHNZNkovdTJYMStnVDNzei9ESnFl?=
 =?utf-8?B?Q2cvaTFrK21YT1VhN1U3RUgrVCtYS1lQUnFNQWVpMWNLcGhqQmFSWkYvU1ND?=
 =?utf-8?B?ZXRsU3c0cUZ0RHFIakJjbTI0c1ZPRWgzRTFBOWNpNkxDd0JYeDJSekl1aEFs?=
 =?utf-8?B?RkNyZEd0TXZTaHBUMmdWS1dFSnZDNjU2MFREQ0pSOGVFR1QvYWpvS3hVM1ZG?=
 =?utf-8?B?UTc4SlJwV0VjYzMwUkhvYUdrcDlTQWRRZlB1YjJWQkhtLytzb2s1WG84anJV?=
 =?utf-8?B?TTVPMFozL0hJeHRET05GTXQ0YklQN1AzZXAzK2ZvVWFHVkhqYlpTdGRvRVk2?=
 =?utf-8?B?RVVUdFdWTk9WTTE3Y0tlVTNsS3JhZGhhM2ErbkxuUnFQaWRqY3FrYkRmQTFE?=
 =?utf-8?B?MVA4Z1lHR1M5enhNVFUwYUY0MGs1L2d4UXlJMmRDS3lJcmg5NGlCVC9saGlS?=
 =?utf-8?B?Z0ErN2RqelVhYjU5U0oweFdUQUpYTWxsLzFGaHBnZ2J2OGRubmNrVDBVaVBJ?=
 =?utf-8?B?eHBDcUlDWFV0eVRhREluSkgyVDZZemszdUpoQVREaWZXNHI3SXc4ZjJJYllM?=
 =?utf-8?B?TFMvNGdjYWJUUXJPeW5KY1JIZjU0VEZGdER6SE9pRDFwTFRPYVJzWU52Q0Jt?=
 =?utf-8?B?eWFxWDlJVkl6TlBla0ZkQngwTTJVSkE4dThOdjl3VjYzeXJTV0hVUGRQdkNj?=
 =?utf-8?B?ekdkZDRxVVdTUEVJS2xsVXRLeEZEQTN2dmZ6YnJLdVMwN056NjZSYTh0cG9Q?=
 =?utf-8?B?Ky91NitIcjlGbzByUmE3NjBlQ0k2UGRmcFZ4ckozV2xyWXR6VWVPU3ZoOXE0?=
 =?utf-8?Q?M2r45gUQioPchxovNMeLqbXRL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6377c97-92e0-4c97-aab0-08db2b1db6e7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 21:38:02.8395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TRVZWyE75IGQe0EULfjI/POKP8hLeufzd0yjm+clahUhbJC8WC8ZSeHH8q5QVfUAWukJ9PmYJcIcY17+GsOvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6307
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


Am 2023-01-25 um 14:53 schrieb Jonathan Kim:
> Shader read, write and atomic memory operations can be alerted to the
> debugger as an address watch exception.
>
> Allow the debugger to pass in a watch point to a particular memory
> address per device.
>
> Note that there exists only 4 watch points per devices to date, so have
> the KFD keep track of what watch points are allocated or not.
>
> v3: add gfx11 support.
> cleanup gfx9 kgd calls to set and clear address watch.
> use per device spinlock to set watch points.
> fixup runlist refresh calls on set/clear address watch.
>
> v2: change dev_id arg to gpu_id for consistency
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  |  51 +++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    |  78 ++++++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |   8 ++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |   5 +-
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    |  52 ++++++-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |  77 ++++++++++
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |   8 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  24 ++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 136 ++++++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |   8 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_device.c       |   1 +
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   6 +-
>   13 files changed, 451 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> index 4de2066215b4..18baf1cd8c01 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> @@ -118,6 +118,55 @@ static uint32_t kgd_aldebaran_set_wave_launch_mode(struct amdgpu_device *adev,
>   	return data;
>   }
>   
> +#define TCP_WATCH_STRIDE (regTCP_WATCH1_ADDR_H - regTCP_WATCH0_ADDR_H)
> +static uint32_t kgd_gfx_aldebaran_set_address_watch(
> +					struct amdgpu_device *adev,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t watch_id,
> +					uint32_t watch_mode,
> +					uint32_t debug_vmid)
> +{
> +	uint32_t watch_address_high;
> +	uint32_t watch_address_low;
> +	uint32_t watch_address_cntl;
> +
> +	watch_address_cntl = 0;
> +	watch_address_low = lower_32_bits(watch_address);
> +	watch_address_high = upper_32_bits(watch_address) & 0xffff;
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MODE,
> +			watch_mode);
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MASK,
> +			watch_address_mask >> 6);
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VALID,
> +			1);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_H) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_high);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_L) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_low);
> +
> +	return watch_address_cntl;
> +}
> +
> +uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *adev,
> +					uint32_t watch_id)
> +{
> +	return 0;
> +}
> +
>   const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
>   	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
> @@ -140,6 +189,8 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.validate_trap_override_request = kgd_aldebaran_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_aldebaran_set_wave_launch_trap_override,
>   	.set_wave_launch_mode = kgd_aldebaran_set_wave_launch_mode,
> +	.set_address_watch = kgd_gfx_aldebaran_set_address_watch,
> +	.clear_address_watch = kgd_gfx_aldebaran_clear_address_watch,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index 500013540356..a7fb5ef13166 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -413,6 +413,8 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
>   	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
>   	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
> +	.set_address_watch = kgd_gfx_v9_set_address_watch,
> +	.clear_address_watch = kgd_gfx_v9_clear_address_watch,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> index 7591145bc69f..c9246370984c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> @@ -878,6 +878,82 @@ uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +#define TCP_WATCH_STRIDE (mmTCP_WATCH1_ADDR_H - mmTCP_WATCH0_ADDR_H)
> +uint32_t kgd_gfx_v10_set_address_watch(struct amdgpu_device *adev,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t watch_id,
> +					uint32_t watch_mode,
> +					uint32_t debug_vmid)
> +{
> +	uint32_t watch_address_high;
> +	uint32_t watch_address_low;
> +	uint32_t watch_address_cntl;
> +
> +	watch_address_cntl = 0;
> +
> +	watch_address_low = lower_32_bits(watch_address);
> +	watch_address_high = upper_32_bits(watch_address) & 0xffff;
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VMID,
> +			debug_vmid);
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MODE,
> +			watch_mode);
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MASK,
> +			watch_address_mask >> 7);
> +
> +	/* Turning off this watch point until we set all the registers */
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VALID,
> +			0);
> +
> +	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_cntl);
> +
> +	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_H) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_high);
> +
> +	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_L) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_low);
> +
> +	/* Enable the watch point */
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VALID,
> +			1);
> +
> +	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_cntl);
> +
> +	return 0;
> +}
> +
> +uint32_t kgd_gfx_v10_clear_address_watch(struct amdgpu_device *adev,
> +					uint32_t watch_id)
> +{
> +	uint32_t watch_address_cntl;
> +
> +	watch_address_cntl = 0;
> +
> +	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_cntl);
> +
> +	return 0;
> +}
> +
> +
>   /* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
>    * The values read are:
>    *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
> @@ -966,6 +1042,8 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
>   	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
>   	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
> +	.set_address_watch = kgd_gfx_v10_set_address_watch,
> +	.clear_address_watch = kgd_gfx_v10_clear_address_watch,
>   	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
>   	.program_trap_handler_settings = program_trap_handler_settings,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> index 34c04a2bb83b..334ff16e25db 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> @@ -39,6 +39,14 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
>   					 uint8_t wave_launch_mode,
>   					 uint32_t vmid);
> +uint32_t kgd_gfx_v10_set_address_watch(struct amdgpu_device *adev,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t watch_id,
> +					uint32_t watch_mode,
> +					uint32_t debug_vmid);
> +uint32_t kgd_gfx_v10_clear_address_watch(struct amdgpu_device *adev,
> +					uint32_t watch_id);
>   void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
>   void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
>   					       uint32_t wait_times,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> index 8627c5458973..ee36ba045dcf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> @@ -676,6 +676,7 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
>   	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
> -	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode
> -
> +	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
> +	.set_address_watch = kgd_gfx_v10_set_address_watch,
> +	.clear_address_watch = kgd_gfx_v10_clear_address_watch
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> index 4fdc25222dcd..358c219fb704 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> @@ -736,6 +736,54 @@ static uint32_t kgd_gfx_v11_set_wave_launch_mode(struct amdgpu_device *adev,
>   	return data;
>   }
>   
> +#define TCP_WATCH_STRIDE (regTCP_WATCH1_ADDR_H - regTCP_WATCH0_ADDR_H)
> +static uint32_t kgd_gfx_v11_set_address_watch(struct amdgpu_device *adev,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t watch_id,
> +					uint32_t watch_mode,
> +					uint32_t debug_vmid)
> +{
> +	uint32_t watch_address_high;
> +	uint32_t watch_address_low;
> +	uint32_t watch_address_cntl;
> +
> +	watch_address_cntl = 0;
> +	watch_address_low = lower_32_bits(watch_address);
> +	watch_address_high = upper_32_bits(watch_address) & 0xffff;
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MODE,
> +			watch_mode);
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MASK,
> +			watch_address_mask >> 7);
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VALID,
> +			1);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_H) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_high);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_L) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_low);
> +
> +	return watch_address_cntl;
> +}
> +
> +uint32_t kgd_gfx_v11_clear_address_watch(struct amdgpu_device *adev,
> +					uint32_t watch_id)
> +{
> +	return 0;
> +}
> +
>   const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
>   	.program_sh_mem_settings = program_sh_mem_settings_v11,
>   	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v11,
> @@ -756,5 +804,7 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
>   	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override,
> -	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode
> +	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode,
> +	.set_address_watch = kgd_gfx_v11_set_address_watch,
> +	.clear_address_watch = kgd_gfx_v11_clear_address_watch
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> index a3c8f5578788..43296b78d888 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> @@ -814,6 +814,81 @@ uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +#define TCP_WATCH_STRIDE (mmTCP_WATCH1_ADDR_H - mmTCP_WATCH0_ADDR_H)
> +uint32_t kgd_gfx_v9_set_address_watch(struct amdgpu_device *adev,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t watch_id,
> +					uint32_t watch_mode,
> +					uint32_t debug_vmid)
> +{
> +	uint32_t watch_address_high;
> +	uint32_t watch_address_low;
> +	uint32_t watch_address_cntl;
> +
> +	watch_address_cntl = 0;
> +
> +	watch_address_low = lower_32_bits(watch_address);
> +	watch_address_high = upper_32_bits(watch_address) & 0xffff;
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VMID,
> +			debug_vmid);
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MODE,
> +			watch_mode);
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MASK,
> +			watch_address_mask >> 6);
> +
> +	/* Turning off this watch point until we set all the registers */
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VALID,
> +			0);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_cntl);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_H) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_high);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_L) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_low);
> +
> +	/* Enable the watch point */
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VALID,
> +			1);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_cntl);
> +
> +	return 0;
> +}
> +
> +uint32_t kgd_gfx_v9_clear_address_watch(struct amdgpu_device *adev,
> +					uint32_t watch_id)
> +{
> +	uint32_t watch_address_cntl;
> +
> +	watch_address_cntl = 0;
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_cntl);
> +
> +	return 0;
> +}
> +
>   /* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
>    * The values read are:
>    *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
> @@ -1085,6 +1160,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
>   	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
>   	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
> +	.set_address_watch = kgd_gfx_v9_set_address_watch,
> +	.clear_address_watch = kgd_gfx_v9_clear_address_watch,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> index 2a2ab42037e4..ba52b61b68c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> @@ -77,6 +77,14 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   					     uint32_t trap_mask_request,
>   					     uint32_t *trap_mask_prev,
>   					     uint32_t kfd_dbg_trap_cntl_prev);
> +uint32_t kgd_gfx_v9_set_address_watch(struct amdgpu_device *adev,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t watch_id,
> +					uint32_t watch_mode,
> +					uint32_t debug_vmid);
> +uint32_t kgd_gfx_v9_clear_address_watch(struct amdgpu_device *adev,
> +					uint32_t watch_id);
>   void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
>   void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device *adev,
>   					       uint32_t wait_times,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index b62e93b35a44..8f2ede781863 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2802,6 +2802,7 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   	struct task_struct *thread = NULL;
>   	struct pid *pid = NULL;
>   	struct kfd_process *target = NULL;
> +	struct kfd_process_device *pdd = NULL;
>   	int r = 0;
>   
>   	if (sched_policy == KFD_SCHED_POLICY_NO_HWS) {
> @@ -2869,6 +2870,20 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   		goto unlock_out;
>   	}
>   
> +	if (args->op == KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH ||
> +			args->op == KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH) {

The indentation is still messed up here. The second line should be 
aligned with the open parenthesis. With that fixed, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> +		int user_gpu_id = kfd_process_get_user_gpu_id(target,
> +				args->op == KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH ?
> +					args->set_node_address_watch.gpu_id :
> +					args->clear_node_address_watch.gpu_id);
> +
> +		pdd = kfd_process_device_data_by_id(target, user_gpu_id);
> +		if (user_gpu_id == -EINVAL || !pdd) {
> +			r = -ENODEV;
> +			goto unlock_out;
> +		}
> +	}
> +
>   	switch (args->op) {
>   	case KFD_IOC_DBG_TRAP_ENABLE:
>   		if (target != p)
> @@ -2921,7 +2936,16 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   				(uint32_t *)args->resume_queues.queue_array_ptr);
>   		break;
>   	case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
> +		r = kfd_dbg_trap_set_dev_address_watch(pdd,
> +				args->set_node_address_watch.address,
> +				args->set_node_address_watch.mask,
> +				&args->set_node_address_watch.id,
> +				args->set_node_address_watch.mode);
> +		break;
>   	case KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH:
> +		r = kfd_dbg_trap_clear_dev_address_watch(pdd,
> +				args->clear_node_address_watch.id);
> +		break;
>   	case KFD_IOC_DBG_TRAP_SET_FLAGS:
>   	case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
>   	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 730e53584113..8d2e1adb442d 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -24,6 +24,8 @@
>   #include "kfd_device_queue_manager.h"
>   #include <linux/file.h>
>   
> +#define MAX_WATCH_ADDRESSES	4
> +
>   void debug_event_write_work_handler(struct work_struct *work)
>   {
>   	struct kfd_process *process;
> @@ -291,6 +293,139 @@ int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
>   						pdd->watch_points, flags);
>   }
>   
> +#define KFD_DEBUGGER_INVALID_WATCH_POINT_ID -1
> +static int kfd_dbg_get_dev_watch_id(struct kfd_process_device *pdd, int *watch_id)
> +{
> +	int i;
> +
> +	*watch_id = KFD_DEBUGGER_INVALID_WATCH_POINT_ID;
> +
> +	spin_lock(&pdd->dev->watch_points_lock);
> +
> +	for (i = 0; i < MAX_WATCH_ADDRESSES; i++) {
> +		/* device watchpoint in use so skip */
> +		if ((pdd->dev->alloc_watch_ids >> i) & 0x1)
> +			continue;
> +
> +		pdd->alloc_watch_ids |= 0x1 << i;
> +		pdd->dev->alloc_watch_ids |= 0x1 << i;
> +		*watch_id = i;
> +		spin_unlock(&pdd->dev->watch_points_lock);
> +		return 0;
> +	}
> +
> +	spin_unlock(&pdd->dev->watch_points_lock);
> +
> +	return -ENOMEM;
> +}
> +
> +static void kfd_dbg_clear_dev_watch_id(struct kfd_process_device *pdd, int watch_id)
> +{
> +	spin_lock(&pdd->dev->watch_points_lock);
> +
> +	/* process owns device watch point so safe to clear */
> +	if ((pdd->alloc_watch_ids >> watch_id) & 0x1) {
> +		pdd->alloc_watch_ids &= ~(0x1 << watch_id);
> +		pdd->dev->alloc_watch_ids &= ~(0x1 << watch_id);
> +	}
> +
> +	spin_unlock(&pdd->dev->watch_points_lock);
> +}
> +
> +static bool kfd_dbg_owns_dev_watch_id(struct kfd_process_device *pdd, int watch_id)
> +{
> +	bool owns_watch_id = false;
> +
> +	spin_lock(&pdd->dev->watch_points_lock);
> +	owns_watch_id = watch_id < MAX_WATCH_ADDRESSES &&
> +			((pdd->alloc_watch_ids >> watch_id) & 0x1);
> +
> +	spin_unlock(&pdd->dev->watch_points_lock);
> +
> +	return owns_watch_id;
> +}
> +
> +int kfd_dbg_trap_clear_dev_address_watch(struct kfd_process_device *pdd,
> +					uint32_t watch_id)
> +{
> +	int r;
> +
> +	if (!kfd_dbg_owns_dev_watch_id(pdd, watch_id))
> +		return -EINVAL;
> +
> +	if (!pdd->dev->shared_resources.enable_mes) {
> +		r = debug_lock_and_unmap(pdd->dev->dqm);
> +		if (r)
> +			return r;
> +	}
> +
> +	amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
> +	pdd->watch_points[watch_id] = pdd->dev->kfd2kgd->clear_address_watch(
> +							pdd->dev->adev,
> +							watch_id);
> +	amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> +
> +	if (!pdd->dev->shared_resources.enable_mes)
> +		r = debug_map_and_unlock(pdd->dev->dqm);
> +	else
> +		r = kfd_dbg_set_mes_debug_mode(pdd);
> +
> +	kfd_dbg_clear_dev_watch_id(pdd, watch_id);
> +
> +	return r;
> +}
> +
> +int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t *watch_id,
> +					uint32_t watch_mode)
> +{
> +	int r = kfd_dbg_get_dev_watch_id(pdd, watch_id);
> +
> +	if (r)
> +		return r;
> +
> +	if (!pdd->dev->shared_resources.enable_mes) {
> +		r = debug_lock_and_unmap(pdd->dev->dqm);
> +		if (r) {
> +			kfd_dbg_clear_dev_watch_id(pdd, *watch_id);
> +			return r;
> +		}
> +	}
> +
> +	amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
> +	pdd->watch_points[*watch_id] = pdd->dev->kfd2kgd->set_address_watch(
> +				pdd->dev->adev,
> +				watch_address,
> +				watch_address_mask,
> +				*watch_id,
> +				watch_mode,
> +				pdd->dev->vm_info.last_vmid_kfd);
> +	amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> +
> +	if (!pdd->dev->shared_resources.enable_mes)
> +		r = debug_map_and_unlock(pdd->dev->dqm);
> +	else
> +		r = kfd_dbg_set_mes_debug_mode(pdd);
> +
> +	/* HWS is broken so no point in HW rollback but release the watchpoint anyways */
> +	if (r)
> +		kfd_dbg_clear_dev_watch_id(pdd, *watch_id);
> +
> +	return 0;
> +}
> +
> +static void kfd_dbg_clear_process_address_watch(struct kfd_process *target)
> +{
> +	int i, j;
> +
> +	for (i = 0; i < target->n_pdds; i++)
> +		for (j = 0; j < MAX_WATCH_ADDRESSES; j++)
> +			kfd_dbg_trap_clear_dev_address_watch(target->pdds[i], j);
> +}
> +
> +
>   /* kfd_dbg_trap_deactivate:
>    *	target: target process
>    *	unwind: If this is unwinding a failed kfd_dbg_trap_enable()
> @@ -305,6 +440,7 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
>   
>   	if (!unwind) {
>   		cancel_work_sync(&target->debug_event_workarea);
> +		kfd_dbg_clear_process_address_watch(target);
>   		kfd_dbg_trap_set_wave_launch_mode(target, 0);
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index 0d70f162d6d8..63c716ce5ab9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -50,7 +50,13 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
>   					uint32_t *trap_mask_supported);
>   int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
>   					uint8_t wave_launch_mode);
> -
> +int kfd_dbg_trap_clear_dev_address_watch(struct kfd_process_device *pdd,
> +					uint32_t watch_id);
> +int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t *watch_id,
> +					uint32_t watch_mode);
>   int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
>   					unsigned int dev_id,
>   					unsigned int queue_id,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> index 6e25238d18f9..ca849cd051d5 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> @@ -641,6 +641,7 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
>   	}
>   
>   	kfd_smi_init(kfd);
> +	spin_lock_init(&kfd->watch_points_lock);
>   
>   	kfd->init_complete = true;
>   	dev_info(kfd_device, "added device %x:%x\n", kfd->adev->pdev->vendor,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index 8dc7cc1e18a5..cfc50d1690c7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -348,6 +348,10 @@ struct kfd_dev {
>   
>   	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
>   	struct dev_pagemap pgmap;
> +
> +	/* Track per device allocated watch points */
> +	uint32_t alloc_watch_ids;
> +	spinlock_t watch_points_lock;
>   };
>   
>   enum kfd_mempool {
> @@ -799,6 +803,7 @@ struct kfd_process_device {
>   	uint32_t spi_dbg_override;
>   	uint32_t spi_dbg_launch_mode;
>   	uint32_t watch_points[4];
> +	uint32_t alloc_watch_ids;
>   
>   	/*
>   	 * If this process has been checkpointed before, then the user
> @@ -955,7 +960,6 @@ struct kfd_process {
>   	struct semaphore runtime_enable_sema;
>   	bool is_runtime_retry;
>   	struct kfd_runtime_info runtime_info;
> -
>   };
>   
>   #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
