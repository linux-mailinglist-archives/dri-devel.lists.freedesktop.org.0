Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFBE39F07B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8EB6EB21;
	Tue,  8 Jun 2021 08:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAE36EB23
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 08:12:41 +0000 (UTC)
IronPort-SDR: tfA8CgHVKNDobVuF39Y2Q/BZxS80PplribTSPtJ8pZtwfalQouACWcUMytof2WesH6yrFBxAE6
 qPt8BLM045Sw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="290426238"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="290426238"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:12:36 -0700
IronPort-SDR: 7jUBUthb183N5guDV/yZN3roeFk+PiDCBAaWppqN0OKTuC7pZdV2JJugKb81UIvJKMGCMhcYhO
 LkGxXd8K8GtQ==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="634993686"
Received: from delmer-mobl.ger.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:12:34 -0700
Subject: Re: [PATCH] drm/ttm: fix pipelined gutting
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210608075021.3058-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <19fb55aa-c093-5c8c-daea-bad378964af7@linux.intel.com>
Date: Tue, 8 Jun 2021 10:12:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608075021.3058-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 6/8/21 9:50 AM, Christian König wrote:
> We need to make sure to allocate the sys_mem resource before the point
> of no return.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 9be6a10a5873..eccf2ad8f335 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -582,6 +582,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>   {
>   	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
>   	struct ttm_buffer_object *ghost;
> +	struct ttm_resource *sys_res;
>   	struct ttm_tt *ttm;
>   	int ret;
>   
> @@ -602,6 +603,9 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>   		return ttm_resource_alloc(bo, &sys_mem, &bo->resource);
>   	}
>   
> +
> +	ret = ttm_resource_alloc(bo, &sys_mem, &sys_res);

This needs to be moved higher up to also cover the idle optimization path.
Also the return value doesn't seem to be checked?

/Thomas


