Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9335B52B5A4
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 11:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494B610E33E;
	Wed, 18 May 2022 09:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5932B10E21D;
 Wed, 18 May 2022 09:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652865524; x=1684401524;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=x6+xLJLy424jRn+ls6ZtshJIDqjKbcdrfnO1KbfBzHI=;
 b=N5qrCRcoUUtW/s00XX2vZbGQb/YpjEilawa6/25UY5RRPsOwTwnzIQ/n
 bObFsKPzUWCBFhSq5ASPyONNRzSMKAZL3GfkLg7Z8v4lmkxyhVOm2QAhz
 etxjrgqHRsxoyP5ibN2woZXGIGhyoonz1T6BZkdf+2l9FvlgWhSQr2neI
 vFKZbcvFGn74FqHem/IvPU0En6zhXnGtK7HWmG9g4XZA1zWD7t9fd3/X/
 1gCD5VMD2DZDF5a0MoOxo+mY/a4RKPYdOz0IbiTHmq4Uq8S5yk2SSNKWl
 xVzSuw5iOBU+ODIfor/epsEryAgGotueYJ72K+fkcCfEcVemUY4uj5h+g Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="251471660"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="251471660"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 02:18:43 -0700
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="597680228"
Received: from lfurlonx-mobl.ger.corp.intel.com (HELO [10.213.226.64])
 ([10.213.226.64])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 02:18:40 -0700
Message-ID: <f2d01359-02b7-d19e-ae3d-866328eb4371@linux.intel.com>
Date: Wed, 18 May 2022 10:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/i915: check fence to avoid null pointer dereference
Content-Language: en-US
To: Yongzhi Liu <lyz_cs@pku.edu.cn>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, John.C.Harrison@Intel.com, matthew.auld@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 maarten.lankhorst@linux.intel.com
References: <1652806601-88104-1-git-send-email-lyz_cs@pku.edu.cn>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1652806601-88104-1-git-send-email-lyz_cs@pku.edu.cn>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 17/05/2022 17:56, Yongzhi Liu wrote:
> if drm_syncobj_fence_get return null, we will get a
> null pointer. Fix this by adding the null pointer check
> on fence.
> 
> Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index fd0e15d..3a82a62 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3184,6 +3184,10 @@ eb_fences_add(struct i915_execbuffer *eb, struct i915_request *rq,
>   		struct dma_fence *fence;
>   
>   		fence = drm_syncobj_fence_get(eb->gem_context->syncobj);
> +		if (!fence) {
> +			DRM_DEBUG("Syncobj has no fence\n");
> +			return ERR_PTR(-EINVAL);

Lookup can't fail here since reference to context is held and syncobj 
can't get replaced during that time. You could make it a single 
GEM_BUG_ON(!fence) instead if you really wanted but I am not convinced 
it would be useful.

Regards,

Tvrtko

> +		}
>   		err = i915_request_await_dma_fence(rq, fence);
>   		dma_fence_put(fence);
>   		if (err)
