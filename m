Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B04DB372
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 15:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7EB10E5EC;
	Wed, 16 Mar 2022 14:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD5610E5EC;
 Wed, 16 Mar 2022 14:39:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAsPhhKYqXsDLLLw83+lD2GAQoYvDZJdhz5ziz7VB2a7e3/B7YPlEkwO7z2inhUy3dC1GIwtaV91pNQGy+WmLD4p0Gjs6srvypN/8tCClDPK1zGOWtN5mFn68umUeqxJqZFP2UL/Gr+XwexRhihMdL8cwtvrNP84aZfck8HGoXjRW+dOpLohORpNNoXOhUCWx/EmwDkSnLGZ2g2Bce/rlpKqSw+6vuKY23OjyZzOexSWYJEAHEi+Zjg3vx+7P1rXOhwRcA9r9lCUCBKoHlE469TjTaJIYQnubddoPo5M5bQF6YAzlHbscsutR8/6wJxSw+hKu//dzukXeYgJr6J5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVgpYaZ/ZiMZkfbylLTmqOCrXxoggQSQH5/M64+B6Q4=;
 b=E9P9CgIh9tJE+vsHXnBMvv4URKscvAA/5pU/qESjdMMFJaOKy6R6EoDxxqWXF8f04ZUT37onpHREbzRAPa/Fy/CDFEOhW1uICID5i176WgCGcxM4VvXAE0hAdGrtuU2kPAEkRNPXQrcMU18BJ/jnWms389e+be9heQtrgKHCR4Vr4ICEp4HOZchcjARyaV5gHziHuL4jxnASMEno5a4jh3uIU8HSMYMngz27efLQK5fd6CXWdf93FvpGpnxXgFZNXyeOrV7ULl5b4jJOhTC1XdMAlWhaXuZ7aAuzlxKWhPGYTxtNhK6TVVs5Nas3qqQxbGhs409SRodWmu4OYHy3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVgpYaZ/ZiMZkfbylLTmqOCrXxoggQSQH5/M64+B6Q4=;
 b=PyFQzAN7N7yJRSSLzr3N2kcQP5oovna2CtPc/ywddWZjtDfiAQCqib0unEYuuuBz0CotwMnYT0y0iDzg84of6TpQCrrUeC5xNyJY2Q8r/XhDxbi06AIP5GJaCaRUiVpEMJD7ej7hNftyoxFzEzVdd9mFgox1/0quxNU/zzhAF/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR1201MB2549.namprd12.prod.outlook.com (2603:10b6:903:da::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Wed, 16 Mar
 2022 14:39:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 14:39:29 +0000
Message-ID: <aedda268-8859-ab42-c276-d3b7cb0533fd@amd.com>
Date: Wed, 16 Mar 2022 15:39:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 5/7] drm/ttm: add range busy check for range manager
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
 intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220315180444.3327283-1-bob.beckett@collabora.com>
 <20220315180444.3327283-6-bob.beckett@collabora.com>
 <2918e4a2-3bb8-23e0-3b8c-90c620b82328@amd.com>
 <1eef3b71-ef7c-24d1-b0d7-695fc1d2d353@collabora.com>
 <2b5816aa-c082-b03a-c7a0-e4351e8e4e5a@amd.com>
 <2a364c03-d6d9-1ccd-2ecb-9ebf893f0860@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2a364c03-d6d9-1ccd-2ecb-9ebf893f0860@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0202CA0066.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::43) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0f04571-3b3b-4319-8965-08da075ac6cd
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2549:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2549469963782E81C0FE355983119@CY4PR1201MB2549.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ui48xTSYm+iJOPXPw0DDagwVl3BQQ2RURZDmE5i3d8TTMxU9j4OBGRgFWdxCVEZWj8UQjHUNkqzEGLcMud6urlKz+iHp+ZDpUL3OJwd8Y5sac1F2VlwfV+plmTZjstQlpxxtykyKS/F1ShPx+sfVm7kdViuLUddA6LlP6UjlLJW4QZozvUQeBnhFfD+vGRlLL5Euu3cY15hehPXGT/FhP5wdU7rKT4S6L8Jpt790YYwhYIvpTLTuI4jBXXPW55WrbJ/n3By4YCaVZr9yJVHhgR4r+Re3mzHJnrnAdzb3Qih8I1zXTQZTZVTx6JdjagEnwC6p7apbpDbH0fImNuyAPM+RMnLD64keQPwG5J7mGC896RMTxzyFLhtdHY5NwnKC3xaZY8ZyayLWvGVUe0s51yalED3AHEPDpLDSafKwIC+KBJlcY98Rlq4Ex0BbKtKI9wFOh2B7rchfIwmR2r/0Fr1Ww+0ka0QaE7+Hxhv2RjIqsgzeZcEDGLioN0ZAXpog09aqZonuKGbR61OvMCliBxKU8cqCKq3QLScezY/c9eEjX5q0Ms45G9AcKcP428DGJiO9b2t1IG9RcNc88MnXlcYKLcGU9IhvBLUsHEkqOUd4OJHSCs5qPMz0EQ6XTwFoikXmt+ZcMhHRJGSevZiN8lpKByikMiUOCiKNxfyea5UeAUq036qKbo90B30+TnWHBl9LBESt/pQ5TjP1b1gQlMzmxIo2P9Cca3Lrr5CLdj/mhlD2XAsFg9O4aqWhIPSw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(66946007)(31686004)(31696002)(5660300002)(2906002)(508600001)(36756003)(8936002)(66476007)(66556008)(2616005)(38100700002)(316002)(83380400001)(186003)(8676002)(86362001)(6486002)(6666004)(4326008)(110136005)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnVNMGZNSUVUZWlpTEZsOStrTW1FSmlobkdMSEl0ZjgvRGNJTm9kYjZRaldp?=
 =?utf-8?B?T0pKaUVTVlVCSko0amp4djB1ZDFxTkhrUWgyazc4K29xUFZiTWh4bUZDWFd1?=
 =?utf-8?B?QUg5VFJhUU5nd1poeDhXR2hwV2FuZGkxUkxra216LzhqRmd4bzlwOUU4MDNh?=
 =?utf-8?B?dzNwd2tNUlR2WWd3S0N2V0M1S09wcjhjSVhidEZ1anVpQVYvWWt0SkZUUWZq?=
 =?utf-8?B?ZlVRY1pNbzhmY2pobWtJNXlhazJGbFYyUEN2T3ZZSUJNa1RiTW8vNFhmL0NH?=
 =?utf-8?B?cnN1UnlZeGJxSGlUMzUzdGlUNUF4T2RXVjVnVjBCTCtMWmt0WWxack95SEdH?=
 =?utf-8?B?d0FXMXZIYnl1cEw1eGIzSHMrbE1xUXdsQWZrT1VrdlJtSE9QV3ZZcmh1NEVG?=
 =?utf-8?B?WVZxcVN6NXFzM2R3RXM3NytreXdxWHdrSlhpVWlyMW1SZ0VZYkxuOFFTWWJK?=
 =?utf-8?B?VnV0S2VIRTBQdUFqNXdKUXJXRGVIME10T0VoMFRtS3BDODM4ZFhUZUZtUU15?=
 =?utf-8?B?Y2JpTG5OVUxoQzFERnBlMVJJNnBEUW9nRTlJaysrU2t0SEpnOVRpMktqSW9V?=
 =?utf-8?B?eGY4dFdYQ0NIMzlwTXlnZThXY2dVb2dDbmRJeFBjT2Q2UXR5TmNPQm9rZk4y?=
 =?utf-8?B?bEl3WFRZRU9SN2VNdFN0M0djWHhaaGR1ZGs1UTBhU2pvSWhaWnBYVHZSM0dT?=
 =?utf-8?B?NFZpM0NTNTNaOVdTREk0bSt2SWpRZzJYRGwzV09EcHU3Umc0dmlob0ErVEl6?=
 =?utf-8?B?VGRvV2VVUldDaGY3Y0lCbkVJWmx1Wjl4TDhJQVVEREJuYnRKWDJLa1FnaDIw?=
 =?utf-8?B?aGUwa0FlUDJUcGlOQklVNGwyNEZDT1FCSTdXdmk5dXJzbVhjTDJwbnpFdHRx?=
 =?utf-8?B?dC8xMHVWNkwwUWZldnRBcTVZWGtUUU52MjgzK1Y2ZmFDMzN2UmkrZVRZMElF?=
 =?utf-8?B?OWhIUGtrUnlYeTRnMGM0U01sNkNtQmp0bnVEelIyY3g3amQxQTN0WkhXZ3oy?=
 =?utf-8?B?bDNqRWRnVG9VdVpwZHBTdi8zQkhhYlB0amhsRld0bXdNZ0FZVC9mTGhkb3Nk?=
 =?utf-8?B?Q2t0M1p3dmVtR0xxbm4zKzZmbFJHUzJoVzErZVdJN1BpNFFydFZMb3hHRi9T?=
 =?utf-8?B?SDcyTUV6OFozS2kzOFdjL0owcjJZNzBKK0ZkMDlaZ1Z1eVNLcGlydVVLL0FO?=
 =?utf-8?B?MWFKWG9oYVFkNWxXSnY1TThEMHhvY1lkZXY2MjFiL0ZpdUJXNjNqYkR1MnBz?=
 =?utf-8?B?dXAyYjZTWGV1eHR3MnBsMCtIWnNtNTRtdUtkdFYvTll2VHVNQnEzdG56bTNS?=
 =?utf-8?B?ZlVFaFpITStkaE9TSW9ZaWFzdk02dE5rN0NpQkc3REtxeUVUVnNJYzUzY0o2?=
 =?utf-8?B?NGQyTjY2cm9vVzBFbDJoamI5aHhBaHN2bE0wL21KT28vMmpXckhxSFNLK0ZY?=
 =?utf-8?B?STFDSTdsU2wxZVB5NXY3dDJZbXZRMWtZdWVUNGNvZGZLU2hWTTZwZnZPRmlE?=
 =?utf-8?B?aEJaNU5wclZmMUVoQithY3ZzMy93aW9xNWx5enRIaG1iYXBlK0RuMkY5SkFq?=
 =?utf-8?B?d2kvOUlkN1lZNUczRVlrNzhSVEZDOS9uZTUydEs2MGdBbjdjc1hrcC9RcEZN?=
 =?utf-8?B?Y3NwY01hN3VGNE1BZUluKysvc3hVQlkxVzNEQU80SmNuVG9nUVhLV0hXakVX?=
 =?utf-8?B?VG4wbk5FRlhYbG9Jb0l3MWlCdFU4clRiSmFhYmJSbm5kNmtSVHhmcGM5empI?=
 =?utf-8?B?QWIwcXdFRk1OdGw3dHlwaGRKckk4dUJMelNIcEVmWHNFNm5WaldWZjB5UnUx?=
 =?utf-8?B?OFlzUEZPVTc3c2NKNW5hNllDaEdUcXFGWW5PS0x4NlJJbUQxcnk0OWpYa3V3?=
 =?utf-8?B?SnBnQmZ1V21odkY5N3ZpaUR1d0EzTkdFS2VHc0Zpa2R3YTVYMlhKREl3VEFE?=
 =?utf-8?B?TTcyUzJSdkIrOFVTUnpoVlY5eFllZjFDT3krTnJrN1lkTU1ESjZ0TzRzblAy?=
 =?utf-8?B?Q1BJOExLakRFSndrb3ROZkdaWjdyNzZVS1kveWhiSHU4UXVJenl2bGVrNy9k?=
 =?utf-8?Q?FNvVc3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f04571-3b3b-4319-8965-08da075ac6cd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 14:39:29.2656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CC6lfnIWuqp8DulmzPXjHJgtAd3xNgiCTDJmQ24zYDRnBNPe56/nRUTyDEYy0ss2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2549
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.03.22 um 15:26 schrieb Robert Beckett:
>
> [SNIP]
> this is where I replace an existing range check via drm_mm with the 
> range check I added in this patch.

