Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A52C46F6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 18:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9A66E931;
	Wed, 25 Nov 2020 17:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D966E931;
 Wed, 25 Nov 2020 17:41:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcuGBYsAMjpvmIXwmEE5mprybqwOFgyvq1o0vLcxnGPzyn2UwjpM65UXbWTJss/o5pM9ZW5Pq7dlhGyBbdAGujJtt1xvJAIfrehjnLQqmPSGn6NrCdqs1p9VKNsoMdrAby3g4OTybL+Gaalyz/2pwH4Md3I+AIDXSrxZ27bH/zbAUbf99RMVoiEjpayOpxL/A+50S2FPKMvv123ZuqKz/9hXtg747W64jx6NepugM281e2hrHq2gN77i8zkS210VKPufS8Y84cwIKDm8nhrm3NAzCxzMwMgbwG1uyczcNB0v29PkeBssq8bhl5bntG4YehOxjhmZ5dNLV5K6PPSCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omY9WPIp26mQa7RpQ3fqlj7whK9oBUiwdt5YS5PZhtI=;
 b=lH39yC1pENzcHO1q06WfI0ipJL85GAlM31aTGdwB6emBsN8A1JbOA7dbU0jcjDhi05FjcOBTJHrJX+K5CpiEu/RTHmMMcJM0Y+IA7ezVEu2j4z6s3cwnm6boiGK8HZvRhP3JqZv0CpjTvP8kOqXzZCUPrq9KjcfQqslRVkO0hS0ZkrX95XTDlGS9zHg+rnK8nAXDBGPZ2OPoZoOvhu4dVRwkARZFw5sM9e1Kal7iMrZKNFVXsQMzPfdGsFTyCrchKPwhNXy61vOI+W9gQbZzw2ZG96zcrstKkQISWs7BIKc9mikIDVuvrrukUfRhpuE9FnVmqh3KLIcQ5G4KpF6RQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omY9WPIp26mQa7RpQ3fqlj7whK9oBUiwdt5YS5PZhtI=;
 b=XvXhekyG/CCVcg6uEJXR+nh5mnXwPiGxXWzl9W0r4AWxzA216iE4qmJE9FMobGny5nmkG0lyBN4ci87pd4rYalDIhnO0BCHJjZJX12XLuhjvF+GJLufN66XCCA7LgJUEakiwLlfk/KBwNUCjMvsnMyM80V/hN9DUwzg/OAaKPKs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20; Wed, 25 Nov 2020 17:41:40 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 17:41:40 +0000
Subject: Re: [PATCH v3 08/12] drm/amdgpu: Split amdgpu_device_fini into early
 and late
To: Daniel Vetter <daniel@ffwll.ch>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-9-git-send-email-andrey.grodzovsky@amd.com>
 <20201124145318.GS401619@phenom.ffwll.local>
 <21f9e551-495a-3c3e-09d9-7cdf2bbab8d1@amd.com>
 <20201125104138.GW401619@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <de13cddf-169f-b1d5-900c-17fdf3986c62@amd.com>
Date: Wed, 25 Nov 2020 12:41:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20201125104138.GW401619@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:b441:3cca:9ab3:ff85]
X-ClientProxiedBy: YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::18) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b441:3cca:9ab3:ff85]
 (2607:fea8:3edf:49b0:b441:3cca:9ab3:ff85) by
 YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 17:41:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 37c2b901-e39a-465b-10c4-08d891695de0
