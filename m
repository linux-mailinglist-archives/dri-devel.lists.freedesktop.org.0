Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F29FD77FBD0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 18:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEC610E533;
	Thu, 17 Aug 2023 16:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A4A10E51A;
 Thu, 17 Aug 2023 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692288976; x=1723824976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6EX1swiNJ+LX3DtjjqJ4X+xaC34ucMrl4UEb0LozMYU=;
 b=k5sjDIJAyKPBJ5ZXZ+xVwlXUkLBEFZfp8Kzwz07ci2Na0FWgZ0V+ML+1
 83LxwHGP3v36FEgmmxzUJDbDT42aqDSEvDTz0QhkAaaHzezk5rdMIW5M/
 YffWot65lbQ8IoWx35GNsJpvmnJ/CZv4T1SSy2MH6L+v4iYgUMn5PsAc/
 dBDF3+SU2AIn682T2HKJy6wjeaxll4+hw7skuQF8vrSeC4nMNVkbSXZnH
 OJCLRIw5ylmz8hBZYchqFBmLTUHoaz6kF1c+StvwIynG1Yvb1/7KV6V2A
 LJNrfRbVt03BSLe4xQLNV/X5xeosAopHx0JmuYs4zKiI7sx3EuoBVMweP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="357826720"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="357826720"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 09:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="711601361"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="711601361"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 09:14:58 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 13/17] drm/dp_mst: Swap the order of checking root vs.
 non-root port BW limitations
Date: Thu, 17 Aug 2023 19:14:52 +0300
Message-Id: <20230817161456.3857111-14-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230817161456.3857111-1-imre.deak@intel.com>
References: <20230817161456.3857111-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_dp_mst_atomic_check_mgr() should check for BW limitation starting
from sink ports continuing towards the root port, so that drivers can
use the @failing_port returned to resolve a BW overallocation in an
ideal way. For instance from streams A,B,C in a topology A,B going
through @failing_port and C not going through it, a BW overallocation of
A,B due to a limit of the port must be resolved first before considering
the limits of other ports closer to the root port. This way can avoid
reducing the BW of stream C unnecessarily due to a BW limit closer to the
root port.

Based on the above swap the order of the BW check for the root port and
the check for all the ports downstream of it (the latter going through
the topology already in the sink->root port direction).

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index a32da72bb05c5..12a13885145d3 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5449,9 +5449,13 @@ EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
  * %-ENOSPC, if the new state is invalid, because of BW limitation
  *           @failing_port is set to:
  *           - The non-root port where a BW limit check failed
+ *             with all the ports downstream of @failing_port passing
+ *             the BW limit check.
  *             The returned port pointer is valid until at least
  *             one payload downstream of it exists.
  *           - %NULL if the BW limit check failed at the root port
+ *             with all the ports downstream of the root port passing
+ *             the BW limit check.
  * %-EINVAL, if the new state is invalid, because the root port has too many
  *           payloads.
  */
@@ -5467,17 +5471,16 @@ int drm_dp_mst_atomic_check_mgr(struct drm_atomic_state *state,
 	if (!mgr->mst_state)
 		return 0;
 
-	ret = drm_dp_mst_atomic_check_payload_alloc_limits(mgr, mst_state);
-	if (ret)
-		return ret;
-
 	mutex_lock(&mgr->lock);
 	ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr->mst_primary,
 						    mst_state,
 						    failing_port);
 	mutex_unlock(&mgr->lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+
+	return drm_dp_mst_atomic_check_payload_alloc_limits(mgr, mst_state);
 }
 EXPORT_SYMBOL(drm_dp_mst_atomic_check_mgr);
 
-- 
2.37.2

