Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8E7DECF1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 07:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353BE10E813;
	Thu,  2 Nov 2023 06:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF0D10E811;
 Thu,  2 Nov 2023 06:41:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myr5fdP6FBKfVTTNKhy3JyFVZOKZMqnEYLyaVKqRDpAku9pWmGO0tFxenLEzS3jovfUgTb2EcB3/Z3lYeX7SJmh4qv9mQNrGnbOYV/u6ta5gPfGkV0iVaQLvi8Nrj6OdLpj/I0FzPW7CJKfw33XzQz6xOi9fMPQ43yQ9+NqCXStpzHKC1fpCc5zU1dTAx8nGxFRVpIyvoEm3XrsbY2BfW/bZD3EKYcEhhMKsGlB2E4EGTiaQ+A5gcbvC/5GntjNswd1QsuPR0L25ReVfG7Fky/KmPSt12ITIaE9ujSF8bxLO9gWp1tPYI027Ef+SRtCSu6nn2TOpU8iWmm+SAp7exA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IM6O+dlRFc0GqblUe2yNqP60t/q1ZAgTfRPC6DQZq4E=;
 b=X6CZBFJ3EBHgU9sIICxJKANRd+wkSweUcbzBHki3+4MGvJI2YLDJ+gD4xgyOQ/8oSsSXIRvTvpRyugTTqT549wyZAq6JSv2gLdSoQmzNLnM7WhYGrErpSezwolIPseGCQVa6J1XY3IRZOnmOa/e6C9T8JSYfYdRoqWuv6C6xfK3g1uFcbdrrLH8lMRI/eeI9xsS7lMQ8Mj/vIJc2L6qTdAqm+68fFQ9+GSXemKmi/Mrq1+DF8O66pN/SMav/L70NBTUYrIAWbsa7UaSsg4rE0xkBeW3VZzBnOoqDGz9Rn8tE3vtL5ubYs/zrTysgL4AS4o/5mq1NHBRqUpbVWAwDFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM6O+dlRFc0GqblUe2yNqP60t/q1ZAgTfRPC6DQZq4E=;
 b=l6ZmfD1rPDpLQuPbsRZCcvyrlDvL5mSg2rYspdzlaCNlFvCkztyZzCzjlt8N7tLd7PH+HVHX8wvsTkyfJKBpLP9RPmtzSd2DQ/b1XLfejdNugqUOoA3RJ3aX3NMic1TKx7Ui3VRJAMAgmBkdjhHr+nYJ4kpPphGgec7V+6oJvLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 06:41:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.029; Thu, 2 Nov 2023
 06:41:35 +0000
Message-ID: <f05a354c-31f9-46b9-b8ab-ca35d4846eca@amd.com>
Date: Thu, 2 Nov 2023 07:41:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/amdgpu: Flush VM updates for split bindings
 eagerly.
