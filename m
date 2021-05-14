Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CF2380E1F
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 18:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E496F389;
	Fri, 14 May 2021 16:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9725F6E20C;
 Fri, 14 May 2021 16:26:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+J7BKru/LHyOheOiuvU/3dIJzeqQOofJHBwCk+Ey/qGsELhauXduuH87iehQZXIdZ+tyaEKfOIhkVlX6yKmpzqM2QKuNxr6oEXoU/9QsdAJLUB74YlskI1VYS7cQi0kWpxYwY+uzfyOH1lNS/UQMxyDWE/hM41w8IU7dyeCNKlr+bgaI4SYXEyJJW3+ezJMHwOi4/5n3eTI1vZdSg1ynldtXbs3rzRhzIKv1D2EtVakd6T3TOIlsln/yk4Sksf5OgDc+AFJ8C3H5b18uhci1vS6tZB0QBg1Ipndk65FYQptRQZz5uymbLdeyao9TuIQ726o4mi4nZ+0Rs8yhHCFDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLefIJ7Ir0hQOTK8dckLiHD4bu3iboS0zM7Sc5QjvDE=;
 b=fIScZSS2lXn7G15J31QjSL2pWPFqnKHIlMAwQzKkGInKQKx6BEDjuPQ5/JLURg6ksU+uW6XLPVUSY+T4DKgNpkP6X+nvJ0diSPuHlOgqDQnfaa9bhzsXSF+/IcYj6bprwAbicMKLkTKjGMbmJnhVcTqa6R3KuF2ljmV18QCWdxUHg5Tz8tkAz1FY4suiU70XKeMTpuV4cmyuSW78v/UZoC4UQ4kvcXvHkhEjngRgmSsY0wHft2rAycjhny7HIM78j7xNpXYHZdAy59WoqQRihWaJeQ6AVbtcxXBvNG094iFLtlYG9PluA+xguH9a2+PthMrKG/TbmtTwSqf4W3L9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLefIJ7Ir0hQOTK8dckLiHD4bu3iboS0zM7Sc5QjvDE=;
 b=DAP0PWTSYefunXs2Ln34tiDH15VgaDTnuRubqv0xt84BsDcNhWvTCaUMbR95d2FfOPAmOc6aKvifGIxyUMQ95MxFavqjDUKhw7VL3IVTH65mre9ipy5zEEjuZm9zptwKis4bq8Skg4QgW5YW9U4Df6OoxthJt8ohlKvdaouF3mI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5322.namprd12.prod.outlook.com (2603:10b6:408:103::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.27; Fri, 14 May
 2021 16:25:58 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 16:25:58 +0000
Subject: Re: [PATCH v7 05/16] drm/amdgpu: Handle IOMMU enabled case.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-6-andrey.grodzovsky@amd.com>
 <996a4ded-08da-7c27-5e79-6b408d8c43b0@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <32b61077-f760-8fe0-c00f-256a97d2977e@amd.com>
Date: Fri, 14 May 2021 12:25:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <996a4ded-08da-7c27-5e79-6b408d8c43b0@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.116.138.207]
X-ClientProxiedBy: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.138.207) by
 YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Fri, 14 May 2021 16:25:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 410ec3dc-085c-4b06-3775-08d916f4f4ac
