Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B34414B43
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 15:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129C56EBD0;
	Wed, 22 Sep 2021 13:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203DE6EBB7;
 Wed, 22 Sep 2021 13:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNk3yStcVYh78CfO1EwSivrYxktiPhNBspiZoSWNQmdxU25GDYJviDgvOd2C4Y5DGgvaQ/IPATHWDY2I0JFHfombArwxDDy2m2IFHW6UMBjCm1k4sIMVchoO8FQrBFjrcqgVhKdslfXrlJUzxq4DmseztCGjYznucqm0M/HpWB9FTnfmBnEPZhZozji0J7lfa4rcUObwtU/1/5BPPCf+Mjut2ojEvId6h30Kp8hPHL4ncH/Z2DeQmB+MRbIypyCY8SF/nCFRymoFl86ePsDw/+WC4FmD5F+I2ayXO8bAfPRzqzaLOqRYPIYrXR5YtZRR2zF/x38pUUWj66K68VPQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yBf1GVi177219iKJOR8hr28+7RY9/WFHvc5Wt5IU+sc=;
 b=J8JHqkm9OXOlPkirU6gfDl4j63L19BOHLpfgP0HLt8FeznRA7HWH4Ba4KnIOgS2dgng+Z63lQyQcyDyqi9AQ8BVuq8ANHqZgIa6bV/rM0So5tBtPBVgj2yXHYCdIvQim0jVgKGGH5oRT3T0eFbIFFQh+LpkD2w0ClZkPjG2sZ32CUns60dOMEqgIhk5QCCrcO3dG6gYPHQmguH+pJCWcg23/qu5c+E9SPQ7Drs/1UPsdQBRq5IlIWhGLvh38mENIUi8ARK0bLLtllsJxeN9oErFVsfyC16gfDIOIg4Ih1WMAMfMTPEBNbtfO8wtwKpucUrMyaIwT6WGplajl6SJFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBf1GVi177219iKJOR8hr28+7RY9/WFHvc5Wt5IU+sc=;
 b=YuSLW+rExqIU0uLW7bTeiEYLKm5Bru3rYt4/Jwn/N8iFW9wnl2SLK4/ByGhO+CLAi+c8cRbdwWb9plsRFx/50U7KSCrzMmwtbWz6U5BKAJIwbO2KJEo5I1yqknt8JxhEfCggfXucWTgoPXGcKasWUcMkGHmYg6j0/w7YZfV4iZU=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 13:59:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4544.015; Wed, 22 Sep 2021
 13:59:44 +0000
Subject: Re: [PATCH v4 10/14] drm/i915/ttm: hide shmem objects from TTM LRU
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210921110121.3783395-1-matthew.auld@intel.com>
 <20210921110121.3783395-10-matthew.auld@intel.com>
 <92d33ac7-f1b9-26e4-d39f-c351c4220dfa@amd.com>
 <b42594cb-a9aa-8240-e03b-5d6c303242d0@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0b568072-7a0d-f41d-6227-4481522a795a@amd.com>
Date: Wed, 22 Sep 2021 15:59:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <b42594cb-a9aa-8240-e03b-5d6c303242d0@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.158.115] (178.202.40.91) by
 PR0P264CA0086.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 13:59:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cf29240-8536-4087-20df-08d97dd13afa
