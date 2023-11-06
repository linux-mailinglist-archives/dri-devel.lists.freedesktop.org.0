Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241BA7E25AE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 14:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4AF10E31A;
	Mon,  6 Nov 2023 13:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7953010E31A;
 Mon,  6 Nov 2023 13:34:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgZIjOuhBE3BHLaYLC1b64bZgaqWTPNQZ1Yc3ERgne2tHOn+sUdwv5ptNrLw50EOSOZJ6omvuWk7d12AvKXCgcU5AM1/J6Ye847DdtXlgC0xm+aWsnyRB/liBQ4ZrLNRCqno9fX3rZOndHsr1Uw4EHmnR2QueEkZL7d8dkLRdrbqWcGm+FcooYId8jCZGquvDiUpGio1/g6YmtQ5+u7ezEXf8CXxz07crFrE2ukJKQtGbd7i8CHqXiA8vKKFuw4H0+TAMyxAthHNOV6wmPvlmu+6kcaL/r18Z6hwug46Jlq3CUvl+sH7BCKxqZeJQ5bJcw+tkFzhYn+ULxL87Zg4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJUpwGvwAsGNKEzP5f1uKpttVBzMDnnwwszcj07/RUg=;
 b=iOVB7gypL9wK+FeygT+K8UGfs9IBDbU6W6UUyPBVG/JGGKt9Nwk9dNbgsQBDSSpM5s0vW3fX5sGXPJzX+zVeXOZgjbXHFLrzN9RtMmN76PJqqukgrx0JrgFm7RP4GCiUm+qxJrW9/7yfCOsihgdCaJ1o0ezJD5bSMJh4xHck+H6o6YSSEbZ6ZQN6Qae6iSzW1tf2P0/UykQh+gPMHS7JfeRue0J4VsitCVezXqzs/1DQWsPOYu5SvT1UVb7Fo83y+mGWQlrzwKkUxlFS2B+BHIuih4BoXg7RfjeHByx5yu37vSzNxkJ0xNOqMGIzOFOcDtgZbz5ffYsB+0bHQFT5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJUpwGvwAsGNKEzP5f1uKpttVBzMDnnwwszcj07/RUg=;
 b=YYvf2OLr+wbNmIeZE4Oee4WKtWprfvg3Mtjhm5vyDca+BCoRUZ2qCzBOdf1na50NqTsA3Y/U6OA5eCMBro4mtHSQU7yzpV/CR+7nH94nx14BzsoSEYKH4BvOEqI08QGtNxDUUeUKSoWc6/BKjyfTfBLmdfTzlgmpPw3TGwQbpsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6372.namprd12.prod.outlook.com (2603:10b6:930:e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 13:34:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 13:34:02 +0000
Content-Type: multipart/alternative;
 boundary="------------3hoCGbxeVeZUMDTuprTXv4iZ"
Message-ID: <9ea730cc-0f69-4acb-bb5a-4c105c420646@amd.com>
Date: Mon, 6 Nov 2023 14:33:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/amdgpu: Flush VM updates for split bindings
 eagerly.
Content-Language: en-US
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-4-ishitatsuyuki@gmail.com>
 <30bcd9b7-903d-435e-9318-346777a3fd55@amd.com>
 <CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=WkBpJyJrmqZ=rtMA@mail.gmail.com>
 <ffafa427-e755-4f86-8aab-8e69ef63325a@amd.com>
 <7BE47209-2D0C-4E21-8CFB-418D5FA4759C@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7BE47209-2D0C-4E21-8CFB-418D5FA4759C@gmail.com>
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc7c68e-4cb2-4cdf-9894-08dbdecd09e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uhynSXclUTZdEGAdiZTchI4vsBoP0lfK5xqOjp0WuhTBwci0QYdTO9Ss13DaVKKdzPBg3hD+bgK54AeZ4Z+JBnWgDUJCG1CICOtAJFcsC99v7mM/zCofw2krjABKTfF6JUDjWOXyQeooxuajZ+hi6kSh05QEEHhW6xeChSN0uzRZZX9fC2qe/72YvrHOquszsI6PnbjotjIaX9B/jm40eUm2+vo9ItXn03niiDVaVfn0P0P5RBiFVwwRdsBokmVYWaOurkoG9sxBZ7Sm8a8BOOZAK2qOPjFQXsvlZSER9GXZHA83QXtLc3qeMt19OnmVkbX1TQTB8O+pSJK7IHy/SwCGJGkwvTWkucr3NUgH2FPC7YSDrPdqhTsFPoW4sI3sJR7AVr6jLK+R6n1CnxRGusN+/1MjWMRBG7s74v67UzY8HqWnahJXuNb0fzHlZCbERPDIT1Ot4knTjJmK4puWMVw92LoIbYVUG+MVJPCvgng2U9bA2ZMQgmZfvcfGsiJqgiyD7rFgvWCgyA61GjVZkPsswXsbaz3tVw2ks62vdLKLFwbZODHPbSG2iy3pHi08W14mdF4UyvpmEyqF5i7sptsGD5dta0TkXUZ+vJbff6MEEvLIoeo2UxuPS0HzxnwVUwIRNeSBEQeWfonNdf+xhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(366004)(376002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(31686004)(6666004)(53546011)(6512007)(33964004)(6506007)(6486002)(31696002)(36756003)(86362001)(38100700002)(478600001)(166002)(5660300002)(2906002)(30864003)(15650500001)(26005)(66574015)(83380400001)(2616005)(8676002)(4326008)(66476007)(66946007)(316002)(6916009)(8936002)(41300700001)(66556008)(45980500001)(43740500002)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3dtNkhQUTNNUHJKVngwaWNsTE1sVi9MNlhvYzNaWFdCWkhNV3ZaWUpZeUFS?=
 =?utf-8?B?L0UvK01jVXpqeEJvQllhbmdDL3dsQ0lUc25EVzIyWG5kbDQvaTVlRVlPZUtn?=
 =?utf-8?B?djFMeGppU1F3and3VE1qT0d0bnBnSE5hVFpibWdYWkcxSXBNSUdUUlh1K1JP?=
 =?utf-8?B?aWtJK0xLNUJuQy94NVQ3STk3OStSQnNQQks3Z1QzQUwvcFVTZkVYT0dlQSt1?=
 =?utf-8?B?ZUJiMkRLdG5IZDNCU0s3WEdVWkdpOGJLU2VLS3N5ci9sL2NqZ2hUa3FEVjVn?=
 =?utf-8?B?UEdMY243aFUxa3B0Z3FVR1A1MjExWWh6dml6bTR4VzAybFFLVk1MdlJwNXhx?=
 =?utf-8?B?NElvSEdKWXZYTEpnZTUzUmcyL1NiM0p0MENTSEw5VE9pSmdPOTlIOHNCQkZt?=
 =?utf-8?B?cGV4R1pJc0d5U2wyMGVaMmtJdTBZdXlHZTJUTlREeGI5VTQ5VThSSUZiczBX?=
 =?utf-8?B?ZXVhOVdpcnd1K0c1b05XTU9jK0g1d0xyWi9UbFN1SFFVOGRydzF6UGM2bTRU?=
 =?utf-8?B?SUhWM01CemNKS0xyQlQzTWJ5eWFONTFmOXphZENzU2t3SWlsY0tCSnYvVm9S?=
 =?utf-8?B?VTZHVklBdTBkKzFab1BBRCsyOGFhYmE4Q2N5cGRjeWd6cjBRMXFyRjRwYUNw?=
 =?utf-8?B?WFdiYzFCZHVsamZ3cTQrdks1citLUjRnekdZYjQwWWxHZ1VneUNMNHVXUkJh?=
 =?utf-8?B?Zm1vZUVUa1RQK0RValpsT3U0YVc1elBQbE5COWpZZmpmVC9GT0l2bXgrSVR1?=
 =?utf-8?B?MTdiUU5CbUwxNmNPR1BuY2V6N01sRG1NVG9mNVNzN3AweFVOcXM4WmxtVkh5?=
 =?utf-8?B?bEN4RU8rendWYTFLNzdXR2JqdUI3YW5yRzhZWkovd1FMNk1PWVM2MW9YR3N1?=
 =?utf-8?B?eFBLYlMrc1plNjZPbWNoNnVQVk5neXRFdU03amtUUGM2V1pJNGhGc2szQ1VB?=
 =?utf-8?B?YWVXb0Z4OWRjblc0QVZ2UTlMSE40bDNtWkFNclpMYzh2TVFibW1VYU9YTTdJ?=
 =?utf-8?B?TzA5WWJDYlJJNHBCdGlTbmN5REhZNThsanljaGluZkxOMUUyWEFGMVRYL3NR?=
 =?utf-8?B?LzZwbUhlQTRKckJMYmV5YXBJVGgrQzgrOGJHTk8yYkN3MGs4eEpPTUpXK1By?=
 =?utf-8?B?eFdzK29iSmJkRlVZSXNKcFVkREVaRmpEcDQvUFFBbFBnM2hWSW05M3lZbWo3?=
 =?utf-8?B?NGlWYmdwekVrVlQ3ZXN6dW95ODRPY1ArTkdSZXVYS1BhQU5KWXIvNGppeUFI?=
 =?utf-8?B?azNFM3lVVlRXOVppdDRVTXhGTUk2ZU9nTHp2Q3AvVzBhSytJUm8zcG5CTk4r?=
 =?utf-8?B?endTenYvcFV3T2U4dGVyRkgvclNtZ1BWKzRRcEQxcWczZWZGWjJjemkyUFVU?=
 =?utf-8?B?S0hGb202eXNCZ3hBR2YwZVdjWWs2Q0N3Rk1IOSswMkZBMUJlNDMyRStLWkpu?=
 =?utf-8?B?NVNaQVZETXlSaDJoRjNhUGErNXFZVGxsTGpMdEhtQnRtdTZEeWpSN3R5NnYr?=
 =?utf-8?B?OHZ2ME84QXZoTHRHc2pidDIvOFF5SnZTelpDYmhTZVFMblRFOWJyQ1hJMjdt?=
 =?utf-8?B?U3BtK2dadlBvZklEMU1pM0N3ZEtVeU0vdDU4V1V2UWxQeS9KTmdLQ2Q0OXBm?=
 =?utf-8?B?K2txVXNMckVwK0pCWC9nbTVnRHRtSFNJN1RFOHk1N2tBUjcwdHBHL2JEeUxU?=
 =?utf-8?B?OVIwUk1BOU1ianJtMnI5RjVaR2lmNDBJd3NyYjR3VzV0cDBjK052QWhYeFd0?=
 =?utf-8?B?N2ZMOG9wK2I5QjdUb0RYeWdDekl5dzdjYksxU0xqTml0Zk55dE12WHhaZGc1?=
 =?utf-8?B?anBBOGN3WXJsamUyQ0RNNjRIWVlLbGpMTWNEUDFyUXhPeld0Y2FpSmZPSWdY?=
 =?utf-8?B?Q05GSFdyNGx0VktHRjlwdnBRNFlCNHVodUpUYnltRkh1N2xxZUdieFhDazdy?=
 =?utf-8?B?akFMNi9LVzhyck5Uek9TTi9WeUs2QjNKdVJjL0VhTStqZ2RCN2R1ZHNzSmE4?=
 =?utf-8?B?QlRaYUdsVTlUNll6eC9hZDdOdU5PSVN5YlA4eldPRS9PT0wvN2Jyd0dJcjFW?=
 =?utf-8?B?cTZ3Z0JjbWxDS04zYUZxaEl2ZWJmREMzTnZBWHFCcWNBYVhXQWpaRmJaMkZp?=
 =?utf-8?Q?f4bY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc7c68e-4cb2-4cdf-9894-08dbdecd09e2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 13:34:02.0777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: on1RssU3WZuhjceWwGu4f1YkdkH8swBo/XMbQ2mi4yNwX8yLcFHu3BN3zfm7v2zp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6372
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------3hoCGbxeVeZUMDTuprTXv4iZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 06.11.23 um 08:56 schrieb Tatsuyuki Ishi:
>
>> On Oct 31, 2023, at 23:07, Christian König <christian.koenig@amd.com> 
>> wrote:
>>
>> Am 31.10.23 um 14:59 schrieb Bas Nieuwenhuizen:
>>>
>>>
>>> On Tue, Oct 31, 2023 at 2:57 PM Christian König 
>>> <christian.koenig@amd.com> wrote:
>>>
>>>     Am 31.10.23 um 14:40 schrieb Tatsuyuki Ishi:
>>>     > The current amdgpu_gem_va_update_vm only tries to perform
>>>     updates for the
>>>     > BO specified in the GEM ioctl; however, when a binding is
>>>     split, the
>>>     > adjacent bindings also need to be updated. Such updates
>>>     currently ends up
>>>     > getting deferred until next submission which causes stalls.
>>>
>>>     Yeah, that is a necessity. The hardware simply doesn't support
>>>     what you
>>>     try to do here in all cases.
>>>
>>>
>>> What can the hardware not do here? Is this just needing to wait for 
>>> TLB flushes before we can free pagetables, can we just delay that?
>>
>> On some hardware generations (especially Navi1x, but also everything 
>> older than Polaris) you can't invalidate the TLB while it is in use.
>>
>> For Polaris and older it just means that you don't have a guarantee 
>> that the shader can't access the memory any more. So delaying the 
>> free operation helps here.
>>
>> But for Navi1x it's a workaround for a hardware bug. If you try to 
>> invalidate the TLB while it is in use you can potentially triggering 
>> memory accesses to random addresses.
>>
>> That's why we still delay TLB invalidation's to the next CS and use a 
>> new VMID for each submission instead of invalidating the old one.
>
> Thanks for the information. I looked into the VMID allocation logic 
> and I see that if concurrent_flush is false, then we defer any flush 
> (or VMID reuse that requires a flush) until that VMID is idle.
>
> What patch #3 ends up doing is just performing the PT update right 
> away. Any required TLB update is deferred by amdgpu_vm_update_range 
> through the increment of tlb_seq, and amdgpu_vmid.c is responsible for 
> doing the actual TLB flush in a manner that does not trigger the bug.
>
> Can you confirm that this would be fine for the current hardware?

Yeah, that should work. I'm just think about the UAPI a bit, we should 
probably improve this to use something like a drm_syncobj instead of 
just a flag to be future prove.

Christian.

>
> Tatsuyuki.
>
>>
>> I'm currently working on changing that for Navi2x and newer (maybe 
>> Vega as well), but this is something you can really only do on some 
>> hw generations after validating that it works.
>>
>> Regards,
>> Christian.
>>
>>>
>>>
>>>     So this approach won't work in general.
>>>
>>>     Regards,
>>>     Christian.
>>>
>>>     >
>>>     > Introduce a new state "dirty", shared between per-VM BOs and
>>>     traditional
>>>     > BOs, containing all BOs that have pending updates in `invalids`.
>>>     > amdgpu_gem_va_update_vm will now simply flush any pending
>>>     updates for BOs
>>>     > in the dirty state.
>>>     >
>>>     > Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
>>>     > ---
>>>     >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 18 ++++---
>>>     >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 66
>>>     ++++++++++++++++++-------
>>>     >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  | 3 ++
>>>     >   3 files changed, 63 insertions(+), 24 deletions(-)
>>>     >
>>>     > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>     > index a1b15d0d6c48..01d3a97248b0 100644
>>>     > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>     > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>     > @@ -604,10 +604,9 @@ int amdgpu_gem_metadata_ioctl(struct
>>>     drm_device *dev, void *data,
>>>     >    * vital here, so they are not reported back to userspace.
>>>     >    */
>>>     >   static void amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
>>>     > -                                 struct amdgpu_vm *vm,
>>>     > -                                 struct amdgpu_bo_va *bo_va,
>>>     > -                                 uint32_t operation)
>>>     > +                                 struct amdgpu_vm *vm)
>>>     >   {
>>>     > +     struct amdgpu_bo_va *bo_va;
>>>     >       int r;
>>>     >
>>>     >       if (!amdgpu_vm_ready(vm))
>>>     > @@ -617,12 +616,18 @@ static void
>>>     amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
>>>     >       if (r)
>>>     >               goto error;
>>>     >
>>>     > -     if (operation == AMDGPU_VA_OP_MAP ||
>>>     > -         operation == AMDGPU_VA_OP_REPLACE) {
>>>     > +     spin_lock(&vm->status_lock);
>>>     > +     while (!list_empty(&vm->dirty)) {
>>>     > +             bo_va = list_first_entry(&vm->dirty, struct
>>>     amdgpu_bo_va,
>>>     > + base.vm_status);
>>>     > +  spin_unlock(&vm->status_lock);
>>>     > +
>>>     >               r = amdgpu_vm_bo_update(adev, bo_va, false);
>>>     >               if (r)
>>>     >                       goto error;
>>>     > +  spin_lock(&vm->status_lock);
>>>     >       }
>>>     > +     spin_unlock(&vm->status_lock);
>>>     >
>>>     >       r = amdgpu_vm_update_pdes(adev, vm, false);
>>>     >
>>>     > @@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct drm_device
>>>     *dev, void *data,
>>>     >               break;
>>>     >       }
>>>     >       if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) &&
>>>     !amdgpu_vm_debug)
>>>     > -             amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
>>>     > -  args->operation);
>>>     > +             amdgpu_gem_va_update_vm(adev, &fpriv->vm);
>>>     >
>>>     >   error:
>>>     >       drm_exec_fini(&exec);
>>>     > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>     > index dd6f72e2a1d6..01d31891cd05 100644
>>>     > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>     > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>     > @@ -191,6 +191,21 @@ static void
>>>     amdgpu_vm_bo_set_evicted(struct amdgpu_vm_bo_base *vm_bo, bool evict
>>>     >  spin_unlock(&vm_bo->vm->status_lock);
>>>     >   }
>>>     >
>>>     > +/**
>>>     > + * amdgpu_vm_bo_dirty - vm_bo is dirty
>>>     > + *
>>>     > + * @vm_bo: vm_bo which is dirty
>>>     > + *
>>>     > + * State for normal and per VM BOs that are not moved, but
>>>     have new entries in
>>>     > + * bo_va->invalids.
>>>     > + */
>>>     > +static void amdgpu_vm_bo_dirty(struct amdgpu_vm_bo_base *vm_bo)
>>>     > +{
>>>     > +  spin_lock(&vm_bo->vm->status_lock);
>>>     > +     list_move(&vm_bo->vm_status, &vm_bo->vm->dirty);
>>>     > +  spin_unlock(&vm_bo->vm->status_lock);
>>>     > +}
>>>     > +
>>>     >   /**
>>>     >    * amdgpu_vm_bo_moved - vm_bo is moved
>>>     >    *
>>>     > @@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct
>>>     amdgpu_vm *vm,
>>>     >       list_for_each_entry_safe(bo_va, tmp, &vm->evicted,
>>>     base.eviction_status)
>>>     >               amdgpu_vm_bo_get_memory(bo_va, stats);
>>>     >
>>>     > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty,
>>>     base.vm_status)
>>>     > +             amdgpu_vm_bo_get_memory(bo_va, stats);
>>>     > +
>>>     >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated,
>>>     base.vm_status)
>>>     >               amdgpu_vm_bo_get_memory(bo_va, stats);
>>>     >
>>>     > @@ -1411,6 +1429,17 @@ int amdgpu_vm_handle_moved(struct
>>>     amdgpu_device *adev,
>>>     >                       dma_resv_unlock(resv);
>>>     >  spin_lock(&vm->status_lock);
>>>     >       }
>>>     > +
>>>     > +     while (!list_empty(&vm->dirty)) {
>>>     > +             bo_va = list_first_entry(&vm->dirty, struct
>>>     amdgpu_bo_va,
>>>     > + base.vm_status);
>>>     > +  spin_unlock(&vm->status_lock);
>>>     > +
>>>     > +             r = amdgpu_vm_bo_update(adev, bo_va, false);
>>>     > +             if (r)
>>>     > +                     return r;
>>>     > +  spin_lock(&vm->status_lock);
>>>     > +     }
>>>     >       spin_unlock(&vm->status_lock);
>>>     >
>>>     >       return 0;
>>>     > @@ -1476,19 +1505,16 @@ static void
>>>     amdgpu_vm_bo_insert_map(struct amdgpu_device *adev,
>>>     >                                   struct amdgpu_bo_va_mapping
>>>     *mapping)
>>>     >   {
>>>     >       struct amdgpu_vm *vm = bo_va->base.vm;
>>>     > -     struct amdgpu_bo *bo = bo_va->base.bo <http://base.bo/>;
>>>     >
>>>     >       mapping->bo_va = bo_va;
>>>     >       list_add(&mapping->list, &bo_va->invalids);
>>>     >       amdgpu_vm_it_insert(mapping, &vm->va);
>>>     > +     if (!bo_va->base.moved)
>>>     > +  amdgpu_vm_bo_dirty(&bo_va->base);
>>>     >
>>>     >       if (mapping->flags & AMDGPU_PTE_PRT)
>>>     >               amdgpu_vm_prt_get(adev);
>>>     >
>>>     > -     if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
>>>     > -         !bo_va->base.moved) {
>>>     > -  amdgpu_vm_bo_moved(&bo_va->base);
>>>     > -     }
>>>     >       trace_amdgpu_vm_bo_map(bo_va, mapping);
>>>     >   }
>>>     >
>>>     > @@ -1725,6 +1751,8 @@ int amdgpu_vm_bo_clear_mappings(struct
>>>     amdgpu_device *adev,
>>>     >                       before->flags = tmp->flags;
>>>     >                       before->bo_va = tmp->bo_va;
>>>     >  list_add(&before->list, &tmp->bo_va->invalids);
>>>     > +                     if (!tmp->bo_va->base.moved)
>>>     > +  amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>>>     >               }
>>>     >
>>>     >               /* Remember mapping split at the end */
>>>     > @@ -1736,6 +1764,8 @@ int amdgpu_vm_bo_clear_mappings(struct
>>>     amdgpu_device *adev,
>>>     >                       after->flags = tmp->flags;
>>>     >                       after->bo_va = tmp->bo_va;
>>>     >  list_add(&after->list, &tmp->bo_va->invalids);
>>>     > +                     if (!tmp->bo_va->base.moved)
>>>     > +  amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>>>     >               }
>>>     >
>>>     >               list_del(&tmp->list);
>>>     > @@ -1761,30 +1791,18 @@ int amdgpu_vm_bo_clear_mappings(struct
>>>     amdgpu_device *adev,
>>>     >
>>>     >       /* Insert partial mapping before the range */
>>>     >       if (!list_empty(&before->list)) {
>>>     > -             struct amdgpu_bo *bo = before->bo_va->base.bo
>>>     <http://base.bo/>;
>>>     > -
>>>     >               amdgpu_vm_it_insert(before, &vm->va);
>>>     >               if (before->flags & AMDGPU_PTE_PRT)
>>>     >  amdgpu_vm_prt_get(adev);
>>>     > -
>>>     > -             if (bo && bo->tbo.base.resv ==
>>>     vm->root.bo->tbo.base.resv &&
>>>     > -  !before->bo_va->base.moved)
>>>     > -  amdgpu_vm_bo_moved(&before->bo_va->base);
>>>     >       } else {
>>>     >               kfree(before);
>>>     >       }
>>>     >
>>>     >       /* Insert partial mapping after the range */
>>>     >       if (!list_empty(&after->list)) {
>>>     > -             struct amdgpu_bo *bo = after->bo_va->base.bo
>>>     <http://base.bo/>;
>>>     > -
>>>     >               amdgpu_vm_it_insert(after, &vm->va);
>>>     >               if (after->flags & AMDGPU_PTE_PRT)
>>>     >  amdgpu_vm_prt_get(adev);
>>>     > -
>>>     > -             if (bo && bo->tbo.base.resv ==
>>>     vm->root.bo->tbo.base.resv &&
>>>     > -  !after->bo_va->base.moved)
>>>     > -  amdgpu_vm_bo_moved(&after->bo_va->base);
>>>     >       } else {
>>>     >               kfree(after);
>>>     >       }
>>>     > @@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct amdgpu_device
>>>     *adev, struct amdgpu_vm *vm, int32_t xcp
>>>     >       INIT_LIST_HEAD(&vm->evicted);
>>>     >       INIT_LIST_HEAD(&vm->relocated);
>>>     >       INIT_LIST_HEAD(&vm->moved);
>>>     > +     INIT_LIST_HEAD(&vm->dirty);
>>>     >       INIT_LIST_HEAD(&vm->idle);
>>>     >  INIT_LIST_HEAD(&vm->invalidated);
>>>     >  spin_lock_init(&vm->status_lock);
>>>     > @@ -2648,11 +2667,13 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>     amdgpu_vm *vm, struct seq_file *m)
>>>     >   {
>>>     >       struct amdgpu_bo_va *bo_va, *tmp;
>>>     >       u64 total_idle = 0;
>>>     > +     u64 total_dirty = 0;
>>>     >       u64 total_relocated = 0;
>>>     >       u64 total_moved = 0;
>>>     >       u64 total_invalidated = 0;
>>>     >       u64 total_done = 0;
>>>     >       unsigned int total_idle_objs = 0;
>>>     > +     unsigned int total_dirty_objs = 0;
>>>     >       unsigned int total_relocated_objs = 0;
>>>     >       unsigned int total_moved_objs = 0;
>>>     >       unsigned int total_invalidated_objs = 0;
>>>     > @@ -2669,6 +2690,15 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>     amdgpu_vm *vm, struct seq_file *m)
>>>     >       total_idle_objs = id;
>>>     >       id = 0;
>>>     >
>>>     > +     seq_puts(m, "\tDirty BOs:\n");
>>>     > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty,
>>>     base.vm_status) {
>>>     > +             if (!bo_va->base.bo <http://base.bo/>)
>>>     > +                     continue;
>>>     > +             total_dirty += amdgpu_bo_print_info(id++,
>>>     bo_va->base.bo <http://base.bo/>, m);
>>>     > +     }
>>>     > +     total_dirty_objs = id;
>>>     > +     id = 0;
>>>     > +
>>>     >       seq_puts(m, "\tRelocated BOs:\n");
>>>     >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated,
>>>     base.vm_status) {
>>>     >               if (!bo_va->base.bo <http://base.bo/>)
>>>     > @@ -2707,6 +2737,8 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>     amdgpu_vm *vm, struct seq_file *m)
>>>     >
>>>     >       seq_printf(m, "\tTotal idle size:  
>>>     %12lld\tobjs:\t%d\n", total_idle,
>>>     >                  total_idle_objs);
>>>     > +     seq_printf(m, "\tTotal dirty size:
>>>      %12lld\tobjs:\t%d\n", total_dirty,
>>>     > +                total_dirty_objs);
>>>     >       seq_printf(m, "\tTotal relocated size:
>>>      %12lld\tobjs:\t%d\n", total_relocated,
>>>     >                  total_relocated_objs);
>>>     >       seq_printf(m, "\tTotal moved size:
>>>      %12lld\tobjs:\t%d\n", total_moved,
>>>     > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>     > index d9ab97eabda9..f91d4fcf80b8 100644
>>>     > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>     > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>     > @@ -276,6 +276,9 @@ struct amdgpu_vm {
>>>     >       /* per VM BOs moved, but not yet updated in the PT */
>>>     >       struct list_head        moved;
>>>     >
>>>     > +     /* normal and per VM BOs that are not moved, but have
>>>     new PT entries */
>>>     > +     struct list_head        dirty;
>>>     > +
>>>     >       /* All BOs of this VM not currently in the state machine */
>>>     >       struct list_head        idle;
>>>     >
>>>
>>
>

--------------3hoCGbxeVeZUMDTuprTXv4iZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 06.11.23 um 08:56 schrieb Tatsuyuki Ishi:<br>
    <blockquote type="cite" cite="mid:7BE47209-2D0C-4E21-8CFB-418D5FA4759C@gmail.com">
      
      <br>
      <div>
        <blockquote type="cite">
          <div>On Oct 31, 2023, at 23:07, Christian König
            <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:</div>
          <br class="Apple-interchange-newline">
          <div>
            <div> Am 31.10.23 um 14:59 schrieb Bas Nieuwenhuizen:<br>
              <blockquote type="cite" cite="mid:CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=WkBpJyJrmqZ=rtMA@mail.gmail.com">
                <div dir="ltr">
                  <div dir="ltr"><br>
                  </div>
                  <br>
                  <div class="gmail_quote">
                    <div dir="ltr" class="gmail_attr">On Tue, Oct 31,
                      2023 at 2:57 PM Christian König &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am
                      31.10.23 um 14:40 schrieb Tatsuyuki Ishi:<br>
                      &gt; The current amdgpu_gem_va_update_vm only
                      tries to perform updates for the<br>
                      &gt; BO specified in the GEM ioctl; however, when
                      a binding is split, the<br>
                      &gt; adjacent bindings also need to be updated.
                      Such updates currently ends up<br>
                      &gt; getting deferred until next submission which
                      causes stalls.<br>
                      <br>
                      Yeah, that is a necessity. The hardware simply
                      doesn't support what you <br>
                      try to do here in all cases.<br>
                    </blockquote>
                    <div><br>
                    </div>
                    <div>What can the hardware not do here? Is this just
                      needing to wait for TLB flushes before we can free
                      pagetables, can we just delay that?</div>
                  </div>
                </div>
              </blockquote>
              <br>
              On some hardware generations (especially Navi1x, but also
              everything older than Polaris) you can't invalidate the
              TLB while it is in use.<br>
              <br>
              For Polaris and older it just means that you don't have a
              guarantee that the shader can't access the memory any
              more. So delaying the free operation helps here.<br>
              <br>
              But for Navi1x it's a workaround for a hardware bug. If
              you try to invalidate the TLB while it is in use you can
              potentially triggering memory accesses to random
              addresses.<br>
              <br>
              That's why we still delay TLB invalidation's to the next
              CS and use a new VMID for each submission instead of
              invalidating the old one.<br>
            </div>
          </div>
        </blockquote>
        <div><br>
        </div>
        <div>Thanks for the information. I looked into the VMID
          allocation logic and I see that if concurrent_flush is false,
          then we defer any flush (or VMID reuse that requires a flush)
          until that VMID is idle.</div>
        <div><br>
        </div>
        <div>What patch #3 ends up doing is just performing the PT
          update right away. Any required TLB update is deferred by
          amdgpu_vm_update_range through the increment of tlb_seq, and
          amdgpu_vmid.c is responsible for doing the actual TLB flush in
          a manner that does not trigger the bug.</div>
        <div><br>
        </div>
        <div>Can you confirm that this would be fine for the current
          hardware?</div>
      </div>
    </blockquote>
    <br>
    Yeah, that should work. I'm just think about the UAPI a bit, we
    should probably improve this to use something like a drm_syncobj
    instead of just a flag to be future prove.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:7BE47209-2D0C-4E21-8CFB-418D5FA4759C@gmail.com">
      <div>
        <div><br>
        </div>
        <div>Tatsuyuki.</div>
        <br>
        <blockquote type="cite">
          <div>
            <div> <br>
              I'm currently working on changing that for Navi2x and
              newer (maybe Vega as well), but this is something you can
              really only do on some hw generations after validating
              that it works.<br>
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
                      &gt; Introduce a new state &quot;dirty&quot;, shared between
                      per-VM BOs and traditional<br>
                      &gt; BOs, containing all BOs that have pending
                      updates in `invalids`.<br>
                      &gt; amdgpu_gem_va_update_vm will now simply flush
                      any pending updates for BOs<br>
                      &gt; in the dirty state.<br>
                      &gt;<br>
                      &gt; Signed-off-by: Tatsuyuki Ishi &lt;<a href="mailto:ishitatsuyuki@gmail.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">ishitatsuyuki@gmail.com</a>&gt;<br>
                      &gt; ---<br>
                      &gt;&nbsp; &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |
                      18 ++++---<br>
                      &gt;&nbsp; &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c&nbsp; |
                      66 ++++++++++++++++++-------<br>
                      &gt;&nbsp; &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h&nbsp; |&nbsp;
                      3 ++<br>
                      &gt;&nbsp; &nbsp;3 files changed, 63 insertions(+), 24
                      deletions(-)<br>
                      &gt;<br>
                      &gt; diff --git
                      a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
                      b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
                      &gt; index a1b15d0d6c48..01d3a97248b0 100644<br>
                      &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
                      &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
                      &gt; @@ -604,10 +604,9 @@ int
                      amdgpu_gem_metadata_ioctl(struct drm_device *dev,
                      void *data,<br>
                      &gt;&nbsp; &nbsp; * vital here, so they are not reported
                      back to userspace.<br>
                      &gt;&nbsp; &nbsp; */<br>
                      &gt;&nbsp; &nbsp;static void amdgpu_gem_va_update_vm(struct
                      amdgpu_device *adev,<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct
                      amdgpu_vm *vm,<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct
                      amdgpu_bo_va *bo_va,<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint32_t
                      operation)<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct
                      amdgpu_vm *vm)<br>
                      &gt;&nbsp; &nbsp;{<br>
                      &gt; +&nbsp; &nbsp; &nbsp;struct amdgpu_bo_va *bo_va;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;int r;<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (!amdgpu_vm_ready(vm))<br>
                      &gt; @@ -617,12 +616,18 @@ static void
                      amdgpu_gem_va_update_vm(struct amdgpu_device
                      *adev,<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (r)<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto error;<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt; -&nbsp; &nbsp; &nbsp;if (operation == AMDGPU_VA_OP_MAP ||<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;operation == AMDGPU_VA_OP_REPLACE)
                      {<br>
                      &gt; +&nbsp; &nbsp; &nbsp;spin_lock(&amp;vm-&gt;status_lock);<br>
                      &gt; +&nbsp; &nbsp; &nbsp;while (!list_empty(&amp;vm-&gt;dirty))
                      {<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo_va =
                      list_first_entry(&amp;vm-&gt;dirty, struct
                      amdgpu_bo_va,<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      base.vm_status);<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;spin_unlock(&amp;vm-&gt;status_lock);<br>
                      &gt; +<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r = amdgpu_vm_bo_update(adev,
                      bo_va, false);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r)<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto error;<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;spin_lock(&amp;vm-&gt;status_lock);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
                      &gt; +&nbsp; &nbsp; &nbsp;spin_unlock(&amp;vm-&gt;status_lock);<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;r = amdgpu_vm_update_pdes(adev, vm,
                      false);<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt; @@ -792,8 +797,7 @@ int
                      amdgpu_gem_va_ioctl(struct drm_device *dev, void
                      *data,<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (!r &amp;&amp; !(args-&gt;flags
                      &amp; AMDGPU_VM_DELAY_UPDATE) &amp;&amp;
                      !amdgpu_vm_debug)<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_gem_va_update_vm(adev,
                      &amp;fpriv-&gt;vm, bo_va,<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;args-&gt;operation);<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_gem_va_update_vm(adev,
                      &amp;fpriv-&gt;vm);<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt;&nbsp; &nbsp;error:<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;drm_exec_fini(&amp;exec);<br>
                      &gt; diff --git
                      a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
                      b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
                      &gt; index dd6f72e2a1d6..01d31891cd05 100644<br>
                      &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
                      &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
                      &gt; @@ -191,6 +191,21 @@ static void
                      amdgpu_vm_bo_set_evicted(struct amdgpu_vm_bo_base
                      *vm_bo, bool evict<br>
                      &gt;&nbsp; &nbsp; &nbsp;
                      &nbsp;spin_unlock(&amp;vm_bo-&gt;vm-&gt;status_lock);<br>
                      &gt;&nbsp; &nbsp;}<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt; +/**<br>
                      &gt; + * amdgpu_vm_bo_dirty - vm_bo is dirty<br>
                      &gt; + *<br>
                      &gt; + * @vm_bo: vm_bo which is dirty<br>
                      &gt; + *<br>
                      &gt; + * State for normal and per VM BOs that are
                      not moved, but have new entries in<br>
                      &gt; + * bo_va-&gt;invalids.<br>
                      &gt; + */<br>
                      &gt; +static void amdgpu_vm_bo_dirty(struct
                      amdgpu_vm_bo_base *vm_bo)<br>
                      &gt; +{<br>
                      &gt; +&nbsp; &nbsp;
                      &nbsp;spin_lock(&amp;vm_bo-&gt;vm-&gt;status_lock);<br>
                      &gt; +&nbsp; &nbsp; &nbsp;list_move(&amp;vm_bo-&gt;vm_status,
                      &amp;vm_bo-&gt;vm-&gt;dirty);<br>
                      &gt; +&nbsp; &nbsp;
                      &nbsp;spin_unlock(&amp;vm_bo-&gt;vm-&gt;status_lock);<br>
                      &gt; +}<br>
                      &gt; +<br>
                      &gt;&nbsp; &nbsp;/**<br>
                      &gt;&nbsp; &nbsp; * amdgpu_vm_bo_moved - vm_bo is moved<br>
                      &gt;&nbsp; &nbsp; *<br>
                      &gt; @@ -1042,6 +1057,9 @@ void
                      amdgpu_vm_get_memory(struct amdgpu_vm *vm,<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;list_for_each_entry_safe(bo_va, tmp,
                      &amp;vm-&gt;evicted, base.eviction_status)<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_bo_get_memory(bo_va,
                      stats);<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt; +&nbsp; &nbsp; &nbsp;list_for_each_entry_safe(bo_va, tmp,
                      &amp;vm-&gt;dirty, base.vm_status)<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_bo_get_memory(bo_va,
                      stats);<br>
                      &gt; +<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;list_for_each_entry_safe(bo_va, tmp,
                      &amp;vm-&gt;relocated, base.vm_status)<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_bo_get_memory(bo_va,
                      stats);<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt; @@ -1411,6 +1429,17 @@ int
                      amdgpu_vm_handle_moved(struct amdgpu_device *adev,<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dma_resv_unlock(resv);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;spin_lock(&amp;vm-&gt;status_lock);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
                      &gt; +<br>
                      &gt; +&nbsp; &nbsp; &nbsp;while (!list_empty(&amp;vm-&gt;dirty))
                      {<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo_va =
                      list_first_entry(&amp;vm-&gt;dirty, struct
                      amdgpu_bo_va,<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      base.vm_status);<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;spin_unlock(&amp;vm-&gt;status_lock);<br>
                      &gt; +<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r = amdgpu_vm_bo_update(adev,
                      bo_va, false);<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r)<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;spin_lock(&amp;vm-&gt;status_lock);<br>
                      &gt; +&nbsp; &nbsp; &nbsp;}<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;spin_unlock(&amp;vm-&gt;status_lock);<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>
                      &gt; @@ -1476,19 +1505,16 @@ static void
                      amdgpu_vm_bo_insert_map(struct amdgpu_device
                      *adev,<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct
                      amdgpu_bo_va_mapping *mapping)<br>
                      &gt;&nbsp; &nbsp;{<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;struct amdgpu_vm *vm =
                      bo_va-&gt;base.vm;<br>
                      &gt; -&nbsp; &nbsp; &nbsp;struct amdgpu_bo *bo = bo_va-&gt;<a href="http://base.bo/" rel="noreferrer" target="_blank" moz-do-not-send="true">base.bo</a>;<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;mapping-&gt;bo_va = bo_va;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;list_add(&amp;mapping-&gt;list,
                      &amp;bo_va-&gt;invalids);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_it_insert(mapping,
                      &amp;vm-&gt;va);<br>
                      &gt; +&nbsp; &nbsp; &nbsp;if (!bo_va-&gt;base.moved)<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;amdgpu_vm_bo_dirty(&amp;bo_va-&gt;base);<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (mapping-&gt;flags &amp;
                      AMDGPU_PTE_PRT)<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_prt_get(adev);<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt; -&nbsp; &nbsp; &nbsp;if (bo &amp;&amp; bo-&gt;tbo.base.resv
                      == vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!bo_va-&gt;base.moved) {<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;amdgpu_vm_bo_moved(&amp;bo_va-&gt;base);<br>
                      &gt; -&nbsp; &nbsp; &nbsp;}<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;trace_amdgpu_vm_bo_map(bo_va, mapping);<br>
                      &gt;&nbsp; &nbsp;}<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt; @@ -1725,6 +1751,8 @@ int
                      amdgpu_vm_bo_clear_mappings(struct amdgpu_device
                      *adev,<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;before-&gt;flags =
                      tmp-&gt;flags;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;before-&gt;bo_va =
                      tmp-&gt;bo_va;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;list_add(&amp;before-&gt;list,
                      &amp;tmp-&gt;bo_va-&gt;invalids);<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                      (!tmp-&gt;bo_va-&gt;base.moved)<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;amdgpu_vm_bo_dirty(&amp;tmp-&gt;bo_va-&gt;base);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Remember mapping split at
                      the end */<br>
                      &gt; @@ -1736,6 +1764,8 @@ int
                      amdgpu_vm_bo_clear_mappings(struct amdgpu_device
                      *adev,<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;after-&gt;flags =
                      tmp-&gt;flags;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;after-&gt;bo_va =
                      tmp-&gt;bo_va;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;list_add(&amp;after-&gt;list,
                      &amp;tmp-&gt;bo_va-&gt;invalids);<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                      (!tmp-&gt;bo_va-&gt;base.moved)<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;amdgpu_vm_bo_dirty(&amp;tmp-&gt;bo_va-&gt;base);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;list_del(&amp;tmp-&gt;list);<br>
                      &gt; @@ -1761,30 +1791,18 @@ int
                      amdgpu_vm_bo_clear_mappings(struct amdgpu_device
                      *adev,<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* Insert partial mapping before the
                      range */<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (!list_empty(&amp;before-&gt;list))
                      {<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct amdgpu_bo *bo =
                      before-&gt;bo_va-&gt;<a href="http://base.bo/" rel="noreferrer" target="_blank" moz-do-not-send="true">base.bo</a>;<br>
                      &gt; -<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_it_insert(before,
                      &amp;vm-&gt;va);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (before-&gt;flags &amp;
                      AMDGPU_PTE_PRT)<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;amdgpu_vm_prt_get(adev);<br>
                      &gt; -<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bo &amp;&amp;
                      bo-&gt;tbo.base.resv ==
                      vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;!before-&gt;bo_va-&gt;base.moved)<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;amdgpu_vm_bo_moved(&amp;before-&gt;bo_va-&gt;base);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;} else {<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kfree(before);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* Insert partial mapping after the
                      range */<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (!list_empty(&amp;after-&gt;list)) {<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct amdgpu_bo *bo =
                      after-&gt;bo_va-&gt;<a href="http://base.bo/" rel="noreferrer" target="_blank" moz-do-not-send="true">base.bo</a>;<br>
                      &gt; -<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_it_insert(after,
                      &amp;vm-&gt;va);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (after-&gt;flags &amp;
                      AMDGPU_PTE_PRT)<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;amdgpu_vm_prt_get(adev);<br>
                      &gt; -<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bo &amp;&amp;
                      bo-&gt;tbo.base.resv ==
                      vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;!after-&gt;bo_va-&gt;base.moved)<br>
                      &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp;amdgpu_vm_bo_moved(&amp;after-&gt;bo_va-&gt;base);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;} else {<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kfree(after);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
                      &gt; @@ -2136,6 +2154,7 @@ int
                      amdgpu_vm_init(struct amdgpu_device *adev, struct
                      amdgpu_vm *vm, int32_t xcp<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;INIT_LIST_HEAD(&amp;vm-&gt;evicted);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;INIT_LIST_HEAD(&amp;vm-&gt;relocated);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;INIT_LIST_HEAD(&amp;vm-&gt;moved);<br>
                      &gt; +&nbsp; &nbsp; &nbsp;INIT_LIST_HEAD(&amp;vm-&gt;dirty);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;INIT_LIST_HEAD(&amp;vm-&gt;idle);<br>
                      &gt;&nbsp; &nbsp; &nbsp;
                      &nbsp;INIT_LIST_HEAD(&amp;vm-&gt;invalidated);<br>
                      &gt;&nbsp; &nbsp; &nbsp;
                      &nbsp;spin_lock_init(&amp;vm-&gt;status_lock);<br>
                      &gt; @@ -2648,11 +2667,13 @@ void
                      amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm,
                      struct seq_file *m)<br>
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
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;unsigned int total_invalidated_objs =
                      0;<br>
                      &gt; @@ -2669,6 +2690,15 @@ void
                      amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm,
                      struct seq_file *m)<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;total_idle_objs = id;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;id = 0;<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt; +&nbsp; &nbsp; &nbsp;seq_puts(m, &quot;\tDirty BOs:\n&quot;);<br>
                      &gt; +&nbsp; &nbsp; &nbsp;list_for_each_entry_safe(bo_va, tmp,
                      &amp;vm-&gt;dirty, base.vm_status) {<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!bo_va-&gt;<a href="http://base.bo/" rel="noreferrer" target="_blank" moz-do-not-send="true">base.bo</a>)<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue;<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;total_dirty +=
                      amdgpu_bo_print_info(id++, bo_va-&gt;<a href="http://base.bo/" rel="noreferrer" target="_blank" moz-do-not-send="true">base.bo</a>,
                      m);<br>
                      &gt; +&nbsp; &nbsp; &nbsp;}<br>
                      &gt; +&nbsp; &nbsp; &nbsp;total_dirty_objs = id;<br>
                      &gt; +&nbsp; &nbsp; &nbsp;id = 0;<br>
                      &gt; +<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;seq_puts(m, &quot;\tRelocated BOs:\n&quot;);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;list_for_each_entry_safe(bo_va, tmp,
                      &amp;vm-&gt;relocated, base.vm_status) {<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!bo_va-&gt;<a href="http://base.bo/" rel="noreferrer" target="_blank" moz-do-not-send="true">base.bo</a>)<br>
                      &gt; @@ -2707,6 +2737,8 @@ void
                      amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm,
                      struct seq_file *m)<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;seq_printf(m, &quot;\tTotal idle size:&nbsp; &nbsp; &nbsp;
                      &nbsp; %12lld\tobjs:\t%d\n&quot;, total_idle,<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; total_idle_objs);<br>
                      &gt; +&nbsp; &nbsp; &nbsp;seq_printf(m, &quot;\tTotal dirty size:&nbsp; &nbsp; &nbsp;
                      &nbsp;%12lld\tobjs:\t%d\n&quot;, total_dirty,<br>
                      &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; total_dirty_objs);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;seq_printf(m, &quot;\tTotal relocated size:&nbsp;
                      &nbsp;%12lld\tobjs:\t%d\n&quot;, total_relocated,<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; total_relocated_objs);<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;seq_printf(m, &quot;\tTotal moved size:&nbsp; &nbsp; &nbsp;
                      &nbsp;%12lld\tobjs:\t%d\n&quot;, total_moved,<br>
                      &gt; diff --git
                      a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
                      b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
                      &gt; index d9ab97eabda9..f91d4fcf80b8 100644<br>
                      &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
                      &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
                      &gt; @@ -276,6 +276,9 @@ struct amdgpu_vm {<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* per VM BOs moved, but not yet
                      updated in the PT */<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;struct list_head&nbsp; &nbsp; &nbsp; &nbsp; moved;<br>
                      &gt;&nbsp; &nbsp;<br>
                      &gt; +&nbsp; &nbsp; &nbsp;/* normal and per VM BOs that are not
                      moved, but have new PT entries */<br>
                      &gt; +&nbsp; &nbsp; &nbsp;struct list_head&nbsp; &nbsp; &nbsp; &nbsp; dirty;<br>
                      &gt; +<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* All BOs of this VM not currently in
                      the state machine */<br>
                      &gt;&nbsp; &nbsp; &nbsp; &nbsp;struct list_head&nbsp; &nbsp; &nbsp; &nbsp; idle;<br>
                      &gt;&nbsp; &nbsp;<br>
                      <br>
                    </blockquote>
                  </div>
                </div>
              </blockquote>
              <br>
            </div>
          </div>
        </blockquote>
      </div>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------3hoCGbxeVeZUMDTuprTXv4iZ--
