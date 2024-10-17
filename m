Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE64F9A25BD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D15E10E84E;
	Thu, 17 Oct 2024 14:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgovP5uV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C0610E348
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177103; x=1760713103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vVk505yvv0t1phznf67/3wFGVIpfV6Y4iEr4HLDY0Cw=;
 b=OgovP5uVbQ4sCwXWDVIfKHdOdIHwM+yCu2ZlbRNokcgSGjgo/pU1F3z+
 MRHneIHAQSCz8T0yBucObdapVK4xXi927HCkXWbXMXkAjrIFIC0eTEj0C
 V+M9Lea8P52AbhZzA8x6BbagXW2yBZNnInIykjoDVTorTEtvCp174LpBI
 UVxDv11JvJILm/es9QnSnkqwgvmsEBxrmrWp3C1/HguLxKs5ME3OPZsbY
 6jOh7cLIoe43LzcmZHJHaMy8wsz2ao6bDlSuYdFimYx1dLe0vKTuX/kvp
 lWTtexgZHRazX4druDlt+z64b/VjIRTHAQgfvn//Gogdj5szADIZKY1iE g==;
X-CSE-ConnectionGUID: fDO1gJdXToCd36zrHX7aDA==
X-CSE-MsgGUID: Gaf2iOhxSRa8yUJMRoi+XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39790314"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39790314"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:23 -0700
X-CSE-ConnectionGUID: t1TqNvchSzyPxL3J6FcoSg==
X-CSE-MsgGUID: cRHeQif/RDmbEg2Cxosw9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109374489"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:22 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 01/11] accel/ivpu: Do not fail when more than 1 tile is fused
Date: Thu, 17 Oct 2024 16:58:07 +0200
Message-ID: <20241017145817.121590-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
References: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Allow TILE_FUSE register to disable more than 1 tile.
The driver should not prevent such configurations from being functional.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_btrs.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
index 6d5f1cc711435..3212c99f36823 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.c
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
@@ -141,16 +141,10 @@ static int read_tile_config_fuse(struct ivpu_device *vdev, u32 *tile_fuse_config
 	}
 
 	config = REG_GET_FLD(VPU_HW_BTRS_LNL_TILE_FUSE, CONFIG, fuse);
-	if (!tile_disable_check(config)) {
-		ivpu_err(vdev, "Fuse: Invalid tile disable config (0x%x)\n", config);
-		return -EIO;
-	}
+	if (!tile_disable_check(config))
+		ivpu_warn(vdev, "More than 1 tile disabled, tile fuse config mask: 0x%x\n", config);
 
-	if (config)
-		ivpu_dbg(vdev, MISC, "Fuse: %d tiles enabled. Tile number %d disabled\n",
-			 BTRS_LNL_TILE_MAX_NUM - 1, ffs(config) - 1);
-	else
-		ivpu_dbg(vdev, MISC, "Fuse: All %d tiles enabled\n", BTRS_LNL_TILE_MAX_NUM);
+	ivpu_dbg(vdev, MISC, "Tile disable config mask: 0x%x\n", config);
 
 	*tile_fuse_config = config;
 	return 0;
-- 
2.45.1

