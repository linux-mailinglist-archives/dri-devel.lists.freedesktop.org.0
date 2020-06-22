Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61599203C2D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 18:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3D56E85F;
	Mon, 22 Jun 2020 16:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2096E858;
 Mon, 22 Jun 2020 16:07:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gokpHdKV1Aa0bxvTNBNWxgTgLbkc97dudkERccWJqo75TvN+aqD11OsE8n8x5/OlHme/AIXhoh0fOf+hXQtPvrNvSomYCpA7oBm4QtIBmGjboBmUGzUTmPn6F2P0/Uy5kHBHE0BDpUFws1Nm+ag6FhEMlc44bTzeJ5lgejpSBomT2pNHsFtlwwllfsGCgZO93G0cfyMEJr0bq/5w2Xxr9ke353Lm8ICC8Z6Y8IzJyeojBr1qEqX/snpQgmPTwVI4v/YBq0tCitakdVNZ2hjtYHa5ivuM+Mot3yESy/jnkHnhyPFfJEef6MgihoMSVD73qXafO0rKs2x8wo8PjnVTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIMd/zDS/QGdCr5d8UFkaGGY/9JRraPEDqjKc6AS9hk=;
 b=TWF0JBLbpdcGKe6lV6qFk+kcnOhme7ZOiizOoM4e8fy0BXNIfFORqslc/u+/hk6AzSw6ITN/VGAMPegihNXwit+T15U+Rbm85S81DrT+Ne8u4Pl/5Ux+1h0lDXzk1bFEZ0W72bC2vXnbwW5CKAWsoe/ZMee3CMXpgDOD+opI+mVbYa0C/sGmNBWA57PcXFo1Qf+Cr/YFjdmPnV/GW0+/rVUUuO2O/43pJb6xt6tc7SOHxGtpTc214KDvB2oEUVgP4Lr7eKzZsRGG+DYyvBadCdULaRU6R41BOCP9Y6zT9vNu+FZq0UjzrZY9Hjfnkd7FmpbIHybSo3lvdWyo7fJP8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIMd/zDS/QGdCr5d8UFkaGGY/9JRraPEDqjKc6AS9hk=;
 b=1dtCybIJjw6I6ZSkL9YL3E4N2TGlZz+rE8zy8MzPHVQSTV/Lo6SmYgKj3aXAZvc+irq35idCU+wANMwtbTPnq4OeTClf5OH7O1P7b4dFIWSoO5CCsPl85e0h3fc/CQmzsP4wESXk8+UpC5ypka21Jr9GpPMi4wvPDhAhOi3VOcc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3210.namprd12.prod.outlook.com (2603:10b6:5:185::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22; Mon, 22 Jun 2020 16:07:29 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf%3]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 16:07:29 +0000
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
To: Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter <daniel@ffwll.ch>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-6-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095124.GE20149@phenom.ffwll.local>
 <20200622112139.GA3421602@kroah.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <fdaebe5b-3930-66d6-4f62-3e59e515e3da@amd.com>
