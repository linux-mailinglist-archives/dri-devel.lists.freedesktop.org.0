Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F4F9392C3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 18:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEF710E1DA;
	Mon, 22 Jul 2024 16:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cd0HxgCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E27D10E1D4;
 Mon, 22 Jul 2024 16:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721667290; x=1753203290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pjC5XqfSrP0ua0dYCv6CchNoM+i61yBKq9Q6GsROJdE=;
 b=cd0HxgCvwhU5xHTMd9KyvEJ4lMCw9t986BNlvYzdCHtekHfWMyIf+JFU
 O/XiMtMTueTdL0etopJAczXKZwlv87m5iuucL/sy6JRF/AuVMTHCEENqG
 ACIqtKU5fwwZbSjU4TlNAboXutxgrOVTx1Bd2P3Q0h4SdqrB4optI5cPC
 rlt+mUBYip4QNHk2Oy/E6bM1/CbEe06V8x96s4JBJJuM5nzRSqicxPEMR
 cFggZNJ2lOrcO7JyT80v4nVYgnx9fDvmETiWnDYmp5CAIgtJ/aRkc5VuE
 TK/kFNP1RRDAhEIwW14+TgCvuvAPNmblDSos0gbE8y2LIEGh2jMTepVDp Q==;
X-CSE-ConnectionGUID: UhndN4iHSzSl+/tvSRyY9A==
X-CSE-MsgGUID: v9ecT+icSt2eXpMszDwc1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="23117292"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="23117292"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 09:54:50 -0700
X-CSE-ConnectionGUID: 8xoCcciGTP26MCw5ZrrBLA==
X-CSE-MsgGUID: LoXP60nnRSKAA6NAqK8Qvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="57056189"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 09:54:49 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/14] drm/dp_mst: Factor out function to queue a topology
 probe work
Date: Mon, 22 Jul 2024 19:54:50 +0300
Message-ID: <20240722165503.2084999-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240722165503.2084999-1-imre.deak@intel.com>
References: <20240722165503.2084999-1-imre.deak@intel.com>
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

Factor out a function to queue a work for probing the topology, also
used by the next patch.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index fc2ceae61db2d..b185b3b38bd2f 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2692,6 +2692,11 @@ static void drm_dp_mst_link_probe_work(struct work_struct *work)
 		drm_kms_helper_hotplug_event(dev);
 }
 
+static void drm_dp_mst_queue_probe_work(struct drm_dp_mst_topology_mgr *mgr)
+{
+	queue_work(system_long_wq, &mgr->work);
+}
+
 static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
 				 u8 *guid)
 {
@@ -3685,7 +3690,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		/* Write reset payload */
 		drm_dp_dpcd_write_payload(mgr, 0, 0, 0x3f);
 
-		queue_work(system_long_wq, &mgr->work);
+		drm_dp_mst_queue_probe_work(mgr);
 
 		ret = 0;
 	} else {
@@ -3809,7 +3814,7 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 	 * state of our in-memory topology back into sync with reality. So,
 	 * restart the probing process as if we're probing a new hub
 	 */
-	queue_work(system_long_wq, &mgr->work);
+	drm_dp_mst_queue_probe_work(mgr);
 	mutex_unlock(&mgr->lock);
 
 	if (sync) {
-- 
2.44.2

