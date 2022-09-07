Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8465AFCBD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 08:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8130010E370;
	Wed,  7 Sep 2022 06:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A1010E36D;
 Wed,  7 Sep 2022 06:45:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3eCcm4PQgx20XjHJoUDbPfQJEcSFpex0t+UUeo/OU3E131JXhB6i7cJzv/RBbFlRdSe0lWGZQasSxp/HTZQsRdriid2gc17ZhEVPYJz4mYJXI3hBWb1pmLJDBNl9LzeyoFLvVDdNHuEG0YW6RiN0SZOTIgaQ2qUbzxLCR5AYjGS/ndbNk+3KskRvpLumnZADuzNXN6b32+vSzfeigBDSpj8fXsJWGWHC/NrBCVlzhHXnkIYFhZkkG7Oj0p9Tr4ZuH2C2jmYIe2Kog98l/addB57C57aJTPDHf5l07kxpbG/WvcrrjljUmBNAjeU9QYltHAIrT88fYzbvjDPlYKsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MpQ+3joN/H9zub1tRjCHelQYbR+g3eByrUigf27gVs=;
 b=jTM2vyWZn5FoSPzeMjLh/2v9fOROAamrg+5jJS/xPOeBQeuPbeWzs6Ac6IimxMIaSsjFGViQ9LCTIr5p5kGvcgQe0bqK2er3XZ4LwvqlkHirW9eKPKJzsFKeMtisB1kDjxQ3JkiveEFUKzVBYP03fCjYfRJjdwqodbutoNTHM/TNKK2B59+Vvqh1m9JYqJyovvjwWgas14GpMTX6xrKU1rOt3fQo3rhF+pW9Ke3dzg6f0bzj8C+XY5ITa2rI0VW35q2wQls6ehMxO5kJHhbZX1Zs0Y5d15yuFvCHChWNXF5QQUEoEUeK2h6sdMm84ePERn8lg7GyGqrTLJ3MYnLiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MpQ+3joN/H9zub1tRjCHelQYbR+g3eByrUigf27gVs=;
 b=sdNRr8Cg0Jq4Ep0/QUAfjBDuj/9xToQyR55ROfGK4n6dDWUTgY1oQ+rhtumJgpT2dKh/xREO8YpQRnG1G0OkA8F+FvfL5R5PyNNHem/tLyOlo5A5OGG1GP47ejIY1zdKGx63CKj9QEgCyhmBJfEkMyA2HTdYhAn0+FymKHYCNrc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 06:45:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.012; Wed, 7 Sep 2022
 06:45:27 +0000