Date: Mon, 22 Jun 2020 12:07:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200622112139.GA3421602@kroah.com>
Content-Type: multipart/mixed; boundary="------------A50175EEBC64120E5BF0EFD8"
Content-Language: en-US
X-ClientProxiedBy: BN6PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:404:10::21) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:6818:fffb:5b06:bef1]
 (2607:fea8:3edf:49b0:6818:fffb:5b06:bef1) by
 BN6PR03CA0107.namprd03.prod.outlook.com (2603:10b6:404:10::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 16:07:27 +0000
X-Originating-IP: [2607:fea8:3edf:49b0:6818:fffb:5b06:bef1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 661ccb07-f3a8-44ad-3530-08d816c65ce9
X-MS-TrafficTypeDiagnostic: DM6PR12MB3210:
X-Microsoft-Antispam-PRVS: <DM6PR12MB321093C46894A021E6FE6C8FEA970@DM6PR12MB3210.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uNkfCTki4CI8JbH2PTeNnNT9jLS6yzPgEs9+p8uNt7dzaNXXcWzuibzRuMREJIbP6u4capSq815C430/x4mVa5SCHG3GYYGPnaHRGAXkDXB/RHp/QVMmh0ETkZbbr9fZjzPW1sx129YLUp6hDmvPnhhwP8NZ7ccGu6rA26/swTyF+ObVL/BaWPfolhX3QAoijAvZhgfxHrYm/M+CDiCJ8iKM3B3ev34EK9hjj+BF70Jm1Bqe7tMATdrcN4VnyyvmOzhWdwmYyNfpF62qYXOed2gq9Yq2QsjnTvfN7SATH/20GhkYg1VD4LWFQvoXkzPvJcVn9lCa83d8nPq46fhA3T4DeS4HAk3dR1Hg/1Vj7pTudgyzoHPSIjONXoGF0GBm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(110136005)(21480400003)(31686004)(53546011)(2616005)(16526019)(30864003)(33964004)(186003)(52116002)(6486002)(8676002)(86362001)(316002)(5660300002)(36756003)(4326008)(235185007)(478600001)(8936002)(83380400001)(31696002)(66556008)(66616009)(66946007)(66476007)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: JROKn9X5maC7i5D9QO+KDJt9XinRUJIp0qeuy3boEyAABBHcQ1G0MrbIqF9Rf0ALMpYTy8k1zhd0UNO3d8g2mSx8vcWwCo2jW6ds0vMDdCNLeqvctZXYGa0SOMUS9tSGy5wdwVoancq6YH1y6P1Vi4IhK+c+zJHaOhFVD5dP7Dp7ea4noOHn94aenZ4Mz7JtELrXYK6HaFodm1Ec8eYMFprmWKCGREk254I7TKp3+fA0KkD1UrDi6/tYs78aQzPWgeUDB80AHCgpxjbfIIR5fGQaaMLGhzhlvrnFfYZGKbRJHuQm6kapQzlAG8acJcfODL9cBSlNFIZGT6aiUSiCYG8O7FJifyCyeB170eTN25cC2ogkK4cRex6dtkzo7Ix0GlOa6F6CWxInunxHQAQV32uVX+nNeCs8sCVfR60CSMi1N0p8WyyUOsMBklc5f59kFO9mdheNjcg80W7aih+t23aIkG6TqZFo64pNq7PSMxwBAs5VIdOSRxldwU0hjWgCh5V+wn4BOB/GO9+SbaEH0NtZgZp6I7PhU5hUWipZZtSfJvvILMg9MlmhAT18u0tw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 661ccb07-f3a8-44ad-3530-08d816c65ce9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 16:07:29.3577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zubNfpM+wxfVM265Mv+dn7w0nzfqGRd1I/pYVMVRbybxwhx4kEz/8f5mqL2ao59SDkM3IyER5wTw2coEW4+R9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3210
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------A50175EEBC64120E5BF0EFD8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/22/20 7:21 AM, Greg KH wrote:
> On Mon, Jun 22, 2020 at 11:51:24AM +0200, Daniel Vetter wrote:
>> On Sun, Jun 21, 2020 at 02:03:05AM -0400, Andrey Grodzovsky wrote:
>>> Track sysfs files in a list so they all can be removed during pci remove
>>> since otherwise their removal after that causes crash because parent
>>> folder was already removed during pci remove.
> Huh?  That should not happen, do you have a backtrace of that crash?


2 examples in the attached trace.

Andrey


>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Uh I thought sysfs just gets yanked completely. Please check with Greg KH
>> whether hand-rolling all this really is the right solution here ... Feels
>> very wrong. I thought this was all supposed to work by adding attributes
>> before publishing the sysfs node, and then letting sysfs clean up
>> everything. Not by cleaning up manually yourself.
> Yes, that is supposed to be the correct thing to do.
>
>> Adding Greg for an authoritative answer.
>> -Daniel
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h          | 13 +++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c |  7 +++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   | 35 ++++++++++++++++++++++++----
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 12 ++++++----
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c      |  8 ++++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++++++--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c     | 13 ++++++++++-
>>>   drivers/gpu/drm/amd/amdgpu/df_v3_6.c         | 10 +++++---
>>>   8 files changed, 99 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index 604a681..ba3775f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -726,6 +726,15 @@ struct amd_powerplay {
>>>   
>>>   #define AMDGPU_RESET_MAGIC_NUM 64
>>>   #define AMDGPU_MAX_DF_PERFMONS 4
>>> +
>>> +struct amdgpu_sysfs_list_node {
>>> +	struct list_head head;
>>> +	struct device_attribute *attr;
>>> +};
> You know we have lists of attributes already, called attribute groups,
> if you really wanted to do something like this.  But, I don't think so.
>
> Either way, don't hand-roll your own stuff that the driver core has
> provided for you for a decade or more, that's just foolish :)
>
>>> +
>>> +#define AMDGPU_DEVICE_ATTR_LIST_NODE(_attr) \
>>> +	struct amdgpu_sysfs_list_node dev_attr_handle_##_attr = {.attr = &dev_attr_##_attr}
>>> +
>>>   struct amdgpu_device {
>>>   	struct device			*dev;
>>>   	struct drm_device		*ddev;
>>> @@ -992,6 +1001,10 @@ struct amdgpu_device {
>>>   	char				product_number[16];
>>>   	char				product_name[32];
>>>   	char				serial[16];
>>> +
>>> +	struct list_head sysfs_files_list;
>>> +	struct mutex	 sysfs_files_list_lock;
>>> +
>>>   };
>>>   
>>>   static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
>>> index fdd52d8..c1549ee 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
>>> @@ -1950,8 +1950,10 @@ static ssize_t amdgpu_atombios_get_vbios_version(struct device *dev,
>>>   	return snprintf(buf, PAGE_SIZE, "%s\n", ctx->vbios_version);
>>>   }
>>>   
>>> +
>>>   static DEVICE_ATTR(vbios_version, 0444, amdgpu_atombios_get_vbios_version,
>>>   		   NULL);
>>> +static AMDGPU_DEVICE_ATTR_LIST_NODE(vbios_version);
>>>   
>>>   /**
>>>    * amdgpu_atombios_fini - free the driver info and callbacks for atombios
>>> @@ -1972,7 +1974,6 @@ void amdgpu_atombios_fini(struct amdgpu_device *adev)
>>>   	adev->mode_info.atom_context = NULL;
>>>   	kfree(adev->mode_info.atom_card_info);
>>>   	adev->mode_info.atom_card_info = NULL;
>>> -	device_remove_file(adev->dev, &dev_attr_vbios_version);
>>>   }
>>>   
>>>   /**
>>> @@ -2038,6 +2039,10 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
>>>   		return ret;
>>>   	}
>>>   
>>> +	mutex_lock(&adev->sysfs_files_list_lock);
>>> +	list_add_tail(&dev_attr_handle_vbios_version.head, &adev->sysfs_files_list);
>>> +	mutex_unlock(&adev->sysfs_files_list_lock);
>>> +
>>>   	return 0;
>>>   }
>>>   
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index e7b9065..3173046 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -2928,6 +2928,12 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>>>   	NULL
>>>   };
>>>   
>>> +static AMDGPU_DEVICE_ATTR_LIST_NODE(product_name);
>>> +static AMDGPU_DEVICE_ATTR_LIST_NODE(product_number);
>>> +static AMDGPU_DEVICE_ATTR_LIST_NODE(serial_number);
>>> +static AMDGPU_DEVICE_ATTR_LIST_NODE(pcie_replay_count);
>>> +
>>> +
>>>   /**
>>>    * amdgpu_device_init - initialize the driver
>>>    *
>>> @@ -3029,6 +3035,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>>   	INIT_LIST_HEAD(&adev->shadow_list);
>>>   	mutex_init(&adev->shadow_list_lock);
>>>   
>>> +	INIT_LIST_HEAD(&adev->sysfs_files_list);
>>> +	mutex_init(&adev->sysfs_files_list_lock);
>>> +
>>>   	INIT_DELAYED_WORK(&adev->delayed_init_work,
>>>   			  amdgpu_device_delayed_init_work_handler);
>>>   	INIT_DELAYED_WORK(&adev->gfx.gfx_off_delay_work,
>>> @@ -3281,6 +3290,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>>   	if (r) {
>>>   		dev_err(adev->dev, "Could not create amdgpu device attr\n");
>>>   		return r;
>>> +	} else {
>>> +		mutex_lock(&adev->sysfs_files_list_lock);
>>> +		list_add_tail(&dev_attr_handle_product_name.head, &adev->sysfs_files_list);
>>> +		list_add_tail(&dev_attr_handle_product_number.head, &adev->sysfs_files_list);
>>> +		list_add_tail(&dev_attr_handle_serial_number.head, &adev->sysfs_files_list);
>>> +		list_add_tail(&dev_attr_handle_pcie_replay_count.head, &adev->sysfs_files_list);
>>> +		mutex_unlock(&adev->sysfs_files_list_lock);
>>>   	}
>>>   
>>>   	if (IS_ENABLED(CONFIG_PERF_EVENTS))
>>> @@ -3298,6 +3314,16 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>>   	return r;
>>>   }
>>>   
>>> +static void amdgpu_sysfs_remove_files(struct amdgpu_device *adev)
>>> +{
>>> +	struct amdgpu_sysfs_list_node *node;
>>> +
>>> +	mutex_lock(&adev->sysfs_files_list_lock);
>>> +	list_for_each_entry(node, &adev->sysfs_files_list, head)
>>> +		device_remove_file(adev->dev, node->attr);
>>> +	mutex_unlock(&adev->sysfs_files_list_lock);
>>> +}
>>> +
>>>   /**
>>>    * amdgpu_device_fini - tear down the driver
>>>    *
>>> @@ -3332,6 +3358,11 @@ void amdgpu_device_fini_early(struct amdgpu_device *adev)
>>>   	amdgpu_fbdev_fini(adev);
>>>   
>>>   	amdgpu_irq_fini_early(adev);
>>> +
>>> +	amdgpu_sysfs_remove_files(adev);
>>> +
>>> +	if (adev->ucode_sysfs_en)
>>> +		amdgpu_ucode_sysfs_fini(adev);
>>>   }
>>>   
>>>   void amdgpu_device_fini_late(struct amdgpu_device *adev)
>>> @@ -3366,10 +3397,6 @@ void amdgpu_device_fini_late(struct amdgpu_device *adev)
>>>   	adev->rmmio = NULL;
>>>   	amdgpu_device_doorbell_fini(adev);
>>>   
>>> -	if (adev->ucode_sysfs_en)
>>> -		amdgpu_ucode_sysfs_fini(adev);
>>> -
>>> -	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
>>>   	if (IS_ENABLED(CONFIG_PERF_EVENTS))
>>>   		amdgpu_pmu_fini(adev);
>>>   	if (amdgpu_discovery && adev->asic_type >= CHIP_NAVI10)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>>> index 6271044..e7b6c4a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>>> @@ -76,6 +76,9 @@ static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
>>>   static DEVICE_ATTR(mem_info_gtt_used, S_IRUGO,
>>>   	           amdgpu_mem_info_gtt_used_show, NULL);
>>>   
>>> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_gtt_total);
>>> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_gtt_used);
>>> +
>>>   /**
>>>    * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
>>>    *
>>> @@ -114,6 +117,11 @@ static int amdgpu_gtt_mgr_init(struct ttm_mem_type_manager *man,
>>>   		return ret;
>>>   	}
>>>   
>>> +	mutex_lock(&adev->sysfs_files_list_lock);
>>> +	list_add_tail(&dev_attr_handle_mem_info_gtt_total.head, &adev->sysfs_files_list);
>>> +	list_add_tail(&dev_attr_handle_mem_info_gtt_used.head, &adev->sysfs_files_list);
>>> +	mutex_unlock(&adev->sysfs_files_list_lock);
>>> +
>>>   	return 0;
>>>   }
>>>   
>>> @@ -127,7 +135,6 @@ static int amdgpu_gtt_mgr_init(struct ttm_mem_type_manager *man,
>>>    */
>>>   static int amdgpu_gtt_mgr_fini(struct ttm_mem_type_manager *man)
>>>   {
>>> -	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
>>>   	struct amdgpu_gtt_mgr *mgr = man->priv;
>>>   	spin_lock(&mgr->lock);
>>>   	drm_mm_takedown(&mgr->mm);
>>> @@ -135,9 +142,6 @@ static int amdgpu_gtt_mgr_fini(struct ttm_mem_type_manager *man)
>>>   	kfree(mgr);
>>>   	man->priv = NULL;
>>>   
>>> -	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_total);
>>> -	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_used);
>>> -
>>>   	return 0;
>>>   }
>>>   
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>>> index ddb4af0c..554fec0 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>>> @@ -2216,6 +2216,8 @@ static DEVICE_ATTR(usbc_pd_fw, S_IRUGO | S_IWUSR,
>>>   		   psp_usbc_pd_fw_sysfs_read,
>>>   		   psp_usbc_pd_fw_sysfs_write);
>>>   
>>> +static AMDGPU_DEVICE_ATTR_LIST_NODE(usbc_pd_fw);
>>> +
>>>   
>>>   
>>>   const struct amd_ip_funcs psp_ip_funcs = {
>>> @@ -2242,13 +2244,17 @@ static int psp_sysfs_init(struct amdgpu_device *adev)
>>>   
>>>   	if (ret)
>>>   		DRM_ERROR("Failed to create USBC PD FW control file!");
>>> +	else {
>>> +		mutex_lock(&adev->sysfs_files_list_lock);
>>> +		list_add_tail(&dev_attr_handle_usbc_pd_fw.head, &adev->sysfs_files_list);
>>> +		mutex_unlock(&adev->sysfs_files_list_lock);
>>> +	}
>>>   
>>>   	return ret;
>>>   }
>>>   
>>>   static void psp_sysfs_fini(struct amdgpu_device *adev)
>>>   {
>>> -	device_remove_file(adev->dev, &dev_attr_usbc_pd_fw);
>>>   }
>>>   
>>>   const struct amdgpu_ip_block_version psp_v3_1_ip_block =
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> index 7723937..39c400c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> @@ -148,6 +148,12 @@ static DEVICE_ATTR(mem_info_vis_vram_used, S_IRUGO,
>>>   static DEVICE_ATTR(mem_info_vram_vendor, S_IRUGO,
>>>   		   amdgpu_mem_info_vram_vendor, NULL);
>>>   
>>> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vram_total);
>>> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vis_vram_total);
>>> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vram_used);
>>> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vis_vram_used);
>>> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vram_vendor);
> Converting all of these individual attributes to an attribute group
> would be a nice thing to do anyway.  Makes your logic much simpler and
> less error-prone.
>
> But again, the driver core should do all of the device file removal
> stuff automatically for you when your PCI device is removed from the
> system _UNLESS_ you are doing crazy things like creating child devices
> or messing with raw kobjects or other horrible things that I haven't
> read the code to see if you are, but hopefully not :)
>
> thanks,
>
> greg k-h

