Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BC566D1F6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 23:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A73910E15A;
	Mon, 16 Jan 2023 22:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2071.outbound.protection.outlook.com [40.107.100.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A1910E0CD;
 Mon, 16 Jan 2023 22:51:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbScIEFbeeM975dkJoZ30Wb1wgcLde2b7uSBBjFAm5SU2b+pWX09unZwff9y4HaM7gb1bELrlxIsZoHa7OVk9Zcp+MReHWjTcROf2QH7dn+HXweMnCTvSCRK8U8Oo+lEnJpTY5mR2FPNvNUBEu2i//ip8v3/FUHCiA1eBU5XRH/BM1ODL3RcfsIWYO+k4qhWgaUOWemvLXpktRKGk3ZWrht6X9qNiIrzzx6AWn+44RpRtc5g7qZpeuHf2BWZrgjL1hfszu3jMvTf2y+PTB7B3zbOxzpmYKCLAMfB4s3lwWoPW8MP0RsHY4Oxk4DSJM10ZLMXyZO4VAMZrbjs2YvoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZwLsnXr/LQvGt6Mf09lGfiQ+CBG7nNxvKhpKlPm0C4=;
 b=iPQJ2UGIjlnElq8yoPrIRCbHqlH9+bdSN07feI88N27y0jz0zlCvxEXsGycdNFPZoUr8Rj+CH2okJkRaKpf4ws2Od4c9xcatsmTNPXNH6YoDcbIZmU2lZ78fjxAzyqoujvMkpBqYJsL4ptKmEh1DBTuaWd33YR5zG68NvGZcQRbZcttP01aBUab49T06tAnALq2jYjf5Aq+np2DGvQ3FlxViEqmzS0WLEhJgU4t2Ldt5GeZVPPMW7SIlwTp25PELr8Gb1T1U3camv42hlgb/r3UhseWQGtAvzvd2cTtAdJYIDgSAU/7oQQnIwwzKgfnLDfjiyPMTgDBBLGG25wv6Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZwLsnXr/LQvGt6Mf09lGfiQ+CBG7nNxvKhpKlPm0C4=;
 b=iHgIqXFMkmqfp2Ix+pToSxCwhdTwOKE5C6wLR7Ig2jqk9BuKGBJ3GqGkHsd0tQ+RFzZm+uyRtmclxPT/03XheqHBgfy8E82+gCsH6kCx0OlsQnqmjehfKARTWjP0omMkIR6GWJq5fGWhfonOKGworvP/9ROMp4yjd/0LEL1yqW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BL1PR12MB5777.namprd12.prod.outlook.com (2603:10b6:208:390::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 22:51:19 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411%4]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 22:51:19 +0000
Message-ID: <85b8ba83-b3e0-25f4-7412-3f3ed5ab7de1@amd.com>
Date: Mon, 16 Jan 2023 17:51:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/6] drm/amdgpu: Attach eviction fence on alloc
Content-Language: en-US
To: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-5-Felix.Kuehling@amd.com>
 <SN1PR12MB257598437BD1C41AF6E23169E3C19@SN1PR12MB2575.namprd12.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <SN1PR12MB257598437BD1C41AF6E23169E3C19@SN1PR12MB2575.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR18CA0012.namprd18.prod.outlook.com
 (2603:10b6:610:4f::22) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BL1PR12MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: b458b6b9-9a41-4c29-0c7f-08daf8142edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qvvUBfBuDEWToi6+T7sR0frkSSl1SqV+W9SwIrcmwNv47oWsLhvbB5hVIOZWRxUDKKcPatbCQqGPC1y+pSTNAMYOlkTujSKVxnIxNkILJHR+Yg2wjusHcwQCFfPWuUc+W+pJ9d5wnGhGeWpd3PMXzaLrAoLEnw8+aF7Lo9GPaaDQchtjVQ+XMESNcq5ZmJb+u2xZodcCViTM1DsTr2UcoIokR+1maWPCPcEhdv6X437usUvicK+WoFbjm/WM5A+NhIdweMiy0Vvp3in0indlShJoOdE/1+AW//+QcR8YxznBzVyY3pIAp8jULj7YAKkqLVodH7fHDL92NxLCSOPjBm/Bx9a0h6FOUzsYXkiEGKRH5T6K/7F/Vn2KYROFE6MjC5zqOQn8pdvW4tbd1XCiCud0Y0j4NfBHBVrMFTgAqqN19Z8HtV4F8ySToSVIXbytOjENP5/FiUGlc6B3yyKakdqvGsF7jE4G3KlNpGNTF9YDOxUso6nUdJwpA3Fz4l68e/7xDpqZM1t9LXONq/xITWOIZp+drga2m41tILrTrDbXCLTBI0jiLINRsPgpaessRi3c/PDyX3pMIkfsFMvkcgnNwaXvDUVGGZk4NSruS8qf0vN/1MNkJWeR1ef5Ax3NTBmq9qLKpWFoChwSplQOfgT7GdLt4E8g/xYXKb+BqSculk6ZPPLU7OFCLsAgXRXiMpf/Mo9K5AH8UrzgQncBGHHW0Os+GP6gmHlcQJhL2Ec=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(6506007)(36756003)(26005)(53546011)(6512007)(186003)(6486002)(38100700002)(478600001)(36916002)(31696002)(83380400001)(2616005)(86362001)(44832011)(5660300002)(8936002)(31686004)(66946007)(66556008)(4326008)(316002)(450100002)(2906002)(66476007)(8676002)(110136005)(54906003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVpYVVhueGhXcGFQdU1vTzVlSjFFVzBGTlNRMUV1d1QrcnhoL0tFckowQ0FH?=
 =?utf-8?B?UElGZGZ2VDBCemhpVCtmamhrNkJiNTM2TWREd0lEdXV0UzB5Q0dSckttQ0xm?=
 =?utf-8?B?U2xOYldXbEFNK1psSllScXA1R29LT3grVGM1OUtnNUE4VEtOdEN6ZFJkRmVt?=
 =?utf-8?B?SHJNR2JWbVRnM25SUWNjL05uWnlXVUZXKzh1YS96Vjg2enB1c3h6aXNLWGM1?=
 =?utf-8?B?NzA0SnQyckRHRjJiVzVVSGVkMWRvNnBKaGFheXE5dVVKbyt2R1pzUUhvTEw1?=
 =?utf-8?B?RFhpNldSUUdiMjFHaFJSaWwyb1FGWWhwSmcyanNBVE53R0RRcUpWV0FzNkVx?=
 =?utf-8?B?MEE2cnpFbmNMaWtTa2svaVVHL1BlVDVSdGorR21zVGljMUtkWEp6RGxRc2Nn?=
 =?utf-8?B?NEQwdmZCWjBISHhoSHlxSktURXZWZGw4bmdVQVlLNlp4cUMwTUt2N2Z4VFlv?=
 =?utf-8?B?L1ZaVkYxZGRsQUh1RUFGNjdldDlVOTYzNENaa3YvMmZmL3FvR3R2SDd2RlZZ?=
 =?utf-8?B?ai80dkk3Z3d2YytPWmFSb0c0Z0w5N3BWNHYvR2dnb2ZKTG02YUN0RDNUL2xr?=
 =?utf-8?B?eWd6RXdOUitBdkJpU3kxQUtOZlU4ZXY3cS94VkpNNmlxM2hJbWlwUWI2Qi9J?=
 =?utf-8?B?MSswU1VLcEdjTXpSYkVvK2RwSTh1RVR6SG1jQmw1TUlQbTl4YlZrcSs3M2hX?=
 =?utf-8?B?d0gweGcra1pHSUg3RFR4OXJCSDZaYWx2RDBoN21PdjBnRmRwR0lDVUJYSUtF?=
 =?utf-8?B?S1QxRGRQUFhkYktpTW15dno3UG1rak9hNXRPYnZjSEU5WnBnQUlEOGVFQmdw?=
 =?utf-8?B?VlBLN0ZxME1xTTlPMVpORnpReVRTcUdvbnlSTVNtNCt6Sm5JalorTm9pSG5J?=
 =?utf-8?B?MzgrYVEyNHJWelNjQklEd0tCRm9qV1BiMG04UExURGhyRVRHOU9xS3BiRDkr?=
 =?utf-8?B?OXI5MnhTZmdPaFRlWXFDSGhsRGJLbEpZclJsYlk2MWtLM0lXd1J0VTdsYWxh?=
 =?utf-8?B?Znh1M1dYWGFDa005clF3RUFWTXZiSUJPOGxoTU5JMDF1VWVVdnpLOHBwYjA2?=
 =?utf-8?B?NklsS09hc3hRbTJtYWxsRFI0M21udmwveUJ4QXZEN3o3dFdib1BYMDMycGgv?=
 =?utf-8?B?aDNLaDV5d2tIU0E1WWpJdURnMktVdithKy81NUNuTlVYVGJhOW5yMkFobUNV?=
 =?utf-8?B?ZE1sNHh2L2szRWRqaGNYKzR1c0QzUTFxbXZyQzluaHEvMWVPNDhyQlJiV3cv?=
 =?utf-8?B?a2IxQS9zSUF6MGxCUkNDbHhXd1BjeGtyUXJQYzBSQ21TT1hkUGN2RC9lSmdK?=
 =?utf-8?B?YkFHV2V4S3EvRU9KYkhrMHN3ak51Y0w3WWhwbW1WSjl1VGtCL0JzVHVyMTd1?=
 =?utf-8?B?MW1OUkNOVnJhM01GbzdmdEpYS05LZUo1TDIwR05wUWN0TldWbkNOVjdwZUds?=
 =?utf-8?B?eG4vdWVWdlZ0cmtTVjhhL1krQWFjejkxUWt6SWtRbm9VSUhYREVtYUFxc0Qx?=
 =?utf-8?B?Z0huNnZHenRlcy9ZWEtzZkNkRWx2d2JoUjBnSWUyTlRhTEkrdytNYkt6Qm1L?=
 =?utf-8?B?QXlQOEs0ZmFJNjBVRURpc21wK1VVemJMT0pJMHhCMDlmbys4VVpEM0JmSUVF?=
 =?utf-8?B?NGpFUjNFdlhCQzNoMk1Palcrd3R1UU1NMTlxc2l4eFl6aWhvem9xTm5kSzl2?=
 =?utf-8?B?Ri9ENUlMWGpNOFRmK2Y2UW4yYVUraFgzVThZZU82ZStXWWVmaGZMdnBZcTAz?=
 =?utf-8?B?Ui9EcDcxRDR6R0dDSU9NZDlVOUxjS0NBcXJ3ZzBVWW9EdmZML1M3NERWeU03?=
 =?utf-8?B?Lzl2YWZLYVdMMWdBMnRMam4rZEhVOGxSeDV0eXViSEhIYnhVcTZXSW5nL0g3?=
 =?utf-8?B?SCt5RDRVUit2U3dOcHFHYSt1SFk5VjVHSDJxZkxydlRBNkFrSlUzZWJzZnBX?=
 =?utf-8?B?bm9IUXYvaHpaT1k1T1krOW5PYXlUL0RUOHBBek93bEh2Mmk0TDdtMFR3NHNO?=
 =?utf-8?B?MWVrd1RERUszdzNGNXpBYVN6RFlVZlY2S1NSUHE2ZGpJN2tpT2xNWTUvMmk0?=
 =?utf-8?B?eXZ4OHBwVjdHTmpGM2tCVXIyWmM2UkVSL3pwcVViUHhlS2Y4WEExUWVGMFJG?=
 =?utf-8?Q?bhHehe4Qky3vNvAznWW/7/+Xo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b458b6b9-9a41-4c29-0c7f-08daf8142edc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 22:51:19.7116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AqurOIIEHJjkF+EWOzULRmPhf9Cg3MQ3fTq1Ua6KWMlBU1qF650JFDILWUXHhC1Wo5Sj2j3paYQEcXT6+wiIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5777
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
Cc: "Chen, Xiaogang" <Xiaogang.Chen@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-16 17:11, Errabolu, Ramesh wrote:
> [AMD Official Use Only - General]
>
> Comment inline.
>
> Regards,
> Ramesh
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Felix Kuehling
> Sent: Thursday, January 12, 2023 7:02 AM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Chen, Xiaogang <Xiaogang.Chen@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: [PATCH 4/6] drm/amdgpu: Attach eviction fence on alloc
>
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Instead of attaching the eviction fence when a KFD BO is first mapped, attach it when it is allocated or imported. This in preparation to allow KFD BOs to be mapped using the render node API.
>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 63 ++++++++++---------
>   1 file changed, 32 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 5645103beed0..79213f476493 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -360,6 +360,24 @@ static int amdgpu_amdkfd_bo_validate(struct amdgpu_bo *bo, uint32_t domain,
>          return ret;
>   }
>
> +static int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
> +                                              uint32_t domain,
> +                                              struct dma_fence *fence)
> +{
> +       int ret = amdgpu_bo_reserve(bo, false);
> +
> +       if (ret)
> +               return ret;
> +
> +       ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
> +       if (!ret)
> Ramesh: Should space for fences be reserved before adding one.

Yes, I probably should. I think I fixed this in the later patch because 
I didn't see the problem until I fixed those other issues.


>
> +               dma_resv_add_fence(bo->tbo.base.resv, fence,
> +                                  DMA_RESV_USAGE_BOOKKEEP);
> +       amdgpu_bo_unreserve(bo);
> +
> +       return ret;
> +}
> +
>   static int amdgpu_amdkfd_validate_vm_bo(void *_unused, struct amdgpu_bo *bo)  {
>          return amdgpu_amdkfd_bo_validate(bo, bo->allowed_domains, false);
> @@ -1720,6 +1738,11 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>                  }
>                  bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
>                  bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
> +       } else {
> +               ret = amdgpu_amdkfd_bo_validate_and_fence(bo, domain,
> +                               &avm->process_info->eviction_fence->base);
> +               if (ret)
> +                       goto err_validate_bo;
>          }
>
>          if (offset)
> @@ -1729,6 +1752,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>
>   allocate_init_user_pages_failed:
>   err_pin_bo:
> +err_validate_bo:
>          remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
>          drm_vma_node_revoke(&gobj->vma_node, drm_priv);
>   err_node_allow:
> @@ -1804,10 +1828,6 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>          if (unlikely(ret))
>                  return ret;
>
> -       /* The eviction fence should be removed by the last unmap.
> -        * TODO: Log an error condition if the bo still has the eviction fence
> -        * attached
> -        */
>          amdgpu_amdkfd_remove_eviction_fence(mem->bo,
>                                          process_info->eviction_fence);
> Ramesh: Is it correct to call remove_eviction() unconditionally? This procedure applies to GTT and VRAM BO's only. Furthermore, the fence on these BO's has already been removed in the unmap_memory() call.

