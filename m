Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F3F4BE914
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 19:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6870A10E254;
	Mon, 21 Feb 2022 18:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B090610E16D;
 Mon, 21 Feb 2022 18:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwOjwOHnuTiuSIHtYxxdrJzBr3Rhi/hO54DEFxWANux0/BuStgDteHNcHzsI2HfCzKZSTzqSJL4cTb9hsAMCAt03Crh/K4cJNXPD+1IIGpxIPh3TPpLLwpHKiwXhSYzTdt3of7DHvbFAWhBHd/YVTtZT8pHsKRxOu+l27u8qh7ttkfpgVcxVsM7+73kEAS3O62rLhaR2gMe1vBubgNjw6o0hEPilHQcFjM394OdG8TPSZxlhxYdAATV7Xx1tUCFtVt1r516eQhi6OhXpqrlFEqq5KJWeLy+WKlJg6MjhK6qXMVNgloioWJITxMvD4p1BIFyt+vmmVYiqwhkVywTatA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2exneCc4W7fgZv1vSjHaZCvMB5i9cl4Byr/DA5dtZTY=;
 b=YVRxkSqUGxD5fwufs5riqCyVQMgHSyCzVJCL9umA+XxBewF1p7ni3mvh2YYttj9HioohZn5HeuV/aAabG7jDFU1k54TP5s9ubcuKzzcDGvbA43sJx2WZ4x37N7J7WSIAeeLU9DEBXb8D4BHy9WXcJsuiUCZ2grXxR9Zrm9ZDwBrTXjALJA214T3R345NyMeZPIliZazOODTAmncELXks1CXMaflon0jDtFAAPjF/YdpKJa2yPgkXTi34VHCr+Z1MhVRDhWu57qI9ia5sIx+kxe+PvnQpzI4Zu+lJNTbjpI4plH2F3aOp3lkryharktj0dT7LttFmww+nsd/1oJe0Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2exneCc4W7fgZv1vSjHaZCvMB5i9cl4Byr/DA5dtZTY=;
 b=dtnJsvApuUqAOsC05CtlMr+ht7m+uxSGwa4M1DDQJObsbLY0McWKtW1xSsjmOzdGCAVi7AtEGBhEAREHjOP6rV00BxyFgkexVU//oP0NYbJ2qV9N20YKKZCdTfxtxZ8UK4lCnU3gOOU+pxv+PEquEp/XHWo/Oc/rzn+3bQD5W9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Mon, 21 Feb
 2022 18:06:34 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::88a:bf7a:6898:5ba9]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::88a:bf7a:6898:5ba9%5]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 18:06:34 +0000
Message-ID: <fc7745a2-1e45-f366-a490-649adaac5ade@amd.com>
Date: Mon, 21 Feb 2022 23:47:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v12 1/5] drm: improve drm_buddy_alloc function
Content-Language: en-US
From: Arunpravin <arunpravin.paneerselvam@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20220213085217.2705-1-Arunpravin.PaneerSelvam@amd.com>
 <32487d00-8ee2-b54e-cf5d-3b241ff19a5b@gmail.com>
 <CAM0jSHNAPYjX8cD48195fkM4CoLjMFu5P0i5g2anS3-YGzf2cg@mail.gmail.com>
 <b46a3c25-1f1d-2a76-53eb-c77f0b6eb31a@gmail.com>
 <aff37ec0-d13c-54fd-3f06-03953f7622bf@amd.com>
