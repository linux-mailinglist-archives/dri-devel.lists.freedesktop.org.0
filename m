Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F60337A9CE
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBF66EA54;
	Tue, 11 May 2021 14:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770082.outbound.protection.outlook.com [40.107.77.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3662D6E432;
 Tue, 11 May 2021 14:44:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7Y10rab/sp4G/TQPy1F7SRMvk8g+8PvtzkGp9Ej7VOsSXyNfU7oIxgflh5AdukMWfI6Yn0MdyTRiVyUM/e/sf6eKk/nB0xmrc09Pq+UlBXNdDrO+9xQyyd7137MltBuU6bA5dRyfNHlQ0lv5KkGyKSQlfqKrhxGN8SJKovpTrMo0YfZ8xTkWWZEkEbDQdmz/L7LwOVmzZ+49KVhJeWsHLWuQdIU20DIHBx8SqDR+kY5uG3PsQUqvbnvo6ffkpy8JupqQzwJE4WthKyNrGgBPYX0fsoueUkv30J5wF7BcrU3IdVJFH8KGUV16jBFSyuXHrGNAU5AylXKbmjsKhT+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCI9deZayktKRRS+2BGIoi+lzJrd8kXzLp/9qZGNbjI=;
 b=IgXZDFywi19pCHYTBjgNzRi+TjM5dbf8+rjcfCTT6NtA2OhznZ5MjVsu/vSjhmqTNluDnDMLjZtgv1O+WRY1CRcPrM89ekPbwhU80anNng80XjVMaB1K+NJEtxKz5AvldKNv96aOSM0RxBvL2Hz9AiCmQQRfMPXavBeSzVv2Brw6H9jbddlblhZXPDNs76e9NIK31Jm/aALfoN3P1Z6NtSxt1yfEMGriVQKbbJYKKaBfYYtjeHNicHL5OBFEecBKIacFEnXFBCYqzMRJ7wAbsjvYShxGidBsA7nFrCxh5WqT3LQAWJYhGSaGVTm6czAX/oAkEju3EdIrqWBs/rrptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCI9deZayktKRRS+2BGIoi+lzJrd8kXzLp/9qZGNbjI=;
 b=XJsFuoW9Q9Nbd+paqXtIqMXb1cKmwVl+qA0tS474H5gOxI9XX8Jjsov7jLPxSTDXeviAzHqvp1niTHTUHTAubKB7YuqPVz9WVIPQ7O80rA/BXJpP8ZTw3r/H8oQSBGIhyUMh7a9fuZDH2iuP3Od6UXoB9bWkAPUYbyw/EvDFyHw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4765.namprd12.prod.outlook.com (2603:10b6:805:e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Tue, 11 May
 2021 14:44:38 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 14:44:38 +0000
Subject: Re: [PATCH v6 01/16] drm/ttm: Remap all page faults to per process
 dummy page.
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
 <20210510163625.407105-2-andrey.grodzovsky@amd.com>
 <e4bb49b1-393d-10aa-7e18-f445d7e71ef7@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <897f1ca4-9e78-1136-961e-18e6c2cbab50@amd.com>
Date: Tue, 11 May 2021 10:44:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <e4bb49b1-393d-10aa-7e18-f445d7e71ef7@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YTOPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::37) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YTOPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Tue, 11 May 2021 14:44:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c18ffd6-b6e0-495c-d44e-08d9148b4d44
X-MS-TrafficTypeDiagnostic: SN6PR12MB4765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4765CC9B2CAF6C2F6EDF0258EA539@SN6PR12MB4765.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFEVGxLP+nKxV5SHhCcaxgPRdn5/hLLAXl572o+ImeowvNokItdRTqC8N6BJskO35I6fZxWMyOT97LHfuSRn6njs4ZlSSidAHUWSHnyEIc6CaTE7ZxNrQrI/hn0LceMMsqewBoAkZIbVtDfMbvV1VawzTOZv0gUV5mNSfzyernCfBTPTCCRY999S5to7fMjMoPquRXz3cdZytrb8MLF6b8uCgA7pGDJOUlwbhbRFX6dkE+524baVbPY6c5qM1tNIA1GDGHs5Tlbp+iavs2OV5Bo4SjsBtjv909iuzh1/rFvltm/04DSWLn7Wn6GnRzNRYx5I8RScaiqLcXIxBnLBY+MWTmp8mLj0bt2huvMB29FvPX2c+0qFOSBegG70ZstBLX82YnnEUMCekVoDXsZTkQPzOE68OUKrG0ytxLQZVOuZYPZq6GQfnkgIMvxhFzZ4ID2SUpkdd/TO7DibcGbY/cB6DCE5o8FtMyFkIA4avELMAv4M7/hQdajgF9S2Q+4vRCcNN2F8SbcjhZ1bi8rb+WELm6FTJ0UW7VQdn0XdGXoAzcKxKur6WEIB0XrWJhXGktahrJUcCjtdxI6hB5wSL4hj7SCHi4eg3UiAscGg8pzP221ywsyDMCzlprq7JuavIjfzIkG0ZVaygOFXujqHL2hSXRHA7CnnkEbdheXHPeFSZ+OmgYcc5axJ/G/O7r5c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(31696002)(66574015)(66556008)(44832011)(2906002)(6486002)(186003)(36756003)(83380400001)(8676002)(8936002)(66476007)(2616005)(6636002)(38100700002)(53546011)(16526019)(86362001)(316002)(4326008)(478600001)(66946007)(5660300002)(31686004)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qlk1NjEyU25qdW9ocWltU0pUaW1SUWhIbDlaY3d1Sjk5YTl3VjNWbE9uM25y?=
 =?utf-8?B?dTZ1dDNEbVFqbWRZM3R4QWFlem0yY1dUR21JMHk4ZWQwMS96TnU5b0hoa0dC?=
 =?utf-8?B?ZXUvSTVqZjNUNkQvWmxKR3dXbTdIU0xoRzBBU05rcndzUUNNNnEwVi9HOTFl?=
 =?utf-8?B?TFgyc1VLK3RXNTZxTzQ5cnFiemxJSzJRYU1nTng4cytqTWYzaXlFL0N3NmY3?=
 =?utf-8?B?bzhaTGJVYndyNCtRMENweEhVblJkeWVWRkIzOVR3OUlSclNERkU3Z0trWlpL?=
 =?utf-8?B?K25ZbXhlbS9Pd1djSHJWRnd1UnhacUVSSlh3R1BIWmQrMWpCRm96QlY4OFNr?=
 =?utf-8?B?VEpKM1Aza1Nxc2s4bmdxWnBMcnhJUWw0UzhucWg1cWZreDc2RWs0VUZtbDNI?=
 =?utf-8?B?NFhvU082TFNsOHpXRGtVYUhDcUdTY25mTmRRREtBUzZ5Wm1FTlgxRzBHM1Ey?=
 =?utf-8?B?eVpZLzQ5N2lFWUxERW1IVk5RWWlheGJPS1Z0UEJpYW42dGJxclRpZ0M4TGRl?=
 =?utf-8?B?YjJMNWFlUFZjV3B1clBkNFRmY1BrL1hybStHMnJteVJHTkdLZ3cxeTA2elEw?=
 =?utf-8?B?ZVpBNmZrcW50cWxNamNhc0NDQllqT0VtYStSNlljMTdJQ3NNY0MwbUtXamNE?=
 =?utf-8?B?Q1UyemtDRUEvSzNiNGJkcE9kRGZ0Y2I0ZVl5YUlWOTJOZUt3YWNVMEtkNGhQ?=
 =?utf-8?B?Qzk5QXJDZEhGWlp6R1FDc2dYK0kyMGFuNG9JWlZ2b2dtbDJsVWUwMjZ0OTdG?=
 =?utf-8?B?M1RqbVpuTXJFWDFaeEkwWW9NMEVwRC9YUitsOFRGeEtkZU5MV0h4S3lUdmU0?=
 =?utf-8?B?RlZZRFJwQW4vcllNYXhZdnZxY010OVc3TEVqRTh3MlpmMzk1T3F3RHVSaDBC?=
 =?utf-8?B?L0R6YmdUeHdLZTZ3bktmR2pVM1B1NXNzZWpHRXVzRlE0TlptaFMzSXVGUVNI?=
 =?utf-8?B?T3NvL1R2QzQwSDA2azJXMWlxVUQ0NmtXN2U4ZmwrT3psR1Y5N0xuSEhmUmcx?=
 =?utf-8?B?VEhzOFkzZEN1Q2NreG0ycS96NFhZdnpEdXdtTm83S0p0ZmwycC85YzBQQjNr?=
 =?utf-8?B?WktURFFkdUIzcy83UFpYeWlFbDhQTjI5QlF0Q290L3h4cUVJSG03YzJuMVNI?=
 =?utf-8?B?RE10K0NxTTRWYW1GcFRkeklqeW45UlR0K2I5T0R0c2JiektyOXdQLzErdWti?=
 =?utf-8?B?YmxGWEo1V3ZwRWJJeUhpb253Vjk4MzRnaUtMRnFJcVBRWm9BT2U5ZVVHQVI4?=
 =?utf-8?B?aGdyRFAvd21FcEhUMzBBQUhWQThNWnJOc0FSYzJFcW9seEY5b0lSbTFpRmk0?=
 =?utf-8?B?Vm45NTlRNmpzNUNBRURXM3JnSjhzUytwMlE1U0ZkV2FYSEYxUldjR0dBRGdN?=
 =?utf-8?B?cEM1eER2RDJPRDQ0R2dNT2dHbHBFYmJQcVFlSzRCSExvamdTWHplOFhQSkRm?=
 =?utf-8?B?NFhtcEFEUGJwdER3Mms0a292WG1sdWpMY1JlU3hhbTAxWlFZeGZ0d285OEpX?=
 =?utf-8?B?MXRzOXJyQnl1eGxLMnFaREdBbVFxaWdYN01MV3JabXVOMHFxQjZVazFKSHg1?=
 =?utf-8?B?Z2JSRWRUS3Z6ZlI5bFhHVnpWVHkrL0o0S1pmT2VmRFVVV1hTbkw3T0hTUTky?=
 =?utf-8?B?QzZOU1h6YWtnL0h5Vk9VK1ZsSmdGNEkyb1JLaTgzWFdZcFRNMjA0YmwvWjMy?=
 =?utf-8?B?SmR5eWY1Z0gzWEVMQkNHWTdET2xuaTRqT3BjZlhOc2sxSnA2WjlRSzBsU04r?=
 =?utf-8?B?U2srQW9zSnlMMk9MYzMwUjhuUTlUS0s4NXc1VzZXM21zYnB4TCtuN0x1a2Ey?=
 =?utf-8?B?MnhXOHIyYnlZdFlNRmUwMU93dk5Zc1VFUEh2SUVyQkkyNGxVQ1FsbFFuckRi?=
 =?utf-8?Q?ZQGao5E6WjbrJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c18ffd6-b6e0-495c-d44e-08d9148b4d44
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 14:44:38.1340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/lVtaRPpMwGqtPqt5TJ+FIS1UNQkJVsTXhGXXfDuNuFwrEaNTXj+GP4CwZ4WfS283QYi5c6/UuhwdvK77nw+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4765
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-05-11 2:38 a.m., Christian König wrote:
> Am 10.05.21 um 18:36 schrieb Andrey Grodzovsky:
>> On device removal reroute all CPU mappings to dummy page.
>>
>> v3:
>> Remove loop to find DRM file and instead access it
>> by vma->vm_file->private_data. Move dummy page installation
>> into a separate function.
>>
>> v4:
>> Map the entire BOs VA space into on demand allocated dummy page
>> on the first fault for that BO.
>>
>> v5: Remove duplicate return.
>>
>> v6: Polish ttm_bo_vm_dummy_page, remove superflous code.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 57 ++++++++++++++++++++++++++++++++-
>>   include/drm/ttm/ttm_bo_api.h    |  2 ++
>>   2 files changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index b31b18058965..e5a9615519d1 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -34,6 +34,8 @@
>>   #include <drm/ttm/ttm_bo_driver.h>
>>   #include <drm/ttm/ttm_placement.h>
>>   #include <drm/drm_vma_manager.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>>   #include <linux/mm.h>
>>   #include <linux/pfn_t.h>
>>   #include <linux/rbtree.h>
>> @@ -380,19 +382,72 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct 
>> vm_fault *vmf,
>>   }
>>   EXPORT_SYMBOL(ttm_bo_vm_fault_reserved);
>>   +static void ttm_bo_release_dummy_page(struct drm_device *dev, void 
>> *res)
>> +{
>> +    struct page *dummy_page = (struct page *)res;
>> +
>> +    __free_page(dummy_page);
>> +}
>> +
>> +vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
>> +{
>> +    struct vm_area_struct *vma = vmf->vma;
>> +    struct ttm_buffer_object *bo = vma->vm_private_data;
>> +    struct drm_device *ddev = bo->base.dev;
>> +    vm_fault_t ret = VM_FAULT_NOPAGE;
>> +    unsigned long address;
>> +    unsigned long pfn;
>> +    struct page *page;
>> +
>> +    /* Allocate new dummy page to map all the VA range in this VMA 
>> to it*/
>> +    page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>> +    if (!page)
>> +        return VM_FAULT_OOM;
>> +
>> +    pfn = page_to_pfn(page);
>> +
>> +    /* Prefault the entire VMA range right away to avoid further 
>> faults */
>> +    for (address = vma->vm_start; address < vma->vm_end; address += 
>> PAGE_SIZE) {
>> +
>
>> +        if (unlikely(address >= vma->vm_end))
>> +            break;
>
> That extra check can be removed as far as I can see.
>
>
>> +
>> +        if (vma->vm_flags & VM_MIXEDMAP)
>> +            ret = vmf_insert_mixed_prot(vma, address,
>> +                            __pfn_to_pfn_t(pfn, PFN_DEV),
>> +                            prot);
>> +        else
>> +            ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>> +    }
>> +
>
>> +    /* Set the page to be freed using drmm release action */
>> +    if (drmm_add_action_or_reset(ddev, ttm_bo_release_dummy_page, 
>> page))
>> +        return VM_FAULT_OOM;
>
> You should probably move that before inserting the page into the VMA 
> and also free the allocated page if it goes wrong.


drmm_add_action_or_reset will automatically release the page if the add 
action fails, that the 'reset' part of the function.

Andrey


>
> Apart from that patch looks good to me,
> Christian.
>
>> +
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL(ttm_bo_vm_dummy_page);
>> +
>>   vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
>>   {
>>       struct vm_area_struct *vma = vmf->vma;
>>       pgprot_t prot;
>>       struct ttm_buffer_object *bo = vma->vm_private_data;
>> +    struct drm_device *ddev = bo->base.dev;
>>       vm_fault_t ret;
>> +    int idx;
>>         ret = ttm_bo_vm_reserve(bo, vmf);
>>       if (ret)
>>           return ret;
>>         prot = vma->vm_page_prot;
>> -    ret = ttm_bo_vm_fault_reserved(vmf, prot, 
>> TTM_BO_VM_NUM_PREFAULT, 1);
>> +    if (drm_dev_enter(ddev, &idx)) {
>> +        ret = ttm_bo_vm_fault_reserved(vmf, prot, 
>> TTM_BO_VM_NUM_PREFAULT, 1);
>> +        drm_dev_exit(idx);
>> +    } else {
>> +        ret = ttm_bo_vm_dummy_page(vmf, prot);
>> +    }
>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>> FAULT_FLAG_RETRY_NOWAIT))
>>           return ret;
>>   diff --git a/include/drm/ttm/ttm_bo_api.h 
>> b/include/drm/ttm/ttm_bo_api.h
>> index 639521880c29..254ede97f8e3 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -620,4 +620,6 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, 
>> unsigned long addr,
>>                void *buf, int len, int write);
>>   bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>>   +vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
>> +
>>   #endif
>
