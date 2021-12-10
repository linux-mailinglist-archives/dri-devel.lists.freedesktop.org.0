Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD9C46FB03
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 07:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166BE10E50B;
	Fri, 10 Dec 2021 06:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BC110E502;
 Fri, 10 Dec 2021 06:59:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zi/ofTzrY6v6bB+dXp49kcWnwGsBHI2K/6qUKwOwAuYQ1+UjkFxLcZKyeBVhxh3IJkS5Wa1E/hpvE7rQ1CzrDuWgEybJ0mSrOLFVDgM88dqS5+dk0CAOoZUE61fgdhQcAvHqjsejUrX0q+KicDfKQ+s93kKEgW7uL7jiKnSYf1rVCa+zn0CRjxieZ4FSbGnYf1+u6x0ZbP8o0cBfvkdhVcU1Yq5BYbbdS5rj5f8NaeYmx745PaTJ/gTO25GPDKaTXN0ResIgiStgKeHcXJlEMqks481P/uhSxMasIqvGWkXUGHAcLTx6OoiU5x11d3uNXpGwO+mD9vzSE1Zle9CSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE6RDfSuJ4R4Vws8y2mIgGHYy4Ipx62Um8m6mANQ6Fg=;
 b=Shjkokjnotud+UDoLrmRF53AiW9CJPkjDsfT+qBTLZPDIn0DdrkDPmtUu1QAAsD7VhDX4doIloP3gsMONpYkm1V0LOPFp9synRtuLpx4KdIjxvIx6nVu8jR2XilU9vj+AsexP6agw11D6ccMQsUa+0UTe+G7XletVMse1OmWOONlUzHVO9n96EQl392e4O3rzm5l1QtYTjCeVz5BNONi6lrob3vtWbpZxyJi6mnePHxHwwpPeAptCghyQsrGlitM71WD69p++HX4DufqTE/P2ms6KtbPuGkGIkg+Lw7lfZioB8exsMXgcFRhHYEjEfUPcegEi4YfT9RrY0hsU5Qk2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE6RDfSuJ4R4Vws8y2mIgGHYy4Ipx62Um8m6mANQ6Fg=;
 b=nDt8zbx0O9B5bUfnH0WpsZFwnZes1NlFL6e+RpJo83Ze0nDH0GagkxITGKMY3pfqRZCI7ToaaCjpfvykSYOIZ85JQDGT2DA0BtD438XY0L/w+Qh7leY/ex/sbpqfR2jV6lFPDphC51I6mw/jyaGEOuQCkrg5t2uywl4HtJwzq1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1774.namprd12.prod.outlook.com
 (2603:10b6:300:112::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Fri, 10 Dec
 2021 06:59:00 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4755.024; Fri, 10 Dec
 2021 06:59:00 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: Felix Kuehling <felix.kuehling@amd.com>,
 "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
 <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
Date: Fri, 10 Dec 2021 07:58:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0178.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::10) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.191.248) by
 AS9PR06CA0178.eurprd06.prod.outlook.com (2603:10a6:20b:45c::10) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 06:58:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b6c4e67-1eea-4c23-c602-08d9bbaa8ade