Mhm, I still don't get the use case from the code, but I don't think it 
matters any more.

>>> I suppose we could add another drm_mm range tracker just for testing 
>>> and shadow track each allocation in the range, but that seemed like 
>>> a lot of extra infrastructure for no general runtime use.
>>
>> I have no idea what you mean with that.
>
> I meant as a potential solution to tracking allocations without a 
> range check, we would need to add something external. e.g. adding a 
> shadow drm_mm range tracker, or a bitmask across the range, or stick 
> objects in a list etc.

Ah! So you are trying to get access to the drm_mm inside the 
ttm_range_manager and not add some additional range check function! Now 
I got your use case.

>>> would you mind explaining the rationale for removing range checks? 
>>> It seems to me like a natural fit for a memory manager
>>
>> TTM manages buffer objects and resources, not address space. The 
>> lpfn/fpfn parameter for the resource allocators are actually used as 
>> just two independent parameters and not define any range. We just 
>> keep the names for historical reasons.
>>
>> The only places we still use and compare them as ranges are 
>> ttm_resource_compat() and ttm_bo_eviction_valuable() and I already 
>> have patches to clean up those and move them into the backend 
>> resource handling.
>
> except the ttm_range_manager seems to still use them as a range specifier.

Yeah, because the range manager is the backend which handles ranges 
using the drm_mm :)

