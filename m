Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F3779F50A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 00:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E44310E1A8;
	Wed, 13 Sep 2023 22:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4752D10E171;
 Wed, 13 Sep 2023 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694644323; x=1726180323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dULmhBrKRI7OzjuDrif85h8nGx05H+whHxUsfugNRV8=;
 b=C3ZS+GZgiKBKSNcXiGkkf6CQxiBNfAB1C0dsFLaGhagGp7BM+vjxBTKI
 72gfvhvEjv7VDDfgElpAqAa5ZfBpH6FSNVEMLBdIgbxZ+mHFJf1Eya1Lk
 GtQZGx0rNqUoeO4PGiraiaUcwxHzcY8iuEX2GkkS22oORIduibZxnvFr4
 qN7Qe1AlpBFrwCVuAsuY4p6scS5Gp1N7X/qSgMTnUSOtDtHmIja9Vf3LH
 QbM+/7qx6k1cAEvflMix1Q8niagyvqikvXGXpect+RziS/ZbVRnO4xi80
 S+TrfDl0Vp/6OD4rEY9RKDMioDrz/yGorEtfzP0PQ9xEa9o7DGj2F0Jwu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442828869"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="442828869"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="991138915"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="991138915"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:32:01 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/dp_mst: Tune down error message during payload
 addition
Date: Thu, 14 Sep 2023 01:32:17 +0300
Message-Id: <20230913223218.540365-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230913223218.540365-1-imre.deak@intel.com>
References: <20230913223218.540365-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a sink is removed in the middle of payload addition the corresponding
AUX transfer will fail as expected, so tune the error message down to a
debug messge.

Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index dbec9cf004594..c490e8befc2fa 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3332,8 +3332,8 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_create_payload_at_dfp(mgr, payload);
 	if (ret < 0) {
-		drm_warn(mgr->dev, "Failed to create MST payload for port %p: %d\n",
-			 payload->port, ret);
+		drm_dbg_kms(mgr->dev, "Failed to create MST payload for port %p: %d\n",
+			    payload->port, ret);
 		goto put_port;
 	}
 
-- 
2.37.2

