Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C8A7DCEC6
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 15:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393DD10E4EB;
	Tue, 31 Oct 2023 14:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DC510E4E9;
 Tue, 31 Oct 2023 14:08:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6RauuKwf3Ko+DndfR/TuC+UPOrY3HG1NKyUmmea0//ha7ZI2d6cs9KzyOwuZ8mLlt+ZXeaQQ/jupFq5R3vaib4stgjFL0V6MNHNkXVHqv8TbHBwCNQTGjih7FxK6oVYmxReKdfMeGZhw/C+IJFcYvX4KfG+bLe12ShbgaNAO+gMkZm3EKAP/rDKMIRDQ3HzNkI67ARC36tjHFptygJ2AOZKGsI75shbZeKyYI/XXdrUpzhFtHcAXQINMEc0b5jmCKcI+ThgdSAc0Xug+4AZ2+TzG1QVaF3jGJ/Fg9Al4p/ISseY9qQlbbyDC34c/rtb8XDOy1IqBjzd752D/PMPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iRhGz4+JB4p2gawFArWUwnTJJpMuT9hUk2GRBYQCFU=;
 b=Nng/ViqBhm65gtI7JAITvwbIQ4hRxh9ttEzZk2vlORXVumShzRGMzwch+1mrlBZHy9M3rCJZ3EqdADyp+vSVnCymCDZZ/b2314Sndbv5cmM2WYXWlPHUnSDidhKOP/bAHSL1PbLAq+gZZ00g5xMwwMVyT/1rjNE1lLi72NfohlvpAoVwVJK0K4IqXn6ME2RrZJ5HhBfPCeUvzqmx7N1MgbkZiECp6Wp26nrzbF+POKOozvKuwy17Z1lq2XPDZlr0s9+aArbIL3icyLPmkiogAtA6EUJpucCI79QhVs+qfdD5wrDSYgFHsOliI/7R3TZEs6/oPD3i3Inc7ySReAtA7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iRhGz4+JB4p2gawFArWUwnTJJpMuT9hUk2GRBYQCFU=;
 b=X9+sA9JsLwPP6kw+1bp60vOyRU4PGhWDr7FRzNTC10B/3CsazJ3IZmqXldaO0fa5Tp7BWsAPKl2HDlrq9U5sIx/V5MgNLK73/pVALHfOQZ+U4/48+FA1o+MvgL8MOgTOb58c3oZJVKpKZtH3I/wyHW/uVNNLIodpsjIUeBusPVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Tue, 31 Oct
 2023 14:07:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 14:07:56 +0000
Content-Type: multipart/alternative;
 boundary="------------X7PC1HIgId3XhhZpATZyMHcS"
