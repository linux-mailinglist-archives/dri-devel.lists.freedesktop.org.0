Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659A32C2BF0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 16:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090316E463;
	Tue, 24 Nov 2020 15:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C206E466;
 Tue, 24 Nov 2020 15:52:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iwvx26OHK7RDa4rWXxIX1FmWopNGsqJ0UaJSkaz7SUf+DHLB7lWy4WqAI4L5GpIsykKGn+PhXZjJbeOJLLqZH4v2A0lGTOm9EQUEYmN7/LYb9k8ZKnUnTKcsf3uNgkulgB7C+FELdEwXm2jeP29DRKDnKuwREEI9T0o1B9/qmE26/TaB1ErBMmfN9FFQmaA1ZFkPjJvKnm0z3iGf90k1vnnHKyVJsXD1XqCLLT8Gnu4h30O1mLJwKOPXCj3JmQwXdrnqeH1infpl00jas/AOHE9FHin3YGKQMDn0Fpi8qotsS4z/E+b2KFUBg/zWxTV+eb356LGt7gtehOpnmG/hpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aw4PGzBcVimrJirAHkkFAq+Mb2ODV0guHjb5R2QRgQY=;
 b=U3stNDD+orKv/9/5fIfScG7FlgCpmZhooErcxsxdS74IOvBvkwyIdSdtwsDuwNrPTE+EUHAB5b5dvxa9++6FhuVJ9GzBhR7fTjxMJqazDRnlxRqoTiVtvt+Y6mZMVFK2NTWYJthYmiMetxGUUGTkQZdr1DdkfDU3KR4HpWg60lnOBs+w5fpNJ+uTj7vKQGzRIO2gqhLy48d1QUrGEpkdryauQv91+WzjwXXMK/gyEcfAlbYPn/lGU2gTtw2yZUJzitzHRxcun+lYGagsglggM1yidkW0x8+5HvYS8UZms9MXfLeqdPTiKrFGo7+CgZjFkLlP/6sY2ufbCvuzc38hJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aw4PGzBcVimrJirAHkkFAq+Mb2ODV0guHjb5R2QRgQY=;
 b=G55B3jLLKAOnPDYWzWywdD/XkYahH1mDXXjy+QWjQxFUdJQ3vjpw8yJuW5faQwPym8nZsw5AZXz5GROngQT3m/D2cIRgJTxYqh92n+C/hj7oCjOGSw4tPkwr+VgjUoD2zcbBSwD6tZcdHZQhNzOrURmIxN+6j0aDucWSAd7H3/E=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3017.namprd12.prod.outlook.com (2603:10b6:5:3e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Tue, 24 Nov 2020 15:51:59 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Tue, 24 Nov 2020
 15:51:59 +0000
Subject: Re: [PATCH v3 08/12] drm/amdgpu: Split amdgpu_device_fini into early
 and late
To: Daniel Vetter <daniel@ffwll.ch>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-9-git-send-email-andrey.grodzovsky@amd.com>
 <20201124145318.GS401619@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <21f9e551-495a-3c3e-09d9-7cdf2bbab8d1@amd.com>
Date: Tue, 24 Nov 2020 10:51:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20201124145318.GS401619@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: CH0PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:610:b0::6) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.231.243] (165.204.55.251) by
 CH0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:610:b0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Tue, 24 Nov 2020 15:51:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 582c4dc0-4dc1-4918-be82-08d89090e0c3
