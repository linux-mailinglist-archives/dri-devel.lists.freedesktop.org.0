Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7910D4855D8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 16:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263A810FDDD;
	Wed,  5 Jan 2022 15:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C435F10FDDC;
 Wed,  5 Jan 2022 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641396503; x=1672932503;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1OVXCeRd/IyTu4Q82evCe1+rQxvSLdl+PJ93doBdwgc=;
 b=ZaKrq5ucqIMH4DbYhQdMSoOYD0VcUBfW9AYoTWTx5xqMl7sN6LxQZAZE
 ARyXJWyNvap1BMc/BmHKSuRXgXrVOfzkw0kiRMMc+Jwq3mBzVn4VV5tcL
 UZ8nt3/ypLfhKEwvf5HoWbAxkSa4jHked/drOJSm3tm8nM6/2oZdQ4ZlD
 iecIlxMpZxgHA+Ex6kXrolPq50urwQug0knzNuHlk7shu5ixIFy3yo7sf
 xI/emwaiRAhcMcNI80TFye40Wsvyo3vwTCKIfB5nGU68fNGweEt7dV1ZL
 cuYBfpra4Seghf6v4I2GD7CZXOIcxufwCuga7wv68L7MLbOQSkMawF53F Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="328810320"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="328810320"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:28:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="512987457"
Received: from fhoeg-mobl1.ger.corp.intel.com (HELO [10.249.254.213])
 ([10.249.254.213])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:28:16 -0800
Message-ID: <b882dfb625b00c15ae3a0c60408c35b383f93364.camel@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/i915/ttm: ensure we unmap when purging
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Wed, 05 Jan 2022 16:28:14 +0100
In-Reply-To: <20220105145835.142950-3-matthew.auld@intel.com>
References: <20220105145835.142950-1-matthew.auld@intel.com>
 <20220105145835.142950-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-01-05 at 14:58 +0000, Matthew Auld wrote:
> Purging can happen during swapping out, or directly invoked with the
> madvise ioctl. In such cases this doesn't involve a ttm move, which
> skips umapping the object.
> 
> Fixes: cf3e3e86d779 ("drm/i915: Use ttm mmap handling for ttm bo's.")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 8d61d4538a64..f148e7e48f86 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -399,6 +399,8 @@ int i915_ttm_purge(struct drm_i915_gem_object
> *obj)
>         if (obj->mm.madv == __I915_MADV_PURGED)
>                 return 0;
>  
> +       ttm_bo_unmap_virtual(bo);
> +
>         ret = ttm_bo_validate(bo, &place, &ctx);
>         if (ret)
>                 return ret;

The swap notifier and the move code both call i915_ttm_move_notify() to
achieve this before calling i915_ttm_purge. This ensures both cpu- and
gpu ptes are torn down, and also when we extend to dynamic dma-buf
exporting, makes sure dma-buf importers unbind.

So I suggest we make a i915_ttm_truncate wrapper function that calls
i915_ttm_move_notify() and then ttm_bo_purge(), and use that as the
truncate callback as well as from those places we call i915_ttm_purge
without a prior call to i915_ttm_move_notify(), which seems to be the
ones you've identified in patch 3 and 4,

/Thomas




