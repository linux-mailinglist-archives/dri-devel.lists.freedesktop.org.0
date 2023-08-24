Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010E0786963
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 10:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF88310E490;
	Thu, 24 Aug 2023 08:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9C010E4C9;
 Thu, 24 Aug 2023 08:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692864320; x=1724400320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yXEB6HiQnq2XfJ+75HnjkVVogq27GkRyHfWU+EoM5yc=;
 b=YF50R1TXr/wjiRJVA33h84/eVdiS++K/4Z90Cgn1NX0UoOwVteOdYUwm
 dQi1s1xJ+HU5Q6w0cmdXEO066m4zEUhquFoDQkJBsgubbVH4PUaZB6GWH
 sqdCKDepLs/h4RjE81YUJvUzVcyjeI45l4G28LMXHjdjcNGOgo9PHkOJu
 U83hMspj2rFPcH6D1X7VGnZ7cTZ29lVqrfJ5IBC2S+S+4uRFCMYH7h36q
 RQGA6g27ot+2rEvWdrINxeJe70quKr9QM774ruRb+Cma+9QIkPOOI2TXv
 cSmktzMbQRTWzaDmM7IKTEH3CKELlM+SckuXkwxwGSclDpXH9gqLWPDRq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374345881"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="374345881"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 01:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880710335"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 01:05:23 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 13/22] drm/dp_mst: Swap the order of checking root vs.
 non-root port BW limitations
Date: Thu, 24 Aug 2023 11:05:08 +0300
Message-Id: <20230824080517.693621-14-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230824080517.693621-1-imre.deak@intel.com>
References: <20230824080517.693621-1-imre.deak@intel.com>
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
index 6b1cbe2260a29..e536ee1020741 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5448,9 +5448,13 @@ EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
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
@@ -5466,17 +5470,16 @@ int drm_dp_mst_atomic_check_mgr(struct drm_atomic_state *state,
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

