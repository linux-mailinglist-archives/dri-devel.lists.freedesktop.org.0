Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BFB4E30CA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 20:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFC210E484;
	Mon, 21 Mar 2022 19:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7422210E483;
 Mon, 21 Mar 2022 19:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647890972; x=1679426972;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vLCkvPLBCbbD0ZqmzCAnsFG4/v3EOkIQoMoagb/MATo=;
 b=Zg+7zeCXcDC4GkfQiI+YTBZfYc8SzUlOMpRg7HDNy5+/CFjregL9QtGA
 k4UB9wcRgcUOs2wdreBj1cxzAsNxdiDMurV/fExA17OTnNiHdK4ioJeyI
 K0Z423WSSKuYDGJp/vlB0z7CcoWHpp8YZS1jin+qPhichDW+HILAlLHLt
 VqmAXY/tAzuhwc+8aHCh+iklCXnSaS3P/BIV1/H83S/C+Pl1FmtGFzwEF
 flQcuOADAY/+L/UDP9bQ43uqJJdpOwKkwpRVVkj1aFg7iNaUoWYtm0yzo
 0HidV+fRP5/rOCl38EK09ao4HIt1GBEl5Oq3y56jfZs8X4shL8aFsv89T g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="282461640"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="282461640"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 12:29:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="646718151"
Received: from eliasbro-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.30.246])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 12:29:30 -0700
Date: Mon, 21 Mar 2022 12:29:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/7] drm: Add drm_memcpy_from_wc() variant
 which accepts destination address
Message-ID: <20220321192929.5tn67cqjqwqazlxh@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
 <20220303180013.512219-3-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220303180013.512219-3-balasubramani.vivekanandan@intel.com>
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
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 michael.cheng@intel.com, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, siva.mullati@intel.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 03, 2022 at 11:30:08PM +0530, Balasubramani Vivekanandan wrote:
>Fast copy using non-temporal instructions for x86 currently exists at two
>locations. One is implemented in i915 driver at i915/i915_memcpy.c and
>another copy at drm_cache.c. The plan is to remove the duplicate
>implementation in i915 driver and use the functions from drm_cache.c.
>
>A variant of drm_memcpy_from_wc() is added in drm_cache.c which accepts
>address as argument instead of iosys_map for destination. It is a very
>common scenario in i915 to copy from a WC memory type, which may be an
>io memory or a system memory to a destination address pointing to system
>memory. To avoid the overhead of creating iosys_map type for the
>destination, new variant is created to accept the address directly.
>
>Also a new function is exported in drm_cache.c to find if the fast copy
>is supported by the platform or not. It is required for i915.
>
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Cc: Maxime Ripard <mripard@kernel.org>
>Cc: Thomas Zimmermann <tzimmermann@suse.de>
>Cc: David Airlie <airlied@linux.ie>
>Cc: Daniel Vetter <daniel@ffwll.ch>
>Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/drm_cache.c | 54 +++++++++++++++++++++++++++++++++++++
> include/drm/drm_cache.h     |  3 +++
> 2 files changed, 57 insertions(+)
>
>diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>index a21c1350eb09..97959eecc300 100644
>--- a/drivers/gpu/drm/drm_cache.c
>+++ b/drivers/gpu/drm/drm_cache.c
>@@ -358,6 +358,54 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
> }
> EXPORT_SYMBOL(drm_memcpy_from_wc);
>
>+/**
>+ * drm_memcpy_from_wc_vaddr - Perform the fastest available memcpy from a source
>+ * that may be WC to a destination in system memory.
>+ * @dst: The destination pointer
>+ * @src: The source pointer
>+ * @len: The size of the area to transfer in bytes
>+ *
>+ * Same as drm_memcpy_from_wc except destination is accepted as system memory

drm_memcpy_from_wc() for kernel doc

>+ * address. Useful in situations where passing destination address as iosys_map
>+ * is simply an overhead and can be avoided.
>+ */
>+void drm_memcpy_from_wc_vaddr(void *dst, const struct iosys_map *src,

As in the first version, still don't like the name, but ok.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi
