Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A63E4BFE8B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439BE10E709;
	Tue, 22 Feb 2022 16:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D43110E672;
 Tue, 22 Feb 2022 16:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645547310; x=1677083310;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yOy9wKhpTzMIgiJVor0t6E5cNveJwZO+KgH0Mq7wBMU=;
 b=ErB07F7rpP/oM1zC9ds8aqTz3LJLJ/Qb5xm6KH/qTF3WGOAiNEm+BMXq
 hThkMP3mECTq9Aez/uX1K4RsihKRcPTO3ao+4SjpsqksYEK4WoLyGi0FY
 zCRMwG5IIoHWoUbG/HB1DFZDqna4VuhueyUh7GvvGsyof5c4CgD72R2AT
 wrfz6l3WN/f8lC0S/Jz2lpt/OpoioXOWvWr9tu2DwGkxTK9cMV3gOJClE
 4MAfed1qaToaLT9mlfcqg3/2xTnbavbsevcTyzHY1SEcszVLAOmpY9N7n
 iyK2MXqgwlcnKRfpi8bgUyVS4VACCcZ+V0SXUNTnTRKoTCpNwnpOQVkK0 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="231718450"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="231718450"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 08:28:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="508050505"
Received: from sjgillin-mobl.ger.corp.intel.com (HELO [10.213.218.63])
 ([10.213.218.63])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 08:28:26 -0800
Message-ID: <2b3dd219-7540-6982-15d2-375255921de6@linux.intel.com>
Date: Tue, 22 Feb 2022 16:28:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915: Check input parameter for NULL
Content-Language: en-US
To: Yongzhi Liu <lyz_cs@pku.edu.cn>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, thomas.hellstrom@linux.intel.com,
 maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 matthew.d.roper@intel.com, tzimmermann@suse.de, michal.winiarski@intel.com
References: <1645541161-46607-1-git-send-email-lyz_cs@pku.edu.cn>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1645541161-46607-1-git-send-email-lyz_cs@pku.edu.cn>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 22/02/2022 14:46, Yongzhi Liu wrote:
> [why]
> i915_gem_object_put_pages_phys() frees pages and standard
> pattern is to allow caller to not care if it's
> NULL or not. This will reduce burden on
> the callers to perform this check.

I don't think we want this in general, and definitely not just for phys 
objects and leaving others not handle NULL.

See comment at the call site for these vfuncs:

	/*
	 * XXX Temporary hijinx to avoid updating all backends to handle
	 * NULL pages. In the future, when we have more asynchronous
	 * get_pages backends we should be better able to handle the
	 * cancellation of the async task in a more uniform manner.
	 */
	if (!IS_ERR_OR_NULL(pages))
		obj->ops->put_pages(obj, pages);

Maarten owns this area these days so he can comment as well.

Regards,

Tvrtko

> [how]
> Fix it by adding Null check.
> 
> Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_phys.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> index ca6faff..09c3dcb 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> @@ -95,8 +95,13 @@ void
>   i915_gem_object_put_pages_phys(struct drm_i915_gem_object *obj,
>   			       struct sg_table *pages)
>   {
> -	dma_addr_t dma = sg_dma_address(pages->sgl);
> -	void *vaddr = sg_page(pages->sgl);
> +	dma_addr_t dma;
> +	void *vaddr;
> +
> +	if (!pages)
> +		return;
> +	dma = sg_dma_address(pages->sgl);
> +	vaddr = sg_page(pages->sgl);
>   
>   	__i915_gem_object_release_shmem(obj, pages, false);
>   
