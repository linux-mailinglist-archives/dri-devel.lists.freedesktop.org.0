Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB5D41D4AF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 09:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE066E3AC;
	Thu, 30 Sep 2021 07:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B926EB1F;
 Thu, 30 Sep 2021 07:45:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOoTsRqG7BVLMrc6NYxcmMDvVifZNIC8h+ayBuPfLOk+uzC7wF2KKf2Bo22OHEThF1nh38BUTzJuz9uvw4TMCjP+dNIe+4nTuecff0zY+tMoias+SeuY4gkP5xN5gZJsv/jcHkghedkN9z6FJeWmP0WhVwL/fwBF7RAEJ5TQaKrNclYiRpnZwBRBde9sxawdQrwOX5oQ8D9JeLCLmncfW397P00WxOsCOqes8pnpL3HFg2FeCFXHMUXs9ovfkvzPSyWRDw+gXtVmdXH1G3QmzLnqmVxps9Gpak/Ta5hjd+wkWzgWu++XNssTfLhaP8h6bX/pCsl9hnk3nvqOnFUQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=doFMfR8K0gWtZ/X+VlEnNLncElQv0+JbR2gsBTKfWCI=;
 b=X2ogvVQowIlk6NiggH04S0eFFOtVkLxZipT0CtgActs8V2lvtk+NF30AqG1O2Fdn68vNSHIoxZY2sjzd6aOAC3C1qz62vJfxnKC1rppAbf+U6ZfmRDoEvwtSrwVCs/ls6rKOGzU9u5gOjNLlsFXyPWx3KtIbOtE39mIEla8+GQLW5nNgt5JAay3ROYa5F1vXYT7lV6fTF9YAx3+lcYIYpuOxtMJum9ZPP5pJdZ3+IstYr51eRMoLYF+/dvTVHXqa0iFxrznmxYIGy2T+oiVmndplub8LuGOj5+nZxTsiX7usy5b8DRT4+0HERx05MbKcdIL9ocTByHAvSvqANbYG7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doFMfR8K0gWtZ/X+VlEnNLncElQv0+JbR2gsBTKfWCI=;
 b=rTblG8uqDzL0I5gXcej7GGWPFs7QgbIVzw26Cm4rTIUO2jxLOfCHx3ocGKVvH53qdwVtgy8+cEQ6DDDzl8iywpE6T+eGG5ZiVIuTF0aDBeC/rPdDsh45phvXGL/190PfEgEG/irGMMRNTej1MGdMZ97uBwZa+cevIzE8K9HHcxw=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR1201MB0181.namprd12.prod.outlook.com
 (2603:10b6:910:1f::11) by CY4PR12MB1912.namprd12.prod.outlook.com
 (2603:10b6:903:11c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 07:45:17 +0000
Received: from CY4PR1201MB0181.namprd12.prod.outlook.com
 ([fe80::f109:9a58:2e94:2e84]) by CY4PR1201MB0181.namprd12.prod.outlook.com
 ([fe80::f109:9a58:2e94:2e84%11]) with mapi id 15.20.4566.015; Thu, 30 Sep
 2021 07:45:17 +0000
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/ttm: s/FLAG_SG/FLAG_EXTERNAL/
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Matthew Auld <matthew.auld@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210929132629.353541-1-matthew.auld@intel.com>
 <f6b4b843-55f8-62cb-ef1d-8e8935c6ad71@amd.com>
 <CAM0jSHMfBsKtyd7To3rWbCvMzLhHLAgyXENjVJPrgkoYCiiNVg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f8ca1ab8-0c07-131e-a68f-4d8ecb67ae3f@amd.com>
Date: Thu, 30 Sep 2021 09:45:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAM0jSHMfBsKtyd7To3rWbCvMzLhHLAgyXENjVJPrgkoYCiiNVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0090.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::31) To CY4PR1201MB0181.namprd12.prod.outlook.com
 (2603:10b6:910:1f::11)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR01CA0090.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 07:45:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec72b739-143e-4f24-1917-08d983e63ef1
