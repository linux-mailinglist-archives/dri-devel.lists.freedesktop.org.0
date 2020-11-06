Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801442A8E01
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 05:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E816EDF8;
	Fri,  6 Nov 2020 04:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346736EDF8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 04:02:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIvbuyJs9Gry96FYi7krHXWPBosTXFnlxUmavG2G/hOwg/vvEqyTLMWVQSC3KwrxL++ulO4HamR6JERm38kGuxMvSh//erJdHlaygsesFPaM1FHFnjll42vDrX7UBL5farcysu/mGUiq9/Dyaik4kDCFySfHUPfVcqac3VDPgc/TNEYY5uRa5XiU+BEkCwNhyZjCoWhJV0XiAcyOCRah0vfUt1bClWQHoFME6qeosSmeuCiMpfjCocMJBUJHMUJLZMgDs/VIQzCHP9EeErSbOlaJEvFNwdNKQSFIIBv3FFOpQ7USjzYHmH5HEKxOrrU0Gvh3k9W3/0JO3xJ+L0A2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8bqCw5Ef5neW+RGX9yGhJJABhkfzHhO5JsMVFwqaAw=;
 b=hbH4t3xZgO9TqlYDTZCAYjr9nTs9mqZog1tUtjMEV2UtBrpFeZyze2Ov5mD+T/Y1DEyY/nDGRCWRNSN9uPwuxIWZXkAw+YFTxHfEEZAM9Idm04JIESjfQ7RtaznYLGVugvbe6S3JQXnVZMD1yiEzUQ+SJLi3qH9uwZ7F0KvScrkKNKKVgLhGkFH1fkCLF12xeClbaejvJBOTgK5eDsBM7fLKs9EaYn4/Fvkd6yI67pevAPXRLcioKi7h2ADsZ5//aM3vme08W2HhZdQYJF0+khpNTW0TsuubV4g1xn8xabbeewxTBJFrWFON1y0rkMoWaBofi059DAURKy8yLI9UTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8bqCw5Ef5neW+RGX9yGhJJABhkfzHhO5JsMVFwqaAw=;
 b=i1QhnRnnMjXyqs3ZN437H6F6k46bbBm+I+crIs74xIzGy4U1vzIjikf/wt+rwkagwWZcGA+sgbkc175MlONDrUI1Ot2QH8nHTflKgvRe/hGVdfzrrbsTuw24h3xPAkP/K5nCk28v4T6B6Bt389ulKQ7T3OyYUS/LdM8ZPohnr5I=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4058.namprd12.prod.outlook.com (2603:10b6:5:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 04:02:35 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067%7]) with mapi id 15.20.3541.021; Fri, 6 Nov 2020
 04:02:35 +0000
Subject: Re: [PATCH 6/6] drm/amdgpu: Make struct drm_driver const
To: Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201104100425.1922351-1-daniel.vetter@ffwll.ch>
 <20201104100425.1922351-6-daniel.vetter@ffwll.ch>
 <20201105153606.GZ401619@phenom.ffwll.local>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <04235a50-1513-5e2a-2813-3d22d6c554b0@amd.com>
Date: Thu, 5 Nov 2020 23:02:33 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201105153606.GZ401619@phenom.ffwll.local>
Content-Language: en-CA
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::27) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.18.65] (165.204.54.211) by
 YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Fri, 6 Nov 2020 04:02:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0335e9b4-ec94-4729-6c65-08d88208cb22
