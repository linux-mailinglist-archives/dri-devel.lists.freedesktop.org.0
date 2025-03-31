Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE37A76DB6
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 21:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E8A10E17A;
	Mon, 31 Mar 2025 19:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PfD6USYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EAE10E1AA;
 Mon, 31 Mar 2025 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rVlZZIyv4OmgkIPoXTTB1AOOU+jCOEaTz7XE+EIH4Es=; b=PfD6USYnQn7UdkrdK8S+n6AhjU
 KPG1r0g+MGl8ap2Fkr/Jle67xArcIR/Chclmh3xVu4n1gCge+URpJ/VDnq4l88hAO1ejlzkUCry3f
 DG2VfY805uCZF4xDRYKUukV/efvmQaH3IqSbBD7LsXASKcwjzdV6FwaKQU6mK32iMfBfef5kgtBOa
 EVyJoL/8I7eL+I8IYoP4VdVtVaDWYeAevY+xhHa2/lSMXWR4jUA6rO9Iqac7u4u3h3fOl04Exl6g8
 3WG0nhPHXMXdX/98VlHKrZcZOTRJ/VvGjZ7fnvXGkJPkY16hLjl8fc+ewJi4gq1YOlEXXbJ8eGJ69
 LRrRrF6A==;
Received: from [179.125.94.226] (helo=quatroqueijos.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tzL1d-009LPP-1s; Mon, 31 Mar 2025 21:42:26 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: stable@vger.kernel.org
Cc: Imre Deak <imre.deak@intel.com>, Lyude Paul <lyude@redhat.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Jerry Zuo <jerry.zuo@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, cascardo@igalia.com
Subject: [PATCH 6.6 3/3] drm/amd/display: Don't write DP_MSTM_CTRL after LT
Date: Mon, 31 Mar 2025 16:42:17 -0300
Message-ID: <20250331194217.763735-3-cascardo@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250331194217.763735-1-cascardo@igalia.com>
References: <20250331194217.763735-1-cascardo@igalia.com>
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

From: Wayne Lin <Wayne.Lin@amd.com>

[ Upstream commit bc068194f548ef1f230d96c4398046bf59165992 ]

[Why]
Observe after suspend/resme, we can't light up mst monitors under specific
mst hub. The reason is that driver still writes DPCD DP_MSTM_CTRL after LT.
It's forbidden even we write the same value for that dpcd register.

[How]
We already resume the mst branch device dpcd settings during
resume_mst_branch_status(). Leverage drm_dp_mst_topology_queue_probe() to
only probe the topology, not calling drm_dp_mst_topology_mgr_resume() which
will set DP_MSTM_CTRL as well.

Reviewed-by: Jerry Zuo <jerry.zuo@amd.com>
Change-Id: I879e9f2e53dfb6fa28a33b6202a5402945ae91c5
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[cascardo: adjust context in local declarations]
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 986ee37688c1..2b7f98a2e36f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2825,8 +2825,7 @@ static int dm_resume(void *handle)
 	struct dm_atomic_state *dm_state = to_dm_atomic_state(dm->atomic_obj.state);
 	enum dc_connection_type new_connection_type = dc_connection_none;
 	struct dc_state *dc_state;
-	int i, r, j, ret;
-	bool need_hotplug = false;
+	int i, r, j;
 
 	if (amdgpu_in_reset(adev)) {
 		dc_state = dm->cached_dc_state;
@@ -3003,23 +3002,16 @@ static int dm_resume(void *handle)
 		    aconnector->mst_root)
 			continue;
 
-		ret = drm_dp_mst_topology_mgr_resume(&aconnector->mst_mgr, true);
-
-		if (ret < 0) {
-			dm_helpers_dp_mst_stop_top_mgr(aconnector->dc_link->ctx,
-					aconnector->dc_link);
-			need_hotplug = true;
-		}
+		drm_dp_mst_topology_queue_probe(&aconnector->mst_mgr);
 	}
 	drm_connector_list_iter_end(&iter);
 
-	if (need_hotplug)
-		drm_kms_helper_hotplug_event(ddev);
-
 	amdgpu_dm_irq_resume_late(adev);
 
 	amdgpu_dm_smu_write_watermarks_table(adev);
 
+	drm_kms_helper_hotplug_event(ddev);
+
 	return 0;
 }
 
-- 
2.47.2