--------------A50175EEBC64120E5BF0EFD8
Content-Type: text/x-log;
 name="sysfs_oops-1.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="sysfs_oops-1.log"

[  925.738225 <    0.188086>] BUG: kernel NULL pointer dereference, address: 0000000000000090
[  925.738232 <    0.000007>] #PF: supervisor read access in kernel mode
[  925.738236 <    0.000004>] #PF: error_code(0x0000) - not-present page
[  925.738240 <    0.000004>] PGD 0 P4D 0 
[  925.738245 <    0.000005>] Oops: 0000 [#1] SMP PTI
[  925.738249 <    0.000004>] CPU: 7 PID: 2547 Comm: amdgpu_test Tainted: G        W  OE     5.5.0-rc7-dev-kfd+ #50
[  925.738256 <    0.000007>] Hardware name: System manufacturer System Product Name/RAMPAGE IV FORMULA, BIOS 4804 12/30/2013
[  925.738266 <    0.000010>] RIP: 0010:kernfs_find_ns+0x18/0x110
[  925.738270 <    0.000004>] Code: a6 cf ff 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 90 41 57 41 56 49 89 f6 41 55 41 54 49 89 fd 55 53 49 89 d4 <0f> b7 af 90 00 00 00 8b 05 8f ee 6b 01 48 8b 5f 68 66 83 e5 20 41
[  925.738282 <    0.000012>] RSP: 0018:ffffad6d0118fb00 EFLAGS: 00010246
[  925.738287 <    0.000005>] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 2098a12076864b7e
[  925.738292 <    0.000005>] RDX: 0000000000000000 RSI: ffffffffb6606b31 RDI: 0000000000000000
[  925.738297 <    0.000005>] RBP: ffffffffb6606b31 R08: ffffffffb5379d10 R09: 0000000000000000
[  925.738302 <    0.000005>] R10: ffffad6d0118fb38 R11: ffff9a75f64820a8 R12: 0000000000000000
[  925.738307 <    0.000005>] R13: 0000000000000000 R14: ffffffffb6606b31 R15: ffff9a7612b06130
[  925.738313 <    0.000006>] FS:  00007f3eca4e8700(0000) GS:ffff9a763dbc0000(0000) knlGS:0000000000000000
[  925.738319 <    0.000006>] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  925.738323 <    0.000004>] CR2: 0000000000000090 CR3: 0000000035e5a005 CR4: 00000000000606e0
[  925.738329 <    0.000006>] Call Trace:
[  925.738334 <    0.000005>]  kernfs_find_and_get_ns+0x2e/0x50
[  925.738339 <    0.000005>]  sysfs_remove_group+0x25/0x80
[  925.738344 <    0.000005>]  sysfs_remove_groups+0x29/0x40
[  925.738350 <    0.000006>]  free_msi_irqs+0xf5/0x190
[  925.738354 <    0.000004>]  pci_disable_msi+0xe9/0x120
[  925.738406 <    0.000052>]  amdgpu_irq_fini+0xe3/0xf0 [amdgpu]
[  925.738453 <    0.000047>]  tonga_ih_sw_fini+0xe/0x30 [amdgpu]
[  925.738490 <    0.000037>]  amdgpu_device_fini_late+0x14b/0x440 [amdgpu]
[  925.738529 <    0.000039>]  amdgpu_driver_release_kms+0x16/0x40 [amdgpu]
[  925.738548 <    0.000019>]  drm_dev_put+0x5b/0x80 [drm]
[  925.738558 <    0.000010>]  drm_release+0xc6/0xd0 [drm]
[  925.738563 <    0.000005>]  __fput+0xc6/0x260
[  925.738568 <    0.000005>]  task_work_run+0x79/0xb0
[  925.738573 <    0.000005>]  do_exit+0x3d0/0xc60
[  925.738578 <    0.000005>]  do_group_exit+0x47/0xb0
[  925.738583 <    0.000005>]  get_signal+0x18b/0xc30
[  925.738589 <    0.000006>]  do_signal+0x36/0x6a0
[  925.738593 <    0.000004>]  ? force_sig_info_to_task+0xbc/0xd0
[  925.738597 <    0.000004>]  ? signal_wake_up_state+0x15/0x30
[  925.738603 <    0.000006>]  exit_to_usermode_loop+0x6f/0xc0
[  925.738608 <    0.000005>]  prepare_exit_to_usermode+0xc7/0x110
[  925.738613 <    0.000005>]  ret_from_intr+0x25/0x35
[  925.738617 <    0.000004>] RIP: 0033:0x417369
[  925.738621 <    0.000004>] Code: Bad RIP value.
[  925.738625 <    0.000004>] RSP: 002b:00007ffdd6bf0900 EFLAGS: 00010246
[  925.738629 <    0.000004>] RAX: 00007f3eca509000 RBX: 000000000000001e RCX: 00007f3ec95ba260
[  925.738634 <    0.000005>] RDX: 00007f3ec9889790 RSI: 000000000000000a RDI: 0000000000000000
[  925.738639 <    0.000005>] RBP: 00007ffdd6bf0990 R08: 00007f3ec9889780 R09: 00007f3eca4e8700
[  925.738645 <    0.000006>] R10: 000000000000035c R11: 0000000000000246 R12: 00000000021c6170
[  925.738650 <    0.000005>] R13: 00007ffdd6bf0c00 R14: 0000000000000000 R15: 0000000000000000




