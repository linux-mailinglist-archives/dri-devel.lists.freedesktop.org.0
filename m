Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1102ADD2C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 18:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F9789B65;
	Tue, 10 Nov 2020 17:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CB289B3B;
 Tue, 10 Nov 2020 17:41:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOuIHhYAPI3w+0AY0H1EEZ450LFRxOJs5ZC1kqohrJlsnsGBre3XScTZ5G75X5MQFTUj0QKOBCCrUdJWd7+SQwe1MXNdozqksM0QKrR+lvad2fJ+h09VY4MLQHcaXSqwzfF3cG2jALrmMjWElZYTlRkEF1/WFKl3BfWXbfTTqqFdEM4n+RBaymiDnVLpNsQ9gy0wZu57nZkh93Bqovxm6Bx/7pnxDe5MZbnxQ1fkRcIMjtgi0qxmIvo9iQmtUmgo4R9GHLnmGxLPhkWiSu4rv2vR/Woz4N7pi/i7ALUcl/ZEETD1DhEMXiSdtMYrsJAkzquwXYaDg7v+A9Z5+Ki/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F1hKMpQL+IeG5jgc0oQkVkgHLzgDNSIQvUULmDcRcA=;
 b=ng4hmtvVe0PLrQEhJ/jTrPshpEoF7ij0I5/KQlwV/Cw0YyvM0Vt8TtIri/Cb01+FKBqTH/P2E5Iw/kabWlNHZPlro5F6jxaFWULtVUbcaVMpN3jUsOyxHRli8DBq7CMtNrPyYPonjFpqU/zjR0S3Zhv73PON01GqRT9tJMDj30h/1GMSyjDhntywKFnb1JB1MfGLDbC/eVaO0ZsplO4kw1Yh5NgotbJSc3AyQmnWZ6ja2Kd9VI7H+To8Gk4Sa4T6OhZ/ZEf2eZOUrtaxT8Xy9q/lprK0G3GhYbh4R7Ub1AaNI4uhHx95gRmNnrNz0SD3LYxx8r3ApchZc3VtZOcUSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F1hKMpQL+IeG5jgc0oQkVkgHLzgDNSIQvUULmDcRcA=;
 b=vLTjBjFh/tudIbqkl67smG2JfFs8QqrvW7OkwMK2m4PdfBjhfOM5F/WgZmjw8C4siwuMsBX2aHUsH08sAr5UL5tq7dLcPH1eyfUBHkgNGQ9SIsjJIPTIGCCmPbQTqJ+8eBbc2F3C8eL8yXRE4KjKlKXgK86HRQEQMn9XnKl2JKs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB2939.namprd12.prod.outlook.com (2603:10b6:5:18b::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.29; Tue, 10 Nov 2020 17:41:52 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3541.021; Tue, 10 Nov 2020
 17:41:51 +0000
Subject: Re: [PATCH v2 2/8] drm/ttm: Remap all page faults to per process
 dummy page.
To: Daniel Vetter <daniel@ffwll.ch>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-3-git-send-email-andrey.grodzovsky@amd.com>
 <20200622094103.GA20149@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <0dccaf3d-8696-4368-26d2-8127a1314a34@amd.com>
Date: Tue, 10 Nov 2020 12:41:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200622094103.GA20149@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:757a:f239:6b01:6396]
X-ClientProxiedBy: YT1PR01CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::24) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:757a:f239:6b01:6396]
 (2607:fea8:3edf:49b0:757a:f239:6b01:6396) by
 YT1PR01CA0145.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 17:41:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 20f0e2fb-19c2-401a-d59c-08d8859fe81d
X-MS-TrafficTypeDiagnostic: DM6PR12MB2939:
X-Microsoft-Antispam-PRVS: <DM6PR12MB29399242223F72EE7AA6B8B3EAE90@DM6PR12MB2939.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqkiAj1/sgHkxTdNJ+H9o9kVlZzVivxQp3lfPBZ926CTFJaPyxOSLjOHUAnHROwDr/1mJD7Y3D/wceymMmOAPjKHJwJAWNag3JLpZNAdXWok9B3aiou8122OdmqScW9kIdaJgfJd4sUmnzh38EjXIH0l5IglBN7FnRKV1NZJXx8027jlw2mc2vS+ZASBeFOlyZW4HbXENWgOPUyccWRg9yDkD/lDcedCBXg6w9VPooqR9lrGVqYSxK9jdsjWdidjqVpYpkqVScV/E9YjylmSs+aDC2em0m7WcDDpOhjvwQrwoVZ8TFim58TdFAKAhe/aEdH6DiphFbqSH51tbCQiHncyRxP8mZBaib/as9jpiDbuFCRP6KtEeshdN21cNdll
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(316002)(66946007)(8936002)(5660300002)(66556008)(31686004)(36756003)(2616005)(66476007)(53546011)(186003)(52116002)(16526019)(6916009)(86362001)(83380400001)(8676002)(31696002)(4326008)(478600001)(2906002)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bWVyTExyVnJiOXVtSC9QaFdDbjlMNlMzOENsbDhXbjdZL3ViOGpVUkM1RHN2?=
 =?utf-8?B?SVFDdW1GbEh4OGZmQmh3dytDeEE2ODNORVQxbk9JNFZpblFYRTVlMTg0UDNl?=
 =?utf-8?B?TEIvTitVOEwyQ0hsYjg3TlZEcWZMRUVyUStzazJPTGV6RTlKSDhLcjdtRlRW?=
 =?utf-8?B?NTY0bTdoaC9yanlBSXJtZWZYbFFKcEZFOE5YcUdKQkYwRlJmWXhDM2dySlpi?=
 =?utf-8?B?VDljQkdGSFo0T1Qya1hTaHhNSUFuUXBWNWJKU0g3cFR3K2VOTkxkOFdXclI2?=
 =?utf-8?B?Lzlvc2tkeFhCWXRDaUJlZ1ljRzJJUUJPYnFkUjNGcGxwaENiNm01V1FkYjhB?=
 =?utf-8?B?SWwyNEFUZGZGcHpza1FLTnFCcFdwWTR3Q3BBVVlLcUtZTEdiMFVSbWc4Y0wx?=
 =?utf-8?B?TUtGWlB6Kzh0TVlna29HSTBpMTdEYXlNWTBrK28xWkRjT1pBQ0UvVUdjU2Nh?=
 =?utf-8?B?b2FIRjAyQkthZlNnc2M4cUtVeXk4OVp0VGlYYzU4UDV2ME1QSXJUWTJySkpC?=
 =?utf-8?B?NVIyMHJyTDI5WXdJTytYcGZ6Mkg4TXB0QWFmUnRpd0VkdytYbkRRSEFPOEpF?=
 =?utf-8?B?SUdBTU9lblNBUUh5elpFc0E5Y1J6cnJBb2lPY2RSNzkzL2pqQ2cxY1dKRW1U?=
 =?utf-8?B?eXp5TWl4Tk1jSks4ZFJwS2d3NngvZEw4NGpRNlAxMk92eVZRZ0VjSWl3OWZ6?=
 =?utf-8?B?MWhUYXVBTTBLUmx6UUdLaGpKWmIzWVN3ak0wSmhPc3ZES0JxbWlsWk16ejM2?=
 =?utf-8?B?QjY2VU5IWG9rUVZZbGJoMnhycEZrWFlCSXduT1JjblB6djVZcEZDWDVHdyt4?=
 =?utf-8?B?MHc1d2k3ZlE4NzZtT1dtb0FObEVTVjNyOFJ6SlRNZkg3Vlh1cnhaYXFnL3FW?=
 =?utf-8?B?bGtPYTlycjA1V3NFK2F4UW5NclBYNjZ0Z0xxeS9kVGJsbzJHcTJJNWRTQW1z?=
 =?utf-8?B?OE9WWGUxMjJqcWRlT2RZVldKUWZpZFA2T04yZFg4RDU0VW90OFpXYnB4Yy81?=
 =?utf-8?B?NTdJNS80cXpEZWMvMnJvOUdtWUtRSlBLS1NmbytyMGlsOTMwbHVuY0hsUTlF?=
 =?utf-8?B?eFdwdEIvMndLZXNrUXh6THZXN0ExL0RVZnRKMmVzVk9USU9MdmNDdUZGWFRG?=
 =?utf-8?B?MFZmQlRkQVo2MmYxRS92TUVsYTY5UjdZd3I5RERjYXh5UTF4RzgzWk9QOFRS?=
 =?utf-8?B?Vncyc3Y0djV0OWR1dWZLd0FtR2FSdE1IVExGYVBUYktIUWVWRGk0LzNLQm11?=
 =?utf-8?B?Qy93MDg0MlFGbklIaHRoSkJBRkFreHpyM0t4WlhaTk1iMGsyQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f0e2fb-19c2-401a-d59c-08d8859fe81d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 17:41:51.8725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/yfHNX0jBu/CDgGQRIsr6hYuoIHnNuIxs2vm0K2Ah9CPPkW51r+ho17iy46ozFajEqNNYrJ9mrxIlzrOrgtfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2939
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


