Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF58D182F2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3977A10E4CD;
	Tue, 13 Jan 2026 10:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOCraloE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D843A10E4CE;
 Tue, 13 Jan 2026 10:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768301362; x=1799837362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nzGwSncGN4X40hmaX6LRQ+BKXAFNBvAI4d/jXU8HGHw=;
 b=iOCraloEz0wajaZ1UNGh6oT1Fbt4o9pWEK5vbnvntVzd08d/7xTK9IAN
 3bKFAnd1BnVLdW+bFM3XbATzjenZ4RLrsgprEhWR04hsZ3m13T27dZNQB
 SRDUcJ6xtSClxxIMB/GiwMwcknrChBmbLYUu9tA3qimsfiuhWzuhEYgFj
 zXBRP3CVWwL86DozGZfQMKf8rBNHZhQtB6c9hQOSVaEyqU/0d6YhF4doa
 G3IqC1dh5jaG/RNtnyuD5ubAdClyeLxeGylBSHR9pGbqnXOYdAA0DLnLT
 B9umb3R19XquWsNmyK5lAU91R1o/1duqI/37Mtj8/utp6Frp9Z2LQm70p Q==;
X-CSE-ConnectionGUID: XZwbK9VlSDy5deuKZTWuKQ==
X-CSE-MsgGUID: 5bNJKblGS1OfWTz4SZeqpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="87165268"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="87165268"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 02:49:22 -0800
X-CSE-ConnectionGUID: wHteZc3kSqKj6FBSpGAV+w==
X-CSE-MsgGUID: 61SrwiujSimjnKCx2aIcog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="227554684"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 02:49:17 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v3 12/13] drm/colorop: Use destroy callback for color pipeline
 teardown
Date: Tue, 13 Jan 2026 15:53:02 +0530
Message-Id: <20260113102303.724205-13-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
References: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
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
index 2bce29176ab3..aa19de769eb2 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -208,8 +208,7 @@ void drm_colorop_pipeline_destroy(struct drm_device *dev)
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

