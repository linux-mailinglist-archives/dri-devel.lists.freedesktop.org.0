Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4322776489C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB8710E4DF;
	Thu, 27 Jul 2023 07:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF1710E4DF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:28:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/swNvFQZfXPDyzBoLawWovBQ039egyKID2MpzIgOegVfp73z9ixN8TQQCNpa7UM9DY/LcIGpZsIXnP3cvX5Ge7IH8hHNGlbT4QtOCta+QnOg7028tawAQ94oiMu4UHzOVVsm6I0R5Tw72uz8uf9w+ca8eiIk5MJptlvwv+LA2qkD+loKg59O+8HJYMdo7LZ2kHGoTXJBJYVGEPmHfCCTsLpOHCU3Wdb4SRdSzP+HcQxR3IBzRvbhoEBOfdKrdtpI+u3BUtwPmHiGABGbpOatySsu9ZCu9aKasXlfogM9RSkTQxwQHJy5rBdcFuV058eWNoexh4hGBUhlQ0SaD8Yng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwQBgSL1SefVoz2QELVWTlt22amXpcr4/eIoM5S9LeY=;
 b=XFNnXucrVqcy1Pihnw3idjSHLcxcWU16++Eje3kE/FGUSJEWmX93Wa96wDynTVw2ccuPDJVe8jOk+O20K6ZKWP9DB7PMqs6P4viOdrQUitFrL3ZBdEC8KyeHQ5lLJVjpZ4aVxpz9QgsJDZ+aijt1e27Vhninp8exf0gamqlIHmuGf4/eBwIo7cV8Yx6dBETYBG4Ril7vd4UoMFYOqlfH8wMd5PiuJymotRY+wf1rlm9mSSHu5jLWJj8sOam59mZCibN+JPgYpOt+OSje08FLXmSVZTxbzzQbrCLbvVjE85c60OAoKq5JZE2yJdtZz/TeU1oly45RLca9dDWpqQV6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwQBgSL1SefVoz2QELVWTlt22amXpcr4/eIoM5S9LeY=;
 b=apBGspv6j/hyC4kILFY/M06VsydiZJJN8hCc5EQGnTZYdC36rnQWPDeQcyoNJ0OYpbvCUh0tysUD+WMwpCuLhDe/M4At7YTAJCDWqvQ1a8OOxwzt/xsXZXB9avoz8up2BSrxaHZKKD9re4M3ImBjHJ0ejHXGE6gugc3K+JagRB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7156.namprd12.prod.outlook.com (2603:10b6:806:2a7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 07:28:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:28:09 +0000
Message-ID: <f401e8b1-d2c1-9837-7a0f-35fd9a4ac64d@amd.com>
Date: Thu, 27 Jul 2023 09:28:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/ttm: check null pointer before accessing when swapping
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Guchun Chen <guchun.chen@amd.com>
References: <20230724024229.1118444-1-guchun.chen@amd.com>
 <CADnq5_Pfwyen7W6v9-MoT_S=owcRHbu-+TbwJ2KTN-iHcbEY5w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_Pfwyen7W6v9-MoT_S=owcRHbu-+TbwJ2KTN-iHcbEY5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: b21f3b1e-6de9-4798-fe69-08db8e7306ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MFOXqhA8+Xv8t3baxbcinuEQ3FkrotFaWwVyCj0cfSpCKWcrPT02uR3r6gVo7xLEWnQta8i0eKdznyMC9gTG0SvIWAJntHVtaRmGl9oLGlKpU2MwM5J5jldM/90mFqJmrdK81fjoX6iF0uXHUoYOKL0HvuykiuQexaPASCVfLrO31frhVKMBDhe4P3GlbwlqcuZQFw5KclzWHw6h4cqbquS5LTU3lONetsh4PPJ6Vl2UhaWrLxFJ2F5TYUSvHyRU4ZmPPL+6p/rSKcg0cClHO5e8FyLIgH/lfAw/SE0DLIftU+XbHoUP02z8CY0CJpSOp66pcMsxN9yhOrCzFpuuILT3DkpM3oVVluEQg9jrvqO2+tzzfsSfSrN9HUIMhk3fPRxNoY3ZJ9UcwTDJKGAUx6EGYkviQQxQ/PhxaqicKW5YhUmiyIc+kVDZmsG3biUfDAJVtVMyhfjPmdaaL6Ntt77IF22LSsOi2uFJHmkTecZV388J/bCd+ezorU4MkJnnyUiyQlVxxSSaEsSxkGjZqhpDB4fpKAylnbi7k8UtBJsb5XnaniVN+RHLXeS0vuoetkTtDyhiQUk6xjkNX4/Qh0tO3v7QiKSPk+ZYFy664tiEQ10ThH3zh3ENyTuSkC1GbuguKGwx66whxmVZeC531g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199021)(6506007)(2616005)(186003)(53546011)(66574015)(66556008)(4326008)(6636002)(66476007)(66946007)(316002)(8676002)(8936002)(5660300002)(83380400001)(41300700001)(6512007)(6666004)(6486002)(2906002)(478600001)(110136005)(38100700002)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEpXUVliREpldW04eVprR1orSlhTdDZnblEyaXhndDN3VS9vd0NGWEkxSU9Y?=
 =?utf-8?B?V3JUK2xVdzZWUHU1SkJhaWdxVDV0Y1NYa3lUUWRRSW9RNHFoUm4xbVJtZ0N2?=
 =?utf-8?B?UHRNd3hHNUFtQnpZODZWaUhXN1RBUmhzai9wb2drREhUU1Vad2dqbUpHNFlO?=
 =?utf-8?B?c1IxdmZrV040VlJUTGhzeG9TeTU5QkF2QW5LQ3RsM3BhTmJnN1JyZFE0bWZr?=
 =?utf-8?B?QXkwY0hGSUlhaVpocVl6ZUtLaFFvRld1ZitxaFVyZGVySTMyNlpBbmlnbXRV?=
 =?utf-8?B?UEhhd3RhOUtLb0l3U1dxOUtrYkExaURjWk5LMWlpUnY4amo2QjV5QmlQMzR0?=
 =?utf-8?B?OXhMUGpyV05ORFI2SHo0U3pZd3FyakVMRWtsSUJuR1BPS2VKY3l5MHdNcEw2?=
 =?utf-8?B?UkNKeVorNnUwaCtHWU5vUVBuSUt6Q0VORklXMnM0aFNVYUljeGlpa1pBUG9B?=
 =?utf-8?B?VCs2UjRWN0o3aDRoMitFd2ZLVDFtdWdnajk3VzFqaW1mbi9kV2orSms1dnFM?=
 =?utf-8?B?TS84RWVJdllXYUYxcHRvcDJxaTEwZmNBczYxMFZRRTFJNzBLU28vV3ZFbnNO?=
 =?utf-8?B?V1JHUElWTm5sNm1uZkNCd3FDQlBDZGdROUhuY2ZBMU5WZFFqOFNxeG91Rmkz?=
 =?utf-8?B?SlZjbEozTnpvbitKRFJLcWh0YlpvZW4vZUorZ2ZiN0ZTSlU4eVRUNjcvUDkv?=
 =?utf-8?B?V3FTZ1ZPcnR2bXpid0w1c3dqNjNMaWY1ZmtZUkJmZ0FjcTRlZVkxTEEvSGxh?=
 =?utf-8?B?Ymg3RnpzKzlJK29UQmFmWklHVzFiYWVvOUgvYlhoUVVVZWZWdTRWV1Q0WkxU?=
 =?utf-8?B?TGFldTBYSkVBRXY2Z21HUVV5VW96eFE1TXlMK1pSTlVuNFZkQ0JuZWVSdi8y?=
 =?utf-8?B?RGIvZ2FlR2taTTI1NHJGMGpmaVNjcXA1NDlBdVVOQ3NzWXJTd1VGVDZVK0c1?=
 =?utf-8?B?Q1EwcDdoR1hUVDV2WEN6VDN3S3UrZFUwanlzWU1IWENvSU95L0U0MkpxU0da?=
 =?utf-8?B?RnRRN2JQclFXb3dnRHRKUS9JY2pZc3o0Z21jQ2dtSDNaRUc1ZHV2V2tSMjhi?=
 =?utf-8?B?cVRuaEdWUEplWldRVytndnlOdW9oM25NekNVYWpxZEdmU2hIR3lWdVF5Y2Jt?=
 =?utf-8?B?R3pPb0k2Y0pEeXJKbmRnTTlTMW5zTHBlSWdwNlRpR2hXV1N4TnVvVDlMZld2?=
 =?utf-8?B?NVllbExwSSthLzZrV2tjVFQ2d0h4dklxa3JJU09VVzh2K3FDaDByN0NYYjA1?=
 =?utf-8?B?dXNYODRjWHZtdFVGZmdFTVRwM2FhTUxySWQ0Qm50Nkt2MDBTMFVQUFZ3U3pB?=
 =?utf-8?B?UEFUZjFLQVgyalBVRjVYdjhUaVJqR2FpLzRCdjZsWldZZVQ5b0F6bHY2dHht?=
 =?utf-8?B?VUh3dlY5dGZuSHlwMlRDdUVDZ2Z6SVZLNlB1eU9Nbi9ob24xanpIWnd4TmEy?=
 =?utf-8?B?VmdCWUY2UG1tTXJaanVxbTNpTmF4Nzc3d0JRQmh2aHR6MExkMlYzQnRKTU5n?=
 =?utf-8?B?dWxjaWpub0VaeGh1K0V3WERBQUlLRlFhSWtKYUpGQjBocHdqb1RJWWFDNDZV?=
 =?utf-8?B?OEk3RFRYb2lkYThnMUtCOXRwekM2d1FGUzFVN1M2ZjFZYisydGJ1Q2lHTFlZ?=
 =?utf-8?B?Y0R0UTBsRGtWOHFQb053YXlqa0d1WGtnR0NvK1RCRXE0VjI1NSsremwzRXgx?=
 =?utf-8?B?enZCWml3UGUybERKRThsRWpaV09zRUlMUWVJVlJhZDk0SVB6RkpMbm0yOFBm?=
 =?utf-8?B?TWxmSTFkZVA5ZnA3Yjg3K0dZTkN0MmZrcjNwMlJPUmxhMUxNbjg3d1FFVXpN?=
 =?utf-8?B?Y0FUVVFaaGFRMlNmYm1zR1hLSXJGVlFQcGJxMStNd2VJVVZEejRSRkZ0WmlI?=
 =?utf-8?B?QmNqWWRHNmllMEFRZVVlODIyVzMyMWppOGxva1ZQTTRHKytNYWZ0MEJGL3Ir?=
 =?utf-8?B?V2xBSU5qNEpKa1kyKzBMZGJKTHFUNUJMZ0Zib1crdjQxdlZrMW90SVVzaWdH?=
 =?utf-8?B?RGEyOGJ6QWdoSVhhanhoUEFuWUdUT2x1eG90OGtHYkQyaHcxdm01UmxzMjZR?=
 =?utf-8?B?eTVYRHdwbGdESWIyOGJpSFkyYWJQQk0yQXk0OEVQQ3lUSDlTUTh1MUNDU3pP?=
 =?utf-8?B?NnFlTHRoNnh2RXNRVDBrVUw3QmE2dWxQM05POGQ4SlFkNEZaZnBzd1dMbDYy?=
 =?utf-8?Q?9wqlKXZbMasYJhxQpzIAtrTniZXZw4B07ImwT+cj4iEa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21f3b1e-6de9-4798-fe69-08db8e7306ba
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 07:28:09.1535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tJqUpJ0Ae9K6BCSkAONpZEZiHX2b6EWsxk2rwhwMEMNVmtRdtL78Yf5ga7ibkEj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7156
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
Cc: alexander.deucher@amd.com, Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.07.23 um 15:36 schrieb Alex Deucher:
> On Sun, Jul 23, 2023 at 10:43 PM Guchun Chen <guchun.chen@amd.com> wrote:
>> Add a check to avoid null pointer dereference as below:
>>
>> [   90.002283] general protection fault, probably for non-canonical
>> address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN NOPTI
>> [   90.002292] KASAN: null-ptr-deref in range
>> [0x0000000000000000-0x0000000000000007]
>> [   90.002346]  ? exc_general_protection+0x159/0x240
>> [   90.002352]  ? asm_exc_general_protection+0x26/0x30
>> [   90.002357]  ? ttm_bo_evict_swapout_allowable+0x322/0x5e0 [ttm]
>> [   90.002365]  ? ttm_bo_evict_swapout_allowable+0x42e/0x5e0 [ttm]
>> [   90.002373]  ttm_bo_swapout+0x134/0x7f0 [ttm]
>> [   90.002383]  ? __pfx_ttm_bo_swapout+0x10/0x10 [ttm]
>> [   90.002391]  ? lock_acquire+0x44d/0x4f0
>> [   90.002398]  ? ttm_device_swapout+0xa5/0x260 [ttm]
>> [   90.002412]  ? lock_acquired+0x355/0xa00
>> [   90.002416]  ? do_raw_spin_trylock+0xb6/0x190
>> [   90.002421]  ? __pfx_lock_acquired+0x10/0x10
>> [   90.002426]  ? ttm_global_swapout+0x25/0x210 [ttm]
>> [   90.002442]  ttm_device_swapout+0x198/0x260 [ttm]
>> [   90.002456]  ? __pfx_ttm_device_swapout+0x10/0x10 [ttm]
>> [   90.002472]  ttm_global_swapout+0x75/0x210 [ttm]
>> [   90.002486]  ttm_tt_populate+0x187/0x3f0 [ttm]
>> [   90.002501]  ttm_bo_handle_move_mem+0x437/0x590 [ttm]
>> [   90.002517]  ttm_bo_validate+0x275/0x430 [ttm]
>> [   90.002530]  ? __pfx_ttm_bo_validate+0x10/0x10 [ttm]
>> [   90.002544]  ? kasan_save_stack+0x33/0x60
>> [   90.002550]  ? kasan_set_track+0x25/0x30
>> [   90.002554]  ? __kasan_kmalloc+0x8f/0xa0
>> [   90.002558]  ? amdgpu_gtt_mgr_new+0x81/0x420 [amdgpu]
>> [   90.003023]  ? ttm_resource_alloc+0xf6/0x220 [ttm]
>> [   90.003038]  amdgpu_bo_pin_restricted+0x2dd/0x8b0 [amdgpu]
>> [   90.003210]  ? __x64_sys_ioctl+0x131/0x1a0
>> [   90.003210]  ? do_syscall_64+0x60/0x90
>>
>> Fixes: a2848d08742c ("drm/ttm: never consider pinned BOs for eviction&swap")
>> Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>> Signed-off-by: Guchun Chen <guchun.chen@amd.com>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Has this already been pushed to drm-misc-next?

Thanks,
Christian.

>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 7139a522b2f3..54e3083076b7 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -519,7 +519,8 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
>>
>>          if (bo->pin_count) {
>>                  *locked = false;
>> -               *busy = false;
>> +               if (busy)
>> +                       *busy = false;
>>                  return false;
>>          }
>>
>> --
>> 2.25.1
>>

