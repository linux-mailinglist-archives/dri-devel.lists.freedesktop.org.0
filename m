Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE443FE7B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 16:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDF36EA6B;
	Fri, 29 Oct 2021 14:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C676EA64;
 Fri, 29 Oct 2021 14:32:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="294136305"
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="294136305"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 07:32:25 -0700
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="495743806"
Received: from ekolpasx-mobl.ccr.corp.intel.com (HELO [10.249.254.219])
 ([10.249.254.219])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 07:32:23 -0700
Message-ID: <59e6d31b-1269-1c7b-1a1d-b5baebae1d1f@linux.intel.com>
Date: Fri, 29 Oct 2021 16:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] drm/i915/dmabuf: drop the flush on discrete
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
References: <20211029122137.3484203-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211029122137.3484203-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 10/29/21 14:21, Matthew Auld wrote:
> We were overzealous here; even though discrete is non-LLC, it should
> still be always coherent.
>
> v2(Thomas & Daniel)
>    - Be extra cautious and limit to DG1
>    - Add some more commentary
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index a45d0ec2c5b6..a2b485a1be8c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -250,8 +250,19 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>   	if (IS_ERR(pages))
>   		return PTR_ERR(pages);
>   
> -	/* XXX: consider doing a vmap flush or something */
> -	if (!HAS_LLC(i915) || i915_gem_object_can_bypass_llc(obj))
> +	/*
> +	 * DG1 is special here since it still snoops transactions even with
> +	 * CACHE_NONE. This is not the case with other HAS_SNOOP platforms. We
> +	 * might need to revisit this as we add new discrete platforms.
> +	 *
> +	 * XXX: Consider doing a vmap flush or something, where possible.
> +	 * Currently we just do a heavy handed wbinvd_on_all_cpus() here since
> +	 * the underlying sg_table might not even point to struct pages, so we
> +	 * can't just call drm_clflush_sg or similar, like we do elsewhere in
> +	 * the driver.
> +	 */
> +	if (i915_gem_object_can_bypass_llc(obj) ||
> +	    (!HAS_LLC(i915) && !IS_DG1(i915)))
>   		wbinvd_on_all_cpus();
>   
>   	sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
