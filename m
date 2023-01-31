Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C76376830D6
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 16:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB53210E388;
	Tue, 31 Jan 2023 15:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7F710E37F;
 Tue, 31 Jan 2023 15:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675177579; x=1706713579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sZeVA43J+5CB7NymmI6VapcJXfv3PPqLCgFFUfxb6ZQ=;
 b=WR6SBzjMvD4M2udHciP4FJ6HDaJ3IPpaB2A5OIsH8beVd0tstfGbmKKf
 F4PUrLuo35T8Pq7u4jvxXso9wrhPgJ8qitOwyD4OnZjMuw448CBPUnhHN
 OQ+eiZOGRR1SqhKorARIPjzUG6zYKAoaC8Z36jfqzje9CZM/kcKWX8vWX
 QMz59atxdyNM0zHePn/i6kFXskrZXpRqSUBxCpIBmyBajbnqb15rhwawX
 3M2a6wKF7L4wtUHDF078bhPz0/FoO4l8m+nR+QOg9gzFJISi4BGBx6G+e
 VN1+4BqoxY6MwMmrFhjWJCjbo+RdFWXzpRdp/vEOqVBYoM0gV12osKsiJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="308205632"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="308205632"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:06:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="807155348"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="807155348"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:06:12 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 14/17] drm/display/dp_mst: Factor out a helper to reset the
 payload table
Date: Tue, 31 Jan 2023 17:05:45 +0200
Message-Id: <20230131150548.1614458-15-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20230131150548.1614458-1-imre.deak@intel.com>
References: <20230131150548.1614458-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A follow-up patch adds a workaround for a payload allocation problem in
a DELL monitor. For this the driver needs to reset the payload table in
the monitor's MST hub, factor out a helper to do this.

While at it use DP_PAYLOAD_TABLE_SIZE in the reset command, instead of
open coding it.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 8 +++++++-
 include/drm/display/drm_dp_mst_helper.h       | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index d0e929df7d088..eb170389cf9bc 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3429,6 +3429,12 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
 }
 EXPORT_SYMBOL(drm_dp_add_payload_part2);
 
+int drm_dp_mst_reset_payload_table(struct drm_dp_mst_topology_mgr *mgr)
+{
+	return drm_dp_dpcd_write_payload(mgr, 0, 0, DP_PAYLOAD_TABLE_SIZE - 1);
+}
+EXPORT_SYMBOL(drm_dp_mst_reset_payload_table);
+
 /**
  * drm_dp_mst_has_payload_alloc_errors - Query for payload allocation errors
  * @mst_state: The MST atomic state
@@ -3699,7 +3705,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 			goto out_unlock;
 
 		/* Write reset payload */
-		drm_dp_dpcd_write_payload(mgr, 0, 0, 0x3f);
+		drm_dp_mst_reset_payload_table(mgr);
 
 		queue_work(system_long_wq, &mgr->work);
 
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index bb7c595096fed..2d15399df2950 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -845,6 +845,7 @@ void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
 			   struct drm_dp_mst_topology_state *mst_state,
 			   const struct drm_dp_mst_atomic_payload *old_payload,
 			   struct drm_dp_mst_atomic_payload *new_payload);
+int drm_dp_mst_reset_payload_table(struct drm_dp_mst_topology_mgr *mgr);
 bool drm_dp_mst_has_payload_alloc_errors(const struct drm_dp_mst_topology_state *mst_state);
 int drm_dp_mst_payload_vchannel(const struct drm_dp_mst_topology_state *mst_state,
 				const struct drm_dp_mst_atomic_payload *payload);
-- 
2.37.1