X-MS-TrafficTypeDiagnostic: DM6PR12MB4268:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4268B7624C7C16110727C037EAFA0@DM6PR12MB4268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l3Fw6VO9BT2Lk1cLBmOnUKuIsn/uAAbD24LT3qvzN+B8OAEIGRbl6fP4yR0VWgiEu6YSaWRwfAdzuyV5zVcyKl7Qnk7u9KVsEBSek2V0wDHqzKaLHrMj1YQM+0LihMjMfCU3vDk0UvKGq6q3I7BDIiHWTD3RDgmIYIrVDxw9BHhTCcpWuNcna0Ec5ze0oUGNvxYaPhdi788fbaFr7avgElKpc6g+YLrXuzJOPHjf2nnWXExrX4LNiiHknZcNRK1RUCBjL+jJimg6ZOVNcyhO75djWc7CsxEuqTMiEHqyiGtItXy9dUvKgYg6quiox+WZ4K44oimjYPV94JGEpZSfyC+0aRI4ks4syynyVmos+DA5tPOYQqryHcrItu3LMUMt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(66946007)(53546011)(6486002)(83380400001)(478600001)(5660300002)(52116002)(66476007)(66556008)(86362001)(6916009)(186003)(30864003)(16526019)(2906002)(4326008)(7416002)(316002)(31686004)(8676002)(31696002)(2616005)(36756003)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V0pPK3pIUlM4YlppT0Rsbi92dFpsNVgzbldZVFJaeFdwSElqMjRUYTBpSzAx?=
 =?utf-8?B?cmFDVDlKV3NQQlRaTDBNV2ZFSnh2S2Zsd01HTWtQV25MMVBsSmtrYU1zLzE0?=
 =?utf-8?B?WmUxUzFFUnNlWkRiUHp2bGM3VXBuQ0JmK3B0c2tiNnNPdjlnWDlqenJFVnMy?=
 =?utf-8?B?TWdPYjBaRzFOZU55RWd3NFRMRnRFM24xZk9vTm1xMlFxTG1RaGFwRmhYWTNG?=
 =?utf-8?B?YUtBT0Y4Vjl4cUcwa3RTNE9pK2JLMGRLcHlDeGhFdlhFdGZaQm4ycElZNFJi?=
 =?utf-8?B?Sm4xREx0M0E0aTg0NmtUSHlFcEpXejhPN1VSeUYxTm5TcFVpOFZpM0NmK2s5?=
 =?utf-8?B?ZVVUeEUvYVJ4QXBaQ1V4SmRpL0swN1k0bmkvVEFYdUdnMzFWYWFWUFMyN3FI?=
 =?utf-8?B?eWhXSjFieE5wb1Jrbml2VGo1TE8razBlRklyWER3TFhjSUdEZ3V2bWh2K0Fv?=
 =?utf-8?B?bG1nMmt0VzV3NStTR081NnBRUnBhVGhQQzdDM1YvZkJqV3Rkdjk4TlZxcG15?=
 =?utf-8?B?cFJVYkFVeVNiR3JpMGlSZCtlNk16M01saTRYVUNqRis0aTVybFlWK1BTU0RS?=
 =?utf-8?B?YUdtVUw5Tis0TFZsVmN2U05TODU1Um1La09wS2F0QWhFWEI4cWxRUVRmU2tW?=
 =?utf-8?B?bWw1dmlONWRPSWo0WlZWa0RTUTR2OUZabzhHa21ZMXVhbnZZVk9mQ1hOaGhl?=
 =?utf-8?B?Qk1rc29XUWVVZHpTZFhpaVZPNGhxcHZVSmgwSTg5TDhxMXVKWVlDbndwV3BH?=
 =?utf-8?B?c3BoRUlQcUFIMlQxM1hXeDJCV3J2WktTWGxvSGtaSFl0SVRYT0lzbkJQaWQ2?=
 =?utf-8?B?RTBYcmhqbTl6OVJOSGlUdzFib3lzSnl4ODZlU2IyZlE2Szl5S0NCYmlLeE0r?=
 =?utf-8?B?aFlVQjFCYnAxNTVYQml6dUVLOGlBck95NEV1cXRwOW9rOGJnRXJ2WTc2bXVj?=
 =?utf-8?B?cUNBK0kyYU8ycG1sR25uK21GdVF3ZHN0eXFkWkpNMkYzVXlBZURTV0tuZzlJ?=
 =?utf-8?B?Sk5ML3RTaDNRL0d6bnVzNDZjQXJ1WlpTellRMjhPbU5pd0NvbURIRGd2MkNu?=
 =?utf-8?B?Z0Z4NFlkeCtwNEVJL0R6eVliTU96MXI2Sm5Wa1M2VnR6UmRYZWRBWFZYNDJ2?=
 =?utf-8?B?QVFyc3NjLzR3NVI1aEJQbFJyaWZrMnNzcmcvdSsweWJyTG5ZelExY043OE8y?=
 =?utf-8?B?Znd2Y2NIOFRXVXU4eVRTVWlUdTY4d05XV1kwZ2J5dkZIZnFWcllNUFpzRkkw?=
 =?utf-8?B?YWVyZDRHeWNvd2pjWUpaNGE0WEtTRjdyYVFKUjNTYzU2SSt3UVBPK2JRR3Zq?=
 =?utf-8?B?a3FxajVXb09oU043c1BJcmtNQTRhS0F3OS9CSGpmcnZCNUZsOW5NdHhkY1ZE?=
 =?utf-8?B?QzAwRXdkUUFHVGdWZk5qNEhvMUI3MzBLMEJLK0h6dHNvd1dCQ1grRVI3TUJs?=
 =?utf-8?Q?dZYD82X8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c2b901-e39a-465b-10c4-08d891695de0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 17:41:40.7784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDihd7XHomH8OlBQwE4DJRqCF0CrvDziot54y3aYuLPkMrSSzynmMNbLjQGVVUen54PYMHri/I7czmcI3/43ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268
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
Cc: gregkh@linuxfoundation.org, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, Alexander.Deucher@amd.com, yuq825@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/25/20 5:41 AM, Daniel Vetter wrote:
> On Tue, Nov 24, 2020 at 10:51:57AM -0500, Andrey Grodzovsky wrote:
>> On 11/24/20 9:53 AM, Daniel Vetter wrote:
>>> On Sat, Nov 21, 2020 at 12:21:18AM -0500, Andrey Grodzovsky wrote:
>>>> Some of the stuff in amdgpu_device_fini such as HW interrupts
>>>> disable and pending fences finilization must be done right away on
>>>> pci_remove while most of the stuff which relates to finilizing and
>>>> releasing driver data structures can be kept until
>>>> drm_driver.release hook is called, i.e. when the last device
>>>> reference is dropped.
>>>>
>>> Uh fini_late and fini_early are rathare meaningless namings, since no
>>> clear why there's a split. If you used drm_connector_funcs as inspiration,
>>> that's kinda not good because 'register' itself is a reserved keyword.
>>> That's why we had to add late_ prefix, could as well have used
>>> C_sucks_ as prefix :-) And then the early_unregister for consistency.
>>>
>>> I think fini_hw and fini_sw (or maybe fini_drm) would be a lot clearer
>>> about what they're doing.
>>>
>>> I still strongly recommend that you cut over as much as possible of the
>>> fini_hw work to devm_ and for the fini_sw/drm stuff there's drmm_
>>> -Daniel
>>
>> Definitely, and I put it in a TODO list in the RFC patch.Also, as I
>> mentioned before -
>> I just prefer to leave it for a follow up work because it's non trivial and
>> requires shuffling
>> a lof of stuff around in the driver. I was thinking of committing the work
>> in incremental steps -
>> so it's easier to merge it and control for breakages.
> Yeah doing devm/drmm conversion later on makes sense. It'd still try to
> have better names than what you're currently going with. A few of these
> will likely stick around for very long, not just interim.
> -Daniel