X-MS-TrafficTypeDiagnostic: DM6PR12MB4058:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4058DB4C0292DD5D3C26E6BF99ED0@DM6PR12MB4058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aQ5uK90HNNfexe516ioChLZse+zJivFhQDX/pqfv7sQIR8Lb6MgyNCQw8DZ4x0qGPUAkB5CQiBjobXealiHDpZII5OZCDKnH8ptnwS5Pf4SOaQ8028IwpkwDU5QAtj0gk6gstZLwdG0pJAZSrH6YXUv4JjMT58Ox0t0vsA0El9BIx9CbsBIR7NONdcxqT4AQq/InnGfXeAIGxY6PCuBwTdd7XvkWJS3vt0c0ISah0oMyVzfO9f91iS05D78uRbn9pfZArgdyJdjNtD423kaLQgE/6M9NmqBQsu48cqyzj8ZrskpHA3Sl31jG9cL5FNFtXLmttmkMccbwffsG77gBiAMI4enEQjMDqoCwcygSoJOPhPFLuMgbuVWa1guCuEaP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(31686004)(8676002)(5660300002)(478600001)(6486002)(36756003)(83380400001)(186003)(44832011)(52116002)(31696002)(8936002)(316002)(110136005)(16576012)(16526019)(2906002)(53546011)(4326008)(956004)(66476007)(86362001)(66946007)(26005)(66556008)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: XX8nlbmwpGVys1FvRTD75uU9Ht/AK5wD325DtRpdTSpvMud/V/9G8O9rOXZySG4UlFC/V85dZzeLUlIT6yQwthP5pkz1Sp6emhQNdHeGXdaVgE52LzgncnpySuQ8CJBv+YLjSIl8y1ILVkok3R2oRyCfq5aaJUyengGqiZcV7h/w6AKV47eGc3wxb2bRtCuHr9umDMvXVL/HwAIUVj+vNfU3TYLS1rbFhjWCJlbsL9ZR9UZXKUsY0uJ1NZoUQHV0srtxCEBJMtkQQwhy0cUPobbfq5wXNNht3PVbq9VUjbIriUcyCvxPjPJPqcidyex7oy+tCDjaJJAyujuyQKTZ9+f1VJkbKZtwD79WAk/ouDYQAMSr5vHWqgfl2noDqvp7mOP2kEAxQT+J+vTkSq4/x91NcNlAUFxcVMGhdLAHmNCzvscTH+4P1TmYJQR0dBr/9IgAMzr2ddCO0laQwblnzC7cIPYkc6/kOg78UkvQ5HGsu77ZJ3L902ObeXdUYi2tkX7XE9Bx2z5yY++eEWYb0v1I+YP0L9QcLI559/1HwA323aUreNmtvRvkyPnMi5aU6+qe6vX7dghxwgrD5XjaI3ONLuvMkHMw4ptvM4xaaPlloIhiPhmbaI5iAvtk07InaRPerjFNKw2T9tJlXHgcFA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0335e9b4-ec94-4729-6c65-08d88208cb22
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 04:02:35.5553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Jxmpsalr4tfQNytRnNEX5+9zq6OTqGLB0gVi0FjdZZEBHCx8OZyVm5kzAy99bZB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4058
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-05 10:36, Daniel Vetter wrote:
> On Wed, Nov 04, 2020 at 11:04:25AM +0100, Daniel Vetter wrote:
>> From: Luben Tuikov <luben.tuikov@amd.com>
>>
>> Make the definition of struct drm_driver
>> a constant, to follow the latest developments
>> in the DRM layer.
>>
>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>> [danvet: Rebase onto devm_drm_dev_alloc patch and drop the freesync
>> ioctl line again that escaped from internal trees.]
>> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Entire series merged to drm-misc-next, with an irc ack from Alex for this
> one here. Thanks everyone who helped out with patches and reviews!
> -Daniel

Great! Thanks.

Regards,
Luben

