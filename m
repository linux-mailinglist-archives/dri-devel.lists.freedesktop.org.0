Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6615D3F4762
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 11:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E25189C6B;
	Mon, 23 Aug 2021 09:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5B789C6B;
 Mon, 23 Aug 2021 09:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9laF7/9k9dVWxXJmIIH4YLZANGlzXaHroARNf88MKPtGFu1WKwwYGvImzdl3rhRj1KzsHDqK6LzQii0EZ2IVp6WCOTYYTi7ouhYkZLvTZGWByfQYJD8zuWQDYBWC5n/O8DDwNld3KioOz9/dTp+nEFRY+6rdaPDSafN3Q8mkXpSIpI+F32k6f+VrnNvUQy+INp0JRIMGOcNzdHhXgGIWfMhIV3FIdDoXxalwVDFcEpBF+pmAQURw/1i4J/DU1WnhOgLAmnVyiWHZN77XejziZopJXKV6RTXphmqB9n/F6XrNJfMu+Nv7Tcl7ah0wp5pXbku21sEYasLL0AEEK2jsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SD/k8y8ClWWbsZB2MjUvVnzzNQvRhWDxj96TZTKnajw=;
 b=cyUlhpLKOj3OPETZKUn5Lta7aAykYDTr088hn2D40e3odGmHJ65RZQ4B0PFOnEYtJ1+/M4EUCrBV/gGFRq74kZHZt5y5OId0Ngd//lKaYHnn+x0NcWCOZvsE9CTtjrdNYbdX37l8EKbQrmBuT899zJ+iV+sRy0lWuf9ERTz9lGrgJniqYuW6l8GzvpH/dHx2OH3iphBuNW3kpcZlnML/1ZxgW0Va8YdGfxKydllA19qFGI3P8OvdVGK7HZG/gyY8ON1G9sbiCXEKGwNHJLO6hHGIkMCmDFWINgsTFz8UxOhZz21W/Y/FhYCSrW5CIQXUKb1ibvyGw8GRiusqIZXGvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SD/k8y8ClWWbsZB2MjUvVnzzNQvRhWDxj96TZTKnajw=;
 b=AA5kx6Wsoc1EL/IDb3v/4JUZWt9kDwJuDIhnsVPFVBokRvtQSB9iNWcVMKXouA5AbUDJP6FSQwO5AgocOvt4MDDA3fO55fR3LDDn/GCDMG7L4F1iwxI5MMv/n3e8ri7ykxHnro2z4fJ+TarRXlDQbQNNhwJK/TsSL0jwlrzQHVs=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 09:09:29 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 09:09:29 +0000
Subject: Re: [PATCH v2 2/2] drm/ttm, drm/i915: Update ttm_move_memcpy for
 async use
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
References: <20210813144331.372957-1-thomas.hellstrom@linux.intel.com>
 <20210813144331.372957-3-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ba3c7bbc-7fb5-396e-4495-a5b2f437431b@amd.com>