Content-Language: en-US
To: Lang Yu <Lang.Yu@amd.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-4-ishitatsuyuki@gmail.com>
 <30bcd9b7-903d-435e-9318-346777a3fd55@amd.com>
 <CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=WkBpJyJrmqZ=rtMA@mail.gmail.com>
 <ffafa427-e755-4f86-8aab-8e69ef63325a@amd.com>
 <ZUMLKh8xn0lDRRD5@lang-desktop>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZUMLKh8xn0lDRRD5@lang-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0232.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a5a6df2-f6f1-4729-16dd-08dbdb6ec196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ln6ltuqz9AI8MLOjXRsGhbhSX0y1Ia3TRsrt4MlxMN3bK5iz+yjhJvdgD+wMjMmZICiJ7X/K9bASrWKaRXERF7gN7ebzWELRM8VJQOYwPwWOfI5k92Cjm0Ej61Zak4vnhhCsP6y6xfCO8iGl3uajehBJoM9t4xXAKeV09L6LgWdhfDt+Cs2GcRfqmFw1wVEVCCvAFu1Oby/MHLOmdVj/Laaea0+VeQx+wBI04/m18QvJP+aVvc6CSfhrHMXrLediscqoZ4yhXZ2AmqsqvtH52TDGI8Xg1UWGBDJbV3xhUGJHhH0Mp/Ur9Smvp7W5G4z1DVoQESEeo6W2m2bWLXDJKe13YpBQuefvqXjtgYVZ9bf+YkxtPxMlubOeAngzSJK7g6gTT1HxdQteBGsiX92II3mEj4G1+EpPkgWsiUQzNyXe22fDKpk/datS6PPz/ryWsSAm9H1JkeFdtj+RB4wPa2UyorGO8CAQlcBYfwbZ7eiEnFAfn5A6lF7bc83MWZxauXqNVpMm47SdtFTMZmgy8yUHQ3KS2C03lnwnqCi3fOYujW49NRg20mXY31XIqvZnc7PEB5Ehz+eSMMArTIUE1sc9JsZD/Kz3B/Qs+1UZW5xggFEHevUdrYxJXTmQaraWYMNHpG26oRo48Fwb0PfHUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(31686004)(26005)(6512007)(2616005)(31696002)(38100700002)(2906002)(36756003)(86362001)(66574015)(30864003)(83380400001)(15650500001)(5660300002)(54906003)(6506007)(6666004)(8676002)(6862004)(8936002)(4326008)(66476007)(41300700001)(66946007)(316002)(6636002)(53546011)(478600001)(6486002)(37006003)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHZvNC9nck5ZdnFGN3V0eXNqM2NnNnkvbDJ4KzJMYUdKcWlHNkV0UnV6ZHpU?=
 =?utf-8?B?ZGZTOEE0bVoyUERpamJpT1FYdm1kcnBIbmt5ZkJjUm9nZjh6cXg1cUlWNjFn?=
 =?utf-8?B?SnNoTlNBRjM2NnFKZnVMU3N6enJFNEUrUkIwaFFlazk3bXBKTks3NVJFSTFz?=
 =?utf-8?B?RCtiOXE1TUZma1Fvdzl3SkhSbUFFQzVQQkJpQllVWjFMOUZueTRpVmN6c3N4?=
 =?utf-8?B?OGRBUzZCSjMyQWIrUFNXbDVFVXFVbXkzVi9kTU9BZ2F2N25HbFJ6dHNOU3lK?=
 =?utf-8?B?Y2dwbGdFZE1FemZmaWkvQU0zYVZ5WkJJNTRtN3BVU2VGR21uL3A5MHdmMDhi?=
 =?utf-8?B?azQ5bUVKdkg3TW1YN0ZVeFhlSzk1eUJvcVhUZ2g2ZnQ5Y2EzSmthTDNTUWNy?=
 =?utf-8?B?M0pnZkxqNnJzeGJhbUtMd2RHNDdXREI0ci9ZanRockRWejZrU3JFWW5MMC9i?=
 =?utf-8?B?KzZsSU94bUppeG45TjdmTHpZYStNMDNUTjJobmlER0FHR0JaUUVTbDF2ZnFa?=
 =?utf-8?B?a1J4QkEwZ3YvelRPUHRIQzc0TnNTem5CZ3o4VzVzN2JwZ3g4NE1Fc0puWmZK?=
 =?utf-8?B?czFjR0F1QmZqOEk3U2VhRFVyMzlMMnRIck1iSmpKY3hpMUxhMVN5Y2tPdElZ?=
 =?utf-8?B?aktGamQ5c0xxbkp4WVdjVzdwTzNwMmNRS3ZKa3BoSFJkUlRoRjVnQXRkRHIw?=
 =?utf-8?B?c05FV2doeWFxOGVva1ZIY0diMUpCL0ZWSk5SSHJ6cllrU3o2TmpjWVM1dUNr?=
 =?utf-8?B?ampuSXpkb005QjBoK1NDN0FiWkVBTjYwRVNFQlFvNHRjUXFNSElLYWEzRG5x?=
 =?utf-8?B?NVE1d0tRQzAwejlnZzhJK2ErNWljL0ZpRVJrbmIxYnNUK1I4MzFHb2NuUFdz?=
 =?utf-8?B?Qk4xM2lKVmNZekpGTnZDOG9jcWJLd0FXdFRSU1JLbGVoL1E4eGRMNlQwa3pN?=
 =?utf-8?B?RHFFanR4MmVlcnZjQ1I4UmhwZWI3RFJsSzFKNnJFeURRN2R2VG9aZnBEQzE4?=
 =?utf-8?B?SVhDdmlxUVFiYnhlY0RnSDVxbExDQlAxTGxrOHFrSnZnalp1WTliWnpUNUpw?=
 =?utf-8?B?SUJaeThKejBpVFVLeHJqaWJnSTAvQzZxMEJubnd2NmtTQ2NNb3d4RE9DZDQv?=
 =?utf-8?B?NjYvL08yTi9zMm4rS3Z0QnY2d2JFQTJ0bk1YaDlSTmJqVU9WUjQwMXNha05U?=
 =?utf-8?B?RkUvOEdkbG02eDV0ZHpHV1RhaG1sdXE3RHpudEszZEhrYlJhMFgrdFRaaHU3?=
 =?utf-8?B?VWtuUjg1aWZ6R2FDWGZ4YWZ3TitPVlhHS1ZQU0l2THliV1VINVlwcGFnSmMy?=
 =?utf-8?B?SWpVRHRoMUhtY3k4cWZkUlVGd1hjZERWZlJ4SDczUGNIazV4aEdsaXFRbDc0?=
 =?utf-8?B?VjNHdk80emZwbllNVk9DQzc2L2VNVmZiczVrZ2xTMUxWUTZYM1lsT3MyM0Z6?=
 =?utf-8?B?bkhnNDhtU0RYeitzNGhGb2NqcWRkM1hObzF0SllVdmZSQXd4ZGs0ZCthck12?=
 =?utf-8?B?ZUxBMFRaS0Q1aEg0V2VKbGI5VmJYUVFhOGlCbC9iK1NTY1lDUWFSeEJSd0Zy?=
 =?utf-8?B?dGRhTFNJa0ZTTFRVbUZ2azVwZHRLdWhVWGg1YnMxeGRrWEpDNjBTUnBENzkw?=
 =?utf-8?B?c2p6bVJ1c1AxN2Vxai9SVklGY3E5S2txK0lkVjdkYnc5U05aSU5qS3kvSW42?=
 =?utf-8?B?dml6clRob2lzSmtUWTZvQ2VDYTdjSkpIRUFZUjZMSE1VMXUxOWxZZHV0U29W?=
 =?utf-8?B?UVNQdTExMnJ0YWZ5M0cxQzMrcUZRQktndG5RUnJzMk0xSXZqaFl2Y0hRbXo1?=
 =?utf-8?B?dGd6amRlU3daZmxvZXB0QmZ6UG5kcWN2YlFRdHZHdWNqMUtJY0o3MFhCN1pX?=
 =?utf-8?B?eHRLZTlHcG9teWNpVFIySmxJbVpoTEQ1ZzBTeXo3V3U2MGhFOGlXRUl5amlX?=
 =?utf-8?B?NzIxNjdZc000MVpraDZic1VqMmszdE9MZGFvYWR5ZTV6OW15VkEzcnVxNnVS?=
 =?utf-8?B?VEcyTS9SVklqYWpaT01aMlhtcTJXc2Q2RVRHWkRxTVRQcHpVYkFkUThrenE0?=
 =?utf-8?B?NkE3UWc5cEI1V3VLQ2ZKMGNvVFZMaTM3NG1HN1kySGg0SGYyRFhFb3hielhC?=
 =?utf-8?Q?JEP8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5a6df2-f6f1-4729-16dd-08dbdb6ec196
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 06:41:34.6490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P989DzZKCcwFmL1nBwRMxgTLL72ePzWboDfJvV6W7uXG7tK8Z2ve34dcaUnsumIM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8412
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
Cc: dri-devel@lists.freedesktop.org, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.11.23 um 03:36 schrieb Lang Yu:
> On 10/31/ , Christian König wrote:
>> Am 31.10.23 um 14:59 schrieb Bas Nieuwenhuizen:
>>>
>>> On Tue, Oct 31, 2023 at 2:57 PM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>
>>>      Am 31.10.23 um 14:40 schrieb Tatsuyuki Ishi:
>>>      > The current amdgpu_gem_va_update_vm only tries to perform
>>>      updates for the
>>>      > BO specified in the GEM ioctl; however, when a binding is split, the
>>>      > adjacent bindings also need to be updated. Such updates
>>>      currently ends up
>>>      > getting deferred until next submission which causes stalls.
>>>
>>>      Yeah, that is a necessity. The hardware simply doesn't support
>>>      what you
>>>      try to do here in all cases.
>>>
>>>
>>> What can the hardware not do here? Is this just needing to wait for TLB
>>> flushes before we can free pagetables, can we just delay that?
>> On some hardware generations (especially Navi1x, but also everything older
>> than Polaris) you can't invalidate the TLB while it is in use.
> Hi Christian,
>
> non-legacy invalidation can invalidate the TLB while it is in use.
> Right? Thanks.

