Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC43546F31A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 19:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B628310E21F;
	Thu,  9 Dec 2021 18:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BECB10E21D;
 Thu,  9 Dec 2021 18:28:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3pfgvGARiUIt2VFzR+TQQlfaA8ofEKmqcNuljTmnlZ1aN8HNEdBuGCJkQAPI2VkzTDaPJHVbKizdKh6HrucRCiL+GdBaJ0NWR/2g6fe0Gc7nqFZILpc/86D7j8uSFpHh7LXbnQ3ykp82UESD3fAfB56h8Lk/V5BE8G9wEdM8cYj9aWhG9YwTAEh5jSdtluuTMCXsNAGyiQzQLLbNQD6v98WXL9OmRLgJlSu7H9wNT9Qg6oZ7YfOTKbgJ78KHtXeidwq2cxFj13qzBcamS00S8nRtY+v+fSCmmG2LPvlad1KJ46vqflbOzK6wU7ZhH9GP5vdRqAR5XQBMbydTpkU6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt6r10j56ZLDHfr5omSNIq/OBlqW+DlenXD7jg4Apl4=;
 b=nCSBm5MOlA2xFTJYC6B0oKwqQnBMumtHElcUVHgE3XggS5C+WtTvRsqU8leEpke2eBouhEcM4P+qttmBn+t+jO3kyI6a+xGVSZvRaQ2lVcWBwfUFVrz+4MTRsAc7YT/A59lFlxfuyjwZWV62dhCz5h4NpPvoID0//cBDhGCmSzMzT1uIgQV+W6YjXH6NVZcT28Ysab0gOeLa+rMN+QWWcC2/TLgzBdraqlSKniteTrw37bGMACZHXRX9i8YSDnn9gXPO/nrGB5wgKO9milKn0J+QJP21WBI2gS7ZM/Umir7xieA8q86rR7tftmG2QcpjnDZcDWdz8pU4pwrOxvnKbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt6r10j56ZLDHfr5omSNIq/OBlqW+DlenXD7jg4Apl4=;
 b=uWVC5kkVeIIYelT+VmnV1D4KvLCtWFfPnkVswbgQKyMoYwLGZmrg4RJV0aQPyeVz2QAqUlsFc/Jr/kphW0Fdgb6CyKcUopDbc0P+cM85/0qW1PdjI6GFJw97V3HRk6uTfTtov8WVkdC4l3g68DMCipaK6fmCxzLX2HCYBQs73sQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5337.namprd12.prod.outlook.com (2603:10b6:408:102::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Thu, 9 Dec
 2021 18:28:12 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%7]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 18:28:11 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