On 6/22/20 5:41 AM, Daniel Vetter wrote:
> On Sun, Jun 21, 2020 at 02:03:02AM -0400, Andrey Grodzovsky wrote:
>> On device removal reroute all CPU mappings to dummy page per drm_file
>> instance or imported GEM object.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 65 ++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 57 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index 389128b..2f8bf5e 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -35,6 +35,8 @@
>>   #include <drm/ttm/ttm_bo_driver.h>
>>   #include <drm/ttm/ttm_placement.h>
>>   #include <drm/drm_vma_manager.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_file.h>
>>   #include <linux/mm.h>
>>   #include <linux/pfn_t.h>
>>   #include <linux/rbtree.h>
>> @@ -328,19 +330,66 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
> Hm I think diff and code flow look a bit bad now. What about renaming the
> current function to __ttm_bo_vm_fault and then having something like the
> below:
>
> ttm_bo_vm_fault(args) {
>
> 	if (drm_dev_enter()) {
> 		__ttm_bo_vm_fault(args);
> 		drm_dev_exit();
> 	} else  {
> 		drm_gem_insert_dummy_pfn();
> 	}
> }
>
> I think drm_gem_insert_dummy_pfn(); should be portable across drivers, so
> another nice point to try to unifiy drivers as much as possible.
> -Daniel
>
>>   	pgprot_t prot;
>>   	struct ttm_buffer_object *bo = vma->vm_private_data;
>>   	vm_fault_t ret;
>> +	int idx;
>> +	struct drm_device *ddev = bo->base.dev;
>>   
>> -	ret = ttm_bo_vm_reserve(bo, vmf);
>> -	if (ret)
>> -		return ret;
>> +	if (drm_dev_enter(ddev, &idx)) {
>> +		ret = ttm_bo_vm_reserve(bo, vmf);
>> +		if (ret)
>> +			goto exit;
>> +
>> +		prot = vma->vm_page_prot;
>>   
>> -	prot = vma->vm_page_prot;
>> -	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
>> -	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>> +		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
>> +		if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>> +			goto exit;
>> +
>> +		dma_resv_unlock(bo->base.resv);
>> +
>> +exit:
>> +		drm_dev_exit(idx);
>>   		return ret;
>> +	} else {
>>   
>> -	dma_resv_unlock(bo->base.resv);
>> +		struct drm_file *file = NULL;
>> +		struct page *dummy_page = NULL;
>> +		int handle;
>>   
>> -	return ret;
>> +		/* We are faulting on imported BO from dma_buf */
>> +		if (bo->base.dma_buf && bo->base.import_attach) {
>> +			dummy_page = bo->base.dummy_page;
>> +		/* We are faulting on non imported BO, find drm_file owning the BO*/
> Uh, we can't fish that out of the vma->vm_file pointer somehow? Or is that
> one all wrong? Doing this kind of list walk looks pretty horrible.
>
> If the vma doesn't have the right pointer I guess next option is that we
> store the drm_file page in gem_bo->dummy_page, and replace it on first
> export. But that's going to be tricky to track ...


For this one I hope to make all of this obsolete if Christian's suggestion from 
path 1/8 about mapping
global RO dummy page for read and COW on write will be possible to implement 
(testing
that indeed no memory usage explodes)

Andrey


>
>> +		} else {
>> +			struct drm_gem_object *gobj;
>> +
>> +			mutex_lock(&ddev->filelist_mutex);
>> +			list_for_each_entry(file, &ddev->filelist, lhead) {
>> +				spin_lock(&file->table_lock);
>> +				idr_for_each_entry(&file->object_idr, gobj, handle) {
>> +					if (gobj == &bo->base) {
>> +						dummy_page = file->dummy_page;
>> +						break;
>> +					}
>> +				}
>> +				spin_unlock(&file->table_lock);
>> +			}
>> +			mutex_unlock(&ddev->filelist_mutex);
>> +		}
>> +
>> +		if (dummy_page) {
>> +			/*
>> +			 * Let do_fault complete the PTE install e.t.c using vmf->page
>> +			 *
>> +			 * TODO - should i call free_page somewhere ?
> Nah, instead don't call get_page. The page will be around as long as
> there's a reference for the drm_file or gem_bo, which is longer than any
> mmap. Otherwise yes this would like really badly.
>
>> +			 */
>> +			get_page(dummy_page);
>> +			vmf->page = dummy_page;
>> +			return 0;
>> +		} else {
>> +			return VM_FAULT_SIGSEGV;
> Hm that would be a kernel bug, wouldn't it? WARN_ON() required here imo.
> -Daniel
>
>> +		}
>> +	}
>>   }
>>   EXPORT_SYMBOL(ttm_bo_vm_fault);
>>   
>> -- 
>> 2.7.4
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
