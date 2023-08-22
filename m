Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF13F7839FC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 08:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476F310E00D;
	Tue, 22 Aug 2023 06:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B982510E00D;
 Tue, 22 Aug 2023 06:31:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCOcsW3FETG0UhToiF9s2950lpiyqUQiZuBuBVK7YZBpXGbMxAjtpahXVBPcFT2BasKZ5coWhOPnAX6PQdkfcthmCjJSJrpcxevREUCxQISwCPmfp4Nr7Qj6aB++jj1OEH7idwLl6FsTSX8bWcFD8HArLdkAU/HnKv0Ec8XUzRj4yBPLHiI2iVrjFJZENMaGF0sWgoxvsnAZIqt/DoCuSA79D4BDK9DQfyh8aSVoJWguIt9ogYluXN3E8HkCUUKlQHqWQ4yGTQC4Enn7Z64ZnRiYuAt65Q6PWnC06u+r2z+D+r62+Ab/yGwudXr9omGuE6XVNB4PimYtR+M6V2wabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ghg9Rd3235/jkq1rWRLeuWefztjLaoEU7QLQ8ltBcc=;
 b=VzaVxtyU9G/fuZat4Ht1aFcqRImU5opbzBo77q95y1zhUeXK661z92u+Pq67ekfUgd8Da4+uMzpZbE4V6ItvkIuG5gwFEdFcAj2TXu4Zu4h5EEK5nOC2oL4k0ko7htNqv7e7M5LJst4uACfR9WdOH3yDmWQ6tTifa2hS2ArPLLQo/rzR7aUUp/TdxjdD7uR00Q8HHy4Y2r6grDjdCBAZgI+ZJd8NFBm6vw91Dz2kd2jBBM+nFs3SNK+lmt2MRJPI3jBerph9sictg6bBGf9AXeW7ixlkoaStKzPVw4T+YoLo4AA2XbjgIX23Wq0Zc0hfEmz1QHVgcdny5l1Lyfk9Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ghg9Rd3235/jkq1rWRLeuWefztjLaoEU7QLQ8ltBcc=;
 b=MYS92hEH+A23ASwX6qVZITi9dMXE+OCICyzW5ItHBKWovVQ3qapfij8aBFAo2sVb/iAAN1kFQdLY4ZHJUs43etX3+jEcT+T+UgNidfhpkznLZnOilAyfAtIGDEXlWjf5QB6jOS8zemY7tmwlG3dkfrY8YF2f8Pxw2voDTKcA+8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by PH8PR12MB6844.namprd12.prod.outlook.com (2603:10b6:510:1cb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 06:31:40 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 06:31:40 +0000
Message-ID: <fdcfe7f2-05b9-c144-1b4a-74889bcb0555@amd.com>
Date: Tue, 22 Aug 2023 12:01:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 4/7] drm/amdgpu: Add suspend function to clear the GPU
 power profile.
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, shashank.sharma@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Felix.Kuehling@amd.com,
 amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-5-Arvind.Yadav@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20230821064759.94223-5-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::13) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|PH8PR12MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: 183a4c12-a20d-4faf-27a3-08dba2d97178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wVHJbBZgt0dhYBPmslDG1dwWA+YILTqVI7MkS6lq0D+o07KtdOz6k9MemQPO7kZsn5Gt506Zbd5f7c6ZJseXPumGFl0QWGm8xEvh8evlFVU/naitwjpxhQShfZhE0JPKDcx1V5fxO+kirAaUv4g6iQZ5KKmo3+iGKNLnbj0gXPP7nEvcAT6Jsbd9/szKnK9SfF2s+XhsagL0rP7qHYSQjx49dmXfAp+V6DirLMPh8O00NpOZ5ZPvO8R5XP6w4LT3seLYXa5NSbydj7vO0eDBOMRq51iyaWJ8Qt23mgMyJGYA+7XXWTm6sCa+0bHDEgrZVr27hR+fTfSEWi6Y/FW1I7ANt+TmpY+hYCmLbK0ZBw8Wv+GVsDfhOr0CEY8VbO/Hms+3jkRM8lQVmjf/ZGC05AmN0CqVPR/s6A5pALarHkmfQD4l7EazPIoAkUECPtoANpcbKrnKfm0BbTN/jiy5Kr8EEVBzQYIShEYFnw8aNo1HAwtwlugza+Rw2N06ice/K/mR+hcEE5zh+UIsi8JJaVr1pFDH8i4qtIC8rUmSaZJXT9xhzjVocP9CT4qwO/9QAp1Rig3ww2Q0RLPpKhYrqcnT9NpE4NrlTM7JLo41GAGSAy07Bmv0JAZn/dv6Pvjg+nI/0Q1Yr3Z64uCcJBTm0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199024)(1800799009)(186009)(2906002)(83380400001)(53546011)(6486002)(6506007)(38100700002)(15650500001)(5660300002)(26005)(31696002)(86362001)(31686004)(8676002)(8936002)(4326008)(2616005)(316002)(6512007)(66476007)(66556008)(66946007)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZklzWFlJZitqLzhBT1FCUjMzY1JFRmY1aUg2bDBlNkdVOWtwYXgvNWtVbkJZ?=
 =?utf-8?B?enRDRWlZSUYyY203WXdVdHFveE5TQUpGUWFEbFZDUHV4YnpmNEFjZ0ZDaEha?=
 =?utf-8?B?R1l0NWdaVXQ3NkxqWHZFazZ1TDM4c09qRm8wdW1GSzFReG50YysxYzhuajRL?=
 =?utf-8?B?OGxUSG9aUnhaYXlVdDVOdUEySEQ2SUhNT2VRd0RZOXByREFPd3h0bmFtMVdj?=
 =?utf-8?B?TWJkVlkrU3k5UzBiSjJuMDZnNEpzT0ljVDlnMDU4aGFWVTVrM2pEbnM4a2kr?=
 =?utf-8?B?SnJ4Q3NMSUF3emRuT3NYczlpWVlvekdhVnBCV3BHeFkzUzM1OW9halViZkdy?=
 =?utf-8?B?Uy9sUkZHOWRlTkttYmJmaFdkM3pXTlhrUlhCTnZ5bi9lUnpFcno3NDJkcTcw?=
 =?utf-8?B?TERpdThhMGpxMTVZR3NITjZNUW53YWVMWGpGRmVEbDdZSW44UzBrR29LRHhC?=
 =?utf-8?B?bEp1ZFBWdFRKQzhWYXMxcmVBbVBLcENvR2ZGb2o1LyswMjZYcU1XbnUxWm5Q?=
 =?utf-8?B?NFAybWlCcGFpNnc0c3VKN3VtSmU1Sk14VEo1UVlaQklWYS9vSmU4QXdDV3Vv?=
 =?utf-8?B?cCszb201QnFMMWIrNy9uQUV3VHRWNHBOQXM2alhpZS8waDVVdGNJMEJETXpX?=
 =?utf-8?B?eGFybHUydXI4Skh4MHBxNHdIUitCMkpneG9oNm9vb3dNWE5EMVJPK2N1c2F1?=
 =?utf-8?B?L2JaVGNEdDBsWUZoTEphRnMyb21xT0FpaXRRYWF0WkVpSHYyam9Zek5mS0ky?=
 =?utf-8?B?NlpkQkZrenZzamtsNmZoVjZJbDlSZTQ3RE5PNTl3UkVyTG9sR3c0OG5NN2Zh?=
 =?utf-8?B?ejVSdXdoWGIxbTJXYXRwYnBWV2hBY05MYzZvRDd3VHhxV0N1dzJzZXBTYzVh?=
 =?utf-8?B?ZUEzS2EyQkJFQjBBcVMxTXVrcHhkdlVQZ0h5RldSOGlYN2tYOEs2R3U5ZXdB?=
 =?utf-8?B?UE9pcXBmekhNV0padXg0VjgrOG9FNFJzcUlpTlN6Y3VjL1VpRXRvcExxQ3dP?=
 =?utf-8?B?Q2dMZGVmOU9mQ0RCSm01MTlIb1JpZHppMVZqQ2xxZWV2MmFodDVZZDhiZkZa?=
 =?utf-8?B?TFo3V3pYeTRpakxkc2ViOVpndm00TW5sMUV6RVB3SGVROE0xOVErWVRnd2R2?=
 =?utf-8?B?S3BadGIydE1WQzE4MFV5WW02TSsxZ09jNVJ3OEpmRHdZVU5JNE9qdnUxeHBa?=
 =?utf-8?B?QjY2UU9KVDRTR0VHUFBrY3ZkMC9SeEFIR2UrME15YnhLWXVTMUI5M1NvNUgz?=
 =?utf-8?B?VWlVbjFoRTFPNlZyM0dTUExOc3E3OWdRb29nazI0d0ZqZzRpY0VVeDJJc2Nu?=
 =?utf-8?B?Z2NIQnBOV1ZPZit1elJJU292cDlXby9BWlZxWmpJTjZyb3o2SUlRaENyUEgy?=
 =?utf-8?B?cXgxWmtvMWJLc20rYW5icmdDQ0lTbEk1TXNIY0Z6MzVWOWFkbEk3eVpxdFVm?=
 =?utf-8?B?ZjQ2VlBncURmOUExOFBRT2o0ZlhlWDNZTmcxbUVwMEZvUDFINWpZNHhKeGFQ?=
 =?utf-8?B?YWRwYTVrSkhvemptNVJWUmpTbUdZb3JqNkcvcHhidXlCY3c2d09oS21CMis5?=
 =?utf-8?B?amcyb3FrZjJQaUhDWHd6c2lLTjNQOERzZk1vT0kzcEp4aWdpY0NqQ3dWSG5U?=
 =?utf-8?B?bVoyaE5ETW5zcWJ4OXExdUpYd1dvN25qUXIzYlBkSy92d1J1L2o2VlhYYVc3?=
 =?utf-8?B?QlcxcXhaUXcycE5yN1dOUDYvbEJLM2RKYmVncXVZalExcTlIbzZDTmQ0bHZh?=
 =?utf-8?B?MUFFYkIrQXg1VXNqUFNBNjJtUWtCWEZ3NUlnYTltVHVkYzgxN1k4bzVLUmEv?=
 =?utf-8?B?YkNwRThTdjFjaGRmWjhQMGF0WHl1QWtOT0N3c0ViSnJkdFZtTXpmajdVZytE?=
 =?utf-8?B?L1pPNzE5QzV4SEpWdk9vb2FGMENPYUtIeVloL3dLQTYzT3NBcDdJMncyWU1i?=
 =?utf-8?B?ZUd4UW9tYjJXenZ4eUtMaVRucldPaGpaV0xWc0Zndm5PMmcvYzIrTkpZUUFu?=
 =?utf-8?B?OW9INUhsOVBGQ080M3ZMeXdxTk1xd2laUitIM3hPckJVaHJaVVNiODBEYzdQ?=
 =?utf-8?B?dGszcjRKUlhMUzZrZEQrcE1QeE9DaStkem9QRCs2dFBYL1RNUklpUm1YNDNS?=
 =?utf-8?Q?WoW+ttsABadbD9gS92cCkQQH+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183a4c12-a20d-4faf-27a3-08dba2d97178
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 06:31:40.2531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 726zdULxyQODEVkcFskxFe/ujiBNEd7SGyH4b5DhUc4xoPM+wzljmW5fXzWoKpyf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6844
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/21/2023 12:17 PM, Arvind Yadav wrote:
> This patch adds a suspend function that will clear the GPU
> power profile before going into suspend state.
> 
> v2:
> - Add the new suspend function based on review comment.
> 
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 23 +++++++++++++++++++
>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  2 ++
>   3 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index cd3bf641b630..3b70e657b439 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4212,6 +4212,8 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
>   
>   	amdgpu_ras_suspend(adev);
>   
> +	amdgpu_workload_profile_suspend(adev);
> +
>   	amdgpu_device_ip_suspend_phase1(adev);
>   
>   	if (!adev->in_s0ix)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> index 6367eb88a44d..44ca8e986984 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> @@ -174,6 +174,29 @@ void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>   	mutex_unlock(&workload->workload_lock);
>   }
>   
> +void amdgpu_workload_profile_suspend(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_smu_workload *workload = &adev->smu_workload;
> +	int ret;
> +
> +	mutex_lock(&workload->workload_lock);
> +	cancel_delayed_work_sync(&workload->smu_delayed_work);

Another deadlock candidate. Between fini() and suspend(), the only 
difference probably could be initialization status. If so, just use a 
helper that is used during fini() and suspend().

Thanks,
Lijo

> +
> +	/* Clear all the set GPU power profile*/
> +	for (int index = fls(workload->submit_workload_status);
> +	     index > 0; index--) {
> +		if (workload->submit_workload_status & (1 << index)) {
> +			atomic_set(&workload->power_profile_ref[index], 0);
> +			ret = amdgpu_power_profile_clear(adev, index);
> +			if (ret)
> +				DRM_WARN("Failed to clear power profile %s, err = %d\n",
> +					 amdgpu_workload_mode_name[index], ret);
> +		}
> +	}
> +	workload->submit_workload_status = 0;
> +	mutex_unlock(&workload->workload_lock);
> +}
> +
>   void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>   {
>   	adev->smu_workload.adev = adev;
> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> index ee1f87257f2d..0acd8769ec52 100644
> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> @@ -52,6 +52,8 @@ void amdgpu_workload_profile_put(struct amdgpu_device *adev,
>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>   				 uint32_t ring_type);
>   
> +void amdgpu_workload_profile_suspend(struct amdgpu_device *adev);
> +
>   void amdgpu_workload_profile_init(struct amdgpu_device *adev);
>   
>   void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