> If the general design going forward is to not consider ranges, how 
> would you recommend constructing buffers around pre-allocated regions 
> e.g. uefi frame buffers who's range is dictated externally?

Call ttm_bo_mem_space() with the fpfn/lpfn filled in as required. See 
function amdgpu_bo_create_kernel_at() for an example.

Regards,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>>>> ---
>>>>>   drivers/gpu/drm/ttm/ttm_range_manager.c | 21 +++++++++++++++++++++
>>>>>   include/drm/ttm/ttm_range_manager.h     |  3 +++
>>>>>   2 files changed, 24 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c 
>>>>> b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>> index 8cd4f3fb9f79..5662627bb933 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>> @@ -206,3 +206,24 @@ int ttm_range_man_fini_nocheck(struct 
>>>>> ttm_device *bdev,
>>>>>       return 0;
>>>>>   }
>>>>>   EXPORT_SYMBOL(ttm_range_man_fini_nocheck);
>>>>> +
>>>>> +/**
>>>>> + * ttm_range_man_range_busy - Check whether anything is allocated 
>>>>> with a range
>>>>> + *
>>>>> + * @man: memory manager to check
>>>>> + * @fpfn: first page number to check
>>>>> + * @lpfn: last page number to check
>>>>> + *
>>>>> + * Return: true if anything allocated within the range, false 
>>>>> otherwise.
>>>>> + */
>>>>> +bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
>>>>> +                  unsigned fpfn, unsigned lpfn)
>>>>> +{
>>>>> +    struct ttm_range_manager *rman = to_range_manager(man);
>>>>> +    struct drm_mm *mm = &rman->mm;
>>>>> +
>>>>> +    if (__drm_mm_interval_first(mm, PFN_PHYS(fpfn), PFN_PHYS(lpfn 
>>>>> + 1) - 1))
>>>>> +        return true;
>>>>> +    return false;
>>>>> +}
>>>>> +EXPORT_SYMBOL(ttm_range_man_range_busy);
>>>>> diff --git a/include/drm/ttm/ttm_range_manager.h 
>>>>> b/include/drm/ttm/ttm_range_manager.h
>>>>> index 7963b957e9ef..86794a3f9101 100644
>>>>> --- a/include/drm/ttm/ttm_range_manager.h
>>>>> +++ b/include/drm/ttm/ttm_range_manager.h
>>>>> @@ -53,4 +53,7 @@ static __always_inline int 
>>>>> ttm_range_man_fini(struct ttm_device *bdev,
>>>>>       BUILD_BUG_ON(__builtin_constant_p(type) && type >= 
>>>>> TTM_NUM_MEM_TYPES);
>>>>>       return ttm_range_man_fini_nocheck(bdev, type);
>>>>>   }
>>>>> +
>>>>> +bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
>>>>> +                  unsigned fpfn, unsigned lpfn);
>>>>>   #endif
>>>>
>>

