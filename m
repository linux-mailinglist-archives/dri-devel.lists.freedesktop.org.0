Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D108CCEC2E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 08:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AB110EED3;
	Fri, 19 Dec 2025 07:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKCcr3Rv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A645C10EEC7;
 Fri, 19 Dec 2025 07:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766128431; x=1797664431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5iEbdIPda+OlayKyiVAB1+APCIpGlQ5uXA/DXxw0vKY=;
 b=TKCcr3RvqEhYS+TOxyYQ9NRSd0BA8nxOy+8IrD4yoUHHxsY8VJnLRdnb
 ibDU+Z4Q2DDTD4Gqhfigqy6VsVWjTo11SeYiKcYT6PRzEVQ9unasewHzV
 2LceB6d+AOxg39ElUAWVdLyzXxZdOXwJVpMyICkc10jjTH3vO7TtLv+0F
 ldbdyJOzik1ms13/sRv2MAE+Z5Te8smeoyCiKrNSGl0vW/ibq1SfM8QvW
 NXQGV6vA1xLLHlGGy42zGAtPriv3PAYRYLxWfFVDOTMVTCnOe4M1sGiTC
 ePpGA2i3Ourd84hloe7P/OIxx9sawvHgk5VboX8khJZKNRxFliGBnjXDA g==;
X-CSE-ConnectionGUID: 0tPo9NaJTEyYeloLEUf6nw==
X-CSE-MsgGUID: x3kbG6JDRdGoKZMrKKkhHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93562418"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="93562418"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:13:51 -0800
X-CSE-ConnectionGUID: 8lBwpJKWTR6JdF9Szgr+WQ==
X-CSE-MsgGUID: KsRrRZnPS++ORsUB25G1dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222209581"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 23:13:47 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH 12/13] drm/colorop: Use destroy callback for color pipeline
 teardown
Date: Fri, 19 Dec 2025 12:26:13 +0530
Message-Id: <20251219065614.190834-13-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
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

