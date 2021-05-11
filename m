Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C937A84D
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 15:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028006EA3A;
	Tue, 11 May 2021 13:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6C46EA38;
 Tue, 11 May 2021 13:58:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOxPnnVnIIyBgaLKXUMFB3nE+MBho6+yM95iBS7IVWOTBOV/f6KLpn31ETpalWEVLbVx6CmFI4frzJ/v6SpaNTwrRDP92Y9tWmImdsWB/CuzEhKPmAmNsGwHZ8Mx2/aWuM6RQ3IHx8OhWztGmvTOzdvPEH33YCCtMBJs1tEPaOIuBq6Qxz8rbGcgy8u3/W+HdTPX2B9SOQN/vR3wIyf37/WfTu2IdOjwYdxm2FDnE2ciMJFa1unaioXkHTD8h3X9M1BOwPHnRnVT6uSKTaiFo5Ag/f7Pfcfd9OHNlKtWhlD/WWsHE+qE7HDA+AZivksj58zA+c3UI+rNWPigSl6kpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFiM/md4/SL6UFFIP6mn/dta+AT1illttr676jaXNrc=;
 b=bep4Ndfc2f7qYnngujCQHa1m6knMOud+hNHc7NXhH9Q8DNUk91oeE/0wns5pg80Dj2tLBlqt1c8/826+zARiNbIV6jtI86/UDL02zf+mML6NZNlYi/0JVjNP4/PIzd8nUbjkg6gLiyJxLC55XUY3+mJxoe2WY06G9AduhSFTZDS/Ymho+7ajbj9Mg7MckwAj0dfJ1qaWIlnONq+M0If6Y8SKDVF7cddXMQBvIzgg9GtKtomvhyx1qpRtGXkdVSehHatlFR1Oj3J0ZzMyM9K9BkFcx5FEmp+j21B8+gh7KYR5vfVXDBFzyTbxvdmV0RyDcP4KtjNv8N43eCmxytvorA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFiM/md4/SL6UFFIP6mn/dta+AT1illttr676jaXNrc=;
 b=SGhnADzmVl/q+ZNevn4rpHboYlfAB5JNJGwZE443i43vyJpIKHsyEWDkvJVdfF31WsgXsvW2srPXcfbofARsap+vwfgOjacLoGLCNZlS1rtB+M0j94HeuoTQlHSy+IcSvBe6cFGkDZflwyBydl16eMNW7Zu9zLDBkqDFGOlth0k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 11 May
 2021 13:58:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 13:58:49 +0000
Subject: Re: [PATCH 6/7] drm/i915/ttm, drm/ttm: Introduce a TTM i915 gem
 object backend
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
 <20210511132525.377190-7-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8ac6bc5c-17c0-2ffd-7f8c-823ab3c8a858@amd.com>
Date: Tue, 11 May 2021 15:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210511132525.377190-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5935:8b67:3cdd:7cc1]
X-ClientProxiedBy: PR3P189CA0088.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5935:8b67:3cdd:7cc1]
 (2a02:908:1252:fb60:5935:8b67:3cdd:7cc1) by
 PR3P189CA0088.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 13:58:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b91d81cd-1ba0-4516-1544-08d91484e6b7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4207:
