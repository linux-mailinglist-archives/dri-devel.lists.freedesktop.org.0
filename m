Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E131B782AB6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9567D10E25D;
	Mon, 21 Aug 2023 13:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2B810E25B;
 Mon, 21 Aug 2023 13:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSirNw3r/5HUI4JtmO7kwkALHehGmm/1CInYO782sFq0+NnwX6UF7tUI6JejSyz3DYrPJqHvyJOQuobprQ8W4ttT8lD8acbhMM/n7aZ/1jLTi0+zeReRGPcGnP5WkES++D2AJpVyj1uSBRjK6YR39B+CUv85nu/gb0XI2PNHM6v/hqXuftvWpETNHNWkjlaXL/2XWV/nizXUvMFKDVHWyQSvOAEHAHIv13Olwi/geqBzZ+4+RZAhtWUHuvrw5eMcKa8dy2pcDsFzzJwEulVA5LL/HddJ8Uu7YjloMEpNwZTsqxVy0SWPDFu21/7qPQ10ZgOcWpKMhlHhmchwbGk5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Up6Xlp5pAzI6ZQvPvE3TXJpV+Uv8cR2+oZJmOh/HOxQ=;
 b=L7eU2qZjlR5YEfAKxos1DCh7cnv6n5mVuTJPth0HFR4TYpd/7a3j4sMaVY/+Y0PyBFYsDa07F5n/BSpDdh0CfmKicEtfAZSYThemF1M3IDyvGZm9jCEmm6eh5UeFGcWe5bDjSm75aToyDCzll2sfwdCidOL1z4aY5GKmaEzAfl+6nkcJPlLZttwOxZ6EEY4Bh3ms0sapRwTa6RCvAqnDYL50ITRF0oUqwRcykhUM2nD6qRBNU3qCAN+Zg5ckjl1iEOMY3jCCiezqufU0pXn74SjHYjWRTJNzMKlDU5TuhsTfocdqWWQeJYh5QsDbGeaOOjVJ9hDZmSZ/hTFFgZF5bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Up6Xlp5pAzI6ZQvPvE3TXJpV+Uv8cR2+oZJmOh/HOxQ=;
 b=3qcfpxXeX18XYpILBvU9cE6TNrjxoBvtk6GS3HIEA0hl8Ucfm1dai+cbteAo/0dumzzEysJfOW02WiKz+CNMFLdy2uk6KjsMfMBJtB/WwvmKzmR6DBKXOYBLLOOwTyjW9/pjpRdwkXTtfaVQMJs2OCedkvFnYk9LvjrI/is6m3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by CH3PR12MB8727.namprd12.prod.outlook.com (2603:10b6:610:173::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 13:39:59 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:39:58 +0000
Message-ID: <6e41f148-ac5c-bdcd-21e1-ea3d3c9f06e7@amd.com>
Date: Mon, 21 Aug 2023 15:39:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/7] drm/amdgpu: Add new function to put GPU power
 profile
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-4-Arvind.Yadav@amd.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20230821064759.94223-4-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0352.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::8) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|CH3PR12MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1f2ab5-108e-4985-9242-08dba24c1c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zcPT1gxzD0Nu0LbndabYGOKR62n5iJN7Pdq6Xgv6nXntf3LXypiuAHtAlL+BgY8zRPWxaFvpuoLsl7RNGZaPG/XOSPsFT7J9rHZv3mNu07DHS5qIjTw99BrkkxArhjf9gtfRv1ySrdWpqsWSZsKyf4WT3BupL//irLK0Gi22d2kfPdgWNaH7c6N13IFmtJpEuEkOHRaaoMoRCJ51tcsdInuEWWMvpsVZ/4IPx1qF4e3jg6h+bBGsuw8ht/DiJiT23DvnGujeYyi9qXHFBKv6pYUcfx/gfN6ct+kf3W2tyFtYoayFSRgvH54X6nwI39ogkklrnKvliEiFbUh0Yo63EJcHOO58qcTVYXFDcr6hBM8UvcBBjyyJ4NnzcB7p42oHZO470gUHyz7Du676/5C3t/3ZHARHcSX37mFMIcXVjsBzREUU+x/qF3iSUuAXihQxx1kMopqeihVi8N5y7nxGeGnfW7izHTIxfWnP9LOcwRa2bTKq/eQMWab2fGkgV/qL7IOLN9VZYFFz8EIoaS35T65c8vGRllygmUqB+aXdDdniP1wrV6ob3tIzSbxQ0hGmgDg99TzVLB3uJBCGpqzeJ2Fs5OM1up5YVWU7w3rnVmjSZ/WEWgEVcac40NlV4+ejTQBijD6QmceLNhi855eZ3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(44832011)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(66556008)(66476007)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0RXMjZUUzMrYUhFL3Y5YUVLaVNUNzhCZzVScWI1QnpDYkV1S1crN2hobjdw?=
 =?utf-8?B?S3JaYitUakNhbFNGMG94UVVHNHBXcnVhdW5jdERwTXlOaUhIM2dVaVVVNlBK?=
 =?utf-8?B?UThPN3pEZXZlamxlODI3ajF2YnBxb3hJa2ZBelZrZkR6blVxVU8xQnk3MWVh?=
 =?utf-8?B?WXg1NjNGc1pMOXJ2YWhQUVZPbVJsYU51ODZwSSs5RzE0NHlSalpqZ0UzNDVC?=
 =?utf-8?B?ZkRwSGVpU0xqMGdEK2hub1FRU1hxZnhwV1kxWnF3b1hyeStBYmlSaFdlY0ts?=
 =?utf-8?B?OWZ6UElIWllzbVdYeWZyc01KMUtjTTJCMEpWTjh1eUVnRnorbUZvUXJZcXRO?=
 =?utf-8?B?Z0x3NTRYa3ZmR2RvdnkwZmVmQ0J4T2w2MGJvd2xtWlVIVWFzMXZEWXhVWXBV?=
 =?utf-8?B?NGdjR25zSmNTbnJsL3ZXNUFPVXgvL1lFZVNCa002NXVMWmwvejZKdjcvMzl0?=
 =?utf-8?B?WWd6RmVYNFRCTEI4NnVDK0d6Rk9Lblg5MkhBR05rdTVPVXdkN1RBVEdWR1BU?=
 =?utf-8?B?VFRGdU9vaEkwS0pKbTlmcHpwc1A5QVgrc3pPQVNvalIzN3RPeUwwTFFERC9o?=
 =?utf-8?B?Z0dJL0JFbUlMUEFVR1NycGNSSW9uMlpvOUlJa3RySGU0djVsYncvaVNSd1dW?=
 =?utf-8?B?WFZuenFUTDdHQkR1SlJpSitIbDFRVzA5bzlHRVBaZVhma3huS1JLMlJHQnJk?=
 =?utf-8?B?cEJKTmhQMkt1TVdpZWpXNnR4LzVnYTRvSW1XZkJsa2VKZWZ4Y0ZTRm14M3ly?=
 =?utf-8?B?R25SSHpPSDNNTitWQnlQMjgyK3YyNWZtdGJ2cjUvWDRPcS8zNWtvd3BKQTdu?=
 =?utf-8?B?OWNjbmhpbzIxN201dUtWQzN6a0s1aW52Q1ZYdDhOd0ZzaFJBTWp4VkxYQ0Nq?=
 =?utf-8?B?bDNGc25HN0o5VGI4cjd6Mm0zbUxGQXhXOWZKVk5jd01BdjNWMFQrK3dZL3Qz?=
 =?utf-8?B?Q21YelJqWE5jTGg4V3NHSGxmTlVLcjhYZDFSNWZUOXdJSm4vbWNvcDdnanF0?=
 =?utf-8?B?bVNqS0VVUXk5NWRmdmVPamtBN3Z4TFg1VmxiZkRFd2t5MVEyUEVWL3NDZzM4?=
 =?utf-8?B?QnlaeXlzUFF0SHZBTXR0ODJHL0JTSVNPTFlFWmlEdnRYTmRZNFRQTXo2Mjhk?=
 =?utf-8?B?UXVwMy9FWE9nVHVEMzJ0YTBRVzlIVHIvN3ZDa0NHVjZJY2M2ZWhRZlZraHNw?=
 =?utf-8?B?OWF0ejNSS3AvazMxaDdOcGlKbS9RSGg3eVpweE0xc3Y0a3haTVI0SXo2d1Iv?=
 =?utf-8?B?TFkvdHRDQnErczluVmpLYndhUmNXVWlqTlY0Qy9HQzNjN1llZnp1b2l3emFL?=
 =?utf-8?B?alEzZmxiZzMyMWhmQzZBUkg4cWlvejJyQ2Y0a0RVc3poZGlmRW5ZNFhxajhO?=
 =?utf-8?B?WURldE82cERXNkQ3OWZsYkxXNGV3dWRadGcySnNUa2Y4Mm5GT2tMbDlla0cr?=
 =?utf-8?B?dzBRRFVmd0hDbGNtTld5THVYYWw1MXNSU09jRDJrZzZSa0ZKZCt6ZjhkWktN?=
 =?utf-8?B?Q000R1pPMkxxdFo0UDQwU2VrRnlyWTJWU1dXWE9LU3JtdTIxNHc5VXJoa1Ez?=
 =?utf-8?B?TUR5RjBoblhqQ2dXMDhYdCtTVXhXRFhSU0N0VFlPNmNFU2NOSXoycmo0VnNJ?=
 =?utf-8?B?OFNQZ2lFQmkyeHlGd2dMODdtRkptWG5JNEtaSHUyelVBQmlueFI3Q2JWTGdt?=
 =?utf-8?B?bU9CUkU3bUhpalVEOWlMWmt3RFdORUhnRXA2NngwTTFnYmtvMGFZcWhjck8r?=
 =?utf-8?B?TElRR0VmRGJXSVE3TjZrOXNwbzMvTDhjMW1GaGhMcitRbCtJU2daUS9YaUNw?=
 =?utf-8?B?TTJwMjZVdURuNDc3TnpvLzF4N3dzRE5nQlZ5bC9mZFJjbUhEbzRHVWpWVkRI?=
 =?utf-8?B?QVFPQUxLbmx4S1RyS1dPU1EvTUJWdWpsR0UzQ0dHV2RNL3JRRVFEQllGM2U1?=
 =?utf-8?B?MzBCanpWaDRHVkJpTjV2Q21sY3RIU3FoMHlPc1pSRG9KbzNvc1FvMExwdXli?=
 =?utf-8?B?NjIvNW5RNHNIZXUwdUVKdFM3YnBsamhSZThnWkZPVDVobVFLTUZVRVFOVHVI?=
 =?utf-8?B?ZGZMV2dYRFg2eURiZzZ0R3QvRUk3R1hOMTFid3lEbHNBREx3bkFkck9pRi9v?=
 =?utf-8?Q?P5LOrHSF+jlDH6i2VvW4kIawS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1f2ab5-108e-4985-9242-08dba24c1c94
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:39:58.7518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtTQ9zk3yNTmErRrOdBc4YUzk1cbEYYrW35FMxD7bKztCOmhe7EgOATSb06vV3mnaBWBFjwcDd3z4c5B7CWkig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8727
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