Message-ID: <ffafa427-e755-4f86-8aab-8e69ef63325a@amd.com>
Date: Tue, 31 Oct 2023 15:07:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/amdgpu: Flush VM updates for split bindings
 eagerly.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-4-ishitatsuyuki@gmail.com>
 <30bcd9b7-903d-435e-9318-346777a3fd55@amd.com>
 <CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=WkBpJyJrmqZ=rtMA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=WkBpJyJrmqZ=rtMA@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: acfcf7e7-611a-49ef-d48a-08dbda1ac7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4pWwmpFvsiesiJgEmePPNz/SQbFu2kkXGOg9n4YL0reCEs0qfpbutEls05OGxKGoCWSneL+1WJTdG2bUlIEV27aODcK/KWMMJ64otNY1wJylzAIOzKl2UkRykQO1Wi84+xFzv5MAkFFJy6Jd76IAYme+cRaJCY2d3G+dpbIxlBzW1sPG13cGPJUNFSiuyxZuXdNC/113ilG+7H9sR7Ye4U81vURnTjsoZhml1ocQrGv5fIxsVOk7ionEzmlMoyPBvvvNQj8KUWicLYdtTVeb+dmsXKSkH5yeAoIF39KOMxgixnh7OmzYUlS/DNPNe+2T6JK5ZtKFALW1Yj8IHfe24N2BLPY/+lUWYXWT01hWqY5e9ZjKRoMdJLIO4cmbIa0gnp7uTxsUbVYru4yhaiV6trqRmDUgErFOA6RanuPh4Y7iDFrc5DewxUl3OaP/RYIC10PxTbxbu2TO2VlA/9OJ1KJOD9A4a8WcCG669udrk/3Rv+XNnO/KjTyY1hyCp+/sa1+ML0KkXHi/W0OETVfL8axMzYfZ20LF9pi0W9ycSMeVomSFyVPV4xBcCOQquQbsyN7w54P2iIeuW68FIw1pSof2JOC12jhDOpP/WYripvXZ1w+zZbzm1GxdMNKDqX3arg+HX4okoDRgu798CJjwEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2616005)(33964004)(478600001)(6506007)(6512007)(66476007)(31696002)(53546011)(66946007)(6666004)(36756003)(6486002)(86362001)(66574015)(26005)(66556008)(166002)(83380400001)(8936002)(38100700002)(4326008)(8676002)(41300700001)(5660300002)(6916009)(31686004)(2906002)(316002)(30864003)(15650500001)(43740500002)(45980500001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzZ3b2pIOFg4WUxPaTVJY3BVLy9DbVBGbTRPTXNiL0pQMHRMRUkzbWdmWmFh?=
 =?utf-8?B?SW8ycXZuaHRWRlZwOHhNaGYzdWRUYmY2Zkh3Ykg5UmVpTDJkbW4vMmd4NzB5?=
 =?utf-8?B?VzVQbmJIM250bS8zN3pDV0FqcVpsSnBRVm9vUTYxYmhWS0xXcTdpSkNRQnpn?=
 =?utf-8?B?TlRqc05NUDhzUnF2Q215OWpPT2V5TWJrZUpKcCtJQmJOWFJYQjFjdmlvMkR4?=
 =?utf-8?B?WjdVeUJsblpkNlVGRXczNzd0dFRBMVN2MEJvNUVRK3RZQ08veENMRWNDZkpD?=
 =?utf-8?B?dkkwQmpLcE1yQkh0dUFxVms5a2lRNUpXa3lmOEdQaXNGYzJlbHlEcHQ1ajlk?=
 =?utf-8?B?b1RTK1I2OVhuQi9iSG5QMXVmK2VlYURTQWN1NDlxQUpwZU9UWUdBZUpFWFRG?=
 =?utf-8?B?UWZKZ1AwZ1VDZUxiQSttRlEvY1ZGelJqWkp1Yk5XQXRvZ2Rqbjh1a2ZPQ3lS?=
 =?utf-8?B?LytkaDJwQjVNZWduL2tqQVFEL3JKV0pGYStYYW5ZTEpocjlENnlsbnd0bXJ1?=
 =?utf-8?B?eU84YlF6RlR2VFRwREhxRnhGYjJpTVNINlpybVF0WGQ5SXFvM3F2Vzk4empu?=
 =?utf-8?B?S3p5eXBSUmRBeW9nTFdxb1M4SmRVNjExdTJyNHUrZDNlZnJLOGc0dUtCZ2pu?=
 =?utf-8?B?Wi9VTll6M0xLVkVrNUxwQTloVDhWT0llOEhlWGxlNytPNExLdlNiVlBQT0RX?=
 =?utf-8?B?cVhuQ0JEZWI1bm1rMFJ0MnEvYnpmOWtxMGdpWjkyYzBYdWJaeEtDeFRqNW5n?=
 =?utf-8?B?U2VtWFpLMGZONUdMRDVFNjZZL21jbkxXem1kVUEzbmJCaU9sYTY2QXJYclZl?=
 =?utf-8?B?VlNDV3I0ZEVTZ01vN1BwSXpFSlR5TmFyY0VQYzZaazhKQVdIUEJUZUdHNEhX?=
 =?utf-8?B?R2V6QlYxa1ZMbVhUOWdDUnhGanphQXgwcUVkb2QvT0k2SkVQZmh5RDFCOGhS?=
 =?utf-8?B?ZTg4NjRKcnplSWUvMHNicytiNnhXa09zRjZWWFp4VWxCUndDNko5RUpPemRC?=
 =?utf-8?B?cmsrU2ZQVjFLaWJLemNNZnhuRnRPS1VaSU5aTit3MFJLeThPZTZ2eEkzWHpJ?=
 =?utf-8?B?LzRnMG8zVzJjZ0p6eVNRVFZmWGc4djRYUHc4cEpxT2N3S1hNY0kzWDZXTUJN?=
 =?utf-8?B?YzcyRU1mYThxd3MxVDhBbWdnSmEvOFJjdFUvR3FvaFdVSGU1K21xb3lka0g5?=
 =?utf-8?B?MGlCUE1ZMTQ0N2lZdFlmTW1pamc5cE9FZHJ3V2prQWNoT1ZkcFJoZTNsaEZR?=
 =?utf-8?B?V1NmQmtmekRLL0d6SFNTbSszcFU2Z3EzakhNZlcwVXdFaExibnFhOUpDNzJj?=
 =?utf-8?B?RWN2MlhVSjV0ZzZqUXJqcy84eExGTVoyalRSYTBKZy9xbW1WUFpYTzA5ak8y?=
 =?utf-8?B?b0dueFFiSUV6dlg0cGpXa01MUWcyVG5Fb3VnM01Uek0rQkJwcjVxb3FsNmt5?=
 =?utf-8?B?NWhFSEozeTJLdmtFNkkrTkVyYjIvL0duSnFQVVppc3pjRWw0Qm1ZdFVzaFRY?=
 =?utf-8?B?dmlPODFaZjV5Rk1ZWlRDT2xxaVlJeU44ZlNzWUdhRTgzQzUvNG1qRnNKQWxL?=
 =?utf-8?B?UDBNVitSZjlNRzF6bnNVZ2k3ZGoyM05YeThhZDhCb2dUNWgwZTIrbEF6Q0Vw?=
 =?utf-8?B?RDlFOWEzL0JNamRHUU1FZ0JZNmgzdlJ6M0JKYW1qcmVhWHNmTlU2YUMwb3Nu?=
 =?utf-8?B?aWcyUFhFeGN1Z2ViTVRvZ3M5UHhuRktvMEZYZ1VRQlpzbVYvdk5uVmtLSTU2?=
 =?utf-8?B?WnduUHpqN1IyMDUrZ2FOWTk2YmtxT0JEOUt5NjA1U2ZJRDYxdXFxbHpMWlc0?=
 =?utf-8?B?U1BBNThzaWJNN1JlNXF6aGxwRStzKzlpM1ZhY0dkMmVTM1F3Mng0WWMrWlJj?=
 =?utf-8?B?OUpxanFudHltMFJUc0ZkZWVrcWYveXpLQnNWWHUwNzVQVFVRVkJJRmJKNTV5?=
 =?utf-8?B?VFBPcGdMd3NzUFhPTTZKNW5MZFB4dWxwR3ZiaUl5bW9seGdRZHU3bjdCdHl3?=
 =?utf-8?B?TWJEOWdSRFNpemFOWngrb3QxVVZYZ21ybHBwcTZDUFJqbkdkRFcxcjRaeHFM?=
 =?utf-8?B?QnBFYmF1WkdMK1NPQ3czdHpqL1gzakx2d3hNS1B4OVB5djdpQkNDRHo5SHpz?=
 =?utf-8?Q?ufy2/6EtOEaLZC8HmIXPkOFJ2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acfcf7e7-611a-49ef-d48a-08dbda1ac7ee
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 14:07:56.3197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JtdQFl09igm9EhjKiPBrH/TTGZlSOK4C/TFy7Kz4PpIoKSwC8dcWqatSBiPVRO2Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------X7PC1HIgId3XhhZpATZyMHcS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 31.10.23 um 14:59 schrieb Bas Nieuwenhuizen:
>
>
> On Tue, Oct 31, 2023 at 2:57 PM Christian König 
> <christian.koenig@amd.com> wrote:
>
>     Am 31.10.23 um 14:40 schrieb Tatsuyuki Ishi:
>     > The current amdgpu_gem_va_update_vm only tries to perform
>     updates for the
>     > BO specified in the GEM ioctl; however, when a binding is split, the
>     > adjacent bindings also need to be updated. Such updates
>     currently ends up
>     > getting deferred until next submission which causes stalls.
>
>     Yeah, that is a necessity. The hardware simply doesn't support
>     what you
>     try to do here in all cases.
>
>
> What can the hardware not do here? Is this just needing to wait for 
> TLB flushes before we can free pagetables, can we just delay that?

On some hardware generations (especially Navi1x, but also everything 
older than Polaris) you can't invalidate the TLB while it is in use.

For Polaris and older it just means that you don't have a guarantee that 
the shader can't access the memory any more. So delaying the free 
operation helps here.

But for Navi1x it's a workaround for a hardware bug. If you try to 
invalidate the TLB while it is in use you can potentially triggering 
memory accesses to random addresses.

That's why we still delay TLB invalidation's to the next CS and use a 
new VMID for each submission instead of invalidating the old one.

I'm currently working on changing that for Navi2x and newer (maybe Vega 
as well), but this is something you can really only do on some hw 
generations after validating that it works.