X-MS-TrafficTypeDiagnostic: MN2PR12MB4192:
X-Microsoft-Antispam-PRVS: <MN2PR12MB419235D16AF5B7D2C5C5BB0083A29@MN2PR12MB4192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: behd5+O3Dfg0+JaEBYaCAMLIRWRajLSonCaJ6U1p1CLfxoXUZp4/MECkWqxchoI/qVKXNfqfcKBTB4Fz4Cwnl7KkyGyTR4hkTXVJi8udPydlTQn6RQbOHLKz6MQ/qcrVZJfHev+RgL1tnOSMGKUaNUxPcXhl4B8d4kK47VQu/7usLP1bAZILmN4Hv3I8L67gD5rmNvvA5UckQUR4ZiXb5Te/ItvBdStwA6BbKoyb2ln3lkfw3DpHK5aRb+PhR4HyT6umVVq8bPRnlLW+nq0zxjDIkH9kLw0ROBPbVHOH9UgWYwQCKnaDLvXqr0LMQ9+8E/KSRzCyV+9afZYkpln8pZCVwY5YOs431I6DD8LI9JM740KsTrLl7e5EB7mnU49JDkoT3JuZ9S4MOuSD0BnapVW7vBAl28Yxo+FGhHq3bmFUBtmMem2OqN5t/v+ppwVzVsM+gNs1pXdsRjNCuA+iNy7VSRhLMXTBPz7ukFsMhak+7pwTnJzHIpa3XcBqTqrawiVM+J5P4gtHP24wXeROYmaYTdNMTnb20lQgiEGl3X6NKwTuTG0bvXxTkdSknCwnTd44N7rlw1nz8s0ISf1vmqbR9tWdL+5vz6v3PuwyZtLV0+XyAbn/tojMlSMjGPRFLWtrQQBEE/QyYUbxcMPguICT56aGX4nJGeYko5c4S4+0mBSduuFO0CYh8MktsJi1GjGAgtKr/eqR+OgZ8fOmxOIc/QvAKnzI31kg+wC76g8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(38100700002)(53546011)(66476007)(316002)(956004)(2616005)(66946007)(6486002)(31696002)(2906002)(16576012)(31686004)(4326008)(83380400001)(86362001)(36756003)(6666004)(508600001)(186003)(66574015)(66556008)(26005)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm0xT2ZvWGpuQVpWTElMMFJzOVp2RWhEWVhiQ3RtY0lLS2lsSlhSMVVNSHZZ?=
 =?utf-8?B?ZWxjL0sveDR3RjNFT0U1TUE3Tmp2RkQrMllDUVNPWiszMktpMXdVdmNNQkNX?=
 =?utf-8?B?dXRoTWxSN25kNjQ1Z1hDdHN5Vll5RFB5Vk8rUVB2NFpMUjBoMmFyR3lFT1ox?=
 =?utf-8?B?T0xET2w2YU5lRE5xKzRvWFYrQk9TMndlK2VLS1B1a2pRVW84WlgvUkhQa09h?=
 =?utf-8?B?ekJtOE0vWVNLQWFLdzdqdjFuN0xsNEhnTUZLeW9jR3o3RzFJT2U5SFdsckVh?=
 =?utf-8?B?NFZSS2M5NHpicWR6NFovVTNmYVpSRWI0UG1QdEt2clhDRmdoZDhrNE5YNk56?=
 =?utf-8?B?TTFubzZ4TjBBcFFGd1Z6Qkxqd3JXc01qY1hGZjh6YXRCcG1qeVF4UUR6Wklz?=
 =?utf-8?B?cjhybEQyTTkxQnhYbXVxdWRoenhvdnpzVDg4VnhGdGE5YUwyR1I4UElkb0Uz?=
 =?utf-8?B?dlpXNDJ5ek1xZ3RpbGlKcjhlT2NtMGlXWjRncWdyMG50WUdBNnQ5eUZxM0lx?=
 =?utf-8?B?WWJWS0VjbTk2NzgvRHkzc2RRcG5Ca1ZtaUdWZXo2WC9ZWTB2ZUsvVmFvNjN0?=
 =?utf-8?B?Y2VyWWlhdnRhYk9FUkZkZS9xVUVxaDFSOFRFUU95bERRcHdLanZCd1BvL1Q2?=
 =?utf-8?B?TUlGVzFUbjZzM0w2bEhVWWgyV1QvcjJ0Mm9lUWJrN25tTDk0S1oyL0d2eWds?=
 =?utf-8?B?bG0wRmdOVlFWc005WlpYODNhcWliTWZ2VVphUlZONFd3YUg0ZHNxVG5JQVBY?=
 =?utf-8?B?VURUVXNyR0wzMi94WlVVRGVpY2NPbVYwZE5mcXFKMnh3d1hHTnhCbWFkRDdN?=
 =?utf-8?B?RHFNdXBmeGc2Zjlkell5Vm8yQktUdm4zWmM3UkQ5Q2drU0NkRXp4Vkk4L1Az?=
 =?utf-8?B?dEErVjVMZ2dPc1NOSEYzU3V5TU9oRCttdXNudHhJYzU5ZlhWWHVMaWhUQzBC?=
 =?utf-8?B?US9CNUFJS3N4QXJ0L243UGZCeWZBaTJ3MUt5Wnpid2c0ZGEvRXVpRVB2bXdL?=
 =?utf-8?B?Vy8xTUJGcHdOQ3hXbzNIZ3NYSytBRENzdFF3NG9CdTQ0N3NSRFJTM3pDSlRQ?=
 =?utf-8?B?c0FsSTcyL1h4RkErSGRXOW4wRzB3bFg1dU5kM0ljZTBzSmdjZ3VtcGh6NFJW?=
 =?utf-8?B?bGZqOElrT3k5Y2RSdGVXWXRpK1pkbkNxcW52bjhiVGI1TzJzeVFCdkVlZndB?=
 =?utf-8?B?OC9KcTNGZmhXV1dQZVowcVR4TU9neU1XMnQydjN5NjVRSkpRZUE2ZXZxTDA4?=
 =?utf-8?B?YUY0OEZPelhkalJQeE4wUmRKVngxeWh2c2pMRDgvTW92c242WGFhV0praSs1?=
 =?utf-8?B?V2FINEdqVjFVQlpreTBOOHpLTnFTWm80Vm9TSjd6Z1dnUUxtRER0QmN3R3Y0?=
 =?utf-8?B?VmVrbml0djc2V2J3RUY1ODd1V2hEWWIzZm5PeDMzN2JVeFdqUVJxQk14RW8z?=
 =?utf-8?B?Wm1PbU85TVhJbXpMb0RIcDhmbjNSejBiK1VuQWdBSUR5TWhsQ2M1a3Y2amRr?=
 =?utf-8?B?N09MVXJLcSs2Q0hmOVlmVTMrZHluaUsxQWpLT0lKS3N3eGYrVTNVc1Y2MFA2?=
 =?utf-8?B?Z0RRU3dScmlNMUVQTU1BMzkzVmZZSjYxVVZYc0w2di9qS3I5djRVNm9lOXlP?=
 =?utf-8?B?U2d1SHlORG9LWWExMUtFVm93VjR5NnZxMDkwS25lb2tRUXF0VUZOeFZkZ1ZR?=
 =?utf-8?B?dHVyVmcxYWNZcXVydlJDNUc3dEZLYm1wMFBHZi9nMHJBV09UeDk5Sm9tdFpz?=
 =?utf-8?Q?WRloma1JLdEYfZ9nJX2MTM6/yTJw4qgmAPn0Aox?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf29240-8536-4087-20df-08d97dd13afa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:59:44.3662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKZ+VU4BiDFeUSXGv5r4rzaRUIiv6WOzXX6wZbt8WpD6bX6Tpd8I8LgEMmHcriss
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4192
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.09.21 um 15:34 schrieb Matthew Auld:
> On 21/09/2021 12:48, Christian König wrote:
>> Am 21.09.21 um 13:01 schrieb Matthew Auld:
>>> This is probably a NAK. But ideally we need to somehow prevent TTM from
>>> seeing shmem objects when doing its LRU swap walk. Since these are
>>> EXTERNAL they are ignored anyway, but keeping them in the LRU seems
>>> pretty wasteful.  Trying to use bo_pin() for this is all kinds of nasty
>>> since we need to be able to do the bo_unpin() from the unpopulate hook,
>>> but since that can be called from the BO destroy path we will likely go
>>> down in flames.
>>>
>>> An alternative is to maybe just add EXTERNAL objects to some
>>> bdev->external LRU in TTM, or just don't add them at all?
>>
>> Yeah, that goes into the same direction as why I want to push the LRU 
>> into the resource for some time.
>>
>> The problem is that the LRU is needed for multiple things. E.g. 
>> swapping, GART management, resource constrains, IOMMU teardown etc..
>>
>> So for now I think that everything should be on the LRU even if it 
>> isn't valid to be there for some use case.
>
> Ok. Is it a no-go to keep TT_FLAG_EXTERNAL on say bdev->external?

