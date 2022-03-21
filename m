Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA94E3233
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 22:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E6310E355;
	Mon, 21 Mar 2022 21:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2E489FC9;
 Mon, 21 Mar 2022 21:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647897260; x=1679433260;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ECq24/OIntQlZspsCb8eJBNHSoGsh/zJIIs6KoGplTs=;
 b=Mw3hUnhkpSc0OgI7ho3gj1l6F7UBvcleG5eak9pdgLBf5s8ZLe5i9ePU
 2x75l31+aUsq1p+OI56XI00hZZRVrIGQpyrlEYzMmSKr5GL0cWEbGS7FZ
 gMgy0eUD78WZA8gc1BY8buc0DJDdCUclwiSy9+9hX40ba1Ruc7IVoJ73/
 JC0eEfekXtR69cJ6b6w10cg+tDp1ATpLw7aU5zlrLYXpRTxCSAWx+GZ0a
 J/h8TEol2mLdiWFLyqkn24fIntK0F0P7x8E2JnWK8aFinqXCMy5QgJAFw
 BLfhdSx0zBclMk86uTMLv3bQRjTvYhnhND/glCIwTZD9uHbe95w6hBluT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="344079578"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="344079578"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 14:14:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="648709457"
Received: from eliasbro-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.30.246])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 14:14:07 -0700
Date: Mon, 21 Mar 2022 14:14:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v2 4/7] drm/i915/guc: use the memcpy_from_wc call from
 the drm
Message-ID: <20220321211407.ujlokc44jx4kbtvo@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
 <20220303180013.512219-5-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220303180013.512219-5-balasubramani.vivekanandan@intel.com>
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
Cc: michael.cheng@intel.com, wayne.boyer@intel.com,
 intel-gfx@lists.freedesktop.org, casey.g.bowman@intel.com,
 dri-devel@lists.freedesktop.org, siva.mullati@intel.com,
 michal.wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 03, 2022 at 11:30:10PM +0530, Balasubramani Vivekanandan wrote:
>memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
>by the implementation in drm_cache.c.
>Updated to use the functions provided by drm_cache.c.
>
>v2: Check if the log object allocated from local memory or system memory
>    and according setup the iosys_map (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 15 ++++++++++++---
> 1 file changed, 12 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>index a24dc6441872..b9db765627ea 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>@@ -3,6 +3,7 @@
>  * Copyright © 2014-2019 Intel Corporation
>  */
>
>+#include <drm/drm_cache.h>
> #include <linux/debugfs.h>
> #include <linux/string_helpers.h>
>
>@@ -206,6 +207,7 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
> 	enum guc_log_buffer_type type;
> 	void *src_data, *dst_data;
> 	bool new_overflow;
>+	struct iosys_map src_map;
>
> 	mutex_lock(&log->relay.lock);
>
>@@ -282,14 +284,21 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
> 		}
>
> 		/* Just copy the newly written data */
>+		if (i915_gem_object_is_lmem(log->vma->obj))
>+			iosys_map_set_vaddr_iomem(&src_map, (void __iomem *)src_data);
>+		else
>+			iosys_map_set_vaddr(&src_map, src_data);

It would be better to keep this outside of the loop. So inside the loop
we can use only iosys_map_incr(&src_map, buffer_size). However you'd
also have to handle the read_offset. The iosys_map_ API has both a
src_offset and dst_offset due to situations like that. Maybe this is
missing in the new drm_memcpy_* function you're adding?

This function was not correct wrt to IO memory access with the other
2 places in this function doing plain memcpy(). Since we are starting to
use iosys_map here, we probably should handle this commit as "migrate to
iosys_map", and convert those. In your current final state
we have 3 variables aliasing the same memory location. IMO it will be
error prone to keep it like that

+Michal, some questions:

- I'm not very familiar with the relayfs API. Is the `dst_data += PAGE_SIZE;`
really correct?

- Could you double check this patch and ack if ok?

Heads up that since the log buffer is potentially in lmem, we will need
to convert this function to take that into account. All those accesses
to log_buf_state need to use the proper kernel abstraction for system vs
I/O memory.

thanks
Lucas De Marchi

>+
> 		if (read_offset > write_offset) {
>-			i915_memcpy_from_wc(dst_data, src_data, write_offset);
>+			drm_memcpy_from_wc_vaddr(dst_data, &src_map,
>+						 write_offset);
> 			bytes_to_copy = buffer_size - read_offset;
> 		} else {
> 			bytes_to_copy = write_offset - read_offset;
> 		}
>-		i915_memcpy_from_wc(dst_data + read_offset,
>-				    src_data + read_offset, bytes_to_copy);
>+		iosys_map_incr(&src_map, read_offset);
>+		drm_memcpy_from_wc_vaddr(dst_data + read_offset, &src_map,
>+					 bytes_to_copy);
>
> 		src_data += buffer_size;
> 		dst_data += buffer_size;
>-- 
>2.25.1
>
