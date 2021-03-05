Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F6532EBE0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 14:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC146EB7C;
	Fri,  5 Mar 2021 13:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EFD6EB7C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 13:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWwsWXiCEMqvKFguooMyLrsiZp5KZoG/poVDXicRD6vfKqFh3Z5eu1T8TeLoEccQcSkEqtfcqKQkpeMLMAVwbUKOMk5HGrDvnGoTxW+EwoE+94G6O1UBpQrcg7bSMf1RUd2CIESNLm0JgjTAw7vxJE1u93oT7MKrYhs8eDPpOq/kFrtcbrdtBnIpNUywE5mWoL8PUtZMWV7G/ayzqnscI+sj57sfoXcSYq2xzQBG4OJQgK/kM8CWX4yslohYhnA2EXy7VLxBgISOzkiBqQruTL5AgqifdLu3jJnaH2jC8Dj9H47dc/NIRpShkCD3a/DqXw051O7TNnp8nq2OifFNPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFQ9nVHgl7AhqrZhaN081H0g1NtomS7EXG5pWFcFvAs=;
 b=kA9zfT4pC0OzZMIslNVghPYgu6KxqwkESRCuJjvrUKT5u2x7r6F4v6kPtJqqerKpXQBt0dd3/wDkWPyBHpTMTYIawjIQcBHUpm3SblNT5O3sDf9FUbz3G7Hz4HfROmNs+KDW2HdlZ1LdWxbcBe4zD3I0EI6e2rg9pb3mnfI3Ie4CzCRKjVQbMmxU8aP4LAXLJrdbJIsc4vi1lTRw5tGTM7+kdvtoH85ujzDq91KCZwXUq1DJ1CLqfYQTCJTne37c/loLsn7W/EkhusuKgARtohEvTYJdd6bI/u2QBNIx+nlyaylc6aGRuygMPxpsQwLAb+J+X1vkPhBu1M15dq7yog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFQ9nVHgl7AhqrZhaN081H0g1NtomS7EXG5pWFcFvAs=;
 b=EBqmdT7+BRDmCreNHoadBGp6qiHspKSc1UW52oqL5Ra3blEU0fwtn6P1SDo9n+WiuG3SsI/EeQS6VCmBUr5VABuDruqREjjSlQeizNPfB8bGSWMfUQhxPdIMPcoELA1urr3oyljCBH5rI4ZENa9XshPjI8eqfL+2M4RhOpuWFyI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3885.namprd12.prod.outlook.com (2603:10b6:208:16c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 5 Mar
 2021 13:05:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3912.023; Fri, 5 Mar 2021
 13:05:54 +0000
Subject: Re: [PATCH 1/3] drm/amdgpu: introduce struct amdgpu_bo_user
To: Nirmoy Das <nirmoy.das@amd.com>
References: <20210305125659.9923-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <faa5b648-0e30-e752-0250-a656c197c051@amd.com>
Date: Fri, 5 Mar 2021 14:05:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210305125659.9923-1-nirmoy.das@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:ea67:7c1d:b656:e8ef]
X-ClientProxiedBy: AM0PR02CA0127.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ea67:7c1d:b656:e8ef]
 (2a02:908:1252:fb60:ea67:7c1d:b656:e8ef) by
 AM0PR02CA0127.eurprd02.prod.outlook.com (2603:10a6:20b:28c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18 via Frontend
 Transport; Fri, 5 Mar 2021 13:05:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 809f38ca-f216-4de6-63ab-08d8dfd7689c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3885:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3885DC48821DE276DDAD88D083969@MN2PR12MB3885.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b+tttApcO5jI0KwiOoqUxSBYSNWOBdcz+4Vsxvtw+MQicwMDtVtqYeCqQ7d1CTGjP2vtLwkD58O0ZY+s3iTFkhp4DKoKnF8dS4dX9/RuKABv3ZMVuNTMIAM5PbgI0dAkN6IyxEuNxvKxYaxcZHbV9BUy37LV+3bYARDMvEflRyYUiz1TuuwJ4oOtjJWg8X+N0HrBWZW4e8q+9dSeaSFjIdQpGpMtXEjE3+qlCWKKJrDgwJS/BuPEX/C8QtlztSlpltmhUh6E46utalQiqbtSCgy9keWsDDr/xfHSOcXzzopoUXvJjJtWSW8RLl5Fh/+LecRKtIfnlwYfQ8P1bwlGv+nvePtJp20IqpNZBC6chF5OSbNmH0xpfNwh5IvBsBvNftf2sqjbkJQc+2ThcDN/ns/dZYiN2Ly3WtMIb/s/dOjnOCTXIel4disLy1lN7EPufEoyKAYp6yb0FsNkz8jXE46dPdW+Id+eNVs6uwj5QVYsnGTuKme8fPmD5TrsY4oToXhmbKeaXddgfNd59M3pGmk7PsOxGtPKYCcb0XCFC2k5mLNDyT+fXZQ1fmMOJ0p5Cgvtk0ZWZjSuR/hpdbKbPKe5zifqyPMRdKjd1Y2VoTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(2906002)(6862004)(5660300002)(37006003)(66946007)(8676002)(83380400001)(86362001)(478600001)(31686004)(52116002)(316002)(4326008)(6636002)(66556008)(66476007)(31696002)(6486002)(36756003)(16526019)(186003)(8936002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cG42RWxncEQxZCtxKzFRM0g3Qzg5MzF5ME5yQzJQT3FkRmRkanY4UWpHVnkz?=
 =?utf-8?B?Qitld01mUjhXY2JSVlUrcGtrUEt5TkpBUnI4OFZjMmRuUkRhT3Q4bmMzVmtZ?=
 =?utf-8?B?ZndURnU2NzJWdmpPTTZNWjI4K05MaEVNcWdEajFZMFRUUWlZVG8wa3d4dzYy?=
 =?utf-8?B?RitabENaWHFwNE56dHB2UnRTR0FOZ2JYYmRSc2Z0RTFBNHVzWWxKMU9ubCtJ?=
 =?utf-8?B?ZWxycDRidCtDQUtDUmRPMjhwWk1lajN4V2NLcGpUNGw0ejRwdDRRT3JvZWV4?=
 =?utf-8?B?ZFFvMjNMOVl6SmlpTVZxRzNYUG1Oa3hLWkZteVU5dU1BZ3k0dHM3dFE1VlVY?=
 =?utf-8?B?SUJLK0xiWkNUbmhWcWY4bnU0LzVZZVJDOGwveGVqbmExRkhjdHIvSjhTYzRU?=
 =?utf-8?B?S0sxcmx3Z01SYm1pV0tPcHlhVENMaHB4VWNaZTdneE9RK0JJQTVWOGM4dU5O?=
 =?utf-8?B?N3BNNldNeHhKVTZNZ00xS0szZEI5L0o1K04wYkZhc3JXZ1dycndhVE1Yc25n?=
 =?utf-8?B?RFhnWHJvWS9PL1RZWWQrNHBsdkNYT1lSaUVROGxIRDJqQUE4RXZRdExnZEE5?=
 =?utf-8?B?WFNCcHA4eittdnJMOG90NHhyOGtHb2dXYU8zYXFMaWJEV0ZPYUozYVhtVkVs?=
 =?utf-8?B?MzJ0ZEx2OXNGdSt2RmsweGIyZG9FSVBoanJ5OGl0elhkRnozZjdxSTB1TlpD?=
 =?utf-8?B?T3VHMjY0b2RXK0ZXcmF2eG05THlYUmxkb3BpNDZVeFhLK2U3UlVtQlNVdHhW?=
 =?utf-8?B?VWpJcHh6WHVWaU95WWYrVWJhVDRORkNkZGFtdWRPV09jNDI5eldnQXRxVXBp?=
 =?utf-8?B?SDVjTnJVZWw1TFN3M0d2UDlpU2xFUElYQzAxQUFPbXJINDk3RzlQTkxBbGRn?=
 =?utf-8?B?Y1JFeG5ZTUUzK2c4R05DWFo1RHZVZ3JjdkRma0VTY21aSkh2UEhJQjQwcklj?=
 =?utf-8?B?eG9UdmxvRWlwZTZoU1NIdVNQQVNRTHVaa1pwZlppMmRjUUhtckc4MVhoWlUv?=
 =?utf-8?B?ejEzamkxL2dGRFhmSDZxYW9HbHFVS0I3eEgyQ09DNkc5SmVhTHhpMWxaSTJG?=
 =?utf-8?B?bWI0QmV0Nkc4NUQxZlMvbzVDMTBYMkhOa3BUN3lwdmhsZW1tdFU4eXdNSnU2?=
 =?utf-8?B?SDNLV1BmZjRZL3QxY2Z1Vlp2MVhwRko1QU5CRHRlU215SytZMHY2bTJOOGpG?=
 =?utf-8?B?aGk1SUViQnhZdll5TmxKVG1qQm03KzJQQ2xUVkRrMXJiYkt3bFZQbkpydUZx?=
 =?utf-8?B?akZ0a3hzZS96NDMwOXV3aEVqRWh5WFkvWWMvdkNSVUt2K2ZNNU9rdkNoVlRw?=
 =?utf-8?B?emRxdWpkbUxMS2xJaGlxcnBsc0RTd3U3SnpOMncreS81TTlEckJFMXVGVmFo?=
 =?utf-8?B?dmNSbmFDRU1oN1FuUk1ONTVHK0xhdm80ZnJ6VnB0bStMTjhtMjBjeDlBc1lR?=
 =?utf-8?B?NGp6SFBnaXFMeFc4Zjh1ZGVibFl6T3JCZVhkSDQ1NFlsK2ZmdW1QNm9Ud29X?=
 =?utf-8?B?UE9YYUE1UFh1WnBaeXpZY3RlZkZTZEFOSCtjZ0F6cmJqQmhEN01tbEpGRU5M?=
 =?utf-8?B?aU0zZlZJU3lPY1cwQTNaa2tHbnNsUkQzQnlaZExXaUg3YXZSeGlNaUJZWENT?=
 =?utf-8?B?b2Q5TzRwOWg3YnVPT1ZweHg2M0JUdU9SOGpQdzRNeHBpaS9PNjNLS0xQMVJD?=
 =?utf-8?B?VUdTZlNmZ2IvVVlZL3lpOVpzUm5WdGZ3TC9peEEvK1RZNEswL1UydEF0S3Y0?=
 =?utf-8?B?Z3Z2SFVoMnFTQkJ1NE5zRm55RzBWaWVFVTN2S2hMNjU1dlZpMjN6d3Q0dUNI?=
 =?utf-8?B?cVVVdkttUkVFNzJQMkFVRWpkelVZR0ViSFFGaHM3WkJyWXVyNWdkcEpXVkJ1?=
 =?utf-8?Q?2eAdaR/L7rB9I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809f38ca-f216-4de6-63ab-08d8dfd7689c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 13:05:54.1166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXHJRKAYGQOf7paIDNhF8qXATZNdtp2AQ5dqz9ozj7mvwr1i2WzrelccxJlPvAcG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3885
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 05.03.21 um 13:56 schrieb Nirmoy Das:
> Implement a new struct amdgpu_bo_user as subclass of
> struct amdgpu_bo and a function to created amdgpu_bo_user
> bo with a flag to identify the owner.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 44 ++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  9 +++++
>   include/uapi/drm/amdgpu_drm.h              |  2 +
>   3 files changed, 55 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 745393472564..f21679f38383 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -699,6 +699,50 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   	return r;
>   }
>   
> +/**
> + * amdgpu_bo_create_user - create an &amdgpu_bo_user buffer object
> + * @adev: amdgpu device object
> + * @bp: parameters to be used for the buffer object
> + * @ubo_ptr: pointer to the buffer object pointer
> + *
> + * Create a BO to be used by user application;
> + *
> + * Returns:
> + * 0 for success or a negative error code on failure.
> + */
> +
> +int amdgpu_bo_create_user(struct amdgpu_device *adev,
> +		     struct amdgpu_bo_param *bp,
> +		     struct amdgpu_bo_user **ubo_ptr)
> +{
> +	struct amdgpu_bo *bo_ptr;
> +	u64 flags = bp->flags;
> +	int r;
> +
> +	bp->flags = bp->flags & ~AMDGPU_GEM_CREATE_SHADOW;
> +	bp->flags = bp->flags | AMDGPU_GEM_CREATE_USER;
> +	bp->bo_ptr_size = sizeof(struct amdgpu_bo);
> +	r = amdgpu_bo_do_create(adev, bp, &bo_ptr);
> +	if (r)
> +		return r;
> +
> +	*ubo_ptr = (struct amdgpu_bo_user *)bo_ptr;
> +	if ((flags & AMDGPU_GEM_CREATE_SHADOW) && !(adev->flags & AMD_IS_APU)) {
> +		if (!bp->resv)
> +			WARN_ON(dma_resv_lock((*ubo_ptr)->bo.tbo.base.resv,
> +							NULL));
> +
> +		r = amdgpu_bo_create_shadow(adev, bp->size, bo_ptr);
> +
> +		if (!bp->resv)
> +			dma_resv_unlock((*ubo_ptr)->bo.tbo.base.resv);
> +
> +		if (r)
> +			ttm_bo_put(&(*ubo_ptr)->bo.tbo);
> +	}

The shadows handling is specific for VM BOs and not necessary for BOs 
which are used by userspace.

Regards,
Christian.

> +
> +	return r;
> +}
>   /**
>    * amdgpu_bo_validate - validate an &amdgpu_bo buffer object
>    * @bo: pointer to the buffer object
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index 848dc0a017dd..332e269c3fd1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -114,6 +114,12 @@ struct amdgpu_bo {
>   	struct kgd_mem                  *kfd_bo;
>   };
>   
> +struct amdgpu_bo_user {
> +	struct amdgpu_bo		bo;
> +	u64				tiling_flags;
> +
> +};
> +
>   static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
>   {
>   	return container_of(tbo, struct amdgpu_bo, tbo);
> @@ -257,6 +263,9 @@ int amdgpu_bo_create_kernel(struct amdgpu_device *adev,
>   int amdgpu_bo_create_kernel_at(struct amdgpu_device *adev,
>   			       uint64_t offset, uint64_t size, uint32_t domain,
>   			       struct amdgpu_bo **bo_ptr, void **cpu_addr);
> +int amdgpu_bo_create_user(struct amdgpu_device *adev,
> +		     struct amdgpu_bo_param *bp,
> +		     struct amdgpu_bo_user **ubo_ptr);
>   void amdgpu_bo_free_kernel(struct amdgpu_bo **bo, u64 *gpu_addr,
>   			   void **cpu_addr);
>   int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr);
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
> index 8b832f7458f2..9b9a4ac6f00f 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -141,6 +141,8 @@ extern "C" {
>    * accessing it with various hw blocks
>    */
>   #define AMDGPU_GEM_CREATE_ENCRYPTED		(1 << 10)
> +/* Flag that indicates the BO is created for userspace */
> +#define AMDGPU_GEM_CREATE_USER			(1 << 11)
>   
>   struct drm_amdgpu_gem_create_in  {
>   	/** the requested memory size */

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
