Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AE743A699
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBFF6E243;
	Mon, 25 Oct 2021 22:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F32D6E243
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635201069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjcCITkGShAEZ+GEYR177H8pWSxySHVTip/EWi8udPY=;
 b=BNo83sIgxs1E36epGSmZNnZTP2QWrdFqAQOmQ+x1/2VKK3qgYrWkeGluTnB63c1CFh+n4N
 k14XdaZszSAeidkrOsFNbXspQAzhU2jKY4Yw1DvgyIAeayoxdvjONMya3JFvM1uAexuI9R
 2Cmtx2Tjow8ownMPGvqNiu8Zc+lL6J8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-OjhrpxEzOO2Zxc7massuEw-1; Mon, 25 Oct 2021 18:31:06 -0400
X-MC-Unique: OjhrpxEzOO2Zxc7massuEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21213100CCC1;
 Mon, 25 Oct 2021 22:31:02 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.9.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42E5E5DD68;
 Mon, 25 Oct 2021 22:30:58 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	amdgfx@lists.freedesktop.org
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 "Lin, Wayne" <Wayne.Lin@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Simon Ser <contact@emersion.fr>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Jude Shih <shenshih@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>, Roman Li <Roman.Li@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Anson Jacob <Anson.Jacob@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Victor Lu <victorchengchi.lu@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Fernando Ramos <greenfoo@u92.eu>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, "Leo (Hanghong) Ma" <hanghong.ma@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Zhan Liu <zhan.liu@amd.com>,
 Bing Guo <bing.guo@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 4/4] drm/amd/display: Add DP 2.0 MST DM Support
Date: Mon, 25 Oct 2021 18:30:28 -0400
Message-Id: <20211025223029.300891-5-lyude@redhat.com>
In-Reply-To: <20211025223029.300891-1-lyude@redhat.com>
References: <20211025223029.300891-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

[Why]
Add DP2 MST and debugfs support

[How]
Update the slot info based on the link encoding format

Reviewed-by: "Lin, Wayne" <Wayne.Lin@amd.com>
Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 29 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  3 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  5 +++-
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f35561b5a465..ecdeeedb1cde 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10684,6 +10684,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	struct dsc_mst_fairness_vars vars[MAX_PIPES];
 #endif
+	struct drm_dp_mst_topology_state *mst_state;
+	struct drm_dp_mst_topology_mgr *mgr;
 
 	trace_amdgpu_dm_atomic_check_begin(state);
 
@@ -10891,6 +10893,33 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		lock_and_validation_needed = true;
 	}
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	/* set the slot info for each mst_state based on the link encoding format */
+	for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
+		struct amdgpu_dm_connector *aconnector;
+		struct drm_connector *connector;
+		struct drm_connector_list_iter iter;
+		u8 link_coding_cap;
+
+		if (!mgr->mst_state )
+			continue;
+
+		drm_connector_list_iter_begin(dev, &iter);
+		drm_for_each_connector_iter(connector, &iter) {
+			int id = connector->index;
+
+			if (id == mst_state->mgr->conn_base_id) {
+				aconnector = to_amdgpu_dm_connector(connector);
+				link_coding_cap = dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
+				drm_dp_mst_update_slots(mst_state, link_coding_cap);
+
+				break;
+			}
+		}
+		drm_connector_list_iter_end(&iter);
+
+	}
+#endif
 	/**
 	 * Streams and planes are reset when there are changes that affect
 	 * bandwidth. Anything that affects bandwidth needs to go through
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 814f67d86a3c..3d44896149a2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -294,6 +294,9 @@ static ssize_t dp_link_settings_write(struct file *f, const char __user *buf,
 	case LINK_RATE_RBR2:
 	case LINK_RATE_HIGH2:
 	case LINK_RATE_HIGH3:
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	case LINK_RATE_UHBR10:
+#endif
 		break;
 	default:
 		valid_input = false;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 6169488e2011..53b5cc7b0679 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -219,6 +219,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 	struct drm_dp_mst_topology_mgr *mst_mgr;
 	struct drm_dp_mst_port *mst_port;
 	bool ret;
+	u8 link_coding_cap;
 
 	aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
 	/* Accessing the connector state is required for vcpi_slots allocation
@@ -238,6 +239,8 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 
 	mst_port = aconnector->port;
 
+	link_coding_cap = dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
+
 	if (enable) {
 
 		ret = drm_dp_mst_allocate_vcpi(mst_mgr, mst_port,
@@ -251,7 +254,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 	}
 
 	/* It's OK for this to fail */
-	drm_dp_update_payload_part1(mst_mgr, 1);
+	drm_dp_update_payload_part1(mst_mgr, (link_coding_cap == DP_CAP_ANSI_128B132B) ? 0:1);
 
 	/* mst_mgr->->payloads are VC payload notify MST branch using DPCD or
 	 * AUX message. The sequence is slot 1-63 allocated sequence for each
-- 
2.31.1