X-MS-TrafficTypeDiagnostic: CY4PR12MB1912:
X-Microsoft-Antispam-PRVS: <CY4PR12MB191235CDB8FF8DA594E61ED083AA9@CY4PR12MB1912.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZJFS4Mg4yhBt1LLtGGbI8FtnC2KMQB44gQhWGd3QQTZNEltQ0YxrJZtZ7agO2N5KjAbITD2hjoGuLwI3bvSk3cojXTkrUX97b517PqRGtGC4FA0k/6O9zT6dHoVUNi+EseY2OP4hNJu+6WTdknXFz7ilmGVW9SXzAfQBarJfHdjcfG/+l9K2JWmNKKak4ihQM1+zNHb9wVpMO56Y3exsHm9Xf8W2W2EbW+35x23NGGVGIkPoIDNy6Y/jLW2DhTkx216htzVp0PNRXVaviM9LvCA0PUVBDSynmvQmxMTg3nRcwbFh/AJMdMuwCfDXHpzZkcRBSBxP8Pd5mio8Bmvu2iGBb/k6Ai7l63vMh5HQCUjGuTiG6cRx1qe0j3YSsIvwd5pCBbRLDzH5FtKoiMWR2V1vwk8c15XdkK2BYd0UqrxTyM22vT8ZWSfObsMQ/S69A5Y4W2yhckHmdT7TUGmnPc/B3zs1ZpCCwg34fPCwV0x8T47ObY9In4QM6UBmAndaEv405WlOnQLOds/KW1qE4flmkE34T1Emz5X8UMB44PPXbpOXszBTvmmeJ3NYn1I9YITD/36MDU+xblxqi3ajKM/cPQmLLkSQjaKdwdcIbQEckmBbvp5U4Huq0Pj664QqUbU4x85jKXzlG/yYtq2qVuKl6sHJihPSI4lQBuXdaJJRGjdf3I/DqdzOUg/oLV5/ITU32vIuSkLz/ovKa7DhMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(8936002)(66946007)(6486002)(66556008)(508600001)(66476007)(16576012)(38100700002)(316002)(31686004)(26005)(30864003)(6916009)(66574015)(956004)(5660300002)(8676002)(83380400001)(2616005)(186003)(86362001)(4326008)(31696002)(2906002)(36756003)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0VDWHl0ZHRHYkpjL3pwM1pVOUJwTkw4V1M2ZUI1Mmk4cGR2WGlRYkM1NzM4?=
 =?utf-8?B?NVJ6aEFENlNEcTZwT2dZT1UwTkJRRzR5aUlkRjZvd3JVak9rWUp4OGlzZzNu?=
 =?utf-8?B?OEtZSklDZUVLTFlEZTd3bTVyUHE0YWNuRUh2ZHZPd3AxNGpZN2s5K0xtUytP?=
 =?utf-8?B?VUxnZmhkUDBJOFpMUzV6TVhub1JOTSt3bzlORU13anBMcnlxOGtGVWNIV21y?=
 =?utf-8?B?TFY5eWVyZDZqSEZka0pJcElVa1RhbnRSeDFURVFOcGVzcUtzcFU4NmxDSWdO?=
 =?utf-8?B?MWZGMUR2Vi9rNkh2eEMxaDhOakN6M0pzMnFyZlNIM1RBcG91dmFpbGdoM25m?=
 =?utf-8?B?Rk0zbG00TCsySnRDYUVyZzQ2N2lFSEJZSXdyRmxDZHNkOFZnNXU4Tlg1MnU5?=
 =?utf-8?B?K2IyMXJUdVF2MUFZMWNOVkxsWXdnZ3B6TC9sMXB1bVhCNHphclR2KzhUaGQ1?=
 =?utf-8?B?UXg3T3pxSGhuTThqN21aT3l1L0tNdUFOY0FFN2dlR0tEZkRsRUo2MTNHWkM4?=
 =?utf-8?B?YXJrT3FKSzYvVW5pMXlVRUZUUi9lbnliNHNYd1VHdXdNU1JFRStXdnBRcTVx?=
 =?utf-8?B?V1JCaDVxUXlFa05SNzc1UmQwRTNJZEo2cWVXblJDRFNXNld6SU5iL0xwVjQy?=
 =?utf-8?B?cXF5U1lHOU5RWFFtM3V1ejc5SU9KK2RFRkRGMWxBTnBMT2ZER3JRQ0VZWDc4?=
 =?utf-8?B?RVBEQ3phSEhsSjhGRHdjZkM5MTY4Ylc2MlB5T3VZS2hFRTJqeDFTZ1JvVkVq?=
 =?utf-8?B?M05BdDQ0OUlEQW1rdGpzWHhIWmFlVG9jMElFOGF4UHNHcDlRMHhDT2lLN3Zz?=
 =?utf-8?B?QnFaWkdKaCtEK3N4U0ZrMlloZmJiZGlaQUhobnp2dW04RTU3NTNDbmlTWDhU?=
 =?utf-8?B?T3l5OE5pS0ltRjQ2RlZWV2ZQZEVmS0QvR2lBN3l2NlNiclppTUZteitqVExm?=
 =?utf-8?B?dUMrTWpIUW95aXBIN3NvNEZKSTJVVkxiUEl2eHVodWhTUHVRa1VmalZmRDN5?=
 =?utf-8?B?NjNNcVlnaGxpVHA2Q0V1SnVJd3FHOGtUeXc3LzAzYUgxNlNsTDNoZldueExr?=
 =?utf-8?B?N000MDcwZDNCdTdvUjhmeFNHYWE4N2NnMy9WWW5ndGM5VTZHenFpWDhaa29O?=
 =?utf-8?B?YWlhY3JqejRCZnlQRG9IbkRUOUVqazRaS3JnV1M3MTdEWmY4cXpPN21UTWVL?=
 =?utf-8?B?RGlRMnR0TExBNnh1MUhuK0tMLzRrTVM0Yjc1dEVxa0F3SnZnL01QL3JiM1hF?=
 =?utf-8?B?Mnd2Q0kxdzVldkhnY1E3dlh2bFk3YXBlVE5lZi9DdFlkbXhrQUVCOGw4UEJt?=
 =?utf-8?B?Q0NTZmE4THlYUk1EaHpjREdMdmJ3dDlGVnZMdXpxOXQ3Qko2MUpSaDAwMHFa?=
 =?utf-8?B?SGx0Z2dldUxoQTNISnZpemVPNmtJUW5jclBXTEhiVVN6Q1YyQXNrRWVzT0Jh?=
 =?utf-8?B?UTJkRTg5aHZ1OWtzVTZxNTJlbzhHZjNTSUoyRFlSclpJemdzZ2xEN1J2NXRR?=
 =?utf-8?B?cm5MZE1KSjlmdDQzZjRBZURWUmFiR00rSURJNWdNTVV6dDRvVlRyNmwxeVpa?=
 =?utf-8?B?aGZPY3VUVmk2ZmxKVHhOMisrL2FnZUY5UmtiUmhSVmJXL05qUENyajFEM1Jw?=
 =?utf-8?B?NWZTbzMrMkhYZnFJRTF3VERkNFFoZHplSHFMN0U4ZUJGU1hlVUczeHBQOTlF?=
 =?utf-8?B?VzAzK2RkR2EveGpIS0IwenpxeklNL000WjEwZ1VNdkt0Q2M5RlA0bEdlbkpW?=
 =?utf-8?Q?UnNN0ucKLhyBK5P/tXIZKpJKgYeOza5UUq8UFyp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec72b739-143e-4f24-1917-08d983e63ef1
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1201MB0181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:45:17.3589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NBhcnE/w9B5QW4WutPOKbc5jlYnRlyZ87Wwl6ndibLz+HMuM8EyRAPBlqi/Cf57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1912
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