X-MS-TrafficTypeDiagnostic: DM6PR12MB3017:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB30178D4EB8BA57AFEAD3A3EAEAFB0@DM6PR12MB3017.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9DfeHWIfyhMMnRJTU8uUtPit4Ju1DYeaUt4Axj0Clh6sE34R7Lg9uSTChir45WtYcu5zBqfi0i0rNq1E3PaaCHspBbikWg7OkcoimRzr4F/ykNMnxIWUbhpNkiUJ913R/qWTea/H+InRlT0So/bi16gVaVHGa81Lfdgk6kd/CO6wCHeqFoyRt6QtKZRSYlD2+1JRS/U/aAX0tQbHuK1qNcKt+UIHKQrB9px0WcS/+LObukNSb1r43cM0RdfDF8M6LPVAE3g1c6f8/prcW1CzDmPh8YTiZMEwgWhjTMwS9U3mO5tiAw/RFo+giiw7nCynGDNZe39wp/666WeE/kLZlOEBsTjM5E52i8CdyMwK198vA8T62FdU+FOmgWWJ0gBU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(6486002)(66556008)(86362001)(66476007)(316002)(66946007)(478600001)(16576012)(4326008)(2906002)(52116002)(26005)(83380400001)(6916009)(8936002)(7416002)(36756003)(53546011)(2616005)(8676002)(30864003)(31696002)(31686004)(956004)(186003)(5660300002)(16526019)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: BPLFXSzv3XnoW4LJhozSJRh2UK2S84lrHeqx13JJltBG5h9cORwXqXg8bMfQs5xymx+2iApbgJIL/kXYau0AMidN3DRIwdeVV3jfdFVmQuZg0MlrXq7whlD2kzrknyufroxD1e6wZ0IBe5miXG8lqWRVYzoqc+r5JEt6l1QkuoasnwIgJBJzbSpl41CjSisLUdnXPLBQPmAzrQ9lrRUJKpo886obMiQlmXL0wO2BkjxapqPRR0R59QQUrCSTW5LitPWIgJYYCICGuif0Ea1zqrLF6+6Qxgsng8Vdvn1Kct3x6Kl4vx1WfNWMQUE37MUOcx+U9iVG5WZYW/pf8Nd3gioAzlpGK7uEPy8To6A27uhE0jgJnpJPfihmUoa/zLqe8s5QDIZSBraIuSBy7AeQ4SZoOv57pkOstfa5TQKiT+1IvL3fRkN4bce5DPU7FNeygcYX6Xr20T66pweHatMQcX1xUuPmbwJv9gIXzTY2k6oETXKShprbtSRM7U+QQZObY+/+GPpzm9qOOVmLh0h6tDPiav0d1ngSd1EE3eu3U2wjdv7LFUgpjk5En3PBdN1z6UQijxpNegKn6QcviOlTnYCU+9n/4XfDgpj5P2wXPtOi89BmClZuwbIxWGw1BbMW1N06YgLqwdv3fB4GDMDXd6sRWCTMA3LVhU/xPVkSN/MVsUgYQ9eJuJ3mZZvbKo5X5Ry+/b3QDhCGKOND4sPq76iyAIhR2HLpoBvjgA4G25sKKywTz0pDlRzFzF9T2maqxir/gmx1EYbXe2cZYCetGdUmKRzD9GmlWkQTNglaXVLrz8lcXu5HBujSvvKQa3hDJhXa6PDWpTvWGGodi2SHNZkGE5KDbLWARFLj+xPoY1nilzfgza3uDRFPSHDV73DTujVaoEb82maVDgAPt37/iw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582c4dc0-4dc1-4918-be82-08d89090e0c3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 15:51:59.5103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8RjPI1BJqTUYG4kEUhzIVsECTxvu1vyPVljFMV2hOBoSd2bLkjk2nRtYzISYSfVEH4Lkdiw62omlJM+a9lOOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3017
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


On 11/24/20 9:53 AM, Daniel Vetter wrote:
> On Sat, Nov 21, 2020 at 12:21:18AM -0500, Andrey Grodzovsky wrote:
>> Some of the stuff in amdgpu_device_fini such as HW interrupts
>> disable and pending fences finilization must be done right away on
>> pci_remove while most of the stuff which relates to finilizing and
>> releasing driver data structures can be kept until
>> drm_driver.release hook is called, i.e. when the last device
>> reference is dropped.
>>
> Uh fini_late and fini_early are rathare meaningless namings, since no
> clear why there's a split. If you used drm_connector_funcs as inspiration,
> that's kinda not good because 'register' itself is a reserved keyword.
> That's why we had to add late_ prefix, could as well have used
> C_sucks_ as prefix :-) And then the early_unregister for consistency.
>
> I think fini_hw and fini_sw (or maybe fini_drm) would be a lot clearer
> about what they're doing.
>
> I still strongly recommend that you cut over as much as possible of the
> fini_hw work to devm_ and for the fini_sw/drm stuff there's drmm_
> -Daniel


Definitely, and I put it in a TODO list in the RFC patch.Also, as I mentioned 
before -
I just prefer to leave it for a follow up work because it's non trivial and 
requires shuffling
a lof of stuff around in the driver. I was thinking of committing the work in 
incremental steps -
so it's easier to merge it and control for breakages.

Andrey


