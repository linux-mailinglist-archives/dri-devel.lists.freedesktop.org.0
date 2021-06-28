Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E51A3B5CD4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 12:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54266E423;
	Mon, 28 Jun 2021 10:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321F26E42C;
 Mon, 28 Jun 2021 10:59:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="207968636"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="207968636"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 03:59:15 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="419126181"
Received: from vipulcha-mobl.ger.corp.intel.com (HELO [10.213.225.54])
 ([10.213.225.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 03:59:13 -0700
Subject: Re: [PATCH v3] drm/i915: Reinstate the mmap ioctl for some platforms
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210628092106.55270-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <15bf15c2-3a0c-00b2-e1bc-7b329964e60b@intel.com>
Date: Mon, 28 Jun 2021 11:59:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210628092106.55270-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/06/2021 10:21, Thomas Hellström wrote:
> Reinstate the mmap ioctl for all current integrated platforms.
> The intention was really to have it disabled for discrete graphics
> where we enforce a single mmap mode.
> 
> This fixes media on rkl/adl.
> 
> v2:
> - Added a R-B.
> - Fixed up the code comment a bit.
> v3:
> - Added an A-B.
> - Point out in the commit message that there was an issue with media on
>    rkl/adl.
> 
> Fixes: 35cbd91eb541 ("drm/i915: Disable mmap ioctl for gen12+")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I already pushed v2 of this last week with the following amended:

"This was reported to break ADL-P with the media stack, which was not 
the intention. Although longer term we do still plan to sunset this 
ioctl even for integrated, in favour of using mmap_offset instead."

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 6497a2dbdab9..a90f796e85c0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -62,10 +62,11 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void *data,
>   	struct drm_i915_gem_object *obj;
>   	unsigned long addr;
>   
> -	/* mmap ioctl is disallowed for all platforms after TGL-LP.  This also
> -	 * covers all platforms with local memory.
> +	/*
> +	 * mmap ioctl is disallowed for all discrete platforms,
> +	 * and for all platforms with GRAPHICS_VER > 12.
>   	 */
> -	if (GRAPHICS_VER(i915) >= 12 && !IS_TIGERLAKE(i915))
> +	if (IS_DGFX(i915) || GRAPHICS_VER(i915) > 12)
>   		return -EOPNOTSUPP;
>   
>   	if (args->flags & ~(I915_MMAP_WC))
> 
