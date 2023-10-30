Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5F27DBD12
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 16:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D1A10E30C;
	Mon, 30 Oct 2023 15:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E117110E0F2;
 Mon, 30 Oct 2023 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698681504; x=1730217504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VsqM1xF/AplsEwiGjrP6+aBGayu1M/I9KPvAI2Cpm6U=;
 b=C5w090sVwdkkLAe9rRYIhycQ43Knt7R4xKXsY3lnOn0iBioE8IRfl/xP
 vBcjUt6g0tcaBWxBTvhhvx6l+HHZvSYvhD7vkQkH3/A2b+dLoemydnAG5
 O3DwLJp+UCRyEQapKUN7Pl6Hi9NQHRJJZtjgMNN4uv23pF3L/cyyjM0P/
 Hf+Bz8Oj5nkK1iT1ZwX0UYjEzoiFpDDBenAiyDApCXqlPaiwv+vYavaGs
 5h5WPs1RacuGNzC/6q0z6t0gn/J5Lo3m8aVOLQpWAMUeaONMOLsN+DA0w
 5lyRNDrrI/nQLy4FWWON83dSWwcJ/s4CUzj+HG4kutvIg5MRnb9jXBfoG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="974394"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="974394"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 08:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="789493949"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="789493949"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 08:58:21 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 05/30] drm/dp_mst: Swap the order of checking root vs.
 non-root port BW limitations
Date: Mon, 30 Oct 2023 17:58:18 +0200
Message-Id: <20231030155843.2251023-6-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030155843.2251023-1-imre.deak@intel.com>
References: <20231030155843.2251023-1-imre.deak@intel.com>
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index a86a67d3516ff..5972c93615f18 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5469,9 +5469,13 @@ EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
  *   - %-ENOSPC, if the new state is invalid, because of BW limitation
  *         @failing_port is set to:
  *         - The non-root port where a BW limit check failed
+ *           with all the ports downstream of @failing_port passing
+ *           the BW limit check.
  *           The returned port pointer is valid until at least
  *           one payload downstream of it exists.
  *         - %NULL if the BW limit check failed at the root port
+ *           with all the ports downstream of the root port passing
+ *           the BW limit check.
  *   - %-EINVAL, if the new state is invalid, because the root port has
  *     too many payloads.
  */
@@ -5487,17 +5491,16 @@ int drm_dp_mst_atomic_check_mgr(struct drm_atomic_state *state,
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
2.39.2