>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 16 ++++++++++++----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  7 ++-----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 15 ++++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 24 +++++++++++++++---------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h    |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 12 +++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    |  3 +++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  3 ++-
>>   9 files changed, 65 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 83ac06a..6243f6d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -1063,7 +1063,9 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
>>   
>>   int amdgpu_device_init(struct amdgpu_device *adev,
>>   		       uint32_t flags);
>> -void amdgpu_device_fini(struct amdgpu_device *adev);
>> +void amdgpu_device_fini_early(struct amdgpu_device *adev);
>> +void amdgpu_device_fini_late(struct amdgpu_device *adev);
>> +
>>   int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
>>   
>>   void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
>> @@ -1275,6 +1277,8 @@ void amdgpu_driver_lastclose_kms(struct drm_device *dev);
>>   int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
>>   void amdgpu_driver_postclose_kms(struct drm_device *dev,
>>   				 struct drm_file *file_priv);
>> +void amdgpu_driver_release_kms(struct drm_device *dev);
>> +
>>   int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
>>   int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
>>   int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 2f60b70..797d94d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3557,14 +3557,12 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>    * Tear down the driver info (all asics).
>>    * Called at driver shutdown.
>>    */
>> -void amdgpu_device_fini(struct amdgpu_device *adev)
>> +void amdgpu_device_fini_early(struct amdgpu_device *adev)
>>   {
>>   	dev_info(adev->dev, "amdgpu: finishing device.\n");
>>   	flush_delayed_work(&adev->delayed_init_work);
>>   	adev->shutdown = true;
>>   
>> -	kfree(adev->pci_state);
>> -
>>   	/* make sure IB test finished before entering exclusive mode
>>   	 * to avoid preemption on IB test
>>   	 * */
>> @@ -3581,11 +3579,18 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
>>   		else
>>   			drm_atomic_helper_shutdown(adev_to_drm(adev));
>>   	}
>> -	amdgpu_fence_driver_fini(adev);
>> +	amdgpu_fence_driver_fini_early(adev);
>>   	if (adev->pm_sysfs_en)
>>   		amdgpu_pm_sysfs_fini(adev);
>>   	amdgpu_fbdev_fini(adev);
>> +
>> +	amdgpu_irq_fini_early(adev);
>> +}
>> +
>> +void amdgpu_device_fini_late(struct amdgpu_device *adev)
>> +{
>>   	amdgpu_device_ip_fini(adev);
>> +	amdgpu_fence_driver_fini_late(adev);
>>   	release_firmware(adev->firmware.gpu_info_fw);
>>   	adev->firmware.gpu_info_fw = NULL;
>>   	adev->accel_working = false;
>> @@ -3621,6 +3626,9 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
>>   		amdgpu_pmu_fini(adev);
>>   	if (adev->mman.discovery_bin)
>>   		amdgpu_discovery_fini(adev);
>> +
>> +	kfree(adev->pci_state);
>> +
>>   }
>>   
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 7f98cf1..3d130fc 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -1244,14 +1244,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)
>>   {
>>   	struct drm_device *dev = pci_get_drvdata(pdev);
>>   
>> -#ifdef MODULE
>> -	if (THIS_MODULE->state != MODULE_STATE_GOING)
>> -#endif
>> -		DRM_ERROR("Hotplug removal is not supported\n");
>>   	drm_dev_unplug(dev);
>>   	amdgpu_driver_unload_kms(dev);
>> +
>>   	pci_disable_device(pdev);
>> -	pci_set_drvdata(pdev, NULL);
>>   	drm_dev_put(dev);
>>   }
>>   
>> @@ -1557,6 +1553,7 @@ static struct drm_driver kms_driver = {
>>   	.dumb_create = amdgpu_mode_dumb_create,
>>   	.dumb_map_offset = amdgpu_mode_dumb_mmap,
>>   	.fops = &amdgpu_driver_kms_fops,
>> +	.release = &amdgpu_driver_release_kms,
>>   
>>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> index d0b0021..c123aa6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> @@ -523,7 +523,7 @@ int amdgpu_fence_driver_init(struct amdgpu_device *adev)
>>    *
>>    * Tear down the fence driver for all possible rings (all asics).
>>    */
>> -void amdgpu_fence_driver_fini(struct amdgpu_device *adev)
>> +void amdgpu_fence_driver_fini_early(struct amdgpu_device *adev)
>>   {
>>   	unsigned i, j;
>>   	int r;
>> @@ -544,6 +544,19 @@ void amdgpu_fence_driver_fini(struct amdgpu_device *adev)
>>   		if (!ring->no_scheduler)
>>   			drm_sched_fini(&ring->sched);
>>   		del_timer_sync(&ring->fence_drv.fallback_timer);
>> +	}
>> +}
>> +
>> +void amdgpu_fence_driver_fini_late(struct amdgpu_device *adev)
>> +{
>> +	unsigned int i, j;
>> +
>> +	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>> +		struct amdgpu_ring *ring = adev->rings[i];
>> +
>> +		if (!ring || !ring->fence_drv.initialized)
>> +			continue;
>> +
>>   		for (j = 0; j <= ring->fence_drv.num_fences_mask; ++j)
>>   			dma_fence_put(ring->fence_drv.fences[j]);
>>   		kfree(ring->fence_drv.fences);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> index 300ac73..a833197 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> @@ -49,6 +49,7 @@
>>   #include <drm/drm_irq.h>
>>   #include <drm/drm_vblank.h>
>>   #include <drm/amdgpu_drm.h>
>> +#include <drm/drm_drv.h>
>>   #include "amdgpu.h"
>>   #include "amdgpu_ih.h"
>>   #include "atom.h"
>> @@ -297,6 +298,20 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
>>   	return 0;
>>   }
>>   
>> +
>> +void amdgpu_irq_fini_early(struct amdgpu_device *adev)
>> +{
>> +	if (adev->irq.installed) {
>> +		drm_irq_uninstall(&adev->ddev);
>> +		adev->irq.installed = false;
>> +		if (adev->irq.msi_enabled)
>> +			pci_free_irq_vectors(adev->pdev);
>> +
>> +		if (!amdgpu_device_has_dc_support(adev))
>> +			flush_work(&adev->hotplug_work);
>> +	}
>> +}
>> +
>>   /**
>>    * amdgpu_irq_fini - shut down interrupt handling
>>    *
>> @@ -310,15 +325,6 @@ void amdgpu_irq_fini(struct amdgpu_device *adev)
>>   {
>>   	unsigned i, j;
>>   
>> -	if (adev->irq.installed) {
>> -		drm_irq_uninstall(adev_to_drm(adev));
>> -		adev->irq.installed = false;
>> -		if (adev->irq.msi_enabled)
>> -			pci_free_irq_vectors(adev->pdev);
>> -		if (!amdgpu_device_has_dc_support(adev))
>> -			flush_work(&adev->hotplug_work);
>> -	}
>> -
>>   	for (i = 0; i < AMDGPU_IRQ_CLIENTID_MAX; ++i) {
>>   		if (!adev->irq.client[i].sources)
>>   			continue;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
>> index c718e94..718c70f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
>> @@ -104,6 +104,7 @@ irqreturn_t amdgpu_irq_handler(int irq, void *arg);
>>   
>>   int amdgpu_irq_init(struct amdgpu_device *adev);
>>   void amdgpu_irq_fini(struct amdgpu_device *adev);
>> +void amdgpu_irq_fini_early(struct amdgpu_device *adev);
>>   int amdgpu_irq_add_id(struct amdgpu_device *adev,
>>   		      unsigned client_id, unsigned src_id,
>>   		      struct amdgpu_irq_src *source);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> index a0af8a7..9e30c5c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> @@ -29,6 +29,7 @@
>>   #include "amdgpu.h"
>>   #include <drm/drm_debugfs.h>
>>   #include <drm/amdgpu_drm.h>
>> +#include <drm/drm_drv.h>
>>   #include "amdgpu_sched.h"
>>   #include "amdgpu_uvd.h"
>>   #include "amdgpu_vce.h"
>> @@ -94,7 +95,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
>>   	}
>>   
>>   	amdgpu_acpi_fini(adev);
>> -	amdgpu_device_fini(adev);
>> +	amdgpu_device_fini_early(adev);
>>   }
>>   
>>   void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
>> @@ -1147,6 +1148,15 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
>>   	pm_runtime_put_autosuspend(dev->dev);
>>   }
>>   
>> +
>> +void amdgpu_driver_release_kms(struct drm_device *dev)
>> +{
>> +	struct amdgpu_device *adev = drm_to_adev(dev);
>> +
>> +	amdgpu_device_fini_late(adev);
>> +	pci_set_drvdata(adev->pdev, NULL);
>> +}
>> +
>>   /*
>>    * VBlank related functions.
>>    */
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>> index 9d11b84..caf828a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>> @@ -2142,9 +2142,12 @@ int amdgpu_ras_pre_fini(struct amdgpu_device *adev)
>>   {
>>   	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
>>   
>> +	//DRM_ERROR("adev 0x%llx", (long long unsigned int)adev);
>> +
>>   	if (!con)
>>   		return 0;
>>   
>> +
>>   	/* Need disable ras on all IPs here before ip [hw/sw]fini */
>>   	amdgpu_ras_disable_all_features(adev, 0);
>>   	amdgpu_ras_recovery_fini(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> index 7112137..074f36b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> @@ -107,7 +107,8 @@ struct amdgpu_fence_driver {
>>   };
>>   
>>   int amdgpu_fence_driver_init(struct amdgpu_device *adev);
>> -void amdgpu_fence_driver_fini(struct amdgpu_device *adev);
>> +void amdgpu_fence_driver_fini_early(struct amdgpu_device *adev);
>> +void amdgpu_fence_driver_fini_late(struct amdgpu_device *adev);
>>   void amdgpu_fence_driver_force_completion(struct amdgpu_ring *ring);
>>   
>>   int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>> -- 
>> 2.7.4
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
