Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5693C5BEBAD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 19:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B337710E731;
	Tue, 20 Sep 2022 17:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE9A10E734;
 Tue, 20 Sep 2022 17:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663694021; x=1695230021;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LmQGZHj3bJu/8I5fJa739mbzByBOpAJvgS9+rBuZ150=;
 b=kyaPqPWA+dDsbei4neqUq/13r78YUmCgmp2EdI8x7KYeXHvQVlCOfUvj
 B6/NOuDP8ujmiGgBNAVMtlZF3CK/To7Fjvk472OnCjY6LANBZwVWue1c9
 +wTvcXFd2VKXH5jciLdXqsl+mEfAPiErb2Vic16eoLBxOfbVrPEHcwNUS
 d6VD8mj3vxMdl00hiiX/w8ksVqRh02PVoLkiSIH4kb8CeAK31JYzt8qlj
 Wpo+ql/s093A333T4dUmc0sOcfhV8bP0ZFAaiZwPEYzIgkL2zTEXL/iFJ
 vuOdXmn32hXI3mMQ0H3bJ30FVtk0tIJ6XDReYXxb9W8uCNTg+Hmy+Gr8X Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="297355269"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="297355269"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 10:13:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="681391598"
Received: from kfmccaff-mobl.amr.corp.intel.com (HELO [10.252.17.189])
 ([10.252.17.189])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 10:13:39 -0700
Message-ID: <180ffaa1-1739-5a84-b0e7-76685c577518@intel.com>
Date: Tue, 20 Sep 2022 18:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH] drm/i915: Do not cleanup obj with NULL bo->resource
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220920170628.3391-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220920170628.3391-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: anshuman.gupta@intel.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/09/2022 18:06, Nirmoy Das wrote:
> For delayed BO release i915_ttm_delete_mem_notify()
> gets called twice, once with proper bo->resource and
> another time with NULL. We shouldn't do anything for
> the 2nd time as we already cleanedup the obj once.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/6850
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Christian, as per above it looks like ttm calls into the 
delete_mem_notify() hook twice if the object ends up on the delayed 
destroy list, is that expected/normal?

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 0544b0a4a43a..e3fc38dd5db0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -511,7 +511,7 @@ static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>   	intel_wakeref_t wakeref = 0;
>   
> -	if (likely(obj)) {
> +	if (bo->resource && likely(obj)) {
>   		/* ttm_bo_release() already has dma_resv_lock */
>   		if (i915_ttm_cpu_maps_iomem(bo->resource))
>   			wakeref = intel_runtime_pm_get(&to_i915(obj->base.dev)->runtime_pm);