X-Microsoft-Antispam-PRVS: <MN2PR12MB420740C5A3C86AD8B022C50D83539@MN2PR12MB4207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ejc3FRVgmEJKu5IJ4yveg9qzKoMnUyKiTE1tbvkU5jsM2XKQsZoQkfP90u+reRV1pHZeXc5NRumIQnTjaSslfdPyaISsYX7FcGJy21Vk8pcramMz0HR7H4t3kPvVrHKgT/tEZeyRYBmNSaK3Y5vt4U9soWVhbvVFILoTWwbtJwiVnv3nrC0YwYG0q1YZudRGc8EE9MD71HNHZxnghzYQbUopBUgZ2IcerBM8rgf8yrQCP50HxSPtE2Lr5qK7Pkqz5eF+5s3b0Blz6emwbIg03sVLBy9qKC456wRogjqa1bM4d67kUJA/WnrpHNTRFMoKAqZnM9JmD2o9zOhmDTY7l9pCxnTlmxUEVLXWaLVIlX9hb72l8VfbzdxFwtNAn93PB1k2CB3vXkP/D4t8TarTQ6wlW2yJEVDP79zx4jouPGojT+RlUzUi8YvdDBGFrwpbSoF12zh5lnPYefzHwUe3w6ECme78eP3IVDUx0M0q75UtvSvuDPsb4MMwne/kViCB9nnLLjTXkpVN/sOCS7BBiwtu2IKIvbsgqml8A2Q7z8Chxu4m7GkKYgLp+Ev4bxo4D8mQ5M0T5mMHCISmrQz0ZZlPSwb6BNQH4F2r/ccgbAWVqk/rxlOOeNFEnxVH/GYiRmO1jp9oN/gdqibMOYAtuH2e27Ld4rzqr4CXD3IFtdvAPDrSHKPa3gCmNF2GeWJJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(31696002)(36756003)(86362001)(38100700002)(66574015)(83380400001)(6666004)(66476007)(66946007)(66556008)(2616005)(2906002)(316002)(6486002)(8676002)(478600001)(186003)(16526019)(30864003)(8936002)(5660300002)(31686004)(52116002)(43740500002)(45980500001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDRpSEtGYjJHaU9ndCtxeHp5SVExVUsyTzRqcjJPMXFmMzg4MGc0aXp5SmYv?=
 =?utf-8?B?UXJJcVZ2b0xoRm1mV012VktsYjhqYnhaNXFkSlVObmFMbXd6bVRGS3djVXNN?=
 =?utf-8?B?Nk0zT2pEZ0J1SzNGN0JkeXRvNGhrQUg3aHRqdEFJcHY4cUlXaU54cTA1RXRT?=
 =?utf-8?B?SjFERitUSFRLNWJTNEhtdVl5ZlVhUmJoMWUvOGlHU0NpSWFMMDFlUjUyS09K?=
 =?utf-8?B?WmtENzNPa1I5QjVTL1pSQnU1WHJCbjlQZHgzT0F0S1VNZU9ZZVhJT3NKYU41?=
 =?utf-8?B?TjJldmNRd1BpaW1VY2VPYUowVGF0anUwTE5hT08zQXdoYzZ4YTNyU3VLeUpn?=
 =?utf-8?B?T1Vid0syYlk4TmRqbDBzS25BVFdrYVpyTlExUnJQN3IxQ2V0VDFWd0dCcUpB?=
 =?utf-8?B?YnREaEdHT0J0TUZrVmFPWCtwaWt0NkdDWEdiak1xZFAzeUFVclh6MlJiQlNN?=
 =?utf-8?B?czV3cCtMUDVqcFRsZG9iYlVPQlNrUlA5MXV1ajlLWmNCRVpLL1pjNHBFL3BN?=
 =?utf-8?B?SGl5ZjRnVDQ3elVZbW83M3AwOWZGOWNvbXlDVE1vM0VaS2Y5eThIVTBaVVI1?=
 =?utf-8?B?MU1WMFl1WGQ4ZzQ5SXN4elQ0SkhCV2lwSE9uMUZYdG04dmgxWmFRczg4cjhV?=
 =?utf-8?B?N1RFQmpnZDU5RnBkanJlc01DdXhBM0NuMlZUNEdDMDVzdW5YVnN6VVdncHIr?=
 =?utf-8?B?VGJnOEkxT1QreXluL0dJN3hVUXRxSFVCS2tpVEZFZW1sRXAwdTVDR2hJUkQv?=
 =?utf-8?B?dGFBZ1Z3VVZ4NWkwMGFXaGV1aCtCZHpEa0h4Mjh0U1hzUlB3aERYdXI4NkVH?=
 =?utf-8?B?SEk1YjFtYUNUOEN3UEdwcndOL3FPZWs3TmFoSlh3eHZCRzVpUnhJU3ROQ2o5?=
 =?utf-8?B?ZXJXcE9MS0w4VWJNMlFHNW5wUGtDM3M0YlIvSHhPWWZWeWNoMklHNllXYk5p?=
 =?utf-8?B?ZDFYQ1FTTHIzY3p1b3Z1UFJTNjR5NXNZK1R2eUlPS2pKVm83NU8wVFY0dWZt?=
 =?utf-8?B?YnRETjh2SzZJUkNobHI5MTF3WWJTTjRBZlNaWS9NRWlLOUtUVEZVTi9qSkZR?=
 =?utf-8?B?T2JrRkpIN2llYjlTQ2hhOG1VTVlkS25VUkFKT0ZCank0TmhsYUFGdUF4TEJy?=
 =?utf-8?B?RVptd2RlVEJjNWxBYkYrYmlCMkdtTVdwcjJmQWlCeml5SmFxWlo1c1RhZ042?=
 =?utf-8?B?cCtIVlMwSUdCMTJaMC9wU2c2MmpaVHhqcCtwS2RJQWRHU2tUWGRTckdIWVhP?=
 =?utf-8?B?a3RORGd3amptWXV0QUpqNVY5QStVQ1IyY3pWM2VpWklNbkJIUkJOc1JGSHBZ?=
 =?utf-8?B?R2lyaXRBMnl3K0k1azNYWFZYNFFISUZGL3N1YkhuVXYwQ3IyY3AwVWdzTnBC?=
 =?utf-8?B?cHZNWW15aWxqT3BLa2Q0Qll2UDZFYTg3dU9vRGpTM2E4YnkySFdqbUFBY1hv?=
 =?utf-8?B?aHgyTzlyY3QxUEdyRmZvYmNCNXhNUWxMYUo2RXBLWHRtOVByTUF5bHlRSEFQ?=
 =?utf-8?B?NUtFdzFnRjdtamptNU90T1VzYi9WTGpFWml0dWNPa1AvMnpCK2ovb0NyTTVO?=
 =?utf-8?B?c3pyTENXTFkxeVFJMFdyeHBMcFdNVHVPRDMrOWFrcTBxMTJudGkxSDZBQ05F?=
 =?utf-8?B?czRjMGdpQTd6bHI3YUhzMzU2c0lSRkhIWmZkSzhCSHQxbjdEb0NFb3RtWDdP?=
 =?utf-8?B?WThzTzFaVEM5OGwwVldheE1pcjhvOUZ3dGRTSCtIODR1WUYyUmNyVVlISWdT?=
 =?utf-8?B?aFhXRjNJMWhxZ0FhOWtIOGp5cGF3OUQwN09xSXFqTlUzOUswbXRnbUVFQWtX?=
 =?utf-8?B?WDE1UGN6UWxUWEZENUx6QjNCZkJoandyNWJDdG5ESjRSeXlnVnJuN3B4UHlR?=
 =?utf-8?Q?S/latXw/fsoaT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91d81cd-1ba0-4516-1544-08d91484e6b7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 13:58:49.2980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1RmzmRlKUD6hJzTfwJqC3xJuGQf1kRshDZzPAnuUnCpIONlf1i5FVxNQruAF+w4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
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

Am 11.05.21 um 15:25 schrieb Thomas Hellström:
> Most logical place to introduce TTM buffer objects is as an i915
> gem object backend. We need to add some ops to account for added
> functionality like delayed delete and LRU list manipulation.
>
> Initially we support only LMEM and SYSTEM memory, but SYSTEM
> (which in this case means evicted LMEM objects) is not
> visible to i915 GEM yet. The plan is to move the i915 gem system region
> over to the TTM system memory type in upcoming patches.
>
> We set up GPU bindings directly both from LMEM and from the system region,
> as there is no need to use the legacy TTM_TT memory type. We reserve
> that for future porting of GGTT bindings to TTM.
>
> There are some changes to TTM to allow for purging system memory buffer
> objects and to refuse swapping of some objects: Unfortunately i915 gem
> still relies heavily on short-term object pinning, and we've chosen to
> keep short-term-pinned buffer objects on the TTM LRU lists for now,
> meaning that we need some sort of mechanism to tell TTM they are not
> swappable. A longer term goal is to get rid of the short-term pinning.

Well just use the eviction_valuable interface for this.

In general please make separate patches for the TTM changes and for the 
i915 changes using them for easier review.

Christian.

>
> Remove the old lmem backend.
>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  83 ---
>   drivers/gpu/drm/i915/gem/i915_gem_lmem.h      |   5 -
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 126 +++--
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |   9 +
>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  18 +
>   drivers/gpu/drm/i915/gem/i915_gem_region.c    |   6 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 534 ++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  48 ++
>   drivers/gpu/drm/i915/gt/intel_region_lmem.c   |   3 +-
>   drivers/gpu/drm/i915/i915_gem.c               |   5 +-
>   drivers/gpu/drm/i915/intel_memory_region.c    |   1 -
>   drivers/gpu/drm/i915/intel_memory_region.h    |   1 -
>   drivers/gpu/drm/i915/intel_region_ttm.c       |   5 +-
>   drivers/gpu/drm/i915/intel_region_ttm.h       |   7 +-
>   drivers/gpu/drm/ttm/ttm_bo.c                  |  12 +
>   include/drm/ttm/ttm_device.h                  |   9 +
>   17 files changed, 733 insertions(+), 140 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 958ccc1edfed..ef0d884a9e2d 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -155,6 +155,7 @@ gem-y += \
>   	gem/i915_gem_stolen.o \
>   	gem/i915_gem_throttle.o \
>   	gem/i915_gem_tiling.o \
> +	gem/i915_gem_ttm.o \
>   	gem/i915_gem_ttm_bo_util.o \
>   	gem/i915_gem_userptr.o \
>   	gem/i915_gem_wait.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> index f42803ea48f2..2b8cd15de1d9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -4,73 +4,10 @@
>    */
>   
>   #include "intel_memory_region.h"
> -#include "intel_region_ttm.h"
>   #include "gem/i915_gem_region.h"
>   #include "gem/i915_gem_lmem.h"
>   #include "i915_drv.h"
>   
> -static void lmem_put_pages(struct drm_i915_gem_object *obj,
> -				  struct sg_table *pages)
> -{
> -	intel_region_ttm_node_free(obj->mm.region, obj->mm.st_mm_node);
> -	obj->mm.dirty = false;
> -	sg_free_table(pages);
> -	kfree(pages);
> -}
> -
> -static int lmem_get_pages(struct drm_i915_gem_object *obj)
> -{
> -	unsigned int flags;
> -	struct sg_table *pages;
> -
> -	flags = I915_ALLOC_MIN_PAGE_SIZE;
> -	if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
> -		flags |= I915_ALLOC_CONTIGUOUS;
> -
> -	obj->mm.st_mm_node = intel_region_ttm_node_alloc(obj->mm.region,
> -							 obj->base.size,
> -							 flags);
> -	if (IS_ERR(obj->mm.st_mm_node))
> -		return PTR_ERR(obj->mm.st_mm_node);
> -
> -	/* Range manager is always contigous */
> -	if (obj->mm.region->is_range_manager)
> -		obj->flags |= I915_BO_ALLOC_CONTIGUOUS;
> -	pages = intel_region_ttm_node_to_st(obj->mm.region, obj->mm.st_mm_node);
> -	if (IS_ERR(pages))
> -		return PTR_ERR(pages);
> -
> -	__i915_gem_object_set_pages(obj, pages,
> -				    i915_sg_dma_page_sizes(pages->sgl));
> -
> -	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR) {
> -		void __iomem *vaddr =
> -			i915_gem_object_lmem_io_map(obj, 0, obj->base.size);
> -
> -		if (!vaddr) {
> -			struct sg_table *pages =
> -				__i915_gem_object_unset_pages(obj);
> -
> -			if (!IS_ERR_OR_NULL(pages))
> -				lmem_put_pages(obj, pages);
> -		}
> -
> -		memset_io(vaddr, 0, obj->base.size);
> -		io_mapping_unmap(vaddr);
> -	}
> -
> -	return 0;
> -}
> -
> -const struct drm_i915_gem_object_ops i915_gem_lmem_obj_ops = {
> -	.name = "i915_gem_object_lmem",
> -	.flags = I915_GEM_OBJECT_HAS_IOMEM,
> -
> -	.get_pages = lmem_get_pages,
> -	.put_pages = lmem_put_pages,
> -	.release = i915_gem_object_release_memory_region,
> -};
> -
>   void __iomem *
>   i915_gem_object_lmem_io_map(struct drm_i915_gem_object *obj,
>   			    unsigned long n,
> @@ -102,23 +39,3 @@ i915_gem_object_create_lmem(struct drm_i915_private *i915,
>   	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM],
>   					     size, flags);
>   }
> -
> -int __i915_gem_lmem_object_init(struct intel_memory_region *mem,
> -				struct drm_i915_gem_object *obj,
> -				resource_size_t size,
> -				unsigned int flags)
> -{
> -	static struct lock_class_key lock_class;
> -	struct drm_i915_private *i915 = mem->i915;
> -
> -	drm_gem_private_object_init(&i915->drm, &obj->base, size);
> -	i915_gem_object_init(obj, &i915_gem_lmem_obj_ops, &lock_class, flags);
> -
> -	obj->read_domains = I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
> -
> -	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
> -
> -	i915_gem_object_init_memory_region(obj, mem);
> -
> -	return 0;
> -}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> index fac6bc5a5ebb..ea76fd11ccb0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> @@ -26,9 +26,4 @@ i915_gem_object_create_lmem(struct drm_i915_private *i915,
>   			    resource_size_t size,
>   			    unsigned int flags);
>   
> -int __i915_gem_lmem_object_init(struct intel_memory_region *mem,
> -				struct drm_i915_gem_object *obj,
> -				resource_size_t size,
> -				unsigned int flags);
> -
>   #endif /* !__I915_GEM_LMEM_H */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index c8953e3f5c70..c53488f391dd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -172,7 +172,7 @@ static void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *f
>   	}
>   }
>   
> -static void __i915_gem_free_object_rcu(struct rcu_head *head)
> +void __i915_gem_free_object_rcu(struct rcu_head *head)
>   {
>   	struct drm_i915_gem_object *obj =
>   		container_of(head, typeof(*obj), rcu);
> @@ -208,59 +208,70 @@ static void __i915_gem_object_free_mmaps(struct drm_i915_gem_object *obj)
>   	}
>   }
>   
> -static void __i915_gem_free_objects(struct drm_i915_private *i915,
> -				    struct llist_node *freed)
> +void __i915_gem_free_object(struct drm_i915_gem_object *obj)
>   {
> -	struct drm_i915_gem_object *obj, *on;
> +	trace_i915_gem_object_destroy(obj);
>   
> -	llist_for_each_entry_safe(obj, on, freed, freed) {
> -		trace_i915_gem_object_destroy(obj);
> +	if (!list_empty(&obj->vma.list)) {
> +		struct i915_vma *vma;
> +
> +		/*
> +		 * Note that the vma keeps an object reference while
> +		 * it is active, so it *should* not sleep while we
> +		 * destroy it. Our debug code errs insits it *might*.
> +		 * For the moment, play along.
> +		 */
> +		spin_lock(&obj->vma.lock);
> +		while ((vma = list_first_entry_or_null(&obj->vma.list,
> +						       struct i915_vma,
> +						       obj_link))) {
> +			GEM_BUG_ON(vma->obj != obj);
> +			spin_unlock(&obj->vma.lock);
>   
> -		if (!list_empty(&obj->vma.list)) {
> -			struct i915_vma *vma;
> +			__i915_vma_put(vma);
>   
> -			/*
> -			 * Note that the vma keeps an object reference while
> -			 * it is active, so it *should* not sleep while we
> -			 * destroy it. Our debug code errs insits it *might*.
> -			 * For the moment, play along.
> -			 */
>   			spin_lock(&obj->vma.lock);
> -			while ((vma = list_first_entry_or_null(&obj->vma.list,
> -							       struct i915_vma,
> -							       obj_link))) {
> -				GEM_BUG_ON(vma->obj != obj);
> -				spin_unlock(&obj->vma.lock);
> +		}
> +		spin_unlock(&obj->vma.lock);
> +	}
>   
> -				__i915_vma_put(vma);
> +	__i915_gem_object_free_mmaps(obj);
>   
> -				spin_lock(&obj->vma.lock);
> -			}
> -			spin_unlock(&obj->vma.lock);
> -		}
> +	GEM_BUG_ON(!list_empty(&obj->lut_list));
>   
> -		__i915_gem_object_free_mmaps(obj);
> +	atomic_set(&obj->mm.pages_pin_count, 0);
> +	__i915_gem_object_put_pages(obj);
> +	GEM_BUG_ON(i915_gem_object_has_pages(obj));
> +	bitmap_free(obj->bit_17);
>   
> -		GEM_BUG_ON(!list_empty(&obj->lut_list));
> +	if (obj->base.import_attach)
> +		drm_prime_gem_destroy(&obj->base, NULL);
>   
> -		atomic_set(&obj->mm.pages_pin_count, 0);
> -		__i915_gem_object_put_pages(obj);
> -		GEM_BUG_ON(i915_gem_object_has_pages(obj));
> -		bitmap_free(obj->bit_17);
> +	drm_gem_free_mmap_offset(&obj->base);
>   
> -		if (obj->base.import_attach)
> -			drm_prime_gem_destroy(&obj->base, NULL);
> +	if (obj->ops->release)
> +		obj->ops->release(obj);
>   
> -		drm_gem_free_mmap_offset(&obj->base);
> +	if (obj->mm.n_placements > 1)
> +		kfree(obj->mm.placements);
>   
> -		if (obj->ops->release)
> -			obj->ops->release(obj);
> +	if (obj->resv_shared_from)
> +		i915_vm_resv_put(obj->resv_shared_from);
>   
> -		if (obj->mm.n_placements > 1)
> -			kfree(obj->mm.placements);
> +}
> +
> +static void __i915_gem_free_objects(struct drm_i915_private *i915,
> +				    struct llist_node *freed)
> +{
> +	struct drm_i915_gem_object *obj, *on;
>   
> -		if (obj->resv_shared_from)
> -			i915_vm_resv_put(obj->resv_shared_from);
> +	llist_for_each_entry_safe(obj, on, freed, freed) {
> +		might_sleep();
> +		if (obj->ops->delayed_free) {
> +			obj->ops->delayed_free(obj);
> +			continue;
> +		}
> +		__i915_gem_free_object(obj);
>   
>   		/* But keep the pointer alive for RCU-protected lookups */
>   		call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
> @@ -318,6 +329,7 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
>   	 * worker and performing frees directly from subsequent allocations for
>   	 * crude but effective memory throttling.
>   	 */
> +
>   	if (llist_add(&obj->freed, &i915->mm.free_list))
>   		queue_work(i915->wq, &i915->mm.free_work);
>   }
> @@ -410,6 +422,42 @@ int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 offset,
>   	return 0;
>   }
>   
> +/**
> + * i915_gem_object_evictable - Whether object is likely evictable after unbind.
> + * @obj: The object to check
> + *
> + * This function checks whether the object is likely unvictable after unbind.
> + * If the object is not locked when checking, the result is only advisory.
> + * If the object is locked when checking, and the function returns true,
> + * then an eviction should indeed be possible. But since unlocked vma
> + * unpinning and unbinding is currently possible, the object can actually
> + * become evictable even if this function returns false.
> + *
> + * Return: true if the object may be evictable. False otherwise.
> + */
> +bool i915_gem_object_evictable(struct drm_i915_gem_object *obj)
> +{
> +	struct i915_vma *vma;
> +	int pin_count = atomic_read(&obj->mm.pages_pin_count);
> +
> +	if (!pin_count)
> +		return true;
> +
> +	spin_lock(&obj->vma.lock);
> +	list_for_each_entry(vma, &obj->vma.list, obj_link) {
> +		if (i915_vma_is_pinned(vma)) {
> +			spin_unlock(&obj->vma.lock);
> +			return false;
> +		}
> +		if (atomic_read(&vma->pages_count))
> +			pin_count--;
> +	}
> +	spin_unlock(&obj->vma.lock);
> +	GEM_WARN_ON(pin_count < 0);
> +
> +	return pin_count == 0;
> +}
> +
>   void i915_gem_init__objects(struct drm_i915_private *i915)
>   {
>   	INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 2ebd79537aea..ae5930e307d5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -200,6 +200,9 @@ static inline bool i915_gem_object_trylock(struct drm_i915_gem_object *obj)
>   
>   static inline void i915_gem_object_unlock(struct drm_i915_gem_object *obj)
>   {
> +	if (obj->ops->adjust_lru)
> +		obj->ops->adjust_lru(obj);
> +
>   	dma_resv_unlock(obj->base.resv);
>   }
>   
> @@ -587,6 +590,12 @@ int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 offset,
>   
>   bool i915_gem_object_is_shmem(const struct drm_i915_gem_object *obj);
>   
> +void __i915_gem_free_object_rcu(struct rcu_head *head);
> +
> +void __i915_gem_free_object(struct drm_i915_gem_object *obj);
> +
> +bool i915_gem_object_evictable(struct drm_i915_gem_object *obj);
> +
>   #ifdef CONFIG_MMU_NOTIFIER
>   static inline bool
>   i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 98f69d8fd37d..b350765e1935 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -63,6 +63,20 @@ struct drm_i915_gem_object_ops {
>   		      const struct drm_i915_gem_pwrite *arg);
>   
>   	int (*dmabuf_export)(struct drm_i915_gem_object *obj);
> +
> +	/**
> +	 * adjust_lru - notify that the madvise value was updated
> +	 * @obj: The gem object
> +	 *
> +	 * The madvise value may have been updated, or object was recently
> +	 * referenced so act accordingly (Perhaps changing an LRU list etc).
> +	 */
> +	void (*adjust_lru)(struct drm_i915_gem_object *obj);
> +
> +	/**
> +	 * delayed_free - Override the default delayed free implementation
> +	 */
> +	void (*delayed_free)(struct drm_i915_gem_object *obj);
>   	void (*release)(struct drm_i915_gem_object *obj);
>   
>   	const char *name; /* friendly name for debug, e.g. lockdep classes */
> @@ -307,6 +321,10 @@ struct drm_i915_gem_object {
>   		bool dirty:1;
>   	} mm;
>   
> +	struct {
> +		struct sg_table *cached_io_st;
> +	} ttm;
> +
>   	/** Record of address bit 17 of each page at last unbind. */
>   	unsigned long *bit_17;
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> index f25e6646c5b7..d1f1840540dd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> @@ -18,11 +18,7 @@ void i915_gem_object_init_memory_region(struct drm_i915_gem_object *obj,
>   
>   	mutex_lock(&mem->objects.lock);
>   
> -	if (obj->flags & I915_BO_ALLOC_VOLATILE)
> -		list_add(&obj->mm.region_link, &mem->objects.purgeable);
> -	else
> -		list_add(&obj->mm.region_link, &mem->objects.list);
> -
> +	list_add(&obj->mm.region_link, &mem->objects.list);
>   	mutex_unlock(&mem->objects.lock);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> new file mode 100644
> index 000000000000..e3718c3cb299
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -0,0 +1,534 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#include <drm/ttm/ttm_bo_driver.h>
> +#include <drm/ttm/ttm_placement.h>
> +
> +#include "i915_drv.h"
> +#include "intel_memory_region.h"
> +#include "intel_region_ttm.h"
> +
> +#include "gem/i915_gem_object.h"
> +#include "gem/i915_gem_region.h"
> +#include "gem/i915_gem_ttm.h"
> +#include "gem/i915_gem_ttm_bo_util.h"
> +
> +#define I915_PL_LMEM0 TTM_PL_PRIV
> +#define I915_PL_SYSTEM TTM_PL_SYSTEM
> +#define I915_PL_STOLEN TTM_PL_VRAM
> +#define I915_PL_GGTT TTM_PL_TT
> +
> +#define I915_TTM_PRIO_PURGE     0
> +#define I915_TTM_PRIO_NO_PAGES  1
> +#define I915_TTM_PRIO_HAS_PAGES 2
> +
> +/**
> + * struct i915_ttm_tt - TTM page vector with additional private information
> + * @ttm: The base TTM page vector.
> + * @dev: The struct device used for dma mapping and unmapping.
> + * @cached_st: The cached scatter-gather table.
> + *
> + * Note that DMA may be going on right up to the point where the page-
> + * vector is unpopulated in delayed destroy. Hence keep the
> + * scatter-gather table mapped and cached up to that point. This is
> + * different from the cached gem object io scatter-gather table which
> + * doesn't have an associated dma mapping.
> + */
> +struct i915_ttm_tt {
> +	struct ttm_tt ttm;
> +	struct device *dev;
> +	struct sg_table *cached_st;
> +};
> +
> +static const struct ttm_place lmem0_sys_placement_flags[] = {
> +	{
> +		.fpfn = 0,
> +		.lpfn = 0,
> +		.mem_type = I915_PL_LMEM0,
> +		.flags = 0,
> +	}, {
> +		.fpfn = 0,
> +		.lpfn = 0,
> +		.mem_type = I915_PL_SYSTEM,
> +		.flags = 0,
> +	}
> +};
> +
> +struct ttm_placement i915_lmem0_placement = {
> +	.num_placement = 1,
> +	.placement = &lmem0_sys_placement_flags[0],
> +	.num_busy_placement = 1,
> +	.busy_placement = &lmem0_sys_placement_flags[0],
> +};
> +
> +struct ttm_placement i915_lmem0_sys_placement = {
> +	.num_placement = 1,
> +	.placement = &lmem0_sys_placement_flags[0],
> +	.num_busy_placement = 2,
> +	.busy_placement = &lmem0_sys_placement_flags[0],
> +};
> +
> +struct ttm_placement i915_sys_placement = {
> +	.num_placement = 1,
> +	.placement = &lmem0_sys_placement_flags[1],
> +	.num_busy_placement = 1,
> +	.busy_placement = &lmem0_sys_placement_flags[1],
> +};
> +
> +static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj);
> +
> +static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
> +					 uint32_t page_flags)
> +{
> +	struct ttm_resource_manager *man =
> +		ttm_manager_type(bo->bdev, bo->mem.mem_type);
> +	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +	struct i915_ttm_tt *i915_tt;
> +	int ret;
> +
> +	i915_tt = kzalloc(sizeof(*i915_tt), GFP_KERNEL);
> +	if (!i915_tt)
> +		return NULL;
> +
> +	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
> +	    man->use_tt)
> +		page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
> +
> +	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, ttm_cached);
> +	if (ret) {
> +		kfree(i915_tt);
> +		return NULL;
> +	}
> +
> +	i915_tt->dev = obj->base.dev->dev;
> +
> +	return &i915_tt->ttm;
> +}
> +
> +static void i915_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
> +{
> +	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
> +
> +	if (i915_tt->cached_st) {
> +		dma_unmap_sgtable(i915_tt->dev, i915_tt->cached_st,
> +				  DMA_BIDIRECTIONAL, 0);
> +		sg_free_table(i915_tt->cached_st);
> +		kfree(i915_tt->cached_st);
> +		i915_tt->cached_st = NULL;
> +	}
> +	ttm_pool_free(&bdev->pool, ttm);
> +}
> +
> +static void i915_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
> +{
> +	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
> +
> +	ttm_tt_destroy_common(bdev, ttm);
> +	kfree(i915_tt);
> +}
> +
> +static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
> +				       const struct ttm_place *place)
> +{
> +	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +
> +	/* Will do for now. Our pinned objects are still on TTM's LRU lists */
> +	if (!i915_gem_object_evictable(obj))
> +		return false;
> +
> +	/* This isn't valid with a buddy allocator */
> +	return ttm_bo_eviction_valuable(bo, place);
> +}
> +
> +static void i915_ttm_evict_flags(struct ttm_buffer_object *bo,
> +				 struct ttm_placement *placement)
> +{
> +	*placement = i915_sys_placement;
> +}
> +
> +static int i915_ttm_move_notify(struct ttm_buffer_object *bo)
> +{
> +	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +	int ret;
> +
> +	ret = i915_gem_object_unbind(obj, I915_GEM_OBJECT_UNBIND_ACTIVE);
> +	if (ret)
> +		return ret;
> +
> +	ret = __i915_gem_object_put_pages(obj);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void i915_ttm_free_cached_io_st(struct drm_i915_gem_object *obj)
> +{
> +	if (obj->ttm.cached_io_st) {
> +		sg_free_table(obj->ttm.cached_io_st);
> +		kfree(obj->ttm.cached_io_st);
> +		obj->ttm.cached_io_st = NULL;
> +	}
> +}
> +
> +static void i915_ttm_purge(struct drm_i915_gem_object *obj)
> +{
> +	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
> +
> +	if (obj->mm.madv == __I915_MADV_PURGED)
> +		return;
> +
> +	i915_ttm_free_cached_io_st(obj);
> +
> +	ttm_resource_free(bo, &bo->mem);
> +	if (bo->ttm)
> +		ttm_bo_tt_destroy(bo);
> +
> +	obj->mm.madv = __I915_MADV_PURGED;
> +}
> +
> +static bool i915_ttm_swap_possible(struct ttm_buffer_object *bo)
> +{
> +	/* Will do for now. Our pinned objects are still on TTM's LRU lists */
> +	return i915_gem_object_evictable(i915_ttm_to_gem(bo));
> +}
> +
> +static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
> +{
> +	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +	int ret = i915_ttm_move_notify(bo);
> +
> +	GEM_WARN_ON(ret);
> +	GEM_WARN_ON(obj->ttm.cached_io_st);
> +	if (!ret && obj->mm.madv != I915_MADV_WILLNEED)
> +		i915_ttm_purge(obj);
> +}
> +
> +static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
> +{
> +	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +
> +	if (likely(obj)) {
> +		/* This releases all gem object bindings to the backend. */
> +		__i915_gem_free_object(obj);
> +	}
> +}
> +
> +static struct intel_memory_region *
> +i915_ttm_region(struct ttm_device *bdev, int ttm_mem_type)
> +{
> +	struct drm_i915_private *i915 = container_of(bdev, typeof(*i915), bdev);
> +
> +	/* There's some room for optimization here... */
> +	GEM_BUG_ON(ttm_mem_type != I915_PL_SYSTEM &&
> +		   ttm_mem_type < I915_PL_LMEM0);
> +	if (ttm_mem_type == I915_PL_SYSTEM)
> +		return intel_memory_region_lookup(i915, INTEL_MEMORY_SYSTEM,
> +						  0);
> +
> +	return intel_memory_region_lookup(i915, INTEL_MEMORY_LOCAL,
> +					  ttm_mem_type - I915_PL_LMEM0);
> +}
> +
> +static struct sg_table *i915_ttm_tt_get_st(struct ttm_tt *ttm)
> +{
> +	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
> +	struct scatterlist *sg;
> +	struct sg_table *st;
> +	int ret;
> +
> +	if (i915_tt->cached_st)
> +		return i915_tt->cached_st;
> +
> +	st = kzalloc(sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return ERR_PTR(-ENOMEM);
> +
> +	sg = __sg_alloc_table_from_pages
> +		(st, ttm->pages, ttm->num_pages, 0,
> +		 (unsigned long) ttm->num_pages << PAGE_SHIFT,
> +		 i915_sg_segment_size(), NULL, 0, GFP_KERNEL);
> +	if (IS_ERR(sg)) {
> +		kfree(st);
> +		return ERR_CAST(sg);
> +	}
> +
> +	ret = dma_map_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL, 0);
> +	if (ret) {
> +		sg_free_table(st);
> +		kfree(st);
> +		return ERR_PTR(ret);
> +	}
> +
> +	i915_tt->cached_st = st;
> +	return st;
> +}
> +
> +static struct sg_table *
> +i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
> +			 struct ttm_resource *res)
> +{
> +	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
> +	struct ttm_resource_manager *man =
> +		ttm_manager_type(bo->bdev, res->mem_type);
> +	struct sg_table *st;
> +
> +	if (man->use_tt)
> +		return i915_ttm_tt_get_st(bo->ttm);
> +
> +	st = kzalloc(sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return ERR_PTR(-ENOMEM);
> +
> +	st = intel_region_ttm_node_to_st(obj->mm.region, res->mm_node);
> +	if (IS_ERR(st))
> +		return ERR_CAST(st);
> +
> +	return st;
> +}
> +
> +static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
> +			 struct ttm_operation_ctx *ctx,
> +			 struct ttm_resource *new_mem,
> +			 struct ttm_place *hop)
> +{
> +	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +	struct ttm_resource_manager *new_man =
> +		ttm_manager_type(bo->bdev, new_mem->mem_type);
> +	struct ttm_resource_manager *old_man =
> +		ttm_manager_type(bo->bdev, bo->mem.mem_type);
> +	struct intel_memory_region *new_reg, *old_reg;
> +	union {
> +		struct i915_ttm_kmap_iter_tt tt;
> +		struct i915_ttm_kmap_iter_iomap io;
> +	} _new_iter, _old_iter;
> +	struct i915_ttm_kmap_iter *new_iter, *old_iter;
> +	struct sg_table *new_st;
> +	int ret;
> +
> +	new_reg = i915_ttm_region(bo->bdev, new_mem->mem_type);
> +	old_reg = i915_ttm_region(bo->bdev, bo->mem.mem_type);
> +	GEM_BUG_ON(!new_reg || !old_reg);
> +
> +	/* Sync for now. We could do the actual copy async. */
> +	ret = ttm_bo_wait_ctx(bo, ctx);
> +	if (ret)
> +		return ret;
> +
> +	ret = i915_ttm_move_notify(bo);
> +	if (ret)
> +		return ret;
> +
> +	if (obj->mm.madv != I915_MADV_WILLNEED) {
> +		i915_ttm_purge(obj);
> +		ttm_resource_free(bo, new_mem);
> +		return 0;
> +	}
> +
> +	/* Populate ttm with pages if needed. Typically system memory. */
> +	if (new_man->use_tt && bo->ttm) {
> +		ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	new_st = i915_ttm_resource_get_st(obj, new_mem);
> +	if (IS_ERR(new_st))
> +		return PTR_ERR(new_st);
> +
> +	new_iter = new_man->use_tt ?
> +		i915_ttm_kmap_iter_tt_init(&_new_iter.tt, bo->ttm) :
> +		i915_ttm_kmap_iter_iomap_init(&_new_iter.io, &new_reg->iomap,
> +					      new_st, new_reg->region.start);
> +
> +	old_iter = old_man->use_tt ?
> +		i915_ttm_kmap_iter_tt_init(&_old_iter.tt, bo->ttm) :
> +		i915_ttm_kmap_iter_iomap_init(&_old_iter.io, &old_reg->iomap,
> +					      obj->ttm.cached_io_st,
> +					      old_reg->region.start);
> +
> +	i915_ttm_move_memcpy(bo, new_mem, new_iter, old_iter);
> +	i915_ttm_free_cached_io_st(obj);
> +
> +	if (!new_man->use_tt)
> +		obj->ttm.cached_io_st = new_st;
> +
> +	return 0;
> +}
> +
> +struct ttm_device_funcs i915_ttm_bo_driver = {
> +	.ttm_tt_create = i915_ttm_tt_create,
> +	.ttm_tt_unpopulate = i915_ttm_tt_unpopulate,
> +	.ttm_tt_destroy = i915_ttm_tt_destroy,
> +	.eviction_valuable = i915_ttm_eviction_valuable,
> +	.evict_flags = i915_ttm_evict_flags,
> +	.move = i915_ttm_move,
> +	.verify_access = NULL,
> +	.swap_possible = i915_ttm_swap_possible,
> +	.swap_notify = i915_ttm_swap_notify,
> +	.delete_mem_notify = i915_ttm_delete_mem_notify,
> +};
> +
> +static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
> +{
> +	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = true,
> +		.no_wait_gpu = false,
> +	};
> +	struct sg_table *st;
> +	int ret;
> +
> +	/* Swap in. */
> +	if (bo->ttm && (bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
> +		ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Move to the requested placement. */
> +	ret = ttm_bo_validate(bo, &i915_lmem0_placement, &ctx);
> +	if (ret)
> +		return ret;
> +
> +	/* Object either has a page vector or is an iomem object */
> +	st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io_st;
> +	if (IS_ERR(st))
> +		return PTR_ERR(st);
> +
> +	__i915_gem_object_set_pages(obj, st, i915_sg_dma_page_sizes(st->sgl));
> +
> +	i915_ttm_adjust_lru(obj);
> +
> +	return ret;
> +}
> +
> +static void i915_ttm_put_pages(struct drm_i915_gem_object *obj,
> +			       struct sg_table *st)
> +{
> +	/*
> +	 * We're currently not called from a shrinker, so put_pages()
> +	 * typically means the object is about to destroyed, or called
> +	 * from move_notify(). So just avoid doing much for now.
> +	 * If the object is not destroyed next, The TTM eviction logic
> +	 * and shrinkers will move it out if needed.
> +	 */
> +
> +	i915_ttm_adjust_lru(obj);
> +}
> +
> +static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
> +{
> +	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
> +
> +	/*
> +	 * Don't manipulate the TTM LRUs while in TTM bo destruction.
> +	 * We're called through i915_ttm_delete_mem_notify().
> +	 */
> +	if (!kref_read(&bo->kref))
> +		return;
> +
> +	/*
> +	 * Put on the correct LRU list depending on the MADV status
> +	 */
> +	spin_lock(&bo->bdev->lru_lock);
> +	if (obj->mm.madv != I915_MADV_WILLNEED) {
> +		bo->priority = I915_TTM_PRIO_PURGE;
> +	} else if (!i915_gem_object_has_pages(obj)) {
> +		if (bo->priority < I915_TTM_PRIO_HAS_PAGES)
> +			bo->priority = I915_TTM_PRIO_HAS_PAGES;
> +	} else {
> +		if (bo->priority > I915_TTM_PRIO_NO_PAGES)
> +			bo->priority = I915_TTM_PRIO_NO_PAGES;
> +	}
> +
> +	ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> +	spin_unlock(&bo->bdev->lru_lock);
> +}
> +
> +/*
> + * TTM-backed gem object destruction requires some clarification.
> + * Basically we have two possibilities here. We can either rely on the
> + * i915 delayed destruction and put the TTM object when the object
> + * is idle. This would be detected by TTM which would bypass the
> + * TTM delayed destroy handling. The other approach is to put the TTM
> + * object early and rely on the TTM destroyed handling, and then free
> + * the leftover parts of the GEM object once TTM's destroyed list handling is
> + * complete. For now, we rely on the latter for two reasons:
> + * a) TTM can evict an object even when it's on the delayed destroy list,
> + * which in theory allows for complete eviction.
> + * b) There is work going on in TTM to allow freeing an object even when
> + * it's not idle, and using the TTM destroyed list handling could help us
> + * benefit from that.
> + */
> +static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
> +{
> +	ttm_bo_put(i915_gem_to_ttm(obj));
> +}
> +
> +static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
> +	.name = "i915_gem_object_ttm",
> +	.flags = I915_GEM_OBJECT_HAS_IOMEM,
> +
> +	.get_pages = i915_ttm_get_pages,
> +	.put_pages = i915_ttm_put_pages,
> +	.truncate = i915_ttm_purge,
> +	.adjust_lru = i915_ttm_adjust_lru,
> +	.delayed_free = i915_ttm_delayed_free,
> +};
> +
> +void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
> +{
> +	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +
> +	i915_gem_object_release_memory_region(obj);
> +	call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
> +}
> +
> +/**
> + * __i915_gem_ttm_object_init - Initialize a ttm-backed i915 gem object
> + * @mem: The initial memory region for the object.
> + * @obj: The gem object.
> + * @size: Object size in bytes.
> + * @flags: gem object flags.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
> +			       struct drm_i915_gem_object *obj,
> +			       resource_size_t size,
> +			       unsigned int flags)
> +{
> +	static struct lock_class_key lock_class;
> +	struct drm_i915_private *i915 = mem->i915;
> +	size_t alignment = 0;
> +	int ret;
> +
> +	/* Adjust alignment to GPU- and CPU huge page sizes. */
> +
> +	if (mem->is_range_manager) {
> +		if (size >= SZ_1G)
> +			alignment = SZ_1G >> PAGE_SHIFT;
> +		else if (size >= SZ_2M)
> +			alignment = SZ_2M >> PAGE_SHIFT;
> +		else if (size >= SZ_64K)
> +			alignment = SZ_64K >> PAGE_SHIFT;
> +	}
> +
> +	drm_gem_private_object_init(&i915->drm, &obj->base, size);
> +	i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
> +	i915_gem_object_init_memory_region(obj, mem);
> +	i915_gem_object_make_unshrinkable(obj);
> +
> +	ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
> +			  ttm_bo_type_kernel, &i915_sys_placement, alignment,
> +			  true, NULL, NULL, i915_ttm_bo_destroy);
> +
> +	obj->read_domains = I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
> +
> +	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> new file mode 100644
> index 000000000000..b8d3dcbb50df
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +#ifndef _I915_GEM_TTM_H_
> +#define _I915_GEM_TTM_H_
> +
> +#include "gem/i915_gem_object_types.h"
> +
> +/**
> + * i915_gem_to_ttm - Convert a struct drm_i915_gem_object to a
> + * struct ttm_buffer_object.
> + * @obj: Pointer to the gem object.
> + *
> + * Return: Pointer to the embedded struct ttm_buffer_object.
> + */
> +static inline struct ttm_buffer_object *
> +i915_gem_to_ttm(struct drm_i915_gem_object *obj)
> +{
> +	return &obj->__do_not_access;
> +}
> +
> +/*
> + * i915 ttm gem object destructor. Internal use only.
> + */
> +void i915_ttm_bo_destroy(struct ttm_buffer_object *bo);
> +
> +/**
> + * i915_ttm_to_gem - Convert a struct ttm_buffer_object to an embedding
> + * struct drm_i915_gem_object.
> + *
> + * Return: Pointer to the embedding struct ttm_buffer_object, or NULL
> + * if the object was not an i915 ttm object.
> + */
> +static inline struct drm_i915_gem_object *
> +i915_ttm_to_gem(struct ttm_buffer_object *bo)
> +{
> +	if (GEM_WARN_ON(bo->destroy != i915_ttm_bo_destroy))
> +		return NULL;
> +
> +	return container_of(bo, struct drm_i915_gem_object, __do_not_access);
> +}
> +
> +int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
> +			       struct drm_i915_gem_object *obj,
> +			       resource_size_t size,
> +			       unsigned int flags);
> +#endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index f7366b054f8e..4ae1f717a94c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -9,6 +9,7 @@
>   #include "intel_region_ttm.h"
>   #include "gem/i915_gem_lmem.h"
>   #include "gem/i915_gem_region.h"
> +#include "gem/i915_gem_ttm.h"
>   #include "intel_region_lmem.h"
>   
>   static int init_fake_lmem_bar(struct intel_memory_region *mem)
> @@ -107,7 +108,7 @@ region_lmem_init(struct intel_memory_region *mem)
>   static const struct intel_memory_region_ops intel_region_lmem_ops = {
>   	.init = region_lmem_init,
>   	.release = region_lmem_release,
> -	.init_object = __i915_gem_lmem_object_init,
> +	.init_object = __i915_gem_ttm_object_init,
>   };
>   
>   struct intel_memory_region *
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 180f6e9107d4..350283ab9a83 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1005,8 +1005,11 @@ i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
>   		}
>   	}
>   
> -	if (obj->mm.madv != __I915_MADV_PURGED)
> +	if (obj->mm.madv != __I915_MADV_PURGED) {
>   		obj->mm.madv = args->madv;
> +		if (obj->ops->adjust_lru)
> +			obj->ops->adjust_lru(obj);
> +	}
>   
>   	if (i915_gem_object_has_pages(obj)) {
>   		struct list_head *list;
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
> index 4092cc987679..bd27e897d4d0 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -149,7 +149,6 @@ intel_memory_region_create(struct drm_i915_private *i915,
>   
>   	mutex_init(&mem->objects.lock);
>   	INIT_LIST_HEAD(&mem->objects.list);
> -	INIT_LIST_HEAD(&mem->objects.purgeable);
>   	INIT_LIST_HEAD(&mem->reserved);
>   
>   	mutex_init(&mem->mm_lock);
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
> index e69cde13daf2..7b5fa97c0b59 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -100,7 +100,6 @@ struct intel_memory_region {
>   	struct {
>   		struct mutex lock; /* Protects access to objects */
>   		struct list_head list;
> -		struct list_head purgeable;
>   	} objects;
>   
>   	size_t chunk_size;
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
> index 3bd9caa60298..a74cae4602b5 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -10,8 +10,7 @@
>   
>   #include "intel_region_ttm.h"
>   
> -/* A Zero-initialized driver for now. We don't have a TTM backend yet. */
> -static struct ttm_device_funcs i915_ttm_bo_driver;
> +extern struct ttm_device_funcs i915_ttm_bo_driver;
>   
>   /**
>    * DOC: TTM support structure
> @@ -198,6 +197,7 @@ struct sg_table *intel_region_ttm_node_to_st(struct intel_memory_region *mem,
>   	return i915_sg_from_mm_node(node, mem->region.start);
>   }
>   
> +#ifdef CONFIG_DRM_I915_SELFTEST
>   /**
>    * intel_region_ttm_node_alloc - Allocate memory resources from a region
>    * @mem: The memory region,
> @@ -244,3 +244,4 @@ void *intel_region_ttm_node_alloc(struct intel_memory_region *mem,
>   		ret = -ENXIO;
>   	return ret ? ERR_PTR(ret) : res.mm_node;
>   }
> +#endif
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.h b/drivers/gpu/drm/i915/intel_region_ttm.h
> index 40129f7e0317..9a5b0437d73f 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.h
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.h
> @@ -21,9 +21,12 @@ void intel_region_ttm_fini(struct intel_memory_region *mem);
>   struct sg_table *intel_region_ttm_node_to_st(struct intel_memory_region *mem,
>   					     void *node);
>   
> +void intel_region_ttm_node_free(struct intel_memory_region *mem,
> +				void *node);
> +
> +#ifdef CONFIG_DRM_I915_SELFTEST
>   void *intel_region_ttm_node_alloc(struct intel_memory_region *mem,
>   				  resource_size_t size,
>   				  unsigned int flags);
> -void intel_region_ttm_node_free(struct intel_memory_region *mem,
> -				void *node);
> +#endif
>   #endif /* _INTEL_REGION_TTM_H_ */
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 4479c55aaa1d..74004d5cbfa2 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1150,6 +1150,14 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   		return -EBUSY;
>   	}
>   
> +	if (bo->bdev->funcs->swap_possible) {
> +		if (!bo->bdev->funcs->swap_possible(bo)) {
> +			if (locked)
> +				dma_resv_unlock(bo->base.resv);
> +			return -EBUSY;
> +		}
> +	}
> +
>   	if (bo->deleted) {
>   		ttm_bo_cleanup_refs(bo, false, false, locked);
>   		ttm_bo_put(bo);
> @@ -1200,6 +1208,10 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   	if (bo->bdev->funcs->swap_notify)
>   		bo->bdev->funcs->swap_notify(bo);
>   
> +	/* The call to swap_notify may have purged the bo */
> +	if (!bo->ttm)
> +		goto out;
> +
>   	ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
>   out:
>   
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 7c8f87bd52d3..7c59d35e90f9 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -181,6 +181,15 @@ struct ttm_device_funcs {
>   	 */
>   	void (*delete_mem_notify)(struct ttm_buffer_object *bo);
>   
> +	/**
> +	 * struct ttm_bo_driver member swap_possible
> +	 *
> +	 * @bo: the buffer object to be evicted
> +	 *
> +	 * Check with the driver if it is possible to swap out a BO.
> +	 */
> +	bool (*swap_possible)(struct ttm_buffer_object *bo);
> +
>   	/**
>   	 * notify the driver that we're about to swap out this bo
>   	 */

