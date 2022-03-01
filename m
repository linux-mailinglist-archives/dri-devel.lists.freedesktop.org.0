Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1F14C85A2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82C610E65B;
	Tue,  1 Mar 2022 07:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3BA10E5F8;
 Tue,  1 Mar 2022 07:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646121325; x=1677657325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TrYNA0/1jMVVk5MPgm5lBQJkONR7pViGSK/QTI0mA1s=;
 b=LIuXLXjwy/TRYjrhZ7rkb9k0RqHEi5wGnDNSRC+TPVyC2unXSh5EPnnV
 B5L7BD/EtfCwurXwicgXcuoknpT8WZBq1qTDJQ6bKuJTaxHZPlsreTrLO
 8jBxxC8L2z3LUYNb70WI2ThHjEsWwQwv9oSRi/XfPEHZy25azGtYQHwhY
 XftRe3EZLFbJk29OVwBLd9tR1xoY2sHYe2/4s5Bi97Qf6OeIITzUvov0m
 gUfzNEHvBd45s34SMuTe9DZ4YRro4i5icwgBQwEedX7autVs05bHrVQT7
 /a0tZyr1w3jBWrnONeUQSDeMVtofFhdyyEw8snXPjMmnHKpCZkJVigEah A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="250662995"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="250662995"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 23:55:24 -0800
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="639283806"
Received: from ramyaman-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.150.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 23:55:24 -0800
Date: Mon, 28 Feb 2022 23:55:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/7] drm: Add drm_memcpy_from_wc() variant
 which accepts destination address
Message-ID: <20220301075524.t4pjiqoe43rzqzrg@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
 <20220222145206.76118-3-balasubramani.vivekanandan@intel.com>
 <20220301074858.hzq2fkjpcor35x6t@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220301074858.hzq2fkjpcor35x6t@ldmartin-desk2>
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 siva.mullati@intel.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 11:48:58PM -0800, Lucas De Marchi wrote:
>On Tue, Feb 22, 2022 at 08:22:01PM +0530, Balasubramani Vivekanandan wrote:
>>Fast copy using non-temporal instructions for x86 currently exists at two
>>locations. One is implemented in i915 driver at i915/i915_memcpy.c and
>>another copy at drm_cache.c. The plan is to remove the duplicate
>>implementation in i915 driver and use the functions from drm_cache.c.
>>
>>A variant of drm_memcpy_from_wc() is added in drm_cache.c which accepts
>>address as argument instead of iosys_map for destination. It is a very
>>common scenario in i915 to copy from a WC memory type, which may be an
>>io memory or a system memory to a destination address pointing to system
>>memory. To avoid the overhead of creating iosys_map type for the
>>destination, new variant is created to accept the address directly.
>>
>>Also a new function is exported in drm_cache.c to find if the fast copy
>>is supported by the platform or not. It is required for i915.
>>
>>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>Cc: Maxime Ripard <mripard@kernel.org>
>>Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>Cc: David Airlie <airlied@linux.ie>
>>Cc: Daniel Vetter <daniel@ffwll.ch>
>>Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>>
>>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>---
>>drivers/gpu/drm/drm_cache.c | 54 +++++++++++++++++++++++++++++++++++++
>>include/drm/drm_cache.h     |  3 +++
>>2 files changed, 57 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>>index a21c1350eb09..eb0bcd33665e 100644
>>--- a/drivers/gpu/drm/drm_cache.c
>>+++ b/drivers/gpu/drm/drm_cache.c
>>@@ -358,6 +358,54 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
>>}
>>EXPORT_SYMBOL(drm_memcpy_from_wc);
>>
>>+/**
>>+ * drm_memcpy_from_wc_vaddr - Perform the fastest available memcpy from a source
>>+ * that may be WC.
>
> .... to a destination in system memory.
>
>>+ * @dst: The destination pointer
>>+ * @src: The source pointer
>>+ * @len: The size of the area to transfer in bytes
>>+ *
>>+ * Same as drm_memcpy_from_wc except destination is accepted as system memory
>>+ * address. Useful in situations where passing destination address as iosys_map
>>+ * is simply an overhead and can be avoided.
>
>although one could do drm_memcpy_from_wc(IOSYS_MAP_INIT_VADDR(addr), ...

... Just making you don't take that as a suggestion, I was just thinking
out loud. And as is, it doesn't work as the function expects a
iosys_map *

Lucas De Marhci
