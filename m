Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ECE7EF637
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 17:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C2810E067;
	Fri, 17 Nov 2023 16:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A28D10E067;
 Fri, 17 Nov 2023 16:30:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgkTO6BjEJUA4wq6f2ojE+amqWsw4E8dBucfd6b32ddn5KFYIq+RGaCJPb2OqBA6tg0Ntb/5PPJMaAXrCrEZxY/FpJtuy/CfnlVWIkDiwRnbnm6Zr5KsXwRHi4IOFThUUBcbJ4QGn5XQFbdcJXu/jI/uXSGNyJA+rEtsU+EnL8mGwkomQNNqmNdH1UsHYL4vzM1HzkSvO63AH34iRt8a4vdnGhJdhgDI+VzVP3i8d9sy8nuTG3Gxsgbjfd+PA2BwhJIsYwcTTf8+yNxRP2tw3xkSWA4zL7kI/dtrS50D4/EwpOPNP+yYhQKtk4fLOy9lJ59qJMJseJRWW1T8Eh6jxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fT7RRz9Ux2HjnaYdD3Qe/mkpgMUTMUOR2diriLegkPo=;
 b=GQ+2DRfYL1HA8ogEHDfIrT46KruRWlQCIm/Y91aOqflemrD6DtZYL3unlWlKuFAAGspZ7ui0e/X939fruH3BJpicqYp9LbvoL40YTZ/dIdhoCcYq65k+KuFqggPBqwSFtsJ4BsWMUJh+H/KY4c4WwFFdF4jLXOyByaonbCSD/VkHV5iwEPUjEGbw1qQ/ea9GL3D2aGMy3PNpSBmpCUCOIIMdqtBbN40hP4WMIuZvbdX+f4V3U9n5eOn1zyMMsxHLm+MqaFEz1j3I6pAqUFCuAHoId3UAklp19zeWBzyFU5Z8mgbuYVaX43VUvtDW6jcp4hg9hFoqw0Lj6e3V3XIlHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fT7RRz9Ux2HjnaYdD3Qe/mkpgMUTMUOR2diriLegkPo=;
 b=r2QJV3Hxmed/N+754ot3P2bqYBIa80L+NP0iC62LKsaDXDSirJ0JZblMnnsppV+eB2kI3reMArLbwvZr9UWBKzkyU+7iUwyEt90GpYJcffQ5tyHuzPfVcWnyP6P/jy5MK/2QEWNPiwsoKr8zN60ukHVaUoxZGToTQWHdMdeBnKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 16:30:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 16:30:10 +0000