Am 30.09.21 um 09:42 schrieb Matthew Auld:
> On Thu, 30 Sept 2021 at 08:28, Christian König <christian.koenig@amd.com> wrote:
>> I pushed those to drm-misc-next and fixed the i915 merge fallout in drm-tip.
>>
>> Maybe take another look at the resolution in drm-tip if you have time.
> Thanks, although it looks like there is some breakage in the build on drm-tip:
>
> drivers/gpu/drm/ttm/ttm_bo_util.c: In function ‘ttm_bo_move_memcpy’:
> drivers/gpu/drm/ttm/ttm_bo_util.c:172:44: error:
> ‘TTM_PAGE_FLAG_ZERO_ALLOC’ undeclared (first use in this function);
> did you mean ‘TTM_TT_FLAG_ZERO_ALLOC’?
> 172 | if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)))
>
> ...
>
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function ‘i915_ttm_move’:
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:576:44: error:
> ‘TTM_PAGE_FLAG_ZERO_ALLOC’ undeclared (first use in this function);
> did you mean ‘TTM_TT_FLAG_ZERO_ALLOC’?
> 576 | if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)))
> | ^~~~~~~~~~~~~~~~~~~~~~~~
> | TTM_TT_FLAG_ZERO_ALLOC
>

Crap, I hoped that I got all of those.