Date: Mon, 23 Aug 2021 11:09:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210813144331.372957-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0079.eurprd03.prod.outlook.com
 (2603:10a6:208:69::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR03CA0079.eurprd03.prod.outlook.com (2603:10a6:208:69::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 09:09:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07aef0ae-a421-4178-e1b8-08d96615b698
X-MS-TrafficTypeDiagnostic: MN2PR12MB4207:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42078715E46CBD5B0C059FEC83C49@MN2PR12MB4207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/eT+5KjWQfk1cRbVTHNU2AzpF5mpMQPUAwITxaW6I5tvY0vdeOWsBmvT1wSmyEscwuyXpY1U6mTgMQNqAG3+ev4PhCIbsIRfUgOaLViEsE0SrfpmAjBC8EIn8GD0Bv4DuPBlQrBcctAvVgEjnEpGDur/0bsIFBZPQXrVmVQjpsnQGsj1Kjrl3igPZsIk24PtoFXC8vSmwHDUAh4hLL3keEWC4xRtKpU5JLDy4l7fNpmiAhhbygClBdlH7khZCPUSNzRtP9/k+vdekXZEq2jXx2E/VGhIwxKCVKJXM73xzgURo6t+ZSzgOrdSFXHcyWSy/ZuhX8/MBvhUc4YAiHJC+jYFwEaHU9pKAL/fdh4RH1Mi5tdWhFNrFwK9GmeYoKJHIT4lkxSkyTUolkKFdff//W0Jfb9MBjw9bWH2fumVhUp8QTQIU5J6VcCxrBKf/2wOYI4NlOXVBgLGvx+FEy88KScXktCtGBtLUEFqhClGPo0fNyI5trDdJ4zRfQP2B4INcHCMpW+6SrdbfjVY1KvueWEHrc4ANul6JojYADEourvz4KoA95L33LGbaTMUoEHpPwdmEsu/W3cjOa1r0H6MmSrnYbHWRskWU94Co7TvMgczPRgiXcoLm/txW1iILd3IuwmkjeUlEHDNyji0VWdg1GM8TrnMGJizp5/tkjbdGd8559DusXXweCbIYhkNBbseDqRv2+4XOASsXRBqPNK3msmIfT/oesaXwcfiQzAxZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(956004)(83380400001)(2616005)(26005)(186003)(66574015)(2906002)(6486002)(36756003)(38100700002)(15650500001)(316002)(66476007)(478600001)(16576012)(6666004)(66556008)(4326008)(66946007)(31696002)(5660300002)(8676002)(8936002)(31686004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFJaOGVLeFNwU00wOUFsSzNXc0xHaWRHRHhCM09TTHdmbEF4ZVJPNmRlNEdT?=
 =?utf-8?B?Q0k4NVJKTzZhYTFFYWpkSkI3OEJmUXUxKzQweU9EL1VTNFVYdkRCY3lsUkVw?=
 =?utf-8?B?OUxtMzZKaWRBMkFxZzFoREhSL0s2Y09mTUliRXMyZ0FGRmo5ZVFrRkEyZmQy?=
 =?utf-8?B?VDcxSHFndE1GblFudGFHTkR5ZmIrc1g3OFdMQnYrbzZ5dDlNUHFBYndtOEpo?=
 =?utf-8?B?SDhSQ1J3aXgvVmUyMmxEaG1tVnFpZjU5ZVNkTlRNdUNROVNDWGZUVVd6eFlI?=
 =?utf-8?B?d3JxdXF2L2RBME1XSEg4NVR1U1B6dE1RL2RSd0NMVUZveWc0N3VXM21KTzEw?=
 =?utf-8?B?NTFVQS9CakR3S3pBWjZyOXJLT0NZdHRJd2lLQ09zVjEwa08rUlN4RGtobWxL?=
 =?utf-8?B?ejlHaDZwdUhMYVNwZWNQRC9kMHJ6YW9wMXF5TDBnSnMrendwM2t1UUQyZ1VT?=
 =?utf-8?B?UW5ndkp2TDVVRU9OVnNpVzF6ZzU4a25SWVNTeE8vdnFWWFordVdYblo0YzNp?=
 =?utf-8?B?TllwNjc0YVRGL05tM0pZeGthMVRPYmZGZTNTTVdZQjdVelJ3QlJpbHhGWGpX?=
 =?utf-8?B?V1JqbXptaEtsSGVEYzVvbmlOZFE1QWRPZDdjQXFxQjVnTFNUcEhadTFYdmpD?=
 =?utf-8?B?VXVJd3Q5VHlpaE8wNzBiS0NnWmpONnJOQVV1cHplSDE4bnUyS2lpS3doUnV1?=
 =?utf-8?B?ckZKcHV2QklRYm1JSjZEUFVvNXI3MWxtZVZJcnByUG45SGYyT0hFakc5dlpB?=
 =?utf-8?B?UVhUNC82TjlLUjFIYlNZT3BqMm1IMUxTcDF0VzZiOVp6OCtLWHdURnI1dFRh?=
 =?utf-8?B?bEY3Z05RN0RlMTN0cjBOMXkrV1FsVmFoaENFZEEyM2hQOXJNUUcxUGZySVVO?=
 =?utf-8?B?WEw4UFZNbms1ZWliTHhZVFMvVC9QeFpCWDFuRGN5REJjY3NyQld2Q0tkY3d4?=
 =?utf-8?B?NFM3S3BzTjQ5SHRXbGk0MHl6ay9mV09WekFMQzlTSmZOcmg3ajIwclNTd1p4?=
 =?utf-8?B?REs3T3djME5NTXR5NUxGTncvaThDazhDZWlMR2VJdkt1dkRUaGZSVFR4NnZR?=
 =?utf-8?B?ZHhvQ3pkUGNmdjFUTlpveDJZUEVTTERDTGF3ZTdJNklUcm5CbHZZLytib1Vz?=
 =?utf-8?B?SUdTYUhEdXJxZ3RyZnhyNWhDdGdhZi94aW00b2tNSHdyVXdmanY1OWhpSHJM?=
 =?utf-8?B?dzVCSHJpd0kwVFFZbXZydHNZRVdDSWhiRVF3OTBUa2JMT3BuYWlhLzcvSmpn?=
 =?utf-8?B?WEdmWXlaSVFwajEwaEh3R1c1ekNTVE9XTWRockFOdkk0dm44K3EwUkVDSGta?=
 =?utf-8?B?WXJNa1B0Qjc5VG0rb2R0VktaR2g5dWZncjlocnZvQWhZZVk3YmcxZHBXaERR?=
 =?utf-8?B?T3VKUi94R2U1LzFvSDdQdDVZdlk1QzFTY24rdXFOSjE0dGlXM1FiVzUxaVA1?=
 =?utf-8?B?ZDhMRGU1aG1JVk1EWnJ2UHp1ZElkUzVReXg2THhlTkFyUXg4clYvZ2IydHJW?=
 =?utf-8?B?QmExaHVCSG92VnVmNmUzNWdQaEpLVVJrZlJSNDVpYkxTZTN5MmJvaXdGckhs?=
 =?utf-8?B?NG5iVnVXMmpEZkUrUFpqRFh6ekpka1hvQkE1NEFUMHZ1OVgwSzZpV0JGNXZO?=
 =?utf-8?B?a2NWcUxyNVBrUnEvaHBubCtYbWJrSmZaUC93WHkxUm1BbDdyMkZsWmEwUVkz?=
 =?utf-8?B?U2NRY0xoVG1WbCtUallPaDB5Q002RGRaRUluWkVRQVdyOGtkZWlZQlRieUFz?=
 =?utf-8?Q?lIAkVIK+SaTC0S0zmIkn+TVEaEh+LTAeFaHPePz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07aef0ae-a421-4178-e1b8-08d96615b698
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 09:09:29.5673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvrHl1blBI0xcB54quz9ubDuHcP7kaK56qlGBqu2BEiqPK1iM4w+eHCx/MFs6est
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

Am 13.08.21 um 16:43 schrieb Thomas Hellström:
> The buffer object argument to ttm_move_memcpy was only used to
> determine whether the destination memory should be cleared only
> or whether we should copy data. Replace it with a "clear" bool, and
> update the callers.
>
> The intention here is to be able to use ttm_move_memcpy() async under
> a dma-fence as a fallback if an accelerated blit fails in a security-
> critical path where data might leak if the blit is not properly
> performed. For that purpose the bo is an unsuitable argument since
> its relevant members might already have changed at call time.
>
> Finally, update the ttm_move_memcpy kerneldoc that seems to have
> ended up with a stale version.
>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  2 +-
>   drivers/gpu/drm/ttm/ttm_bo_util.c       | 20 ++++++++++----------
>   include/drm/ttm/ttm_bo_driver.h         |  2 +-
>   3 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index d07de18529ab..6995c66cbe21 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -518,7 +518,7 @@ static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
>   						 obj->ttm.cached_io_st,
>   						 src_reg->region.start);
>   
> -		ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
> +		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 763fa6f4e07d..5c20d0541cc3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -78,22 +78,21 @@ void ttm_mem_io_free(struct ttm_device *bdev,
>   
>   /**
>    * ttm_move_memcpy - Helper to perform a memcpy ttm move operation.
> - * @bo: The struct ttm_buffer_object.
> - * @new_mem: The struct ttm_resource we're moving to (copy destination).
> - * @new_iter: A struct ttm_kmap_iter representing the destination resource.
> + * @clear: Whether to clear rather than copy.
> + * @num_pages: Number of pages of the operation.
> + * @dst_iter: A struct ttm_kmap_iter representing the destination resource.
>    * @src_iter: A struct ttm_kmap_iter representing the source resource.
>    *
>    * This function is intended to be able to move out async under a
>    * dma-fence if desired.
>    */
> -void ttm_move_memcpy(struct ttm_buffer_object *bo,
> +void ttm_move_memcpy(bool clear,
>   		     u32 num_pages,
>   		     struct ttm_kmap_iter *dst_iter,
>   		     struct ttm_kmap_iter *src_iter)
>   {
>   	const struct ttm_kmap_iter_ops *dst_ops = dst_iter->ops;
>   	const struct ttm_kmap_iter_ops *src_ops = src_iter->ops;
> -	struct ttm_tt *ttm = bo->ttm;
>   	struct dma_buf_map src_map, dst_map;
>   	pgoff_t i;
>   
> @@ -102,10 +101,7 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
>   		return;
>   
>   	/* Don't move nonexistent data. Clear destination instead. */
> -	if (src_ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm))) {
> -		if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
> -			return;
> -
> +	if (clear) {
>   		for (i = 0; i < num_pages; ++i) {
>   			dst_ops->map_local(dst_iter, &dst_map, i);
>   			if (dst_map.is_iomem)
> @@ -149,6 +145,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   		struct ttm_kmap_iter_linear_io io;
>   	} _dst_iter, _src_iter;
>   	struct ttm_kmap_iter *dst_iter, *src_iter;
> +	bool clear;
>   	int ret = 0;
>   
>   	if (ttm && ((ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) ||
> @@ -172,7 +169,10 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   		goto out_src_iter;
>   	}
>   
> -	ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
> +	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
> +	if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)))
> +		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
> +
>   	src_copy = *src_mem;
>   	ttm_bo_move_sync_cleanup(bo, dst_mem);
>   
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 68d6069572aa..5f087575194b 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -322,7 +322,7 @@ int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem);
>    */
>   void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>   
> -void ttm_move_memcpy(struct ttm_buffer_object *bo,
> +void ttm_move_memcpy(bool clear,
>   		     u32 num_pages,
>   		     struct ttm_kmap_iter *dst_iter,
>   		     struct ttm_kmap_iter *src_iter);

