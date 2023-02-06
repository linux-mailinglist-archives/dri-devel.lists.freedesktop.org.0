Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8E268C273
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 17:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2197B10E41D;
	Mon,  6 Feb 2023 16:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9B510E41D;
 Mon,  6 Feb 2023 16:05:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9HhbLSoVCjGNMquhzp3FPAf7q95MVqSk0Z1ViQmBOWumOj+fiKK2+6JQv7AgQBBr0esaySEcN5C3aH3+CX3PJBP/k1qIteKvKbG4plxlkXP54gno/XaB3U5Y5WKKnmKLziLtsIl/Z7N4iif6AnloAGcR87nNc2e4lmjwh0r6A4Np50FE7aMkhjYSDHmMX0PibdpVY1QMrbQaR734/ygpGoE4YK9iPMuXSpj8zNkD8sezuPX2fY5jxDyvK2m2Vs0y901D2WzOpQlIiJj9cMcdW8c3h/K8TRMN45hwUHc3ojjAaHKNaqGR4M7XmKBmhhFW46X5nc4LnhdeXfGGwWZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2akJmSbhwomxzjBPpG1H4f0s6noTqAh9mGpG8VKowgY=;
 b=bsLvy6d19bvXsZVI6KrBFRZkU/l7XW+zxA72awXDrEMkXL/nzgjYI33JYpdRMPlEwuu9qReuCyk6B2eZ+DBajKIQ656pkVY4QxXvpgAU382wQVpCF+J57drUtKlYOFanp0pUPe8VWQ1PKY1fitp9M9BP7bOxMImHhTa/Mc2RAL1YjY1TfBR5oSFZEtd76gUOI/ii5leeQx7MpOU2dgN200iAmR7381dPkaDhq1eb7YnsCmg8VFOql87Ym27T2ylrHzHI3FuNvr7EWNO4YtzI48oOX1N69W7JRrQpkBuYgcFiGYnuhbZahnBUHoeKoC7cmbixqEZwRZn6eqVvv66bDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2akJmSbhwomxzjBPpG1H4f0s6noTqAh9mGpG8VKowgY=;
 b=k29k5e+VCcom/oXR9k4jOrnJWe1hqatFTYc31fgSm9snYw1GjY1SulcCoVEKNdB3VdZ3mqhP/Lh8kBvFoStDdWrAUeYLPoQFKjKlP2UA0/cAB8ng74MwpzYYvCDMt+BUnvdZ+jZI8GsRmDbJ1IZMq8psfkEMXY4REhi4li6qDLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB8308.namprd12.prod.outlook.com (2603:10b6:610:131::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Mon, 6 Feb
 2023 16:05:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6064.032; Mon, 6 Feb 2023
 16:05:56 +0000
Message-ID: <c6c9b6af-f832-3cc3-2d03-29d5f7aaddef@amd.com>
Date: Mon, 6 Feb 2023 17:05:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amdgpu: Fix potential race processing vm->freed
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230203181005.4129175-1-robdclark@gmail.com>
 <2d5fc6f8-2247-8a8b-1174-eccdc2b08064@amd.com>
 <CAF6AEGtAqE-h06zgCzjr+R-WWj0ELfyKkD8KHZUYeo6cjS1ceQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGtAqE-h06zgCzjr+R-WWj0ELfyKkD8KHZUYeo6cjS1ceQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: cf48f588-f082-44a6-5774-08db085c077c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H+FqXCucBOro5oXIkVv7boppPAPOmUcxQGeSAng8+MoQCxsTxp/elvv3Q3EG1TaGlVH2lStQiy6Xce70HLmyeOZppERcHSoMjyDx7sg2L8tv946NqIlWdur7j1oDpWYjjtlypIpDAIbqo2gEKKWz5ZYfuCsv/LB2qq8QbtDm35Y0p6yefJrhZaFWYXdeIIoMPKt7YKNYRXA9lpzh2yd4ee1flqOBx1GTX5fXRIZ5prphwczSLPbTQH1R1AZK2G4sBydc6caQp4lgdXw5fj4g4r9AgRYrlLZ/gLUdHypB+otTrpBO2qLIc633rVOzbJhlJFm3eMmwdvmkvognw6xdzkqiVtLu3uU+TN+a2Ned3ZHsoqz7OLul3GeXkkj21ZUceEcugqYVZ+E4yP54rbA868MGFuafjYCf0S67L940r985dY6zYsBoWN7Yf737VM5UwoW7gZMgAgomGfBJPOQ63bu0wWHy7HwkBm8WU6C9CD3IKVi0yiwLAkygjoTQxAyf1eg9vYe2oh+lBkPQdtsx2EbKP8a0CrENP81CJAALGsOLDcU3oBuknCas+xMv9DLzeqI9Ctk64rvA52gf3pxJs385Jbc0ExvAJlveBjiVBkERPzXqLjM8L6L5qbv7Qf7a6f3gNf6dah+hh08nPrzq0mDavvXmoypEtP4fhxfjSQ9l0i0nT8+mV2HrcZnP2gmD+rNGrlIooniU+czcc4dYsyMpobmDQw6bKF15PAGaUxA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199018)(83380400001)(2616005)(8936002)(86362001)(36756003)(38100700002)(316002)(31696002)(54906003)(5660300002)(66574015)(8676002)(41300700001)(2906002)(53546011)(6506007)(31686004)(6512007)(66476007)(186003)(66946007)(66556008)(6666004)(478600001)(4326008)(6916009)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnN0bTBTRVNVcHhRMmRwT21hdmJwNWhNZGNCekkyak1wVDhMMnFIRWtoQlBC?=
 =?utf-8?B?Rkd1Rm9udWwzaytxczIyNGFKTEl3WG1yZTBRd2NycTN5aTBQcDZxOXdlMmRh?=
 =?utf-8?B?Q1J6RmNHdDlBcFlzbkxQdHpXS2c1L3EzV200NE9PQzZETU0ydFYrQnNVWSs2?=
 =?utf-8?B?clNWcStxN21aRGI2RmYrMm9wRjlYN2dsWXdZaGQvaVZValFQcXBOQ1I0UTYz?=
 =?utf-8?B?QnpNVFhrSG01T0xTRHp0bk9GRkxNYVdRK0QzQ1NhY05mYk1ZbFpkdHFnZWRj?=
 =?utf-8?B?amRCMFVDSHo0dUpWb2ZVYXljcU9tVWlpcHM4VjRFNUZTejdqb0RzQndJMW5M?=
 =?utf-8?B?NmtjdFFjdmRVQVRYQjh3ZFg3RitlWlBaY2RubW5QQkw3eXBhSjVHaVg2ZUEw?=
 =?utf-8?B?SVJzS01KR0RDUXVHckdVNG5tamYyVE1ONzVXSFZGS2c2NHh2YjJsSDRiLzFI?=
 =?utf-8?B?STRnc1BNWHFQaDBiN082VEtaMkgwNitYUXJZM2tIUWZwejE1ZGZXZkpGVXlv?=
 =?utf-8?B?eGZCWldVNFBFUjNqVW1xall6ZldheTFpanJ0dWVrTkV0M2I1amczbzR1NmJu?=
 =?utf-8?B?cnJERk9LUTU4TDFJMmk4ZVVySzYzcW9iYWxheElOeXQxcmRGSlZyMW14QXA3?=
 =?utf-8?B?WlltTmxUcU44bGFGVXVMdXdWTWJhendUZ2hlOUw0Y0Q5WHZIZnk1cEt2MTZr?=
 =?utf-8?B?ajlidzRuZTlqMi85WC9tREpocy9xdmMxeGdvS01yZXBLVGhUVUZwR08vcVFO?=
 =?utf-8?B?SURaNWRZTjAxbW1DNU9FZVVMNHNrN2owelp3TC9MbE9zajYzZ09ndC9pdGwx?=
 =?utf-8?B?bGp4bURqU0VpWFhsczJVVmJ2Rm96KzdoaGdhNWxFek5KZFpJSmlTUUdOc2p6?=
 =?utf-8?B?eFVjdVNIZXBmQWg0OC9tR2VUS09hWDN2MnkxdW9qR1Fwb0wxNEpUMHlaK0da?=
 =?utf-8?B?RWVJNlVPaHd1Z1RZTjJ0cVZ0NkRnS1VYVWQwVFE0Y25xbjJGRG94dlhEazQr?=
 =?utf-8?B?eXphQ2pyNjIvTElzb3RQRnUrTEVHNmpGQzlibE8xekVvTDlxeElad1ljS1Q5?=
 =?utf-8?B?WGNxZi9mYmxocUlEOW5UekdjeTJIbnZCaEQ5Ry9KOWVnODVST2M5YWR4VnB4?=
 =?utf-8?B?NTVyd2g2cmV5YkUwSnJsOXFqY2h2bXF3NG5UNm83ZjZDWGZxenVSREc4VzdE?=
 =?utf-8?B?M0xPazRyU0k2eXZRc3B5TDlpbWJabFZFYVVkRzFZQ3MxMmhxVnFWd2N2ejJz?=
 =?utf-8?B?bkxneG8vaEdTUFhORi8rUlFzSU1VbHFjcWVXSWpwcDlsa2FKN1RjRGtiMXl6?=
 =?utf-8?B?RU1BWitQRUxTMHFFdW9tNVRZYktwVkxSZWk0azFxZGM2c2k4OWVnbVMrSmtt?=
 =?utf-8?B?TTRQaXJPSnZFQUhEL0FnRHIxYklBSmVyaGNtcVMvak9pWEQ4U0FEa2ZMUHRW?=
 =?utf-8?B?WGZVcVI2WDF1NTN1ajlFaFRXUGdWM3FKSUtJY25Qa3VqblpPRDRuVURxNUIw?=
 =?utf-8?B?c1pqRHJGcHdCTGVRcCs5WXdCL2h5T1ZVemVJL081R1RiMTlJUnZOcHg5Zm5s?=
 =?utf-8?B?Q21FL2V4eVk1ZjRDOG1IM0xRNEtrUlp5aFZ5THEwdXllbVd6VlhSYUVuZlpT?=
 =?utf-8?B?U25aYUxFSEdNb2FDaDNycnovQXZRTTk0RkN3djhGKzlxWlV3ZUtZcXpQQ29o?=
 =?utf-8?B?SHcvUkZQVXpKTk9mOTdGRFczWXNnMHVmM1MvMC9XVmgxbldzQ2kyb3p0d3Ay?=
 =?utf-8?B?QWIvNUQ2a3dWaFhqMTJaRjljSXdxSVJUQlkya0I5d294SFR5bllGZFBRZUhv?=
 =?utf-8?B?SGxUcXBST0pZSDVRQ21DL3NLczczZGJQWWZNdDlGQzF6S1FzTDE3S1BSN082?=
 =?utf-8?B?UWl6UTUwYnJLK1pjbVlyL3VzcWVKQjlUaHlaZXJmN3V6RklWeUNtRWVQOGl2?=
 =?utf-8?B?bTNDcmxWN3ZHcURyYUlEVUVuQjI0L3ZuUnlwa3ZEVVJtUWkrMTlWM3p0ZkN3?=
 =?utf-8?B?MDNGVWRUcTdhL3dnN2krMUtSakVLZjdIT2ZCQ3ZGSzk0MmNiZlNuZlByWmI2?=
 =?utf-8?B?YWx6RUp6SkRtSnc3dm5FYXZUMTU0dGR1S2hDMXIyOWExa3BGN3l3V0xSRWJn?=
 =?utf-8?B?MFBOY2QxaEtrNW9FeWp1R3ZsQ3BvcFJZUHBxZ1ZYWkRicVV6MXB4clpPMlN6?=
 =?utf-8?Q?VpgLu+ADy36pPlGYwkWbPute46r9ocvkVQfx6rwwiHCc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf48f588-f082-44a6-5774-08db085c077c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 16:05:56.0691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lo5qKFOv0M1coQbY1mwChyFGm7i23OlXQK+o9rXlegqndxZpnXuqB4JcGe1R9fMh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8308
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Yang <Philip.Yang@amd.com>,
 Jammy Zhou <Jammy.Zhou@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Qiang Yu <qiang.yu@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.02.23 um 16:52 schrieb Rob Clark:
