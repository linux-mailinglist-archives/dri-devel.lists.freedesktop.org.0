Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B68436FE3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 04:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707036E511;
	Fri, 22 Oct 2021 02:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4278F6E511
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 02:20:52 +0000 (UTC)
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Hb7M92s31z1DHfJ;
 Fri, 22 Oct 2021 10:19:01 +0800 (CST)
Received: from huawei.com (10.67.174.47) by dggeme758-chm.china.huawei.com
 (10.3.19.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Fri, 22
 Oct 2021 10:20:49 +0800
From: He Ying <heying24@huawei.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <lyude@redhat.com>, <ville.syrjala@linux.intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <nikola.cornij@amd.com>, <jose.souza@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] drm: Small optimization to
 intel_dp_mst_atomic_master_trans_check
Date: Thu, 21 Oct 2021 22:22:43 -0400
Message-ID: <20211022022243.138860-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
X-CFilter-Loop: Reflected
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

If we want to return from for_each_intel_connector_iter(), one
way is calling drm_connector_list_iter_end() before returning
to avoid memleak. The other way is just breaking from the bracket
and then returning after the outside drm_connector_list_iter_end().
Obviously, the second way makes code smaller and more clear.
Apply it to the function intel_dp_mst_atomic_master_trans_check().

Signed-off-by: He Ying <heying24@huawei.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 8d13d7b26a25..bbecbbbcb10d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -231,6 +231,7 @@ intel_dp_mst_atomic_master_trans_check(struct intel_connector *connector,
 	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
 	struct drm_connector_list_iter connector_list_iter;
 	struct intel_connector *connector_iter;
+	int ret = 0;
 
 	if (DISPLAY_VER(dev_priv) < 12)
 		return  0;
@@ -243,7 +244,6 @@ intel_dp_mst_atomic_master_trans_check(struct intel_connector *connector,
 		struct intel_digital_connector_state *conn_iter_state;
 		struct intel_crtc_state *crtc_state;
 		struct intel_crtc *crtc;
-		int ret;
 
 		if (connector_iter->mst_port != connector->mst_port ||
 		    connector_iter == connector)
@@ -252,8 +252,8 @@ intel_dp_mst_atomic_master_trans_check(struct intel_connector *connector,
 		conn_iter_state = intel_atomic_get_digital_connector_state(state,
 									   connector_iter);
 		if (IS_ERR(conn_iter_state)) {
-			drm_connector_list_iter_end(&connector_list_iter);
-			return PTR_ERR(conn_iter_state);
+			ret = PTR_ERR(conn_iter_state);
+			break;
 		}
 
 		if (!conn_iter_state->base.crtc)
@@ -262,20 +262,18 @@ intel_dp_mst_atomic_master_trans_check(struct intel_connector *connector,
 		crtc = to_intel_crtc(conn_iter_state->base.crtc);
 		crtc_state = intel_atomic_get_crtc_state(&state->base, crtc);
 		if (IS_ERR(crtc_state)) {
-			drm_connector_list_iter_end(&connector_list_iter);
-			return PTR_ERR(crtc_state);
+			ret = PTR_ERR(crtc_state);
+			break;
 		}
 
 		ret = drm_atomic_add_affected_planes(&state->base, &crtc->base);
-		if (ret) {
-			drm_connector_list_iter_end(&connector_list_iter);
-			return ret;
-		}
+		if (ret)
+			break;
 		crtc_state->uapi.mode_changed = true;
 	}
 	drm_connector_list_iter_end(&connector_list_iter);
 
-	return 0;
+	return ret;
 }
 
 static int
-- 
2.17.1

