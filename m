Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BB060F3F2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 11:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036CC10E5B6;
	Thu, 27 Oct 2022 09:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D31310E0E5;
 Thu, 27 Oct 2022 09:45:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNzTKqgImVxNaxuZ+n4PUjz2MGPWje/uuHSGd6Xl+KUuMsK8QYYrXdu4VlXYWJ5bg/MmVj+Twrpk8vjwNJzTcZW2j8FTyqdJSz7X7XwkcBM7NYpYmjUSoMJAJ/vbw3gQfYTJOBV8fPBp97vA6YYp2CJsTZmierYLawRnM1EPeXElBEL1MJvDVow662egOecEPW31iLUXJfwENS1OoePHUaL/Jh51/v1cgvOUWiJbhvYM0zdVSqdDvL3tGgL+/WOjlyrvONqTCpxjUdP1/kaSi3hsbaZnNCYs7p0J4vdoCjTh7t7TVUJB4zkkGbiRGslLfODS/9me1zemvxGOkbb0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vR3zu9B77Eyfq041cbmXSOu2XbvWRWS4FSXgLPBcjNg=;
 b=Y3BZWXzjqC2AIO0LwWVrTioL2yn2vjqSg8ijNpoMACKdXNr41S/8O2ee3huzXx99Rrc4QwfPWqf+zSnqE0Kd9oqsSenEAo2OJ9/NnoLjOhazUB8LwU71dT5m+FUG74XzaPYphkapuK7Gohf9LbHM7daOWFm6Tc+95GUDxjbBH1JLHMnxeO9SkvFgKnxpUwpTTlKKDxA29//ubjT1j4yZq2cSTvUxgZC64Kia7mSihBQBkd7QMF3hz46//vOtdUFFjMqV2O2bJflKeHMsOahuxStvNMvx9WLIdOfWO4TpbcikwJNgVLTlsnFAHWobN5VrUcbHWkaATC962faoU0NOqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vR3zu9B77Eyfq041cbmXSOu2XbvWRWS4FSXgLPBcjNg=;
 b=4LDxl4E79BFZz9dckWjrN8dO0jX2W0A9XTT0I24IxDRYPK2zHe9qLuBvR+e06+lMYDJXIbcNKjM1Ghlejr62pfncN71MBB5cfWUnV7zDrobbry2spMsYfw/ZRkb5+SIkemKbuv4t4zGzOHlvVroIGFu5f/B9RfMFzyH9WZX3n2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 09:45:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Thu, 27 Oct 2022
 09:45:45 +0000
