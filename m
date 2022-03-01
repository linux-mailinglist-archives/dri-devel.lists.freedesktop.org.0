Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 975964C85EC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 09:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACB710EA76;
	Tue,  1 Mar 2022 08:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC97A10EA70;
 Tue,  1 Mar 2022 08:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646122053; x=1677658053;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1OLd4oIJhF/aVNMQoJkORUhlGOG05XbmNyiN4KUpVTo=;
 b=bULy/6AiO+Fhhv8lS8EQRAtgLbsi0t8MSNEI5QXgqJi6//J4nzxr6dJa
 CyoLu1fuCNE9GGcnjZxb7Qx0Cyw4IoVagJUKsWGLLZZilpZCo3yWhuHv4
 2M0szJ6pTle7NpvL6rvKVCCJiciamAy8+PjvH9yXsE9RQTgwUdx6YxvDc
 7AAyBf2Yiq98OgwmPRDpN6wcQ0fo8jEmAAzegjvBozpuDfzxABIN1Skph
 qK1Wb+PZUCMWcThnMo0SvazrhWXVOFCgKIW9L9PdnkNBmU8kN78fueyQA
 iB4s+I4yKuLwFbIl1qhJc0MUf8GM9YRbIU0bc6hTKdLTwjfoY7BYSJnHG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="277747187"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="277747187"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 00:07:23 -0800
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="550614555"
Received: from ramyaman-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.150.64])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 00:07:23 -0800
Date: Tue, 1 Mar 2022 00:07:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915/guc: use the memcpy_from_wc
 call from the drm
Message-ID: <20220301080723.rjtghylsb65syhki@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
 <20220222145206.76118-5-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220222145206.76118-5-balasubramani.vivekanandan@intel.com>
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
Cc: siva.mullati@intel.com, intel-gfx@lists.freedesktop.org,
 michael.cheng@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 08:22:03PM +0530, Balasubramani Vivekanandan wrote:
>memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
>by the implementation in drm_cache.c.
>Updated to use the functions provided by drm_cache.c.
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 11 ++++++++---
> 1 file changed, 8 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>index b53f61f3101f..1990762f07de 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>@@ -3,6 +3,7 @@
>  * Copyright © 2014-2019 Intel Corporation
>  */
>
>+#include <drm/drm_cache.h>
> #include <linux/debugfs.h>
>
> #include "gt/intel_gt.h"
>@@ -205,6 +206,7 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
> 	enum guc_log_buffer_type type;
> 	void *src_data, *dst_data;
> 	bool new_overflow;
>+	struct iosys_map src_map;
>
> 	mutex_lock(&log->relay.lock);
>
>@@ -281,14 +283,17 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
> 		}
>
> 		/* Just copy the newly written data */
>+		iosys_map_set_vaddr(&src_map, src_data);

src is not guaranteed to come from system memory.... src is coming from:
intel_guc_allocate_vma(), that may call either  i915_gem_object_create_lmem()
or  i915_gem_object_create_shmem() depending if the platforma has lmem.

I guess you will  need to check if the obj is in lmem and initialize
src_map accordingly.

Lucas De Marchi

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