In-Reply-To: <aff37ec0-d13c-54fd-3f06-03953f7622bf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::13) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5e7fc23-a23f-48b2-b7f8-08d9f564e4c9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4048:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4048EEF69DADB8AB42349325E43A9@MN2PR12MB4048.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 65eHkHCf20umsu+rXecXcEV+LYWU7psRGMDYgv3kHybjnccGfNzYTqRQyxQvYFqg6ksXEAMCooJAp/i6gWUKy5Re4E9q7OyavVFAR+nIR1s3v8FCk7m8i6pLMpXn6IXxOrVkNtMeSIHRnFgmrqM3FDP9R9hO3PNs4G9d4dwAPOiUPR68zgka+AU4lcTi24PLqd+MT7YR+MJB54gAHF1eX+hfRrwTwtKi78mHRcaoMHx5vDgPX0ja8mcFQ1Wv6n1alMaFq92uXfc1QA52c6Wk2bD74O3RbBjAXFKbzoXlu1nkZ1/zezfX8cZfwL7WE+qTYcavpCGqgopasPUd7qjsD/tfyE9dWWqheR+H5AhvKoFMZOHw8vnBDVkbI1nnlURpoDjZpdf2q9KnrzG1yr7wZ0Qa6q/oqRdU2JwJRMZLD8TdJKQY0inKZHVh3N6sVFH5up61ddyUCXKvOLPUAM3XglKcofTRRZq5YlvyGlXhwLme0my9C3rTP4oGEH5O4FwV4Gb8rjZfVoPRDDUzf/sTXlIGNGhZi2vh5X6A6JWo5YVPqi/Ap0wExOSlwmvKKFnZoPxZ/mFI8cRkNjnp97AEUp4gc8HCtYce3Jm5CrgvS3mqpByVK+BSdtQC14iIw426DG6+JYYlEWQZV/2uFETak/wtkCOIZBt0c2DFl5EbVh8ORp3vwDtxHkIhuN+EVPB7A4ND6daeauds1za6NqJLFSagwOr1adEJ3qobTyymEkE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(53546011)(6666004)(6512007)(6506007)(508600001)(45080400002)(5660300002)(8936002)(38100700002)(30864003)(2906002)(31686004)(6486002)(186003)(31696002)(4326008)(8676002)(966005)(110136005)(54906003)(2616005)(83380400001)(66946007)(86362001)(316002)(66556008)(66476007)(66574015)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2pac1hqeC8wV202T3dVM1pLQWczMEhXNWZNM0JaTG1XOG9iLzh2TzA3RWt0?=
 =?utf-8?B?UU9GSG11dCs3aWNjeHhuamZxQUFlSG1GM1lMNE8xNzdDM2xwNzdEdVRJTGdF?=
 =?utf-8?B?cXY0N0IvUUhKWE1nanZDd0FvWVM1SThoTTRaNmIwcmYwOXMreGh4SkM3MzZO?=
 =?utf-8?B?a2dLNDBlTXFHbG1OdERBVktERkhzcnJKelo2K0YwNDVtU2svaVVzMndjUUF6?=
 =?utf-8?B?NjFJTEMzYmhhdnRsWWl2cmtZOXFTWHRYRmRIa0R6Ri9pQUNZWk80WHJIMWhB?=
 =?utf-8?B?N3NEUWpGS3hqNytaNTUxMUUveGhZeVIwUXZ2R2x3VERLUzIxellyZThtTUla?=
 =?utf-8?B?bk40WkJqclRZK2k5dTFJaTB1dC9xY2I4MG1VUFFKVnZkMjY0Q04xcCtCeEY3?=
 =?utf-8?B?VW84OGVHbzlCOTZGWkt1a2E3aDhmVFVuYmRZaHd5QzY3aFltS21vcXRUMzhG?=
 =?utf-8?B?emhldGY4MU4zYjFkNXQ4Y05LN0IzVDFsUDlXalU5cE9Oc1dZNEtaSW14ekZF?=
 =?utf-8?B?Q0RUSFJrL3dQRjNkS2NJaVA5RDZOVGpBYWlMLytWVk9jUXlqWDBMdG4zZVhq?=
 =?utf-8?B?Tkl6SWpDbVF5clBWRmduazhHR0hoRTVNMHd6OWNpYTNXdllVeG11K25EUUl5?=
 =?utf-8?B?cVFyaEF2bnU4OHNLQkREbmxVaUw4TWo3K3Q0WXQ2Q2h6UlFwZ21lYVFtbUNG?=
 =?utf-8?B?UEhRc0QwQmc5elRZajNwY1lvSGVEa0JucTR3YU0wdFltYi9WbTQ5Rm9wRVdE?=
 =?utf-8?B?aFYrbDlhQ1VWaUp1WElvTUhYdHlxVE5HcXE5SXNpdHppUHJKUmRJRGN4T1g3?=
 =?utf-8?B?SklGT1hnc1lQWGVya0VKZTYyVnZjSnMrd2VFMnBpdE5HL3RLUkd6SVpwU2Ns?=
 =?utf-8?B?VGhpeUQ4RW5kQjdEK3Q2RWt2WUhxMElaQVJXTkhEbGY4WVNmTnFkVVNJemFV?=
 =?utf-8?B?UGxRT2RMM3pCTGVoT1lJQTNBWUxHUWg1VldHaFVoYTQ4ZFlHczJqL3RPSGVY?=
 =?utf-8?B?K29zRjVOUGNQcjVsZWJvOUlEcUN5OFhhdS9CU3p2NWhJaDRaWHB1Zkpha2lE?=
 =?utf-8?B?ZStKa3c0eUpaWmhSZC94czBxU2pKaFJlV1ZWa013S3kyUXJ0RUt1bXdvaEZ6?=
 =?utf-8?B?N0YybENTdGxNWDljNzRqV3pMV2xkdngrNTkxckowbzhnM28yeXhQYXd2SXNL?=
 =?utf-8?B?YzJaZFdRNnBFb1hxdzR0dnRyeEF5ek9kKzVCb244alJ6NDIzTHZJeDVLNmlO?=
 =?utf-8?B?V3VRY3RLSSt0RzdKK20vRGo2UzQ3SzZSaDRIcnZiaHRMZGNlSDhrdDd5M2Zq?=
 =?utf-8?B?VkdvclNpR1RvNGFQSWVEdm52MTZ6ZnM1UUxGK1l2a2ZjNGI2eEFLblROLzNx?=
 =?utf-8?B?RmViMlBMWmlmTGNLL200NmJkUmo2aTh6NzJsVkgzWkNtNW1UaHgzb2JLLzlO?=
 =?utf-8?B?OEE1YzBOdlNoamt2UXV0RW5ITkJSNHBBWVA1eVB0Q0FEVkFoU0JBMitOdmIy?=
 =?utf-8?B?MENySG9GOXFhMGxUNmtVYjFnZjlkTGx2TFMvUEhLZ21XNE0zVk9xamxCVkow?=
 =?utf-8?B?WVFtZFRhZEJJa1Q2OW4reFpwaldmcVhzQVZCVm4zTzVwSVkwU2krOE9tOWJK?=
 =?utf-8?B?ajNVMGkvWEhzb2hyNmJHbDRhbFpaR2ttS3VYZkxjYnR0Y0Q5amtBc28vZTlx?=
 =?utf-8?B?dDJhL3paMHJUU0VFOGQ1K3FUTkp1QVRqV3FQOXBrMFlIbWtaZitvYVFIV1Ft?=
 =?utf-8?B?ajV6RTBiTmxRSTVRdEJVWm9LQ1VJTkhGMVZNK29kREM4NmdzNnlqNnVCS0tH?=
 =?utf-8?B?aGhuU2pxVWJXZEtxdG9aTG9JTUxicEtUWE91Q0xvbDJYTXJrNWRkLzlHbC9h?=
 =?utf-8?B?K2RPYlQ1OU5RVG9YUW5PVlUyNnpadnY2TU4xcEoyTm5RbVRjRVdKWjQ2bG5W?=
 =?utf-8?B?NnJLQnFiVmhXSXVhcFFQMDhPY0RZY3hrS0kzN1JOd2grUXIxN0w0UkZ2Vm9T?=
 =?utf-8?B?OHlEbS9MTm1WdzlINmhCNXJBTVlxYnRpeFVFV2VtSW5vNDdXcEhPTGRvMTZv?=
 =?utf-8?B?Y0hWNDNxUTBEK1BwdjRlaG44cVBsSm9yNTZPWHRDUk8veXgxUjQ5a1drY01m?=
 =?utf-8?B?eEJLLzgwaEl4QlBTK21MQ3JiTmdHcjFLaWJQOHkvbW9vdkk0OC9TZnhwdzJn?=
 =?utf-8?Q?fYDX4sx8AwEonwgiHkYlnEI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e7fc23-a23f-48b2-b7f8-08d9f564e4c9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 18:06:33.9062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItjoUAWyR9tCxsTTf6t/wVHH2SCEcfqW/xgSOl+S0e+mM3BHv4pnU4vnNN3rK8VidXwmlWH+n+jSBmJ9dH6zYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, tzimmermann@suse.de,
 alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16/02/22 1:37 pm, Arunpravin wrote:
