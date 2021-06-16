Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782703AA477
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 21:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761476E80B;
	Wed, 16 Jun 2021 19:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948536E804;
 Wed, 16 Jun 2021 19:40:40 +0000 (UTC)
IronPort-SDR: mSLealRFT3ZCYBOIdFxJcAqZIPDMunJs/PrdDCq120LEOTMOCf2BYIXOC6XZVTFgZ2wXCbSozV
 nxlsIXSllZWQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="185937859"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="185937859"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 12:40:40 -0700
IronPort-SDR: SW7b7KeL32+TCFzb4EDL48YsIBDslqUzF+qyO8FSDoxbQdZ/Dc8lKQSxoOI4mL6AOwGENpw9cq
 hy+AtTHESjPA==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="554923852"
Received: from josouza-mobl2.jf.intel.com (HELO josouza-mobl2.intel.com)
 ([10.24.14.54])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 12:40:38 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/dp_mst: Add missing drm parameters to recently added call
 to drm_dbg_kms()
Date: Wed, 16 Jun 2021 12:44:15 -0700
Message-Id: <20210616194415.36926-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by
ports in stale topology") added to calls to drm_dbg_kms() but it
missed the first parameter, the drm device breaking the build.

Fixes: 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by ports in stale topology")
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 9ac148efd9e43..ad0795afc21cf 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3389,7 +3389,9 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
 			mutex_unlock(&mgr->lock);
 
 			if (skip) {
-				drm_dbg_kms("Virtual channel %d is not in current topology\n", i);
+				drm_dbg_kms(mgr->dev,
+					    "Virtual channel %d is not in current topology\n",
+					    i);
 				continue;
 			}
 			/* Validated ports don't matter if we're releasing
@@ -3404,7 +3406,8 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
 						payload->start_slot = req_payload.start_slot;
 						continue;
 					} else {
-						drm_dbg_kms("Fail:set payload to invalid sink");
+						drm_dbg_kms(mgr->dev,
+							    "Fail:set payload to invalid sink");
 						mutex_unlock(&mgr->payload_lock);
 						return -EINVAL;
 					}
-- 
2.32.0