We could add that as a workaround, but I would rather aim for cleaning 
that up more thoughtfully.

Regards,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 17 +++++++++++++++++
>>>   1 file changed, 17 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> index 174aebe11264..b438ddb52764 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> @@ -800,6 +800,22 @@ static unsigned long i915_ttm_io_mem_pfn(struct 
>>> ttm_buffer_object *bo,
>>>       return ((base + sg_dma_address(sg)) >> PAGE_SHIFT) + ofs;
>>>   }
>>> +static void i915_ttm_del_from_lru_notify(struct ttm_buffer_object *bo)
>>> +{
>>> +    struct i915_ttm_tt *i915_tt =
>>> +        container_of(bo->ttm, typeof(*i915_tt), ttm);
>>> +
>>> +    /* Idealy we need to prevent TTM from seeing shmem objects when 
>>> doing
>>> +     * its LRU swap walk. Since these are EXTERNAL they are ignored 
>>> anyway,
>>> +     * but keeping them in the LRU is pretty waseful. Trying to use 
>>> bo_pin()
>>> +     * for this is very nasty since we need to be able to do the 
>>> bo_unpin()
>>> +     * from the unpopulate hook, but since that can be called from 
>>> the BO
>>> +     * destroy path we will go down in flames.
>>> +     */
>>> +    if (bo->ttm && ttm_tt_is_populated(bo->ttm) && i915_tt->is_shmem)
>>> +        list_del_init(&bo->lru);
>>> +}
>>> +
>>>   static struct ttm_device_funcs i915_ttm_bo_driver = {
>>>       .ttm_tt_create = i915_ttm_tt_create,
>>>       .ttm_tt_populate = i915_ttm_tt_populate,
>>> @@ -810,6 +826,7 @@ static struct ttm_device_funcs 
>>> i915_ttm_bo_driver = {
>>>       .move = i915_ttm_move,
>>>       .swap_notify = i915_ttm_swap_notify,
>>>       .delete_mem_notify = i915_ttm_delete_mem_notify,
>>> +    .del_from_lru_notify = i915_ttm_del_from_lru_notify,
>>>       .io_mem_reserve = i915_ttm_io_mem_reserve,
>>>       .io_mem_pfn = i915_ttm_io_mem_pfn,
>>>   };
>>