> 
> 
> On 14/02/22 2:42 pm, Christian König wrote:
>>
>>
>> Am 14.02.22 um 09:36 schrieb Matthew Auld:
>>> On Mon, 14 Feb 2022 at 06:32, Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> Am 13.02.22 um 09:52 schrieb Arunpravin:
>>>>> - Make drm_buddy_alloc a single function to handle
>>>>>     range allocation and non-range allocation demands
>>>>>
>>>>> - Implemented a new function alloc_range() which allocates
>>>>>     the requested power-of-two block comply with range limitations
>>>>>
>>>>> - Moved order computation and memory alignment logic from
>>>>>     i915 driver to drm buddy
>>>>>
>>>>> v2:
>>>>>     merged below changes to keep the build unbroken
>>>>>      - drm_buddy_alloc_range() becomes obsolete and may be removed
>>>>>      - enable ttm range allocation (fpfn / lpfn) support in i915 driver
>>>>>      - apply enhanced drm_buddy_alloc() function to i915 driver
>>>>>
>>>>> v3(Matthew Auld):
>>>>>     - Fix alignment issues and remove unnecessary list_empty check
>>>>>     - add more validation checks for input arguments
>>>>>     - make alloc_range() block allocations as bottom-up
>>>>>     - optimize order computation logic
>>>>>     - replace uint64_t with u64, which is preferred in the kernel
>>>>>
>>>>> v4(Matthew Auld):
>>>>>     - keep drm_buddy_alloc_range() function implementation for generic
>>>>>       actual range allocations
>>>>>     - keep alloc_range() implementation for end bias allocations
>>>>>
>>>>> v5(Matthew Auld):
>>>>>     - modify drm_buddy_alloc() passing argument place->lpfn to lpfn
>>>>>       as place->lpfn will currently always be zero for i915
>>>>>
>>>>> v6(Matthew Auld):
>>>>>     - fixup potential uaf - If we are unlucky and can't allocate
>>>>>       enough memory when splitting blocks, where we temporarily
>>>>>       end up with the given block and its buddy on the respective
>>>>>       free list, then we need to ensure we delete both blocks,
>>>>>       and no just the buddy, before potentially freeing them
>>>>>
>>>>>     - fix warnings reported by kernel test robot <lkp@intel.com>
>>>>>
>>>>> v7(Matthew Auld):
>>>>>     - revert fixup potential uaf
>>>>>     - keep __alloc_range() add node to the list logic same as
>>>>>       drm_buddy_alloc_blocks() by having a temporary list variable
>>>>>     - at drm_buddy_alloc_blocks() keep i915 range_overflows macro
>>>>>       and add a new check for end variable
>>>>>
>>>>> v8:
>>>>>     - fix warnings reported by kernel test robot <lkp@intel.com>
>>>>>
>>>>> v9(Matthew Auld):
>>>>>     - remove DRM_BUDDY_RANGE_ALLOCATION flag
>>>>>     - remove unnecessary function description
>>>>>
>>>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>> As long as nobody objects I'm going to push patches 1-3 to drm-misc-next
>>>> in the next hour or so:
>>> As part of this could you also push
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F99842%2F&amp;data=04%7C01%7CArunpravin.PaneerSelvam%40amd.com%7Cc50a2b13b2a0425e596f08d9ef9a2d60%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637804268194961068%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=ENxu%2BSquLubBYLkNYV1SIUau1u7aZMdjz22izvv3FvM%3D&amp;reserved=0 ?
>>
>> Sure, but Arun said in our internal chat that I should wait with that 
>> anyway since he wanted to sort out one more issue.
>>
>> Christian.
>>
> 
> working on 2 issues,
> 1. I think we need to keep DRM_BUDDY_RANGE_ALLOCATION flag, some corner
> case didnt allow amdgpu driver load
> 
> 2. rebasing the existing amdgpu_vram_mgr.c and resolving all conflicts
> as there are many changes merged in with the below patch
> - drm/amdgpu: remove VRAM accounting v2