Message-ID: <04cdeabb-1838-65d0-8464-a3ef45a9623f@amd.com>
Date: Thu, 27 Oct 2022 11:45:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] drm/ttm: rework on ttm_resource to use size_t type
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20221027091237.983582-1-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221027091237.983582-1-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c94511-02af-4df9-13d2-08dab80004dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FaeBiZLnW4V+gUipT+pDCm9ALJC+skLgYDFrLKiESRS51vZhs7eGHnbhGFyBsbibrgUx7eiwSW8E+r3ADEwa8uWN9aJO/I1lmxRaZrHNR9uAQ3bUvPejGCsHIQciXotdETm+n0cE5Dn1CP+8uCNBLeuN84NyidLz5E9EVepE32AghJz1hr8WHTCNh6dwEq6JVkNqC82XtWppSSk0hsCu4CCdjkXChzprt3myGV0S0CVoF+fahntZ5RqIeiT4pim4JDnVnuiDpQix9KEzoDZfo+OL9Sypv6gX3z4sZf50oz0XcOB5l7OMUozxot0SQdTNPezDwgJsfZQaJCJk/mJ57nNRnjs3XvrQ85Qs/zJPDIkTHhbIi+m1sDCJ/bgBaMdmV6FDTGixwwAfT6GMDzLiS+THCRUqE6emsiWjkXRo9n0ZPFElPs8PkbcmW59pGoAtwqwb6/PkkYb+xW/JcXdztkLkD+b0c9ge/+4OSihoMZl2TWJBP2MZXtN3VpR4z33IMxYKOI0GZjwKtnT98QYEjs/CgFfFHQELjneUmfqk9IJAtBkifz4v31ObMrY95EKcwhvgHOAy2kFBtRyWyR6Jc9IWYCekd0Wy/O9DENlXqJNNKT+TsnY5+Te88cPqXZ2v8Fd1PqR2/Ebug57z+wBY9p7mZ28s22TA3I4kitAOgFaNHsJ15+MeQP2QPhdMNEDgyOmN30Tnyg0bDtlTMU/A+7FCyfBH71P1pvi7jxZGHLGgdwqEDc8FLDyEoQmrjTr4hdx3804U6ldXw8nn3x9jrhn8ICBl8bQw/0RfiMwbSnUN5XGafrkShi0iXSToH+sCb1KgwdrerbF7Innz3QnPOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(8936002)(5660300002)(30864003)(31686004)(316002)(186003)(2906002)(86362001)(41300700001)(66556008)(38100700002)(66946007)(4326008)(450100002)(2616005)(36756003)(66476007)(8676002)(26005)(31696002)(6506007)(83380400001)(6486002)(478600001)(6666004)(6512007)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlJ5NGY5TnFYQkM1YWJFTTMxeXhGL2hYMlFFT0FjREI1SDFmSjJVbEV0dy82?=
 =?utf-8?B?alE5MnpnTjRqRkd1aWhzVXIvUzdLTFZSQll5VldTYW1MdFQxcVd3SGNvNTZj?=
 =?utf-8?B?cnZXL2drZHpRR3pnU3JwcStwUjB6KzlBdnRaUUNWTnZpS0YxYzhxcmJFRmdz?=
 =?utf-8?B?bG9sSXd2U1dlSE8wOTNGeFZBaEc1QVJwNDVEa3dvWk5YRFJJOVMwQmRmRkJT?=
 =?utf-8?B?QUkveXVleUMxbUx6aXhKM3haMWlJKzdFa0VrOGRZYXM3aVdtY1cwczBUZU94?=
 =?utf-8?B?YUxtYndWU1c5YXJBWkJhZ0Z6TXJSTGE0bllrREJMVTFRdzNWajFVbHNXdm9U?=
 =?utf-8?B?SW4yeVNzcE40dGpVdC9FSmxtK0F4MjNkOGRQME1uNWdUZzEyRnFEYjZGRTAx?=
 =?utf-8?B?a2Z3SmI2UGp5ZXRQeVl2Q1dkM0svSTVVdzdnQ3AySXVPeUNKSDhhaGdlWDF6?=
 =?utf-8?B?dFV2ZEYzYjJOeEpkU3JFcjRmNFpGd0hjYmxmaW5jZFJoa3UvNjhBQm4vTEhm?=
 =?utf-8?B?WHNrN2ZGcWpENksraGVPRE5qYUlXM0dLVWl0bFl0blgvNXRnaTI1NFByK0Q2?=
 =?utf-8?B?cUZOaExrQVR4SlY2bk5JeWx2b2pHQ1JKREVYbmQ0T01qV3FwcXpvOUNISWpW?=
 =?utf-8?B?NDB1VUxjUDBWZGZ1Zy8rYlNNNHlMcllLQ0g0eVZSRXFzd3hSRlpieTVLM1Ja?=
 =?utf-8?B?eWhOQy9nUDJ4STRnb3h1TmJkZ2RYN3FlRXNueFQ4dUJxSFN2ZW95cDBQYXRB?=
 =?utf-8?B?V2FMSi9wTS9wRUl2VWpKTGs5SHZ1b1RwSjB3dm0zWklwVVpyQUU3bmtHUFFV?=
 =?utf-8?B?WnlOZ05SYlpnZVZRaTJ3Z1ZNbzZIUm9zSHJrbkpPR2VoSmhSZ21odGRYQ0tM?=
 =?utf-8?B?TzE5V3lQR2kwWmpxZXF1S3J2TXA4cnFYUjVQVUEvY21kR05OOEN4cTJheFRU?=
 =?utf-8?B?ZnBFL1pya2x0M21MUXVwTUFaaHpiWVpNSzA5YjVFL1hsNFZ4cmQvUFBKbHp0?=
 =?utf-8?B?Y0dPZ2RIcStPWjdrb2hnc09tKytZaDUyRFNqbmhoTlJSdlFEY05pekZiL1pt?=
 =?utf-8?B?b1lYL21TOGlocEhFZVpleWNuNjFSaStmU2lvUEZ0U2tISlRUZ3dVMlRFYVRy?=
 =?utf-8?B?OHkvLzB5VWY4R0FrWDRGWm1hanQ4bHlsbWNJb3Qwaklvck5rSnhuanVsMFcr?=
 =?utf-8?B?cjAwRTI1WWZTT2RENlBQdWJzamhmRFp0S0d0MEFwMGpnUWRKZHZ1ZEdkUTEr?=
 =?utf-8?B?RDZxODAvTHFSSmIyc2lHeXVFOHB6VFJEWVZCWVVIdXF4OTY2ZHJaZkpsTGY5?=
 =?utf-8?B?SmtBY2M3d3VTb2M5Y2RidjFYM0hiZ0NOdlZBU0JpcEVOWnZUZkl3SzZibVJL?=
 =?utf-8?B?bXpTNXQ0Z09NQ2pJRUtmcmkrN3kyNWhZK3Z1RW9LUXEyRWhoTldPM3h2UEE4?=
 =?utf-8?B?d0g3U2FPZmZrUFpldnowbjJIRVNhY3daRDIyRm9udHBzWHJrZHJFWDRuTlpM?=
 =?utf-8?B?alNOeEZ3ZFgxK0ZWU1RRVytkd2ZCaCtZc3ZpdVJ6VXduRGs1SlROYjJYdGd3?=
 =?utf-8?B?MzlBY3h6U25NQVVBanBJcmF1VFgzNERRdDZiTm1SOGlXWmpSWC9IV1JDM2h3?=
 =?utf-8?B?STRBZ1UyMmc0SE1HWU5CK08vMERxQlY5ZDFSWkNld3JzN0RiV1RWeGN3NmpG?=
 =?utf-8?B?bWNUdzVKN1B4bHFxVlNCcjdENXJmU1BjK0hNRmlyN2d6RWM1aGQ1OEZieWk5?=
 =?utf-8?B?Q09DOURhVXRMYjJoQUFDOWRKR0FaYk5jdXFueGw1K09kVGErc0RQR1lOVXlO?=
 =?utf-8?B?VC9peElZVGwzV0toaFhwZGhQOEdIcDNTMHZwczBWS0pmdGlSampLbHFlbmNV?=
 =?utf-8?B?V0FCTnByaVBsanlYUnRKZzJrRVJFSjZMNjZnVWhXWFFSenhGUEMvcmpLL1pn?=
 =?utf-8?B?ZTFzVkIrei9kNEdDRG5kU2pwWnFjMS9xRjBsOWQ3NWEwREVJUEhSaVJSRnI1?=
 =?utf-8?B?dTFWc2Y4SmR6U0syMi9mUVZGNG14L0dneWxoSU85U1VmTjRCZEp1cmZ2RUZJ?=
 =?utf-8?B?eTRLaHZQclh5QXBIZXNDNlVQeWo5eGV0UVJweHdiNVpzakE1c3Y4amEzZ0I4?=
 =?utf-8?Q?xsZHigEH5mmJj79TYTbTgAjGC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c94511-02af-4df9-13d2-08dab80004dd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 09:45:45.0579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxFwhGyO6Sqg8wWX+BgAeyfAEVZG0qMWS7IRTfJe8rf3YyJTbpOGdztJh+XS1RVt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6668
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
Cc: alexander.deucher@amd.com, arunpravin.paneerselvam@amd.com,
 shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.10.22 um 11:12 schrieb Somalapuram Amaranath:
> Change ttm_resource structure from num_pages to size_t size in bytes.
> v1 -> v2: change PFN_UP(dst_mem->size) to ttm->num_pages
> v1 -> v2: change bo->resource->size to bo->base.size at some places
> v1 -> v2: remove the local variable
> v1 -> v2: cleanup cmp_size_smaller_first()
> v2 -> v3: adding missing PFN_UP in ttm_bo_vm_fault_reserved
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

Pushed to drm-misc-next.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c    |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c     |  3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h |  4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h      |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c        |  6 +++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c   |  8 ++++----
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c        |  2 +-
>   drivers/gpu/drm/i915/i915_scatterlist.c        |  4 ++--
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c  | 12 ++++++------
>   drivers/gpu/drm/i915/intel_region_ttm.c        |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_bo.c           |  4 ++--
>   drivers/gpu/drm/nouveau/nouveau_bo0039.c       |  4 ++--
>   drivers/gpu/drm/nouveau/nouveau_bo5039.c       |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_bo74c1.c       |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_bo85b5.c       |  4 ++--
>   drivers/gpu/drm/nouveau/nouveau_bo9039.c       |  4 ++--
>   drivers/gpu/drm/nouveau/nouveau_bo90b5.c       |  4 ++--
>   drivers/gpu/drm/nouveau/nouveau_boa0b5.c       |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c          |  5 ++---
>   drivers/gpu/drm/nouveau/nouveau_mem.c          |  4 ++--
>   drivers/gpu/drm/nouveau/nouveau_ttm.c          |  2 +-
>   drivers/gpu/drm/radeon/radeon_cs.c             |  7 +++++--
>   drivers/gpu/drm/radeon/radeon_object.c         |  4 ++--
>   drivers/gpu/drm/radeon/radeon_trace.h          |  2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c            |  4 ++--
>   drivers/gpu/drm/ttm/ttm_bo.c                   |  3 ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c              |  6 +++---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c                |  4 ++--
>   drivers/gpu/drm/ttm/ttm_range_manager.c        |  2 +-
>   drivers/gpu/drm/ttm/ttm_resource.c             | 14 ++++++--------
>   drivers/gpu/drm/vmwgfx/vmwgfx_blit.c           |  4 ++--
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c             |  6 +++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c        |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c        |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c  |  6 +++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c            |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c     |  6 +++---
>   include/drm/ttm/ttm_resource.h                 |  4 ++--
>   38 files changed, 79 insertions(+), 81 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 1f3302aebeff..44367f03316f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -144,7 +144,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   		node->base.start = node->mm_nodes[0].start;
>   	} else {
>   		node->mm_nodes[0].start = 0;
> -		node->mm_nodes[0].size = node->base.num_pages;
> +		node->mm_nodes[0].size = PFN_UP(node->base.size);
>   		node->base.start = AMDGPU_BO_INVALID_OFFSET;
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 2e8f6cd7a729..974e85d8b6cc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -542,6 +542,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   		/* GWS and OA don't need any alignment. */
>   		page_align = bp->byte_align;
>   		size <<= PAGE_SHIFT;
> +
>   	} else if (bp->domain & AMDGPU_GEM_DOMAIN_GDS) {
>   		/* Both size and alignment must be a multiple of 4. */
>   		page_align = ALIGN(bp->byte_align, 4);
> @@ -776,7 +777,7 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
>   		return 0;
>   	}
>   
> -	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.resource->num_pages, &bo->kmap);
> +	r = ttm_bo_kmap(&bo->tbo, 0, PFN_UP(bo->tbo.base.size), &bo->kmap);
>   	if (r)
>   		return r;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index 6546552e596c..5c4f93ee0c57 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -62,7 +62,7 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   	if (!res)
>   		goto fallback;
>   
> -	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
> +	BUG_ON(start + size > res->size);
>   
>   	cur->mem_type = res->mem_type;
>   
> @@ -110,7 +110,7 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   	cur->size = size;
>   	cur->remaining = size;
>   	cur->node = NULL;
> -	WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
> +	WARN_ON(res && start + size > res->size);
>   	return;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index 5e6ddc7e101c..677ad2016976 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -127,7 +127,7 @@ TRACE_EVENT(amdgpu_bo_create,
>   
>   	    TP_fast_assign(
>   			   __entry->bo = bo;
> -			   __entry->pages = bo->tbo.resource->num_pages;
> +			   __entry->pages = PFN_UP(bo->tbo.resource->size);
>   			   __entry->type = bo->tbo.resource->mem_type;
>   			   __entry->prefer = bo->preferred_domains;
>   			   __entry->allow = bo->allowed_domains;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index dc262d2c2925..36066965346f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -381,7 +381,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>   	dst.offset = 0;
>   
>   	r = amdgpu_ttm_copy_mem_to_mem(adev, &src, &dst,
> -				       new_mem->num_pages << PAGE_SHIFT,
> +				       new_mem->size,
>   				       amdgpu_bo_encrypted(abo),
>   				       bo->base.resv, &fence);
>   	if (r)
> @@ -424,7 +424,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>   static bool amdgpu_mem_visible(struct amdgpu_device *adev,
>   			       struct ttm_resource *mem)
>   {
> -	u64 mem_size = (u64)mem->num_pages << PAGE_SHIFT;
> +	u64 mem_size = (u64)mem->size;
>   	struct amdgpu_res_cursor cursor;
>   	u64 end;
>   
> @@ -568,7 +568,7 @@ static int amdgpu_ttm_io_mem_reserve(struct ttm_device *bdev,
>   				     struct ttm_resource *mem)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
> -	size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
> +	size_t bus_size = (size_t)mem->size;
>   
>   	switch (mem->mem_type) {
>   	case TTM_PL_SYSTEM:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 73a517bcf5c1..18c1a173d187 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -439,7 +439,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   		/* Allocate blocks in desired range */
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
> -	remaining_size = (u64)vres->base.num_pages << PAGE_SHIFT;
> +	remaining_size = (u64)vres->base.size;
>   
>   	mutex_lock(&mgr->lock);
>   	while (remaining_size) {
> @@ -498,7 +498,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   		LIST_HEAD(temp);
>   
>   		trim_list = &vres->blocks;
> -		original_size = (u64)vres->base.num_pages << PAGE_SHIFT;
> +		original_size = (u64)vres->base.size;
>   
>   		/*
>   		 * If size value is rounded up to min_block_size, trim the last
> @@ -533,8 +533,8 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   			amdgpu_vram_mgr_block_size(block);
>   		start >>= PAGE_SHIFT;
>   
> -		if (start > vres->base.num_pages)
> -			start -= vres->base.num_pages;
> +		if (start > PFN_UP(vres->base.size))
> +			start -= PFN_UP(vres->base.size);
>   		else
>   			start = 0;
>   		vres->base.start = max(vres->base.start, start);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 4f861782c3e8..7a1e92c11946 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -649,7 +649,7 @@ bool i915_ttm_resource_mappable(struct ttm_resource *res)
>   	if (!i915_ttm_cpu_maps_iomem(res))
>   		return true;
>   
> -	return bman_res->used_visible_size == bman_res->base.num_pages;
> +	return bman_res->used_visible_size == PFN_UP(bman_res->base.size);
>   }
>   
>   static int i915_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
> index dcc081874ec8..114e5e39aa72 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
> @@ -158,7 +158,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>   						     u32 page_alignment)
>   {
>   	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
> -	const u64 size = res->num_pages << PAGE_SHIFT;
> +	const u64 size = res->size;
>   	const u32 max_segment = round_down(UINT_MAX, page_alignment);
>   	struct drm_buddy *mm = bman_res->mm;
>   	struct list_head *blocks = &bman_res->blocks;
> @@ -177,7 +177,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>   
>   	i915_refct_sgt_init(rsgt, size);
>   	st = &rsgt->table;
> -	if (sg_alloc_table(st, res->num_pages, GFP_KERNEL)) {
> +	if (sg_alloc_table(st, PFN_UP(res->size), GFP_KERNEL)) {
>   		i915_refct_sgt_put(rsgt);
>   		return ERR_PTR(-ENOMEM);
>   	}
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index e19452f0e100..7e611476c7a4 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -62,8 +62,8 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	if (place->fpfn || lpfn != man->size)
>   		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
> -	GEM_BUG_ON(!bman_res->base.num_pages);
> -	size = bman_res->base.num_pages << PAGE_SHIFT;
> +	GEM_BUG_ON(!bman_res->base.size);
> +	size = bman_res->base.size;
>   
>   	min_page_size = bman->default_page_size;
>   	if (bo->page_alignment)
> @@ -72,7 +72,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	GEM_BUG_ON(min_page_size < mm->chunk_size);
>   	GEM_BUG_ON(!IS_ALIGNED(size, min_page_size));
>   
> -	if (place->fpfn + bman_res->base.num_pages != place->lpfn &&
> +	if (place->fpfn + PFN_UP(bman_res->base.size) != place->lpfn &&
>   	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>   		unsigned long pages;
>   
> @@ -108,7 +108,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   		goto err_free_blocks;
>   
>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		u64 original_size = (u64)bman_res->base.num_pages << PAGE_SHIFT;
> +		u64 original_size = (u64)bman_res->base.size;
>   
>   		drm_buddy_block_trim(mm,
>   				     original_size,
> @@ -116,7 +116,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	}
>   
>   	if (lpfn <= bman->visible_size) {
> -		bman_res->used_visible_size = bman_res->base.num_pages;
> +		bman_res->used_visible_size = PFN_UP(bman_res->base.size);
>   	} else {
>   		struct drm_buddy_block *block;
>   
> @@ -228,7 +228,7 @@ static bool i915_ttm_buddy_man_compatible(struct ttm_resource_manager *man,
>   
>   	if (!place->fpfn &&
>   	    place->lpfn == i915_ttm_buddy_man_visible_size(man))
> -		return bman_res->used_visible_size == res->num_pages;
> +		return bman_res->used_visible_size == PFN_UP(res->size);
>   
>   	/* Check each drm buddy block individually */
>   	list_for_each_entry(block, &bman_res->blocks, link) {
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
> index 575d67bc6ffe..cf89d0c2a2d9 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -244,7 +244,7 @@ void intel_region_ttm_resource_free(struct intel_memory_region *mem,
>   	struct ttm_resource_manager *man = mem->region_private;
>   	struct ttm_buffer_object mock_bo = {};
>   
> -	mock_bo.base.size = res->num_pages << PAGE_SHIFT;
> +	mock_bo.base.size = res->size;
>   	mock_bo.bdev = &mem->i915->bdev;
>   	res->bo = &mock_bo;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 126b3c6e12f9..813937ad1dc2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -532,7 +532,7 @@ nouveau_bo_map(struct nouveau_bo *nvbo)
>   	if (ret)
>   		return ret;
>   
> -	ret = ttm_bo_kmap(&nvbo->bo, 0, nvbo->bo.resource->num_pages, &nvbo->kmap);
> +	ret = ttm_bo_kmap(&nvbo->bo, 0, PFN_UP(nvbo->bo.base.size), &nvbo->kmap);
>   
>   	ttm_bo_unreserve(&nvbo->bo);
>   	return ret;
> @@ -1236,7 +1236,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	} else {
>   		/* make sure bo is in mappable vram */
>   		if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA ||
> -		    bo->resource->start + bo->resource->num_pages < mappable)
> +		    bo->resource->start + PFN_UP(bo->resource->size) < mappable)
>   			return 0;
>   
>   		for (i = 0; i < nvbo->placement.num_placement; ++i) {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> index 7390132129fe..e2ce44adaa5c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> @@ -52,7 +52,7 @@ nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   	u32 src_offset = old_reg->start << PAGE_SHIFT;
>   	u32 dst_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, new_reg);
>   	u32 dst_offset = new_reg->start << PAGE_SHIFT;
> -	u32 page_count = new_reg->num_pages;
> +	u32 page_count = PFN_UP(new_reg->size);
>   	int ret;
>   
>   	ret = PUSH_WAIT(push, 3);
> @@ -62,7 +62,7 @@ nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   	PUSH_MTHD(push, NV039, SET_CONTEXT_DMA_BUFFER_IN, src_ctxdma,
>   			       SET_CONTEXT_DMA_BUFFER_OUT, dst_ctxdma);
>   
> -	page_count = new_reg->num_pages;
> +	page_count = PFN_UP(new_reg->size);
>   	while (page_count) {
>   		int line_count = (page_count > 2047) ? 2047 : page_count;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo5039.c b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
> index 4c75c7b3804c..c6cf3629a9f9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo5039.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
> @@ -41,7 +41,7 @@ nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   {
>   	struct nouveau_mem *mem = nouveau_mem(old_reg);
>   	struct nvif_push *push = chan->chan.push;
> -	u64 length = (new_reg->num_pages << PAGE_SHIFT);
> +	u64 length = new_reg->size;
>   	u64 src_offset = mem->vma[0].addr;
>   	u64 dst_offset = mem->vma[1].addr;
>   	int src_tiled = !!mem->kind;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
> index ed6c09d67840..9b7ba31fae13 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
> @@ -44,7 +44,7 @@ nv84_bo_move_exec(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   	if (ret)
>   		return ret;
>   
> -	PUSH_NVSQ(push, NV74C1, 0x0304, new_reg->num_pages << PAGE_SHIFT,
> +	PUSH_NVSQ(push, NV74C1, 0x0304, new_reg->size,
>   				0x0308, upper_32_bits(mem->vma[0].addr),
>   				0x030c, lower_32_bits(mem->vma[0].addr),
>   				0x0310, upper_32_bits(mem->vma[1].addr),
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
> index dec29b2d8bb2..a15a38a87a95 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
> @@ -44,10 +44,10 @@ nva3_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   	struct nvif_push *push = chan->chan.push;
>   	u64 src_offset = mem->vma[0].addr;
>   	u64 dst_offset = mem->vma[1].addr;
> -	u32 page_count = new_reg->num_pages;
> +	u32 page_count = PFN_UP(new_reg->size);
>   	int ret;
>   
> -	page_count = new_reg->num_pages;
> +	page_count = PFN_UP(new_reg->size);
>   	while (page_count) {
>   		int line_count = (page_count > 8191) ? 8191 : page_count;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo9039.c b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
> index 776b04976cdf..d2bb2687d401 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo9039.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
> @@ -42,10 +42,10 @@ nvc0_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   	struct nouveau_mem *mem = nouveau_mem(old_reg);
>   	u64 src_offset = mem->vma[0].addr;
>   	u64 dst_offset = mem->vma[1].addr;
> -	u32 page_count = new_reg->num_pages;
> +	u32 page_count = PFN_UP(new_reg->size);
>   	int ret;
>   
> -	page_count = new_reg->num_pages;
> +	page_count = PFN_UP(new_reg->size);
>   	while (page_count) {
>   		int line_count = (page_count > 2047) ? 2047 : page_count;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
> index 8499f58213e3..4618f4f5ab56 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
> @@ -37,10 +37,10 @@ nvc0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   	struct nvif_push *push = chan->chan.push;
>   	u64 src_offset = mem->vma[0].addr;
>   	u64 dst_offset = mem->vma[1].addr;
> -	u32 page_count = new_reg->num_pages;
> +	u32 page_count = PFN_UP(new_reg->size);
>   	int ret;
>   
> -	page_count = new_reg->num_pages;
> +	page_count = PFN_UP(new_reg->size);
>   	while (page_count) {
>   		int line_count = (page_count > 8191) ? 8191 : page_count;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
> index 575212472e7a..07a5c6302c98 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
> @@ -58,7 +58,7 @@ nve0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   				PITCH_IN, PAGE_SIZE,
>   				PITCH_OUT, PAGE_SIZE,
>   				LINE_LENGTH_IN, PAGE_SIZE,
> -				LINE_COUNT, new_reg->num_pages);
> +				LINE_COUNT, PFN_UP(new_reg->size));
>   
>   	PUSH_IMMD(push, NVA0B5, LAUNCH_DMA,
>   		  NVDEF(NVA0B5, LAUNCH_DMA, DATA_TRANSFER_TYPE, NON_PIPELINED) |
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index fab542a758ff..ac5793c96957 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -679,7 +679,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
>   		}
>   
>   		if (!nvbo->kmap.virtual) {
> -			ret = ttm_bo_kmap(&nvbo->bo, 0, nvbo->bo.resource->num_pages,
> +			ret = ttm_bo_kmap(&nvbo->bo, 0, PFN_UP(nvbo->bo.base.size),
>   					  &nvbo->kmap);
>   			if (ret) {
>   				NV_PRINTK(err, cli, "failed kmap for reloc\n");
> @@ -868,8 +868,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>   			if (unlikely(cmd != req->suffix0)) {
>   				if (!nvbo->kmap.virtual) {
>   					ret = ttm_bo_kmap(&nvbo->bo, 0,
> -							  nvbo->bo.resource->
> -							  num_pages,
> +							  PFN_UP(nvbo->bo.base.size),
>   							  &nvbo->kmap);
>   					if (ret) {
>   						WIND_RING(chan);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
> index 76f8edefa637..1fde3a5d7c32 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> @@ -115,7 +115,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
>   
>   	mutex_lock(&drm->master.lock);
>   	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", cli->mem->oclass, type, PAGE_SHIFT,
> -				 reg->num_pages << PAGE_SHIFT,
> +				 reg->size,
>   				 &args, sizeof(args), &mem->mem);
>   	mutex_unlock(&drm->master.lock);
>   	return ret;
> @@ -128,7 +128,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>   	struct nouveau_cli *cli = mem->cli;
>   	struct nouveau_drm *drm = cli->drm;
>   	struct nvif_mmu *mmu = &cli->mmu;
> -	u64 size = ALIGN(reg->num_pages << PAGE_SHIFT, 1 << page);
> +	u64 size = ALIGN(reg->size, 1 << page);
>   	int ret;
>   
>   	mutex_lock(&drm->master.lock);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 9602c30928f2..1469a88910e4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -139,7 +139,7 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
>   	mem = nouveau_mem(*res);
>   	ttm_resource_init(bo, place, *res);
>   	ret = nvif_vmm_get(&mem->cli->vmm.vmm, PTES, false, 12, 0,
> -			   (long)(*res)->num_pages << PAGE_SHIFT, &mem->vma[0]);
> +			   (long)(*res)->size, &mem->vma[0]);
>   	if (ret) {
>   		nouveau_mem_del(man, *res);
>   		return ret;
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
> index 446f7bae54c4..46a27ebf4588 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -400,8 +400,11 @@ static int cmp_size_smaller_first(void *priv, const struct list_head *a,
>   	struct radeon_bo_list *lb = list_entry(b, struct radeon_bo_list, tv.head);
>   
>   	/* Sort A before B if A is smaller. */
> -	return (int)la->robj->tbo.resource->num_pages -
> -		(int)lb->robj->tbo.resource->num_pages;
> +	if (la->robj->tbo.base.size > lb->robj->tbo.base.size)
> +		return 1;
> +	if (la->robj->tbo.base.size < lb->robj->tbo.base.size)
> +		return -1;
> +	return 0;
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index 00c33b24d5d3..10c0fbd9d2b4 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -232,7 +232,7 @@ int radeon_bo_kmap(struct radeon_bo *bo, void **ptr)
>   		}
>   		return 0;
>   	}
> -	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.resource->num_pages, &bo->kmap);
> +	r = ttm_bo_kmap(&bo->tbo, 0, PFN_UP(bo->tbo.base.size), &bo->kmap);
>   	if (r) {
>   		return r;
>   	}
> @@ -737,7 +737,7 @@ vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	if (bo->resource->mem_type != TTM_PL_VRAM)
>   		return 0;
>   
> -	size = bo->resource->num_pages << PAGE_SHIFT;
> +	size = bo->resource->size;
>   	offset = bo->resource->start << PAGE_SHIFT;
>   	if ((offset + size) <= rdev->mc.visible_vram_size)
>   		return 0;
> diff --git a/drivers/gpu/drm/radeon/radeon_trace.h b/drivers/gpu/drm/radeon/radeon_trace.h
> index c9fed5f2b870..22676617e1a5 100644
> --- a/drivers/gpu/drm/radeon/radeon_trace.h
> +++ b/drivers/gpu/drm/radeon/radeon_trace.h
> @@ -22,7 +22,7 @@ TRACE_EVENT(radeon_bo_create,
>   
>   	    TP_fast_assign(
>   			   __entry->bo = bo;
> -			   __entry->pages = bo->tbo.resource->num_pages;
> +			   __entry->pages = PFN_UP(bo->tbo.resource->size);
>   			   ),
>   	    TP_printk("bo=%p, pages=%u", __entry->bo, __entry->pages)
>   );
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index d33fec488713..fff48306c05f 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -181,7 +181,7 @@ static int radeon_move_blit(struct ttm_buffer_object *bo,
>   
>   	BUILD_BUG_ON((PAGE_SIZE % RADEON_GPU_PAGE_SIZE) != 0);
>   
> -	num_pages = new_mem->num_pages * (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
> +	num_pages = PFN_UP(new_mem->size) * (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
>   	fence = radeon_copy(rdev, old_start, new_start, num_pages, bo->base.resv);
>   	if (IS_ERR(fence))
>   		return PTR_ERR(fence);
> @@ -268,7 +268,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   static int radeon_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
>   {
>   	struct radeon_device *rdev = radeon_get_rdev(bdev);
> -	size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
> +	size_t bus_size = (size_t)mem->size;
>   
>   	switch (mem->mem_type) {
>   	case TTM_PL_SYSTEM:
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 7c8e8be774f1..c3f4b33136e5 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -51,9 +51,6 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
>   	struct ttm_resource_manager *man;
>   	int i, mem_type;
>   
> -	drm_printf(&p, "No space for %p (%lu pages, %zuK, %zuM)\n",
> -		   bo, bo->resource->num_pages, bo->base.size >> 10,
> -		   bo->base.size >> 20);
>   	for (i = 0; i < placement->num_placement; i++) {
>   		mem_type = placement->placement[i].mem_type;
>   		drm_printf(&p, "  placement[%d]=0x%08X (%d)\n",
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index fa04e62202c1..ba3aa0a0fc43 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -173,7 +173,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   
>   	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
>   	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
> -		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
> +		ttm_move_memcpy(clear, ttm->num_pages, dst_iter, src_iter);
>   
>   	if (!src_iter->ops->maps_tt)
>   		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem);
> @@ -357,9 +357,9 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
>   
>   	map->virtual = NULL;
>   	map->bo = bo;
> -	if (num_pages > bo->resource->num_pages)
> +	if (num_pages > PFN_UP(bo->resource->size))
>   		return -EINVAL;
> -	if ((start_page + num_pages) > bo->resource->num_pages)
> +	if ((start_page + num_pages) > PFN_UP(bo->resource->size))
>   		return -EINVAL;
>   
>   	ret = ttm_mem_io_reserve(bo->bdev, bo->resource);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 38119311284d..5a3e4b891377 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -217,7 +217,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   	page_last = vma_pages(vma) + vma->vm_pgoff -
>   		drm_vma_node_start(&bo->base.vma_node);
>   
> -	if (unlikely(page_offset >= bo->resource->num_pages))
> +	if (unlikely(page_offset >= PFN_UP(bo->base.size)))
>   		return VM_FAULT_SIGBUS;
>   
>   	prot = ttm_io_prot(bo, bo->resource, prot);
> @@ -412,7 +412,7 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   		 << PAGE_SHIFT);
>   	int ret;
>   
> -	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->resource->num_pages)
> +	if (len < 1 || (offset + len) > bo->base.size)
>   		return -EIO;
>   
>   	ret = ttm_bo_reserve(bo, true, false, NULL);
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index f7c16c46cfbc..0a8bc0b7f380 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -83,7 +83,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>   
>   	spin_lock(&rman->lock);
>   	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
> -					  node->base.num_pages,
> +					  PFN_UP(node->base.size),
>   					  bo->page_alignment, 0,
>   					  place->fpfn, lpfn, mode);
>   	spin_unlock(&rman->lock);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index a729c32a1e48..328391bb1d87 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -177,7 +177,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   	struct ttm_resource_manager *man;
>   
>   	res->start = 0;
> -	res->num_pages = PFN_UP(bo->base.size);
> +	res->size = bo->base.size;
>   	res->mem_type = place->mem_type;
>   	res->placement = place->flags;
>   	res->bus.addr = NULL;
> @@ -192,7 +192,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   		list_add_tail(&res->lru, &bo->bdev->pinned);
>   	else
>   		list_add_tail(&res->lru, &man->lru[bo->priority]);
> -	man->usage += res->num_pages << PAGE_SHIFT;
> +	man->usage += res->size;
>   	spin_unlock(&bo->bdev->lru_lock);
>   }
>   EXPORT_SYMBOL(ttm_resource_init);
> @@ -214,7 +214,7 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
>   
>   	spin_lock(&bdev->lru_lock);
>   	list_del_init(&res->lru);
> -	man->usage -= res->num_pages << PAGE_SHIFT;
> +	man->usage -= res->size;
>   	spin_unlock(&bdev->lru_lock);
>   }
>   EXPORT_SYMBOL(ttm_resource_fini);
> @@ -665,17 +665,15 @@ ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
>   		iosys_map_set_vaddr(&iter_io->dmap, mem->bus.addr);
>   		iter_io->needs_unmap = false;
>   	} else {
> -		size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
> -
>   		iter_io->needs_unmap = true;
>   		memset(&iter_io->dmap, 0, sizeof(iter_io->dmap));
>   		if (mem->bus.caching == ttm_write_combined)
>   			iosys_map_set_vaddr_iomem(&iter_io->dmap,
>   						  ioremap_wc(mem->bus.offset,
> -							     bus_size));
> +							     mem->size));
>   		else if (mem->bus.caching == ttm_cached)
>   			iosys_map_set_vaddr(&iter_io->dmap,
> -					    memremap(mem->bus.offset, bus_size,
> +					    memremap(mem->bus.offset, mem->size,
>   						     MEMREMAP_WB |
>   						     MEMREMAP_WT |
>   						     MEMREMAP_WC));
> @@ -684,7 +682,7 @@ ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
>   		if (iosys_map_is_null(&iter_io->dmap))
>   			iosys_map_set_vaddr_iomem(&iter_io->dmap,
>   						  ioremap(mem->bus.offset,
> -							  bus_size));
> +							  mem->size));
>   
>   		if (iosys_map_is_null(&iter_io->dmap)) {
>   			ret = -ENOMEM;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> index 09fe20e918f9..c52c7bf1485b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -483,8 +483,8 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
>   	d.src_addr = NULL;
>   	d.dst_pages = dst->ttm->pages;
>   	d.src_pages = src->ttm->pages;
> -	d.dst_num_pages = dst->resource->num_pages;
> -	d.src_num_pages = src->resource->num_pages;
> +	d.dst_num_pages = PFN_UP(dst->resource->size);
> +	d.src_num_pages = PFN_UP(src->resource->size);
>   	d.dst_prot = ttm_io_prot(dst, dst->resource, PAGE_KERNEL);
>   	d.src_prot = ttm_io_prot(src, src->resource, PAGE_KERNEL);
>   	d.diff = diff;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index 822251aaab0a..b0c1f5a0df0d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -194,7 +194,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
>   	int ret = 0;
>   
>   	place = vmw_vram_placement.placement[0];
> -	place.lpfn = bo->resource->num_pages;
> +	place.lpfn = PFN_UP(bo->resource->size);
>   	placement.num_placement = 1;
>   	placement.placement = &place;
>   	placement.num_busy_placement = 1;
> @@ -211,7 +211,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
>   	 * that situation.
>   	 */
>   	if (bo->resource->mem_type == TTM_PL_VRAM &&
> -	    bo->resource->start < bo->resource->num_pages &&
> +	    bo->resource->start < PFN_UP(bo->resource->size) &&
>   	    bo->resource->start > 0 &&
>   	    buf->base.pin_count == 0) {
>   		ctx.interruptible = false;
> @@ -352,7 +352,7 @@ void *vmw_bo_map_and_cache(struct vmw_buffer_object *vbo)
>   	if (virtual)
>   		return virtual;
>   
> -	ret = ttm_bo_kmap(bo, 0, bo->resource->num_pages, &vbo->map);
> +	ret = ttm_bo_kmap(bo, 0, PFN_UP(bo->base.size), &vbo->map);
>   	if (ret)
>   		DRM_ERROR("Buffer object map failed: %d.\n", ret);
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> index 79b30dc9d825..c5ed49241f9d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> @@ -427,7 +427,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
>   	 * Do a page by page copy of COTables. This eliminates slow vmap()s.
>   	 * This should really be a TTM utility.
>   	 */
> -	for (i = 0; i < old_bo->resource->num_pages; ++i) {
> +	for (i = 0; i < PFN_UP(old_bo->resource->size); ++i) {
>   		bool dummy;
>   
>   		ret = ttm_bo_kmap(old_bo, i, 1, &old_map);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index f085dbd4736d..2fb53aa57a56 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -1047,7 +1047,7 @@ static int vmw_query_bo_switch_prepare(struct vmw_private *dev_priv,
>   
>   	if (unlikely(new_query_bo != sw_context->cur_query_bo)) {
>   
> -		if (unlikely(new_query_bo->base.resource->num_pages > 4)) {
> +		if (unlikely(PFN_UP(new_query_bo->base.resource->size) > 4)) {
>   			VMW_DEBUG_USER("Query buffer too large.\n");
>   			return -EINVAL;
>   		}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> index 60e3cc537f36..abd5e3323ebf 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -71,7 +71,7 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
>   	spin_lock(&gman->lock);
>   
>   	if (gman->max_gmr_pages > 0) {
> -		gman->used_gmr_pages += (*res)->num_pages;
> +		gman->used_gmr_pages += PFN_UP((*res)->size);
>   		/*
>   		 * Because the graphics memory is a soft limit we can try to
>   		 * expand it instead of letting the userspace apps crash.
> @@ -114,7 +114,7 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
>   	return 0;
>   
>   nospace:
> -	gman->used_gmr_pages -= (*res)->num_pages;
> +	gman->used_gmr_pages -= PFN_UP((*res)->size);
>   	spin_unlock(&gman->lock);
>   	ida_free(&gman->gmr_ida, id);
>   	ttm_resource_fini(man, *res);
> @@ -129,7 +129,7 @@ static void vmw_gmrid_man_put_node(struct ttm_resource_manager *man,
>   
>   	ida_free(&gman->gmr_ida, res->start);
>   	spin_lock(&gman->lock);
> -	gman->used_gmr_pages -= res->num_pages;
> +	gman->used_gmr_pages -= PFN_UP(res->size);
>   	spin_unlock(&gman->lock);
>   	ttm_resource_fini(man, res);
>   	kfree(res);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 214829c32ed8..46c2642b3ec5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -587,7 +587,7 @@ vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
>   
>   			cm_bo = vcp->cursor_mob[cursor_mob_idx];
>   
> -			if (cm_bo->resource->num_pages * PAGE_SIZE < size) {
> +			if (cm_bo->resource->size < size) {
>   				ret = -EINVAL;
>   				goto error_bo_unmap;
>   			}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
> index 7bc99b1279f7..f41f041559f4 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
> @@ -230,7 +230,7 @@ void vmw_bo_dirty_unmap(struct vmw_buffer_object *vbo,
>   int vmw_bo_dirty_add(struct vmw_buffer_object *vbo)
>   {
>   	struct vmw_bo_dirty *dirty = vbo->dirty;
> -	pgoff_t num_pages = vbo->base.resource->num_pages;
> +	pgoff_t num_pages = PFN_UP(vbo->base.resource->size);
>   	size_t size;
>   	int ret;
>   
> @@ -395,7 +395,7 @@ vm_fault_t vmw_bo_vm_mkwrite(struct vm_fault *vmf)
>   		return ret;
>   
>   	page_offset = vmf->pgoff - drm_vma_node_start(&bo->base.vma_node);
> -	if (unlikely(page_offset >= bo->resource->num_pages)) {
> +	if (unlikely(page_offset >= PFN_UP(bo->resource->size))) {
>   		ret = VM_FAULT_SIGBUS;
>   		goto out_unlock;
>   	}
> @@ -438,7 +438,7 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
>   
>   		page_offset = vmf->pgoff -
>   			drm_vma_node_start(&bo->base.vma_node);
> -		if (page_offset >= bo->resource->num_pages ||
> +		if (page_offset >= PFN_UP(bo->resource->size) ||
>   		    vmw_resources_clean(vbo, page_offset,
>   					page_offset + PAGE_SIZE,
>   					&allowed_prefault)) {
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 5afc6d664fde..78a226eba953 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -197,7 +197,7 @@ struct ttm_bus_placement {
>    * struct ttm_resource
>    *
>    * @start: Start of the allocation.
> - * @num_pages: Actual size of resource in pages.
> + * @size: Actual size of resource in bytes.
>    * @mem_type: Resource type of the allocation.
>    * @placement: Placement flags.
>    * @bus: Placement on io bus accessible to the CPU
> @@ -208,7 +208,7 @@ struct ttm_bus_placement {
>    */
>   struct ttm_resource {
>   	unsigned long start;
> -	unsigned long num_pages;
> +	size_t size;
>   	uint32_t mem_type;
>   	uint32_t placement;
>   	struct ttm_bus_placement bus;

