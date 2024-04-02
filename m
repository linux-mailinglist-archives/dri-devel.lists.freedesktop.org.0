Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716D0894D4E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 10:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18F410ECD1;
	Tue,  2 Apr 2024 08:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eWV/Xizy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2107.outbound.protection.outlook.com [40.107.94.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F41A10EB2F;
 Tue,  2 Apr 2024 08:17:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYkHoVXJrgu2YlmRq8xpC1XNNV2Ru/k8WFAtg5qR7tk2Po/oGoq3Xs+KBr1Ff9L360772f1MU2ejxificofRMY2oQ0hEv5k5/XaqLTFMPr79yDDnyV57S/V9NlTdwn4vmGFzn4VTNzaMoNKchgxSMcDxbMiCRvM5XHsKrl1H/Szbq2FExZC6tOClzt9QnQQPOsxcEIbMsgQ690clD7EwGdW2KcPW5RJ1qNVZ+UZN+TzIGc/EZ3X/Qbd5s4/LJ/z7u6v+TJTVcpyoNSGF2THKaGLrtUgSIPl3UlpcNqx7O3iM8goEYW3liU3n2jk+z8TCgJ4kQh7EBMb9I3o/OvYsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nhGuhBz7jgP5T7GSmonahtdD+qFR7agdaQVgLC/+4A=;
 b=KvfAgfQb05IN2/FFnbPYpOki3K+qki4avuXVX9eqMeWDjb0pQqARNB4kqMLt0ZxTx2z9FHyPTmP+PW2oYc/GtiLX29fv2Wa3uGhp4vDGCQXD5TX4fw35U8sGFfgWvyzJi0T0auO5czor4DieEcnQSkXrx7Qir4bxFqh/wKH7MREC/DrAPRghmaBFTnzMGl2qvfvs/sqRynh2dpjJIllnHQd6Mw+0uKT1c99U/P0CF1z/T8O4kYIHIy2Jo+cPLeyLYBWC2nTMqnrYmrUUmYEoMdGavtO9Nut8WujBwG3yBkE/lr2ZIi4AdI6WIVYBt0S0+M++IBtnJkzh5B7jMQ+5Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nhGuhBz7jgP5T7GSmonahtdD+qFR7agdaQVgLC/+4A=;
 b=eWV/XizyTmkutnxg5pOuHiB1A4kFErka2oDit40w28BHhyfXfoXDXIcPYdB9XWbn6rMQeoZggKu0K1P8BGIzo4ahmga2ud6WcNkbB1tQym8mJ+H//9QfraA/FGFXVDPUNQKNxbby/qD27nXYsi98B3w2pkl+VurIsuSscN4rUfQ=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7772.namprd12.prod.outlook.com (2603:10b6:8:138::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 08:17:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 08:17:20 +0000
Message-ID: <38790fd5-afd3-4b56-ad14-7bd5897f6f9a@amd.com>
Date: Tue, 2 Apr 2024 10:17:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] drm/amdgpu: Enable clear page functionality
To: Alex Deucher <alexdeucher@gmail.com>,
 "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, matthew.auld@intel.com,
 mario.limonciello@amd.com, felix.kuehling@amd.com