Hi Christian,
I sent the v13 patches, selftest cases are passed.

Thanks,
Arun
>>>
>>>> Then going to take a deeper look into patches 4 and 5 to get them reviewed.
>>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>>> ---
>>>>>    drivers/gpu/drm/drm_buddy.c                   | 292 +++++++++++++-----
>>>>>    drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  63 ++--
>>>>>    drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
>>>>>    include/drm/drm_buddy.h                       |  11 +-
>>>>>    4 files changed, 250 insertions(+), 118 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>>> index d60878bc9c20..e0c0d786a572 100644
>>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>>> @@ -282,23 +282,97 @@ void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects)
>>>>>    }
>>>>>    EXPORT_SYMBOL(drm_buddy_free_list);
>>>>>
>>>>> -/**
>>>>> - * drm_buddy_alloc_blocks - allocate power-of-two blocks
>>>>> - *
>>>>> - * @mm: DRM buddy manager to allocate from
>>>>> - * @order: size of the allocation
>>>>> - *
>>>>> - * The order value here translates to:
>>>>> - *
>>>>> - * 0 = 2^0 * mm->chunk_size
>>>>> - * 1 = 2^1 * mm->chunk_size
>>>>> - * 2 = 2^2 * mm->chunk_size
>>>>> - *
>>>>> - * Returns:
>>>>> - * allocated ptr to the &drm_buddy_block on success
>>>>> - */
>>>>> -struct drm_buddy_block *
>>>>> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
>>>>> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>>>>> +{
>>>>> +     return s1 <= e2 && e1 >= s2;
>>>>> +}
>>>>> +
>>>>> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>>>>> +{
>>>>> +     return s1 <= s2 && e1 >= e2;
>>>>> +}
>>>>> +
>>>>> +static struct drm_buddy_block *
>>>>> +alloc_range_bias(struct drm_buddy *mm,
>>>>> +              u64 start, u64 end,
>>>>> +              unsigned int order)
>>>>> +{
>>>>> +     struct drm_buddy_block *block;
>>>>> +     struct drm_buddy_block *buddy;
>>>>> +     LIST_HEAD(dfs);
>>>>> +     int err;
>>>>> +     int i;
>>>>> +
>>>>> +     end = end - 1;
>>>>> +
>>>>> +     for (i = 0; i < mm->n_roots; ++i)
>>>>> +             list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>>>> +
>>>>> +     do {
>>>>> +             u64 block_start;
>>>>> +             u64 block_end;
>>>>> +
>>>>> +             block = list_first_entry_or_null(&dfs,
>>>>> +                                              struct drm_buddy_block,
>>>>> +                                              tmp_link);
>>>>> +             if (!block)
>>>>> +                     break;
>>>>> +
>>>>> +             list_del(&block->tmp_link);
>>>>> +
>>>>> +             if (drm_buddy_block_order(block) < order)
>>>>> +                     continue;
>>>>> +
>>>>> +             block_start = drm_buddy_block_offset(block);
>>>>> +             block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>>>>> +
>>>>> +             if (!overlaps(start, end, block_start, block_end))
>>>>> +                     continue;
>>>>> +
>>>>> +             if (drm_buddy_block_is_allocated(block))
>>>>> +                     continue;
>>>>> +
>>>>> +             if (contains(start, end, block_start, block_end) &&
>>>>> +                 order == drm_buddy_block_order(block)) {
>>>>> +                     /*
>>>>> +                      * Find the free block within the range.
>>>>> +                      */
>>>>> +                     if (drm_buddy_block_is_free(block))
>>>>> +                             return block;
>>>>> +
>>>>> +                     continue;
>>>>> +             }
>>>>> +
>>>>> +             if (!drm_buddy_block_is_split(block)) {
>>>>> +                     err = split_block(mm, block);
>>>>> +                     if (unlikely(err))
>>>>> +                             goto err_undo;
>>>>> +             }
>>>>> +
>>>>> +             list_add(&block->right->tmp_link, &dfs);
>>>>> +             list_add(&block->left->tmp_link, &dfs);
>>>>> +     } while (1);
>>>>> +
>>>>> +     return ERR_PTR(-ENOSPC);
>>>>> +
>>>>> +err_undo:
>>>>> +     /*
>>>>> +      * We really don't want to leave around a bunch of split blocks, since
>>>>> +      * bigger is better, so make sure we merge everything back before we
>>>>> +      * free the allocated blocks.
>>>>> +      */
>>>>> +     buddy = get_buddy(block);
>>>>> +     if (buddy &&
>>>>> +         (drm_buddy_block_is_free(block) &&
>>>>> +          drm_buddy_block_is_free(buddy)))
>>>>> +             __drm_buddy_free(mm, block);
>>>>> +     return ERR_PTR(err);
>>>>> +}
>>>>> +
>>>>> +static struct drm_buddy_block *
>>>>> +alloc_from_freelist(struct drm_buddy *mm,
>>>>> +                 unsigned int order,
>>>>> +                 unsigned long flags)
>>>>>    {
>>>>>        struct drm_buddy_block *block = NULL;
>>>>>        unsigned int i;
>>>>> @@ -320,78 +394,29 @@ drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
>>>>>        while (i != order) {
>>>>>                err = split_block(mm, block);
>>>>>                if (unlikely(err))
>>>>> -                     goto out_free;
>>>>> +                     goto err_undo;
>>>>>
>>>>> -             /* Go low */
>>>>> -             block = block->left;
>>>>> +             block = block->right;
>>>>>                i--;
>>>>>        }
>>>>> -
>>>>> -     mark_allocated(block);
>>>>> -     mm->avail -= drm_buddy_block_size(mm, block);
>>>>> -     kmemleak_update_trace(block);
>>>>>        return block;
>>>>>
>>>>> -out_free:
>>>>> +err_undo:
>>>>>        if (i != order)
>>>>>                __drm_buddy_free(mm, block);
>>>>>        return ERR_PTR(err);
>>>>>    }
>>>>> -EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>>>>> -
>>>>> -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>>>>> -{
>>>>> -     return s1 <= e2 && e1 >= s2;
>>>>> -}
>>>>> -
>>>>> -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>>>>> -{
>>>>> -     return s1 <= s2 && e1 >= e2;
>>>>> -}
>>>>>
>>>>> -/**
>>>>> - * drm_buddy_alloc_range - allocate range
>>>>> - *
>>>>> - * @mm: DRM buddy manager to allocate from
>>>>> - * @blocks: output list head to add allocated blocks
>>>>> - * @start: start of the allowed range for this block
>>>>> - * @size: size of the allocation
>>>>> - *
>>>>> - * Intended for pre-allocating portions of the address space, for example to
>>>>> - * reserve a block for the initial framebuffer or similar, hence the expectation
>>>>> - * here is that drm_buddy_alloc_blocks() is still the main vehicle for
>>>>> - * allocations, so if that's not the case then the drm_mm range allocator is
>>>>> - * probably a much better fit, and so you should probably go use that instead.
>>>>> - *
>>>>> - * Note that it's safe to chain together multiple alloc_ranges
>>>>> - * with the same blocks list
>>>>> - *
>>>>> - * Returns:
>>>>> - * 0 on success, error code on failure.
>>>>> - */
>>>>> -int drm_buddy_alloc_range(struct drm_buddy *mm,
>>>>> -                       struct list_head *blocks,
>>>>> -                       u64 start, u64 size)
>>>>> +static int __alloc_range(struct drm_buddy *mm,
>>>>> +                      struct list_head *dfs,
>>>>> +                      u64 start, u64 size,
>>>>> +                      struct list_head *blocks)
>>>>>    {
>>>>>        struct drm_buddy_block *block;
>>>>>        struct drm_buddy_block *buddy;
>>>>>        LIST_HEAD(allocated);
>>>>> -     LIST_HEAD(dfs);
>>>>>        u64 end;
>>>>>        int err;
>>>>> -     int i;
>>>>> -
>>>>> -     if (size < mm->chunk_size)
>>>>> -             return -EINVAL;
>>>>> -
>>>>> -     if (!IS_ALIGNED(size | start, mm->chunk_size))
>>>>> -             return -EINVAL;
>>>>> -
>>>>> -     if (range_overflows(start, size, mm->size))
>>>>> -             return -EINVAL;
>>>>> -
>>>>> -     for (i = 0; i < mm->n_roots; ++i)
>>>>> -             list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>>>>
>>>>>        end = start + size - 1;
>>>>>
>>>>> @@ -399,7 +424,7 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>>>>>                u64 block_start;
>>>>>                u64 block_end;
>>>>>
>>>>> -             block = list_first_entry_or_null(&dfs,
>>>>> +             block = list_first_entry_or_null(dfs,
>>>>>                                                 struct drm_buddy_block,
>>>>>                                                 tmp_link);
>>>>>                if (!block)
>>>>> @@ -436,8 +461,8 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>>>>>                                goto err_undo;
>>>>>                }
>>>>>
>>>>> -             list_add(&block->right->tmp_link, &dfs);
>>>>> -             list_add(&block->left->tmp_link, &dfs);
>>>>> +             list_add(&block->right->tmp_link, dfs);
>>>>> +             list_add(&block->left->tmp_link, dfs);
>>>>>        } while (1);
>>>>>
>>>>>        list_splice_tail(&allocated, blocks);
>>>>> @@ -459,7 +484,120 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>>>>>        drm_buddy_free_list(mm, &allocated);
>>>>>        return err;
>>>>>    }
>>>>> -EXPORT_SYMBOL(drm_buddy_alloc_range);
>>>>> +
>>>>> +static int __drm_buddy_alloc_range(struct drm_buddy *mm,
>>>>> +                                u64 start,
>>>>> +                                u64 size,
>>>>> +                                struct list_head *blocks)
>>>>> +{
>>>>> +     LIST_HEAD(dfs);
>>>>> +     int i;
>>>>> +
>>>>> +     for (i = 0; i < mm->n_roots; ++i)
>>>>> +             list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>>>> +
>>>>> +     return __alloc_range(mm, &dfs, start, size, blocks);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * drm_buddy_alloc_blocks - allocate power-of-two blocks
>>>>> + *
>>>>> + * @mm: DRM buddy manager to allocate from
>>>>> + * @start: start of the allowed range for this block
>>>>> + * @end: end of the allowed range for this block
>>>>> + * @size: size of the allocation
>>>>> + * @min_page_size: alignment of the allocation
>>>>> + * @blocks: output list head to add allocated blocks
>>>>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>>>>> + *
>>>>> + * alloc_range_bias() called on range limitations, which traverses
>>>>> + * the tree and returns the desired block.
>>>>> + *
>>>>> + * alloc_from_freelist() called when *no* range restrictions
>>>>> + * are enforced, which picks the block from the freelist.
>>>>> + *
>>>>> + * Returns:
>>>>> + * 0 on success, error code on failure.
>>>>> + */
>>>>> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>> +                        u64 start, u64 end, u64 size,
>>>>> +                        u64 min_page_size,
>>>>> +                        struct list_head *blocks,
>>>>> +                        unsigned long flags)
>>>>> +{
>>>>> +     struct drm_buddy_block *block = NULL;
>>>>> +     unsigned int min_order, order;
>>>>> +     unsigned long pages;
>>>>> +     LIST_HEAD(allocated);
>>>>> +     int err;
>>>>> +
>>>>> +     if (size < mm->chunk_size)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     if (min_page_size < mm->chunk_size)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     if (!is_power_of_2(min_page_size))
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     if (!IS_ALIGNED(start | end | size, mm->chunk_size))
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     if (end > mm->size)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     if (range_overflows(start, size, mm->size))
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     /* Actual range allocation */
>>>>> +     if (start + size == end)
>>>>> +             return __drm_buddy_alloc_range(mm, start, size, blocks);
>>>>> +
>>>>> +     pages = size >> ilog2(mm->chunk_size);
>>>>> +     order = fls(pages) - 1;
>>>>> +     min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>>>> +
>>>>> +     do {
>>>>> +             order = min(order, (unsigned int)fls(pages) - 1);
>>>>> +             BUG_ON(order > mm->max_order);
>>>>> +             BUG_ON(order < min_order);
>>>>> +
>>>>> +             do {
>>>>> +                     if (start || end != size)
>>>>> +                             /* Allocate traversing within the range */
>>>>> +                             block = alloc_range_bias(mm, start, end, order);
>>>>> +                     else
>>>>> +                             /* Allocate from freelist */
>>>>> +                             block = alloc_from_freelist(mm, order, flags);
>>>>> +
>>>>> +                     if (!IS_ERR(block))
>>>>> +                             break;
>>>>> +
>>>>> +                     if (order-- == min_order) {
>>>>> +                             err = -ENOSPC;
>>>>> +                             goto err_free;
>>>>> +                     }
>>>>> +             } while (1);
>>>>> +
>>>>> +             mark_allocated(block);
>>>>> +             mm->avail -= drm_buddy_block_size(mm, block);
>>>>> +             kmemleak_update_trace(block);
>>>>> +             list_add_tail(&block->link, &allocated);
>>>>> +
>>>>> +             pages -= BIT(order);
>>>>> +
>>>>> +             if (!pages)
>>>>> +                     break;
>>>>> +     } while (1);
>>>>> +
>>>>> +     list_splice_tail(&allocated, blocks);
>>>>> +     return 0;
>>>>> +
>>>>> +err_free:
>>>>> +     drm_buddy_free_list(mm, &allocated);
>>>>> +     return err;
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>>>>>
>>>>>    /**
>>>>>     * drm_buddy_block_print - print block information
>>>>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>>>> index 247714bab044..7aef6ad9fe84 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>>>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>>>> @@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>>>>        struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>>>>        struct i915_ttm_buddy_resource *bman_res;
>>>>>        struct drm_buddy *mm = &bman->mm;
>>>>> -     unsigned long n_pages;
>>>>> -     unsigned int min_order;
>>>>> +     unsigned long n_pages, lpfn;
>>>>>        u64 min_page_size;
>>>>>        u64 size;
>>>>>        int err;
>>>>>
>>>>> -     GEM_BUG_ON(place->fpfn || place->lpfn);
>>>>> +     lpfn = place->lpfn;
>>>>> +     if (!lpfn)
>>>>> +             lpfn = man->size;
>>>>>
>>>>>        bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
>>>>>        if (!bman_res)
>>>>> @@ -60,10 +61,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>>>>                min_page_size = bo->page_alignment << PAGE_SHIFT;
>>>>>
>>>>>        GEM_BUG_ON(min_page_size < mm->chunk_size);
>>>>> -     min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>>>> +
>>>>>        if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>>> +             unsigned long pages;
>>>>> +
>>>>>                size = roundup_pow_of_two(size);
>>>>> -             min_order = ilog2(size) - ilog2(mm->chunk_size);
>>>>> +             min_page_size = size;
>>>>> +
>>>>> +             pages = size >> ilog2(mm->chunk_size);
>>>>> +             if (pages > lpfn)
>>>>> +                     lpfn = pages;
>>>>>        }
>>>>>
>>>>>        if (size > mm->size) {
>>>>> @@ -73,34 +80,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>>>>
>>>>>        n_pages = size >> ilog2(mm->chunk_size);
>>>>>
>>>>> -     do {
>>>>> -             struct drm_buddy_block *block;
>>>>> -             unsigned int order;
>>>>> -
>>>>> -             order = fls(n_pages) - 1;
>>>>> -             GEM_BUG_ON(order > mm->max_order);
>>>>> -             GEM_BUG_ON(order < min_order);
>>>>> -
>>>>> -             do {
>>>>> -                     mutex_lock(&bman->lock);
>>>>> -                     block = drm_buddy_alloc_blocks(mm, order);
>>>>> -                     mutex_unlock(&bman->lock);
>>>>> -                     if (!IS_ERR(block))
>>>>> -                             break;
>>>>> -
>>>>> -                     if (order-- == min_order) {
>>>>> -                             err = -ENOSPC;
>>>>> -                             goto err_free_blocks;
>>>>> -                     }
>>>>> -             } while (1);
>>>>> -
>>>>> -             n_pages -= BIT(order);
>>>>> -
>>>>> -             list_add_tail(&block->link, &bman_res->blocks);
>>>>> -
>>>>> -             if (!n_pages)
>>>>> -                     break;
>>>>> -     } while (1);
>>>>> +     mutex_lock(&bman->lock);
>>>>> +     err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>>>>> +                                  (u64)lpfn << PAGE_SHIFT,
>>>>> +                                  (u64)n_pages << PAGE_SHIFT,
>>>>> +                                  min_page_size,
>>>>> +                                  &bman_res->blocks,
>>>>> +                                  bman_res->flags);
>>>>> +     mutex_unlock(&bman->lock);
>>>>> +     if (unlikely(err))
>>>>> +             goto err_free_blocks;
>>>>>
>>>>>        *res = &bman_res->base;
>>>>>        return 0;
>>>>> @@ -268,12 +257,16 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>>>>>    {
>>>>>        struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>>>>        struct drm_buddy *mm = &bman->mm;
>>>>> +     unsigned long flags = 0;
>>>>>        int ret;
>>>>>
>>>>>        mutex_lock(&bman->lock);
>>>>> -     ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
>>>>> +     ret = drm_buddy_alloc_blocks(mm, start,
>>>>> +                                  start + size,
>>>>> +                                  size, mm->chunk_size,
>>>>> +                                  &bman->reserved,
>>>>> +                                  flags);
>>>>>        mutex_unlock(&bman->lock);
>>>>>
>>>>>        return ret;
>>>>>    }
>>>>> -
>>>>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>>>>> index 312077941411..72c90b432e87 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>>>>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>>>>> @@ -20,6 +20,7 @@ struct drm_buddy;
>>>>>     *
>>>>>     * @base: struct ttm_resource base class we extend
>>>>>     * @blocks: the list of struct i915_buddy_block for this resource/allocation
>>>>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>>>>>     * @mm: the struct i915_buddy_mm for this resource
>>>>>     *
>>>>>     * Extends the struct ttm_resource to manage an address space allocation with
>>>>> @@ -28,6 +29,7 @@ struct drm_buddy;
>>>>>    struct i915_ttm_buddy_resource {
>>>>>        struct ttm_resource base;
>>>>>        struct list_head blocks;
>>>>> +     unsigned long flags;
>>>>>        struct drm_buddy *mm;
>>>>>    };
>>>>>
>>>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>>> index f524db152413..1f2435426c69 100644
>>>>> --- a/include/drm/drm_buddy.h
>>>>> +++ b/include/drm/drm_buddy.h
>>>>> @@ -131,12 +131,11 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
>>>>>
>>>>>    void drm_buddy_fini(struct drm_buddy *mm);
>>>>>
>>>>> -struct drm_buddy_block *
>>>>> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order);
>>>>> -
>>>>> -int drm_buddy_alloc_range(struct drm_buddy *mm,
>>>>> -                       struct list_head *blocks,
>>>>> -                       u64 start, u64 size);
>>>>> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>> +                        u64 start, u64 end, u64 size,
>>>>> +                        u64 min_page_size,
>>>>> +                        struct list_head *blocks,
>>>>> +                        unsigned long flags);
>>>>>
>>>>>    void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>>>>>
>>
