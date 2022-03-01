Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAF24C8577
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DE010E589;
	Tue,  1 Mar 2022 07:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B0D10E582;
 Tue,  1 Mar 2022 07:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646120939; x=1677656939;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yNeE3cPPu80L2a3I6/D8IPyjQ2TxUVXzDkaknObQ+xM=;
 b=E/ZOmgaEqOzap553WdD6qWUKuhBnoqnmlTo77FUuI5yQD2mlAeT6DbQk
 HmRNHu4ewyDSNBoIw+olmVAT63khfDg+3/Lwh9e+n+f6AqYTV/F31xe+w
 sFsyCQKvn2462mhPkympxPf1jffbtq1Rf4bOC5Bcon9sOiJTqySCjSGpa
 27lzOy7lndftIXWU75e3qMuqwECcmJofZSpJj6KQEDusEmzplOMhUDdDS
 RcU5+utC/Q/a6hg49brcO8J2h+IjbLQvpgxjoZEttKhTdun/yFfKmHFlI
 G7WT0nJBl2ORU1cFsxXJjyWoM4N/nCnBPUV3Z+WukzzyWCVat562JEzwG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="240491839"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="240491839"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 23:48:59 -0800
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="639282441"
Received: from ramyaman-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.150.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 23:48:58 -0800
Date: Mon, 28 Feb 2022 23:48:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH 2/7] drm: Add drm_memcpy_from_wc() variant which accepts
 destination address
Message-ID: <20220301074858.hzq2fkjpcor35x6t@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
 <20220222145206.76118-3-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220222145206.76118-3-balasubramani.vivekanandan@intel.com>
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
 michael.cheng@intel.com, wayne.boyer@intel.com,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 casey.g.bowman@intel.com, dri-devel@lists.freedesktop.org,
 siva.mullati@intel.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 08:22:01PM +0530, Balasubramani Vivekanandan wrote:
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
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/drm_cache.c | 54 +++++++++++++++++++++++++++++++++++++
> include/drm/drm_cache.h     |  3 +++
> 2 files changed, 57 insertions(+)
>
>diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>index a21c1350eb09..eb0bcd33665e 100644
>--- a/drivers/gpu/drm/drm_cache.c
>+++ b/drivers/gpu/drm/drm_cache.c
>@@ -358,6 +358,54 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
> }
> EXPORT_SYMBOL(drm_memcpy_from_wc);
>
>+/**
>+ * drm_memcpy_from_wc_vaddr - Perform the fastest available memcpy from a source
>+ * that may be WC.

  .... to a destination in system memory.

>+ * @dst: The destination pointer
>+ * @src: The source pointer
>+ * @len: The size of the area to transfer in bytes
>+ *
>+ * Same as drm_memcpy_from_wc except destination is accepted as system memory
>+ * address. Useful in situations where passing destination address as iosys_map
>+ * is simply an overhead and can be avoided.

although one could do drm_memcpy_from_wc(IOSYS_MAP_INIT_VADDR(addr), ...

(if IOSYS_MAP_INIT_VADDR provided a cast to the struct).

>+ */
>+void drm_memcpy_from_wc_vaddr(void *dst, const struct iosys_map *src,

name here is confusing as we are copying *to* system memory. Maybe
drm_memcpy_vaddr_from_wc()? Not sure it's better. Maybe someone in Cc
has a better suggestion

( To be honest, this whole _from_wc() suffix sound weird when are checking I/O
   vs system memory.... it may have been the motivation, but maybe it
   shouldn't be the name of the memcpy() variant )

The implementation looks ok and follows drm_memcpy_from_wc()

Lucas De Marchi

>+			      unsigned long len)
>+{
>+	if (WARN_ON(in_interrupt())) {
>+		iosys_map_memcpy_from(dst, src, 0, len);
>+		return;
>+	}
>+
>+	if (static_branch_likely(&has_movntdqa)) {
>+		__drm_memcpy_from_wc(dst,
>+				     src->is_iomem ?
>+				     (void const __force *)src->vaddr_iomem :
>+				     src->vaddr,
>+				     len);
>+		return;
>+	}
>+
>+	iosys_map_memcpy_from(dst, src, 0, len);
>+}
>+EXPORT_SYMBOL(drm_memcpy_from_wc_vaddr);
>+
>+/*
>+ * drm_memcpy_fastcopy_supported - Returns if fast copy using non-temporal
>+ * instructions is supported
>+ *
>+ * Returns true if platform has support for fast copying from wc memory type
>+ * using non-temporal instructions. Else false.
>+ */
>+bool drm_memcpy_fastcopy_supported(void)
>+{
>+	if (static_branch_likely(&has_movntdqa))
>+		return true;
>+
>+	return false;
>+}
>+EXPORT_SYMBOL(drm_memcpy_fastcopy_supported);
>+
> /*
>  * drm_memcpy_init_early - One time initialization of the WC memcpy code
>  */
>@@ -382,6 +430,12 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
> }
> EXPORT_SYMBOL(drm_memcpy_from_wc);
>
>+bool drm_memcpy_fastcopy_supported(void)
>+{
>+	return false;
>+}
>+EXPORT_SYMBOL(drm_memcpy_fastcopy_supported);
>+
> void drm_memcpy_init_early(void)
> {
> }
>diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
>index 22deb216b59c..8f48e4dcd7dc 100644
>--- a/include/drm/drm_cache.h
>+++ b/include/drm/drm_cache.h
>@@ -77,4 +77,7 @@ void drm_memcpy_init_early(void);
> void drm_memcpy_from_wc(struct iosys_map *dst,
> 			const struct iosys_map *src,
> 			unsigned long len);
>+bool drm_memcpy_fastcopy_supported(void);
>+void drm_memcpy_from_wc_vaddr(void *dst, const struct iosys_map *src,
>+			      unsigned long len);
> #endif
>-- 
>2.25.1
>