X-MS-TrafficTypeDiagnostic: MWHPR12MB1774:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB17741F1104D56A331C039EB983719@MWHPR12MB1774.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LqFk6LtXsMVzowXMWmOG6VJAx+Kh/XKIqjertbYmTt9BB+mQzudux93Aw/AIlWtE+3yr9t34rCVgHWfI6Sx+RrAjjpMgCbGdKKkCpXFCTX7f32K4FGfMDWL9igoUbDqb+8ZV8Uo7bYnQfmC2rxpGBMtqFoKNUdjy1R1VyOnsvCcs/iTehPp7VQIwfWdTmkuJC/XtjpJTc0ObzwdnQbqyUpo3jc+RZlXep8TJ7QBF2RKCGxiCpdpMFWApM4oQ7NKXiyTp1sxLYJ3C+gkbdMtlShH+mNj+wKN0rgitKF5Z1u0sojWf2xYFERIHou+nycVSZhhe7pq560h1oqwMP+htht9FF/T+75vhjJtLF+9oFhffXlpYi9lWyfuYVwHQlE9pM6/PYkBiQ2YH6Jla263Z5bTMTgbd6YAz8rDlyF8uXxD3K40xSA7m4wuR7QwdsAfK2PkPX163csuCN6ooOWQBF6ffGI8ApmBGgoMsomrCOO64IQKJjAH06PChWFbrqsesU558dTQAEUKqcpZPVLbnO5BULzuwFdLTvEvXVgs1PGfsabyV4Uwe3TrmkoFyWy+h1X4tmUPSoKkuOaCfLoUJ6502TmySPmTg+bMDCRLolXxMhC9U1x8Nx/Pu0VG6TnsP9iBl6529avk+5pYZGhBJCPcFdkHabPxT9Oq1Z25X5TD16K8oP+6m1BmijBp4eLYeuYQ5DfcORk5Zrcg6xLSw+xr7STBiOE1c7U71Do23K1Y5RNzh93Wr5GXeQLFVXoFm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66556008)(16576012)(66946007)(86362001)(186003)(53546011)(26005)(508600001)(8676002)(316002)(6666004)(83380400001)(36756003)(31686004)(8936002)(38100700002)(110136005)(2616005)(2906002)(5660300002)(31696002)(4326008)(956004)(66574015)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEV2eGNrTkRkUy9MVlR0N0dmdWZPLzIxandOT0pWdDNnU1UzTEtHOTZwbGZC?=
 =?utf-8?B?UVZqa1V6cFhXSUxFMi9JOC9wMWt2bnF2NXhzY214cTBpczBva2ovR1IyWTFT?=
 =?utf-8?B?Y01MNXRObWtkRGtRdGdhc2Z5N3VZNHVMVlIvRHluSTF5TWt1RUtjVlJZbmhI?=
 =?utf-8?B?NmhVaXVVRDd5UlY4K0M4QnhjUFRJblczcCtVTTJqWGxERTNSZE9OR0JwaS9n?=
 =?utf-8?B?SUhybnQwRDlobUlNdXF0aWx0aEVHMm15N2JYaHNSZXRmNEdOa3lmY2t3dlp3?=
 =?utf-8?B?a0pGWjJWUktjazhvZWxvRWI4STZEdGxLTlJDSlIycmRUVmhXZkhKZndKVzZB?=
 =?utf-8?B?VkZaZUxFZlV2ZzhuZ2F4MWhaZy9mZ29sTWZEck5jSUVVQTJxVGRpSG5Wdzcv?=
 =?utf-8?B?ZE9PME1aTzJBSXZ4cmg1NTMvdGh3ZU1Tb0pHUTVHb1lkdmN3cjYrQVR3cUdH?=
 =?utf-8?B?NTR4c0E3K0Jpei9Uc1FkdFZrNHFrdkpSS28wYmR6WlZ2dU9ncVB4UEV0SmpK?=
 =?utf-8?B?NWU0S2xqYmd5SzNuR2l6ZzQvUWdQanpWVEZLazNVUHpEWVo1MzJpa3hpUCs1?=
 =?utf-8?B?emtoLzFYTEZ5dHBoNzZSRFc2MmhYdzQ2RzM5eWd2MWhneG1hM2c2NjRSUGVZ?=
 =?utf-8?B?UjBXYnRnZGRQTHp1WDVhVGpZZHVBMDA5ek1WdG9hRUs5d0xSWEhjVUxlUHhL?=
 =?utf-8?B?MzluZ2o3aWFwQXMrM1N4WDhkakJ4TFN6Y2l3N3llKytZUXJmRzVjMGsxN01W?=
 =?utf-8?B?empTUHR2L29tQ0ZjQ0RwUzJ0UU5WSXdDNWMzTVdyTmR2cGM2cjFyamNIdmtm?=
 =?utf-8?B?c1RHcDRSQzBaU3gwcHc5Qm51Yi9RdlhyanhZNW5GUTl0VkdFNVFKVjUwSDhX?=
 =?utf-8?B?ejZzM20xZm1aLzA4ZDM4V3pPa2ZZd1NKK09nV3M2VmxsbllidmppNWgyZjJF?=
 =?utf-8?B?STVkWXhNc0ZoaGhwMWpobW13a1BEbTl2S2pIajdLM1RiRmc3RUF0em9aU3Fw?=
 =?utf-8?B?M0hVZUk0Ti9lUmt0a0p3TnRISDVuNENqbWRweVVtRUdNQk1FemJKVnpyLzFv?=
 =?utf-8?B?T3hMZWtJeGl3MzMwS0tTenlzR1lnVm9JTUh0V1IvTjZPRUd4Ty9USXE4WlZW?=
 =?utf-8?B?Q00yblpYUFdZYWNpTkhKb2pKWnpNUmJLK2dleVlKTnd2bFN6NGg4NUNtVkcz?=
 =?utf-8?B?c0ZiQ2FlakN2YUc3N0dkelhCUGxLL3UwR2owK1JvK3VDU0RrN05oeDYxZHF5?=
 =?utf-8?B?cnVzaTZoUnR4d091M0lFMytiZjVUeGpiNnE0OW52dUdhUEt2QjVmY01Vd0M1?=
 =?utf-8?B?NXRZVFR1aitTSFNTUzl6Z3BrUFpiYUt5dy96TEhWQmNvYVYvQ2RneVBuVWtL?=
 =?utf-8?B?K21wZTZYbVl2UUxURGZjQytxWTJ3Q08rVkEvSStnamh0Q3JpNk9OalhTM21H?=
 =?utf-8?B?QW9hZjBMQTdFZGs2OGhoS2lTbitha00wRUR1N3QwNEpML1RYRUlMZjAwcTNE?=
 =?utf-8?B?c3d6OGhVZ3JqdUh1MnV3Tkk2YS9la1h2NDd6a2o2SVlDZWFwSVo4cDN2REhT?=
 =?utf-8?B?alZYdEF4NElUZTZWVE80cGNSUGNZaDlHVytQSWpSSjB5MysxU292WCtGMm9W?=
 =?utf-8?B?eVBkWlVwRFpQS0laZVNVM3NiTGpYNWVEQ0FFWnU1R2htcmF6VlV2eHRkZTJL?=
 =?utf-8?B?QUJmVGZKcS9MQzg4ZkQxZVFZYjlDSDlhV1FJa0drTm5vTjExOVQ4VXN3c0tz?=
 =?utf-8?B?TjFyWE1YanNoNDBWdWFNbDFxVDNEeFlPdnVMRXErd0YxemRSVnNDSy91UnhS?=
 =?utf-8?B?emJYYjVnaEtqZURQc2lobzI4ME1DWStPQjVyRWwrUDVXTWhUKzhMZ3Z2UzJi?=
 =?utf-8?B?aTkydStMVk5CVGtiRzJKY040SWdwTy9IVUIxU29jYW1JNjQrMnVmMmpsMjdZ?=
 =?utf-8?B?NXlUc2ZKc0pTUVcwczh2QUk0OFV0dkNQaS9sV0V3a1Q4Q3RBSWc5LzV4akpl?=
 =?utf-8?B?T0U3UlhQcG4rY3JkZEFWNlNOZitJN3d5NVc0bk1keXdxSVgvYmljY3gxejlT?=
 =?utf-8?B?d3BoM1A3aSsrZUVrUXRCbnVtUkM0WnlXM0VoMnpiRnVkZnVOZWpnTmVvUklV?=
 =?utf-8?Q?vfBI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6c4e67-1eea-4c23-c602-08d9bbaa8ade
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 06:59:00.2014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8Rjl/dyNMMHD4nuee+ZyJabnICgkU7snrbWr+AYGpzT4beKEjisMFelTrO7Czzz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1774
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch,
 David Yat Sin <david.yatsin@amd.com>, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.12.21 um 19:28 schrieb Felix Kuehling:
> Am 2021-12-09 um 10:30 a.m. schrieb Christian König:
>> That still won't work.
>>
>> But I think we could do this change for the amdgpu mmap callback only.
> If graphics user mode has problems with it, we could even make this
> specific to KFD BOs in the amdgpu_gem_object_mmap callback.

I think it's fine for the whole amdgpu stack, my concern is more about 
radeon, nouveau and the ARM stacks which are using this as well.

That blew up so nicely the last time we tried to change it and I know of 
at least one case where radeon was/is used with BOs in a child process.

Regards,
Christian.

>
> Regards,
>    Felix
>
>
>> Regards,
>> Christian.
>>
>> Am 09.12.21 um 16:29 schrieb Bhardwaj, Rajneesh:
>>> Sounds good. I will send a v2 with only ttm_bo_mmap_obj change. Thank
>>> you!
>>>
>>> On 12/9/2021 10:27 AM, Christian König wrote:
>>>> Hi Rajneesh,
>>>>
>>>> yes, separating this from the drm_gem_mmap_obj() change is certainly
>>>> a good idea.
>>>>
>>>>> The child cannot access the BOs mapped by the parent anyway with
>>>>> access restrictions applied
>>>> exactly that is not correct. That behavior is actively used by some
>>>> userspace stacks as far as I know.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>> Am 09.12.21 um 16:23 schrieb Bhardwaj, Rajneesh:
>>>>> Thanks Christian. Would it make it less intrusive if I just use the
>>>>> flag for ttm bo mmap and remove the drm_gem_mmap_obj change from
>>>>> this patch? For our use case, just the ttm_bo_mmap_obj change
>>>>> should suffice and we don't want to put any more work arounds in
>>>>> the user space (thunk, in our case).
>>>>>
>>>>> The child cannot access the BOs mapped by the parent anyway with
>>>>> access restrictions applied so I wonder why even inherit the vma?
>>>>>
>>>>> On 12/9/2021 2:54 AM, Christian König wrote:
>>>>>> Am 08.12.21 um 21:53 schrieb Rajneesh Bhardwaj:
>>>>>>> When an application having open file access to a node forks, its
>>>>>>> shared
>>>>>>> mappings also get reflected in the address space of child process
>>>>>>> even
>>>>>>> though it cannot access them with the object permissions applied.
>>>>>>> With the
>>>>>>> existing permission checks on the gem objects, it might be
>>>>>>> reasonable to
>>>>>>> also create the VMAs with VM_DONTCOPY flag so a user space
>>>>>>> application
>>>>>>> doesn't need to explicitly call the madvise(addr, len,
>>>>>>> MADV_DONTFORK)
>>>>>>> system call to prevent the pages in the mapped range to appear in
>>>>>>> the
>>>>>>> address space of the child process. It also prevents the memory
>>>>>>> leaks
>>>>>>> due to additional reference counts on the mapped BOs in the child
>>>>>>> process that prevented freeing the memory in the parent for which
>>>>>>> we had
>>>>>>> worked around earlier in the user space inside the thunk library.
>>>>>>>
>>>>>>> Additionally, we faced this issue when using CRIU to checkpoint
>>>>>>> restore
>>>>>>> an application that had such inherited mappings in the child which
>>>>>>> confuse CRIU when it mmaps on restore. Having this flag set for the
>>>>>>> render node VMAs helps. VMAs mapped via KFD already take care of
>>>>>>> this so
>>>>>>> this is needed only for the render nodes.
>>>>>> Unfortunately that is most likely a NAK. We already tried
>>>>>> something similar.
>>>>>>
>>>>>> While it is illegal by the OpenGL specification and doesn't work
>>>>>> for most userspace stacks, we do have some implementations which
>>>>>> call fork() with a GL context open and expect it to work.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>>>
>>>>>>> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
>>>>>>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/drm_gem.c       | 3 ++-
>>>>>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>>>>>>>    2 files changed, 3 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>>>> index 09c820045859..d9c4149f36dd 100644
>>>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>>>> @@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object
>>>>>>> *obj, unsigned long obj_size,
>>>>>>>                goto err_drm_gem_object_put;
>>>>>>>            }
>>>>>>>    -        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND |
>>>>>>> VM_DONTDUMP;
>>>>>>> +        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND
>>>>>>> +                | VM_DONTDUMP | VM_DONTCOPY;
>>>>>>>            vma->vm_page_prot =
>>>>>>> pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>>>>>>            vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>>>>>>        }
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> index 33680c94127c..420a4898fdd2 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> @@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct
>>>>>>> *vma, struct ttm_buffer_object *bo)
>>>>>>>          vma->vm_private_data = bo;
>>>>>>>    -    vma->vm_flags |= VM_PFNMAP;
>>>>>>> +    vma->vm_flags |= VM_PFNMAP | VM_DONTCOPY;
>>>>>>>        vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>>>>>>>        return 0;
>>>>>>>    }

