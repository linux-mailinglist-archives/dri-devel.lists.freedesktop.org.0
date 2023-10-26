Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE27D8AEA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 23:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E4910E8C2;
	Thu, 26 Oct 2023 21:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3959010E8C0;
 Thu, 26 Oct 2023 21:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698357325; x=1729893325;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KJdbdK3WlUVZK5wbapf80HxW+ix2zBkCPPcnEWqlOx0=;
 b=ejIwMr+wPmttCfSLrAO9XFhTiJp+tHqGXoAzTNgFjV9oI/DvMvfmD9qs
 LYuKJ7wRmLRxPyqR7V7sFH/hFwou8TEsu/X1ksNLs0ogc6SZUOHpjuyvf
 Nu8kDaW3ZMw9rmMXHHc9zfOff3dGmwNi04Vyqiyi1a75ARLz1Y9sZnTdt
 TI6y7QYaKe9jui06e13QfyEzM5Dw8LbXDg2SdTD1T7i7ZFo6r8oC7bD8d
 CSHLYyAtlAPu9Zz0VcB9/hG/tfakwlxb04G1Cn8EfEvSv+8rCh6kqE3m5
 zeX292GZnvXg73NoM1BVy4cWLIYuNG2NKOmlxEPTqpOl/2M4WD9TZ3Yjt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="454119134"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; d="scan'208";a="454119134"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 14:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="7431091"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2023 14:54:42 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Skip pxp init if gt is wedged
Date: Thu, 26 Oct 2023 14:54:44 -0700
Message-Id: <20231026215444.54880-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gt wedged is fatal error, skip the pxp init on this situation.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index dc327cf40b5a..923f233c91e1 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -212,6 +212,9 @@ int intel_pxp_init(struct drm_i915_private *i915)
 	if (!gt)
 		return -ENODEV;
 
+	if (intel_gt_is_wedged(gt))
+		return -ENODEV;
+
 	/*
 	 * At this point, we will either enable full featured PXP capabilities
 	 * including session and object management, or we will init the backend tee
-- 
2.34.1