Right, the problem is that they are only available starting with Vega 
(for GFX8 they only work for the APUs IIRC).

Regards,
Christian.

>
> Regards,
> Lang
>
>> For Polaris and older it just means that you don't have a guarantee that the
>> shader can't access the memory any more. So delaying the free operation
>> helps here.
>>
>> But for Navi1x it's a workaround for a hardware bug. If you try to
>> invalidate the TLB while it is in use you can potentially triggering memory
>> accesses to random addresses.
>>
>> That's why we still delay TLB invalidation's to the next CS and use a new
>> VMID for each submission instead of invalidating the old one.
>>
>> I'm currently working on changing that for Navi2x and newer (maybe Vega as
>> well), but this is something you can really only do on some hw generations
>> after validating that it works.
>>
>> Regards,
>> Christian.
>>
>>>
>>>      So this approach won't work in general.
>>>
>>>      Regards,
>>>      Christian.
>>>
>>>      >
>>>      > Introduce a new state "dirty", shared between per-VM BOs and
>>>      traditional
>>>      > BOs, containing all BOs that have pending updates in `invalids`.
>>>      > amdgpu_gem_va_update_vm will now simply flush any pending
>>>      updates for BOs
>>>      > in the dirty state.
>>>      >
>>>      > Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
>>>      > ---
>>>      >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 18 ++++---
>>>      >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 66
>>>      ++++++++++++++++++-------
>>>      >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  3 ++
>>>      >   3 files changed, 63 insertions(+), 24 deletions(-)
>>>      >
>>>      > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>      b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>      > index a1b15d0d6c48..01d3a97248b0 100644
>>>      > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>      > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>      > @@ -604,10 +604,9 @@ int amdgpu_gem_metadata_ioctl(struct
>>>      drm_device *dev, void *data,
>>>      >    * vital here, so they are not reported back to userspace.
>>>      >    */
>>>      >   static void amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
>>>      > -                                 struct amdgpu_vm *vm,
>>>      > -                                 struct amdgpu_bo_va *bo_va,
>>>      > -                                 uint32_t operation)
>>>      > +                                 struct amdgpu_vm *vm)
>>>      >   {
>>>      > +     struct amdgpu_bo_va *bo_va;
>>>      >       int r;
>>>      >
>>>      >       if (!amdgpu_vm_ready(vm))
>>>      > @@ -617,12 +616,18 @@ static void amdgpu_gem_va_update_vm(struct
>>>      amdgpu_device *adev,
>>>      >       if (r)
>>>      >               goto error;
>>>      >
>>>      > -     if (operation == AMDGPU_VA_OP_MAP ||
>>>      > -         operation == AMDGPU_VA_OP_REPLACE) {
>>>      > +     spin_lock(&vm->status_lock);
>>>      > +     while (!list_empty(&vm->dirty)) {
>>>      > +             bo_va = list_first_entry(&vm->dirty, struct
>>>      amdgpu_bo_va,
>>>      > +                                      base.vm_status);
>>>      > +             spin_unlock(&vm->status_lock);
>>>      > +
>>>      >               r = amdgpu_vm_bo_update(adev, bo_va, false);
>>>      >               if (r)
>>>      >                       goto error;
>>>      > +             spin_lock(&vm->status_lock);
>>>      >       }
>>>      > +     spin_unlock(&vm->status_lock);
>>>      >
>>>      >       r = amdgpu_vm_update_pdes(adev, vm, false);
>>>      >
>>>      > @@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct drm_device
>>>      *dev, void *data,
>>>      >               break;
>>>      >       }
>>>      >       if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) &&
>>>      !amdgpu_vm_debug)
>>>      > -             amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
>>>      > -  args->operation);
>>>      > +             amdgpu_gem_va_update_vm(adev, &fpriv->vm);
>>>      >
>>>      >   error:
>>>      >       drm_exec_fini(&exec);
>>>      > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>      b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>      > index dd6f72e2a1d6..01d31891cd05 100644
>>>      > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>      > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>      > @@ -191,6 +191,21 @@ static void amdgpu_vm_bo_set_evicted(struct
>>>      amdgpu_vm_bo_base *vm_bo, bool evict
>>>      >       spin_unlock(&vm_bo->vm->status_lock);
>>>      >   }
>>>      >
>>>      > +/**
>>>      > + * amdgpu_vm_bo_dirty - vm_bo is dirty
>>>      > + *
>>>      > + * @vm_bo: vm_bo which is dirty
>>>      > + *
>>>      > + * State for normal and per VM BOs that are not moved, but have
>>>      new entries in
>>>      > + * bo_va->invalids.
>>>      > + */
>>>      > +static void amdgpu_vm_bo_dirty(struct amdgpu_vm_bo_base *vm_bo)
>>>      > +{
>>>      > +     spin_lock(&vm_bo->vm->status_lock);
>>>      > +     list_move(&vm_bo->vm_status, &vm_bo->vm->dirty);
>>>      > +     spin_unlock(&vm_bo->vm->status_lock);
>>>      > +}
>>>      > +
>>>      >   /**
>>>      >    * amdgpu_vm_bo_moved - vm_bo is moved
>>>      >    *
>>>      > @@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct amdgpu_vm
>>>      *vm,
>>>      >       list_for_each_entry_safe(bo_va, tmp, &vm->evicted,
>>>      base.eviction_status)
>>>      >               amdgpu_vm_bo_get_memory(bo_va, stats);
>>>      >
>>>      > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty,
>>>      base.vm_status)
>>>      > +             amdgpu_vm_bo_get_memory(bo_va, stats);
>>>      > +
>>>      >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated,
>>>      base.vm_status)
>>>      >               amdgpu_vm_bo_get_memory(bo_va, stats);
>>>      >
>>>      > @@ -1411,6 +1429,17 @@ int amdgpu_vm_handle_moved(struct
>>>      amdgpu_device *adev,
>>>      >                       dma_resv_unlock(resv);
>>>      >               spin_lock(&vm->status_lock);
>>>      >       }
>>>      > +
>>>      > +     while (!list_empty(&vm->dirty)) {
>>>      > +             bo_va = list_first_entry(&vm->dirty, struct
>>>      amdgpu_bo_va,
>>>      > +                                      base.vm_status);
>>>      > +             spin_unlock(&vm->status_lock);
>>>      > +
>>>      > +             r = amdgpu_vm_bo_update(adev, bo_va, false);
>>>      > +             if (r)
>>>      > +                     return r;
>>>      > +             spin_lock(&vm->status_lock);
>>>      > +     }
>>>      >       spin_unlock(&vm->status_lock);
>>>      >
>>>      >       return 0;
>>>      > @@ -1476,19 +1505,16 @@ static void
>>>      amdgpu_vm_bo_insert_map(struct amdgpu_device *adev,
>>>      >                                   struct amdgpu_bo_va_mapping
>>>      *mapping)
>>>      >   {
>>>      >       struct amdgpu_vm *vm = bo_va->base.vm;
>>>      > -     struct amdgpu_bo *bo = bo_va->base.bo <http://base.bo>;
>>>      >
>>>      >       mapping->bo_va = bo_va;
>>>      >       list_add(&mapping->list, &bo_va->invalids);
>>>      >       amdgpu_vm_it_insert(mapping, &vm->va);
>>>      > +     if (!bo_va->base.moved)
>>>      > +             amdgpu_vm_bo_dirty(&bo_va->base);
>>>      >
>>>      >       if (mapping->flags & AMDGPU_PTE_PRT)
>>>      >               amdgpu_vm_prt_get(adev);
>>>      >
>>>      > -     if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
>>>      > -         !bo_va->base.moved) {
>>>      > -             amdgpu_vm_bo_moved(&bo_va->base);
>>>      > -     }
>>>      >       trace_amdgpu_vm_bo_map(bo_va, mapping);
>>>      >   }
>>>      >
>>>      > @@ -1725,6 +1751,8 @@ int amdgpu_vm_bo_clear_mappings(struct
>>>      amdgpu_device *adev,
>>>      >                       before->flags = tmp->flags;
>>>      >                       before->bo_va = tmp->bo_va;
>>>      >                       list_add(&before->list,
>>>      &tmp->bo_va->invalids);
>>>      > +                     if (!tmp->bo_va->base.moved)
>>>      > +  amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>>>      >               }
>>>      >
>>>      >               /* Remember mapping split at the end */
>>>      > @@ -1736,6 +1764,8 @@ int amdgpu_vm_bo_clear_mappings(struct
>>>      amdgpu_device *adev,
>>>      >                       after->flags = tmp->flags;
>>>      >                       after->bo_va = tmp->bo_va;
>>>      >                       list_add(&after->list, &tmp->bo_va->invalids);
>>>      > +                     if (!tmp->bo_va->base.moved)
>>>      > +  amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>>>      >               }
>>>      >
>>>      >               list_del(&tmp->list);
>>>      > @@ -1761,30 +1791,18 @@ int amdgpu_vm_bo_clear_mappings(struct
>>>      amdgpu_device *adev,
>>>      >
>>>      >       /* Insert partial mapping before the range */
>>>      >       if (!list_empty(&before->list)) {
>>>      > -             struct amdgpu_bo *bo = before->bo_va->base.bo
>>>      <http://base.bo>;
>>>      > -
>>>      >               amdgpu_vm_it_insert(before, &vm->va);
>>>      >               if (before->flags & AMDGPU_PTE_PRT)
>>>      >                       amdgpu_vm_prt_get(adev);
>>>      > -
>>>      > -             if (bo && bo->tbo.base.resv ==
>>>      vm->root.bo->tbo.base.resv &&
>>>      > -                 !before->bo_va->base.moved)
>>>      > -  amdgpu_vm_bo_moved(&before->bo_va->base);
>>>      >       } else {
>>>      >               kfree(before);
>>>      >       }
>>>      >
>>>      >       /* Insert partial mapping after the range */
>>>      >       if (!list_empty(&after->list)) {
>>>      > -             struct amdgpu_bo *bo = after->bo_va->base.bo
>>>      <http://base.bo>;
>>>      > -
>>>      >               amdgpu_vm_it_insert(after, &vm->va);
>>>      >               if (after->flags & AMDGPU_PTE_PRT)
>>>      >                       amdgpu_vm_prt_get(adev);
>>>      > -
>>>      > -             if (bo && bo->tbo.base.resv ==
>>>      vm->root.bo->tbo.base.resv &&
>>>      > -                 !after->bo_va->base.moved)
>>>      > -  amdgpu_vm_bo_moved(&after->bo_va->base);
>>>      >       } else {
>>>      >               kfree(after);
>>>      >       }
>>>      > @@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct amdgpu_device
>>>      *adev, struct amdgpu_vm *vm, int32_t xcp
>>>      >       INIT_LIST_HEAD(&vm->evicted);
>>>      >       INIT_LIST_HEAD(&vm->relocated);
>>>      >       INIT_LIST_HEAD(&vm->moved);
>>>      > +     INIT_LIST_HEAD(&vm->dirty);
>>>      >       INIT_LIST_HEAD(&vm->idle);
>>>      >       INIT_LIST_HEAD(&vm->invalidated);
>>>      >       spin_lock_init(&vm->status_lock);
>>>      > @@ -2648,11 +2667,13 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>      amdgpu_vm *vm, struct seq_file *m)
>>>      >   {
>>>      >       struct amdgpu_bo_va *bo_va, *tmp;
>>>      >       u64 total_idle = 0;
>>>      > +     u64 total_dirty = 0;
>>>      >       u64 total_relocated = 0;
>>>      >       u64 total_moved = 0;
>>>      >       u64 total_invalidated = 0;
>>>      >       u64 total_done = 0;
>>>      >       unsigned int total_idle_objs = 0;
>>>      > +     unsigned int total_dirty_objs = 0;
>>>      >       unsigned int total_relocated_objs = 0;
>>>      >       unsigned int total_moved_objs = 0;
>>>      >       unsigned int total_invalidated_objs = 0;
>>>      > @@ -2669,6 +2690,15 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>      amdgpu_vm *vm, struct seq_file *m)
>>>      >       total_idle_objs = id;
>>>      >       id = 0;
>>>      >
>>>      > +     seq_puts(m, "\tDirty BOs:\n");
>>>      > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty,
>>>      base.vm_status) {
>>>      > +             if (!bo_va->base.bo <http://base.bo>)
>>>      > +                     continue;
>>>      > +             total_dirty += amdgpu_bo_print_info(id++,
>>>      bo_va->base.bo <http://base.bo>, m);
>>>      > +     }
>>>      > +     total_dirty_objs = id;
>>>      > +     id = 0;
>>>      > +
>>>      >       seq_puts(m, "\tRelocated BOs:\n");
>>>      >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated,
>>>      base.vm_status) {
>>>      >               if (!bo_va->base.bo <http://base.bo>)
>>>      > @@ -2707,6 +2737,8 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>      amdgpu_vm *vm, struct seq_file *m)
>>>      >
>>>      >       seq_printf(m, "\tTotal idle size: %12lld\tobjs:\t%d\n",
>>>      total_idle,
>>>      >                  total_idle_objs);
>>>      > +     seq_printf(m, "\tTotal dirty size:  %12lld\tobjs:\t%d\n",
>>>      total_dirty,
>>>      > +                total_dirty_objs);
>>>      >       seq_printf(m, "\tTotal relocated size:
>>>       %12lld\tobjs:\t%d\n", total_relocated,
>>>      >                  total_relocated_objs);
>>>      >       seq_printf(m, "\tTotal moved size:  %12lld\tobjs:\t%d\n",
>>>      total_moved,
>>>      > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>      b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>      > index d9ab97eabda9..f91d4fcf80b8 100644
>>>      > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>      > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>      > @@ -276,6 +276,9 @@ struct amdgpu_vm {
>>>      >       /* per VM BOs moved, but not yet updated in the PT */
>>>      >       struct list_head        moved;
>>>      >
>>>      > +     /* normal and per VM BOs that are not moved, but have new
>>>      PT entries */
>>>      > +     struct list_head        dirty;
>>>      > +
>>>      >       /* All BOs of this VM not currently in the state machine */
>>>      >       struct list_head        idle;
>>>      >
>>>

