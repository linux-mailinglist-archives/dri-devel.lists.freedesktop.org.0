Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 290772AFD9E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 05:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0606E0E1;
	Thu, 12 Nov 2020 04:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49A66E0E1;
 Thu, 12 Nov 2020 04:19:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKPyadLp2K7b/74+vUTOAgpqLvloHOwypDx0BADGIMugYWT/xmfGdxYO06qkoiWE5h8VPtuOPzJuMM+GXBGQ6mxUTOTUANBAQF+oxp0QBfr6o3Iure8sPpPF8FsIcR8oTh1Wd7ghGMR97k+SsoN78ySI7E5AbsbICDW4DT90UYXyHYCyTpow1SgcwkNqdTnLEAEQyxwQ7zk5ASOVCsDzxVhDq31uTnivAWmWI+0lpxfDjccfsvuHj4hzkb2V7I/m/V/Qr/dqtXPwAHOuTMkG0v9ztKawCnmx/nmeb9nR0YmnZByiT1mKlilyQasG+MgAasmqqwBx84WJYmaUcZz2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixcz5nMHJUFBILaK9442fuMBF+NIHrycE5mpex721ls=;
 b=ku37OkZaeKennXXM7EMoFZx1Ciga9dtux9axgK0fLTTlltWVs4to1eEfESk8h48xcw3Q5QzwJCJtYDnKZnHd0APCpW4a2eHsJOaOCwqFSFNMgcKfPThh0GjeN0SZ8QW0kLxglPjKshtJdOlsAsHMrhuVDsiD5Mfgv6xBi6gCE69g/UdSMkjGtI/xylIMOOo4p6SHGSbxeOkmeALQOq7YlW5JEwCOvqYyTfPzL3EfQ8R0r65pNclqdBF5cEic82JY5bXf4YugZWimoIvWZ4zVaSdnxGFm2FBHvlBaKRIWaBIYy23MXXjnGVVtyMIfBjBrrKnfmolwA46nSGFBOq4w/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixcz5nMHJUFBILaK9442fuMBF+NIHrycE5mpex721ls=;
 b=zVoI3IeInN2MwsiaD7I1M49Ybc17QgcbGMQsGMFvd2hJ8t+/mqTM60CXy/qBuRG1jEAPSun/nJ5TvORBUZgk1ZJngr7z7HRarHuLwn9ylVAPc4+aMxpMglNBfGcLGQN7dxRTQEFhi0jjFKc4GjEYMDf8sg9Hos1zdwJdKoJuRkI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR1201MB0107.namprd12.prod.outlook.com (2603:10b6:4:55::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.25; Thu, 12 Nov 2020 04:19:07 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 04:19:07 +0000
Subject: Re: [PATCH v2 4/8] drm/amdgpu: Split amdgpu_device_fini into early
 and late
To: Daniel Vetter <daniel@ffwll.ch>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-5-git-send-email-andrey.grodzovsky@amd.com>
 <20200622094849.GD20149@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <c0c79eaf-8820-8def-d8ec-2aa79d6aaca6@amd.com>
Date: Wed, 11 Nov 2020 23:19:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200622094849.GD20149@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:31da:32c2:75c6:daf4]
X-ClientProxiedBy: YTXPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::27) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:31da:32c2:75c6:daf4]
 (2607:fea8:3edf:49b0:31da:32c2:75c6:daf4) by
 YTXPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 12 Nov 2020 04:19:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 38372cb2-ed7f-421c-81a7-08d886c218cf
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0107:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0107557727D216DCD02A74B9EAE70@DM5PR1201MB0107.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wn/+p1oW7ID2wXTYo9icO8zAB/8NESthC1JmMEC8IUrtejuqs5sq6uSo1dRkwsAnixkS08xThwmo8gO8F4FBBWpxjODltDiLBEnjjp2QArEZ6Eod1GvobByy4wZtjwLk54q/RKwP3R/NqlDMMDz8moR2xCdWKcyWjscv29sgx6GEwzbQOnWaLlKXs2coAc4+OwNfOnUao/6YeeAq8YtS8+no8frHHcF8IFTFGm6POAi9xjYeke3qMJ0tnpkhlWNSZVEBvsRufZ65miSExsaFoHFzZ6lS331rKWZuV0WrP5I9ixsbSHVOeAMpCuMPpEerNp+4XgY5LeSmwjwJam/MQ/avKhiuK74cOZWMX+nwmv/SvTTfhGbnSo+cc2LFbhUq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(316002)(186003)(4326008)(5660300002)(86362001)(31696002)(31686004)(53546011)(8936002)(6486002)(8676002)(2906002)(66946007)(16526019)(6916009)(66476007)(2616005)(52116002)(478600001)(36756003)(83380400001)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mk91bjhoZ1AzcFl1V3B4dThLQlNvVUkvMkdJVFF5SXNqcVpRWDZWYndkY0h2?=
 =?utf-8?B?T2U5eGMraEt0QWFtcEdnaS9RaFkrQkxsZTYwU0tFYlR5UTFCWEI4MU93YzFl?=
 =?utf-8?B?bitJRW1pNkp2eVVjaXRTUlZITHVyVklYYjFoU3NZYnJWSDZ4bldzYnZ3NVR3?=
 =?utf-8?B?ci82NFZNY1p6cTBtQnhkZVBiWGo3MEZPa1pRbGw5VjUzVlM5T3VNMzNYTlQy?=
 =?utf-8?B?bWRjV3AySVNFYlJXUEhJemdBeXBuTmZyY3E5UGhPMmppNWRiT0FkanRDRzVr?=
 =?utf-8?B?UlkxOEZmdGNQbHYrN2FPTEI5KzZ5eTdXODN3QS9rdVh6M0tIajg1Qlp4TlBy?=
 =?utf-8?B?Sk1uNGFURU05UnA1b1dBR09xQ2dtYXZqMldNTk11QWRHWTJyNUhiSVZJNFd5?=
 =?utf-8?B?MUk0S255WXgrZmE5eVVZT29jdjJOaUcyMkZCRUZON1FyT2toZy9OY2dFRzhn?=
 =?utf-8?B?M3FlY2FQSUtsZGROUTNkWFlLWmlVMzFXU05sc0RHcEdxNzNwamFqUWtxWkox?=
 =?utf-8?B?aitLWHhrV1NIWGhiSXlzTXhidmJCNE5YeitPdDRRNEFYNjZGU2h4cjdvamF0?=
 =?utf-8?B?dWU0ZUZTNEhZSmUvQkk0S25yVTl0VXh5T2JSbk1rcXJWbXNIQTdkTUVQaXZl?=
 =?utf-8?B?L0YvWm1wYlI0ZTJPZitNcjBCbDZxSFpFUEhEcVUwaGUxbHFDTzF6MHNiUjN4?=
 =?utf-8?B?enBHV1phOHVIOWtNV3hiNmJLYk5JazR0ajlON2YydDFDb1VBMFg2dktGVnhZ?=
 =?utf-8?B?Y091NkxZT3ZuSkQxZVJUdnJEb0hJcHBMdkxLTG0wbU1KbDNPaWhSRkRsMmZv?=
 =?utf-8?B?aTFRN01XenhUUC9lNU1vYmxnZlJGSjlTMit4Yzg5VnB0ODl1NWNlNXVtVWRa?=
 =?utf-8?B?MWxoYTVMdndBb1h6Zk1ReTRiVE1qbkFpbi92VkRsTllxdHp6SHBhN1BFaEQz?=
 =?utf-8?B?Z0hRK0oweWFDRDE0RFJZallYRmJYb1RSSmtoRVdvUGVrS1kyWURFY1hEVENP?=
 =?utf-8?B?UWpDTE9Ka1J1RHRrd2xrNTRHKzRRdUF4b2hiM3pTS0VJSnJVclZZMWVkS0t2?=
 =?utf-8?B?MW1zUkNSVFZ6MkdPQ1FCOXJXYmJvR3czQlNPWEVYTWpFaTl2ZTgyNklWTGJ1?=
 =?utf-8?B?WitjRWswSkthT3g3cGhJWUxBNHhDamJ0M3g1YVowQjVEZ2NRRW5YNWwrQVh0?=
 =?utf-8?B?MVRodkFhMTNZbnFSK1ZWc01zTjhrS0RwUHBSR1I4SlhFU01kWCt1bExrcWxm?=
 =?utf-8?B?dUpldm90MUQzbjcvSTNCalVqdkducmxBTDFPZ3FaQ2tmSVVDZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38372cb2-ed7f-421c-81a7-08d886c218cf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 04:19:07.2677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oO4VHxaryke4B49Z2ENGtMe7uSVCX8yUQEJPbNdV7CaSbnD3izrYed1MQQXrjLdaCsAUMKpS5iOKZOA4XtomOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0107
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/22/20 5:48 AM, Daniel Vetter wrote:
> On Sun, Jun 21, 2020 at 02:03:04AM -0400, Andrey Grodzovsky wrote:
>> Some of the stuff in amdgpu_device_fini such as HW interrupts
>> disable and pending fences finilization must be done right away on
>> pci_remove while most of the stuff which relates to finilizing and releasing
>> driver data structures can be kept until drm_driver.release hook is called, i.e.
>> when the last device reference is dropped.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Long term I think best if as much of this code is converted over to devm
> (for hw stuff) and drmm (for sw stuff and allocations). Doing this all
> manually is very error prone.
>
> I've started various such patches and others followed, but thus far only
> very simple drivers tackled. But it should be doable step by step at
> least, so you should have incremental benefits in code complexity right
> away I hope.
> -Daniel