> On Mon, Feb 6, 2023 at 2:15 AM Christian König <christian.koenig@amd.com> wrote:
>> Am 03.02.23 um 19:10 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> If userspace calls the AMDGPU_CS ioctl from multiple threads, because
>>> the vm is global to the drm_file, you can end up with multiple threads
>>> racing in amdgpu_vm_clear_freed().  So the freed list should be
>>> protected with the status_lock, similar to other vm lists.
>> Well this is nonsense. To process the freed list the VM root PD lock
>> must be held anyway.
>>
>> If we have a call path where this isn't true then we have a major bug at
>> a different place here.
> I'm not super familiar w/ the amdgpu cs parser stuff, but the only
> thing that I'm seeing that protects things is the bo_list_mutex and it
> isn't clear to me that this is 1:1 with the vm (it looks like it is
> not).

Do you have a backtrace?

Take a look at the reservation object of vm->root.bo. This should always 
be locked first before doing *anything* in a CS.

If that isn't the case we have a much worse problem.

> (I cc'd you on the bug report, jfyi)

I unfortunately only get a permission denied when I try to access that one.

Regards,
Christian.

>
> BR,
> -R
>
>> Regards,
>> Christian.
>>
>>> Fixes: d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 33 ++++++++++++++++++++++----
>>>    1 file changed, 29 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index b9441ab457ea..aeed7bc1512f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -1240,10 +1240,19 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>>>        struct amdgpu_bo_va_mapping *mapping;
>>>        uint64_t init_pte_value = 0;
>>>        struct dma_fence *f = NULL;
>>> +     struct list_head freed;
>>>        int r;
>>>
>>> -     while (!list_empty(&vm->freed)) {
>>> -             mapping = list_first_entry(&vm->freed,
>>> +     /*
>>> +      * Move the contents of the VM's freed list to a local list
>>> +      * that we can iterate without racing against other threads:
>>> +      */
>>> +     spin_lock(&vm->status_lock);
>>> +     list_replace_init(&vm->freed, &freed);
>>> +     spin_unlock(&vm->status_lock);
>>> +
>>> +     while (!list_empty(&freed)) {
>>> +             mapping = list_first_entry(&freed,
>>>                        struct amdgpu_bo_va_mapping, list);
>>>                list_del(&mapping->list);
>>>
>>> @@ -1258,6 +1267,15 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>>>                amdgpu_vm_free_mapping(adev, vm, mapping, f);
>>>                if (r) {
>>>                        dma_fence_put(f);
>>> +
>>> +                     /*
>>> +                      * Move any unprocessed mappings back to the freed
>>> +                      * list:
>>> +                      */
>>> +                     spin_lock(&vm->status_lock);
>>> +                     list_splice_tail(&freed, &vm->freed);
>>> +                     spin_unlock(&vm->status_lock);
>>> +
>>>                        return r;
>>>                }
>>>        }
>>> @@ -1583,11 +1601,14 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
>>>        mapping->bo_va = NULL;
>>>        trace_amdgpu_vm_bo_unmap(bo_va, mapping);
>>>
>>> -     if (valid)
>>> +     if (valid) {
>>> +             spin_lock(&vm->status_lock);
>>>                list_add(&mapping->list, &vm->freed);
>>> -     else
>>> +             spin_unlock(&vm->status_lock);
>>> +     } else {
>>>                amdgpu_vm_free_mapping(adev, vm, mapping,
>>>                                       bo_va->last_pt_update);
>>> +     }
>>>
>>>        return 0;
>>>    }
>>> @@ -1671,7 +1692,9 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
>>>                    tmp->last = eaddr;
>>>
>>>                tmp->bo_va = NULL;
>>> +             spin_lock(&vm->status_lock);
>>>                list_add(&tmp->list, &vm->freed);
>>> +             spin_unlock(&vm->status_lock);
>>>                trace_amdgpu_vm_bo_unmap(NULL, tmp);
>>>        }
>>>
>>> @@ -1788,7 +1811,9 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
>>>                amdgpu_vm_it_remove(mapping, &vm->va);
>>>                mapping->bo_va = NULL;
>>>                trace_amdgpu_vm_bo_unmap(bo_va, mapping);
>>> +             spin_lock(&vm->status_lock);
>>>                list_add(&mapping->list, &vm->freed);
>>> +             spin_unlock(&vm->status_lock);
>>>        }
>>>        list_for_each_entry_safe(mapping, next, &bo_va->invalids, list) {
>>>                list_del(&mapping->list);

