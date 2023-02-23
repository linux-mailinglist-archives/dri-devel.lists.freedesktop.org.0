Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A86AE6A0DCB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 17:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC98B10E21A;
	Thu, 23 Feb 2023 16:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2059.outbound.protection.outlook.com [40.107.100.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8143510E21A;
 Thu, 23 Feb 2023 16:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKKvQo7aReDZfMxbY4bcFb/1yA4Yd8cvFZFHwgLsAVcyAk6Rg2wk1/YWSq+NOMvlEH9lUm9WryoQfTt/cjljBbKXapfDO1nrvsCwqfbjCnPyXz3RH+h6dPEIJHuPTPLlliCSGnwAUU0JW6xEQX9gPZ/LhNToyNWEvmuJ+fQwM3X6EbpXEKOF9va5W5pVlUao8pdqFL4Mf4jrDtkKNnJ2k1Hm3etP7WFCyjZK8644+ZH/tTXWoxSp/+FWlJ3cASv+APfja+qczWIyFpBmf/ptq900GSNhIZyAHFALON9wE7WnueQ6DZ/HMquuj5td0GCAKOikJ2tCOznC+InHg6fPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMnARVwi0f7e/Tnv8qJ4QPrWu0wf8pR7hsy0Pp9OUIw=;
 b=d6IRImYgKsjvC5ikIz5APyS5DKdBsi1r7iyMvUIvH0uo8N6uF4weoWKNdoRrdzmqRKxZhPeXrV/2/fjFSqSObkAohTI0LoYQ3jpI9VCbNAMcJEaE213f40xOiuYTVCrsCj3c6Ed8dk/GmbaQlzdl6JG5rEN/LOwR5IEp5+pS+sfaigKNReFwSEjB9MF3HTmoJJMmuFHJBrEdkd5l+3m3EfF65EmuXhA78JssHmtOSaWi2kqKuBwbXdheb4olUUvXJXy4bswABPKn7zjis8oc6L3/LCU3L5a5TSgInQksE/PTfWEU98UiYvN/FOZzgqrd8v5ss1h4CHUg4Aac29u0XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMnARVwi0f7e/Tnv8qJ4QPrWu0wf8pR7hsy0Pp9OUIw=;
 b=QccQb1qmIg4uFKCXfO7m24uBzrYOZMyT55tQQ0E6ynhSsC8PvAPOtjqHlyL12K7usVbi4vLCHFiVf9bG5MHYns0A5a6PzdL+xoUmnqJRbHaqH/O8fF8IHxeYEiJA7JZ7yaX5RdZoJGNFWculaI4Y6honl6tm0CK64MNgoYKM4js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4530.namprd12.prod.outlook.com (2603:10b6:5:2aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 16:22:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 16:22:10 +0000
Message-ID: <9193306f-82c6-d00e-4aa3-474e2f3926dd@amd.com>
Date: Thu, 23 Feb 2023 17:22:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] drm/amd: Convert amdgpu to use suballocation helper.
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230223105747.4719-1-thomas.hellstrom@linux.intel.com>
 <20230223105747.4719-3-thomas.hellstrom@linux.intel.com>
 <204ae1e9-de6f-0ab0-6d49-b6451168a384@amd.com>
 <7f105e70-84c5-1836-9602-3cf066a8e75f@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <7f105e70-84c5-1836-9602-3cf066a8e75f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f47a8ec-107c-4b65-3f52-08db15ba1d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: leZ3X2Nl++Qko10YxHwpNIGM856o6kMjtiZzCKOvXlJ6mi6jig5m7TDM6kVMcSt/2Rr1zcYmZ7m5V6e/lDJXCL+tfztUzShiJG0S95glSXpz7WLuLiundopy68aR3rT3+uE44NCw7MGVd2qhsKbR1d6y0ghk670UYkzG0NRISu+eVPNWdEuLr5ovsuPTEnW4QCT74dy3vDZTx2xMqUK+tPV4u+8MrUgIODRc6Ot6wRqJC6U7vcT7ik0I/yupbzLpat1zR0I+LWdEMED7fZqBQnXv5Qjd2HchjSUF53i4Gd9nRXBRdjKuUr4DaRTJgVLeDOVZa78Jjrv9FY2OVPYvLF3CnZcshVjm0pk2IBq/3sz0pfwkbjPJZAbR7+xFiURyA+jccf2tY3dYBxOLq7gddcPfRQCTXaZozJhcZVZsTKmnmA6bzKH0xe0zfinKnTbvt1lJjpuL9a50p5t81iIhLAhEz/b6Ysmb01YmEoWIexi4MVeiPGbJYdeQZ8Yq5IE99vJ5bDVygEoe2q0T42VDL09KoTo9RIcDn4lgwUpUt9zm7JyuTcr59jFyQki6NCVS9p/0XDP0nVs1TtFWSwkNRN74DUrSCbZy8P//I/X62i0f/KmU2pODycUjZ++hHHUsIF3HfeeK2ZRBCQ3VU/vkg3XNvqfD7brIK/oE+xcBCz8/x8pmJWOkcF7oR+iEVseSmIY5fLNjfIN2Qt1dzuplV879h51nJSB0Lk+ZDAdiwXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199018)(2616005)(41300700001)(83380400001)(5660300002)(31696002)(478600001)(186003)(8936002)(86362001)(38100700002)(8676002)(54906003)(4326008)(30864003)(53546011)(66946007)(6506007)(6512007)(66574015)(6486002)(316002)(66556008)(36756003)(66476007)(31686004)(2906002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkZKQkFsUjVramIzQm9WcVF2OHZKY0ZtSFozbmwrUTNESG1NaGdlMmpvWDU0?=
 =?utf-8?B?dHhLMUNDanYrYTVNQVk2bE9OdzJDSDhlTGdMM25PSVFvaDNuVWUzQjVHZXBp?=
 =?utf-8?B?Wk53dVdNTkZUUkQvN0FEOTVvR2FmSGo2ZHRqTWFuUXAxMFZRTUpscXh5bW1n?=
 =?utf-8?B?UXRjRjM5aUh2QTVXK3psNk1xVnorWHBqV1diYmpmNVFDR1FPTDl6bFU1UTN6?=
 =?utf-8?B?K1pKVU5CUUxTNk92Y1ZlMWJJNHpUbXl5SkFPeklodm5HWnlldFhqL25yWXYr?=
 =?utf-8?B?WGlGbEtwOUJUZFd3dzFnNUh4cHU1TnNsRjNzYVFMdytOZnVRNzZ2cUNodyt4?=
 =?utf-8?B?b0J1TzhVSU5SRzBHcnloRzZBNWtRSDZiUjNMSzBvN1B5Zmk0dys1QWdwZGVj?=
 =?utf-8?B?dnBna2hCRXVnMUV0Rk1nMUVkZEdnbWtBT2RUdmFsZCtwK1FJR0RKbzFJaS81?=
 =?utf-8?B?bE5MdDQxamlLcGxXb25PYi9WbjBhdG93T1hiNDJtN2xRRmgyUW4ydWNTTFNY?=
 =?utf-8?B?QVNubHZoY1FERjIvZkprRFljMnJzQmZwZjFpUnlLcGVpVlh5VjlCTVdISHVp?=
 =?utf-8?B?WFVXRlE5Sm1ZWm5ONFltbk1ZWFQ1dFVId015UFp6dFEwUEdaNHFBYndRb1B6?=
 =?utf-8?B?VGxGR3cxbTdESkNYVU1DTTk3RzRBT3JyUElia09xd0Nucy9QOHRpcldpQWZl?=
 =?utf-8?B?TElJbWpGRnF3TVVQSW5pQlZqS2FBcUhORmxRRy9QVmFySlBpNStjaXJQWEJO?=
 =?utf-8?B?TStwOUx4SjFCY0ZJTC90RGFVaFdWd0xLUFJoNXNiOXJHODdnZ3VkN0lMZStB?=
 =?utf-8?B?LzV6RlJlbitqVXQzbjNQKythSk9iSlJNRTdJRHk4V29uc3hxTHlVOGx4Tytj?=
 =?utf-8?B?alR5cStVQlo3TnJabWRvVHNTaTd1ZzFqUTBvRmpITzYzU09WUitvbG81Rk4y?=
 =?utf-8?B?dU1NeS85Zlo3M0VuY2NBMVJjZGZOY2FGT1JTMXltZEdYQlFXQTFub0hoTkdM?=
 =?utf-8?B?M01ybldlME5mQWlqN1A2NGVqMXROVTYzL1NNcHRlVGNvTWUvS2lvTHZBUGR5?=
 =?utf-8?B?ZHFCOENXZERPRWpEYkJPQVpmUzdzdE5QNzlCNCtMRkMyTzZVbEprUVVZZ1J4?=
 =?utf-8?B?NmJTTVhuUXBEZDl3SkxZV0kvTm55RS9CeWEza3Z4a0FrZ0RZMmFWbnFEaFRn?=
 =?utf-8?B?NW9yRlR3V29HNzVkYUVzWjBaNCs0dDFvRm1KMWk5eks1RjhUQUVtbjZXTktl?=
 =?utf-8?B?VDZONHd6OFQ0MjV3REc5d3JYVHBhQ1ozc05jUzJDSWppWW0zWkxxTUxLcGdO?=
 =?utf-8?B?SmU3SVJDQUZpV2VqMmNySWdyblFsMzZhZjJLYjJNT0FVWnZ1WVVLWGg5M3c5?=
 =?utf-8?B?QzB6dVV6NnBGVHpNUWVGanlIVnlTcUFsMTlvZURHdkdTUUYreW1vNVpONUpw?=
 =?utf-8?B?T09peTJlS1l6elRKRmk0ZE43eXBGdFErTE9zOGplVHZBbXh0Y09XU2xUQTJn?=
 =?utf-8?B?U0g0MS9ObDl5cURWZFBKU0cwcWZySlVwcmNjZVY0d3FxaG5WK2xHRFlqUzM5?=
 =?utf-8?B?aEQ2MWpiWkZuZzd1RFhRY2tjNnRGYjdaS2I5bHlqZ0hJL3Ava0wyeHZpRW1p?=
 =?utf-8?B?NkYyS2dMWXJEdDduNjdOdGVZaUlYMDJxWVNtb25vQW91OTc4UndtYWpOWWN6?=
 =?utf-8?B?bndyYWx1cU9SREZ2SGZ5QUpuRVZRdjFsYnZPMmtEU2NTUVQxaEJRK2tPeWpy?=
 =?utf-8?B?aHArRjdRcnRJdFFmZEl5R0l6a1kyekkvQTVLd2xEM2Y1VmZCRE9yNkFucG1P?=
 =?utf-8?B?WmZDV005VzBQRmJxcVpYUmtic0wzMy9tR20xY3BqeVZJVE91cUhzUkZPTUJ0?=
 =?utf-8?B?VmJPdHUvalo3NkRJcHY2WVdsdWRkRitoOXFkSExybnlGWkJWK1BMMmFNaU50?=
 =?utf-8?B?UVJZQ0tQNE5GQ1c4VHlKaGlsZFArNkxlZE12ZjJlQTNFempLcVBPU0pTTnBm?=
 =?utf-8?B?K1ZxRzUrOTdwYTcxTCttZmFRdWpUYzQrMHp4MTZwdlpTeFd2U2N2MGZDRjRV?=
 =?utf-8?B?ckdpdXFnekZjZU0zZGtWVDVpcFBJdjB6K1YwdGZQT0VSeGNBbHhUNXJNMlVs?=
 =?utf-8?B?SlA0TEJDdlJDRFZrVTdhY3NMeXZqVGthb2VCS0xOMzhlMllwZ05vZGJraUxh?=
 =?utf-8?Q?dlPD2+LHtW3VWfWSIVLdWn84qhddlUJR/qLH63Q+C6y5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f47a8ec-107c-4b65-3f52-08db15ba1d21
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 16:22:10.2375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LguYkEY3EcTGaOm89adK2J2/xpNspnaVuLJ1pv4TxQjPOzR1yT9ULdx3P/N7x/Nb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4530
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.02.23 um 15:29 schrieb Thomas Hellström:
>
> On 2/23/23 12:15, Christian König wrote:
>> Am 23.02.23 um 11:57 schrieb Thomas Hellström:
>>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>
>>> Now that we have a generic suballocation helper, Use it in amdgpu.
>>> For lines that get moved or changed, also fix up pre-existing style 
>>> issues.
>>>
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/Kconfig                    |   1 +
>>>   drivers/gpu/drm/amd/amdgpu/Kconfig         |   1 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  26 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c     |   5 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  23 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   3 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c     | 324 
>>> ++-------------------
>>>   7 files changed, 46 insertions(+), 337 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 8fbe57407c60..73ddfdf3a894 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -77,6 +77,7 @@ config DRM_KUNIT_TEST
>>>       select DRM_DISPLAY_HELPER
>>>       select DRM_LIB_RANDOM
>>>       select DRM_KMS_HELPER
>>> +    select DRM_SUBALLOC_HELPER
>>>       select DRM_BUDDY
>>>       select DRM_EXPORT_FOR_TESTS if m
>>>       select DRM_KUNIT_TEST_HELPERS
>>
>> This looks like it's misplaced, apart from that the patch looks good 
>> to me.
>
> Looks like a TAB vs spaces issue. The resulting file looks correct. 
> Also added the same select for Radeon in the following patch which was 
> forgotten.


That wasn't what I meant. This here is the patch to change amdgpu, but 
you are adding the dependency to the KUNIT test.

It looks like that adding this line should be in patch #1, not patch #2.

Regards,
Christian.

>
> Added your R-B to all patches, even if it wasn't exlicit for this one. 
> Please let me know if I misunderstood that one.
>
> Thanks,
>
> Thomas
>
>
>>
>> Regards,
>> Christian.
>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig 
>>> b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>> index 5341b6b242c3..0ed12171450b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>> @@ -18,6 +18,7 @@ config DRM_AMDGPU
>>>       select BACKLIGHT_CLASS_DEVICE
>>>       select INTERVAL_TREE
>>>       select DRM_BUDDY
>>> +    select DRM_SUBALLOC_HELPER
>>>       # amdgpu depends on ACPI_VIDEO when ACPI is enabled, for 
>>> select to work
>>>       # ACPI_VIDEO's dependencies must also be selected.
>>>       select INPUT if ACPI
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index 164141bc8b4a..dda88090f044 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -424,29 +424,11 @@ struct amdgpu_clock {
>>>    * alignment).
>>>    */
>>>   -#define AMDGPU_SA_NUM_FENCE_LISTS    32
>>> -
>>>   struct amdgpu_sa_manager {
>>> -    wait_queue_head_t    wq;
>>> -    struct amdgpu_bo    *bo;
>>> -    struct list_head    *hole;
>>> -    struct list_head    flist[AMDGPU_SA_NUM_FENCE_LISTS];
>>> -    struct list_head    olist;
>>> -    unsigned        size;
>>> -    uint64_t        gpu_addr;
>>> -    void            *cpu_ptr;
>>> -    uint32_t        domain;
>>> -    uint32_t        align;
>>> -};
>>> -
>>> -/* sub-allocation buffer */
>>> -struct amdgpu_sa_bo {
>>> -    struct list_head        olist;
>>> -    struct list_head        flist;
>>> -    struct amdgpu_sa_manager    *manager;
>>> -    unsigned            soffset;
>>> -    unsigned            eoffset;
>>> -    struct dma_fence            *fence;
>>> +    struct drm_suballoc_manager    base;
>>> +    struct amdgpu_bo        *bo;
>>> +    uint64_t            gpu_addr;
>>> +    void                *cpu_ptr;
>>>   };
>>>     int amdgpu_fence_slab_init(void);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
>>> index bcccc348dbe2..df7eb0b7c4b9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
>>> @@ -69,7 +69,7 @@ int amdgpu_ib_get(struct amdgpu_device *adev, 
>>> struct amdgpu_vm *vm,
>>>         if (size) {
>>>           r = amdgpu_sa_bo_new(&adev->ib_pools[pool_type],
>>> -                      &ib->sa_bo, size, 256);
>>> +                     &ib->sa_bo, size);
>>>           if (r) {
>>>               dev_err(adev->dev, "failed to get a new IB (%d)\n", r);
>>>               return r;
>>> @@ -309,8 +309,7 @@ int amdgpu_ib_pool_init(struct amdgpu_device *adev)
>>>         for (i = 0; i < AMDGPU_IB_POOL_MAX; i++) {
>>>           r = amdgpu_sa_bo_manager_init(adev, &adev->ib_pools[i],
>>> -                          AMDGPU_IB_POOL_SIZE,
>>> -                          AMDGPU_GPU_PAGE_SIZE,
>>> +                          AMDGPU_IB_POOL_SIZE, 256,
>>>                             AMDGPU_GEM_DOMAIN_GTT);
>>>           if (r)
>>>               goto error;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>> index 93207badf83f..5a85726ce853 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>> @@ -336,15 +336,22 @@ uint32_t amdgpu_bo_get_preferred_domain(struct 
>>> amdgpu_device *adev,
>>>   /*
>>>    * sub allocation
>>>    */
>>> +static inline struct amdgpu_sa_manager *
>>> +to_amdgpu_sa_manager(struct drm_suballoc_manager *manager)
>>> +{
>>> +    return container_of(manager, struct amdgpu_sa_manager, base);
>>> +}
>>>   -static inline uint64_t amdgpu_sa_bo_gpu_addr(struct amdgpu_sa_bo 
>>> *sa_bo)
>>> +static inline uint64_t amdgpu_sa_bo_gpu_addr(struct drm_suballoc 
>>> *sa_bo)
>>>   {
>>> -    return sa_bo->manager->gpu_addr + sa_bo->soffset;
>>> +    return to_amdgpu_sa_manager(sa_bo->manager)->gpu_addr +
>>> +        drm_suballoc_soffset(sa_bo);
>>>   }
>>>   -static inline void * amdgpu_sa_bo_cpu_addr(struct amdgpu_sa_bo 
>>> *sa_bo)
>>> +static inline void *amdgpu_sa_bo_cpu_addr(struct drm_suballoc *sa_bo)
>>>   {
>>> -    return sa_bo->manager->cpu_ptr + sa_bo->soffset;
>>> +    return to_amdgpu_sa_manager(sa_bo->manager)->cpu_ptr +
>>> +        drm_suballoc_soffset(sa_bo);
>>>   }
>>>     int amdgpu_sa_bo_manager_init(struct amdgpu_device *adev,
>>> @@ -355,11 +362,11 @@ void amdgpu_sa_bo_manager_fini(struct 
>>> amdgpu_device *adev,
>>>   int amdgpu_sa_bo_manager_start(struct amdgpu_device *adev,
>>>                         struct amdgpu_sa_manager *sa_manager);
>>>   int amdgpu_sa_bo_new(struct amdgpu_sa_manager *sa_manager,
>>> -             struct amdgpu_sa_bo **sa_bo,
>>> -             unsigned size, unsigned align);
>>> +             struct drm_suballoc **sa_bo,
>>> +             unsigned int size);
>>>   void amdgpu_sa_bo_free(struct amdgpu_device *adev,
>>> -                  struct amdgpu_sa_bo **sa_bo,
>>> -                  struct dma_fence *fence);
>>> +               struct drm_suballoc **sa_bo,
>>> +               struct dma_fence *fence);
>>>   #if defined(CONFIG_DEBUG_FS)
>>>   void amdgpu_sa_bo_dump_debug_info(struct amdgpu_sa_manager 
>>> *sa_manager,
>>>                        struct seq_file *m);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> index 3989e755a5b4..018f36b10de8 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> @@ -27,6 +27,7 @@
>>>   #include <drm/amdgpu_drm.h>
>>>   #include <drm/gpu_scheduler.h>
>>>   #include <drm/drm_print.h>
>>> +#include <drm/drm_suballoc.h>
>>>     struct amdgpu_device;
>>>   struct amdgpu_ring;
>>> @@ -92,7 +93,7 @@ enum amdgpu_ib_pool_type {
>>>   };
>>>     struct amdgpu_ib {
>>> -    struct amdgpu_sa_bo        *sa_bo;
>>> +    struct drm_suballoc        *sa_bo;
>>>       uint32_t            length_dw;
>>>       uint64_t            gpu_addr;
>>>       uint32_t            *ptr;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c
>>> index 524d10b21041..c6b4337eb20c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c
>>> @@ -44,327 +44,63 @@
>>>     #include "amdgpu.h"
>>>   -static void amdgpu_sa_bo_remove_locked(struct amdgpu_sa_bo *sa_bo);
>>> -static void amdgpu_sa_bo_try_free(struct amdgpu_sa_manager 
>>> *sa_manager);
>>> -
>>>   int amdgpu_sa_bo_manager_init(struct amdgpu_device *adev,
>>>                     struct amdgpu_sa_manager *sa_manager,
>>> -                  unsigned size, u32 align, u32 domain)
>>> +                  unsigned int size, u32 suballoc_align, u32 domain)
>>>   {
>>> -    int i, r;
>>> -
>>> -    init_waitqueue_head(&sa_manager->wq);
>>> -    sa_manager->bo = NULL;
>>> -    sa_manager->size = size;
>>> -    sa_manager->domain = domain;
>>> -    sa_manager->align = align;
>>> -    sa_manager->hole = &sa_manager->olist;
>>> -    INIT_LIST_HEAD(&sa_manager->olist);
>>> -    for (i = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i)
>>> -        INIT_LIST_HEAD(&sa_manager->flist[i]);
>>> +    int r;
>>>   -    r = amdgpu_bo_create_kernel(adev, size, align, domain, 
>>> &sa_manager->bo,
>>> -                &sa_manager->gpu_addr, &sa_manager->cpu_ptr);
>>> +    r = amdgpu_bo_create_kernel(adev, size, AMDGPU_GPU_PAGE_SIZE, 
>>> domain,
>>> +                    &sa_manager->bo, &sa_manager->gpu_addr,
>>> +                    &sa_manager->cpu_ptr);
>>>       if (r) {
>>>           dev_err(adev->dev, "(%d) failed to allocate bo for 
>>> manager\n", r);
>>>           return r;
>>>       }
>>>   -    memset(sa_manager->cpu_ptr, 0, sa_manager->size);
>>> +    memset(sa_manager->cpu_ptr, 0, size);
>>> +    drm_suballoc_manager_init(&sa_manager->base, size, 
>>> suballoc_align);
>>>       return r;
>>>   }
>>>     void amdgpu_sa_bo_manager_fini(struct amdgpu_device *adev,
>>>                      struct amdgpu_sa_manager *sa_manager)
>>>   {
>>> -    struct amdgpu_sa_bo *sa_bo, *tmp;
>>> -
>>>       if (sa_manager->bo == NULL) {
>>>           dev_err(adev->dev, "no bo for sa manager\n");
>>>           return;
>>>       }
>>>   -    if (!list_empty(&sa_manager->olist)) {
>>> -        sa_manager->hole = &sa_manager->olist,
>>> -        amdgpu_sa_bo_try_free(sa_manager);
>>> -        if (!list_empty(&sa_manager->olist)) {
>>> -            dev_err(adev->dev, "sa_manager is not empty, clearing 
>>> anyway\n");
>>> -        }
>>> -    }
>>> -    list_for_each_entry_safe(sa_bo, tmp, &sa_manager->olist, olist) {
>>> -        amdgpu_sa_bo_remove_locked(sa_bo);
>>> -    }
>>> +    drm_suballoc_manager_fini(&sa_manager->base);
>>>         amdgpu_bo_free_kernel(&sa_manager->bo, 
>>> &sa_manager->gpu_addr, &sa_manager->cpu_ptr);
>>> -    sa_manager->size = 0;
>>>   }
>>>   -static void amdgpu_sa_bo_remove_locked(struct amdgpu_sa_bo *sa_bo)
>>> -{
>>> -    struct amdgpu_sa_manager *sa_manager = sa_bo->manager;
>>> -    if (sa_manager->hole == &sa_bo->olist) {
>>> -        sa_manager->hole = sa_bo->olist.prev;
>>> -    }
>>> -    list_del_init(&sa_bo->olist);
>>> -    list_del_init(&sa_bo->flist);
>>> -    dma_fence_put(sa_bo->fence);
>>> -    kfree(sa_bo);
>>> -}
>>> -
>>> -static void amdgpu_sa_bo_try_free(struct amdgpu_sa_manager 
>>> *sa_manager)
>>> +int amdgpu_sa_bo_new(struct amdgpu_sa_manager *sa_manager,
>>> +             struct drm_suballoc **sa_bo,
>>> +             unsigned int size)
>>>   {
>>> -    struct amdgpu_sa_bo *sa_bo, *tmp;
>>> +    struct drm_suballoc *sa = drm_suballoc_new(&sa_manager->base, 
>>> size,
>>> +                           GFP_KERNEL, true, 0);
>>>   -    if (sa_manager->hole->next == &sa_manager->olist)
>>> -        return;
>>> +    if (IS_ERR(sa)) {
>>> +        *sa_bo = NULL;
>>>   -    sa_bo = list_entry(sa_manager->hole->next, struct 
>>> amdgpu_sa_bo, olist);
>>> -    list_for_each_entry_safe_from(sa_bo, tmp, &sa_manager->olist, 
>>> olist) {
>>> -        if (sa_bo->fence == NULL ||
>>> -            !dma_fence_is_signaled(sa_bo->fence)) {
>>> -            return;
>>> -        }
>>> -        amdgpu_sa_bo_remove_locked(sa_bo);
>>> +        return PTR_ERR(sa);
>>>       }
>>> -}
>>>   -static inline unsigned amdgpu_sa_bo_hole_soffset(struct 
>>> amdgpu_sa_manager *sa_manager)
>>> -{
>>> -    struct list_head *hole = sa_manager->hole;
>>> -
>>> -    if (hole != &sa_manager->olist) {
>>> -        return list_entry(hole, struct amdgpu_sa_bo, olist)->eoffset;
>>> -    }
>>> +    *sa_bo = sa;
>>>       return 0;
>>>   }
>>>   -static inline unsigned amdgpu_sa_bo_hole_eoffset(struct 
>>> amdgpu_sa_manager *sa_manager)
>>> -{
>>> -    struct list_head *hole = sa_manager->hole;
>>> -
>>> -    if (hole->next != &sa_manager->olist) {
>>> -        return list_entry(hole->next, struct amdgpu_sa_bo, 
>>> olist)->soffset;
>>> -    }
>>> -    return sa_manager->size;
>>> -}
>>> -
>>> -static bool amdgpu_sa_bo_try_alloc(struct amdgpu_sa_manager 
>>> *sa_manager,
>>> -                   struct amdgpu_sa_bo *sa_bo,
>>> -                   unsigned size, unsigned align)
>>> -{
>>> -    unsigned soffset, eoffset, wasted;
>>> -
>>> -    soffset = amdgpu_sa_bo_hole_soffset(sa_manager);
>>> -    eoffset = amdgpu_sa_bo_hole_eoffset(sa_manager);
>>> -    wasted = (align - (soffset % align)) % align;
>>> -
>>> -    if ((eoffset - soffset) >= (size + wasted)) {
>>> -        soffset += wasted;
>>> -
>>> -        sa_bo->manager = sa_manager;
>>> -        sa_bo->soffset = soffset;
>>> -        sa_bo->eoffset = soffset + size;
>>> -        list_add(&sa_bo->olist, sa_manager->hole);
>>> -        INIT_LIST_HEAD(&sa_bo->flist);
>>> -        sa_manager->hole = &sa_bo->olist;
>>> -        return true;
>>> -    }
>>> -    return false;
>>> -}
>>> -
>>> -/**
>>> - * amdgpu_sa_event - Check if we can stop waiting
>>> - *
>>> - * @sa_manager: pointer to the sa_manager
>>> - * @size: number of bytes we want to allocate
>>> - * @align: alignment we need to match
>>> - *
>>> - * Check if either there is a fence we can wait for or
>>> - * enough free memory to satisfy the allocation directly
>>> - */
>>> -static bool amdgpu_sa_event(struct amdgpu_sa_manager *sa_manager,
>>> -                unsigned size, unsigned align)
>>> -{
>>> -    unsigned soffset, eoffset, wasted;
>>> -    int i;
>>> -
>>> -    for (i = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i)
>>> -        if (!list_empty(&sa_manager->flist[i]))
>>> -            return true;
>>> -
>>> -    soffset = amdgpu_sa_bo_hole_soffset(sa_manager);
>>> -    eoffset = amdgpu_sa_bo_hole_eoffset(sa_manager);
>>> -    wasted = (align - (soffset % align)) % align;
>>> -
>>> -    if ((eoffset - soffset) >= (size + wasted)) {
>>> -        return true;
>>> -    }
>>> -
>>> -    return false;
>>> -}
>>> -
>>> -static bool amdgpu_sa_bo_next_hole(struct amdgpu_sa_manager 
>>> *sa_manager,
>>> -                   struct dma_fence **fences,
>>> -                   unsigned *tries)
>>> -{
>>> -    struct amdgpu_sa_bo *best_bo = NULL;
>>> -    unsigned i, soffset, best, tmp;
>>> -
>>> -    /* if hole points to the end of the buffer */
>>> -    if (sa_manager->hole->next == &sa_manager->olist) {
>>> -        /* try again with its beginning */
>>> -        sa_manager->hole = &sa_manager->olist;
>>> -        return true;
>>> -    }
>>> -
>>> -    soffset = amdgpu_sa_bo_hole_soffset(sa_manager);
>>> -    /* to handle wrap around we add sa_manager->size */
>>> -    best = sa_manager->size * 2;
>>> -    /* go over all fence list and try to find the closest sa_bo
>>> -     * of the current last
>>> -     */
>>> -    for (i = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i) {
>>> -        struct amdgpu_sa_bo *sa_bo;
>>> -
>>> -        fences[i] = NULL;
>>> -
>>> -        if (list_empty(&sa_manager->flist[i]))
>>> -            continue;
>>> -
>>> -        sa_bo = list_first_entry(&sa_manager->flist[i],
>>> -                     struct amdgpu_sa_bo, flist);
>>> -
>>> -        if (!dma_fence_is_signaled(sa_bo->fence)) {
>>> -            fences[i] = sa_bo->fence;
>>> -            continue;
>>> -        }
>>> -
>>> -        /* limit the number of tries each ring gets */
>>> -        if (tries[i] > 2) {
>>> -            continue;
>>> -        }
>>> -
>>> -        tmp = sa_bo->soffset;
>>> -        if (tmp < soffset) {
>>> -            /* wrap around, pretend it's after */
>>> -            tmp += sa_manager->size;
>>> -        }
>>> -        tmp -= soffset;
>>> -        if (tmp < best) {
>>> -            /* this sa bo is the closest one */
>>> -            best = tmp;
>>> -            best_bo = sa_bo;
>>> -        }
>>> -    }
>>> -
>>> -    if (best_bo) {
>>> -        uint32_t idx = best_bo->fence->context;
>>> -
>>> -        idx %= AMDGPU_SA_NUM_FENCE_LISTS;
>>> -        ++tries[idx];
>>> -        sa_manager->hole = best_bo->olist.prev;
>>> -
>>> -        /* we knew that this one is signaled,
>>> -           so it's save to remote it */
>>> -        amdgpu_sa_bo_remove_locked(best_bo);
>>> -        return true;
>>> -    }
>>> -    return false;
>>> -}
>>> -
>>> -int amdgpu_sa_bo_new(struct amdgpu_sa_manager *sa_manager,
>>> -             struct amdgpu_sa_bo **sa_bo,
>>> -             unsigned size, unsigned align)
>>> -{
>>> -    struct dma_fence *fences[AMDGPU_SA_NUM_FENCE_LISTS];
>>> -    unsigned tries[AMDGPU_SA_NUM_FENCE_LISTS];
>>> -    unsigned count;
>>> -    int i, r;
>>> -    signed long t;
>>> -
>>> -    if (WARN_ON_ONCE(align > sa_manager->align))
>>> -        return -EINVAL;
>>> -
>>> -    if (WARN_ON_ONCE(size > sa_manager->size))
>>> -        return -EINVAL;
>>> -
>>> -    *sa_bo = kmalloc(sizeof(struct amdgpu_sa_bo), GFP_KERNEL);
>>> -    if (!(*sa_bo))
>>> -        return -ENOMEM;
>>> -    (*sa_bo)->manager = sa_manager;
>>> -    (*sa_bo)->fence = NULL;
>>> -    INIT_LIST_HEAD(&(*sa_bo)->olist);
>>> -    INIT_LIST_HEAD(&(*sa_bo)->flist);
>>> -
>>> -    spin_lock(&sa_manager->wq.lock);
>>> -    do {
>>> -        for (i = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i)
>>> -            tries[i] = 0;
>>> -
>>> -        do {
>>> -            amdgpu_sa_bo_try_free(sa_manager);
>>> -
>>> -            if (amdgpu_sa_bo_try_alloc(sa_manager, *sa_bo,
>>> -                           size, align)) {
>>> -                spin_unlock(&sa_manager->wq.lock);
>>> -                return 0;
>>> -            }
>>> -
>>> -            /* see if we can skip over some allocations */
>>> -        } while (amdgpu_sa_bo_next_hole(sa_manager, fences, tries));
>>> -
>>> -        for (i = 0, count = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i)
>>> -            if (fences[i])
>>> -                fences[count++] = dma_fence_get(fences[i]);
>>> -
>>> -        if (count) {
>>> -            spin_unlock(&sa_manager->wq.lock);
>>> -            t = dma_fence_wait_any_timeout(fences, count, false,
>>> -                               MAX_SCHEDULE_TIMEOUT,
>>> -                               NULL);
>>> -            for (i = 0; i < count; ++i)
>>> -                dma_fence_put(fences[i]);
>>> -
>>> -            r = (t > 0) ? 0 : t;
>>> -            spin_lock(&sa_manager->wq.lock);
>>> -        } else {
>>> -            /* if we have nothing to wait for block */
>>> -            r = wait_event_interruptible_locked(
>>> -                sa_manager->wq,
>>> -                amdgpu_sa_event(sa_manager, size, align)
>>> -            );
>>> -        }
>>> -
>>> -    } while (!r);
>>> -
>>> -    spin_unlock(&sa_manager->wq.lock);
>>> -    kfree(*sa_bo);
>>> -    *sa_bo = NULL;
>>> -    return r;
>>> -}
>>> -
>>> -void amdgpu_sa_bo_free(struct amdgpu_device *adev, struct 
>>> amdgpu_sa_bo **sa_bo,
>>> +void amdgpu_sa_bo_free(struct amdgpu_device *adev, struct 
>>> drm_suballoc **sa_bo,
>>>                  struct dma_fence *fence)
>>>   {
>>> -    struct amdgpu_sa_manager *sa_manager;
>>> -
>>>       if (sa_bo == NULL || *sa_bo == NULL) {
>>>           return;
>>>       }
>>>   -    sa_manager = (*sa_bo)->manager;
>>> -    spin_lock(&sa_manager->wq.lock);
>>> -    if (fence && !dma_fence_is_signaled(fence)) {
>>> -        uint32_t idx;
>>> -
>>> -        (*sa_bo)->fence = dma_fence_get(fence);
>>> -        idx = fence->context % AMDGPU_SA_NUM_FENCE_LISTS;
>>> -        list_add_tail(&(*sa_bo)->flist, &sa_manager->flist[idx]);
>>> -    } else {
>>> -        amdgpu_sa_bo_remove_locked(*sa_bo);
>>> -    }
>>> -    wake_up_all_locked(&sa_manager->wq);
>>> -    spin_unlock(&sa_manager->wq.lock);
>>> +    drm_suballoc_free(*sa_bo, fence);
>>>       *sa_bo = NULL;
>>>   }
>>>   @@ -373,26 +109,8 @@ void amdgpu_sa_bo_free(struct amdgpu_device 
>>> *adev, struct amdgpu_sa_bo **sa_bo,
>>>   void amdgpu_sa_bo_dump_debug_info(struct amdgpu_sa_manager 
>>> *sa_manager,
>>>                     struct seq_file *m)
>>>   {
>>> -    struct amdgpu_sa_bo *i;
>>> -
>>> -    spin_lock(&sa_manager->wq.lock);
>>> -    list_for_each_entry(i, &sa_manager->olist, olist) {
>>> -        uint64_t soffset = i->soffset + sa_manager->gpu_addr;
>>> -        uint64_t eoffset = i->eoffset + sa_manager->gpu_addr;
>>> -        if (&i->olist == sa_manager->hole) {
>>> -            seq_printf(m, ">");
>>> -        } else {
>>> -            seq_printf(m, " ");
>>> -        }
>>> -        seq_printf(m, "[0x%010llx 0x%010llx] size %8lld",
>>> -               soffset, eoffset, eoffset - soffset);
>>> +    struct drm_printer p = drm_seq_file_printer(m);
>>>   -        if (i->fence)
>>> -            seq_printf(m, " protected by 0x%016llx on context %llu",
>>> -                   i->fence->seqno, i->fence->context);
>>> -
>>> -        seq_printf(m, "\n");
>>> -    }
>>> -    spin_unlock(&sa_manager->wq.lock);
>>> +    drm_suballoc_dump_debug_info(&sa_manager->base, &p, 
>>> sa_manager->gpu_addr);
>>>   }
>>>   #endif
>>