Sure, I will definitely add this to my TODOs for after landing (hopefully) this 
patch set (after a few more iterations)
as indeed the required changes for using devm and drmm are non trivial and I prefer
to avoid diverging here into multiple directions at once.

Andrey


>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 +++++++++++----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ++----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 24 +++++++++++++++---------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h    |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 23 +++++++++++++++++------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    |  3 +++
>>   7 files changed, 54 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 2a806cb..604a681 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -1003,7 +1003,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>   		       struct drm_device *ddev,
>>   		       struct pci_dev *pdev,
>>   		       uint32_t flags);
>> -void amdgpu_device_fini(struct amdgpu_device *adev);
>> +void amdgpu_device_fini_early(struct amdgpu_device *adev);
>> +void amdgpu_device_fini_late(struct amdgpu_device *adev);
>> +
>>   int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
>>   
>>   void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
>> @@ -1188,6 +1190,8 @@ void amdgpu_driver_lastclose_kms(struct drm_device *dev);
>>   int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
>>   void amdgpu_driver_postclose_kms(struct drm_device *dev,
>>   				 struct drm_file *file_priv);
>> +void amdgpu_driver_release_kms(struct drm_device *dev);
>> +
>>   int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
>>   int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
>>   int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index cc41e8f..e7b9065 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2309,6 +2309,8 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
>>   {
>>   	int i, r;
>>   
>> +	//DRM_ERROR("adev 0x%llx", (long long unsigned int)adev);
>> +
>>   	amdgpu_ras_pre_fini(adev);
>>   
>>   	if (adev->gmc.xgmi.num_physical_nodes > 1)
>> @@ -3304,10 +3306,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>    * Tear down the driver info (all asics).
>>    * Called at driver shutdown.
>>    */
>> -void amdgpu_device_fini(struct amdgpu_device *adev)
>> +void amdgpu_device_fini_early(struct amdgpu_device *adev)
>>   {
>> -	int r;
>> -
>>   	DRM_INFO("amdgpu: finishing device.\n");
>>   	flush_delayed_work(&adev->delayed_init_work);
>>   	adev->shutdown = true;
>> @@ -3330,7 +3330,13 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
>>   	if (adev->pm_sysfs_en)
>>   		amdgpu_pm_sysfs_fini(adev);
>>   	amdgpu_fbdev_fini(adev);
>> -	r = amdgpu_device_ip_fini(adev);
>> +
>> +	amdgpu_irq_fini_early(adev);
>> +}
>> +
>> +void amdgpu_device_fini_late(struct amdgpu_device *adev)
>> +{
>> +	amdgpu_device_ip_fini(adev);
>>   	if (adev->firmware.gpu_info_fw) {
>>   		release_firmware(adev->firmware.gpu_info_fw);
>>   		adev->firmware.gpu_info_fw = NULL;
>> @@ -3368,6 +3374,7 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
>>   		amdgpu_pmu_fini(adev);
>>   	if (amdgpu_discovery && adev->asic_type >= CHIP_NAVI10)
>>   		amdgpu_discovery_fini(adev);
>> +
>>   }
>>   
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 9e5afa5..43592dc 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -1134,12 +1134,9 @@ amdgpu_pci_remove(struct pci_dev *pdev)
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
>>   	pci_set_drvdata(pdev, NULL);
>>   	drm_dev_put(dev);
>> @@ -1445,6 +1442,7 @@ static struct drm_driver kms_driver = {
>>   	.dumb_create = amdgpu_mode_dumb_create,
>>   	.dumb_map_offset = amdgpu_mode_dumb_mmap,
>>   	.fops = &amdgpu_driver_kms_fops,
>> +	.release = &amdgpu_driver_release_kms,
>>   
>>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> index 0cc4c67..1697655 100644
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
>> +		drm_irq_uninstall(adev->ddev);
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
>> -		drm_irq_uninstall(adev->ddev);
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
>> index c0b1904..9d0af22 100644
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
>> @@ -86,7 +87,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
>>   	amdgpu_unregister_gpu_instance(adev);
>>   
>>   	if (adev->rmmio == NULL)
>> -		goto done_free;
>> +		return;
>>   
>>   	if (adev->runpm) {
>>   		pm_runtime_get_sync(dev->dev);
>> @@ -95,11 +96,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
>>   
>>   	amdgpu_acpi_fini(adev);
>>   
>> -	amdgpu_device_fini(adev);
>> -
>> -done_free:
>> -	kfree(adev);
>> -	dev->dev_private = NULL;
>> +	amdgpu_device_fini_early(adev);
>>   }
>>   
>>   void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
>> @@ -1108,6 +1105,20 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
>>   	pm_runtime_put_autosuspend(dev->dev);
>>   }
>>   
>> +
>> +void amdgpu_driver_release_kms (struct drm_device *dev)
>> +{
>> +	struct amdgpu_device *adev = dev->dev_private;
>> +
>> +	amdgpu_device_fini_late(adev);
>> +
>> +	kfree(adev);
>> +	dev->dev_private = NULL;
>> +
>> +	drm_dev_fini(dev);
>> +	kfree(dev);
>> +}
>> +
>>   /*
>>    * VBlank related functions.
>>    */
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>> index 7348619..169c2239 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>> @@ -2056,9 +2056,12 @@ int amdgpu_ras_pre_fini(struct amdgpu_device *adev)
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
>> -- 
>> 2.7.4
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