On 21/08/2023 08:47, Arvind Yadav wrote:
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
We should check validity and range of index here before before using it 
below.
> +	mutex_lock(&workload->workload_lock);
> +	for (; index > 0; index--) {
> +		int val = atomic_read(&workload->power_profile_ref[index]);
> +
> +		if (val) {
> +			reschedule = true;
> +		} else {
> +			if (workload->submit_workload_status &
> +			    (1 << index)) {
> +				ret = amdgpu_power_profile_clear(adev, index);
> +				if (ret) {
> +					DRM_WARN("Failed to clear workload %s,error = %d\n",
> +						 amdgpu_workload_mode_name[index], ret);
> +					goto exit;
instead of exiting, we might wanna continue the loop here, just to check 
if we are able to reset another profile in the next attempt.
> +				}
> +			}
> +		}
> +	}
A blank line recommended here.
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
We don't want to schedule this work everytime a power profile is put, 
but we want to do that only when a power profile ref count reaches '0'. 
So you might want to check the ref_count, and schedule the work under a 
if (!ref_count) condition.
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
>   
>   	ret = amdgpu_power_profile_set(adev, profile);
>   	if (ret) {
>   		DRM_WARN("Failed to set workload profile to %s, error = %d\n",
>   			 amdgpu_workload_mode_name[profile], ret);
> +		goto exit;
> +	}
> +
> +	/* Clear the already finished jobs of higher power profile*/

We are not clearing the jobs here, but their power profiles.

I would recommend a little rework in the comment like "As we cancelled 
the delayed work, check and clear the pending higher power profiles set 
by previous jobs which are done now"

> +	for (int index = fls(workload->submit_workload_status);
The index can be initialized above, like the put function for loop.
> +	     index > profile; index--) {
> +		if (!atomic_read(&workload->power_profile_ref[index]) &&
> +		    workload->submit_workload_status & (1 << index)) {
> +			ret = amdgpu_power_profile_clear(adev, index);
After clearing the power profile, we should also clear the respective 
workload->submit_workload_status bit as well, right ?
> +			if (ret) {
> +				DRM_WARN("Failed to clear workload %s, err = %d\n",
> +					 amdgpu_workload_mode_name[profile], ret);
> +				goto exit;

Same as previous about continuing the loop.

- Shashank

> +			}
> +		}
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
