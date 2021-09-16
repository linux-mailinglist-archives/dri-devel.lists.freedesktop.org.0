Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AAA40D36A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 08:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7366EAB9;
	Thu, 16 Sep 2021 06:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2044.outbound.protection.outlook.com [40.107.95.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE276EAB8;
 Thu, 16 Sep 2021 06:50:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGY7nZJ5LfRvc9SiDR9loB94QGVpGa0PK/R+hjWZPIo5aUeIgt7M7caAOraTzXZTtjgLSIvqbN6jpbAM9wWRBN4yBFrqIExGXIXi4/SiWm1prghiIy2dTqD7QqfOdJrOBom9LsXXS29JoBeKmTrFjE/nvMNX8SPY6l1ayWrdVg1AfEy8BSfnurHOE3yDWfu9v27uRkluJgwG5nrytBGm8Kr0dfHGU4ceyfbz/McTgiJmk9VAoOF4ZLzg5c4u7Ddg84Del9ZfkFuOnYFEd7nrp3COqFeClBdQXl63OLi2OeJ2ahVD5pdZDFGnjiohjYSPM804sh0SBAs7em/1AqwEJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=N1XfWC0MgyFnkU76WIN1w02ea3X2lLSNrkq/r8ZIgSc=;
 b=VNRI9wODEMZJUAGdnz33aOnJYbhW06zF4qA9vyA01PWg9DiB0cY2gg5gAzRLpGLfQTcyYVnqVoruzlZ3BUJm2W+IlYjjzqlZ/aNlUQJUjqlhPR6BL1Ba/pol0LzAtieNcwf+ufsHxF2e6dz7jPB3dcz8A/WtimcD3rr21MXVYsDxicrLQCjPxFnv0mxVrPCKcaGWQamajfncmcRAMp4+kMxg37qF+79mtHlqSicP9QSJLxjjXT6KHxq4BbiG1fU8lc1z06Q7OR19dJ1l/jOvelWqO+Xumak9ZM7QBWE+MsrArOvaJb6nUezA3mnwNKwIPoBgPlApl42C5YGZwJuYzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1XfWC0MgyFnkU76WIN1w02ea3X2lLSNrkq/r8ZIgSc=;
 b=ff3HfW5IB7FGXhcEJxYrtoCl6BvXhcRL75YcUzXYcEbSfTDdsbzBIrnd310Noa6eVxOqTjGF0bxwEgCoW0hohbJapyOhCHv4ooq+TeiQL+rozbbpoOa8gllzfXmtIJcTw2qk3lJ62EPXqzGFC1CzjCs7LkBpMFCezEbVWgJ+FA4=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 06:50:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 06:50:08 +0000
Subject: Re: [PATCH v3 04/12] drm/ttm: s/FLAG_SG/FLAG_EXTERNAL/
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210915185954.3114858-1-matthew.auld@intel.com>
 <20210915185954.3114858-4-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <011c7f2f-1e9d-128a-a567-1c9e320d9258@amd.com>
Date: Thu, 16 Sep 2021 08:50:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210915185954.3114858-4-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:208:14::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:208:14::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 06:50:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40af1da5-814f-4e1d-4465-08d978de3902
X-MS-TrafficTypeDiagnostic: MN2PR12MB3775:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3775738AC4AFA20404D608BF83DC9@MN2PR12MB3775.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xLSRghPr7ivqgjHGrI2UeDiui0iYVJxtBHC6HChAlzwkmBYflVQNa8iNFZ+SAJ6ffRUZ/s7ihxwph4Ah+GWKJH7belib+jMQUeQdyUgds/2fBeBujvOb1OHNCw2HTs4XyrzMk/4ms2uq0r9j53qsMS8B8g75yKAcySgl+7p55cGdwLSF170CW8z4qCCMLDiPunYLe1NklTiXQTkV/pYhARjywVRnqUi8/MUkU28HJrT6RxirWbfVLvt0j6RLqiupXJ8bcrcduBB5it6b+ykNe++RP9BVzI9l42aOpvw3j2AvYjBnq1Z5QOGmzVGDW9SiTRGtfeRJnlZz+qnIg0L4G3gXwYU0dIB2PFnFdmd+E3BZjB8cQB5KUy3Cqz/FiKbwjOBJ+O0IXlozJa6RVT/wIr+r6TXkXtxbSH+ynlOB5kWgg3hSMsrpK6DvSsY0k4Hi/reOW5iqcI8WYDh81DDak8eghPzGyTYS1gAOejMTR4yAHEOVO/34UOB6gSJhU3BrYsKfFIsWKuZG5ds7ZtHBuLHVxE9j0EPCS7BEokQnL8H6a7ZQJm9iIwTwT23/fK2TI3zR+aYidPR3cHmKh2tCHfruL1RxYWCOELg3sUcks13tZSIX0iYQ3zEuzFz71EgyImpAtQ68lO690t8bt6SnXUDnX6fgDmrvigP/MguOKuG2JbIAqIsrTyMCj8SB4SxHMWW71B32K1fU8jgcIWFSucj6Gwcqh23s42KP80h+NagZid7/UTalwlm0ciDfRrk2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(8936002)(5660300002)(38100700002)(66946007)(8676002)(86362001)(66574015)(66476007)(2906002)(6666004)(66556008)(186003)(956004)(2616005)(4326008)(31696002)(6486002)(31686004)(16576012)(316002)(508600001)(26005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elNpdkpSeVJPeW9XRTRCZDQwY2s0RFlHNUhuUncrbCtEQWZBZnlETG9Gem9J?=
 =?utf-8?B?ajJtUk5YbHY5eVl1YlUyU2ZGRVBTOW1OemZZbDY0dm9XUWVhSVkzYzAxME1a?=
 =?utf-8?B?SVNvNnE1T004OVRwbllWL0hNdWRjRVhRQm9jM0pjaUNOTTI1Vjh0Mm4ybG9N?=
 =?utf-8?B?d3hlcm9qd0IxaTNuRnZhVHpSQ3krRU9xWDhTcmIwOVBXVXdReHc0SlFQejlt?=
 =?utf-8?B?UjJBMTgyRGRqdDRwNWxTMXFzNzRwRzNJSEVDSXlWb2s5YytMbDlxSjc3dmFy?=
 =?utf-8?B?ako4cWlsczl0YVBtUVpBS0pwdkxsRDlwMzhjN3RGZkx5SEdlZ1lyeGNDZDVX?=
 =?utf-8?B?MUxTYVZGa2I2VWI3cXhIMHBQUTNTUURnSEdqbXRiWUEyL0k4NTlCK2p6SWsw?=
 =?utf-8?B?TlRoM29rVXFoOE1iZ0ZxVnJ2RzZ1Rm8rQkFNcEZyRzNsZlV5OWRJb2dIRlBQ?=
 =?utf-8?B?cFRZQytGbGY5UThQcjBWMStJb3pNZjdMVE9NSVVrK2VuSGJyWmFlYUs2bTFp?=
 =?utf-8?B?VjZ0UGhnZlF1YUp5TVhwWDI3S1FMdk5uRmZDY1hLc2R3T3l2QStlbFJwZVlY?=
 =?utf-8?B?ZFBLRUh6VXJqUm1LaXFpTHBZRHRCdjU5MEdxTkFPd0lxbDdzblFUcnpuSlhv?=
 =?utf-8?B?Q3I1b0dhTGZBWmVyM0dxVWJIdUROS3VwR3BHOEYwNGIyVHlab2ZXMmNwMnJV?=
 =?utf-8?B?SEEvNzJIM2xNTGRQTGp4VHFFTWlOVitjTkthQklyYWhFT09BSklsbFFjT1U4?=
 =?utf-8?B?dFdYc2VIZXhlUTFOZ08xT0ZNT2dTQ0FEK1pzY2tiYVJLeEMxYWNhKzc2TTcv?=
 =?utf-8?B?NUc4UzhpRURXeCtONkZZZVhFNERMZzVzRGtPSThJS3Brc1QzRGY3N05IekN1?=
 =?utf-8?B?a093RlcvOXQ5WCtMcTV6aFNkNENkdkV0YUxSZ29IM0ovemZwbnZIa2xxTFdE?=
 =?utf-8?B?dVJCZmxMQ3p5VGFvLytic1BhRm51YWVBWHYvSjdWeCtleHJqT3lraFlBZHli?=
 =?utf-8?B?TlBIV004NlU2dkhTeEFlRlRzNmZ6ck1jVHN3bk42MlhLVGl5Q09PU0dVdW51?=
 =?utf-8?B?QmxIQ2l3NEJoSDEyZDFHbitJWVJtb1cvRXUxM1JoQXZyRG9xdmFEb3h1bi9t?=
 =?utf-8?B?cSthaVN3WjYzSllKdW1zMElHN25MOEFGM1liZkRnazBtdmttYmp5RlZLKzJa?=
 =?utf-8?B?cUFhYkUzMEVUeUVJdWNZek9tcWFxNkJCQWlpMytmV1NtTU0yZE9wOGRPYitT?=
 =?utf-8?B?TS9XYVhFeFg3QTlzNW53emFrQW5yaDZ5azI0ZEZWM2ptZHJiNDhjQkhuZ25Y?=
 =?utf-8?B?U3VMcHV5ZlpIdWhmc2FGNSt4ak9TQmpTTm14UFFHaVQvemRFMVQzWmJLYUV1?=
 =?utf-8?B?L2dFS2xaZGNCMDA1Rks1eHlGNkYzQzFGNVNnQ0dtYmJmWloxaitzUjhLcjJq?=
 =?utf-8?B?SjdXcWRGdjBCRFovK255SkFMMTQ0c05qNUpjQkt1RXEyQ3Z3L2N1NTRpOWVU?=
 =?utf-8?B?Tk5XNGFpUW1ITFJOekR2cnZaQ1BJaXY2anIxUGVEeUVZYXdFbG12dVBoRk1h?=
 =?utf-8?B?VmZCM2MybjlBT281WFdRL1VGNTRMWG9Tc1YwUHFDTTdVNm9zaWFFWTd0ZFhO?=
 =?utf-8?B?THZzNzZJVUdRMDE4djNyVDVOam5Sdm55MmgwQjhQUUFwdjZKblRRSU5HNUNS?=
 =?utf-8?B?R1BhQmRNa3hyUThtd2ZxUGtGOFMvRlVwbXd6S0h1VDZaWm9LUVFrMU9YbEFL?=
 =?utf-8?Q?9kgOr13Ex/JPAv4ry9M9KKEnX8prSV9l5II01dG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40af1da5-814f-4e1d-4465-08d978de3902
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 06:50:08.6087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ln7HKu6iUCdwTikFc8ScuZDJ5PWhbilJfrEaT7wUgR1GMilhB8MVfsg+xiSOs4az
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3775
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



Am 15.09.21 um 20:59 schrieb Matthew Auld:
> It covers more than just ttm_bo_type_sg usage, like with say dma-buf,
> since one other user is userptr in amdgpu, and in the future we might
> have some more. Hence EXTERNAL is likely a more suitable name.
>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 10 +++++-----
>   drivers/gpu/drm/nouveau/nouveau_bo.c    |  4 ++--
>   drivers/gpu/drm/radeon/radeon_ttm.c     |  8 ++++----
>   drivers/gpu/drm/ttm/ttm_bo.c            |  2 +-
>   drivers/gpu/drm/ttm/ttm_bo_vm.c         |  2 +-
>   drivers/gpu/drm/ttm/ttm_tt.c            | 10 +++++-----
>   include/drm/ttm/ttm_tt.h                |  6 +++---
>   7 files changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c5fa6e62f6ca..a6d606f91dfd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -894,7 +894,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   			DRM_ERROR("failed to pin userptr\n");
>   			return r;
>   		}
> -	} else if (ttm->page_flags & TTM_PAGE_FLAG_SG) {
> +	} else if (ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL) {
>   		if (!ttm->sg) {
>   			struct dma_buf_attachment *attach;
>   			struct sg_table *sgt;
> @@ -1147,7 +1147,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
>   		return 0;
>   	}
>   
> -	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> +	if (ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL)
>   		return 0;
>   
>   	ret = ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
> @@ -1179,7 +1179,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
>   		return;
>   	}
>   
> -	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> +	if (ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL)
>   		return;
>   
>   	adev = amdgpu_ttm_adev(bdev);
> @@ -1210,8 +1210,8 @@ int amdgpu_ttm_tt_set_userptr(struct ttm_buffer_object *bo,
>   			return -ENOMEM;
>   	}
>   
> -	/* Set TTM_PAGE_FLAG_SG before populate but after create. */
> -	bo->ttm->page_flags |= TTM_PAGE_FLAG_SG;
> +	/* Set TTM_PAGE_FLAG_EXTERNAL before populate but after create. */
> +	bo->ttm->page_flags |= TTM_PAGE_FLAG_EXTERNAL;
>   
>   	gtt = (void *)bo->ttm;
>   	gtt->userptr = addr;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 33dca2565cca..ba0fec252df7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1249,7 +1249,7 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
>   	struct ttm_tt *ttm_dma = (void *)ttm;
>   	struct nouveau_drm *drm;
>   	struct device *dev;
> -	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> +	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL);
>   
>   	if (ttm_tt_is_populated(ttm))
>   		return 0;
> @@ -1272,7 +1272,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
>   {
>   	struct nouveau_drm *drm;
>   	struct device *dev;
> -	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> +	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL);
>   
>   	if (slave)
>   		return;
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 7793249bc549..d891491b6da8 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -545,14 +545,14 @@ static int radeon_ttm_tt_populate(struct ttm_device *bdev,
>   {
>   	struct radeon_device *rdev = radeon_get_rdev(bdev);
>   	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
> -	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> +	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL);
>   
>   	if (gtt && gtt->userptr) {
>   		ttm->sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
>   		if (!ttm->sg)
>   			return -ENOMEM;
>   
> -		ttm->page_flags |= TTM_PAGE_FLAG_SG;
> +		ttm->page_flags |= TTM_PAGE_FLAG_EXTERNAL;
>   		return 0;
>   	}
>   
> @@ -569,13 +569,13 @@ static void radeon_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm
>   {
>   	struct radeon_device *rdev = radeon_get_rdev(bdev);
>   	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
> -	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> +	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL);
>   
>   	radeon_ttm_tt_unbind(bdev, ttm);
>   
>   	if (gtt && gtt->userptr) {
>   		kfree(ttm->sg);
> -		ttm->page_flags &= ~TTM_PAGE_FLAG_SG;
> +		ttm->page_flags &= ~TTM_PAGE_FLAG_EXTERNAL;
>   		return;
>   	}
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 3b22c0013dbf..642dc7ce3081 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1115,7 +1115,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   		return -EBUSY;
>   
>   	if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
> -	    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
> +	    bo->ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL ||
>   	    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED ||
>   	    !ttm_bo_get_unless_zero(bo)) {
>   		if (locked)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 906ec8a1bf5a..708390588c7c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -162,7 +162,7 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>   	 * Refuse to fault imported pages. This should be handled
>   	 * (if at all) by redirecting mmap to the exporter.
>   	 */
> -	if (bo->ttm && (bo->ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (bo->ttm && (bo->ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL)) {
>   		dma_resv_unlock(bo->base.resv);
>   		return VM_FAULT_SIGBUS;
>   	}
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 980ecb079b2c..9c586b613737 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -73,7 +73,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
>   	case ttm_bo_type_kernel:
>   		break;
>   	case ttm_bo_type_sg:
> -		page_flags |= TTM_PAGE_FLAG_SG;
> +		page_flags |= TTM_PAGE_FLAG_EXTERNAL;
>   		break;
>   	default:
>   		pr_err("Illegal buffer object type\n");
> @@ -178,7 +178,7 @@ int ttm_sg_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>   
>   	ttm_tt_init_fields(ttm, bo, page_flags, caching);
>   
> -	if (page_flags & TTM_PAGE_FLAG_SG)
> +	if (page_flags & TTM_PAGE_FLAG_EXTERNAL)
>   		ret = ttm_sg_tt_alloc_page_directory(ttm);
>   	else
>   		ret = ttm_dma_tt_alloc_page_directory(ttm);
> @@ -300,7 +300,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	if (ttm_tt_is_populated(ttm))
>   		return 0;
>   
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (!(ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL)) {
>   		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>   		if (bdev->pool.use_dma32)
>   			atomic_long_add(ttm->num_pages,
> @@ -337,7 +337,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	return 0;
>   
>   error:
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (!(ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL)) {
>   		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>   		if (bdev->pool.use_dma32)
>   			atomic_long_sub(ttm->num_pages,
> @@ -357,7 +357,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>   	else
>   		ttm_pool_free(&bdev->pool, ttm);
>   
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (!(ttm->page_flags & TTM_PAGE_FLAG_EXTERNAL)) {
>   		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>   		if (bdev->pool.use_dma32)
>   			atomic_long_sub(ttm->num_pages,
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 842ce756213c..a6c284c21e72 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -38,9 +38,9 @@ struct ttm_resource;
>   struct ttm_buffer_object;
>   struct ttm_operation_ctx;
>   
> -#define TTM_PAGE_FLAG_SWAPPED         (1 << 4)
> -#define TTM_PAGE_FLAG_ZERO_ALLOC      (1 << 6)
> -#define TTM_PAGE_FLAG_SG              (1 << 8)
> +#define TTM_PAGE_FLAG_SWAPPED		(1 << 4)
> +#define TTM_PAGE_FLAG_ZERO_ALLOC	(1 << 6)
> +#define TTM_PAGE_FLAG_EXTERNAL		(1 << 8)

While at it please renumber those and maybe also rename everything.

E.g. TTM_TT_FLAG_* instead of TTM_PAGE_FLAG_* since this really controls 
the TT object behavior.

Christian.

>   
>   #define TTM_PAGE_FLAG_PRIV_POPULATED  (1 << 31)
>   