X-MS-TrafficTypeDiagnostic: BN9PR12MB5322:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB53220B0B26AE7F7C1596B8FE92509@BN9PR12MB5322.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ynwJraYuKwxHfn7w856uK8eE1hrXl0fZ4jhdvGfRhzQJ8PzJd7J2f+Ua3oHr4DthxeSuUHzGN1ZXALEdHbggBGMvCl87V0JsunbpIb+++dVQ0vAqd3Kxbo0Bx17fsqiZC7yQPHR12kvzKiGbPi2RUoniq1pR5GYaAmMT05UYuaTU+Byqh4jk+DpuJE4yGpTm0kMpdbhkWHc9+SO3jFkvFPrEJl7EPJ2Eumr1vZTsxOZc6Yt6TD1eDDGq0JYUVjzBtek4r9ZM3EL4gEEwLu1rT95z5kOxuM7HMi2J0nXxLSrS4V8gKpTNCBLaZ0zccPBeaDOUca7mxKdYMl/AiUOtzqCz2tGV2WWjFkTiOIy2k5uZdB51BxN2NBrrwar5aNRBOp7FnQe0UQ7W3toZJIhDX1QtSO+nPfAkUNEn7R16mRPd1bAleEtN+1CJflX/jozRr5bQ2juxx0mCZCEOHPvD7KLJlAEhs2Y7q5HxYqAIZwh/rd/YSXFT7zI/EYhwaO0knWf1/3AkwHgsei1W+VU/wAQi+ZR1JSDsphvNWjLNqMTFD+v2OdZkCuJNBqzMgfxXoObsZz4lllsw5debn5LClIrq2/WGwqMBsHcnXL9mLmlvnjAcFHR0rgATLDS81MXOBrtVvY7PCxtlJmzvNSW8Ci1hJi+sLMSN9FNL1x9lBfqaE2l7AYYzUiD5uPKWmt4l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(31686004)(16576012)(4326008)(5660300002)(2616005)(6636002)(26005)(8936002)(316002)(31696002)(83380400001)(956004)(38100700002)(53546011)(8676002)(6486002)(44832011)(478600001)(66476007)(66556008)(186003)(2906002)(16526019)(30864003)(66946007)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MXhiY1MxTE1nWWQxTDlmaWdGazFpbU1CQ3hKSnMrSWFIcy9wbHM3K01FZ1lq?=
 =?utf-8?B?UmVyd1Fwa3pIR2trTGg5dTdIYzVYckRzZmduMHdXT3VEQ0RTeXY0eVVmU2Vw?=
 =?utf-8?B?UzUrT0t0N2IvS244TUZLdTA2T2NzUW1iZmJCeDkyZGRWSGZlb3g0OHkrT3dO?=
 =?utf-8?B?VjhQNERUa3o0WlFlOTRMMlh0V2IzN0JnYm1nV3JDdXFaazN5c3FUcEM1dFVl?=
 =?utf-8?B?M2laeExkaFNIV0Y5MmJUTGxZcndscGphVk5iQlJ4NEtaU0JVNkRmNkFjY3Zu?=
 =?utf-8?B?dFVsODU5aUtFakNYejdCYi8xYUVEOFJNajhtQWMvbU1ia3FqQWxSYXJKM0Fu?=
 =?utf-8?B?T0owSzVLQ1dYR2UyQVE5N1NkWXh0R2EyREh5b2h6OTlTem54RlJOZzI3NURT?=
 =?utf-8?B?M3BoK01kWENIVWxMa2dqUXEvNkRNYUdiMmtZLzU4UnQwUWsyQi9tNG90V1Jt?=
 =?utf-8?B?VE12ZnBJZjhNV0xHeHdwR24wMDl4NGR4aDQvS2s0QVF1QUxkWUg5RnNDaURE?=
 =?utf-8?B?Y1UwMDROSHdFZTEvQ3JTaG9vOFJCcGc0U0dZYVZkcjhCYWxkOWxpbXE2OVpS?=
 =?utf-8?B?ejcrTW5USTlvVVRRb1VuYVZnd3o0eWpxci9iMXByT0JVRmVkVWFxMERmTjFv?=
 =?utf-8?B?Z3Z5NHpMM25ITkN5Vkhuc2xrZTJOdGFPcTE0RktueGpwdDFYRnZ1MmQ3Rm9P?=
 =?utf-8?B?amx1RjRLd1BVN3Z4UFpSTytvL2hEaEwxdEpZTGhpZGs2ZENQaHB2STlSam9R?=
 =?utf-8?B?YjRwNFUrTklkR0pERmxieUtMeE9lWUxtUXJKaW1TWVdsd0Q3Z0tiRUhhZlRB?=
 =?utf-8?B?dXVGVjUxbFNSQm5LT00wYmZCeGRET2wxQ3FQN256aG5XUDBmRktrMnVMRTJN?=
 =?utf-8?B?SEVUVTRld3RSeUNFS2pJbGtYS3ZmTStGUkhQVWdweHQvSHd1ek5ueWMwWXFm?=
 =?utf-8?B?TkRSS2pyWEpRMndiUFdqd0xEeVRwSjVDemVWeFNEd3Nrc04yeHB6SkpDR0Ni?=
 =?utf-8?B?QmYrTzlEaHFheFdYa3lnbjVkeTRkRGtvRW5nMlduN2prVnRXTUF6RFlqY2li?=
 =?utf-8?B?cDJONzdUWnloSG9EVGlzWU1nNzN1VG0yTFdwYyt4dHRFY0hERjZYblh3MWNV?=
 =?utf-8?B?OVJHWDRqTndlakMwMnlCOEpOVmV0QVVTc3FmUEgrQ2lqZ0FIZVB6Vk1vTmZ2?=
 =?utf-8?B?M0FEMUpOZ3EweHA2b2xYc3lmMXhCa0w5YkZhVjlJNFZ3ZmFhaHBRM21RcWdz?=
 =?utf-8?B?KzgyRkpCZUhYdFp6N0JhV0dHNWNNVkJKdkFTVXlBbjBxanFrQjNnYXQ1cE9M?=
 =?utf-8?B?K2FZWUc5ZVpPUllpdEFjZldmK0pISlBidVlmTUhxaGNaVWdOLzh3ZkszUWdq?=
 =?utf-8?B?R0U5R0ZpbWJxNkl3K0J2U212dmcxN0FnTm5yK25pdlVHK2lMcTBDSnI0Z25i?=
 =?utf-8?B?R0NGWXdZVTFjRDFKWEV5VkZoYnNQN1VmWFEwZENsSGY2ZERGVXBBYmVlaFdk?=
 =?utf-8?B?RWFLK05oWnJ4WnlkaVY5bDZ5YUdFT2U2U0pYNWpKQU5PWFlzU0FrdUtzQk1h?=
 =?utf-8?B?UUVMYmdtY1drN0syOW1hZkpEZzhZS0tLRzJ4UUkyVm5GTUg0a2lnSFQ5M2xv?=
 =?utf-8?B?WExPUnFhRWZIcWFycHJwRm4vaWlxdW8rRU52c2JCdWJNNFNMSk1FZVdxejV5?=
 =?utf-8?B?dDhCODNBaVZCc1N3K2Z3K2x3elVOMWJzSHB5V2VOcUVJdzFnc1AzR3hyZ3FP?=
 =?utf-8?B?eXlVZWY5NllXV2ovampMOU9GOGl3WVAxRjAva3U5ZDBLMXgrYWVkbkRzS0ZZ?=
 =?utf-8?B?RHFzbEpxVXBnUE1LcWNWUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410ec3dc-085c-4b06-3775-08d916f4f4ac
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 16:25:58.4295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMShVe+mdA3YpCdUzP0Rwzw830LiMJf/EV+S1IoE0NxPswVRhOxNfKV5AMipJAv8Y62MAUsWD5gGvWhVW2jmDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5322
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maybe this patch needs a better explanation how the GART and IH changes
relate to IOMMU or what's the problem this is meant to fix. Just looking
at the patch I don't see the connection. Looks like just a bunch of
refactoring to me.

