Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1E4383CA6
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 20:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C416EA32;
	Mon, 17 May 2021 18:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D721D6EA32;
 Mon, 17 May 2021 18:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkkHzXU1otiAG6jz5N20CmbWeptRRwt2Oqsw6K6djq81oXlDZA4RVrZ81yPkf6ML8bPcTlfvXY5Jf3UZ9Q5qOjQZIp8VdFuaCMfc5uwR/nJWKS0K7zWKT2zpTli9BcLnAawDsTSI1m5jqyomAt0RJt00579pONc9ULbeSVZyUOt6ZugE+1rS2LLNAdleExHQz1f2cyc6vQVScuLE1rJmxjv3qiEre67RtEHSQIsJIAF/b7y9naJQiC8oYjrXdpR7gUVydxZkjVmmPLtwYbpHdMesEd9PB4PiDQQO2cA0xWUgDUGUkC1aHH8a57CPUR3cZy+Z3deSUN7kqWV6jBqi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ue+j3q2jG2N7JN9E7a9HpSbz9+Vg97uzVyVv+vnObXc=;
 b=KX0JTyx+cHmVXLXXIeHdvhmmAw2HwrOO3BY2hROslAkg2epQXrF90/89ZjqNoufdyx2m2EnK9kAbtz2ffHq7KWRqMkVre4L5dWosAe0BgekLeRDu+0+tS7NGeGA1ntVSxHhEPnc+ZOvg74MBB7Ui1DtRS47DNjcQkATJDOPbM4hrUzjXS7XP4NX1OkSkb/5WZsKqtbHDq2hifz1zB0UAWXNoM9r6u4uMA0bqU4oiSxi2P3FUCrsfq2fGLuxGlvVowZudHSQutYKjpTk6aSL8uFgZTlOPc44jo2cfdAcPQuoLIw39I/UuugiTJCPn9vcrv+68ftFzVnX7NXiN10RwAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ue+j3q2jG2N7JN9E7a9HpSbz9+Vg97uzVyVv+vnObXc=;
 b=q7hdFtCKa4KB9gEyM7PnXq+bo0lnoXw9Ov5Luk5+bdaYVsvo/Y3zwkIFmpNhAd/Hrs/xKgJMMkrADNErQK4m8ebG1l/daDw0jK9FD1PUZmRAYUxgUOP03rOpw7Kq55YS77l72oZRcVFZsjRI6M+vR4j6fZnl72oeb7JFAtqkRa4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.27; Mon, 17 May
 2021 18:46:46 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 18:46:46 +0000
Subject: Re: [PATCH v7 16/16] drm/amdgpu: Unmap all MMIO mappings
To: Alex Deucher <alexdeucher@gmail.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-17-andrey.grodzovsky@amd.com>
 <CADnq5_M-Sy3cF762044Ub9J=N_U6uQ2h2j40Y=fof04dXL5h7w@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <1882dd85-7ac6-8e54-b66d-fe09718d0262@amd.com>
Date: Mon, 17 May 2021 14:46:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CADnq5_M-Sy3cF762044Ub9J=N_U6uQ2h2j40Y=fof04dXL5h7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2607:fea8:3edf:49b0:19e2:b915:59c1:4860]
X-ClientProxiedBy: YTXPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::46) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:19e2:b915:59c1:4860]
 (2607:fea8:3edf:49b0:19e2:b915:59c1:4860) by
 YTXPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.31 via Frontend
 Transport; Mon, 17 May 2021 18:46:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bf0426a-c57b-4fb6-3222-08d919641efa
