Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB967838EC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 06:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7625E10E13C;
	Tue, 22 Aug 2023 04:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2B510E07C;
 Tue, 22 Aug 2023 04:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWGtjjiT+zwzBr72XTdrzpjX6p8dznuPBY7JgtYi4Qn+7kfeq8RruqFSrvmmjgGuMUayUj8MQnXhWGX5VjbaFreC24c3YAE6Yj0IYT2FgHkTGjGrLxprbWyu4iyGv/d3oCwFAc73Ecyzuxzjy7/PCdUaDkkspj45oR2dMWT73+BiGPoDVgwF1hNNHi1uUPdzOJq3L1ELuas3CUe1S5B2T2O9ZdALA1DJ+aGBNO4Tre3zJLV4BJtXdlolHsnuEvSOwssUIczJeV9iX2vrSMVZnt7I/jv4UxpXfcO83au3KsfjKj1TyeyWYa7SfoDFoYFJysRZClycoNaQ8XMFTxL1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjDNPiYb5Hk1XizgkKJSer3NnxXGQlaQ16mMe9G1cvI=;
 b=f8kgE9Epbouj5HnM+d4Mo9T0pzetEnn+mqXgbn905PwyhhQy2bvPf2rVZFKvqo1BmKAXJueoob1H6JjuLoMolsmGCZzrzrnijUiTMLkFXzceDfaickS5W9Xfa0GncGLny9/8rRWwb0VqD4OuINAhPX/rkc3MMU6uIi/Zh+h0dvSfdTnMxzgKNgNHhM/yUJ5MzcLlwgbuCwT7VwMIRhO3vtRShYmhpe9lpI42Pxbn5Ic1TvIeeoNWsTXslgr2ZFqfWzsFpYz/0ffRl9JpR5IWMiLD9OfKWOCcDV/Sre7UiIi831no486XqVUYBhqejeviUvJc2yaBTg6vax7ADdqtMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjDNPiYb5Hk1XizgkKJSer3NnxXGQlaQ16mMe9G1cvI=;
 b=uXqJIMF4s4reoMXAH+kSINNZe+HWSDPWpm6T5Q4hFf52WKpfo7py5zMnIqGFlEAYm9BGscVPpNm4Z4P8eduCjrK+1AU7/KK4+bfkCfIk34KkBSpu+WZlUIeZjf31P20cdjQRinMq78gNRuqFgdFZ8YyA7ehJFryv/UXk0LI9DvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by IA1PR12MB6260.namprd12.prod.outlook.com (2603:10b6:208:3e4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 04:51:25 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 04:51:25 +0000
Message-ID: <c72a7412-a95a-1a99-f337-f64a789e81bf@amd.com>
Date: Tue, 22 Aug 2023 10:21:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 3/7] drm/amdgpu: Add new function to put GPU power
 profile
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, shashank.sharma@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Felix.Kuehling@amd.com,
 amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-4-Arvind.Yadav@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20230821064759.94223-4-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::20) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|IA1PR12MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: b1fcfdd4-e319-4ddf-0aa2-08dba2cb700b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2kHt+fmAFnJj+yRVyFVhUTZbMhk8m2i6VUglVxhGXH5j8Puv3n7A3T1ujYm1TNCs0b8PU+X+5LJa6uXNlYxD/AyKbDezKD0TGCvXlsFj594MvUQZro6jXyvPy8D8YildpcJdg3GeTkcdEnNvuNh1kkXkXBAWZYGD/86aWQVA1De04ueVk+fjVeGTXPzQ2DpuXITpC47/dzv0NLdLTnLSNyshuOd+oqLz5HYA56pb8zu/UF3Lxl9EYlGPrtt+e6A+po3+Buywz44tiVXSRCNvZkvyzlRXRwSRGEcsP7LdbaYoSGKyt8sb3ue9TNz9I+DA7+Ex2QC0KEpc4BiSuGG2Fg1EAokjqi0G0hnHlwP1jFQAdggMNf9G+l7fqzn1lrDb5XZpIt133nSCYEeb197C+OzhtPs9q6pLN9HlR6RBe+KM4yebiVCNRvBAkroytiXDsIof5NhlLpKsUCLY0rdVFN2N8TVviyaKPKcjch4dNWp2/hER9C+hE2yOQS0npqahyO0NEFPOlFpJGcWJRpTUk+9otB0aHD0dkBFfgAJwei67lx88r7RvrKaIWau5bTsTRXQ1DMhUgtoltdcmjXE3zOHxn3xmmdQwEutrH5Q6Pm/wWMjR2aU09RJtAOFcbZgnKH722My8uUt3K3ry1cMcKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(1800799009)(451199024)(186009)(6666004)(4326008)(8676002)(8936002)(316002)(478600001)(66556008)(31686004)(66476007)(66946007)(41300700001)(6506007)(6486002)(6512007)(38100700002)(36756003)(26005)(53546011)(5660300002)(2616005)(31696002)(2906002)(86362001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1pjbnNyd2FUTktXNnFVSHZNMGRTaDdkYWFHVmFKWGhNbWlVcnQ1ejh0RXJI?=
 =?utf-8?B?b3pVdGNINW92MzlVWkRmQ2hyWitYbzdtRnl5c3lOMEpUS1VSY3kwWXZta3Vr?=
 =?utf-8?B?eFpxUWFxQnQrUmZTd2d3eGhuK1hkb2lqU2xBcEJxMG5CdWNiOCtWZmhXRWV6?=
 =?utf-8?B?RE9teXZEVjhtT1FmUk1aby9hZWpTU1NybEhZd1MwaEQxUWxBWHZidjVPSFB4?=
 =?utf-8?B?QUYyT2o1ZnJTdWhqRmN2R0gzNzFWNnJrbUFRUTQxWmE2ZUFCUjA5UCtucXNY?=
 =?utf-8?B?NzBqMjZRczZkZ1hHQTNsQjZUL29HTWNpTXo0TitwTmRaM2xsa2ZIamZWL1Mw?=
 =?utf-8?B?MEk5eldlNTRYWFdiaTd0MHEybko3RE5ObHNLL3NuS1JGR0RSU2NKVEt6UXlm?=
 =?utf-8?B?VldYWExiNy9QRFduRi9hd2hha3pIMzdaK1dDQkcrYkFZNXBQZkg1Qzl5ampQ?=
 =?utf-8?B?d2xDNGNETGtyQW8wR0V0NlFIdHRiV2QrRmljS0dCMWtiaE8zaHZIL2k0ODZZ?=
 =?utf-8?B?VVBiZENLQ3NXS25vK01lOXIxY3RNQXN0VzJSRFp1TytKdjFBbkwyNTVSenhO?=
 =?utf-8?B?K0NweENlUVM4MmdCTFN6cVRiV0ZsMHhsc0wrUlpFTWNIcnl0QmptZE5DWDFu?=
 =?utf-8?B?cmdjVEdaOW9tRENBYkxWUUtJdDZaZDNjT2lmU0tYWVdWbnYxRFFMUHRQQndB?=
 =?utf-8?B?ZFF6RkZaQU0xTGdDZjRPYy95T0t3aEd3YW5iMFR2K0l4NmJmZmFrejJVWUZZ?=
 =?utf-8?B?YWR4N0VSN3hzdTNvbFlzcGxpQjJSa1dUN244a0FreDFNTGVIUzVoRWRySHlj?=
 =?utf-8?B?ZDNSa2VSSTVveUxIbDBvTVFDRm0xUHc5dEQ3LzFmc1kyUm9sY1RrQmU3TnpV?=
 =?utf-8?B?NDM1cHlVaEFiS1lIblQyZXRUVUZzUGIzSmZ0RDlJZHBiTG9PQ0RlRFpRRDRj?=
 =?utf-8?B?OWdicnI0VW5Id1h1R0pPV3ZQd1pWL290OHRpcWxOYnBrbC9YeE1OMzdqK25n?=
 =?utf-8?B?VDdRY2cvZHpFWXRvWkxjcm1seU5wZ09OWGpOdVBYSDZhQUlKZS93YytSUDFo?=
 =?utf-8?B?em9nRlhPWnFJc1JtTTdJOXlKMWdQR2o2UHVENEVVSlk5MFJkbldEalpOWEFy?=
 =?utf-8?B?WDVrRHg1cnlxa3NDZk81Vm5yc0xsMEJwUUgrbVgxVFozMlhWSm5kL29jUHE1?=
 =?utf-8?B?ZlM4dDRuQWQ4bUtTV2h2ZWJIbXhidmIxUjZXanlDbFZqaGhrLzJaRHNHdHRh?=
 =?utf-8?B?ajV1M3BsQXJJRC9LeXI1N0ZjbStkVXlzY0RPdkRPVWFpUFJJZnM3TTZaa1lX?=
 =?utf-8?B?SDFrMERaNkZiZVBtZXVhN1hmRmVkZXpHa28yK05QKzZ2dUtuSStLT1dGQ2ND?=
 =?utf-8?B?OHBmNzNyK3Y0cDNBUFgxbFd0bW45VHBmWSs4U0djZi9Cc2tJZHAvMDB3U0ZZ?=
 =?utf-8?B?VFJ1ZVMyRTRUN09zcml2YUhBL3dERE9QRmpmWmhPUUZxY1JpVUlQdm9xaG5q?=
 =?utf-8?B?L3hLOThOMFQ4QzUyMlJvQnJibGM1SjhZNTRDbHllS1RlTURYbG85bFd1UUx0?=
 =?utf-8?B?RFV0d1JPbkVjNU9lOVpxdzJOaURlOHJVZVpuOUVYUTIzem1EbUhmRmZYMjRO?=
 =?utf-8?B?ME43MldBdHNlSWJmN2ZjbWp1Z0N3VXNlYnBFYmxnbEUrbmNiNHo5SGZBUmRW?=
 =?utf-8?B?cnd5ZUNSY0xGNjdQYjFydEhxZUpkUDV4NW9SYkE4aGovZEhaOTlhMnpnWVpm?=
 =?utf-8?B?bUdnRXRKbmE0Yk9PbFZCRWptNEVGMm9uZDAyUWIramc1Z0d2ZE5BZnNtNUtj?=
 =?utf-8?B?L3hHNk15bTB0dDA4VkRVMmxFUWIydkxLaHlVRHZZblVsYzZaTHo5MUpHdHlt?=
 =?utf-8?B?VU1DZ3NBczlHd2tXa1BqUGUrVlc5cmR3S25mRzQ4TkFqOTNoN3QzdDFrV0Nk?=
 =?utf-8?B?Zk1MbHJDRklGOG8zV0ZrSFczNzUyZDVjRmJoNllWRUlJdVJxdVdzUVRLejBn?=
 =?utf-8?B?MXBkbkMrd0w0ZkRGZlh1NTNJeFROMmZFcXZYQmFXeUlCOWh1T1N1bmZpQnZJ?=
 =?utf-8?B?L1Jnczhhcm9rT3M1VEVHZk5ub0RoUmI4TlZHckdZbVJlNlhXR0dQRkpUditH?=
 =?utf-8?Q?hxDdUiwQJjzp7zZgMePpaWVUb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fcfdd4-e319-4ddf-0aa2-08dba2cb700b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 04:51:24.9555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpPPMbO1oA9dERIatJ0tfhC+VPEGvQaqjp4ZAClgBczMEuNTeE7NbeayBGZm9ILL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6260
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
> This patch adds a function which will clear the GPU
> power profile after job finished.
> 
> This is how it works:
> - schedular will set the GPU power profile based on ring_type.
> - Schedular will clear the GPU Power profile once job finished.
> - Here, the *_workload_profile_set function will set the GPU
>    power profile and the *_workload_profile_put function will
>    schedule the smu_delayed_work task after 100ms delay. This
>    smu_delayed_work task will clear a GPU power profile if any
>    new jobs are not scheduled within 100 ms. But if any new job
>    comes within 100ms then the *_workload_profile_set function
>    will cancel this work and set the GPU power profile based on
>    preferences.
> 
> v2:
> - Splitting workload_profile_set and workload_profile_put
>    into two separate patches.
> - Addressed review comment.
> 
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 97 +++++++++++++++++++
>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
>   2 files changed, 100 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> index e661cc5b3d92..6367eb88a44d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> @@ -24,6 +24,9 @@
>   
>   #include "amdgpu.h"
>   
> +/* 100 millsecond timeout */
> +#define SMU_IDLE_TIMEOUT	msecs_to_jiffies(100)
> +
>   static enum PP_SMC_POWER_PROFILE
>   ring_to_power_profile(uint32_t ring_type)
>   {
> @@ -59,6 +62,80 @@ amdgpu_power_profile_set(struct amdgpu_device *adev,
>   	return ret;
>   }
>   
> +static int
> +amdgpu_power_profile_clear(struct amdgpu_device *adev,
> +			   enum PP_SMC_POWER_PROFILE profile)
> +{
> +	int ret = amdgpu_dpm_switch_power_profile(adev, profile, false);
> +
> +	if (!ret) {
> +		/* Clear the bit for the submitted workload profile */
> +		adev->smu_workload.submit_workload_status &= ~(1 << profile);
> +	}
> +
> +	return ret;
> +}
> +
> +static void
> +amdgpu_power_profile_idle_work_handler(struct work_struct *work)
> +{
> +
> +	struct amdgpu_smu_workload *workload = container_of(work,
> +						      struct amdgpu_smu_workload,
> +						      smu_delayed_work.work);
> +	struct amdgpu_device *adev = workload->adev;
> +	bool reschedule = false;
> +	int index  = fls(workload->submit_workload_status);
> +	int ret;
> +
> +	mutex_lock(&workload->workload_lock);
> +	for (; index > 0; index--) {

Why not use for_each_set_bit?

> +		int val = atomic_read(&workload->power_profile_ref[index]);
> +
> +		if (val) {
> +			reschedule = true;

Why do you need to do reschedule? For each put(), a schedule is called. 
If refcount is not zero, that means some other job has already set the 
profile. It is supposed to call put() and at that time, this job will be 
run to clear it anyway, right?

> +		} else {
> +			if (workload->submit_workload_status &
> +			    (1 << index)) {
> +				ret = amdgpu_power_profile_clear(adev, index);
> +				if (ret) {
> +					DRM_WARN("Failed to clear workload %s,error = %d\n",
> +						 amdgpu_workload_mode_name[index], ret);
> +					goto exit;
> +				}
> +			}
> +		}
> +	}
> +	if (reschedule)
> +		schedule_delayed_work(&workload->smu_delayed_work,
> +				      SMU_IDLE_TIMEOUT);
> +exit:
> +	mutex_unlock(&workload->workload_lock);
> +}
> +
> +void amdgpu_workload_profile_put(struct amdgpu_device *adev,
> +				 uint32_t ring_type)
> +{
> +	struct amdgpu_smu_workload *workload = &adev->smu_workload;
> +	enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
> +
> +	if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
> +		return;
> +
> +	mutex_lock(&workload->workload_lock);
> +
> +	if (!atomic_read(&workload->power_profile_ref[profile])) {
> +		DRM_WARN("Power profile %s ref. count error\n",
> +			 amdgpu_workload_mode_name[profile]);
> +	} else {
> +		atomic_dec(&workload->power_profile_ref[profile]);
> +		schedule_delayed_work(&workload->smu_delayed_work,
> +				      SMU_IDLE_TIMEOUT);
> +	}
> +
> +	mutex_unlock(&workload->workload_lock);
> +}
> +
>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>   				 uint32_t ring_type)
>   {
> @@ -70,13 +147,30 @@ void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>   		return;
>   
>   	mutex_lock(&workload->workload_lock);
> +	cancel_delayed_work_sync(&workload->smu_delayed_work);

This is a potential deadlock. You already hold the mutex and then 
waiting for idle work to finish. Idle work could now be at the point 
where it is waiting for the same mutex. Suggest not to call cancel here 
and let the mutex take care of the sequence.

>   
>   	ret = amdgpu_power_profile_set(adev, profile);
>   	if (ret) {
>   		DRM_WARN("Failed to set workload profile to %s, error = %d\n",
>   			 amdgpu_workload_mode_name[profile], ret);
> +		goto exit;
> +	}
> +
> +	/* Clear the already finished jobs of higher power profile*/
> +	for (int index = fls(workload->submit_workload_status);
> +	     index > profile; index--) {
> +		if (!atomic_read(&workload->power_profile_ref[index]) &&
> +		    workload->submit_workload_status & (1 << index)) {
> +			ret = amdgpu_power_profile_clear(adev, index);
> +			if (ret) {
> +				DRM_WARN("Failed to clear workload %s, err = %d\n",
> +					 amdgpu_workload_mode_name[profile], ret);
> +				goto exit;
> +			}
> +		}

If you follow the earlier comment, that will keep this logic only at one 
place - i.e, at idle work handler. Basically just let the idle work 
handle its duty. If some job starts running during the clear call, it's 
just unfortunate timing and let the next set() take the lock and request 
profile again.

Thanks,
Lijo

>   	}
>   
> +exit:
>   	mutex_unlock(&workload->workload_lock);
>   }
>   
> @@ -87,6 +181,8 @@ void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>   	adev->smu_workload.initialized = true;
>   
>   	mutex_init(&adev->smu_workload.workload_lock);
> +	INIT_DELAYED_WORK(&adev->smu_workload.smu_delayed_work,
> +			  amdgpu_power_profile_idle_work_handler);
>   }
>   
>   void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
> @@ -94,6 +190,7 @@ void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
>   	if (!adev->smu_workload.initialized)
>   		return;
>   
> +	cancel_delayed_work_sync(&adev->smu_workload.smu_delayed_work);
>   	adev->smu_workload.submit_workload_status = 0;
>   	adev->smu_workload.initialized = false;
>   	mutex_destroy(&adev->smu_workload.workload_lock);
> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> index 5022f28fc2f9..ee1f87257f2d 100644
> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> @@ -46,6 +46,9 @@ static const char * const amdgpu_workload_mode_name[] = {
>   	"Window3D"
>   };
>   
> +void amdgpu_workload_profile_put(struct amdgpu_device *adev,
> +				 uint32_t ring_type);
> +
>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>   				 uint32_t ring_type);
>   