Date: Thu, 9 Dec 2021 13:28:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.127.191.123) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.20 via Frontend Transport; Thu, 9 Dec 2021 18:28:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c21fe7a-3ea1-4dc4-89a6-08d9bb41a7f9
X-MS-TrafficTypeDiagnostic: BN9PR12MB5337:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB533724C48108356B99C500FA92709@BN9PR12MB5337.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ag2DmcHIaDkK5NREZju+NysSusQDBGzse3y8HkVUW7+HGbzmmfqxviQdI/isbBJkdR1eKY7pMq45dQLl5rXxRCq0dlgkH/2f+j3TkQed74E3VeSrtEx8MprRSj8Yuj8cfkLS9BoRM8np2uSh2Yx/iYbC0aiHJsAPkP6UIHawXv/1Y7uii8646sP+OLOjzeBV9gSplTVrVkAZVl74a5OnVHGtqV0aR8C65ox0A37aLoVJ9mlUwxvEFDNmyu3Zhv3qC5A98ftrmaC3+d4ddu9i3YH2CUmGrEGDBlKrHozSYdDBGWC3Yae2sISJfcpwKVQKDQFekc1IwqWOjhMcjYdBxHaDN0QYjMICe/4ZsUAVG6dj8nOTIuQnSDlVEtZX69F+KvgbAkMd1ZKQuGKDpkoK2Ys2eGYxCEOw6OmN1Aq3kWAn4TY+cfFG8lTibWctsIZE2STYkOYsWDeeJYXWKmf7znT0vLpqjtL9EP7tPb4OK/pZ7u2CrSNG25h7BMZHr02FheLanKu2BuKgEKfxGquQYzHlPszKgBI7T5Wonu2eaiec7mpwKBb0Eh+iH+2LTrmYwfqw4dymsu//Oihx3e9cl39F1NzIZWUJEqdrOvE1traTWaT02kjciE5n3dw/vaSc2Lg/8WAxPSjeCEGbOmrCNImQhK7ZbKMzu7LK9sUkok3R5TaYlj8mBj0xOWPcICTchcGEDZf5TvDsvqrUaL4fGbQvIQuLVYE2kkWxQhmJyivyY7Hp4RikndvQ01zrtUk+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(186003)(16576012)(26005)(66574015)(31696002)(8676002)(44832011)(5660300002)(956004)(66946007)(66556008)(66476007)(53546011)(2616005)(36756003)(4326008)(110136005)(86362001)(508600001)(38100700002)(2906002)(6486002)(31686004)(8936002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFdKcUhPeXgvdzFmZkVRSlVaQllvMEZoWTNLOXBzWjlpL2ZTNDFMMHhXaFVr?=
 =?utf-8?B?OG1NcFIzblphNDIrMkNGeFhCSkxsY0pXR1cwMlFkTWt5TC9lblROcHZtODhX?=
 =?utf-8?B?NCtJMFJDOVJDZDZUSEJCdXhiRkJQWkFJRDF0bVp3alhZS3phdTFGZGhjZEs5?=
 =?utf-8?B?SUhUZnNxZFJmUXB0NlZNRmhHdEppVkJRSTJodjM5TUpsbm9KeE1JaE1jZVg2?=
 =?utf-8?B?WG9DZnNXdmo4UXJjaHNxK3NtSkNhSDl1UVRZdU5VVTJ0WDFXdk0zWWd2dmdI?=
 =?utf-8?B?T0Q2UDM4TjNiWkFlY3lBOUpURVN4U3lZZkI3M0hqUVp5cEdFaGpBN2pkdFpZ?=
 =?utf-8?B?aXd5R1hUWDlkNlo0SzhUNWFWYTdGWVJHUUpEVmtoR3I5U2V1NFVQL0J6bkto?=
 =?utf-8?B?STRhWExnRkUraWlTdWxqZmk0UTNmU0EzWlRLeDFsWFkwYVdpVktoSlpvd2kz?=
 =?utf-8?B?Q2tvTURSK09nL0g5Qm5pVnlVVWN1NlFrWXlyTWNXV3pOZ29hYVpzN0pNclhW?=
 =?utf-8?B?SGxhK0xWUXU5VUNabUhjTkNFYW9hOWwyQjhWOXBPUXZZdjE5M005SndnREVG?=
 =?utf-8?B?Yk5MeEt6d3c4cGxOTFBBeTE4WnBheUNxNjNURzk3MlV6K1dIMjR2SmVkUmtu?=
 =?utf-8?B?bFp2OU9Kc0RWZXc0ek5RUmJKZEFLbWpkMEZyK2xhcUlzWlIxK0IzTmdUQ0Fp?=
 =?utf-8?B?R0E5d2Y3Y2ZTQVF0cnpLNGErTjEzT3VLSlFlVkNzaWIzUWxVcnVvMW8yRURW?=
 =?utf-8?B?Rkpjb1lNVDZuR0c1L0tCSGhFYzdTeTJLYXY4TWU1WXZvZlNaMjY4K2thNGhU?=
 =?utf-8?B?YzFmMG84Ti80TlNVMFRoVUo3VU9OR0N0MzZUVytpWVd6dlVISVU5dFRzcGpX?=
 =?utf-8?B?Z3NjczQ2U2YvaUJjOUpLTW5qSnU0cTZldTM2SEFrYjJPS25lRm5vY0syTEll?=
 =?utf-8?B?TXRobVlqZjFhNFM0L014UXo3Q3djZnNhQ0RiS204cFh4UTY2am1XZjYzREhh?=
 =?utf-8?B?M0NEZnhHZUVGSWVyaGkvVHRYME9PWlpuNGxHME8rWlpEMWIwbEszcTlrYUpm?=
 =?utf-8?B?bW9jTExlL2pOalhadGFORFJvRGJOeFhIaHFYSGxzSFBhT2pOU2phK05IM1Ur?=
 =?utf-8?B?Vm9TQjFkSnQ5Lzg0SjJSYmcxdXdRNzNUMDlqbFZ3SDZDWHlLcVBZNlF1dGU1?=
 =?utf-8?B?bEFRSU5MQVUxT0M3QzRrYWZKbDBNWk9CMUtDVE54aE16NGxtQnRnemZ3S0Zj?=
 =?utf-8?B?N0p1dU9nd2VuZXQwNlBMd0xDNFJyYUpuUFFTclFDb1AzcG40RU9UOE9meUtn?=
 =?utf-8?B?b213UkdBL2puVk1sYUtNcGdzM29hMUlQWTEvK2NGTVN4Y0FPUVFBeTRkT3NK?=
 =?utf-8?B?K2ZrMUVGMkwvQklocXpQM3RhVmlkNG9qbE14dTl2a1lvc2RwMFcyTWx0SnA3?=
 =?utf-8?B?ODJNTFBCdWVuczJhQjl2YWsxVU4vZS9MazV2L0s3cU5CWnVaWGJ2OVZLdXYy?=
 =?utf-8?B?QjR2ZXBDMVY5OUxCSlMxaHNILzlPN2tDZUxhUllDZzAwd2RsbWNoNUZ1bjRy?=
 =?utf-8?B?QTlXTStxYjZKWWZ6d2k1RzhpdlNUVzBDVllBWVFVSjdjU3FxWlpWbUFCUlJD?=
 =?utf-8?B?elZmamV3Kzg1QmNDMVpwSGVjSXF5UGVOWWFNZzZSNk9Qc1UwS3lTWmRNV0JE?=
 =?utf-8?B?ZHJFWGkwd0RsK3JmdUNoRGUwZUFMZzZCc3RPenNOQy9ldUdUWnpwTG9scGlp?=
 =?utf-8?B?TEpXQnpNdnA3SDREVFpYekRYR0duZkU0TUk2MmE1TmdmVTZCMVN3dEREb1Zj?=
 =?utf-8?B?emxWUVd2Zmo0amtyNGszd1VkbkltUTBxb1NNbUNsT3prV2ZwMzhFT1dBdUht?=
 =?utf-8?B?SStmb01LQTZoYjkyS1pDc3ZuY1B3SGlVWDVwNGtxNGE5Q1N0cklMWGE2M2Vl?=
 =?utf-8?B?RmRmb2MvdkptTnh0NE15VnlraEVMN2NyRVZqaUpZRllNVzJ2Qi96ZEtpVEt3?=
 =?utf-8?B?cVFTaTg0QVBiMG9Ia0xIb2xUcFl5VEZxVHlWaFRUeXNJYTBiZlNONlU4Rzlt?=
 =?utf-8?B?Rm16eTNzKy9JUjduVGl5RURxWWprbzZJL29Pd1lIQjhMTjBYUG5rUzZ3K1Uy?=
 =?utf-8?B?RFpicjBvOThsNkl4Q0RnSWU0emswNGpPY3RIZDk5c2grd2lEQWJzN3JzNFha?=
 =?utf-8?Q?/e+boz6aR9uY8ReMac/V9u8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c21fe7a-3ea1-4dc4-89a6-08d9bb41a7f9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 18:28:11.7960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQInVTp2gyLnedTs3r8g6J0QeWi2j+N+S9iIp26RpNY5mFVM7xHc/U5PGZZ7CLSqDf9LwD/J2zVqgl0a0e9uWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5337
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

