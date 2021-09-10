Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB31407032
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 19:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9A16EA48;
	Fri, 10 Sep 2021 17:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7076EA40;
 Fri, 10 Sep 2021 17:04:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvVTH06II/LyBQgQaNR142RhjAq0QuSWi01VJC52VLsmaDAq3NE06QOlXnCDexe0MnkiEdC05dboHngGyDkd9JcQBwyAr2HzMg5DpONGFGdQgJz3U5Zzn+FoxNml4GmI2YkqEzp73QkhvaX78jxlPL3vsOBFgfz7Cx3W6nHLpBzIpj9znH39hB6ihoPs0Ete3TZ4GxdEXfwD7dUymJiFLAKJlLTGNWiqagwSvqApz4ZwL3+l1NKegYIki+aGdywVJ9HP+pTdoAYRBGcAlNme2w7xUpanxpA1eyCYlZvW/RdmXqFzldwSPuOhpdaiEk49l7+pWonuFsCf8LmQM0sYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=rwfSloBAF/S74iWPBmbmKEZRdhLNFB5g9Y2F/EJmm6U=;
 b=EMOHAd9ba9533siYXxIVbjxmIfivGzTYPoNTjGGaPQPEdy6Q6+yWHlD3AWs7mNvNkUUgCse7UGrSFY1lG3CgIkBaUjyqipOSfEF3BsIFtxU7MujG4dolJZ1T0p6sGT2y9tlYVHwEESf86pMeK55jzF35DMpAdxMDfWH7G+K/r65SxCxRhXSwxDxzgGpakS5yCzzOF4LNARNW5PiOY/6hNacGSKEgsJw/y5VzDOvOp+S0O+anC3L2WPzrtRLVL07n1Dw6KPkW8cZNktYvKta/P8kfP0pe7yN/4IeREz+20/o7WlUe26mjwAQ/wuTf0cyOSAl2yiN6MG4hr6Uiy2BiIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwfSloBAF/S74iWPBmbmKEZRdhLNFB5g9Y2F/EJmm6U=;
 b=tZibsryF2lTDcUvFSAsQ5ZZoHPg+gKCSUuY+USxJZlOuwrUCMD00ceV7qUshcpbMRZ5xYaaVai+K/9WqMpqscEZhnt0TRKD8DgHbr26dDsc2wVCG5dPGKmFCZNe1pqBYB+xQvKhEjfcY7n7br1fDSYAmJoh/8feRHESs0GRhYXo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4961.namprd12.prod.outlook.com (2603:10b6:208:1c9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 17:03:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 17:03:59 +0000
Subject: Re: [RFC PATCH] drm/ttm: Add a private member to the struct
 ttm_resource
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20210910131512.161655-1-thomas.hellstrom@linux.intel.com>
 <d7570cab-d402-761d-40e0-3d08d9b9d3c9@amd.com>
 <a1a8fd3f1ca13b84192bd3c8719f510e5b655b2c.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c8484b51-4365-bedd-be73-4c0898ac70b1@amd.com>
Date: Fri, 10 Sep 2021 19:03:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a1a8fd3f1ca13b84192bd3c8719f510e5b655b2c.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM8P189CA0019.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:19dd:e0fb:4acb:47cb]
 (2a02:908:1252:fb60:19dd:e0fb:4acb:47cb) by
 AM8P189CA0019.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 17:03:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d56a854a-c3de-46d6-73f5-08d9747cfb84
