Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0D745B745
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 10:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DF96E9D4;
	Wed, 24 Nov 2021 09:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C59D6E9D4;
 Wed, 24 Nov 2021 09:19:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="222115973"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="222115973"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 01:19:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="509804292"
Received: from moconno1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.21.40])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 01:19:02 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: cgel.zte@gmail.com
Subject: Re: [PATCH] drm/i915/dmabuf: remove duplicate include in
 i915_gem_dmabuf.c
In-Reply-To: <20211124030607.34914-1-yao.jing2@zte.com.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211124030607.34914-1-yao.jing2@zte.com.cn>
Date: Wed, 24 Nov 2021 11:18:59 +0200
Message-ID: <87mtltnc70.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: tvrtko.ursulin@linux.intel.com, jason@jlekstrand.net, yao.jing2@zte.com.cn,
 thomas.hellstrom@linux.intel.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, rodrigo.vivi@intel.com, Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Nov 2021, cgel.zte@gmail.com wrote:
> From: Yao Jing <yao.jing2@zte.com.cn>
>
> 'asm/smp.h' included in 'drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c' is
> duplicated. It is clearly included on the 12 line.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Yao Jing <yao.jing2@zte.com.cn>

The correct fix is [1].

If you keep sending patches from cgel.zte@gmail.com, you need to add
your Signed-off-by too.

BR,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/20211122135758.85444-1-tvrtko.ursulin@linux.intel.com



> ---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index f291cf4c3886..5712b6b5f285 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -17,9 +17,7 @@
>  
>  MODULE_IMPORT_NS(DMA_BUF);
>  
> -#if defined(CONFIG_X86)
> -#include <asm/smp.h>
> -#else
> +#if !defined(CONFIG_X86)
>  #define wbinvd_on_all_cpus() \
>  	pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
>  #endif

-- 
Jani Nikula, Intel Open Source Graphics Center