> 
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 31 +++++++++++++++++++++----
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 24 +------------------
>>  2 files changed, 28 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 8b30915aa972..d6fced7a9a03 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -40,6 +40,7 @@
>>  #include "amdgpu.h"
>>  #include "amdgpu_irq.h"
>>  #include "amdgpu_dma_buf.h"
>> +#include "amdgpu_sched.h"
>>  
>>  #include "amdgpu_amdkfd.h"
>>  
>> @@ -1094,7 +1095,7 @@ static const struct pci_device_id pciidlist[] = {
>>  
>>  MODULE_DEVICE_TABLE(pci, pciidlist);
>>  
>> -static struct drm_driver kms_driver;
>> +static const struct drm_driver amdgpu_kms_driver;
>>  
>>  static int amdgpu_pci_probe(struct pci_dev *pdev,
>>  			    const struct pci_device_id *ent)
>> @@ -1165,7 +1166,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>  	if (ret)
>>  		return ret;
>>  
>> -	adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
>> +	adev = devm_drm_dev_alloc(&pdev->dev, &amdgpu_kms_driver, typeof(*adev), ddev);
>>  	if (IS_ERR(adev))
>>  		return PTR_ERR(adev);
>>  
>> @@ -1509,7 +1510,29 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
>>  	return 0;
>>  }
>>  
>> -static struct drm_driver kms_driver = {
>> +int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
>> +
>> +const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_VM, amdgpu_vm_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_SCHED, amdgpu_sched_ioctl, DRM_MASTER),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_BO_LIST, amdgpu_bo_list_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_FENCE_TO_HANDLE, amdgpu_cs_fence_to_handle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	/* KMS */
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_MMAP, amdgpu_gem_mmap_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_WAIT_IDLE, amdgpu_gem_wait_idle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_CS, amdgpu_cs_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_INFO, amdgpu_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_CS, amdgpu_cs_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_FENCES, amdgpu_cs_wait_fences_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_METADATA, amdgpu_gem_metadata_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> +};
>> +
>> +static const struct drm_driver amdgpu_kms_driver = {
>>  	.driver_features =
>>  	    DRIVER_ATOMIC |
>>  	    DRIVER_GEM |
>> @@ -1520,6 +1543,7 @@ static struct drm_driver kms_driver = {
>>  	.lastclose = amdgpu_driver_lastclose_kms,
>>  	.irq_handler = amdgpu_irq_handler,
>>  	.ioctls = amdgpu_ioctls_kms,
>> +	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
>>  	.dumb_create = amdgpu_mode_dumb_create,
>>  	.dumb_map_offset = amdgpu_mode_dumb_mmap,
>>  	.fops = &amdgpu_driver_kms_fops,
>> @@ -1572,7 +1596,6 @@ static int __init amdgpu_init(void)
>>  		goto error_fence;
>>  
>>  	DRM_INFO("amdgpu kernel modesetting enabled.\n");
>> -	kms_driver.num_ioctls = amdgpu_max_kms_ioctl;
>>  	amdgpu_register_atpx_handler();
>>  
>>  	/* Ignore KFD init failures. Normal when CONFIG_HSA_AMD is not set. */
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> index efda38349a03..ab6d9f1186c2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> @@ -29,7 +29,6 @@
>>  #include "amdgpu.h"
>>  #include <drm/drm_debugfs.h>
>>  #include <drm/amdgpu_drm.h>
>> -#include "amdgpu_sched.h"
>>  #include "amdgpu_uvd.h"
>>  #include "amdgpu_vce.h"
>>  #include "atom.h"
>> @@ -480,7 +479,7 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
>>   * etc. (all asics).
>>   * Returns 0 on success, -EINVAL on failure.
>>   */
>> -static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>> +int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>>  {
>>  	struct amdgpu_device *adev = drm_to_adev(dev);
>>  	struct drm_amdgpu_info *info = data;
>> @@ -1243,27 +1242,6 @@ void amdgpu_disable_vblank_kms(struct drm_crtc *crtc)
>>  	amdgpu_irq_put(adev, &adev->crtc_irq, idx);
>>  }
>>  
>> -const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_VM, amdgpu_vm_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_SCHED, amdgpu_sched_ioctl, DRM_MASTER),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_BO_LIST, amdgpu_bo_list_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_FENCE_TO_HANDLE, amdgpu_cs_fence_to_handle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	/* KMS */
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_MMAP, amdgpu_gem_mmap_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_WAIT_IDLE, amdgpu_gem_wait_idle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_CS, amdgpu_cs_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_INFO, amdgpu_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_CS, amdgpu_cs_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_FENCES, amdgpu_cs_wait_fences_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_METADATA, amdgpu_gem_metadata_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW)
>> -};
>> -const int amdgpu_max_kms_ioctl = ARRAY_SIZE(amdgpu_ioctls_kms);
>> -
>>  /*
>>   * Debugfs info
>>   */
>> -- 
>> 2.28.0
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
