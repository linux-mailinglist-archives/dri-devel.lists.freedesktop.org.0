Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC776D07EB9
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E7E10E84A;
	Fri,  9 Jan 2026 08:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIeHuBZs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9904810E848;
 Fri,  9 Jan 2026 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948233; x=1799484233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wUMeQANiJHYoWKhTjSJVxWA7F9b8YqMG+zDVRIm3KPo=;
 b=OIeHuBZsZ/mOlu4NZK2CW/ITa7AdlYW6xuqE5HF+BB1PVk5jQk5eEVXT
 6TkNrE5zKitwUG2w/TuMhTQlSyLAyNdo2FpUC002Or0TvAXrkFS2yp0Yy
 cw4/R6e6Sygh75CMVy+Pp0l8k0MAWUDriI60n5dAEeDaP716MoqcpucZZ
 ipVNNFlA1ybrKEPImjQ+DCc78odVKUJeMwBU2gizKTHac6AmNbkgS3CeK
 Dfm/MquLAi880VtrDdyAJery6P80eVDcHPN/IVYOcTpyzq0BOfDIalmYh
 HnDOMN05nH1fcnO/LbSFX9h4G/l40W5QPWMBhwi2adeqWviKYj831l7rS g==;
X-CSE-ConnectionGUID: //CjL4vPRSidRhuz8o+YLA==
X-CSE-MsgGUID: zbLJ44wfRfGbtxgeDj7KmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69241478"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69241478"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:43:52 -0800
X-CSE-ConnectionGUID: 29YTnK+YS/m/NVWQp4C7Qw==
X-CSE-MsgGUID: Mv4hnLr4RKSPyZpoxTDgYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="240924617"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa001.jf.intel.com with ESMTP; 09 Jan 2026 00:43:49 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 12/13] drm/colorop: Use destroy callback for color pipeline
 teardown
Date: Fri,  9 Jan 2026 13:47:27 +0530
Message-Id: <20260109081728.478844-13-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
References: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch drm_colorop_pipeline_destroy() to use the driver-provided
destroy callback instead of directly calling drm_colorop_cleanup()
and freeing the object.

This allows drivers that embed struct drm_colorop in driver-specific
objects to perform correct teardown.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/drm_colorop.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 4b27804bb0bd..fafe45b93ff8 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -205,8 +205,7 @@ void drm_colorop_pipeline_destroy(struct drm_device *dev)
 	struct drm_colorop *colorop, *next;
 
 	list_for_each_entry_safe(colorop, next, &config->colorop_list, head) {
-		drm_colorop_cleanup(colorop);
-		kfree(colorop);
+		colorop->funcs->destroy(colorop);
 	}
 }
 EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
-- 
2.25.1

