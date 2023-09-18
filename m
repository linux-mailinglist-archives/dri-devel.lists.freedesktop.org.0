Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1384F7A49FD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 14:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534C810E0A6;
	Mon, 18 Sep 2023 12:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B7310E09E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 12:45:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjAR2qkDIH5kj+S9nRvpM0+GklLAp+AlgLx8pLX/sX31I68tusMvyUSLOlgzOuR6hcYfSF5Gqr4Lr0nu8x856dikm70yJXNH/ipOrmlronY0MkbdWXZH/PAc6qW1nS56xPbztNS2Ea6EdDPJ8G7nHG02ETIKKTcrMSd1DguzOt2dqe+dj+Ndjk5OoFM7GyNPL4Wta4gZ/DymaDFHjoq2QZhJ9nC5dmoFGmgZtYG8OOIVnrnZbVw1JWT5ivaGFCJIgiXGp/BkJn4YbGjNs9wiW3MyrJCu7iC56iB8YuLXHVJkgUniIpQ/0GMV0I2Sz8BM6PBpFcGO8xPaAid6qy/k9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f39sqyUtllripgevpCxpEGX5GkSKbUGT6O/N0WkBUEQ=;
 b=QCV+FiU4MKz2JTX3PFENTM4DWlfco4tDxbUhmuBYVg7NOmXY8e6heWbHwv18Qh/jVZ5yljVSxBRaCNiKIaZerQvxUeO6694Ksx7v8c4fQrcQk5CQ6Ojo0Y4BTuGkKaJPCdTjohj0fZkVdXaF4ITPOmwsPrRtyjgnv1D+1cj6bBdZmOHo6Y4xgHs3/1gb2uNNSJU/k5WDVW95UO7Ca2xylgvMVDJCcgpEOmojGny4Pe7Ss/PUrpKwoJnisgZS7HRr9168gF0ytenqGkT0HBE4qKJahaOimvoIB6BNr7lIu/3ouaLJiKDC4yxxBTKevOKlDTge8kJd63O6f0C8WuQspg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f39sqyUtllripgevpCxpEGX5GkSKbUGT6O/N0WkBUEQ=;
 b=HaBTXmUtJsx5bpsUjH/li6FDby26qe6rT37+R0/IjcClRlGmzOLU3n7x2xtQXxZw+8UWag+BqEEiNP836R5Ll1XG0hY7ezbX6vSnaNEOm1RVHMy5I3bSU/18XqUf0knPLXQkLqTMsx5YfkAijGuw03IxBiSEU6kWBPhgCtgKmtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4493.namprd12.prod.outlook.com (2603:10b6:806:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 12:45:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 12:45:11 +0000
Message-ID: <f1cdb895-95fe-98a2-7541-3624a840525c@amd.com>
Date: Mon, 18 Sep 2023 14:45:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/4] drm/ttm/tests: Add tests for ttm_resource and
 ttm_sys_man
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1694517411.git.karolina.stolarek@intel.com>
 <97d52e1c257f91c7d0ff53a764fe1e590c070691.1694517411.git.karolina.stolarek@intel.com>
 <c4e66bca-a8e8-da53-1a96-7dbdd8a6d5bf@amd.com>
 <b662f3ae-037d-ffee-9aae-6c51c5d4f587@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b662f3ae-037d-ffee-9aae-6c51c5d4f587@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0145.eurprd07.prod.outlook.com
 (2603:10a6:802:16::32) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: bdac15ed-6c80-4f3f-dfa8-08dbb8451895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rUrLckKq/6n3E/iJp+o85fPfZmJYQnv4+lGyIvsC8G1zdOA/WxHmr2YCkgNY8LnhEO+fzHSCYiP5vezbJQTzLBJL3CehJFtjareKfCmXBiR6u/N7Ied1wo29pvPgUyNMRT9I0NGUETFBBwtPMeS2nqU48kXNNZ+18mXBXk7N8ZIofFarUxUpRQbeWmfpnwMNAYh5ofFF+6WF9fMPNl3/p+H5/c2w9CA4lO29FmWyOZ2XXgl8E2pAdgE+iHJlZOpMDnCynFZMPYheN4ACQ/sw0+X6SLKF4z1RnZXGgmOwe2M0Su7DV2ZB5kG+l13kAQIve3PH78C+HJphlKuCGXldTMK1MGBW6HgLLkFRdK4qgm3Tdou+SAZ3BRicVDKsENjsMaiE8CX1vt32WMnjBl0FSCByhIP50gEx700Y0/CTTS4PLb6Lr67zyNkD7OgScBdeJpRQZVO0rOnUjAPDJ5kvXEPkWddlg2ywhgjM9weh6F2xoaKWQdf35CuFKRNfvvkbibzwBN5bKFBM/QBZHx5TyTzm3ikg3ms/50g3tME44nVuuwfQN2aMn4baGoBR7kOzl1/7uaq15TfNSjFll7GcMZA2SXVZQd4acDA9cYoAbPzz7yQTDx5bdWBuQIAtsBbjFfSjJuMY0U0zWlVUl7qpRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(1800799009)(186009)(451199024)(66574015)(83380400001)(6512007)(26005)(2616005)(316002)(41300700001)(30864003)(66476007)(66946007)(66556008)(5660300002)(8936002)(4326008)(8676002)(2906002)(6666004)(53546011)(6506007)(6486002)(478600001)(31696002)(86362001)(36756003)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVRrNmRuM0lvNTlkdG1rLzllZTNXWnhBQTJMZU9hNmxDZ1kzeG1QOEtWbDdk?=
 =?utf-8?B?bzh2Y0l2dEJUaWd5MW85YzNUN3V4K1JaZzV0bGQyT0dqclNMeEN0Z0JEK0xG?=
 =?utf-8?B?WndVUUFxc0dKaWdrU3dPa1hZRVZ6STdENlVKUWRQQUFnQTV5M2p4N1BxTVdM?=
 =?utf-8?B?NnpFOVFpb1dIMk1odjBvTXJaYy8rcXBkQnJ6U1krYkljL1hEd1hCc2t4NzZ0?=
 =?utf-8?B?d0tOSitqQ00yMXMwSTZSUnZrRXdIL2dBLzI2eldCQlJKMUNFeXhyRXk4Ylht?=
 =?utf-8?B?YklkcVdMY0ZOcmRMNjFlYjdKdTBDVUs4V2pXS3RzQzVXQmo4ZVpvejZFQjRC?=
 =?utf-8?B?WFNFa1FTS0xvWDJPOEJqa0g4Z2FUVFl4cWRtOUZKU1RtV3VHbGNweEwyWHF0?=
 =?utf-8?B?L1RSYUxsRUludmgxNzZ5RzdRVGdHK3NZNHEwblZRSmZaMkU1SHR3NkRKdEF0?=
 =?utf-8?B?UDhvRmdreVREMnNxUlNYdXJsdkJqeUp0WXdxVnNJUGczMk53YnZ1QVlRTlYy?=
 =?utf-8?B?QUFaNnFsUFNEZDJnMUQwK1NMUyswcFN1M0tLdnNyaXZiYml2U3RkZXFPY3FK?=
 =?utf-8?B?cEFLb1ZLWjlTb0diSzBKTzU4REhCQkhKdy9hV3FqS1MwSmoyckZnWkEyS0lk?=
 =?utf-8?B?dHZqRytjajMvK2ZaSjBxYnBENUZja2NuQk9uNXIxVUxaUlRuUWs1ODJzNmZU?=
 =?utf-8?B?WUkxTWtwMmZSZUdEdW1EbVlKSGpKSEJIenczUUd1TTdZRmdza0lmMk5WUVBm?=
 =?utf-8?B?U0RUUnA5aGFqREt3SVZSVEdybzFRVEZQYzFCMEUvcDBPNEo3Nk81cE5vVVRS?=
 =?utf-8?B?MUVoUktTTDFCbWcydTd1TEJPZUFNWEZoV3BYUElTbldwWk9DVW8xekJHZTZT?=
 =?utf-8?B?amcrbW95QzE5NEwrZGhPc0xXNXE3cDJLcExXQ2FsdGNDM3FqNWVVc1pIQVlY?=
 =?utf-8?B?S1g0V3JkUlRLN0JmSXNjdWZ2cXlwK0NPUDlTazFhZUJNanhWblQxQTBjenFN?=
 =?utf-8?B?THlLVXkyMnorMm5XSUlHUEhhaGVlenRMVXVHd2I0My8rTkRCd3JWOXVoNzBY?=
 =?utf-8?B?VXFuZkhDZmhvWWY5allkQ0lETUw5QXlGMmxHREVrdzRjdk4wMWhWRlFYZVdD?=
 =?utf-8?B?VHpMbTI3aVE3SlpiK0VpcnF0MlZuOGFJa2tzT3Z2dEhmTlVTYXoweFF4OXBU?=
 =?utf-8?B?R1YxZU5oL1JEOC8xOWdpOGQ4QUJtOG91Uk5zbXdFaTJKdEVSTVQreU9GYlQ3?=
 =?utf-8?B?RllFY2tmQlFndlVSYkZFaEd6Nm5ZSDlNQXg3dHk1T3lQTU5nT3V5YVROTW5z?=
 =?utf-8?B?Z1pWRVNzb2tjZkpnU0NIbEF5aWRuSEhaejh6ODlTWGhrb2I4WS9pbDg1Mzds?=
 =?utf-8?B?M3lSbExuZGozTG1iZWdhUmRxc1VmcDlBWVdYUCttQTZCZkRKUWlJY1lhR3lD?=
 =?utf-8?B?ZWJLcXZBT0Y4NjZIdVZaYUw0RHdxeWhmVWE3ZXlXQW5SeWNUWGZtTnlIRklI?=
 =?utf-8?B?bkRDNGduenJqNGxXZXZqOWl0RUdCZ09oRTAyZ2wwRmUwMTB1T0dKdGdrRGY1?=
 =?utf-8?B?ZjYxTHhDVnhvV3lHaTd0aytwaExBNzI3aWluREVwbTFhTVlXZFVLMXNuTWl6?=
 =?utf-8?B?djhVclY0TXg4R2pjbkVpUmtTWVpuemVHN25MMlRESVpaL3BXUHVRWHdIbnNR?=
 =?utf-8?B?RndIcDUzVEp3Q1g3Y2x6VExnYVNFRS9FNWQ2c1NIS0Nkdjk2RmNmRm9OU2JX?=
 =?utf-8?B?NjE2WDY1QVFGdTFTaDE1QnFqazRibXBpOFJSeFc3d3BFbmNrWERRRGY4YnpW?=
 =?utf-8?B?MUdyakFBZEQ5Yk1YMFVDSmU0ZWtIYXlvM083UVU0NG05UEFmZkNDcDZ5NUt1?=
 =?utf-8?B?bS9CcGpZQ2ZpcXdkckUxRnFhWjVVeEVpYVhRbUdLVFBCdG9YM2lPa01rVlNC?=
 =?utf-8?B?bWNqYUpFODFvdlRPc2lHc3hUZnJhT3h1RUx1V3VTZ0RyeTZnZVNoZDVVQmZS?=
 =?utf-8?B?b01qUVFTRUtEeEJkOU96MG1JaUJnRzRscUZ0V0hHWEpKZEp4R2V1WTVQMDNO?=
 =?utf-8?B?UVRLTldrS0ZJTjU3M3ZXQ0YvYWdNejlFLzBzZW10SCtpQ1hKeGFBT3ppWE1C?=
 =?utf-8?Q?zKiY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdac15ed-6c80-4f3f-dfa8-08dbb8451895
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 12:45:10.9030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8ImT7pThHfbQbe/SjqYC/zxUFqKSbqrqIqvHyXPyvPFA3OB7dCG4XPJc7FHwFEB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4493
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.09.23 um 13:48 schrieb Karolina Stolarek:
> On 12.09.2023 14:54, Christian König wrote:
>> Am 12.09.23 um 13:49 schrieb Karolina Stolarek:
>>> Test initialization of ttm_resource using different memory domains.
>>> Add tests for a system memory manager and functions that can be
>>> tested without a fully-featured resource manager. Update
>>> ttm_bo_kunit_init() to initialize BO's kref and reservation object.
>>> Export ttm_resource_alloc symbol for test purposes only.
>>>
>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>> ---
>>>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  23 ++
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>>>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 
>>> ++++++++++++++++++
>>>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>>>   5 files changed, 366 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>
>>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>>> b/drivers/gpu/drm/ttm/tests/Makefile
>>> index ec87c4fc1ad5..c92fe2052ef6 100644
>>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>>> +++ b/drivers/gpu/drm/ttm/tests/Makefile
>>> @@ -3,4 +3,5 @@
>>>   obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>>           ttm_device_test.o \
>>>           ttm_pool_test.o \
>>> +        ttm_resource_test.o \
>>>           ttm_kunit_helpers.o
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>> index 81661d8827aa..eccc59b981f8 100644
>>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>> @@ -38,10 +38,33 @@ struct ttm_buffer_object 
>>> *ttm_bo_kunit_init(struct kunit *test,
>>>       bo->base = gem_obj;
>>>       bo->bdev = devs->ttm_dev;
>>> +    kref_init(&bo->kref);
>>> +
>>> +    dma_resv_init(&bo->base._resv);
>>> +    bo->base.resv = &bo->base._resv;
>>> +
>>
>> I'm really wondering if we shouldn't now initialize the GEM object 
>> properly?
>>
>> That would also initialize the reservation object if I remember 
>> correctly.
>
> Do you mean by using drm_gem_object_init()?

I think drm_gem_private_object_init is the right function for this, but 
not 100% sure.

>
>>
>> The solution with EXPORT_SYMBOL_FOR_TESTS_ONLY looks really nice I 
>> think and apart from that I can't see anything obviously wrong 
>> either, but I only skimmed over the code.
>
> I'm also glad with EXPORT_SYMBOL_FOR_TESTS_ONLY solution, it's much 
> better now. Right, you can take a closer look at the next version. 
> I'll try to get an actual GEM object here, if you think that's feasible.

I can't promise it, but going to take a look when I have time.

Regards,
Christian.

>
> All the best,
> Karolina
>
>>
>> Regards,
>> Christian.
>>
>>>       return bo;
>>>   }
>>>   EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
>>> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
>>> +                       uint32_t mem_type, uint32_t flags,
>>> +                       size_t size)
>>> +{
>>> +    struct ttm_place *place;
>>> +
>>> +    place = kunit_kzalloc(test, sizeof(*place), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, place);
>>> +
>>> +    place->mem_type = mem_type;
>>> +    place->flags = flags;
>>> +    place->fpfn = size >> PAGE_SHIFT;
>>> +    place->lpfn = place->fpfn + (size >> PAGE_SHIFT);
>>> +
>>> +    return place;
>>> +}
>>> +EXPORT_SYMBOL_GPL(ttm_place_kunit_init);
>>> +
>>>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
>>>   {
>>>       struct ttm_test_devices *devs;
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h 
>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>> index e261e3660d0b..f38140f93c05 100644
>>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>> @@ -8,6 +8,7 @@
>>>   #include <drm/drm_drv.h>
>>>   #include <drm/ttm/ttm_device.h>
>>>   #include <drm/ttm/ttm_bo.h>
>>> +#include <drm/ttm/ttm_placement.h>
>>>   #include <drm/drm_kunit_helpers.h>
>>>   #include <kunit/test.h>
>>> @@ -28,6 +29,9 @@ int ttm_device_kunit_init(struct ttm_test_devices 
>>> *priv,
>>>   struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>>>                           struct ttm_test_devices *devs,
>>>                           size_t size);
>>> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
>>> +                       uint32_t mem_type, uint32_t flags,
>>> +                       size_t size);
>>>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
>>>   struct ttm_test_devices *ttm_test_devices_all(struct kunit *test);
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c 
>>> b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>> new file mode 100644
>>> index 000000000000..851cdc43dc37
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>> @@ -0,0 +1,335 @@
>>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +#include <drm/ttm/ttm_resource.h>
>>> +
>>> +#include "ttm_kunit_helpers.h"
>>> +
>>> +#define RES_SIZE        SZ_4K
>>> +#define TTM_PRIV_DUMMY_REG    (TTM_NUM_MEM_TYPES - 1)
>>> +
>>> +struct ttm_resource_test_case {
>>> +    const char *description;
>>> +    uint32_t mem_type;
>>> +    uint32_t flags;
>>> +};
>>> +
>>> +struct ttm_resource_test_priv {
>>> +    struct ttm_test_devices *devs;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +};
>>> +
>>> +static const struct ttm_resource_manager_func 
>>> ttm_resource_manager_mock_funcs = { };
>>> +
>>> +static int ttm_resource_test_init(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv;
>>> +
>>> +    priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, priv);
>>> +
>>> +    priv->devs = ttm_test_devices_all(test);
>>> +    KUNIT_ASSERT_NOT_NULL(test, priv->devs);
>>> +
>>> +    test->priv = priv;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void ttm_resource_test_fini(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +
>>> +    ttm_test_devices_put(test, priv->devs);
>>> +}
>>> +
>>> +static void ttm_init_test_mocks(struct kunit *test,
>>> +                struct ttm_resource_test_priv *priv,
>>> +                uint32_t mem_type, uint32_t flags)
>>> +{
>>> +    size_t size = RES_SIZE;
>>> +
>>> +    /* Make sure we have what we need for a good BO mock */
>>> +    KUNIT_ASSERT_NOT_NULL(test, priv->devs->ttm_dev);
>>> +
>>> +    priv->bo = ttm_bo_kunit_init(test, priv->devs, size);
>>> +    priv->place = ttm_place_kunit_init(test, mem_type, flags, size);
>>> +}
>>> +
>>> +static void ttm_init_test_manager(struct kunit *test,
>>> +                  struct ttm_resource_test_priv *priv,
>>> +                  uint32_t mem_type)
>>> +{
>>> +    struct ttm_device *ttm_dev = priv->devs->ttm_dev;
>>> +    struct ttm_resource_manager *man;
>>> +    size_t size = SZ_16K;
>>> +
>>> +    man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, man);
>>> +
>>> +    man->use_tt = false;
>>> +    man->func = &ttm_resource_manager_mock_funcs;
>>> +
>>> +    ttm_resource_manager_init(man, ttm_dev, size);
>>> +    ttm_set_driver_manager(ttm_dev, mem_type, man);
>>> +    ttm_resource_manager_set_used(man, true);
>>> +}
>>> +
>>> +static const struct ttm_resource_test_case ttm_resource_cases[] = {
>>> +    {
>>> +        .description = "Init resource in TTM_PL_SYSTEM",
>>> +        .mem_type = TTM_PL_SYSTEM,
>>> +    },
>>> +    {
>>> +        .description = "Init resource in TTM_PL_VRAM",
>>> +        .mem_type = TTM_PL_VRAM,
>>> +    },
>>> +    {
>>> +        .description = "Init resource in a private placement",
>>> +        .mem_type = TTM_PRIV_DUMMY_REG,
>>> +    },
>>> +    {
>>> +        .description = "Init resource in TTM_PL_SYSTEM, set 
>>> placement flags",
>>> +        .mem_type = TTM_PL_SYSTEM,
>>> +        .flags = TTM_PL_FLAG_TOPDOWN,
>>> +    },
>>> +};
>>> +
>>> +static void ttm_resource_case_desc(const struct 
>>> ttm_resource_test_case *t, char *desc)
>>> +{
>>> +    strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
>>> +}
>>> +
>>> +KUNIT_ARRAY_PARAM(ttm_resource, ttm_resource_cases, 
>>> ttm_resource_case_desc);
>>> +
>>> +static void ttm_resource_init_basic(struct kunit *test)
>>> +{
>>> +    const struct ttm_resource_test_case *params = test->param_value;
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource *res;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +    struct ttm_resource_manager *man;
>>> +    uint64_t expected_usage;
>>> +
>>> +    ttm_init_test_mocks(test, priv, params->mem_type, params->flags);
>>> +    bo = priv->bo;
>>> +    place = priv->place;
>>> +
>>> +    if (params->mem_type > TTM_PL_SYSTEM)
>>> +        ttm_init_test_manager(test, priv, params->mem_type);
>>> +
>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>>> +    expected_usage = man->usage + RES_SIZE;
>>> +
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
>>> +
>>> +    ttm_resource_init(bo, place, res);
>>> +
>>> +    KUNIT_ASSERT_EQ(test, res->start, 0);
>>> +    KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
>>> +    KUNIT_ASSERT_EQ(test, res->mem_type, place->mem_type);
>>> +    KUNIT_ASSERT_EQ(test, res->placement, place->flags);
>>> +    KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
>>> +
>>> +    KUNIT_ASSERT_NULL(test, res->bus.addr);
>>> +    KUNIT_ASSERT_EQ(test, res->bus.offset, 0);
>>> +    KUNIT_ASSERT_FALSE(test, res->bus.is_iomem);
>>> +    KUNIT_ASSERT_EQ(test, res->bus.caching, ttm_cached);
>>> +    KUNIT_ASSERT_EQ(test, man->usage, expected_usage);
>>> +
>>> +    KUNIT_ASSERT_TRUE(test, 
>>> list_is_singular(&man->lru[bo->priority]));
>>> +
>>> +    ttm_resource_fini(man, res);
>>> +}
>>> +
>>> +static void ttm_resource_init_pinned(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource *res;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +    struct ttm_resource_manager *man;
>>> +
>>> +    ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
>>> +    bo = priv->bo;
>>> +    place = priv->place;
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>>> +
>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
>>> +
>>> +    dma_resv_lock(bo->base.resv, NULL);
>>> +    ttm_bo_pin(bo);
>>> +    ttm_resource_init(bo, place, res);
>>> +    KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->pinned));
>>> +
>>> +    ttm_bo_unpin(bo);
>>> +    ttm_resource_fini(man, res);
>>> +    dma_resv_unlock(bo->base.resv);
>>> +
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
>>> +}
>>> +
>>> +static void ttm_resource_fini_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource *res;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +    struct ttm_resource_manager *man;
>>> +
>>> +    ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
>>> +    bo = priv->bo;
>>> +    place = priv->place;
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>>> +
>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>> +
>>> +    ttm_resource_init(bo, place, res);
>>> +    ttm_resource_fini(man, res);
>>> +
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
>>> +    KUNIT_ASSERT_EQ(test, man->usage, 0);
>>> +}
>>> +
>>> +static void ttm_resource_manager_init_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource_manager *man;
>>> +    size_t size = SZ_16K;
>>> +
>>> +    man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, man);
>>> +
>>> +    ttm_resource_manager_init(man, priv->devs->ttm_dev, size);
>>> +
>>> +    KUNIT_ASSERT_PTR_EQ(test, man->bdev, priv->devs->ttm_dev);
>>> +    KUNIT_ASSERT_EQ(test, man->size, size);
>>> +    KUNIT_ASSERT_EQ(test, man->usage, 0);
>>> +    KUNIT_ASSERT_NULL(test, man->move);
>>> +    KUNIT_ASSERT_NOT_NULL(test, &man->move_lock);
>>> +
>>> +    for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>>> +        KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
>>> +}
>>> +
>>> +static void ttm_resource_manager_usage_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource *res;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +    struct ttm_resource_manager *man;
>>> +    uint64_t actual_usage;
>>> +
>>> +    ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 
>>> TTM_PL_FLAG_TOPDOWN);
>>> +    bo = priv->bo;
>>> +    place = priv->place;
>>> +
>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>>> +
>>> +    ttm_resource_init(bo, place, res);
>>> +    actual_usage = ttm_resource_manager_usage(man);
>>> +
>>> +    KUNIT_ASSERT_EQ(test, actual_usage, RES_SIZE);
>>> +
>>> +    ttm_resource_fini(man, res);
>>> +}
>>> +
>>> +static void ttm_resource_manager_set_used_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource_manager *man;
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, TTM_PL_SYSTEM);
>>> +    KUNIT_ASSERT_TRUE(test, man->use_type);
>>> +
>>> +    ttm_resource_manager_set_used(man, false);
>>> +    KUNIT_ASSERT_FALSE(test, man->use_type);
>>> +}
>>> +
>>> +static void ttm_sys_man_alloc_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource_manager *man;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +    struct ttm_resource *res;
>>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>>> +    int ret;
>>> +
>>> +    ttm_init_test_mocks(test, priv, mem_type, 0);
>>> +    bo = priv->bo;
>>> +    place = priv->place;
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
>>> +    ret = man->func->alloc(man, bo, place, &res);
>>> +
>>> +    KUNIT_ASSERT_EQ(test, ret, 0);
>>> +    KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
>>> +    KUNIT_ASSERT_EQ(test, res->mem_type, mem_type);
>>> +    KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
>>> +
>>> +    ttm_resource_fini(man, res);
>>> +}
>>> +
>>> +static void ttm_sys_man_free_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource_manager *man;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +    struct ttm_resource *res;
>>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>>> +
>>> +    ttm_init_test_mocks(test, priv, mem_type, 0);
>>> +    bo = priv->bo;
>>> +    place = priv->place;
>>> +
>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>> +
>>> +    ttm_resource_alloc(bo, place, &res);
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
>>> +    man->func->free(man, res);
>>> +
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
>>> +    KUNIT_ASSERT_EQ(test, man->usage, 0);
>>> +}
>>> +
>>> +static struct kunit_case ttm_resource_test_cases[] = {
>>> +    KUNIT_CASE_PARAM(ttm_resource_init_basic, 
>>> ttm_resource_gen_params),
>>> +    KUNIT_CASE(ttm_resource_init_pinned),
>>> +    KUNIT_CASE(ttm_resource_fini_basic),
>>> +    KUNIT_CASE(ttm_resource_manager_init_basic),
>>> +    KUNIT_CASE(ttm_resource_manager_usage_basic),
>>> +    KUNIT_CASE(ttm_resource_manager_set_used_basic),
>>> +    KUNIT_CASE(ttm_sys_man_alloc_basic),
>>> +    KUNIT_CASE(ttm_sys_man_free_basic),
>>> +    {}
>>> +};
>>> +
>>> +static struct kunit_suite ttm_resource_test_suite = {
>>> +    .name = "ttm_resource",
>>> +    .init = ttm_resource_test_init,
>>> +    .exit = ttm_resource_test_fini,
>>> +    .test_cases = ttm_resource_test_cases,
>>> +};
>>> +
>>> +kunit_test_suites(&ttm_resource_test_suite);
>>> +
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c 
>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>> index 46ff9c75bb12..02b96d23fdb9 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>> @@ -30,6 +30,8 @@
>>>   #include <drm/ttm/ttm_placement.h>
>>>   #include <drm/ttm/ttm_resource.h>
>>> +#include <drm/drm_util.h>
>>> +
>>>   /**
>>>    * ttm_lru_bulk_move_init - initialize a bulk move structure
>>>    * @bulk: the structure to init
>>> @@ -240,6 +242,7 @@ int ttm_resource_alloc(struct ttm_buffer_object 
>>> *bo,
>>>       spin_unlock(&bo->bdev->lru_lock);
>>>       return 0;
>>>   }
>>> +EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_resource_alloc);
>>>   void ttm_resource_free(struct ttm_buffer_object *bo, struct 
>>> ttm_resource **res)
>>>   {
>>