Message-ID: <84986a71-65e6-48e3-a10f-505832b1ded4@amd.com>
Date: Fri, 17 Nov 2023 17:30:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/amdkfd: Export DMABufs from KFD using GEM handles
To: Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20231107165814.3628510-1-Felix.Kuehling@amd.com>
 <20231107165814.3628510-4-Felix.Kuehling@amd.com>
 <a9fb97cd-9815-4e17-b3eb-8a3569b64d2d@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a9fb97cd-9815-4e17-b3eb-8a3569b64d2d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: 3442cfe0-9117-4ca9-81ae-08dbe78a779e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOwT8gvtFIMwxX9zqBo9JDRP4NrRgDDqM5vYtqtE+l/5qhfl8DR+1rbc0UWNP9Kw0zKLlSyFa0f1ZJL0VbY4lcCDx++IjF12k0kdipA9X49suqqW31PNyOTYxnAZOd0fbrH4Ea14g46qRAq0xo43jYVe/97xLI+lPpiTN0Yp2axJ1ALAl8o5fchb0jfjrAlyVRUXBFCtx80NXo8FP0qjoll6x3A5HCn6s+AhfxijRgfbmqMH7yW50xKgNrWDFqyBpyD37nZDzOl6xXJnjMhr0CXx8sxHmkV027m4JpcGYfrbvVjhrVhGZaDdGtR3YTaQL4w1/oHlgq6rLegxDBDwBLNDW5r5lqLB6kRHMiwvEYdrrlfLCCGDkgFUk7dmQ33Po72UrZEFlZXWA4PUGWnJtsH6mswxP+gGLXW/LADb4t/00NVrlRzg0RwBj/qpZ7htfhRMotITFXmvzl+5jbovmAX2zg9bCOrkWT0tjRjUqEWAvlId+mrfoUohvNe6xTfDgbseoqKXW+hpHDH/KnPWdqQXM7mfG65zl4s9940JRCcaw862CQCyMUYtH8h8MvfMCRLQQ0lXLDE+FMn0ISoHroH6COoG+NLNEngT71zTTz/QuLT1O+xdJAJukK4mQ4RjNRpP9IG9F9nwrPwrd3iihw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(396003)(346002)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(86362001)(31696002)(36756003)(2906002)(478600001)(6486002)(6666004)(5660300002)(6506007)(83380400001)(41300700001)(53546011)(2616005)(6512007)(26005)(8676002)(8936002)(4326008)(110136005)(316002)(66946007)(31686004)(66556008)(66476007)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVcvV0VKdWRibCtva2lmbnhwQU1UVUtReE9wVk1SaWM5bk9rbEVycXU1T21I?=
 =?utf-8?B?eGFUcEVLdUZqeTV2cXIzdVJEQzlIMkZ1eHdpeTdlbzRkcWxVSk9ERytKT2M1?=
 =?utf-8?B?V2s5VzdlWktKVWVmWmRtZWMxM29uVzd0REp3bTJKL0NLRUdqNWtXK2tMaytn?=
 =?utf-8?B?bThOWHdMcEovUEdEMTRLUVJYUm1EVEVqNlFGZDFhU2JabUloTUJ0LzRQeXFx?=
 =?utf-8?B?YlEzUUhjMnN5VUJlQlQrOVV4V21OMHRtbEdDTFZJZ3ZHM1hVS28waGNsV09E?=
 =?utf-8?B?dVk3Wk9DOHdvbDdiL0llUnZUSm9ScUhNa3BUK2Z1WUZKT1pFZ0RVZmplQjdS?=
 =?utf-8?B?bnppdkd1VklscHp5anJnR1kzdmpTY2hoUXpzQzFBYUkrYnVXVldXcGF3SE1G?=
 =?utf-8?B?dnkyOE02c1RhRllucUhzWkpvNUdib05peit3bjFYZS8yVFErNVRYR3JzRkdp?=
 =?utf-8?B?YTh0czkwK0VRdzlmWXd1WEVDTjQvNTU3N3M2eWtLeWZQaXp6cHE3UVJ6S0Zx?=
 =?utf-8?B?SnRyTFdiQmdiU0tkTlRzRG9ONFZtNmt0QXVsbGQxRjNQTVBGcVJtRHZnUkZu?=
 =?utf-8?B?NHdhWXBoSWtEcmpIRldMZWdqb0ZnZWdCS1N6ZWYrZXdDcFIwT1U0dldrbWJm?=
 =?utf-8?B?YXcrYUNGcHU3UXdlNFFvOE8ybUd3Y0krb0IwNVp1a29iT1NtUVVZRVJGRzJz?=
 =?utf-8?B?OXVubUh1SEhtQ05NUTcwR3FWS0dUUVJCZHFZRXEyeFJDdlNhNXRNMmRrT3NZ?=
 =?utf-8?B?bFQ0MXd3c1liMUpldGlOWm8vNkZrZng1dE5ocEhEdHVSb2hsOERjN2ttUElL?=
 =?utf-8?B?MGJzMkZkeW9YSnZaWlQzK0duSDVxMzVTYmVkTXhCbkIvTnVaeU81MG1ZSFhl?=
 =?utf-8?B?WGNEQkNZNDVHclZjbWoyZmMyYThHL29pNlRCQms0eWo0MlFXYXlhZDBXYjIv?=
 =?utf-8?B?UzIreHV6QUpTU3RIdWJsZnZxcUpJMkhxQUwyQUdBeFRKeXYvRFdHcnVKNU5m?=
 =?utf-8?B?THEvNlVRdkJGRDZTY05mYTZhcFVBQTdOei9oYXVUbXVtc2hJNi9ucGg3ZVRs?=
 =?utf-8?B?bTIwZ2hUUmV6eVF3YzdIT1k4SU9QV2hKbndQbHVpWXo3QStuQTl0dUkrRlBj?=
 =?utf-8?B?ZkZGUGJlWFZmam5KQk54K01McDJkZ0syT2gvZkovNXExMnp6NHltM3IrVzA0?=
 =?utf-8?B?SVB2Ris0SkdGNmVvNTBZdlpsSFowZEN4K1hsczZEOERaWHFMSHRUcFpLSkNl?=
 =?utf-8?B?SUxBMTlaelhqZlV6OUIvQ01rRTlocGIxUVN5TEZENUdXNHB3NGRrM2hJTk1Y?=
 =?utf-8?B?U2haUlJ0NGhqei9wVDhOQnhzQlNRaklHZ3NTekFTU2JiNlNQUllSa0VXajU0?=
 =?utf-8?B?NkNNUWFvV2tpNXZFaHJNNFVrbkJjcUpvK0dZcDJ2WkY0K2VVbWNDUTdnRkkw?=
 =?utf-8?B?L0RkVjNaZ1BLcHlVNUxnVGY0YmFIQnZ5VHFQOVplVXhiWlF1SFFrRU5jcVJu?=
 =?utf-8?B?OW1EREY1U1Q4Qjk0NENNb1VSb1dpRGZCcDN5dXAxdkpxSENmSEsxL0ZJRUwy?=
 =?utf-8?B?YzZQTUlXNjR4YkE5YUdxaDF0aTJjRjB5RGY3QVVUVVFJWWl3OUgvemZRVFhV?=
 =?utf-8?B?RVMvdHp2djNxTCtYdXIwN2dXSkVIbmhkbWphWDFJSlN2T1lWWnM3dm4xamlr?=
 =?utf-8?B?U3NicXVwQWp2dXE5cFdJUUFCNnpLeWlsdk1MWFhzUDQxK3BmSWxXUUZ5aFF4?=
 =?utf-8?B?UHZBbFQxSEQzWkZQSXBLR3ZoYnY1ZzdrdnlqM2doaU5ZbUhRMm1pYUFBRHNZ?=
 =?utf-8?B?V1dkNWFtKzh0QlZJekJVZjdKQWJCTlFHTUl6Y0xrb3VQZzVDZGdDWWlwZzlo?=
 =?utf-8?B?d09OUnEvTGpwRzR2TEI4R2oza1lJNVF3NmxPYUExVHljdVBBSEt0L3BEeWVO?=
 =?utf-8?B?TDBRcUVrVHRRSEY4NllQamdvV2pEVysycjhSKzlzTk01dU4wdlJIUUJlT291?=
 =?utf-8?B?N292UUpaeXlVZExNa1VKRVBrMWpKaUwxTWxjMmc2WTNRb0NFMVlQUXBobmMy?=
 =?utf-8?B?VHJsVXcwVGRpSGFWeHdqRVZsTmR1R2NWVk53K21aK3VCVEwvZnJqeFpXeEdl?=
 =?utf-8?Q?wuZXvxqv57p9jciTLVCVox/V5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3442cfe0-9117-4ca9-81ae-08dbe78a779e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 16:30:10.3448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LwCO2MS0ka2Vfs430g+Dq0uw4okRbc6fnKkV+mBthLfNEh/KlxoIfe4T9mic9EV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715
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
Cc: xiaogang.chen@amd.com, ramesh.errabolu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.11.23 um 22:53 schrieb Felix Kuehling:
>
> On 2023-11-07 11:58, Felix Kuehling wrote:
>> Create GEM handles for exporting DMABufs using GEM-Prime APIs. The GEM
>> handles are created in a drm_client_dev context to avoid exposing them
>> in user mode contexts through a DMABuf import.
> This patch (and the next one) won't apply upstream because Thomas 
> Zimmerman just made drm_gem_prime_fd_to_handle and 
> drm_gem_prime_handle_to_fd private because nobody was using them. 
> (drm/prime: Unexport helpers for fd/handle conversion)
>
> Is it OK to export those APIs again? Or is there a better way for 
> drivers to export/import DMABufs without using the GEM ioctls?