References: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
 <20240318214058.2014-2-Arunpravin.PaneerSelvam@amd.com>
 <CADnq5_OOV49X-ctq-V6B9rGun43_BnWJixkbzAGRO1g0fzACxA@mail.gmail.com>
 <59ec1d92-19d6-4b88-97eb-16e9c3436d6c@amd.com>
 <CADnq5_Op9YaYPvWXmk2x1g1PcZ6qrs4NsDt2zrrvhnL9kgU7Gg@mail.gmail.com>
 <CADnq5_PnJ_y6r7_-vMxJETmO9jZVrsx+YMe-xOimCVYW_68F3g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_PnJ_y6r7_-vMxJETmO9jZVrsx+YMe-xOimCVYW_68F3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7772:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HQvyBlczMF2Pn3oinq2yT2TtlOtYYcRGwDeLPXVL9cgnkRM24jGIB0/XuKZyjgx8QEivrghVZP/yaeIq6xjS7B1vsSJTDp9xi1EHhjmyywUkDIPzmgWsMxsyEmAWf0GSzi7BMq8IIMKakuS8DikqpzW1tbHz1298RQtjLB4Ke69H3dBinaJeVcJ53D51nYW58JL9LLjW8fbcwcFYH/PbVoSpLop8AKt8cP6YAUyJ52UHtLBfNln+f90jTGeu/l2T5D0S+uOoNeyKLTJhagm+sphRfybF9SRjkN8+6yhavv89kotH5r/ooMnhQEHEfe/N55jz1KgR6w1DQgoPOhQ1mSGCsqEPda2Gu7SmPHpVuW85/Ip2OLOHf829PuRMLPxM5eF1pfK+zMI1iLs+Ifatf/B7eOyqIziJWi4G06xYMLpLn5CYQTyebpLYUTWxOqgWnnokYdoHA5ebuPdoNwwyv6zhCaQ2qNql6DaDHedtxMtmaIOIM8TTgNf4qmYB+f0Hqdox31s7w4wvDvvDiqVEjcD8iW9nzX4ef0QMe9CC/lXMBf5Ndo8QEhVkPJT6pjVtiiycZjYyMGVyTR7Oqc+MH7SRyWBaYnHtvdZSPXt2+wtF/bg5D/0KBJ7iC1azxev5OoSFTYQ2qsFuXQl+3BYB+51nYeWKbAbSqzzaLksdc3Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEF1WWZOaVlyeExiQ05tMkREdThnT2tkMk9UejFtVm93NWtwcEs0TTJpMlZp?=
 =?utf-8?B?L2pPZVAxUlk5dEk1STVOdEtidnRRRDlYbmZMTzBuSitwZE1PNWVDbnpBOTdH?=
 =?utf-8?B?ZWNXZEhOODdoVVpVSzNVVHNIWC9XQmpIMUh5dlZUYWZXK2ZVZ2hPZ05BeGR0?=
 =?utf-8?B?Y0VQSkJ3UGJTeUt4OUdES09GZ2RpKzYwYnE2Z3JlNnFudWh3NGhDbXNqdlJS?=
 =?utf-8?B?dVhrNnRrMk90ZFlwdWJXT0c0NjQxMkZodkh2UEErcjl3ZmFIeGpBSnlNRGMy?=
 =?utf-8?B?d0dWcHpWMzBmTFQvVnBHWFJIWlpPdFdYQXViblNYRzQzdEtBUmxwRDg1Qm8v?=
 =?utf-8?B?M0U5ZW1YQnhCTkRqRUZSTmhTNWlwUUlvdTFZdGhkNmFpL094ajJpaUNOOUR4?=
 =?utf-8?B?bjg4Vmtuc20rSkVuclRXZDZiVUdzVHV3bmI1TmFyQkxHMkxJa2VqK0dxMHRM?=
 =?utf-8?B?N0ZDK3Iwc2hnZ3VhaWVVZUhpYkNrUEx5czRZSE1mOFc2c2tMTnRwSnZhUkt2?=
 =?utf-8?B?a0Y3bjRuOTN5Q3I0alh6dzNvN05IOWdFYkF6RDVtekMwY1BPcHB5QTFIcmhZ?=
 =?utf-8?B?Vk1jS3NoQUJqZ0xLbkpnN3FHRUtIUzRaNFJWcVBISXNhcW9MZm4zUXFFQlU0?=
 =?utf-8?B?Y3Z0MDl4ZkI5eTl3a2c4aER1enROQ09NU2ZoL1lPdVo1SS9ZN29naFB2TmFP?=
 =?utf-8?B?NDFnM0hFSG5iNjBEbjdJSUREbGJ1M2k2Qk8ya0RQMzUvMkw5LzNoREFKYnI1?=
 =?utf-8?B?MFFvMXBwZ0FZV1oyRW9WZGtQU0ZLbzNBOVdwTTdSeWhrdlVhenQ1RzBqY3pB?=
 =?utf-8?B?em9FclJwQjdUNld2ekIrelErc0VuRmgrZFBqVDhaazhpSFZ1aWs5YVRDaFYv?=
 =?utf-8?B?RkRsQnFvVloxQ1NrQnhVS1JGLzA2cmlMWVYxdXRoYjA0RjIvQmNTWjRTNy9P?=
 =?utf-8?B?YU56TGhnNjFLbFMva3Q0ZFZSb3Y4S25FVmtQd21uRTVpRWp5ajFoMGpibDlK?=
 =?utf-8?B?TjhiODVhZVY1K1lpWWVKY0Y1dURaeitBaFkwQkZ2UTlOZThLL2Q5TTQ1T2g0?=
 =?utf-8?B?YnlPOVpwWEdRMGJ6Q0E4U1Z3MXFzL21Fald6UjQ5ZGRuUk1lT09YQTUzSUNp?=
 =?utf-8?B?M2M0K0NRY3Baam9LRjI0aFJMTXBBUGQxOE5GeUo1dVdNMGFDYXU5RjFEZkMx?=
 =?utf-8?B?U3RWY3d5N1ZRcGdXRDNxZVdSRGhmWlpUVHpSY2JDK0RqWFVGQlVxd0VTYnd5?=
 =?utf-8?B?d2w5aU54c2xyby9SK0YxNU1kRjBYeHZJblJLcExGK1crYmc1alREMXNuM3Nl?=
 =?utf-8?B?SjFmQzFjZGlPZkJMNWRPQVVjcDY4S3IwTStlMDNoZmVSdjRTb1R3LzFoV1U0?=
 =?utf-8?B?cTQvMGN0V3pnam53UHBqZTFYaGpOckNzYkVrUnhKRFFuYml3WGVSRlIwck15?=
 =?utf-8?B?U2wrbHUrVE5MSi9uU2prMnB1NE11emk1dmhqdk9MNmJHM3RPVzlGNmtCUVhm?=
 =?utf-8?B?NFdUSzRsbERmQ0FwTUdIK2tRbjlMcEY1a3pHdVBHTWhKM3NuTDJycmcxSXVr?=
 =?utf-8?B?ZnYrWUQ2bWFrdDh6K2h0cGtDSGlCdkxSRWJ2N3RSVnF2NCtSMzdleUcwanky?=
 =?utf-8?B?MVFJMzFuampDeHdpU3hUUnNzc2JZdm9kZEVzZmJEM01YZDhQTkcvakgrZ25F?=
 =?utf-8?B?dzZWR0FyN1JZemQ1NEpQQ2JFMWpwUGpHUGIreUd0S2N2dEJHeHo1amZ6b0pK?=
 =?utf-8?B?ZEVYR3RFc0JqeHdtdFhzZGk2ZXd5UzVqb1ZoQUtmQ0lxNDF0Yjh5ZXRKazJr?=
 =?utf-8?B?ZktlTVo4OUtwZ0t3NEd6RGFtSTVzb1QzVFNQRVVmLy9lcmE3SE9XUkxkeXpV?=
 =?utf-8?B?R01xUXB3d2RtZ3IvK0RYWmNUeG5wOFBKb2RPVUxDdlc5K2w3SGlnVUU3WDhv?=
 =?utf-8?B?Y2FrdjE1RmN6Y3lUNmFic2JNWnVZbVEzU2xHU3hpbVhzS1BuZ1NjbnhqS0FB?=
 =?utf-8?B?NER0am5uZkJ0emIycW1PYzRCOElkRUdtdGRwcWF1dmpoakN1SWZ6VlkrS0Zi?=
 =?utf-8?B?L29EcFA0VENqTHZBZ1doNHpBL2FJNzM0TXo4aGRCSkNRYit6RDZTaFdxYkg0?=
 =?utf-8?Q?GzSjQDEKhBPk6QWDbeqZglgp4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb80f888-682c-42e9-e7f6-08dc52ed515e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 08:17:20.6808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2USrGpIkSjPK3jDn2PGj3vSBIjGzqu5fIMW7GOySIg46BMkBwdd65807MHSEtvH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7772
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.03.24 um 15:53 schrieb Alex Deucher:
> On Tue, Mar 26, 2024 at 10:01 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Tue, Mar 26, 2024 at 9:59 AM Paneer Selvam, Arunpravin
>> <arunpravin.paneerselvam@amd.com> wrote:
>>> Hi Alex,
>>>
>>> On 3/26/2024 7:08 PM, Alex Deucher wrote:
>>>> On Mon, Mar 18, 2024 at 5:47 PM Arunpravin Paneer Selvam
>>>> <Arunpravin.PaneerSelvam@amd.com> wrote:
>>>>> Add clear page support in vram memory region.
>>>>>
>>>>> v1(Christian):
>>>>>     - Dont handle clear page as TTM flag since when moving the BO back
>>>>>       in from GTT again we don't need that.
>>>>>     - Make a specialized version of amdgpu_fill_buffer() which only
>>>>>       clears the VRAM areas which are not already cleared
>>>>>     - Drop the TTM_PL_FLAG_WIPE_ON_RELEASE check in
>>>>>       amdgpu_object.c
>>>>>
>>>>> v2:
>>>>>     - Modify the function name amdgpu_ttm_* (Alex)
>>>>>     - Drop the delayed parameter (Christian)
>>>>>     - handle amdgpu_res_cleared(&cursor) just above the size
>>>>>       calculation (Christian)
>>>>>     - Use AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE for clearing the buffers
>>>>>       in the free path to properly wait for fences etc.. (Christian)
>>>>>
>>>>> v3(Christian):
>>>>>     - Remove buffer clear code in VRAM manager instead change the
>>>>>       AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE handling to set
>>>>>       the DRM_BUDDY_CLEARED flag.
>>>>>     - Remove ! from amdgpu_res_cleared(&cursor) check.
>>>>>
>>>>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>>> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 22 ++++---
>>>>>    .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 61 ++++++++++++++++++-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  6 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
>>>>>    6 files changed, 111 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>> index 8bc79924d171..c92d92b28a57 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>> @@ -39,6 +39,7 @@
>>>>>    #include "amdgpu.h"
>>>>>    #include "amdgpu_trace.h"
>>>>>    #include "amdgpu_amdkfd.h"
>>>>> +#include "amdgpu_vram_mgr.h"
>>>>>
>>>>>    /**
>>>>>     * DOC: amdgpu_object
>>>>> @@ -601,8 +602,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>>>>           if (!amdgpu_bo_support_uswc(bo->flags))
>>>>>                   bo->flags &= ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
>>>>>
>>>>> -       if (adev->ras_enabled)
>>>>> -               bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>>>>> +       bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>>>>>
>>>>>           bo->tbo.bdev = &adev->mman.bdev;
>>>>>           if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
>>>>> @@ -632,15 +632,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>>>>
>>>>>           if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
>>>>>               bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>>>>> -               struct dma_fence *fence;
>>>>> +               struct dma_fence *fence = NULL;
>>>>>
>>>>> -               r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, true);
>>>>> +               r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
>>>>>                   if (unlikely(r))
>>>>>                           goto fail_unreserve;
>>>>>
>>>>> -               dma_resv_add_fence(bo->tbo.base.resv, fence,
>>>>> -                                  DMA_RESV_USAGE_KERNEL);
>>>>> -               dma_fence_put(fence);
>>>>> +               if (fence) {
>>>>> +                       dma_resv_add_fence(bo->tbo.base.resv, fence,
>>>>> +                                          DMA_RESV_USAGE_KERNEL);
>>>>> +                       dma_fence_put(fence);
>>>>> +               }
>>>>>           }
>>>>>           if (!bp->resv)
>>>>>                   amdgpu_bo_unreserve(bo);
>>>>> @@ -1365,8 +1367,12 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>>>>>           if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
>>>>>                   return;
>>>>>
>>>>> -       r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence, true);
>>>>> +       r = amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
>>>>>           if (!WARN_ON(r)) {
>>>>> +               struct amdgpu_vram_mgr_resource *vres;
>>>>> +
>>>>> +               vres = to_amdgpu_vram_mgr_resource(bo->resource);
>>>>> +               vres->flags |= DRM_BUDDY_CLEARED;
>>>>>                   amdgpu_bo_fence(abo, fence, false);
>>>>>                   dma_fence_put(fence);
>>>>>           }
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>>>>> index 381101d2bf05..50fcd86e1033 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>>>>> @@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>>>>>           }
>>>>>    }
>>>>>
>>>>> +/**
>>>>> + * amdgpu_res_cleared - check if blocks are cleared
>>>>> + *
>>>>> + * @cur: the cursor to extract the block
>>>>> + *
>>>>> + * Check if the @cur block is cleared
>>>>> + */
>>>>> +static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
>>>>> +{
>>>>> +       struct drm_buddy_block *block;
>>>>> +
>>>>> +       switch (cur->mem_type) {
>>>>> +       case TTM_PL_VRAM:
>>>>> +               block = cur->node;
>>>>> +
>>>>> +               if (!amdgpu_vram_mgr_is_cleared(block))
>>>>> +                       return false;
>>>>> +               break;
>>>>> +       default:
>>>>> +               return false;
>>>>> +       }
>>>>> +
>>>>> +       return true;
>>>>> +}
>>>>> +
>>>>>    #endif
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>> index 8722beba494e..bcbffe909b47 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>> @@ -378,11 +378,15 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>>>>>               (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>>>>>                   struct dma_fence *wipe_fence = NULL;
>>>>>
>>>>> -               r = amdgpu_fill_buffer(abo, AMDGPU_POISON, NULL, &wipe_fence,
>>>>> -                                       false);
>>>>> +               r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
>>>>> +                                      false);
>>>>>                   if (r) {
>>>>>                           goto error;
>>>>>                   } else if (wipe_fence) {
>>>>> +                       struct amdgpu_vram_mgr_resource *vres;
>>>>> +
>>>>> +                       vres = to_amdgpu_vram_mgr_resource(bo->resource);
>>>>> +                       vres->flags |= DRM_BUDDY_CLEARED;
>>>>>                           dma_fence_put(fence);
>>>>>                           fence = wipe_fence;
>>>>>                   }
>>>>> @@ -2214,6 +2218,59 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>>>>>           return 0;
>>>>>    }
>>>>>
>>>>> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>>> +                           struct dma_resv *resv,
>>>>> +                           struct dma_fence **fence)
>>>>> +{
>>>>> +       struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>>>> +       struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>>>> +       struct amdgpu_res_cursor cursor;
>>>>> +       struct dma_fence *f = NULL;
>>>>> +       u64 addr;
>>>>> +       int r;
>>>>> +
>>>>> +       if (!adev->mman.buffer_funcs_enabled)
>>>>> +               return -EINVAL;
>>>>> +
>>>>> +       amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
>>>>> +
>>>>> +       mutex_lock(&adev->mman.gtt_window_lock);
>>>>> +       while (cursor.remaining) {
>>>>> +               struct dma_fence *next = NULL;
>>>>> +               u64 size;
>>>>> +
>>>>> +               if (amdgpu_res_cleared(&cursor)) {
>>>>> +                       amdgpu_res_next(&cursor, cursor.size);
>>>>> +                       continue;
>>>>> +               }
>>>>> +
>>>>> +               /* Never clear more than 256MiB at once to avoid timeouts */
>>>>> +               size = min(cursor.size, 256ULL << 20);
>>>>> +
>>>>> +               r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
>>>>> +                                         1, ring, false, &size, &addr);
>>>>> +               if (r)
>>>>> +                       goto err;
>>>>> +
>>>>> +               r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
>>>>> +                                       &next, true, true);
>>>>> +               if (r)
>>>>> +                       goto err;
>>>>> +
>>>>> +               dma_fence_put(f);
>>>>> +               f = next;
>>>>> +
>>>>> +               amdgpu_res_next(&cursor, size);
>>>>> +       }
>>>>> +err:
>>>>> +       mutex_unlock(&adev->mman.gtt_window_lock);
>>>>> +       if (fence)
>>>>> +               *fence = dma_fence_get(f);
>>>>> +       dma_fence_put(f);
>>>>> +
>>>>> +       return r;
>>>>> +}
>>>>> +
>>>>>    int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>>>                           uint32_t src_data,
>>>>>                           struct dma_resv *resv,
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>>> index 65ec82141a8e..b404d89d52e5 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>>> @@ -38,8 +38,6 @@
>>>>>    #define AMDGPU_GTT_MAX_TRANSFER_SIZE   512
>>>>>    #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS        2
>>>>>
>>>>> -#define AMDGPU_POISON  0xd0bed0be
>>>>> -
>>>>>    extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>>>>>    extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>>>>>
>>>>> @@ -155,6 +153,9 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>>>>                                  uint64_t size, bool tmz,
>>>>>                                  struct dma_resv *resv,
>>>>>                                  struct dma_fence **f);
>>>>> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>>> +                           struct dma_resv *resv,
>>>>> +                           struct dma_fence **fence);
>>>>>    int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>>>                           uint32_t src_data,
>>>>>                           struct dma_resv *resv,
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>>> index c0c851409241..e494f5bf136a 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>>> @@ -450,6 +450,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>>    {
>>>>>           struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>>>>>           struct amdgpu_device *adev = to_amdgpu_device(mgr);
>>>>> +       struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
>>>>>           u64 vis_usage = 0, max_bytes, min_block_size;
>>>>>           struct amdgpu_vram_mgr_resource *vres;
>>>>>           u64 size, remaining_size, lpfn, fpfn;
>>>>> @@ -501,6 +502,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>>           if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>>>>>                   vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>>>>>
>>>>> +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
>>>>> +               vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
>>>> Is there any reason to not always do this?
>>> Here we are trying to keep a pool of cleared memory which are cleared on
>>> free path and that can given
>>> to the application which requires a zeroed memory. I think here if we
>>> set always clear the memory,
>>> we would go over the limit of cleared memory in that particular instance
>>> and the application should wait until
>>> the hardware clears the memory and this might impact the overall
>>> performance.
>> I'd like to have the driver always deliver cleared memory.
> Actually, I think we can just always set the flag in the allocation IOCTLs.

We have use cases where that hurts as. Especially during boot when the 
backing VRAM isn't cleared yet.

That's one of the reasons why we never always cleared the memory.

Christian.

>
> Alex
>
>> Alex
>>
>>> Thanks,
>>> Arun.
>>>> Alex
>>>>
>>>>
>>>>> +
>>>>>           if (fpfn || lpfn != mgr->mm.size)
>>>>>                   /* Allocate blocks in desired range */
>>>>>                   vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>>>> @@ -604,7 +608,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>>>>>
>>>>>           amdgpu_vram_mgr_do_reserve(man);
>>>>>
>>>>> -       drm_buddy_free_list(mm, &vres->blocks, 0);
>>>>> +       drm_buddy_free_list(mm, &vres->blocks, vres->flags);
>>>>>           mutex_unlock(&mgr->lock);
>>>>>
>>>>>           atomic64_sub(vis_usage, &mgr->vis_usage);
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>>> index 0e04e42cf809..8478522d7366 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>>> @@ -53,6 +53,11 @@ static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>>>>>           return (u64)PAGE_SIZE << drm_buddy_block_order(block);
>>>>>    }
>>>>>
>>>>> +static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_block *block)
>>>>> +{
>>>>> +       return drm_buddy_block_is_clear(block);
>>>>> +}
>>>>> +
>>>>>    static inline struct amdgpu_vram_mgr_resource *
>>>>>    to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>>>>>    {
>>>>> --
>>>>> 2.25.1
>>>>>