Message-ID: <6988c6c3-892f-799b-0114-c2c8462c7ace@amd.com>
Date: Wed, 7 Sep 2022 08:45:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 1/6] drm/ttm: Add new callbacks to ttm res mgr
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
References: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
 <b6ade0fe-367a-21f3-1942-a9d7eefcf1d3@amd.com>
 <b0b4f3a0-0df5-8d2a-c1a0-ad6d721e9cba@amd.com>
 <YxemSP4IrQQtmHps@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YxemSP4IrQQtmHps@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0061.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: a7cc5088-ca83-4f3f-5435-08da909c8cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e2UVpu/73YBsJyegEn2XAu3ZaYAbTZZ35wQR40adNZMZ6SWkBgpnzFO6D4unlLGjWORGc1x09VWmitUYkdixUD1kHaNG3hhu4A/ljyazpkEPgaG6tlrS2mwnRZpNrrkV4KViP0vxdgoNDwdoruI3qsLHpgswD+/NKuir8cybyQ97Rg9wb7iBH/JsYeLAySLh02LhzcwwQiq5aX6zMXoqYaJbiXugBiYZi0b6gdYLZno2Rq1XFS2eRUyLwKi1WE/mjvah1sP0bIK+4XvimMioFyLnM74XiIAfl0gf1UbMCf/ZDufmc+ZH0CmqZLW1Ml8QKG3eCgl7o1yeIfNXHkeP/cy/Dm2mJo7mvB/1GQsXK0PI/hDggJJ2NFNdU1AkgP3HiPYwRifRGNERc6BMOYsIXQ9sS276MUc9exoVetp9VCH/yHjqJSbtWYiPdgwkADrO6Zi3Mibevcux+lLI4qBwFa3Qrl/MqhBWwIQaaWuJFBrhR2VyyQpFDvF8UOYDbZZ2h/+TPcmN4/g4quW1kUaCMHgE59qIzdknhe7W259WvpFkpx4ssosghjjMwOPrWDJFzyk/Qdiw+LyhRw75Oar6L7lrCsIznM9pfESfXrPuzTL79Rqgz9zS+ozUUJZM0UpZzr6Ad+NM0erBnuxYYLkeSWx4Xupjk3gRM3cLTjZ7H+xPmmY73+XCnoTpaIskbsRaowTGYNDqglstUrnCLO2tHI+c+nnTQmengkqGSmxn+ymG+nYvzMEvtAS1srAh4S1/qSWODmNnzC30B1lVALRmU1XY0hv0m8PdqjubbO1E414=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(83380400001)(6666004)(36756003)(26005)(2616005)(6506007)(53546011)(86362001)(41300700001)(6512007)(66574015)(38100700002)(31696002)(186003)(5660300002)(8936002)(66556008)(66946007)(478600001)(66476007)(6486002)(2906002)(4326008)(110136005)(8676002)(31686004)(316002)(6636002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0pMYktpNUNtRTRPcUtrOEtlUXpnY2ZrOHhOQk05ZnBudmNyQnFPMjhWTmtn?=
 =?utf-8?B?S3FGZ0E4UU5ITkdsSTJCVzNIb01UaUFVZm5uYnMvbi9oMkdteHVTUml6b0Ev?=
 =?utf-8?B?YWlEd2M4TkhaeVFIQnVMUkhWYWNPZzBIdEJ0eDdwZ1BwNkRlb1hEZ3lyeDhv?=
 =?utf-8?B?UDRObHpsVjhRbjE2SzRDQWNXMzc4OUlBZFFNY3VISXE5bWM3Z3dvaE1abyty?=
 =?utf-8?B?ZGdYZEZWY0Z1MlRTOHhXQVhuSWdKdlhVTlJuZHBZZVFDdEc1TkNhRzAxRkFD?=
 =?utf-8?B?MTBrQ3RIKzBycEkvNzZESTZMRzk1blM5U1NwUUc1UVovQzdxSjVCendsMWo1?=
 =?utf-8?B?TmphWVFNemZobzFhaDhKWVV1bE83TmxlMzhUcEhaekdiSWJTUVJkUUJ5SWl5?=
 =?utf-8?B?SElvQldYbDJNdzlVUzROM2F2WUJ6NnhQaEswb3FENG1TNmtsSHUyQjFNVklW?=
 =?utf-8?B?TGs1dmFnazJPSnNNV2RDNjdpeUFWVCtDSVpBcmZqSUF6ZjBJMXY5VjVnNERW?=
 =?utf-8?B?eGk4aTcvVWRvRmJucTY0WldxODJQc3lIVUhJREtXdFZtVzlYSUw5eWZ5aFNv?=
 =?utf-8?B?WmxlTHZVRlVtRUNwV01nT2hQbm1UTUhyT3pGbEJaZWxpNGR3QU9IOWlWaTFZ?=
 =?utf-8?B?aldRWXBlNVd5aTlrckRLREFhWFRJY2VtYVdxWVQ5eCt5R0JnRkJnSEFMb0Rl?=
 =?utf-8?B?MXdYNTEyMDM0eXBLNlJlSjVOWEdKRFYrUU83NlgrUjVKcFZBMFI4Q01ZUEpW?=
 =?utf-8?B?R0x6ZTNJVUx6SXBhU2ZkN1BUQXA2cStxWDlSOE12MlF2cGsyRHJHN1B1WXRu?=
 =?utf-8?B?b01rRlNRUVV5bm9qRUFhMkc3aEgzRHp4clNPdXhpcTVuQjR1K1lEWldubURZ?=
 =?utf-8?B?YkhzdXE3UzBvM1dEZzVqNE41WWRYVjBVdldpajBISEUwS2VJaGRjcjJRbFho?=
 =?utf-8?B?YUpLM3BJODBCUXFCZWd5RVBJdFNHd3RIaTREeGliRXdYWDZWRXc5cGF2ajNs?=
 =?utf-8?B?UVNzdUczRk1QbExJYm5BOVdBWnNVUVRMK1BSaDg0cTlEZnd0Q3krZ1FXYTBO?=
 =?utf-8?B?UGFlR2VOSjlHd3oyWkh4emhsU3ZOR3EzMDVKSnBHUWdHbUhrL0ExNzRndlVH?=
 =?utf-8?B?VkxZUVc0WUdJMUFuYlpsZ2NENVQ0S0JkK2x2bFFQcSs5dGdNdTY5WGJNWXND?=
 =?utf-8?B?cWJXUStqMElMWk1pNG9VR0RhTEVmSStla1VCeXlwcUdwRHpESzNBSXIrcVFG?=
 =?utf-8?B?VmF4aTRmb2s1VlpRS0EweDVwNkhUODgrUXRZcHN3d1RodHcvbnBqT1Zvb2d4?=
 =?utf-8?B?T1dXaGVvUWg0SmpxZ05YUG8yeDFQTDF3Q29SNndTbUh4QlZ3ME1SWUtHcnIw?=
 =?utf-8?B?Y2hudG4xKzlXTkZRQmI3TklRM1huNTB3dDc0dDQrMmJuN2ZleEI4TjVmUHQw?=
 =?utf-8?B?cjNsTUxVM2FneHVncDAyTzJ3bnlrT04wMWpqV3pNSXkzaFpGTjNBWmE1dzdp?=
 =?utf-8?B?UnNTYmVWK3U1K3BaQmVTbk9zTEF6WStyaDVnS3d6UzFRUnlnWG5JK2tNaWM4?=
 =?utf-8?B?ZGQwREVmYlZtVjBzWTBuRjFiSU9oR2w1RXpTeEFjZmJ5SUErem52VGwxdVBm?=
 =?utf-8?B?R2E1K3BTdjB4OVM4RVhMeFJGWlRMbDFPaTFra3B5alE0WDl1YWxjb1lmYlBx?=
 =?utf-8?B?UGhzUVhzaW5vR0RhWWkvVGtVZldaa1gweGlmVmw0OUNkcm9yN0o5RUdZNGt6?=
 =?utf-8?B?M1VqM09welQ2bGdVL08vdmNHNzJuL0prUDhCdTRuWTk5SjVkYTBkQnlhaVFG?=
 =?utf-8?B?bFpuRkZuWHBjT0tiMzhFN1FWc3dFQXk0KzhmK1pubytMM2ZHRUxOc1dTUlJG?=
 =?utf-8?B?U09RVUpmOFdIc0lIWkQ1OCtJeUNWY21VcnpNQzM2ZDdZYWNtVEE0Z0xDbjJs?=
 =?utf-8?B?YWwrdnZiK3BpK3FRaTg0czFRK2xESFpMUVJwMmJvQk1qcmZIN3JqRnNiZjYv?=
 =?utf-8?B?a0MyTkRmVVhRNHp0cUJPWWw3VklTbnBwc3E5eEVSUzlWZlpVYjdyREg2NTVF?=
 =?utf-8?B?Ykh6ZnpHVzhVQm4xR2ZnRGl6Zk1WVEJYNVRYUEVML1NLMW5Ldkw2aGlnTmVi?=
 =?utf-8?Q?AzR4ejHYln7RbUAHTPwaoUgBX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7cc5088-ca83-4f3f-5435-08da909c8cbb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 06:45:27.7981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEOvYbTNXqm8lpWC0Ws1zix52dgXgCRH6BLrjyGkrWpoyQ78jmfi45Ru1bAFPl4d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943
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
Cc: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.09.22 um 21:58 schrieb Daniel Vetter:
> On Tue, Aug 16, 2022 at 10:33:16AM +0530, Arunpravin Paneer Selvam wrote:
>>
>> On 8/15/2022 4:35 PM, Christian König wrote:
>>> Am 12.08.22 um 15:30 schrieb Arunpravin Paneer Selvam:
>>>> We are adding two new callbacks to ttm resource manager
>>>> function to handle intersection and compatibility of
>>>> placement and resources.
>>>>
>>>> v2: move the amdgpu and ttm_range_manager changes to
>>>>       separate patches (Christian)
>>>> v3: rename "intersect" to "intersects" (Matthew)
>>>> v4: move !place check to the !res if and return false
>>>>       in ttm_resource_compatible() function (Christian)
>>>> v5: move bits of code from patch number 6 to avoid
>>>>       temporary driver breakup (Christian)
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Signed-off-by: Arunpravin Paneer Selvam
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>> Patch #6 could still be cleaned up more now that we have the workaround
>>> code in patch #1, but that not really a must have.
>>>
>>> Reviewed-by: Christian König <christian.koenig@amd.com> for the entire
>>> series.
>>>
>>> Do you already have commit rights?
>> Hi Christian,
>> I applied for drm-misc commit rights, waiting for the project maintainers to
>> approve my request.
> Why do all drivers have to implement the current behaviour? Can we have a
> default implementation, which gets called if nothing is set instead?

We do have a default implementation in the range manager which is used 
by radeon, GEM VRAM helpers, VMWGFX and amdgpu (but there only for some 
domains).

> I'm a bit confused why the bloat here ...

Drivers do have specialized implementations of the backend, e.g. VMWGFX 
have his handle backend, amdgpu the VRAM backend with special 
placements, i915 is completely special as well.

Here we only move the decision if resources intersect or are compatible 
into those specialized backends. Previously we had all this in a 
centralized callback for all backends of a driver.

See the switch in amdgpu_ttm_bo_eviction_valuable() for an example. 
Final goal is to move all this stuff into the specialized backends and 
remove this callback.

The only driver where I couldn't figure out why we have duplicated all 
this from the standard implementation is Nouveau.

> Also please document new callbacks precisely with inline kerneldoc. I know
> ttm docs aren't great yet, but they don't get better if we don't start
> somewhere. I think the in-depth comments for modeset vfuncs (e.g. in
> drm_modeset_helper_vtables.h) are a good standard here.

I thought we already did that. Please be a bit more specific.

Thanks,
Christian.

> -Daniel
>
>> Thanks,
>> Arun
>>> Regards,
>>> Christian.
>>>
>>>> ---
>>>>    drivers/gpu/drm/ttm/ttm_bo.c       |  9 ++--
>>>>    drivers/gpu/drm/ttm/ttm_resource.c | 77 +++++++++++++++++++++++++++++-
>>>>    include/drm/ttm/ttm_resource.h     | 40 ++++++++++++++++
>>>>    3 files changed, 119 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> index c1bd006a5525..f066e8124c50 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object
>>>> *bo,
>>>>    bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>                      const struct ttm_place *place)
>>>>    {
>>>> +    struct ttm_resource *res = bo->resource;
>>>> +    struct ttm_device *bdev = bo->bdev;
>>>> +
>>>>        dma_resv_assert_held(bo->base.resv);
>>>>        if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>>>            return true;
>>>> @@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct
>>>> ttm_buffer_object *bo,
>>>>        /* Don't evict this BO if it's outside of the
>>>>         * requested placement range
>>>>         */
>>>> -    if (place->fpfn >= (bo->resource->start +
>>>> bo->resource->num_pages) ||
>>>> -        (place->lpfn && place->lpfn <= bo->resource->start))
>>>> -        return false;
>>>> -
>>>> -    return true;
>>>> +    return ttm_resource_intersects(bdev, res, place, bo->base.size);
>>>>    }
>>>>    EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>>>>    diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
>>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> index 20f9adcc3235..0d1f862a582b 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> @@ -253,10 +253,84 @@ void ttm_resource_free(struct
>>>> ttm_buffer_object *bo, struct ttm_resource **res)
>>>>    }
>>>>    EXPORT_SYMBOL(ttm_resource_free);
>>>>    +/**
>>>> + * ttm_resource_intersects - test for intersection
>>>> + *
>>>> + * @bdev: TTM device structure
>>>> + * @res: The resource to test
>>>> + * @place: The placement to test
>>>> + * @size: How many bytes the new allocation needs.
>>>> + *
>>>> + * Test if @res intersects with @place and @size. Used for testing
>>>> if evictions
>>>> + * are valueable or not.
>>>> + *
>>>> + * Returns true if the res placement intersects with @place and @size.
>>>> + */
>>>> +bool ttm_resource_intersects(struct ttm_device *bdev,
>>>> +                 struct ttm_resource *res,
>>>> +                 const struct ttm_place *place,
>>>> +                 size_t size)
>>>> +{
>>>> +    struct ttm_resource_manager *man;
>>>> +
>>>> +    if (!res)
>>>> +        return false;
>>>> +
>>>> +    if (!place)
>>>> +        return true;
>>>> +
>>>> +    man = ttm_manager_type(bdev, res->mem_type);
>>>> +    if (!man->func->intersects) {
>>>> +        if (place->fpfn >= (res->start + res->num_pages) ||
>>>> +            (place->lpfn && place->lpfn <= res->start))
>>>> +            return false;
>>>> +
>>>> +        return true;
>>>> +    }
>>>> +
>>>> +    return man->func->intersects(man, res, place, size);
>>>> +}
>>>> +
>>>> +/**
>>>> + * ttm_resource_compatible - test for compatibility
>>>> + *
>>>> + * @bdev: TTM device structure
>>>> + * @res: The resource to test
>>>> + * @place: The placement to test
>>>> + * @size: How many bytes the new allocation needs.
>>>> + *
>>>> + * Test if @res compatible with @place and @size.
>>>> + *
>>>> + * Returns true if the res placement compatible with @place and @size.
>>>> + */
>>>> +bool ttm_resource_compatible(struct ttm_device *bdev,
>>>> +                 struct ttm_resource *res,
>>>> +                 const struct ttm_place *place,
>>>> +                 size_t size)
>>>> +{
>>>> +    struct ttm_resource_manager *man;
>>>> +
>>>> +    if (!res || !place)
>>>> +        return false;
>>>> +
>>>> +    man = ttm_manager_type(bdev, res->mem_type);
>>>> +    if (!man->func->compatible) {
>>>> +        if (res->start < place->fpfn ||
>>>> +            (place->lpfn && (res->start + res->num_pages) >
>>>> place->lpfn))
>>>> +            return false;
>>>> +
>>>> +        return true;
>>>> +    }
>>>> +
>>>> +    return man->func->compatible(man, res, place, size);
>>>> +}
>>>> +
>>>>    static bool ttm_resource_places_compat(struct ttm_resource *res,
>>>>                           const struct ttm_place *places,
>>>>                           unsigned num_placement)
>>>>    {
>>>> +    struct ttm_buffer_object *bo = res->bo;
>>>> +    struct ttm_device *bdev = bo->bdev;
>>>>        unsigned i;
>>>>          if (res->placement & TTM_PL_FLAG_TEMPORARY)
>>>> @@ -265,8 +339,7 @@ static bool ttm_resource_places_compat(struct
>>>> ttm_resource *res,
>>>>        for (i = 0; i < num_placement; i++) {
>>>>            const struct ttm_place *heap = &places[i];
>>>>    -        if (res->start < heap->fpfn || (heap->lpfn &&
>>>> -            (res->start + res->num_pages) > heap->lpfn))
>>>> +        if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
>>>>                continue;
>>>>              if ((res->mem_type == heap->mem_type) &&
>>>> diff --git a/include/drm/ttm/ttm_resource.h
>>>> b/include/drm/ttm/ttm_resource.h
>>>> index ca89a48c2460..5afc6d664fde 100644
>>>> --- a/include/drm/ttm/ttm_resource.h
>>>> +++ b/include/drm/ttm/ttm_resource.h
>>>> @@ -88,6 +88,38 @@ struct ttm_resource_manager_func {
>>>>        void (*free)(struct ttm_resource_manager *man,
>>>>                 struct ttm_resource *res);
>>>>    +    /**
>>>> +     * struct ttm_resource_manager_func member intersects
>>>> +     *
>>>> +     * @man: Pointer to a memory type manager.
>>>> +     * @res: Pointer to a struct ttm_resource to be checked.
>>>> +     * @place: Placement to check against.
>>>> +     * @size: Size of the check.
>>>> +     *
>>>> +     * Test if @res intersects with @place + @size. Used to judge if
>>>> +     * evictions are valueable or not.
>>>> +     */
>>>> +    bool (*intersects)(struct ttm_resource_manager *man,
>>>> +               struct ttm_resource *res,
>>>> +               const struct ttm_place *place,
>>>> +               size_t size);
>>>> +
>>>> +    /**
>>>> +     * struct ttm_resource_manager_func member compatible
>>>> +     *
>>>> +     * @man: Pointer to a memory type manager.
>>>> +     * @res: Pointer to a struct ttm_resource to be checked.
>>>> +     * @place: Placement to check against.
>>>> +     * @size: Size of the check.
>>>> +     *
>>>> +     * Test if @res compatible with @place + @size. Used to check of
>>>> +     * the need to move the backing store or not.
>>>> +     */
>>>> +    bool (*compatible)(struct ttm_resource_manager *man,
>>>> +               struct ttm_resource *res,
>>>> +               const struct ttm_place *place,
>>>> +               size_t size);
>>>> +
>>>>        /**
>>>>         * struct ttm_resource_manager_func member debug
>>>>         *
>>>> @@ -329,6 +361,14 @@ int ttm_resource_alloc(struct ttm_buffer_object
>>>> *bo,
>>>>                   const struct ttm_place *place,
>>>>                   struct ttm_resource **res);
>>>>    void ttm_resource_free(struct ttm_buffer_object *bo, struct
>>>> ttm_resource **res);
>>>> +bool ttm_resource_intersects(struct ttm_device *bdev,
>>>> +                 struct ttm_resource *res,
>>>> +                 const struct ttm_place *place,
>>>> +                 size_t size);
>>>> +bool ttm_resource_compatible(struct ttm_device *bdev,
>>>> +                 struct ttm_resource *res,
>>>> +                 const struct ttm_place *place,
>>>> +                 size_t size);
>>>>    bool ttm_resource_compat(struct ttm_resource *res,
>>>>                 struct ttm_placement *placement);
>>>>    void ttm_resource_set_bo(struct ttm_resource *res,
>>>>
>>>> base-commit: 730c2bf4ad395acf0aa0820535fdb8ea6abe5df1