Well let me say so: I think it's the least evil approach :)

So yeah, propose a patch to export them again.

Regards,
Christian.

>
> Regards,
>   Felix
>
>
>>
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    | 11 +++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  5 +++
>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 33 +++++++++++++++----
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  4 +--
>>   4 files changed, 44 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> index 6ab17330a6ed..b0a67f16540a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> @@ -142,6 +142,7 @@ void amdgpu_amdkfd_device_init(struct 
>> amdgpu_device *adev)
>>   {
>>       int i;
>>       int last_valid_bit;
>> +    int ret;
>>         amdgpu_amdkfd_gpuvm_init_mem_limits();
>>   @@ -160,6 +161,12 @@ void amdgpu_amdkfd_device_init(struct 
>> amdgpu_device *adev)
>>               .enable_mes = adev->enable_mes,
>>           };
>>   +        ret = drm_client_init(&adev->ddev, &adev->kfd.client, 
>> "kfd", NULL);
>> +        if (ret) {
>> +            dev_err(adev->dev, "Failed to init DRM client: %d\n", ret);
>> +            return;
>> +        }
>> +
>>           /* this is going to have a few of the MSBs set that we need to
>>            * clear
>>            */
>> @@ -198,6 +205,10 @@ void amdgpu_amdkfd_device_init(struct 
>> amdgpu_device *adev)
>>             adev->kfd.init_complete = kgd2kfd_device_init(adev->kfd.dev,
>>                               &gpu_resources);
>> +        if (adev->kfd.init_complete)
>> +            drm_client_register(&adev->kfd.client);
>> +        else
>> +            drm_client_release(&adev->kfd.client);
>>             amdgpu_amdkfd_total_mem_size += adev->gmc.real_vram_size;
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> index 68d534a89942..4caf8cece028 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> @@ -32,6 +32,7 @@
>>   #include <linux/mmu_notifier.h>
>>   #include <linux/memremap.h>
>>   #include <kgd_kfd_interface.h>
>> +#include <drm/drm_client.h>
>>   #include <drm/ttm/ttm_execbuf_util.h>
>>   #include "amdgpu_sync.h"
>>   #include "amdgpu_vm.h"
>> @@ -84,6 +85,7 @@ struct kgd_mem {
>>         struct amdgpu_sync sync;
>>   +    uint32_t gem_handle;
>>       bool aql_queue;
>>       bool is_imported;
>>   };
>> @@ -106,6 +108,9 @@ struct amdgpu_kfd_dev {
>>         /* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
>>       struct dev_pagemap pgmap;
>> +
>> +    /* Client for KFD BO GEM handle allocations */
>> +    struct drm_client_dev client;
>>   };
>>     enum kgd_engine_type {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> index 0c1cb6048259..4bb8b5fd7598 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> @@ -25,6 +25,7 @@
>>   #include <linux/pagemap.h>
>>   #include <linux/sched/mm.h>
>>   #include <linux/sched/task.h>
>> +#include <linux/fdtable.h>
>>   #include <drm/ttm/ttm_tt.h>
>>     #include "amdgpu_object.h"
>> @@ -804,13 +805,22 @@ kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
>>   static int kfd_mem_export_dmabuf(struct kgd_mem *mem)
>>   {
>>       if (!mem->dmabuf) {
>> -        struct dma_buf *ret = amdgpu_gem_prime_export(
>> -            &mem->bo->tbo.base,
>> +        struct amdgpu_device *bo_adev;
>> +        struct dma_buf *dmabuf;
>> +        int r, fd;
>> +
>> +        bo_adev = amdgpu_ttm_adev(mem->bo->tbo.bdev);
>> +        r = drm_gem_prime_handle_to_fd(&bo_adev->ddev, 
>> bo_adev->kfd.client.file,
>> +                           mem->gem_handle,
>>               mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
>> -                DRM_RDWR : 0);
>> -        if (IS_ERR(ret))
>> -            return PTR_ERR(ret);
>> -        mem->dmabuf = ret;
>> +                           DRM_RDWR : 0, &fd);
>> +        if (r)
>> +            return r;
>> +        dmabuf = dma_buf_get(fd);
>> +        close_fd(fd);
>> +        if (WARN_ON_ONCE(IS_ERR(dmabuf)))
>> +            return PTR_ERR(dmabuf);
>> +        mem->dmabuf = dmabuf;
>>       }
>>         return 0;
>> @@ -1826,6 +1836,9 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>>           pr_debug("Failed to allow vma node access. ret %d\n", ret);
>>           goto err_node_allow;
>>       }
>> +    ret = drm_gem_handle_create(adev->kfd.client.file, gobj, 
>> &(*mem)->gem_handle);
>> +    if (ret)
>> +        goto err_gem_handle_create;
>>       bo = gem_to_amdgpu_bo(gobj);
>>       if (bo_type == ttm_bo_type_sg) {
>>           bo->tbo.sg = sg;
>> @@ -1877,6 +1890,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>>   err_pin_bo:
>>   err_validate_bo:
>>       remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
>> +    drm_gem_handle_delete(adev->kfd.client.file, (*mem)->gem_handle);
>> +err_gem_handle_create:
>>       drm_vma_node_revoke(&gobj->vma_node, drm_priv);
>>   err_node_allow:
>>       /* Don't unreserve system mem limit twice */
>> @@ -1991,8 +2006,12 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>>         /* Free the BO*/
>>       drm_vma_node_revoke(&mem->bo->tbo.base.vma_node, drm_priv);
>> -    if (mem->dmabuf)
>> +    if (!mem->is_imported)
>> +        drm_gem_handle_delete(adev->kfd.client.file, mem->gem_handle);
>> +    if (mem->dmabuf) {
>>           dma_buf_put(mem->dmabuf);
>> +        mem->dmabuf = NULL;
>> +    }
>>       mutex_destroy(&mem->lock);
>>         /* If this releases the last reference, it will end up calling
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> index 06988cf1db51..4417a9863cd0 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> @@ -1855,8 +1855,8 @@ static uint32_t get_process_num_bos(struct 
>> kfd_process *p)
>>       return num_of_bos;
>>   }
>>   -static int criu_get_prime_handle(struct kgd_mem *mem, int flags,
>> -                      u32 *shared_fd)
>> +static int criu_get_prime_handle(struct kgd_mem *mem,
>> +                 int flags, u32 *shared_fd)
>>   {
>>       struct dma_buf *dmabuf;
>>       int ret;