> Do we just need to revert the bad commit in drm-rerere, rebuild tip,
> and try again? If so I can try to attempt this.

Yes, please do so. I can't easily build drm-tip, would need to setup 
another box extra for this.

Christian.

>
>> Christian.
>>
>> Am 29.09.21 um 15:26 schrieb Matthew Auld:
>>> It covers more than just ttm_bo_type_sg usage, like with say dma-buf,
>>> since one other user is userptr in amdgpu, and in the future we might
>>> have some more. Hence EXTERNAL is likely a more suitable name.
>>>
>>> v2(Christian):
>>>     - Rename these to TTM_TT_FLAGS_*
>>>     - Fix up all the holes in the flag values
>>>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Acked-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 10 +++++-----
>>>    drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  6 +++---
>>>    drivers/gpu/drm/nouveau/nouveau_bo.c    |  4 ++--
>>>    drivers/gpu/drm/radeon/radeon_ttm.c     |  8 ++++----
>>>    drivers/gpu/drm/ttm/ttm_bo.c            |  4 ++--
>>>    drivers/gpu/drm/ttm/ttm_bo_util.c       |  4 ++--
>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c         |  2 +-
>>>    drivers/gpu/drm/ttm/ttm_pool.c          |  2 +-
>>>    drivers/gpu/drm/ttm/ttm_tt.c            | 24 ++++++++++++------------
>>>    include/drm/ttm/ttm_device.h            |  2 +-
>>>    include/drm/ttm/ttm_tt.h                | 18 +++++++++---------
>>>    11 files changed, 42 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index 60b12bb55244..e8d70b6e6737 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -894,7 +894,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>>>                        DRM_ERROR("failed to pin userptr\n");
>>>                        return r;
>>>                }
>>> -     } else if (ttm->page_flags & TTM_PAGE_FLAG_SG) {
>>> +     } else if (ttm->page_flags & TTM_TT_FLAG_EXTERNAL) {
>>>                if (!ttm->sg) {
>>>                        struct dma_buf_attachment *attach;
>>>                        struct sg_table *sgt;
>>> @@ -1130,7 +1130,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
>>>                return 0;
>>>        }
>>>
>>> -     if (ttm->page_flags & TTM_PAGE_FLAG_SG)
>>> +     if (ttm->page_flags & TTM_TT_FLAG_EXTERNAL)
>>>                return 0;
>>>
>>>        ret = ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
>>> @@ -1165,7 +1165,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
>>>                return;
>>>        }
>>>
>>> -     if (ttm->page_flags & TTM_PAGE_FLAG_SG)
>>> +     if (ttm->page_flags & TTM_TT_FLAG_EXTERNAL)
>>>                return;
>>>
>>>        for (i = 0; i < ttm->num_pages; ++i)
>>> @@ -1198,8 +1198,8 @@ int amdgpu_ttm_tt_set_userptr(struct ttm_buffer_object *bo,
>>>                        return -ENOMEM;
>>>        }
>>>
>>> -     /* Set TTM_PAGE_FLAG_SG before populate but after create. */
>>> -     bo->ttm->page_flags |= TTM_PAGE_FLAG_SG;
>>> +     /* Set TTM_TT_FLAG_EXTERNAL before populate but after create. */
>>> +     bo->ttm->page_flags |= TTM_TT_FLAG_EXTERNAL;
>>>
>>>        gtt = (void *)bo->ttm;
>>>        gtt->userptr = addr;
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> index f0a61a9474fc..8beef57ba52b 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> @@ -182,7 +182,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>>>
>>>        if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
>>>            man->use_tt)
>>> -             page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
>>> +             page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
>>>
>>>        ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags,
>>>                          i915_ttm_select_tt_caching(obj));
>>> @@ -451,7 +451,7 @@ static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
>>>                if (bo->type == ttm_bo_type_kernel)
>>>                        return -EINVAL;
>>>
>>> -             if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
>>> +             if (ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC))
>>>                        return 0;
>>>
>>>                intel_engine_pm_get(i915->gt.migrate.context->engine);
>>> @@ -525,7 +525,7 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>>>
>>>        /* Populate ttm with pages if needed. Typically system memory. */
>>>        if (bo->ttm && (dst_man->use_tt ||
>>> -                     (bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED))) {
>>> +                     (bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED))) {
>>>                ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
>>>                if (ret)
>>>                        return ret;
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> index 33dca2565cca..b2c7e0802ac3 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> @@ -1249,7 +1249,7 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
>>>        struct ttm_tt *ttm_dma = (void *)ttm;
>>>        struct nouveau_drm *drm;
>>>        struct device *dev;
>>> -     bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>>> +     bool slave = !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
>>>
>>>        if (ttm_tt_is_populated(ttm))
>>>                return 0;
>>> @@ -1272,7 +1272,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
>>>    {
>>>        struct nouveau_drm *drm;
>>>        struct device *dev;
>>> -     bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>>> +     bool slave = !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
>>>
>>>        if (slave)
>>>                return;
>>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
>>> index 7793249bc549..11b21d605584 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>>> @@ -545,14 +545,14 @@ static int radeon_ttm_tt_populate(struct ttm_device *bdev,
>>>    {
>>>        struct radeon_device *rdev = radeon_get_rdev(bdev);
>>>        struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
>>> -     bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>>> +     bool slave = !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
>>>
>>>        if (gtt && gtt->userptr) {
>>>                ttm->sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
>>>                if (!ttm->sg)
>>>                        return -ENOMEM;
>>>
>>> -             ttm->page_flags |= TTM_PAGE_FLAG_SG;
>>> +             ttm->page_flags |= TTM_TT_FLAG_EXTERNAL;
>>>                return 0;
>>>        }
>>>
>>> @@ -569,13 +569,13 @@ static void radeon_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm
>>>    {
>>>        struct radeon_device *rdev = radeon_get_rdev(bdev);
>>>        struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
>>> -     bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>>> +     bool slave = !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
>>>
>>>        radeon_ttm_tt_unbind(bdev, ttm);
>>>
>>>        if (gtt && gtt->userptr) {
>>>                kfree(ttm->sg);
>>> -             ttm->page_flags &= ~TTM_PAGE_FLAG_SG;
>>> +             ttm->page_flags &= ~TTM_TT_FLAG_EXTERNAL;
>>>                return;
>>>        }
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index 3b22c0013dbf..d62b2013c367 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -1115,8 +1115,8 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>>>                return -EBUSY;
>>>
>>>        if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
>>> -         bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
>>> -         bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED ||
>>> +         bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL ||
>>> +         bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED ||
>>>            !ttm_bo_get_unless_zero(bo)) {
>>>                if (locked)
>>>                        dma_resv_unlock(bo->base.resv);
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> index 1c5ffe2935af..82af095f6b81 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> @@ -103,7 +103,7 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
>>>
>>>        /* Don't move nonexistent data. Clear destination instead. */
>>>        if (src_ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm))) {
>>> -             if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
>>> +             if (ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC))
>>>                        return;
>>>
>>>                for (i = 0; i < num_pages; ++i) {
>>> @@ -150,7 +150,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>>>        struct ttm_kmap_iter *dst_iter, *src_iter;
>>>        int ret = 0;
>>>
>>> -     if (ttm && ((ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) ||
>>> +     if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
>>>                    dst_man->use_tt)) {
>>>                ret = ttm_tt_populate(bdev, ttm, ctx);
>>>                if (ret)
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index 9a2119fe4bdd..950f4f132802 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -162,7 +162,7 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>>>         * Refuse to fault imported pages. This should be handled
>>>         * (if at all) by redirecting mmap to the exporter.
>>>         */
>>> -     if (bo->ttm && (bo->ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>> +     if (bo->ttm && (bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>>>                dma_resv_unlock(bo->base.resv);
>>>                return VM_FAULT_SIGBUS;
>>>        }
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index c961a788b519..1bba0a0ed3f9 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -371,7 +371,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>        WARN_ON(!num_pages || ttm_tt_is_populated(tt));
>>>        WARN_ON(dma_addr && !pool->dev);
>>>
>>> -     if (tt->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)
>>> +     if (tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
>>>                gfp_flags |= __GFP_ZERO;
>>>
>>>        if (ctx->gfp_retry_mayfail)
>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>>> index 980ecb079b2c..86f31fde6e35 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>> @@ -68,12 +68,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
>>>        switch (bo->type) {
>>>        case ttm_bo_type_device:
>>>                if (zero_alloc)
>>> -                     page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
>>> +                     page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
>>>                break;
>>>        case ttm_bo_type_kernel:
>>>                break;
>>>        case ttm_bo_type_sg:
>>> -             page_flags |= TTM_PAGE_FLAG_SG;
>>> +             page_flags |= TTM_TT_FLAG_EXTERNAL;
>>>                break;
>>>        default:
>>>                pr_err("Illegal buffer object type\n");
>>> @@ -156,7 +156,7 @@ EXPORT_SYMBOL(ttm_tt_init);
>>>
>>>    void ttm_tt_fini(struct ttm_tt *ttm)
>>>    {
>>> -     WARN_ON(ttm->page_flags & TTM_PAGE_FLAG_PRIV_POPULATED);
>>> +     WARN_ON(ttm->page_flags & TTM_TT_FLAG_PRIV_POPULATED);
>>>
>>>        if (ttm->swap_storage)
>>>                fput(ttm->swap_storage);
>>> @@ -178,7 +178,7 @@ int ttm_sg_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>>>
>>>        ttm_tt_init_fields(ttm, bo, page_flags, caching);
>>>
>>> -     if (page_flags & TTM_PAGE_FLAG_SG)
>>> +     if (page_flags & TTM_TT_FLAG_EXTERNAL)
>>>                ret = ttm_sg_tt_alloc_page_directory(ttm);
>>>        else
>>>                ret = ttm_dma_tt_alloc_page_directory(ttm);
>>> @@ -224,7 +224,7 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>>>
>>>        fput(swap_storage);
>>>        ttm->swap_storage = NULL;
>>> -     ttm->page_flags &= ~TTM_PAGE_FLAG_SWAPPED;
>>> +     ttm->page_flags &= ~TTM_TT_FLAG_SWAPPED;
>>>
>>>        return 0;
>>>
>>> @@ -279,7 +279,7 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>>>
>>>        ttm_tt_unpopulate(bdev, ttm);
>>>        ttm->swap_storage = swap_storage;
>>> -     ttm->page_flags |= TTM_PAGE_FLAG_SWAPPED;
>>> +     ttm->page_flags |= TTM_TT_FLAG_SWAPPED;
>>>
>>>        return ttm->num_pages;
>>>
>>> @@ -300,7 +300,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>        if (ttm_tt_is_populated(ttm))
>>>                return 0;
>>>
>>> -     if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>> +     if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>>>                atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>>>                if (bdev->pool.use_dma32)
>>>                        atomic_long_add(ttm->num_pages,
>>> @@ -325,8 +325,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>        if (ret)
>>>                goto error;
>>>
>>> -     ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
>>> -     if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
>>> +     ttm->page_flags |= TTM_TT_FLAG_PRIV_POPULATED;
>>> +     if (unlikely(ttm->page_flags & TTM_TT_FLAG_SWAPPED)) {
>>>                ret = ttm_tt_swapin(ttm);
>>>                if (unlikely(ret != 0)) {
>>>                        ttm_tt_unpopulate(bdev, ttm);
>>> @@ -337,7 +337,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>        return 0;
>>>
>>>    error:
>>> -     if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>> +     if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>>>                atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>>>                if (bdev->pool.use_dma32)
>>>                        atomic_long_sub(ttm->num_pages,
>>> @@ -357,14 +357,14 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>>>        else
>>>                ttm_pool_free(&bdev->pool, ttm);
>>>
>>> -     if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>> +     if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>>>                atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>>>                if (bdev->pool.use_dma32)
>>>                        atomic_long_sub(ttm->num_pages,
>>>                                        &ttm_dma32_pages_allocated);
>>>        }
>>>
>>> -     ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
>>> +     ttm->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
>>>    }
>>>
>>>    #ifdef CONFIG_DEBUG_FS
>>> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
>>> index cbe03d45e883..0a4ddec78d8f 100644
>>> --- a/include/drm/ttm/ttm_device.h
>>> +++ b/include/drm/ttm/ttm_device.h
>>> @@ -65,7 +65,7 @@ struct ttm_device_funcs {
>>>         * ttm_tt_create
>>>         *
>>>         * @bo: The buffer object to create the ttm for.
>>> -      * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX flags.
>>> +      * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
>>>         *
>>>         * Create a struct ttm_tt to back data with system memory pages.
>>>         * No pages are actually allocated.
>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>> index 842ce756213c..b023cd58ff38 100644
>>> --- a/include/drm/ttm/ttm_tt.h
>>> +++ b/include/drm/ttm/ttm_tt.h
>>> @@ -38,17 +38,17 @@ struct ttm_resource;
>>>    struct ttm_buffer_object;
>>>    struct ttm_operation_ctx;
>>>
>>> -#define TTM_PAGE_FLAG_SWAPPED         (1 << 4)
>>> -#define TTM_PAGE_FLAG_ZERO_ALLOC      (1 << 6)
>>> -#define TTM_PAGE_FLAG_SG              (1 << 8)
>>> +#define TTM_TT_FLAG_SWAPPED  (1 << 0)
>>> +#define TTM_TT_FLAG_ZERO_ALLOC       (1 << 1)
>>> +#define TTM_TT_FLAG_EXTERNAL (1 << 2)
>>>
>>> -#define TTM_PAGE_FLAG_PRIV_POPULATED  (1 << 31)
>>> +#define TTM_TT_FLAG_PRIV_POPULATED  (1 << 31)
>>>
>>>    /**
>>>     * struct ttm_tt
>>>     *
>>>     * @pages: Array of pages backing the data.
>>> - * @page_flags: see TTM_PAGE_FLAG_*
>>> + * @page_flags: see TTM_TT_FLAG_*
>>>     * @num_pages: Number of pages in the page array.
>>>     * @sg: for SG objects via dma-buf
>>>     * @dma_address: The DMA (bus) addresses of the pages
>>> @@ -84,7 +84,7 @@ struct ttm_kmap_iter_tt {
>>>
>>>    static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
>>>    {
>>> -     return tt->page_flags & TTM_PAGE_FLAG_PRIV_POPULATED;
>>> +     return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
>>>    }
>>>
>>>    /**
>>> @@ -103,7 +103,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
>>>     *
>>>     * @ttm: The struct ttm_tt.
>>>     * @bo: The buffer object we create the ttm for.
>>> - * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX flags.
>>> + * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
>>>     * @caching: the desired caching state of the pages
>>>     *
>>>     * Create a struct ttm_tt to back data with system memory pages.
>>> @@ -178,7 +178,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm);
>>>     */
>>>    static inline void ttm_tt_mark_for_clear(struct ttm_tt *ttm)
>>>    {
>>> -     ttm->page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
>>> +     ttm->page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
>>>    }
>>>
>>>    void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
>>> @@ -194,7 +194,7 @@ struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
>>>     *
>>>     * @bo: Buffer object we allocate the ttm for.
>>>     * @bridge: The agp bridge this device is sitting on.
>>> - * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX flags.
>>> + * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
>>>     *
>>>     *
>>>     * Create a TTM backend that uses the indicated AGP bridge as an aperture