Will do.

Andrey


>
>> Andrey
>>
>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +++++-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 16 ++++++++++++----
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  7 ++-----
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 15 ++++++++++++++-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 24 +++++++++++++++---------
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h    |  1 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 12 +++++++++++-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    |  3 +++
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  3 ++-
>>>>    9 files changed, 65 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> index 83ac06a..6243f6d 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> @@ -1063,7 +1063,9 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
>>>>    int amdgpu_device_init(struct amdgpu_device *adev,
>>>>    		       uint32_t flags);
>>>> -void amdgpu_device_fini(struct amdgpu_device *adev);
>>>> +void amdgpu_device_fini_early(struct amdgpu_device *adev);
>>>> +void amdgpu_device_fini_late(struct amdgpu_device *adev);
>>>> +
>>>>    int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
>>>>    void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
>>>> @@ -1275,6 +1277,8 @@ void amdgpu_driver_lastclose_kms(struct drm_device *dev);
>>>>    int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
>>>>    void amdgpu_driver_postclose_kms(struct drm_device *dev,
>>>>    				 struct drm_file *file_priv);
>>>> +void amdgpu_driver_release_kms(struct drm_device *dev);
>>>> +
>>>>    int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
>>>>    int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
>>>>    int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index 2f60b70..797d94d 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -3557,14 +3557,12 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>>>     * Tear down the driver info (all asics).
>>>>     * Called at driver shutdown.
>>>>     */
>>>> -void amdgpu_device_fini(struct amdgpu_device *adev)
>>>> +void amdgpu_device_fini_early(struct amdgpu_device *adev)
>>>>    {
>>>>    	dev_info(adev->dev, "amdgpu: finishing device.\n");
>>>>    	flush_delayed_work(&adev->delayed_init_work);
>>>>    	adev->shutdown = true;
>>>> -	kfree(adev->pci_state);
>>>> -
>>>>    	/* make sure IB test finished before entering exclusive mode
>>>>    	 * to avoid preemption on IB test
>>>>    	 * */
>>>> @@ -3581,11 +3579,18 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
>>>>    		else
>>>>    			drm_atomic_helper_shutdown(adev_to_drm(adev));
>>>>    	}
>>>> -	amdgpu_fence_driver_fini(adev);
>>>> +	amdgpu_fence_driver_fini_early(adev);
>>>>    	if (adev->pm_sysfs_en)
>>>>    		amdgpu_pm_sysfs_fini(adev);
>>>>    	amdgpu_fbdev_fini(adev);
>>>> +
>>>> +	amdgpu_irq_fini_early(adev);
>>>> +}
>>>> +
>>>> +void amdgpu_device_fini_late(struct amdgpu_device *adev)
>>>> +{
>>>>    	amdgpu_device_ip_fini(adev);
>>>> +	amdgpu_fence_driver_fini_late(adev);
>>>>    	release_firmware(adev->firmware.gpu_info_fw);
>>>>    	adev->firmware.gpu_info_fw = NULL;
>>>>    	adev->accel_working = false;
>>>> @@ -3621,6 +3626,9 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
>>>>    		amdgpu_pmu_fini(adev);
>>>>    	if (adev->mman.discovery_bin)
>>>>    		amdgpu_discovery_fini(adev);
>>>> +
>>>> +	kfree(adev->pci_state);
>>>> +
>>>>    }
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> index 7f98cf1..3d130fc 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> @@ -1244,14 +1244,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)
>>>>    {
>>>>    	struct drm_device *dev = pci_get_drvdata(pdev);
>>>> -#ifdef MODULE
>>>> -	if (THIS_MODULE->state != MODULE_STATE_GOING)
>>>> -#endif
>>>> -		DRM_ERROR("Hotplug removal is not supported\n");
>>>>    	drm_dev_unplug(dev);
>>>>    	amdgpu_driver_unload_kms(dev);
>>>> +
>>>>    	pci_disable_device(pdev);
>>>> -	pci_set_drvdata(pdev, NULL);
>>>>    	drm_dev_put(dev);
>>>>    }
>>>> @@ -1557,6 +1553,7 @@ static struct drm_driver kms_driver = {
>>>>    	.dumb_create = amdgpu_mode_dumb_create,
>>>>    	.dumb_map_offset = amdgpu_mode_dumb_mmap,
>>>>    	.fops = &amdgpu_driver_kms_fops,
>>>> +	.release = &amdgpu_driver_release_kms,
>>>>    	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>>>>    	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> index d0b0021..c123aa6 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> @@ -523,7 +523,7 @@ int amdgpu_fence_driver_init(struct amdgpu_device *adev)
>>>>     *
>>>>     * Tear down the fence driver for all possible rings (all asics).
>>>>     */
>>>> -void amdgpu_fence_driver_fini(struct amdgpu_device *adev)
>>>> +void amdgpu_fence_driver_fini_early(struct amdgpu_device *adev)
>>>>    {
>>>>    	unsigned i, j;
>>>>    	int r;
>>>> @@ -544,6 +544,19 @@ void amdgpu_fence_driver_fini(struct amdgpu_device *adev)
>>>>    		if (!ring->no_scheduler)
>>>>    			drm_sched_fini(&ring->sched);
>>>>    		del_timer_sync(&ring->fence_drv.fallback_timer);
>>>> +	}
>>>> +}
>>>> +
>>>> +void amdgpu_fence_driver_fini_late(struct amdgpu_device *adev)
>>>> +{
>>>> +	unsigned int i, j;
>>>> +
>>>> +	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>>>> +		struct amdgpu_ring *ring = adev->rings[i];
>>>> +
>>>> +		if (!ring || !ring->fence_drv.initialized)
>>>> +			continue;
>>>> +
>>>>    		for (j = 0; j <= ring->fence_drv.num_fences_mask; ++j)
>>>>    			dma_fence_put(ring->fence_drv.fences[j]);
>>>>    		kfree(ring->fence_drv.fences);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>>>> index 300ac73..a833197 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>>>> @@ -49,6 +49,7 @@
>>>>    #include <drm/drm_irq.h>
>>>>    #include <drm/drm_vblank.h>
>>>>    #include <drm/amdgpu_drm.h>
>>>> +#include <drm/drm_drv.h>
>>>>    #include "amdgpu.h"
>>>>    #include "amdgpu_ih.h"
>>>>    #include "atom.h"
>>>> @@ -297,6 +298,20 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
>>>>    	return 0;
>>>>    }
>>>> +
>>>> +void amdgpu_irq_fini_early(struct amdgpu_device *adev)
>>>> +{
>>>> +	if (adev->irq.installed) {
>>>> +		drm_irq_uninstall(&adev->ddev);
>>>> +		adev->irq.installed = false;
>>>> +		if (adev->irq.msi_enabled)
>>>> +			pci_free_irq_vectors(adev->pdev);
>>>> +
>>>> +		if (!amdgpu_device_has_dc_support(adev))
>>>> +			flush_work(&adev->hotplug_work);
>>>> +	}
>>>> +}
>>>> +
>>>>    /**
>>>>     * amdgpu_irq_fini - shut down interrupt handling
>>>>     *
>>>> @@ -310,15 +325,6 @@ void amdgpu_irq_fini(struct amdgpu_device *adev)
>>>>    {
>>>>    	unsigned i, j;
>>>> -	if (adev->irq.installed) {
>>>> -		drm_irq_uninstall(adev_to_drm(adev));
>>>> -		adev->irq.installed = false;
>>>> -		if (adev->irq.msi_enabled)
>>>> -			pci_free_irq_vectors(adev->pdev);
>>>> -		if (!amdgpu_device_has_dc_support(adev))
>>>> -			flush_work(&adev->hotplug_work);
>>>> -	}
>>>> -
>>>>    	for (i = 0; i < AMDGPU_IRQ_CLIENTID_MAX; ++i) {
>>>>    		if (!adev->irq.client[i].sources)
>>>>    			continue;
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
>>>> index c718e94..718c70f 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
>>>> @@ -104,6 +104,7 @@ irqreturn_t amdgpu_irq_handler(int irq, void *arg);
>>>>    int amdgpu_irq_init(struct amdgpu_device *adev);
>>>>    void amdgpu_irq_fini(struct amdgpu_device *adev);
>>>> +void amdgpu_irq_fini_early(struct amdgpu_device *adev);
>>>>    int amdgpu_irq_add_id(struct amdgpu_device *adev,
>>>>    		      unsigned client_id, unsigned src_id,
>>>>    		      struct amdgpu_irq_src *source);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> index a0af8a7..9e30c5c 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> @@ -29,6 +29,7 @@
>>>>    #include "amdgpu.h"
>>>>    #include <drm/drm_debugfs.h>
>>>>    #include <drm/amdgpu_drm.h>
>>>> +#include <drm/drm_drv.h>
>>>>    #include "amdgpu_sched.h"
>>>>    #include "amdgpu_uvd.h"
>>>>    #include "amdgpu_vce.h"
>>>> @@ -94,7 +95,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
>>>>    	}
>>>>    	amdgpu_acpi_fini(adev);
>>>> -	amdgpu_device_fini(adev);
>>>> +	amdgpu_device_fini_early(adev);
>>>>    }
>>>>    void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
>>>> @@ -1147,6 +1148,15 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
>>>>    	pm_runtime_put_autosuspend(dev->dev);
>>>>    }
>>>> +
>>>> +void amdgpu_driver_release_kms(struct drm_device *dev)
>>>> +{
>>>> +	struct amdgpu_device *adev = drm_to_adev(dev);
>>>> +
>>>> +	amdgpu_device_fini_late(adev);
>>>> +	pci_set_drvdata(adev->pdev, NULL);
>>>> +}
>>>> +
>>>>    /*
>>>>     * VBlank related functions.
>>>>     */
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>>>> index 9d11b84..caf828a 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>>>> @@ -2142,9 +2142,12 @@ int amdgpu_ras_pre_fini(struct amdgpu_device *adev)
>>>>    {
>>>>    	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
>>>> +	//DRM_ERROR("adev 0x%llx", (long long unsigned int)adev);
>>>> +
>>>>    	if (!con)
>>>>    		return 0;
>>>> +
>>>>    	/* Need disable ras on all IPs here before ip [hw/sw]fini */
>>>>    	amdgpu_ras_disable_all_features(adev, 0);
>>>>    	amdgpu_ras_recovery_fini(adev);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> index 7112137..074f36b 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> @@ -107,7 +107,8 @@ struct amdgpu_fence_driver {
>>>>    };
>>>>    int amdgpu_fence_driver_init(struct amdgpu_device *adev);
>>>> -void amdgpu_fence_driver_fini(struct amdgpu_device *adev);
>>>> +void amdgpu_fence_driver_fini_early(struct amdgpu_device *adev);
>>>> +void amdgpu_fence_driver_fini_late(struct amdgpu_device *adev);
>>>>    void amdgpu_fence_driver_force_completion(struct amdgpu_ring *ring);
>>>>    int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>>>> -- 
>>>> 2.7.4
>>>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