Am 2021-12-09 um 10:30 a.m. schrieb Christian König:
> That still won't work.
>
> But I think we could do this change for the amdgpu mmap callback only.

If graphics user mode has problems with it, we could even make this
specific to KFD BOs in the amdgpu_gem_object_mmap callback.

Regards,
  Felix


>
> Regards,
> Christian.
>
> Am 09.12.21 um 16:29 schrieb Bhardwaj, Rajneesh:
>> Sounds good. I will send a v2 with only ttm_bo_mmap_obj change. Thank
>> you!
>>
>> On 12/9/2021 10:27 AM, Christian König wrote:
>>> Hi Rajneesh,
>>>
>>> yes, separating this from the drm_gem_mmap_obj() change is certainly
>>> a good idea.
>>>
>>>> The child cannot access the BOs mapped by the parent anyway with
>>>> access restrictions applied
>>>
>>> exactly that is not correct. That behavior is actively used by some
>>> userspace stacks as far as I know.
>>>
>>> Regards,
>>> Christian.
>>>
>>> Am 09.12.21 um 16:23 schrieb Bhardwaj, Rajneesh:
>>>> Thanks Christian. Would it make it less intrusive if I just use the
>>>> flag for ttm bo mmap and remove the drm_gem_mmap_obj change from
>>>> this patch? For our use case, just the ttm_bo_mmap_obj change
>>>> should suffice and we don't want to put any more work arounds in
>>>> the user space (thunk, in our case).
>>>>
>>>> The child cannot access the BOs mapped by the parent anyway with
>>>> access restrictions applied so I wonder why even inherit the vma?
>>>>
>>>> On 12/9/2021 2:54 AM, Christian König wrote:
>>>>> Am 08.12.21 um 21:53 schrieb Rajneesh Bhardwaj:
>>>>>> When an application having open file access to a node forks, its
>>>>>> shared
>>>>>> mappings also get reflected in the address space of child process
>>>>>> even
>>>>>> though it cannot access them with the object permissions applied.
>>>>>> With the
>>>>>> existing permission checks on the gem objects, it might be
>>>>>> reasonable to
>>>>>> also create the VMAs with VM_DONTCOPY flag so a user space
>>>>>> application
>>>>>> doesn't need to explicitly call the madvise(addr, len,
>>>>>> MADV_DONTFORK)
>>>>>> system call to prevent the pages in the mapped range to appear in
>>>>>> the
>>>>>> address space of the child process. It also prevents the memory
>>>>>> leaks
>>>>>> due to additional reference counts on the mapped BOs in the child
>>>>>> process that prevented freeing the memory in the parent for which
>>>>>> we had
>>>>>> worked around earlier in the user space inside the thunk library.
>>>>>>
>>>>>> Additionally, we faced this issue when using CRIU to checkpoint
>>>>>> restore
>>>>>> an application that had such inherited mappings in the child which
>>>>>> confuse CRIU when it mmaps on restore. Having this flag set for the
>>>>>> render node VMAs helps. VMAs mapped via KFD already take care of
>>>>>> this so
>>>>>> this is needed only for the render nodes.
>>>>>
>>>>> Unfortunately that is most likely a NAK. We already tried
>>>>> something similar.
>>>>>
>>>>> While it is illegal by the OpenGL specification and doesn't work
>>>>> for most userspace stacks, we do have some implementations which
>>>>> call fork() with a GL context open and expect it to work.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>>
>>>>>> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
>>>>>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/drm_gem.c       | 3 ++-
>>>>>>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>>>>>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>>> index 09c820045859..d9c4149f36dd 100644
>>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>>> @@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object
>>>>>> *obj, unsigned long obj_size,
>>>>>>               goto err_drm_gem_object_put;
>>>>>>           }
>>>>>>   -        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND |
>>>>>> VM_DONTDUMP;
>>>>>> +        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND
>>>>>> +                | VM_DONTDUMP | VM_DONTCOPY;
>>>>>>           vma->vm_page_prot =
>>>>>> pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>>>>>           vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>>>>>       }
>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>> index 33680c94127c..420a4898fdd2 100644
>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>> @@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct
>>>>>> *vma, struct ttm_buffer_object *bo)
>>>>>>         vma->vm_private_data = bo;
>>>>>>   -    vma->vm_flags |= VM_PFNMAP;
>>>>>> +    vma->vm_flags |= VM_PFNMAP | VM_DONTCOPY;
>>>>>>       vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>>>>>>       return 0;
>>>>>>   }
>>>>>
>>>
>