X-MS-TrafficTypeDiagnostic: SA0PR12MB4400:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4400EC635C56EB3CCFB3DC22EA2D9@SA0PR12MB4400.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tvc4GUEd+8xzimQzY9EQClvoHQFSpuV0psM5DWuTQFwFtbXxUv//6i1ugeZud+qGkDhLlzcKfjtM4kLSP9N3CJbYrEakeEavOY1JI/guhMaJnCsbJz9WP4+oiOi3kQ9kNjtEvdUtihhyjbEi3LSwf5o8x+eAmH8VM7eG+Gn/iY7ghtMdxQD/ix0S2Tskj2uskR5KmO7RZRLiciYjjwSyFmwP7TfZJe2XUNxaakTBych80Iok0HUM4tYsl31vR5jmIrpO6Bx3fx1rfQObmSdUjRc999ZOO1RKv+F4aA98eSLNzC/5mx2QCdJq+zUdSZhb5U8VveKQJzf8Tj671bavWPqnalzoQH0JMeS9cxtbbpLDy5PuIK6C1Xd55AKoDRvY9ZCk75FNLydg0STSTHFiNzsznBnKHtUcVPNHrBsMS0+YizLVBNpDm/HzTzFIZ1ESowRCjF00wf6fj+siCLggkqWaxE4Uk5n5jcT7wXE0IYPNqHBnSwPVkmvoiJ1Uv1rPvkv79plGyP1C2Tb+hXTgW9hQ24tjHkHn4RF49yzv2+k/MoCU6ecoYepxYTqY0VZtpWiTCbTJOz7lFnLQqQ8gRuNtBtJ9hWRz0ra1RZT3ikdlBWIVs3wjDqGfX/kRXu5ys7Lk/A1d5EDU19w5QnJYI51pZzdyygGWOItPNOwFBbWKu5vkoC4sxkJ1iadjunQ3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(53546011)(83380400001)(6916009)(52116002)(8936002)(66556008)(66476007)(4326008)(31696002)(36756003)(316002)(6486002)(54906003)(2906002)(38100700002)(8676002)(86362001)(2616005)(66946007)(16526019)(44832011)(186003)(478600001)(5660300002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3NSSzlHN0FyZlQrZzhsNlNuaisxVVRSNEdDeHJsZll1cEtRRFBTa21ZdHJ3?=
 =?utf-8?B?YVJtelR1bW5seU5XSkxFTTcwMHliOHczb1NNTWxBeGxPeE8xODV5YUJQM2pw?=
 =?utf-8?B?REJjR3VrY05qZ1B5MzNqOEo2T0JJREwvNmUwcW10YU1BSnZva2ZDeGN3Y2Er?=
 =?utf-8?B?ak0yNDZxMHpUY0hOSG12SXoxVUUxYVFZbDBZcnE3cURUQU5lNFh4ejd3UUNX?=
 =?utf-8?B?Q3Z4OFQ5ekJrNk1zVW1DZzQ5QjRYVjFBRzdZeDVFV0FoSmNHNGNIaVdzbGNj?=
 =?utf-8?B?cTdpL2huelpNOG44UXhYTlFQdFhtMFN0VjhpMW9tTnl2d0NkeVJaQ093RVB0?=
 =?utf-8?B?UEN2N3dwcm9lYUorQjlEN1pqOE5GcXpvVG5MWjErZXoyazNNa2x3cnIzT21Z?=
 =?utf-8?B?Wi8yWWJKS2J2bEEwMzh4ZHBrL1JWblhTa1VMNitPU04yK2JLYlNpS2gzTVB3?=
 =?utf-8?B?aUNCeGJHUHZwL1R5ZlpKQzF2cTUrb25BcW93V0ZNYXJBWUpHcS9mNUw4MUt6?=
 =?utf-8?B?WlFsSmszSjJLQkF2SU9KYmtxMEFvMGpSTVV2Q0NwN1lQTkVaMFRsMmV1TExn?=
 =?utf-8?B?N1hya0o0dGMrQ3g0eC9ZU1Rwc2ZtWUw5aHA3UkY3cHdWaHdPdVZRaldHWkJn?=
 =?utf-8?B?K1VTeGtWcys1Wnk1UDVvSWJBSHJrbzFacVRFdU5ld29mMXBFMnA0d0lWK3Yz?=
 =?utf-8?B?bkVoYXZiSWVBdUU3Q2IxY1krd1hkdnJMS3k4UmcvUG5jcXdkTW1aYUF1dHJ1?=
 =?utf-8?B?SkZGdHEzc1lwR3BpL0JwS1V5YUVDZFRtQXcrSzZzVzQwNHRRNmtxYzVKK3dj?=
 =?utf-8?B?bnFYNjBBMFYrYm0zMTMvdnFuSk82cjhqMVpzL3NHUjltRG9SbFEvdHRmYjdI?=
 =?utf-8?B?TjU4TUo1UlN0SkdyamRpbjNFMVpEdlRkbkIyRWgzM1Jocm5rQlBiUGo3cDVD?=
 =?utf-8?B?SXE1V3RweS9DUFg4aEJ3TGZKSUxvRng3NDcrWjBFeENiN2g2S0NySHQrbFpD?=
 =?utf-8?B?bDNkSy9IZXNWRkRzc2hqdStNaDFONmlNQU1GSnNab0MydndhWU52TjdmVyti?=
 =?utf-8?B?eWxNM0hDZXpaa05TcTkwaStxeHJQTyszRmhpZmtnRGJjUDdkZW5oZmRFK3ZO?=
 =?utf-8?B?RjhSeGRvLzVscjcvc1RKbkpKMDV1T0RMR0NVc1V3OHg3dlRxdVA5WWsvclhN?=
 =?utf-8?B?V0tncG9GMzA1cGx3ZnNBeFFlRHVVQllEd042K3BCbEhNMFBCQytZYkdPaHhY?=
 =?utf-8?B?VzhHK1AvdXFYNC9wSFRMVTZ5aVRicW1uQjhSSFlKSmR0REk5QmJxVVFPZFNp?=
 =?utf-8?B?UDdkMHl5V2JSbUNnSGFWenk2V1FYTVdaSXBqYmRIYlBSWE40TGR2SlMxK0I5?=
 =?utf-8?B?UjQyUFN5QS9objRBVmx3QnlrM21zQ0lyYktEQ2J3Z0cySjBMNlBTbVVmNCt0?=
 =?utf-8?B?aWxZbWR4cTlRUG5RTWludEZTMzM2ODQ1QUQ5aElMWXNoZ2NOd3dSbHNOQThk?=
 =?utf-8?B?YmVLQ0xSRjg1NjZiSHVIWnkzNithWkFDRVk3NHhvUWZQZ1pmY2V6L3lYWElY?=
 =?utf-8?B?OXZzci84alBCem9nRTZuajNFaXJMVVFoc1JCS2tqUUNGamNrNzVaZ0w4OWcw?=
 =?utf-8?B?NzJGV3ZucEtkRy80c25DeUErYUI1R2JxZ0hjWFptRk5ScGg1MlZYMUc0SWV3?=
 =?utf-8?B?eTdCYkJBMU1YSHVVTzBIOFR0NHQzdzVvek1PRUNKSVdKVnpVNnNzc0ZvM1J6?=
 =?utf-8?B?RFRIQVl3a3FTYlgwVTVqMlYyeEtOV3ZGeXpLR3BEd2U2UjVUd0hyMnN2dTVw?=
 =?utf-8?B?aVkvcWlOVHVpUVlUTnlQb21peXhrN3ZuS0diZWdRSjFZd3pBTTFsYUlZREwr?=
 =?utf-8?Q?Ytgd5QoASycbg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf0426a-c57b-4fb6-3222-08d919641efa
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 18:46:45.9071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XevQQ86vIbpZZIo9Zf8ob4KaV6jiCB3UcLIpjYVt8fUoZNgmJdBQCgVHd9BwJt8+4nM4cvHTxJq4ooLWlMQasw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-17 1:43 p.m., Alex Deucher wrote:
> On Wed, May 12, 2021 at 10:27 AM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>>
>> Access to those must be prevented post pci_remove
>>
>> v6: Drop BOs list, unampping VRAM BAR is enough.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 24 +++++++++++++++++++---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 ----
>>   3 files changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index f7cca25c0fa0..73cbc3c7453f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3666,6 +3666,25 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>          return r;
>>   }
>>
>> +static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
>> +{
>> +       /* Clear all CPU mappings pointing to this device */
>> +       unmap_mapping_range(adev->ddev.anon_inode->i_mapping, 0, 0, 1);
>> +
>> +       /* Unmap all mapped bars - Doorbell, registers and VRAM */
>> +       amdgpu_device_doorbell_fini(adev);
>> +
>> +       iounmap(adev->rmmio);
>> +       adev->rmmio = NULL;
>> +       if (adev->mman.aper_base_kaddr)
>> +               iounmap(adev->mman.aper_base_kaddr);
>> +       adev->mman.aper_base_kaddr = NULL;
>> +
>> +       /* Memory manager related */
> 
> I think we need:
> if (!adev->gmc.xgmi.connected_to_cpu) {
> around these two to mirror amdgpu_bo_fini().
> 
> Alex

I am working of off drm-misc-next and here amdgpu_xgmi
doesn't have connected_to_cpu yet.

Andrey

> 
>> +       arch_phys_wc_del(adev->gmc.vram_mtrr);
>> +       arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper_size);
>> +}
>> +
>>   /**
>>    * amdgpu_device_fini - tear down the driver
>>    *
>> @@ -3712,6 +3731,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>>          amdgpu_device_ip_fini_early(adev);
>>
>>          amdgpu_gart_dummy_page_fini(adev);
>> +
>> +       amdgpu_device_unmap_mmio(adev);
>>   }
>>
>>   void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>> @@ -3739,9 +3760,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>>          }
>>          if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>>                  vga_client_register(adev->pdev, NULL, NULL, NULL);
>> -       iounmap(adev->rmmio);
>> -       adev->rmmio = NULL;
>> -       amdgpu_device_doorbell_fini(adev);
>>
>>          if (IS_ENABLED(CONFIG_PERF_EVENTS))
>>                  amdgpu_pmu_fini(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 0adffcace326..882fb49f3c41 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -533,6 +533,7 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>>                  return -ENOMEM;
>>          drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
>>          INIT_LIST_HEAD(&bo->shadow_list);
>> +
>>          bo->vm_bo = NULL;
>>          bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
>>                  bp->domain;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 0d54e70278ca..58ad2fecc9e3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1841,10 +1841,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>>          amdgpu_bo_free_kernel(&adev->mman.discovery_memory, NULL, NULL);
>>          amdgpu_ttm_fw_reserve_vram_fini(adev);
>>
>> -       if (adev->mman.aper_base_kaddr)
>> -               iounmap(adev->mman.aper_base_kaddr);
>> -       adev->mman.aper_base_kaddr = NULL;
>> -
>>          amdgpu_vram_mgr_fini(adev);
>>          amdgpu_gtt_mgr_fini(adev);
>>          ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
>> --
>> 2.25.1
>>
