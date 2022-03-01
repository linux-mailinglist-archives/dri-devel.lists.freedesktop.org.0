Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BB94C8522
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA9B10E7D5;
	Tue,  1 Mar 2022 07:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D4010E7BE;
 Tue,  1 Mar 2022 07:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646119712; x=1677655712;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mk9gzRAr/4KXdN/jYAOo3+D1roukNVp52voxUjLhHAU=;
 b=UNPnxiyeiY0vKkS0uM37KRVxDJ4HTfzBv1UP2bDVsxYSpYWrDv7aYb7S
 Y0IlGDhuk1OiEnfXmJahFsOQssWPOGjqNoUT3v1Yw+rrvcK2agtftGL5I
 h3Npw5sYdUYhm3++lpqJU9hR8mFJLraXlL2XOqfkBnu5k4QpeDoxdH7eP
 qPSAOje87Q9IumhQKHQdrKjFqSrkcOCHYJkViKWXbUVjpMF5O4yuS6eBV
 uwRE/qEJeZh8m2yyl6BmHDYFF2OVNkmM7LuvhMhfhmb5Gb4OOunBy81V1
 ARn8ImUPeYtpETRvVApS36XeBO1Tdt0uInaqVP/PYD75dbQTSKm2ApPeI g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="339510130"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="339510130"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 23:28:32 -0800
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="593506408"
Received: from ramyaman-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.150.64])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 23:28:31 -0800
Date: Mon, 28 Feb 2022 23:28:31 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/7] drm: Relax alignment constraint for
 destination address
Message-ID: <20220301072831.gwpp33snlgv6fqde@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
 <20220222145206.76118-2-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220222145206.76118-2-balasubramani.vivekanandan@intel.com>
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, michael.cheng@intel.com,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 siva.mullati@intel.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 08:22:00PM +0530, Balasubramani Vivekanandan wrote:
>There is no need for the destination address to be aligned to 16 byte
>boundary to be able to use the non-temporal instructions while copying.
>Non-temporal instructions are used only for loading from the source
>address which has alignment constraints.
>We only need to take care of using the right instructions, based on
>whether destination address is aligned or not, while storing the data to
>the destination address.
>
>__memcpy_ntdqu is copied from i915/i915_memcpy.c
>
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Cc: Maxime Ripard <mripard@kernel.org>
>Cc: Thomas Zimmermann <tzimmermann@suse.de>
>Cc: David Airlie <airlied@linux.ie>
>Cc: Daniel Vetter <daniel@ffwll.ch>
>Cc: Chris Wilson <chris.p.wilson@intel.com>
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/drm_cache.c | 44 ++++++++++++++++++++++++++++++++-----
> 1 file changed, 38 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>index c3e6e615bf09..a21c1350eb09 100644
>--- a/drivers/gpu/drm/drm_cache.c
>+++ b/drivers/gpu/drm/drm_cache.c
>@@ -278,18 +278,50 @@ static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
> 	kernel_fpu_end();
> }
>
>+static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
>+{
>+	kernel_fpu_begin();
>+
>+	while (len >= 4) {
>+		asm("movntdqa   (%0), %%xmm0\n"
>+		    "movntdqa 16(%0), %%xmm1\n"
>+		    "movntdqa 32(%0), %%xmm2\n"
>+		    "movntdqa 48(%0), %%xmm3\n"
>+		    "movups %%xmm0,   (%1)\n"
>+		    "movups %%xmm1, 16(%1)\n"
>+		    "movups %%xmm2, 32(%1)\n"
>+		    "movups %%xmm3, 48(%1)\n"
>+		    :: "r" (src), "r" (dst) : "memory");
>+		src += 64;
>+		dst += 64;
>+		len -= 4;
>+	}
>+	while (len--) {
>+		asm("movntdqa (%0), %%xmm0\n"
>+		    "movups %%xmm0, (%1)\n"
>+		    :: "r" (src), "r" (dst) : "memory");
>+		src += 16;
>+		dst += 16;

ok, this takes care of the tail

>+	}
>+
>+	kernel_fpu_end();
>+}
>+
> /*
>  * __drm_memcpy_from_wc copies @len bytes from @src to @dst using
>- * non-temporal instructions where available. Note that all arguments
>- * (@src, @dst) must be aligned to 16 bytes and @len must be a multiple
>- * of 16.
>+ * non-temporal instructions where available. Note that @src must be aligned to
>+ * 16 bytes and @len must be a multiple of 16.
>  */
> static void __drm_memcpy_from_wc(void *dst, const void *src, unsigned long len)
> {
>-	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
>+	if (unlikely(((unsigned long)src | len) & 15)) {
> 		memcpy(dst, src, len);
>-	else if (likely(len))
>-		__memcpy_ntdqa(dst, src, len >> 4);
>+	} else if (likely(len)) {
>+		if (IS_ALIGNED((unsigned long)dst, 16))

we may want to just extend this function to deal with dst not being
aligned. But this may be done on top


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>+			__memcpy_ntdqa(dst, src, len >> 4);
>+		else
>+			__memcpy_ntdqu(dst, src, len >> 4);
>+	}
> }
>
> /**
>-- 
>2.25.1
>