This patch removes the amdgpu_amdkfd_remove_eviction_fence from 
amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu. So we definitely need to do 
this here.

amdgpu_amdkfd_remove_eviction_fence uses dma_resv_replace_fences. If the 
specified fence is not found in the BO's reservation object, it is a 
no-op. So calling this unconditionally is safe.

Regards,
   Felix


>
>          pr_debug("Release VA 0x%llx - 0x%llx\n", mem->va,
> @@ -1931,19 +1951,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
>          if (unlikely(ret))
>                  goto out_unreserve;
>
> -       if (mem->mapped_to_gpu_memory == 0 &&
> -           !amdgpu_ttm_tt_get_usermm(bo->tbo.ttm)) {
> -               /* Validate BO only once. The eviction fence gets added to BO
> -                * the first time it is mapped. Validate will wait for all
> -                * background evictions to complete.
> -                */
> -               ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
> -               if (ret) {
> -                       pr_debug("Validate failed\n");
> -                       goto out_unreserve;
> -               }
> -       }
> -
>          list_for_each_entry(entry, &mem->attachments, list) {
>                  if (entry->bo_va->base.vm != avm || entry->is_mapped)
>                          continue;
> @@ -1970,10 +1977,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
>                           mem->mapped_to_gpu_memory);
>          }
>
> -       if (!amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) && !bo->tbo.pin_count)
> -               dma_resv_add_fence(bo->tbo.base.resv,
> -                                  &avm->process_info->eviction_fence->base,
> -                                  DMA_RESV_USAGE_BOOKKEEP);
>          ret = unreserve_bo_and_vms(&ctx, false, false);
>
>          goto out;
> @@ -1990,7 +1993,6 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
>                  struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv)  {
>          struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
> -       struct amdkfd_process_info *process_info = avm->process_info;
>          unsigned long bo_size = mem->bo->tbo.base.size;
>          struct kfd_mem_attachment *entry;
>          struct bo_vm_reservation_context ctx; @@ -2031,15 +2033,6 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
>                           mem->mapped_to_gpu_memory);
>          }
>
> -       /* If BO is unmapped from all VMs, unfence it. It can be evicted if
> -        * required.
> -        */
> -       if (mem->mapped_to_gpu_memory == 0 &&
> -           !amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm) &&
> -           !mem->bo->tbo.pin_count)
> -               amdgpu_amdkfd_remove_eviction_fence(mem->bo,
> -                                               process_info->eviction_fence);
> -
>   unreserve_out:
>          unreserve_bo_and_vms(&ctx, false, false);
>   out:
> @@ -2266,8 +2259,16 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>          amdgpu_sync_create(&(*mem)->sync);
>          (*mem)->is_imported = true;
>
> +       ret = amdgpu_amdkfd_bo_validate_and_fence(bo, (*mem)->domain,
> +                               &avm->process_info->eviction_fence->base);
> +       if (ret)
> +               goto err_remove_mem;
> +
>          return 0;
>
> +err_remove_mem:
> +       remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
> +       drm_vma_node_revoke(&obj->vma_node, drm_priv);
>   err_free_mem:
>          kfree(*mem);
>   err_put_obj:
> --
> 2.34.1