[   40.880899 <    0.000004>] BUG: kernel NULL pointer dereference, address: 0000000000000090
[   40.880906 <    0.000007>] #PF: supervisor read access in kernel mode
[   40.880910 <    0.000004>] #PF: error_code(0x0000) - not-present page
[   40.880915 <    0.000005>] PGD 0 P4D 0 
[   40.880920 <    0.000005>] Oops: 0000 [#1] SMP PTI
[   40.880924 <    0.000004>] CPU: 1 PID: 2526 Comm: amdgpu_test Tainted: G        W  OE     5.5.0-rc7-dev-kfd+ #50
[   40.880932 <    0.000008>] Hardware name: System manufacturer System Product Name/RAMPAGE IV FORMULA, BIOS 4804 12/30/2013
[   40.880941 <    0.000009>] RIP: 0010:kernfs_find_ns+0x18/0x110
[   40.880945 <    0.000004>] Code: a6 cf ff 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 90 41 57 41 56 49 89 f6 41 55 41 54 49 89 fd 55 53 49 89 d4 <0f> b7 af 90 00 00 00 8b 05 8f ee 6b 01 48 8b 5f 68 66 83 e5 20 41
[   40.880957 <    0.000012>] RSP: 0018:ffffaf3380467ba8 EFLAGS: 00010246
[   40.880963 <    0.000006>] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 2098a12076864b7e
[   40.880968 <    0.000005>] RDX: 0000000000000000 RSI: ffffffffc0678cfc RDI: 0000000000000000
[   40.880973 <    0.000005>] RBP: ffffffffc0678cfc R08: ffffffffaa379d10 R09: 0000000000000000
[   40.880979 <    0.000006>] R10: ffffaf3380467be0 R11: ffff93547615d128 R12: 0000000000000000
[   40.880984 <    0.000005>] R13: 0000000000000000 R14: ffffffffc0678cfc R15: ffff93549be86130
[   40.880990 <    0.000006>] FS:  00007fd9ecb10700(0000) GS:ffff9354bd840000(0000) knlGS:0000000000000000
[   40.880996 <    0.000006>] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   40.881001 <    0.000005>] CR2: 0000000000000090 CR3: 0000000072866001 CR4: 00000000000606e0
[   40.881006 <    0.000005>] Call Trace:
[   40.881011 <    0.000005>]  kernfs_find_and_get_ns+0x2e/0x50
[   40.881016 <    0.000005>]  sysfs_remove_group+0x25/0x80
[   40.881055 <    0.000039>]  amdgpu_device_fini_late+0x3eb/0x440 [amdgpu]
[   40.881095 <    0.000040>]  amdgpu_driver_release_kms+0x16/0x40 [amdgpu]
[   40.881109 <    0.000014>]  drm_dev_put+0x5b/0x80 [drm]
[   40.881119 <    0.000010>]  drm_release+0xc6/0xd0 [drm]
[   40.881124 <    0.000005>]  __fput+0xc6/0x260
[   40.881129 <    0.000005>]  task_work_run+0x79/0xb0
[   40.881134 <    0.000005>]  do_exit+0x3d0/0xc60
[   40.881138 <    0.000004>]  do_group_exit+0x47/0xb0
[   40.881143 <    0.000005>]  get_signal+0x18b/0xc30
[   40.881149 <    0.000006>]  do_signal+0x36/0x6a0
[   40.881153 <    0.000004>]  ? force_sig_info_to_task+0xbc/0xd0
[   40.881158 <    0.000005>]  ? signal_wake_up_state+0x15/0x30
[   40.881164 <    0.000006>]  exit_to_usermode_loop+0x6f/0xc0
[   40.881170 <    0.000006>]  prepare_exit_to_usermode+0xc7/0x110
[   40.881176 <    0.000006>]  ret_from_intr+0x25/0x35
[   40.881181 <    0.000005>] RIP: 0033:0x417369
[   40.881185 <    0.000004>] Code: Bad RIP value.
[   40.881188 <    0.000003>] RSP: 002b:00007ffd6a742f90 EFLAGS: 00010246
[   40.881193 <    0.000005>] RAX: 00007fd9ecb31000 RBX: 000000000000001e RCX: 00007fd9ebbe2260
[   40.881199 <    0.000006>] RDX: 00007fd9ebeb1790 RSI: 000000000000000a RDI: 0000000000000000
[   40.881204 <    0.000005>] RBP: 00007ffd6a743020 R08: 00007fd9ebeb1780 R09: 00007fd9ecb10700
[   40.881210 <    0.000006>] R10: 000000000000035c R11: 0000000000000246 R12: 00000000023e0170
[   40.881215 <    0.000005>] R13: 00007ffd6a743290 R14: 0000000000000000 R15: 0000000000000000



--------------A50175EEBC64120E5BF0EFD8
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------A50175EEBC64120E5BF0EFD8--