X-MS-TrafficTypeDiagnostic: BL0PR12MB4961:
X-Microsoft-Antispam-PRVS: <BL0PR12MB49615CC6AEBEB1038456DC9183D69@BL0PR12MB4961.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WafsTYpiKsHWwW6l99Vfx9d04Wnq8uQkap3xJS3LK1Xb5C5evnUrA5Ip+OTJw1HPnQxBESj2H4lcG3PR7zZLD1xmOSaeltAmrp2c4I5aVRjaUnKKrdV6QsvVVFlI08J2WaGYpwDWlMyLHw/3+Rz8JvyUh9NgUr4PTkHe7x/jOR9NDOHZbQ1OKcg+k8+LVl7sAslqHUQlj4lC90oH+XUbMegE/xjqVHT8SJTD1NyvRGKt7no4jzb7fUy+jgGeciVoDWfOCW4yi5W1wM6lUQw+bK7HzqaQODd7aboFO1AFG4VD3Pi7sTN5pDP58Ut2jF+/NeI+QW/+SKfnNmSEQFgCdIHmvEr15nt4ikY7asRz3yjdOpH64nn0GwHrYO9NDCm7y87S/tk5SoAt+vDda2Huf7Yp+g6cWy8UwMMrRZdNKwqagfKq1oM5B1NpG+vep7WejjC5hl6dt0q4bRoXoa5a5KAAxnaHNpTWBRqOug/PhdJdhIePh7FBrp45/KJy2y4+JLML24Fc9P4GTXfxN6NXdGy7GSoFODTtP7Ee1LQF1dW0X7VLLVxAs6iw7XKKACsCedgbIhaQFSnAxkd9VbdBkAEAaFG75puR6XZg1Da6hQj4RC0lmM/Xe+iTZQWudVMuMJmYQu9A+cg1GPE4tfD9pBp88kea/6KcaJnEJnTuFcwhOka/TCp/dBx/imRsNatcLj9gOIBAgxMtOVHhl9kpuCV2VXKQJ34D9RBs6R3+Hm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(8936002)(31696002)(38100700002)(66946007)(6666004)(86362001)(66476007)(36756003)(186003)(316002)(2616005)(66556008)(2906002)(4326008)(6486002)(8676002)(31686004)(66574015)(478600001)(83380400001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjJUKytRSkhuWnVPS0pNS2F4VDNpV0lNeFFTTkFNVnI0TDZMZjJVZFd5elBS?=
 =?utf-8?B?SGhHWUoyMU9JUkZOWFR4TVd2cVFhR2swb0FNYWZ0aFlZUXNLK0JOazRCNHh1?=
 =?utf-8?B?UTdPSnh3RnI5K01lYm1NTVNLY2o3aC93TElkRHoxaVRxNWU2MG1ITkJPWUQz?=
 =?utf-8?B?TkVQSEpobW1UdlY5OGFlaXdxNmZjQ1REYlh3NDZZclR2SmxKVVZ4aEw0RXlU?=
 =?utf-8?B?bEV5ZlhVOVFSZGR3WjZpVHBGTkJXa09ycERQbyttRzlHd2c0Y3ZJQW44R2I5?=
 =?utf-8?B?M2VNdEFiMitxbmlud0R5Wm8vUWNTMEgxSHEvTFgyQWZ3QUwrU28yWUt2cVBZ?=
 =?utf-8?B?ZjJrc3A1VStwaisraWU0a0JmalVFWmg0disrQlZrZWpSd0JzZCtvK1BrK05O?=
 =?utf-8?B?VVBFR3owbU50OEFpRk92NktkL1U0QVhHeG5KeW80R0xnNXJaeXllTkpyMmVp?=
 =?utf-8?B?U2F5dWpLZnQ0MllMNGt1enNjMERTbUNWZmVMNU9CeldlaEVQaXNEalpucEFD?=
 =?utf-8?B?bTk2Y3JQbDFBemRGYmtWUmZiaFgrM3M3K0Y5aDFVaHhnVnZLbkpqOWE5eVVK?=
 =?utf-8?B?aE0xOUVrQmwwSUVCVWkrTVgraFowYTJxb2p4cXNXMkFKT0o3RVVUNENBWHMx?=
 =?utf-8?B?Y3ZwU0NSMGRJTUpid01VQ0tsTW1ZL0Y1eFhmWG9BalM5RkZqUEJ2UTRRbEJv?=
 =?utf-8?B?S3RsNmpVYnJ5dUJXVWQ3T1Q0ZFRDT0R4NWkyWUJqcXVacWEyenhhcTVwOUpw?=
 =?utf-8?B?SEVTYWtCQnRYRGdHbHlucExtTFpTTGc0clpueFFyOVRsUFNlYmw3a3VKak05?=
 =?utf-8?B?TmNJL2ZPTUNubGRiVnJUdzdrOERIVFhZNGEreFo2bGw0eVRlS1g1UmQ1SWth?=
 =?utf-8?B?eFBPSk03a1NOcUlDa3JxNnBsRUVXb0lveUU5a3k5ZUhLWFRXejg3em9HbGdH?=
 =?utf-8?B?ODdZbmdXVzdEVUM5UnhQcktTMCszNHByeUFCQUh0R2E2SXNSRzlOUW5JVjBH?=
 =?utf-8?B?eUxPcEFZMllzWDlwNWQzSTk1MGtnaFY4d292c0pFaDkweTdCQVAxcVJEdGRK?=
 =?utf-8?B?TUlUczFPR2pNbnVRbFUybGFlWFJwUG9hOWRFdUtvVGpBMXlnTHNJOWg2ZmNZ?=
 =?utf-8?B?cFFWSWVKa3o1cGk5QmQ4VzRCeVZBZjAreTFvRkJHVGw0MlpJMWdPeW4vcjl4?=
 =?utf-8?B?QUFPMGpwT2tCVEF2RVJoeC9kdmRpTEhxWnRXS20xWm1tRGl6MjVlOFljMy9j?=
 =?utf-8?B?VUZxV0pKSm9GeWNqZ0ZMN3RpL0pDaCtkSkpTQis4SFBxNmNLWmJrVzNMVUpM?=
 =?utf-8?B?L2p2aGxLVG5XMUV4cXF2N0xFZVZaTDlhZzcxd25sTU5tb3FqRGxVK3Z6b2Ur?=
 =?utf-8?B?YXB2dTdyYVhDOTJxYlIweTZEMDRLNDVQcG9sNU0vR01iTTBFWHNCK0FIWkMz?=
 =?utf-8?B?SnMrU0docG1GSXB6YUpDM3lwb0FOSXB6bG9SNHZDSzFOS0l5d0hJZVZTRjJR?=
 =?utf-8?B?eTMxVWVjQUROeEpoYVJ5M0ZXMWFkUldlUGY5L29SYUg0NzJtOGJBaGtnUHJu?=
 =?utf-8?B?T2tFd2h0bEdLLzJWUXNLd2RCSWxLR0tOTUZQc1grTkxIbnlVeXA5U09YTDQ0?=
 =?utf-8?B?WWpkN2wzRGJCb081RzlNUnlDR2NYSGdqZGVEWnVjcll1WDB6M3JSOFJ3OVlH?=
 =?utf-8?B?WUhrc3RLbVBVVXVWYXI4WlRzMlhGei9jcnJtdHpGd2J3WFp0VEFGTFRuajZx?=
 =?utf-8?B?aExPUlVTNUx4RW13QjFHc1RxSkZzZGgyQ1VUaVdUcXByRjVOUnI4RCsrdTB3?=
 =?utf-8?B?SnhZT241MTlJcGZLSkFIN2V1bVRjQUVwMUN5ME9UUGxIcjNFNE5HUTBmUHh3?=
 =?utf-8?Q?1dYEyjWTKrFm/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56a854a-c3de-46d6-73f5-08d9747cfb84
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 17:03:59.7092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYlF8YU402ybJUUxBPmmuG6LjyIs45yi4nPPKrKyh7SI/YMat5Ft3+PnduiV3PVM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4961
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

Am 10.09.21 um 17:30 schrieb Thomas Hellström:
> On Fri, 2021-09-10 at 16:40 +0200, Christian König wrote:
>>
>> Am 10.09.21 um 15:15 schrieb Thomas Hellström:
>>> Both the provider (resource manager) and the consumer (the TTM
>>> driver)
>>> want to subclass struct ttm_resource. Since this is left for the
>>> resource
>>> manager, we need to provide a private pointer for the TTM driver.
>>>
>>> Provide a struct ttm_resource_private for the driver to subclass
>>> for
>>> data with the same lifetime as the struct ttm_resource: In the i915
>>> case
>>> it will, for example, be an sg-table and radix tree into the LMEM
>>> /VRAM pages that currently are awkwardly attached to the GEM
>>> object.
>>>
>>> Provide an ops structure for associated ops (Which is only
>>> destroy() ATM)
>>> It might seem pointless to provide a separate ops structure, but
>>> Linus
>>> has previously made it clear that that's the norm.
>>>
>>> After careful audit one could perhaps also on a per-driver basis
>>> replace the delete_mem_notify() TTM driver callback with the above
>>> destroy function.
>> Well this is a really big NAK to this approach.
>>
>> If you need to attach some additional information to the resource
>> then
>> implement your own resource manager like everybody else does.
> Well this was the long discussion we had back then when the resource
> mangagers started to derive from struct resource and I was under the
> impression that we had come to an agreement about the different use-
> cases here, and this was my main concern.

Ok, then we somehow didn't understood each other.

> I mean, it's a pretty big layer violation to do that for this use-case.

Well exactly that's the point. TTM should not have a layer design in the 
first place.

Devices, BOs, resources etc.. are base classes which should implement a 
base functionality which is then extended by the drivers to implement 
the driver specific functionality.

That is a component based approach, and not layered at all.

> The TTM resource manager doesn't want to know about this data at all,
> it's private to the ttm resource user layer and the resource manager
> works perfectly well without it. (I assume the other drivers that
> implement their own resource managers need the data that the
> subclassing provides?)

Yes, that's exactly why we have the subclassing.

> The fundamental problem here is that there are two layers wanting to
> subclass struct ttm_resource. That means one layer gets to do that, the
> second gets to use a private pointer, (which in turn can provide yet
> another private pointer to a potential third layer). With your
> suggestion, the second layer instead is forced to subclass each
> subclassed instance it uses from  the first layer provides?

Well completely drop the layer approach/thinking here.

The resource is an object with a base class. The base class implements 
the interface TTM needs to handle the object, e.g. create/destroy/debug 
etc...

Then we need to subclass this object because without any additional 
information the object is pretty pointless.

One possibility for this is to use the range manager to implement 
something drm_mm based. BTW: We should probably rename that to something 
like ttm_res_drm_mm or similar.

What we should avoid is to abuse TTM resource interfaces in the driver, 
e.g. what i915 is currently doing. This is a TTM->resource mgr interface 
and should not be used by drivers at all.

> Ofc we can do that, but it does indeed feel pretty awkward.
>
> In any case, if you still think that's the approach we should go for,
> I'd need to add init() and fini() members to the ttm_range_manager_func
> struct to allow subclassing without having to unnecessarily copy the
> full code?

Yes, exporting the ttm_range_manager functions as needed is one thing I 
wanted to do for the amdgpu_gtt_mgr.c code as well.

Just don't extend the function table but rather directly export the 
necessary functions.

Regards,
Christian.

>
> Thanks,
> Thomas
>
>
>
>
>
>
>
>
>
>
>> Regards,
>> Christian.
>>
>>> Cc: Matthew Auld <matthew.william.auld@gmail.com>
>>> Cc: König Christian <Christian.Koenig@amd.com>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_resource.c | 10 +++++++---
>>>    include/drm/ttm/ttm_resource.h     | 28
>>> ++++++++++++++++++++++++++++
>>>    2 files changed, 35 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>> index 2431717376e7..973e7c50bfed 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>> @@ -57,13 +57,17 @@ int ttm_resource_alloc(struct ttm_buffer_object
>>> *bo,
>>>    void ttm_resource_free(struct ttm_buffer_object *bo, struct
>>> ttm_resource **res)
>>>    {
>>>          struct ttm_resource_manager *man;
>>> +       struct ttm_resource *resource = *res;
>>>    
>>> -       if (!*res)
>>> +       if (!resource)
>>>                  return;
>>>    
>>> -       man = ttm_manager_type(bo->bdev, (*res)->mem_type);
>>> -       man->func->free(man, *res);
>>>          *res = NULL;
>>> +       if (resource->priv)
>>> +               resource->priv->ops.destroy(resource->priv);
>>> +
>>> +       man = ttm_manager_type(bo->bdev, resource->mem_type);
>>> +       man->func->free(man, resource);
>>>    }
>>>    EXPORT_SYMBOL(ttm_resource_free);
>>>    
>>> diff --git a/include/drm/ttm/ttm_resource.h
>>> b/include/drm/ttm/ttm_resource.h
>>> index 140b6b9a8bbe..5a22c9a29c05 100644
>>> --- a/include/drm/ttm/ttm_resource.h
>>> +++ b/include/drm/ttm/ttm_resource.h
>>> @@ -44,6 +44,7 @@ struct dma_buf_map;
>>>    struct io_mapping;
>>>    struct sg_table;
>>>    struct scatterlist;
>>> +struct ttm_resource_private;
>>>    
>>>    struct ttm_resource_manager_func {
>>>          /**
>>> @@ -153,6 +154,32 @@ struct ttm_bus_placement {
>>>          enum ttm_caching        caching;
>>>    };
>>>    
>>> +/**
>>> + * struct ttm_resource_private_ops - Operations for a struct
>>> + * ttm_resource_private
>>> + *
>>> + * Not much benefit to keep this as a separate struct with only a
>>> single member,
>>> + * but keeping a separate ops struct is the norm.
>>> + */
>>> +struct ttm_resource_private_ops {
>>> +       /**
>>> +        * destroy() - Callback to destroy the private data
>>> +        * @priv - The private data to destroy
>>> +        */
>>> +       void (*destroy) (struct ttm_resource_private *priv);
>>> +};
>>> +
>>> +/**
>>> + * struct ttm_resource_private - TTM driver private data
>>> + * @ops: Pointer to struct ttm_resource_private_ops with
>>> associated operations
>>> + *
>>> + * Intended to be subclassed to hold, for example cached data
>>> sharing the
>>> + * lifetime with a struct ttm_resource.
>>> + */
>>> +struct ttm_resource_private {
>>> +       const struct ttm_resource_private_ops ops;
>>> +};
>>> +
>>>    /**
>>>     * struct ttm_resource
>>>     *
>>> @@ -171,6 +198,7 @@ struct ttm_resource {
>>>          uint32_t mem_type;
>>>          uint32_t placement;
>>>          struct ttm_bus_placement bus;
>>> +       struct ttm_resource_private *priv;
>>>    };
>>>    
>>>    /**
>