Regards,
Christian.

>
>
>     So this approach won't work in general.
>
>     Regards,
>     Christian.
>
>     >
>     > Introduce a new state "dirty", shared between per-VM BOs and
>     traditional
>     > BOs, containing all BOs that have pending updates in `invalids`.
>     > amdgpu_gem_va_update_vm will now simply flush any pending
>     updates for BOs
>     > in the dirty state.
>     >
>     > Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
>     > ---
>     >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 18 ++++---
>     >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 66
>     ++++++++++++++++++-------
>     >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  3 ++
>     >   3 files changed, 63 insertions(+), 24 deletions(-)
>     >
>     > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>     > index a1b15d0d6c48..01d3a97248b0 100644
>     > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>     > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>     > @@ -604,10 +604,9 @@ int amdgpu_gem_metadata_ioctl(struct
>     drm_device *dev, void *data,
>     >    * vital here, so they are not reported back to userspace.
>     >    */
>     >   static void amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
>     > -                                 struct amdgpu_vm *vm,
>     > -                                 struct amdgpu_bo_va *bo_va,
>     > -                                 uint32_t operation)
>     > +                                 struct amdgpu_vm *vm)
>     >   {
>     > +     struct amdgpu_bo_va *bo_va;
>     >       int r;
>     >
>     >       if (!amdgpu_vm_ready(vm))
>     > @@ -617,12 +616,18 @@ static void amdgpu_gem_va_update_vm(struct
>     amdgpu_device *adev,
>     >       if (r)
>     >               goto error;
>     >
>     > -     if (operation == AMDGPU_VA_OP_MAP ||
>     > -         operation == AMDGPU_VA_OP_REPLACE) {
>     > +     spin_lock(&vm->status_lock);
>     > +     while (!list_empty(&vm->dirty)) {
>     > +             bo_va = list_first_entry(&vm->dirty, struct
>     amdgpu_bo_va,
>     > +                                      base.vm_status);
>     > +             spin_unlock(&vm->status_lock);
>     > +
>     >               r = amdgpu_vm_bo_update(adev, bo_va, false);
>     >               if (r)
>     >                       goto error;
>     > +             spin_lock(&vm->status_lock);
>     >       }
>     > +     spin_unlock(&vm->status_lock);
>     >
>     >       r = amdgpu_vm_update_pdes(adev, vm, false);
>     >
>     > @@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct drm_device
>     *dev, void *data,
>     >               break;
>     >       }
>     >       if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) &&
>     !amdgpu_vm_debug)
>     > -             amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
>     > -  args->operation);
>     > +             amdgpu_gem_va_update_vm(adev, &fpriv->vm);
>     >
>     >   error:
>     >       drm_exec_fini(&exec);
>     > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>     > index dd6f72e2a1d6..01d31891cd05 100644
>     > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>     > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>     > @@ -191,6 +191,21 @@ static void amdgpu_vm_bo_set_evicted(struct
>     amdgpu_vm_bo_base *vm_bo, bool evict
>     >       spin_unlock(&vm_bo->vm->status_lock);
>     >   }
>     >
>     > +/**
>     > + * amdgpu_vm_bo_dirty - vm_bo is dirty
>     > + *
>     > + * @vm_bo: vm_bo which is dirty
>     > + *
>     > + * State for normal and per VM BOs that are not moved, but have
>     new entries in
>     > + * bo_va->invalids.
>     > + */
>     > +static void amdgpu_vm_bo_dirty(struct amdgpu_vm_bo_base *vm_bo)
>     > +{
>     > +     spin_lock(&vm_bo->vm->status_lock);
>     > +     list_move(&vm_bo->vm_status, &vm_bo->vm->dirty);
>     > +     spin_unlock(&vm_bo->vm->status_lock);
>     > +}
>     > +
>     >   /**
>     >    * amdgpu_vm_bo_moved - vm_bo is moved
>     >    *
>     > @@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct amdgpu_vm
>     *vm,
>     >       list_for_each_entry_safe(bo_va, tmp, &vm->evicted,
>     base.eviction_status)
>     >               amdgpu_vm_bo_get_memory(bo_va, stats);
>     >
>     > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty,
>     base.vm_status)
>     > +             amdgpu_vm_bo_get_memory(bo_va, stats);
>     > +
>     >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated,
>     base.vm_status)
>     >               amdgpu_vm_bo_get_memory(bo_va, stats);
>     >
>     > @@ -1411,6 +1429,17 @@ int amdgpu_vm_handle_moved(struct
>     amdgpu_device *adev,
>     >                       dma_resv_unlock(resv);
>     >               spin_lock(&vm->status_lock);
>     >       }
>     > +
>     > +     while (!list_empty(&vm->dirty)) {
>     > +             bo_va = list_first_entry(&vm->dirty, struct
>     amdgpu_bo_va,
>     > +                                      base.vm_status);
>     > +             spin_unlock(&vm->status_lock);
>     > +
>     > +             r = amdgpu_vm_bo_update(adev, bo_va, false);
>     > +             if (r)
>     > +                     return r;
>     > +             spin_lock(&vm->status_lock);
>     > +     }
>     >       spin_unlock(&vm->status_lock);
>     >
>     >       return 0;
>     > @@ -1476,19 +1505,16 @@ static void
>     amdgpu_vm_bo_insert_map(struct amdgpu_device *adev,
>     >                                   struct amdgpu_bo_va_mapping
>     *mapping)
>     >   {
>     >       struct amdgpu_vm *vm = bo_va->base.vm;
>     > -     struct amdgpu_bo *bo = bo_va->base.bo <http://base.bo>;
>     >
>     >       mapping->bo_va = bo_va;
>     >       list_add(&mapping->list, &bo_va->invalids);
>     >       amdgpu_vm_it_insert(mapping, &vm->va);
>     > +     if (!bo_va->base.moved)
>     > +             amdgpu_vm_bo_dirty(&bo_va->base);
>     >
>     >       if (mapping->flags & AMDGPU_PTE_PRT)
>     >               amdgpu_vm_prt_get(adev);
>     >
>     > -     if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
>     > -         !bo_va->base.moved) {
>     > -             amdgpu_vm_bo_moved(&bo_va->base);
>     > -     }
>     >       trace_amdgpu_vm_bo_map(bo_va, mapping);
>     >   }
>     >
>     > @@ -1725,6 +1751,8 @@ int amdgpu_vm_bo_clear_mappings(struct
>     amdgpu_device *adev,
>     >                       before->flags = tmp->flags;
>     >                       before->bo_va = tmp->bo_va;
>     >                       list_add(&before->list,
>     &tmp->bo_va->invalids);
>     > +                     if (!tmp->bo_va->base.moved)
>     > +  amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>     >               }
>     >
>     >               /* Remember mapping split at the end */
>     > @@ -1736,6 +1764,8 @@ int amdgpu_vm_bo_clear_mappings(struct
>     amdgpu_device *adev,
>     >                       after->flags = tmp->flags;
>     >                       after->bo_va = tmp->bo_va;
>     >                       list_add(&after->list, &tmp->bo_va->invalids);
>     > +                     if (!tmp->bo_va->base.moved)
>     > +  amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>     >               }
>     >
>     >               list_del(&tmp->list);
>     > @@ -1761,30 +1791,18 @@ int amdgpu_vm_bo_clear_mappings(struct
>     amdgpu_device *adev,
>     >
>     >       /* Insert partial mapping before the range */
>     >       if (!list_empty(&before->list)) {
>     > -             struct amdgpu_bo *bo = before->bo_va->base.bo
>     <http://base.bo>;
>     > -
>     >               amdgpu_vm_it_insert(before, &vm->va);
>     >               if (before->flags & AMDGPU_PTE_PRT)
>     >                       amdgpu_vm_prt_get(adev);
>     > -
>     > -             if (bo && bo->tbo.base.resv ==
>     vm->root.bo->tbo.base.resv &&
>     > -                 !before->bo_va->base.moved)
>     > -  amdgpu_vm_bo_moved(&before->bo_va->base);
>     >       } else {
>     >               kfree(before);
>     >       }
>     >
>     >       /* Insert partial mapping after the range */
>     >       if (!list_empty(&after->list)) {
>     > -             struct amdgpu_bo *bo = after->bo_va->base.bo
>     <http://base.bo>;
>     > -
>     >               amdgpu_vm_it_insert(after, &vm->va);
>     >               if (after->flags & AMDGPU_PTE_PRT)
>     >                       amdgpu_vm_prt_get(adev);
>     > -
>     > -             if (bo && bo->tbo.base.resv ==
>     vm->root.bo->tbo.base.resv &&
>     > -                 !after->bo_va->base.moved)
>     > -  amdgpu_vm_bo_moved(&after->bo_va->base);
>     >       } else {
>     >               kfree(after);
>     >       }
>     > @@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct amdgpu_device
>     *adev, struct amdgpu_vm *vm, int32_t xcp
>     >       INIT_LIST_HEAD(&vm->evicted);
>     >       INIT_LIST_HEAD(&vm->relocated);
>     >       INIT_LIST_HEAD(&vm->moved);
>     > +     INIT_LIST_HEAD(&vm->dirty);
>     >       INIT_LIST_HEAD(&vm->idle);
>     >       INIT_LIST_HEAD(&vm->invalidated);
>     >       spin_lock_init(&vm->status_lock);
>     > @@ -2648,11 +2667,13 @@ void amdgpu_debugfs_vm_bo_info(struct
>     amdgpu_vm *vm, struct seq_file *m)
>     >   {
>     >       struct amdgpu_bo_va *bo_va, *tmp;
>     >       u64 total_idle = 0;
>     > +     u64 total_dirty = 0;
>     >       u64 total_relocated = 0;
>     >       u64 total_moved = 0;
>     >       u64 total_invalidated = 0;
>     >       u64 total_done = 0;
>     >       unsigned int total_idle_objs = 0;
>     > +     unsigned int total_dirty_objs = 0;
>     >       unsigned int total_relocated_objs = 0;
>     >       unsigned int total_moved_objs = 0;
>     >       unsigned int total_invalidated_objs = 0;
>     > @@ -2669,6 +2690,15 @@ void amdgpu_debugfs_vm_bo_info(struct
>     amdgpu_vm *vm, struct seq_file *m)
>     >       total_idle_objs = id;
>     >       id = 0;
>     >
>     > +     seq_puts(m, "\tDirty BOs:\n");
>     > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty,
>     base.vm_status) {
>     > +             if (!bo_va->base.bo <http://base.bo>)
>     > +                     continue;
>     > +             total_dirty += amdgpu_bo_print_info(id++,
>     bo_va->base.bo <http://base.bo>, m);
>     > +     }
>     > +     total_dirty_objs = id;
>     > +     id = 0;
>     > +
>     >       seq_puts(m, "\tRelocated BOs:\n");
>     >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated,
>     base.vm_status) {
>     >               if (!bo_va->base.bo <http://base.bo>)
>     > @@ -2707,6 +2737,8 @@ void amdgpu_debugfs_vm_bo_info(struct
>     amdgpu_vm *vm, struct seq_file *m)
>     >
>     >       seq_printf(m, "\tTotal idle size: %12lld\tobjs:\t%d\n",
>     total_idle,
>     >                  total_idle_objs);
>     > +     seq_printf(m, "\tTotal dirty size:  %12lld\tobjs:\t%d\n",
>     total_dirty,
>     > +                total_dirty_objs);
>     >       seq_printf(m, "\tTotal relocated size:
>      %12lld\tobjs:\t%d\n", total_relocated,
>     >                  total_relocated_objs);
>     >       seq_printf(m, "\tTotal moved size:  %12lld\tobjs:\t%d\n",
>     total_moved,
>     > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>     > index d9ab97eabda9..f91d4fcf80b8 100644
>     > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>     > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>     > @@ -276,6 +276,9 @@ struct amdgpu_vm {
>     >       /* per VM BOs moved, but not yet updated in the PT */
>     >       struct list_head        moved;
>     >
>     > +     /* normal and per VM BOs that are not moved, but have new
>     PT entries */
>     > +     struct list_head        dirty;
>     > +
>     >       /* All BOs of this VM not currently in the state machine */
>     >       struct list_head        idle;
>     >
>

--------------X7PC1HIgId3XhhZpATZyMHcS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 31.10.23 um 14:59 schrieb Bas Nieuwenhuizen:<br>
    <blockquote type="cite" cite="mid:CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=WkBpJyJrmqZ=rtMA@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Oct 31, 2023 at
            2:57 PM Christian König &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am
            31.10.23 um 14:40 schrieb Tatsuyuki Ishi:<br>
            &gt; The current amdgpu_gem_va_update_vm only tries to
            perform updates for the<br>
            &gt; BO specified in the GEM ioctl; however, when a binding
            is split, the<br>
            &gt; adjacent bindings also need to be updated. Such updates
            currently ends up<br>
            &gt; getting deferred until next submission which causes
            stalls.<br>
            <br>
            Yeah, that is a necessity. The hardware simply doesn't
            support what you <br>
            try to do here in all cases.<br>
          </blockquote>
          <div><br>
          </div>
          <div>What can the hardware not do here? Is this just needing
            to wait for TLB flushes before we can free pagetables, can
            we just delay that?</div>
        </div>
      </div>
    </blockquote>
    <br>
    On some hardware generations (especially Navi1x, but also everything
    older than Polaris) you can't invalidate the TLB while it is in use.<br>
    <br>
    For Polaris and older it just means that you don't have a guarantee
    that the shader can't access the memory any more. So delaying the
    free operation helps here.<br>
    <br>
    But for Navi1x it's a workaround for a hardware bug. If you try to
    invalidate the TLB while it is in use you can potentially triggering
    memory accesses to random addresses.<br>
    <br>
    That's why we still delay TLB invalidation's to the next CS and use
    a new VMID for each submission instead of invalidating the old one.<br>
    <br>
    I'm currently working on changing that for Navi2x and newer (maybe
    Vega as well), but this is something you can really only do on some
    hw generations after validating that it works.<br>
    <br>
    Regards,<br>
    Christian. <br>
    <br>
    <blockquote type="cite" cite="mid:CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=WkBpJyJrmqZ=rtMA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>&nbsp;<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            So this approach won't work in general.<br>
            <br>
            Regards,<br>
            Christian.<br>
            <br>
            &gt;<br>
            &gt; Introduce a new state &quot;dirty&quot;, shared between per-VM
            BOs and traditional<br>
            &gt; BOs, containing all BOs that have pending updates in
            `invalids`.<br>
            &gt; amdgpu_gem_va_update_vm will now simply flush any
            pending updates for BOs<br>
            &gt; in the dirty state.<br>
            &gt;<br>
            &gt; Signed-off-by: Tatsuyuki Ishi &lt;<a href="mailto:ishitatsuyuki@gmail.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">ishitatsuyuki@gmail.com</a>&gt;<br>
            &gt; ---<br>
            &gt;&nbsp; &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 18 ++++---<br>
            &gt;&nbsp; &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c&nbsp; | 66
            ++++++++++++++++++-------<br>
            &gt;&nbsp; &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h&nbsp; |&nbsp; 3 ++<br>
            &gt;&nbsp; &nbsp;3 files changed, 63 insertions(+), 24 deletions(-)<br>
            &gt;<br>
            &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
            &gt; index a1b15d0d6c48..01d3a97248b0 100644<br>
            &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
            &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
            &gt; @@ -604,10 +604,9 @@ int
            amdgpu_gem_metadata_ioctl(struct drm_device *dev, void
            *data,<br>
            &gt;&nbsp; &nbsp; * vital here, so they are not reported back to
            userspace.<br>
            &gt;&nbsp; &nbsp; */<br>
            &gt;&nbsp; &nbsp;static void amdgpu_gem_va_update_vm(struct
            amdgpu_device *adev,<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct amdgpu_vm *vm,<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct amdgpu_bo_va
            *bo_va,<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint32_t operation)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct amdgpu_vm *vm)<br>
            &gt;&nbsp; &nbsp;{<br>
            &gt; +&nbsp; &nbsp; &nbsp;struct amdgpu_bo_va *bo_va;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;int r;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (!amdgpu_vm_ready(vm))<br>
            &gt; @@ -617,12 +616,18 @@ static void
            amdgpu_gem_va_update_vm(struct amdgpu_device *adev,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (r)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto error;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; -&nbsp; &nbsp; &nbsp;if (operation == AMDGPU_VA_OP_MAP ||<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;operation == AMDGPU_VA_OP_REPLACE) {<br>
            &gt; +&nbsp; &nbsp; &nbsp;spin_lock(&amp;vm-&gt;status_lock);<br>
            &gt; +&nbsp; &nbsp; &nbsp;while (!list_empty(&amp;vm-&gt;dirty)) {<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo_va =
            list_first_entry(&amp;vm-&gt;dirty, struct amdgpu_bo_va,<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; base.vm_status);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;spin_unlock(&amp;vm-&gt;status_lock);<br>
            &gt; +<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r = amdgpu_vm_bo_update(adev, bo_va,
            false);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto error;<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;spin_lock(&amp;vm-&gt;status_lock);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt; +&nbsp; &nbsp; &nbsp;spin_unlock(&amp;vm-&gt;status_lock);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;r = amdgpu_vm_update_pdes(adev, vm, false);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; @@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct
            drm_device *dev, void *data,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (!r &amp;&amp; !(args-&gt;flags &amp;
            AMDGPU_VM_DELAY_UPDATE) &amp;&amp; !amdgpu_vm_debug)<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_gem_va_update_vm(adev,
            &amp;fpriv-&gt;vm, bo_va,<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;args-&gt;operation);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_gem_va_update_vm(adev,
            &amp;fpriv-&gt;vm);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp;error:<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;drm_exec_fini(&amp;exec);<br>
            &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
            &gt; index dd6f72e2a1d6..01d31891cd05 100644<br>
            &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
            &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
            &gt; @@ -191,6 +191,21 @@ static void
            amdgpu_vm_bo_set_evicted(struct amdgpu_vm_bo_base *vm_bo,
            bool evict<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;spin_unlock(&amp;vm_bo-&gt;vm-&gt;status_lock);<br>
            &gt;&nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; +/**<br>
            &gt; + * amdgpu_vm_bo_dirty - vm_bo is dirty<br>
            &gt; + *<br>
            &gt; + * @vm_bo: vm_bo which is dirty<br>
            &gt; + *<br>
            &gt; + * State for normal and per VM BOs that are not moved,
            but have new entries in<br>
            &gt; + * bo_va-&gt;invalids.<br>
            &gt; + */<br>
            &gt; +static void amdgpu_vm_bo_dirty(struct
            amdgpu_vm_bo_base *vm_bo)<br>
            &gt; +{<br>
            &gt; +&nbsp; &nbsp; &nbsp;spin_lock(&amp;vm_bo-&gt;vm-&gt;status_lock);<br>
            &gt; +&nbsp; &nbsp; &nbsp;list_move(&amp;vm_bo-&gt;vm_status,
            &amp;vm_bo-&gt;vm-&gt;dirty);<br>
            &gt; +&nbsp; &nbsp; &nbsp;spin_unlock(&amp;vm_bo-&gt;vm-&gt;status_lock);<br>
            &gt; +}<br>
            &gt; +<br>
            &gt;&nbsp; &nbsp;/**<br>
            &gt;&nbsp; &nbsp; * amdgpu_vm_bo_moved - vm_bo is moved<br>
            &gt;&nbsp; &nbsp; *<br>
            &gt; @@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct
            amdgpu_vm *vm,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;list_for_each_entry_safe(bo_va, tmp,
            &amp;vm-&gt;evicted, base.eviction_status)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_bo_get_memory(bo_va, stats);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; +&nbsp; &nbsp; &nbsp;list_for_each_entry_safe(bo_va, tmp,
            &amp;vm-&gt;dirty, base.vm_status)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_bo_get_memory(bo_va, stats);<br>
            &gt; +<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;list_for_each_entry_safe(bo_va, tmp,
            &amp;vm-&gt;relocated, base.vm_status)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_bo_get_memory(bo_va, stats);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; @@ -1411,6 +1429,17 @@ int
            amdgpu_vm_handle_moved(struct amdgpu_device *adev,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dma_resv_unlock(resv);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;spin_lock(&amp;vm-&gt;status_lock);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt; +<br>
            &gt; +&nbsp; &nbsp; &nbsp;while (!list_empty(&amp;vm-&gt;dirty)) {<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo_va =
            list_first_entry(&amp;vm-&gt;dirty, struct amdgpu_bo_va,<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; base.vm_status);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;spin_unlock(&amp;vm-&gt;status_lock);<br>
            &gt; +<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r = amdgpu_vm_bo_update(adev, bo_va,
            false);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;spin_lock(&amp;vm-&gt;status_lock);<br>
            &gt; +&nbsp; &nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;spin_unlock(&amp;vm-&gt;status_lock);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>
            &gt; @@ -1476,19 +1505,16 @@ static void
            amdgpu_vm_bo_insert_map(struct amdgpu_device *adev,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct
            amdgpu_bo_va_mapping *mapping)<br>
            &gt;&nbsp; &nbsp;{<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;struct amdgpu_vm *vm = bo_va-&gt;base.vm;<br>
            &gt; -&nbsp; &nbsp; &nbsp;struct amdgpu_bo *bo = bo_va-&gt;<a href="http://base.bo" rel="noreferrer" target="_blank" moz-do-not-send="true">base.bo</a>;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;mapping-&gt;bo_va = bo_va;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;list_add(&amp;mapping-&gt;list,
            &amp;bo_va-&gt;invalids);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_it_insert(mapping, &amp;vm-&gt;va);<br>
            &gt; +&nbsp; &nbsp; &nbsp;if (!bo_va-&gt;base.moved)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_bo_dirty(&amp;bo_va-&gt;base);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (mapping-&gt;flags &amp; AMDGPU_PTE_PRT)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_prt_get(adev);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; -&nbsp; &nbsp; &nbsp;if (bo &amp;&amp; bo-&gt;tbo.base.resv ==
            vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!bo_va-&gt;base.moved) {<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_bo_moved(&amp;bo_va-&gt;base);<br>
            &gt; -&nbsp; &nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;trace_amdgpu_vm_bo_map(bo_va, mapping);<br>
            &gt;&nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; @@ -1725,6 +1751,8 @@ int
            amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;before-&gt;flags = tmp-&gt;flags;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;before-&gt;bo_va = tmp-&gt;bo_va;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;list_add(&amp;before-&gt;list,
            &amp;tmp-&gt;bo_va-&gt;invalids);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
            (!tmp-&gt;bo_va-&gt;base.moved)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;amdgpu_vm_bo_dirty(&amp;tmp-&gt;bo_va-&gt;base);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Remember mapping split at the end */<br>
            &gt; @@ -1736,6 +1764,8 @@ int
            amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;after-&gt;flags = tmp-&gt;flags;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;after-&gt;bo_va = tmp-&gt;bo_va;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;list_add(&amp;after-&gt;list,
            &amp;tmp-&gt;bo_va-&gt;invalids);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
            (!tmp-&gt;bo_va-&gt;base.moved)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;amdgpu_vm_bo_dirty(&amp;tmp-&gt;bo_va-&gt;base);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;list_del(&amp;tmp-&gt;list);<br>
            &gt; @@ -1761,30 +1791,18 @@ int
            amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* Insert partial mapping before the range */<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (!list_empty(&amp;before-&gt;list)) {<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct amdgpu_bo *bo =
            before-&gt;bo_va-&gt;<a href="http://base.bo" rel="noreferrer" target="_blank" moz-do-not-send="true">base.bo</a>;<br>
            &gt; -<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_it_insert(before,
            &amp;vm-&gt;va);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (before-&gt;flags &amp;
            AMDGPU_PTE_PRT)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_prt_get(adev);<br>
            &gt; -<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bo &amp;&amp; bo-&gt;tbo.base.resv ==
            vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!before-&gt;bo_va-&gt;base.moved)<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;amdgpu_vm_bo_moved(&amp;before-&gt;bo_va-&gt;base);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;} else {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kfree(before);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* Insert partial mapping after the range */<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (!list_empty(&amp;after-&gt;list)) {<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct amdgpu_bo *bo =
            after-&gt;bo_va-&gt;<a href="http://base.bo" rel="noreferrer" target="_blank" moz-do-not-send="true">base.bo</a>;<br>
            &gt; -<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_it_insert(after,
            &amp;vm-&gt;va);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (after-&gt;flags &amp; AMDGPU_PTE_PRT)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_prt_get(adev);<br>
            &gt; -<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bo &amp;&amp; bo-&gt;tbo.base.resv ==
            vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!after-&gt;bo_va-&gt;base.moved)<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;amdgpu_vm_bo_moved(&amp;after-&gt;bo_va-&gt;base);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;} else {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kfree(after);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt; @@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct
            amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;INIT_LIST_HEAD(&amp;vm-&gt;evicted);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;INIT_LIST_HEAD(&amp;vm-&gt;relocated);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;INIT_LIST_HEAD(&amp;vm-&gt;moved);<br>
            &gt; +&nbsp; &nbsp; &nbsp;INIT_LIST_HEAD(&amp;vm-&gt;dirty);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;INIT_LIST_HEAD(&amp;vm-&gt;idle);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;INIT_LIST_HEAD(&amp;vm-&gt;invalidated);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;spin_lock_init(&amp;vm-&gt;status_lock);<br>
            &gt; @@ -2648,11 +2667,13 @@ void
            amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct
            seq_file *m)<br>
            &gt;&nbsp; &nbsp;{<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;struct amdgpu_bo_va *bo_va, *tmp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;u64 total_idle = 0;<br>
            &gt; +&nbsp; &nbsp; &nbsp;u64 total_dirty = 0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;u64 total_relocated = 0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;u64 total_moved = 0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;u64 total_invalidated = 0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;u64 total_done = 0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;unsigned int total_idle_objs = 0;<br>
            &gt; +&nbsp; &nbsp; &nbsp;unsigned int total_dirty_objs = 0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;unsigned int total_relocated_objs = 0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;unsigned int total_moved_objs = 0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;unsigned int total_invalidated_objs = 0;<br>
            &gt; @@ -2669,6 +2690,15 @@ void
            amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct
            seq_file *m)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;total_idle_objs = id;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;id = 0;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; +&nbsp; &nbsp; &nbsp;seq_puts(m, &quot;\tDirty BOs:\n&quot;);<br>
            &gt; +&nbsp; &nbsp; &nbsp;list_for_each_entry_safe(bo_va, tmp,
            &amp;vm-&gt;dirty, base.vm_status) {<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!bo_va-&gt;<a href="http://base.bo" rel="noreferrer" target="_blank" moz-do-not-send="true">base.bo</a>)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue;<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;total_dirty += amdgpu_bo_print_info(id++,
            bo_va-&gt;<a href="http://base.bo" rel="noreferrer" target="_blank" moz-do-not-send="true">base.bo</a>, m);<br>
            &gt; +&nbsp; &nbsp; &nbsp;}<br>
            &gt; +&nbsp; &nbsp; &nbsp;total_dirty_objs = id;<br>
            &gt; +&nbsp; &nbsp; &nbsp;id = 0;<br>
            &gt; +<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;seq_puts(m, &quot;\tRelocated BOs:\n&quot;);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;list_for_each_entry_safe(bo_va, tmp,
            &amp;vm-&gt;relocated, base.vm_status) {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!bo_va-&gt;<a href="http://base.bo" rel="noreferrer" target="_blank" moz-do-not-send="true">base.bo</a>)<br>
            &gt; @@ -2707,6 +2737,8 @@ void
            amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct
            seq_file *m)<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;seq_printf(m, &quot;\tTotal idle size:&nbsp; &nbsp; &nbsp; &nbsp;
            %12lld\tobjs:\t%d\n&quot;, total_idle,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; total_idle_objs);<br>
            &gt; +&nbsp; &nbsp; &nbsp;seq_printf(m, &quot;\tTotal dirty size:&nbsp; &nbsp; &nbsp;
            &nbsp;%12lld\tobjs:\t%d\n&quot;, total_dirty,<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; total_dirty_objs);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;seq_printf(m, &quot;\tTotal relocated size:&nbsp;
            &nbsp;%12lld\tobjs:\t%d\n&quot;, total_relocated,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; total_relocated_objs);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;seq_printf(m, &quot;\tTotal moved size:&nbsp; &nbsp; &nbsp;
            &nbsp;%12lld\tobjs:\t%d\n&quot;, total_moved,<br>
            &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
            &gt; index d9ab97eabda9..f91d4fcf80b8 100644<br>
            &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
            &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
            &gt; @@ -276,6 +276,9 @@ struct amdgpu_vm {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* per VM BOs moved, but not yet updated in the
            PT */<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;struct list_head&nbsp; &nbsp; &nbsp; &nbsp; moved;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; +&nbsp; &nbsp; &nbsp;/* normal and per VM BOs that are not moved, but
            have new PT entries */<br>
            &gt; +&nbsp; &nbsp; &nbsp;struct list_head&nbsp; &nbsp; &nbsp; &nbsp; dirty;<br>
            &gt; +<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* All BOs of this VM not currently in the state
            machine */<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;struct list_head&nbsp; &nbsp; &nbsp; &nbsp; idle;<br>
            &gt;&nbsp; &nbsp;<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------X7PC1HIgId3XhhZpATZyMHcS--