Regards,
  Felix


Am 2021-05-14 um 10:41 a.m. schrieb Andrey Grodzovsky:
> Ping
>
> Andrey
>
> On 2021-05-12 10:26 a.m., Andrey Grodzovsky wrote:
>> Handle all DMA IOMMU gropup related dependencies before the
>> group is removed.
>>
>> v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate
>> v6: Drop the BO unamp list
>> v7:
>> Drop amdgpu_gart_fini
>> In amdgpu_ih_ring_fini do uncinditional  check (!ih->ring)
>> to avoid freeing uniniitalized rings.
>> Call amdgpu_ih_ring_fini unconditionally.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   | 14 +-------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c     |  6 ++++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    |  5 +++++
>>   drivers/gpu/drm/amd/amdgpu/cik_ih.c        |  1 -
>>   drivers/gpu/drm/amd/amdgpu/cz_ih.c         |  1 -
>>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c     |  1 -
>>   drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c      |  1 -
>>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c      |  1 -
>>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c      |  1 -
>>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c      |  1 -
>>   drivers/gpu/drm/amd/amdgpu/iceland_ih.c    |  1 -
>>   drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  4 ----
>>   drivers/gpu/drm/amd/amdgpu/si_ih.c         |  1 -
>>   drivers/gpu/drm/amd/amdgpu/tonga_ih.c      |  1 -
>>   drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  4 ----
>>   drivers/gpu/drm/amd/amdgpu/vega20_ih.c     |  4 ----
>>   18 files changed, 13 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 18598eda18f6..a0bff4713672 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3256,7 +3256,6 @@ static const struct attribute
>> *amdgpu_dev_attributes[] = {
>>       NULL
>>   };
>>   -
>>   /**
>>    * amdgpu_device_init - initialize the driver
>>    *
>> @@ -3698,12 +3697,13 @@ void amdgpu_device_fini_hw(struct
>> amdgpu_device *adev)
>>           amdgpu_ucode_sysfs_fini(adev);
>>       sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
>>   -
>>       amdgpu_fbdev_fini(adev);
>>         amdgpu_irq_fini_hw(adev);
>>         amdgpu_device_ip_fini_early(adev);
>> +
>> +    amdgpu_gart_dummy_page_fini(adev);
>>   }
>>     void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>> index c5a9a4fb10d2..6460cf723f0a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>> @@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct
>> amdgpu_device *adev)
>>    *
>>    * Frees the dummy page used by the driver (all asics).
>>    */
>> -static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>>   {
>>       if (!adev->dummy_page_addr)
>>           return;
>> @@ -365,15 +365,3 @@ int amdgpu_gart_init(struct amdgpu_device *adev)
>>         return 0;
>>   }
>> -
>> -/**
>> - * amdgpu_gart_fini - tear down the driver info for managing the gart
>> - *
>> - * @adev: amdgpu_device pointer
>> - *
>> - * Tear down the gart driver info and free the dummy page (all asics).
>> - */
>> -void amdgpu_gart_fini(struct amdgpu_device *adev)
>> -{
>> -    amdgpu_gart_dummy_page_fini(adev);
>> -}
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>> index a25fe97b0196..030b9d4c736a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>> @@ -57,7 +57,7 @@ void amdgpu_gart_table_vram_free(struct
>> amdgpu_device *adev);
>>   int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
>>   void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
>>   int amdgpu_gart_init(struct amdgpu_device *adev);
>> -void amdgpu_gart_fini(struct amdgpu_device *adev);
>> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
>>   int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
>>                  int pages);
>>   int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
>> index faaa6aa2faaf..433469ace6f4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
>> @@ -115,9 +115,11 @@ int amdgpu_ih_ring_init(struct amdgpu_device
>> *adev, struct amdgpu_ih_ring *ih,
>>    */
>>   void amdgpu_ih_ring_fini(struct amdgpu_device *adev, struct
>> amdgpu_ih_ring *ih)
>>   {
>> +
>> +    if (!ih->ring)
>> +        return;
>> +
>>       if (ih->use_bus_addr) {
>> -        if (!ih->ring)
>> -            return;
>>             /* add 8 bytes for the rptr/wptr shadows and
>>            * add them to the end of the ring allocation.
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> index 233b64dab94b..32ce0e679dc7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> @@ -361,6 +361,11 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
>>           if (!amdgpu_device_has_dc_support(adev))
>>               flush_work(&adev->hotplug_work);
>>       }
>> +
>> +    amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>> +    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>> +    amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>> +    amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>>   }
>>     /**
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> index 183d44a6583c..df385ffc9768 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> @@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>         amdgpu_irq_fini_sw(adev);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>       amdgpu_irq_remove_domain(adev);
>>         return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> index d32743949003..b8c47e0cf37a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> @@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>         amdgpu_irq_fini_sw(adev);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>       amdgpu_irq_remove_domain(adev);
>>         return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>> index 2bfd620576f2..5e8bfcdd422e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>> @@ -954,7 +954,6 @@ static int gmc_v10_0_sw_init(void *handle)
>>   static void gmc_v10_0_gart_fini(struct amdgpu_device *adev)
>>   {
>>       amdgpu_gart_table_vram_free(adev);
>> -    amdgpu_gart_fini(adev);
>>   }
>>     static int gmc_v10_0_sw_fini(void *handle)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>> index 405d6ad09022..0e81e03e9b49 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>> @@ -898,7 +898,6 @@ static int gmc_v6_0_sw_fini(void *handle)
>>       amdgpu_vm_manager_fini(adev);
>>       amdgpu_gart_table_vram_free(adev);
>>       amdgpu_bo_fini(adev);
>> -    amdgpu_gart_fini(adev);
>>       release_firmware(adev->gmc.fw);
>>       adev->gmc.fw = NULL;
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>> index 210ada2289ec..0795ea736573 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>> @@ -1085,7 +1085,6 @@ static int gmc_v7_0_sw_fini(void *handle)
>>       kfree(adev->gmc.vm_fault_info);
>>       amdgpu_gart_table_vram_free(adev);
>>       amdgpu_bo_fini(adev);
>> -    amdgpu_gart_fini(adev);
>>       release_firmware(adev->gmc.fw);
>>       adev->gmc.fw = NULL;
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>> index c1bd190841f8..dbf2e5472069 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>> @@ -1194,7 +1194,6 @@ static int gmc_v8_0_sw_fini(void *handle)
>>       kfree(adev->gmc.vm_fault_info);
>>       amdgpu_gart_table_vram_free(adev);
>>       amdgpu_bo_fini(adev);
>> -    amdgpu_gart_fini(adev);
>>       release_firmware(adev->gmc.fw);
>>       adev->gmc.fw = NULL;
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>> index c82d82da2c73..5ed0adae05cf 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>> @@ -1601,7 +1601,6 @@ static int gmc_v9_0_sw_fini(void *handle)
>>       amdgpu_gart_table_vram_free(adev);
>>       amdgpu_bo_unref(&adev->gmc.pdb0_bo);
>>       amdgpu_bo_fini(adev);
>> -    amdgpu_gart_fini(adev);
>>         return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> index da96c6013477..ddfe4eaeea05 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> @@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>         amdgpu_irq_fini_sw(adev);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>       amdgpu_irq_remove_domain(adev);
>>         return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> index 5eea4550b856..941d464a2b47 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> @@ -570,10 +570,6 @@ static int navi10_ih_sw_fini(void *handle)
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>         amdgpu_irq_fini_sw(adev);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>         return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> index 751307f3252c..9a24f17a5750 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> @@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>         amdgpu_irq_fini_sw(adev);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>         return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> index 973d80ec7f6c..b08905d1c00f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> @@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>         amdgpu_irq_fini_sw(adev);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>       amdgpu_irq_remove_domain(adev);
>>         return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> index dead9c2fbd4c..32ec4b8e806a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> @@ -514,10 +514,6 @@ static int vega10_ih_sw_fini(void *handle)
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>         amdgpu_irq_fini_sw(adev);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>         return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>> b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>> index 58993ae1fe11..f51dfc38ac65 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>> @@ -566,10 +566,6 @@ static int vega20_ih_sw_fini(void *handle)
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>         amdgpu_irq_fini_sw(adev);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>> -    amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>         return 0;
>>   }
>>
