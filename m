Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703178A6149
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 05:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21981129A2;
	Tue, 16 Apr 2024 03:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 957 seconds by postgrey-1.36 at gabe;
 Tue, 16 Apr 2024 03:06:05 UTC
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB031129A2;
 Tue, 16 Apr 2024 03:06:05 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4VJT3g5SfCz1yny3;
 Tue, 16 Apr 2024 10:47:43 +0800 (CST)
Received: from dggpeml500025.china.huawei.com (unknown [7.185.36.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 97A141403D5;
 Tue, 16 Apr 2024 10:50:05 +0800 (CST)
Received: from hulk-vt.huawei.com (10.67.174.21) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 10:50:04 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <sanglipeng1@jd.com>, <gregkh@linuxfoundation.org>,
 <sashal@kernel.org>, <wayne.lin@amd.com>, <joshua@froggi.es>,
 <hongao@uniontech.com>, <cssk@net-c.es>, <nicholas.kazlauskas@amd.com>,
 <chiahsuan.chung@amd.com>, <mwen@igalia.com>, <roman.li@amd.com>,
 <aurabindo.pillai@amd.com>, <wangzhu9@huawei.com>, <hansen.dsouza@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <konstantin.meskhidze@huawei.com>,
 <aric.cyr@amd.com>, <zhangjialin11@huawei.com>, <jaehyun.chung@amd.com>,
 <mario.limonciello@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5.10] drm/amd/display: Wake DMCUB before executing GPINT
 commands
Date: Tue, 16 Apr 2024 02:43:47 +0000
Message-ID: <20240416024347.2446403-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.21]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500025.china.huawei.com (7.185.36.35)
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

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

stable inclusion
from stable-v6.7.3
commit 	2ef98c6d753a7 ("drm/amd/display: Wake DMCUB before executing GPINT commands")
category: bugfix
bugzilla: https://gitee.com/src-openeuler/kernel/issues/I9BV4C
CVE: CVE-2023-52624

Reference: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2ef98c6d753a744e333b7e34b9cf687040fba57d

--------------------------------

[ Upstream commit e5ffd1263dd5b ("drm/amd/display: Wake DMCUB before executing GPINT commands") ]

[Why]
DMCUB can be in idle when we attempt to interface with the HW through
the GPINT mailbox resulting in a system hang.

[How]
Add dc_wake_and_execute_gpint() to wrap the wake, execute, sleep
sequence.

If the GPINT executes successfully then DMCUB will be put back into
sleep after the optional response is returned.

It functions similar to the inbox command interface.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Hansen Dsouza <hansen.dsouza@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

This patch comes from following commits:

 115c7e7f0501 ("drm/amd/display: Add psr get_state call")
 1d496907f1c5 ("drm/amd/display: Engage PSR synchronously")
 34ba432c946d ("drm/amd/display: [FW Promotion] Release 0.0.44")
 672251b223c1 ("drm/amd/display: [FW Promotion] Release 0.0.40")
 04f3c88f0955 ("drm/amd/display: Retry getting PSR state if command times out")
 b30eda8d416c ("drm/amd/display: Add ETW log to dmub_psr_get_state")
 f59a66c1915e ("drm/amd/display: use do-while-0 for DC_TRACE_LEVEL_MESSAGE()")
 e97cc04fe0fb ("drm/amd/display: refactor dmub commands into single function")
 522b9a5d5852 ("drm/amd/display: drain dmub inbox if queue is full")
 9dce8c2a5f1b ("drm/amd/display: [FW Promotion] Release 0.0.161.0")
 276641775848 ("drm/amd/display: [FW Promotion] Release 0.0.162.0")
 8774029f76b9 ("drm/amd/display: Add DCN35 CLK_MGR")
 65138eb72e1f ("drm/amd/display: Add DCN35 DMUB")
 dc01c4b79bfe ("drm/amd/display: Update driver and IPS interop")
 5b7954272ae9 ("drm/amd/display: [FW Promotion] Release 0.0.183.0")
 da2d16fcdda3 ("drm/amd/display: Fix IPS handshake for idle optimizations")
 5e8a0d3598b4 ("drm/amd/display: Negate IPS allow and commit bits")
 820c3870c491 ("drm/amd/display: Refactor DMCUB enter/exit idle interface")
 2ef98c6d753a ("drm/amd/display: Wake DMCUB before executing GPINT commands")

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  16 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   6 +-
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |  20 +-
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |   4 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  | 265 +++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h  |  31 ++
 drivers/gpu/drm/amd/display/dc/dc_link.h      |   5 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h     |  20 ++
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c |  24 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 140 +++++----
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h |   3 +-
 drivers/gpu/drm/amd/display/dc/dm_services.h  |   9 +
 .../drm/amd/display/dc/dm_services_types.h    |   6 +
 .../gpu/drm/amd/display/dc/inc/hw/clk_mgr.h   |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h  |   2 +-
 .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |   3 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h   |  20 ++
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   | 100 ++++++-
 .../gpu/drm/amd/display/dmub/src/dmub_srv.c   |  27 ++
 22 files changed, 616 insertions(+), 99 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 652ddec18838..924d643a37ae 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9308,7 +9308,7 @@ bool amdgpu_dm_psr_enable(struct dc_stream_state *stream)
 					   &stream, 1,
 					   &params);
 
-	return dc_link_set_psr_allow_active(link, true, false);
+	return dc_link_set_psr_allow_active(link, true, false, false);
 }
 
 /*
@@ -9322,7 +9322,7 @@ static bool amdgpu_dm_psr_disable(struct dc_stream_state *stream)
 
 	DRM_DEBUG_DRIVER("Disabling psr...\n");
 
-	return dc_link_set_psr_allow_active(stream->link, false, true);
+	return dc_link_set_psr_allow_active(stream->link, false, true, false);
 }
 
 /*
@@ -9355,3 +9355,15 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev)
 	}
 	mutex_unlock(&adev->dm.dc_lock);
 }
+
+bool dm_execute_dmub_cmd(const struct dc_context *ctx, union dmub_rb_cmd *cmd,
+			 enum dm_dmub_wait_type wait_type)
+{
+	return dc_dmub_srv_cmd_run(ctx->dmub_srv, cmd, wait_type);
+}
+
+bool dm_execute_dmub_cmd_list(const struct dc_context *ctx, unsigned int count,
+			      union dmub_rb_cmd *cmd, enum dm_dmub_wait_type wait_type)
+{
+	return dc_dmub_srv_cmd_run_list(ctx->dmub_srv, count, cmd, wait_type);
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index e43f82bcb231..9dee30fc4d1c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -2210,11 +2210,11 @@ static int psr_get(void *data, u64 *val)
 {
 	struct amdgpu_dm_connector *connector = data;
 	struct dc_link *link = connector->dc_link;
-	uint32_t psr_state = 0;
+	enum dc_psr_state state = PSR_STATE0;
 
-	dc_link_get_psr_state(link, &psr_state);
+	dc_link_get_psr_state(link, &state);
 
-	*val = psr_state;
+	*val = state;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index 857f156e4985..4a408cbb9363 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -95,7 +95,7 @@ void clk_mgr_exit_optimized_pwr_state(const struct dc *dc, struct clk_mgr *clk_m
 
 	if (edp_link) {
 		clk_mgr->psr_allow_active_cache = edp_link->psr_settings.psr_allow_active;
-		dc_link_set_psr_allow_active(edp_link, false, false);
+		dc_link_set_psr_allow_active(edp_link, false, false, false);
 	}
 
 }
@@ -105,7 +105,8 @@ void clk_mgr_optimize_pwr_state(const struct dc *dc, struct clk_mgr *clk_mgr)
 	struct dc_link *edp_link = get_edp_link(dc);
 
 	if (edp_link)
-		dc_link_set_psr_allow_active(edp_link, clk_mgr->psr_allow_active_cache, false);
+		dc_link_set_psr_allow_active(edp_link,
+				clk_mgr->psr_allow_active_cache, false, false);
 
 	if (dc->hwss.optimize_pwr_state)
 		dc->hwss.optimize_pwr_state(dc, dc->current_state);
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 099542dd3154..384c077e15fc 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3052,9 +3052,9 @@ bool dc_set_psr_allow_active(struct dc *dc, bool enable)
 
 		if (link->psr_settings.psr_feature_enabled) {
 			if (enable && !link->psr_settings.psr_allow_active)
-				return dc_link_set_psr_allow_active(link, true, false);
+				return dc_link_set_psr_allow_active(link, true, false, false);
 			else if (!enable && link->psr_settings.psr_allow_active)
-				return dc_link_set_psr_allow_active(link, false, true);
+				return dc_link_set_psr_allow_active(link, false, true, false);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 62778ccea055..d4167fbbcce8 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -2584,17 +2584,24 @@ bool dc_link_set_backlight_level(const struct dc_link *link,
 	return true;
 }
 
-bool dc_link_set_psr_allow_active(struct dc_link *link, bool allow_active, bool wait)
+bool dc_link_set_psr_allow_active(struct dc_link *link, bool allow_active,
+		bool wait, bool force_static)
 {
 	struct dc  *dc = link->ctx->dc;
 	struct dmcu *dmcu = dc->res_pool->dmcu;
 	struct dmub_psr *psr = dc->res_pool->psr;
 
+	if (psr == NULL && force_static)
+		return false;
+
 	link->psr_settings.psr_allow_active = allow_active;
 
-	if (psr != NULL && link->psr_settings.psr_feature_enabled)
+	if (psr != NULL && link->psr_settings.psr_feature_enabled) {
+		if (force_static && psr->funcs->psr_force_static)
+			psr->funcs->psr_force_static(psr);
 		psr->funcs->psr_enable(psr, allow_active, wait);
-	else if ((dmcu != NULL && dmcu->funcs->is_dmcu_initialized(dmcu)) && link->psr_settings.psr_feature_enabled)
+	} else if ((dmcu != NULL && dmcu->funcs->is_dmcu_initialized(dmcu)) &&
+			link->psr_settings.psr_feature_enabled)
 		dmcu->funcs->set_psr_enable(dmcu, allow_active, wait);
 	else
 		return false;
@@ -2602,16 +2609,16 @@ bool dc_link_set_psr_allow_active(struct dc_link *link, bool allow_active, bool
 	return true;
 }
 
-bool dc_link_get_psr_state(const struct dc_link *link, uint32_t *psr_state)
+bool dc_link_get_psr_state(const struct dc_link *link, enum dc_psr_state *state)
 {
 	struct dc  *dc = link->ctx->dc;
 	struct dmcu *dmcu = dc->res_pool->dmcu;
 	struct dmub_psr *psr = dc->res_pool->psr;
 
 	if (psr != NULL && link->psr_settings.psr_feature_enabled)
-		psr->funcs->psr_get_state(psr, psr_state);
+		psr->funcs->psr_get_state(psr, state);
 	else if (dmcu != NULL && link->psr_settings.psr_feature_enabled)
-		dmcu->funcs->get_psr_state(dmcu, psr_state);
+		dmcu->funcs->get_psr_state(dmcu, state);
 
 	return true;
 }
@@ -2674,7 +2681,6 @@ bool dc_link_setup_psr(struct dc_link *link,
 	if (!dmcu && !psr)
 		return false;
 
-
 	memset(&psr_configuration, 0, sizeof(psr_configuration));
 
 	psr_configuration.bits.ENABLE                    = 1;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 3f4403e77814..4bb052142fc3 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -2570,8 +2570,8 @@ static bool handle_hpd_irq_psr_sink(struct dc_link *link)
 				sizeof(psr_error_status.raw));
 
 			/* PSR error, disable and re-enable PSR */
-			dc_link_set_psr_allow_active(link, false, true);
-			dc_link_set_psr_allow_active(link, true, true);
+			dc_link_set_psr_allow_active(link, false, true, false);
+			dc_link_set_psr_allow_active(link, true, true, false);
 
 			return true;
 		} else if (psr_sink_psr_status.bits.SINK_SELF_REFRESH_STATUS ==
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 82fe0ab56e3a..4434498363bc 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -504,6 +504,8 @@ struct dc_debug_options {
 	bool disable_dsc;
 	bool enable_dram_clock_change_one_display_vactive;
 	bool force_ignore_link_settings;
+	unsigned int ips2_eval_delay_us;
+	unsigned int ips2_entry_delay_us;
 };
 
 struct dc_debug_data {
@@ -599,9 +601,7 @@ struct dc {
 	/* Require to optimize clocks and bandwidth for added/removed planes */
 	bool optimized_required;
 	bool wm_optimized_required;
-#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	bool idle_optimizations_allowed;
-#endif
 
 	/* Require to maintain clocks and bandwidth for UEFI enabled HW */
 	int optimize_seamless_boot_streams;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index b98754811977..2cbd5c6d9518 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -26,6 +26,7 @@
 #include "dc.h"
 #include "dc_dmub_srv.h"
 #include "../dmub/dmub_srv.h"
+#include "clk_mgr.h"
 
 static void dc_dmub_srv_construct(struct dc_dmub_srv *dc_srv, struct dc *dc,
 				  struct dmub_srv *dmub)
@@ -84,6 +85,66 @@ void dc_dmub_srv_cmd_queue(struct dc_dmub_srv *dc_dmub_srv,
 	DC_ERROR("Error queuing DMUB command: status=%d\n", status);
 }
 
+bool dc_dmub_srv_cmd_run(struct dc_dmub_srv *dc_dmub_srv, union dmub_rb_cmd *cmd,
+			 enum dm_dmub_wait_type wait_type)
+{
+	return dc_dmub_srv_cmd_run_list(dc_dmub_srv, 1, cmd, wait_type);
+}
+
+bool dc_dmub_srv_cmd_run_list(struct dc_dmub_srv *dc_dmub_srv, unsigned int count,
+			      union dmub_rb_cmd *cmd_list, enum dm_dmub_wait_type wait_type)
+{
+	struct dc_context *dc_ctx;
+	struct dmub_srv *dmub;
+	enum dmub_status status;
+	int i;
+
+	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
+		return false;
+
+	dc_ctx = dc_dmub_srv->ctx;
+	dmub = dc_dmub_srv->dmub;
+
+	for (i = 0 ; i < count; i++) {
+		// Queue command
+		status = dmub_srv_cmd_queue(dmub, &cmd_list[i]);
+		if (status == DMUB_STATUS_QUEUE_FULL) {
+			/* Execute and wait for queue to become empty again. */
+			dmub_srv_cmd_execute(dmub);
+			dmub_srv_wait_for_idle(dmub, 100000);
+
+			/* Requeue the command. */
+			status = dmub_srv_cmd_queue(dmub, &cmd_list[i]);
+		}
+
+		if (status != DMUB_STATUS_OK) {
+			DC_ERROR("Error queueing DMUB command: status=%d\n", status);
+			return false;
+		}
+	}
+
+	status = dmub_srv_cmd_execute(dmub);
+	if (status != DMUB_STATUS_OK) {
+		DC_ERROR("Error starting DMUB execution: status=%d\n", status);
+		return false;
+	}
+
+	// Wait for DMUB to process command
+	if (wait_type != DM_DMUB_WAIT_TYPE_NO_WAIT) {
+		status = dmub_srv_wait_for_idle(dmub, 100000);
+		if (status != DMUB_STATUS_OK) {
+			DC_LOG_DEBUG("No reply for DMUB command: status=%d\n", status);
+			return false;
+		}
+
+		// Copy data back from ring buffer into command
+		if (wait_type == DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY)
+			dmub_rb_get_return_data(&dmub->inbox1_rb, cmd_list);
+	}
+
+	return true;
+}
+
 void dc_dmub_srv_cmd_execute(struct dc_dmub_srv *dc_dmub_srv)
 {
 	struct dmub_srv *dmub = dc_dmub_srv->dmub;
@@ -136,15 +197,207 @@ void dc_dmub_srv_wait_phy_init(struct dc_dmub_srv *dc_dmub_srv)
 bool dc_dmub_srv_notify_stream_mask(struct dc_dmub_srv *dc_dmub_srv,
 				    unsigned int stream_mask)
 {
-	struct dmub_srv *dmub;
-	const uint32_t timeout = 30;
+	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
+		return false;
+
+	return dc_wake_and_execute_gpint(dc_dmub_srv->ctx, DMUB_GPINT__IDLE_OPT_NOTIFY_STREAM_MASK,
+					 stream_mask, NULL, DM_DMUB_WAIT_TYPE_WAIT);
+}
+
+bool dc_dmub_srv_is_hw_pwr_up(struct dc_dmub_srv *dc_dmub_srv, bool wait)
+{
+	struct dc_context *dc_ctx;
+	enum dmub_status status;
+
+	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
+		return true;
+
+	if (dc_dmub_srv->ctx->dc->debug.dmcub_emulation)
+		return true;
+
+	dc_ctx = dc_dmub_srv->ctx;
+
+	if (wait) {
+		status = dmub_srv_wait_for_hw_pwr_up(dc_dmub_srv->dmub, 500000);
+		if (status != DMUB_STATUS_OK) {
+			DC_ERROR("Error querying DMUB hw power up status: error=%d\n", status);
+			return false;
+		}
+	} else {
+		return dmub_srv_is_hw_pwr_up(dc_dmub_srv->dmub);
+	}
+
+	return true;
+}
+
+static void dc_dmub_srv_notify_idle(const struct dc *dc, bool allow_idle)
+{
+	union dmub_rb_cmd cmd = {0};
+
+	if (dc->debug.dmcub_emulation)
+		return;
+
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.idle_opt_notify_idle.header.type = DMUB_CMD__IDLE_OPT;
+	cmd.idle_opt_notify_idle.header.sub_type = DMUB_CMD__IDLE_OPT_DCN_NOTIFY_IDLE;
+	cmd.idle_opt_notify_idle.header.payload_bytes =
+		sizeof(cmd.idle_opt_notify_idle) -
+		sizeof(cmd.idle_opt_notify_idle.header);
+
+	cmd.idle_opt_notify_idle.cntl_data.driver_idle = allow_idle;
+
+	if (allow_idle) {
+		if (dc->hwss.set_idle_state)
+			dc->hwss.set_idle_state(dc, true);
+	}
+
+	/* NOTE: This does not use the "wake" interface since this is part of the wake path. */
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+}
+
+static void dc_dmub_srv_exit_low_power_state(const struct dc *dc)
+{
+	const uint32_t max_num_polls = 10000;
+	uint32_t allow_state = 0;
+	uint32_t commit_state = 0;
+	uint32_t i;
+
+	if (dc->debug.dmcub_emulation)
+		return;
+
+	if (!dc->idle_optimizations_allowed)
+		return;
+
+	if (!dc->ctx->dmub_srv || !dc->ctx->dmub_srv->dmub)
+		return;
+
+	if (dc->hwss.get_idle_state &&
+		dc->hwss.set_idle_state &&
+		dc->clk_mgr->funcs->exit_low_power_state) {
+		allow_state = dc->hwss.get_idle_state(dc);
+		dc->hwss.set_idle_state(dc, false);
+
+		if (!(allow_state & DMUB_IPS2_ALLOW_MASK)) {
+			// Wait for evaluation time
+			udelay(dc->debug.ips2_eval_delay_us);
+			commit_state = dc->hwss.get_idle_state(dc);
+			if (!(commit_state & DMUB_IPS2_COMMIT_MASK)) {
+				// Tell PMFW to exit low power state
+				dc->clk_mgr->funcs->exit_low_power_state(dc->clk_mgr);
+
+				// Wait for IPS2 entry upper bound
+				udelay(dc->debug.ips2_entry_delay_us);
+				dc->clk_mgr->funcs->exit_low_power_state(dc->clk_mgr);
+
+				for (i = 0; i < max_num_polls; ++i) {
+					commit_state = dc->hwss.get_idle_state(dc);
+					if (commit_state & DMUB_IPS2_COMMIT_MASK)
+						break;
+
+					udelay(1);
+				}
+				ASSERT(i < max_num_polls);
+
+				if (!dc_dmub_srv_is_hw_pwr_up(dc->ctx->dmub_srv, true))
+					ASSERT(0);
+
+				/* TODO: See if we can return early here - IPS2 should go
+				 * back directly to IPS0 and clear the flags, but it will
+				 * be safer to directly notify DMCUB of this.
+				 */
+				allow_state = dc->hwss.get_idle_state(dc);
+			}
+		}
+
+		dc_dmub_srv_notify_idle(dc, false);
+		if (!(allow_state & DMUB_IPS1_ALLOW_MASK)) {
+			for (i = 0; i < max_num_polls; ++i) {
+				commit_state = dc->hwss.get_idle_state(dc);
+				if (commit_state & DMUB_IPS1_COMMIT_MASK)
+					break;
+
+				udelay(1);
+			}
+			ASSERT(i < max_num_polls);
+		}
+	}
+
+	if (!dc_dmub_srv_is_hw_pwr_up(dc->ctx->dmub_srv, true))
+		ASSERT(0);
+}
+
+void dc_dmub_srv_apply_idle_power_optimizations(const struct dc *dc, bool allow_idle)
+{
+	struct dc_dmub_srv *dc_dmub_srv = dc->ctx->dmub_srv;
+
+	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
+		return;
+
+	if (dc_dmub_srv->idle_allowed == allow_idle)
+		return;
+
+	/*
+	 * Entering a low power state requires a driver notification.
+	 * Powering up the hardware requires notifying PMFW and DMCUB.
+	 * Clearing the driver idle allow requires a DMCUB command.
+	 * DMCUB commands requires the DMCUB to be powered up and restored.
+	 *
+	 * Exit out early to prevent an infinite loop of DMCUB commands
+	 * triggering exit low power - use software state to track this.
+	 */
+	dc_dmub_srv->idle_allowed = allow_idle;
+
+	if (!allow_idle)
+		dc_dmub_srv_exit_low_power_state(dc);
+	else
+		dc_dmub_srv_notify_idle(dc, allow_idle);
+}
+
+static bool dc_dmub_execute_gpint(const struct dc_context *ctx,
+				  enum dmub_gpint_command command_code, uint16_t param,
+				  uint32_t *response, enum dm_dmub_wait_type wait_type)
+{
+	struct dc_dmub_srv *dc_dmub_srv = ctx->dmub_srv;
+	const uint32_t wait_us = wait_type == DM_DMUB_WAIT_TYPE_NO_WAIT ? 0 : 30;
+	enum dmub_status status;
+
+	if (response)
+		*response = 0;
 
 	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
 		return false;
 
-	dmub = dc_dmub_srv->dmub;
+	status = dmub_srv_send_gpint_command(dc_dmub_srv->dmub, command_code, param, wait_us);
+	if (status != DMUB_STATUS_OK) {
+		if (status == DMUB_STATUS_TIMEOUT && wait_type == DM_DMUB_WAIT_TYPE_NO_WAIT)
+			return true;
+
+		return false;
+	}
+
+	if (response && wait_type == DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY)
+		dmub_srv_get_gpint_response(dc_dmub_srv->dmub, response);
+
+	return true;
+}
+
+bool dc_wake_and_execute_gpint(const struct dc_context *ctx, enum dmub_gpint_command command_code,
+			       uint16_t param, uint32_t *response, enum dm_dmub_wait_type wait_type)
+{
+	struct dc_dmub_srv *dc_dmub_srv = ctx->dmub_srv;
+	bool result = false, reallow_idle = false;
+
+	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
+		return false;
+
+	if (dc_dmub_srv->idle_allowed) {
+		dc_dmub_srv_apply_idle_power_optimizations(ctx->dc, false);
+		reallow_idle = true;
+	}
+
+	result = dc_dmub_execute_gpint(ctx, command_code, param, response, wait_type);
+	if (result && reallow_idle)
+		dc_dmub_srv_apply_idle_power_optimizations(ctx->dc, true);
 
-	return dmub_srv_send_gpint_command(
-		       dmub, DMUB_GPINT__IDLE_OPT_NOTIFY_STREAM_MASK,
-		       stream_mask, timeout) == DMUB_STATUS_OK;
+	return result;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
index bb4ab61887e4..d8d4b02c5ace 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
@@ -27,6 +27,7 @@
 #define _DMUB_DC_SRV_H_
 
 #include "os_types.h"
+#include "dm_services_types.h"
 #include "dmub/dmub_srv.h"
 
 struct dmub_srv;
@@ -45,6 +46,8 @@ struct dc_dmub_srv {
 
 	struct dc_context *ctx;
 	void *dm;
+
+	bool idle_allowed;
 };
 
 void dc_dmub_srv_cmd_queue(struct dc_dmub_srv *dc_dmub_srv,
@@ -56,6 +59,34 @@ void dc_dmub_srv_wait_idle(struct dc_dmub_srv *dc_dmub_srv);
 
 void dc_dmub_srv_wait_phy_init(struct dc_dmub_srv *dc_dmub_srv);
 
+bool dc_dmub_srv_cmd_run(struct dc_dmub_srv *dc_dmub_srv, union dmub_rb_cmd *cmd,
+			 enum dm_dmub_wait_type wait_type);
+
+bool dc_dmub_srv_cmd_run_list(struct dc_dmub_srv *dc_dmub_srv, unsigned int count,
+			      union dmub_rb_cmd *cmd_list, enum dm_dmub_wait_type wait_type);
+
 bool dc_dmub_srv_notify_stream_mask(struct dc_dmub_srv *dc_dmub_srv,
 				    unsigned int stream_mask);
+
+bool dc_wake_and_execute_dmub_cmd(const struct dc_context *ctx, union dmub_rb_cmd *cmd,
+				  enum dm_dmub_wait_type wait_type);
+
+bool dc_wake_and_execute_dmub_cmd_list(const struct dc_context *ctx, unsigned int count,
+				       union dmub_rb_cmd *cmd, enum dm_dmub_wait_type wait_type);
+
+void dc_dmub_srv_apply_idle_power_optimizations(const struct dc *dc, bool allow_idle);
+
+/**
+ * dc_wake_and_execute_gpint()
+ *
+ * @ctx: DC context
+ * @command_code: The command ID to send to DMCUB
+ * @param: The parameter to message DMCUB
+ * @response: Optional response out value - may be NULL.
+ * @wait_type: The wait behavior for the execution
+ */
+bool dc_wake_and_execute_gpint(const struct dc_context *ctx, enum dmub_gpint_command command_code,
+			       uint16_t param, uint32_t *response,
+			       enum dm_dmub_wait_type wait_type);
+
 #endif /* _DMUB_DC_SRV_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index 266b93a705d5..39277aaa3e62 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -219,9 +219,10 @@ int dc_link_get_backlight_level(const struct dc_link *dc_link);
 
 int dc_link_get_target_backlight_pwm(const struct dc_link *link);
 
-bool dc_link_set_psr_allow_active(struct dc_link *dc_link, bool enable, bool wait);
+bool dc_link_set_psr_allow_active(struct dc_link *dc_link, bool enable,
+		bool wait, bool force_static);
 
-bool dc_link_get_psr_state(const struct dc_link *dc_link, uint32_t *psr_state);
+bool dc_link_get_psr_state(const struct dc_link *dc_link, enum dc_psr_state *state);
 
 bool dc_link_setup_psr(struct dc_link *dc_link,
 		const struct dc_stream_state *stream, struct psr_config *psr_config,
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index c47a19719de2..bf8283ce7527 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -674,6 +674,26 @@ struct dc_plane_flip_time {
 	unsigned int prev_update_time_in_us;
 };
 
+enum dc_psr_state {
+	PSR_STATE0 = 0x0,
+	PSR_STATE1,
+	PSR_STATE1a,
+	PSR_STATE2,
+	PSR_STATE2a,
+	PSR_STATE3,
+	PSR_STATE3Init,
+	PSR_STATE4,
+	PSR_STATE4a,
+	PSR_STATE4b,
+	PSR_STATE4c,
+	PSR_STATE4d,
+	PSR_STATE5,
+	PSR_STATE5a,
+	PSR_STATE5b,
+	PSR_STATE5c,
+	PSR_STATE_INVALID = 0xFF
+};
+
 struct psr_config {
 	unsigned char psr_version;
 	unsigned int psr_rfb_setup_time;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c b/drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c
index 4216419503af..4c397a099e07 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c
@@ -99,7 +99,7 @@ bool dce_dmcu_load_iram(struct dmcu *dmcu,
 	return true;
 }
 
-static void dce_get_dmcu_psr_state(struct dmcu *dmcu, uint32_t *psr_state)
+static void dce_get_dmcu_psr_state(struct dmcu *dmcu, enum dc_psr_state *state)
 {
 	struct dce_dmcu *dmcu_dce = TO_DCE_DMCU(dmcu);
 
@@ -114,7 +114,7 @@ static void dce_get_dmcu_psr_state(struct dmcu *dmcu, uint32_t *psr_state)
 	REG_WRITE(DMCU_IRAM_RD_CTRL, psr_state_offset);
 
 	/* Read data from IRAM_RD_DATA in DMCU_IRAM_RD_DATA*/
-	*psr_state = REG_READ(DMCU_IRAM_RD_DATA);
+	*state = (enum dc_psr_state)REG_READ(DMCU_IRAM_RD_DATA);
 
 	/* Disable write access to IRAM after finished using IRAM
 	 * in order to allow dynamic sleep state
@@ -129,7 +129,7 @@ static void dce_dmcu_set_psr_enable(struct dmcu *dmcu, bool enable, bool wait)
 	unsigned int dmcu_wait_reg_ready_interval = 100;
 
 	unsigned int retryCount;
-	uint32_t psr_state = 0;
+	enum dc_psr_state state = PSR_STATE0;
 
 	/* waitDMCUReadyForCmd */
 	REG_WAIT(MASTER_COMM_CNTL_REG, MASTER_COMM_INTERRUPT, 0,
@@ -148,12 +148,12 @@ static void dce_dmcu_set_psr_enable(struct dmcu *dmcu, bool enable, bool wait)
 	REG_UPDATE(MASTER_COMM_CNTL_REG, MASTER_COMM_INTERRUPT, 1);
 	if (wait == true) {
 		for (retryCount = 0; retryCount <= 100; retryCount++) {
-			dce_get_dmcu_psr_state(dmcu, &psr_state);
+			dce_get_dmcu_psr_state(dmcu, &state);
 			if (enable) {
-				if (psr_state != 0)
+				if (state != PSR_STATE0)
 					break;
 			} else {
-				if (psr_state == 0)
+				if (state == PSR_STATE0)
 					break;
 			}
 			udelay(10);
@@ -513,7 +513,7 @@ static bool dcn10_dmcu_load_iram(struct dmcu *dmcu,
 	return true;
 }
 
-static void dcn10_get_dmcu_psr_state(struct dmcu *dmcu, uint32_t *psr_state)
+static void dcn10_get_dmcu_psr_state(struct dmcu *dmcu, enum dc_psr_state *state)
 {
 	struct dce_dmcu *dmcu_dce = TO_DCE_DMCU(dmcu);
 
@@ -532,7 +532,7 @@ static void dcn10_get_dmcu_psr_state(struct dmcu *dmcu, uint32_t *psr_state)
 	REG_WRITE(DMCU_IRAM_RD_CTRL, psr_state_offset);
 
 	/* Read data from IRAM_RD_DATA in DMCU_IRAM_RD_DATA*/
-	*psr_state = REG_READ(DMCU_IRAM_RD_DATA);
+	*state = (enum dc_psr_state)REG_READ(DMCU_IRAM_RD_DATA);
 
 	/* Disable write access to IRAM after finished using IRAM
 	 * in order to allow dynamic sleep state
@@ -547,7 +547,7 @@ static void dcn10_dmcu_set_psr_enable(struct dmcu *dmcu, bool enable, bool wait)
 	unsigned int dmcu_wait_reg_ready_interval = 100;
 
 	unsigned int retryCount;
-	uint32_t psr_state = 0;
+	enum dc_psr_state state = PSR_STATE0;
 
 	/* If microcontroller is not running, do nothing */
 	if (dmcu->dmcu_state != DMCU_RUNNING)
@@ -575,12 +575,12 @@ static void dcn10_dmcu_set_psr_enable(struct dmcu *dmcu, bool enable, bool wait)
 	 */
 	if (wait == true) {
 		for (retryCount = 0; retryCount <= 1000; retryCount++) {
-			dcn10_get_dmcu_psr_state(dmcu, &psr_state);
+			dcn10_get_dmcu_psr_state(dmcu, &state);
 			if (enable) {
-				if (psr_state != 0)
+				if (state != PSR_STATE0)
 					break;
 			} else {
-				if (psr_state == 0)
+				if (state == PSR_STATE0)
 					break;
 			}
 			udelay(500);
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index 67af67ef2865..f93be6477538 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -29,60 +29,83 @@
 #include "dmub/dmub_srv.h"
 #include "core_types.h"
 
+#define DC_TRACE_LEVEL_MESSAGE(...)	do {} while (0) /* do nothing */
+
 #define MAX_PIPES 6
 
 /**
  * Convert dmcub psr state to dmcu psr state.
  */
-static void convert_psr_state(uint32_t *psr_state)
+static enum dc_psr_state convert_psr_state(uint32_t raw_state)
 {
-	if (*psr_state == 0)
-		*psr_state = 0;
-	else if (*psr_state == 0x10)
-		*psr_state = 1;
-	else if (*psr_state == 0x11)
-		*psr_state = 2;
-	else if (*psr_state == 0x20)
-		*psr_state = 3;
-	else if (*psr_state == 0x21)
-		*psr_state = 4;
-	else if (*psr_state == 0x30)
-		*psr_state = 5;
-	else if (*psr_state == 0x31)
-		*psr_state = 6;
-	else if (*psr_state == 0x40)
-		*psr_state = 7;
-	else if (*psr_state == 0x41)
-		*psr_state = 8;
-	else if (*psr_state == 0x42)
-		*psr_state = 9;
-	else if (*psr_state == 0x43)
-		*psr_state = 10;
-	else if (*psr_state == 0x44)
-		*psr_state = 11;
-	else if (*psr_state == 0x50)
-		*psr_state = 12;
-	else if (*psr_state == 0x51)
-		*psr_state = 13;
-	else if (*psr_state == 0x52)
-		*psr_state = 14;
-	else if (*psr_state == 0x53)
-		*psr_state = 15;
+	enum dc_psr_state state = PSR_STATE0;
+
+	if (raw_state == 0)
+		state = PSR_STATE0;
+	else if (raw_state == 0x10)
+		state = PSR_STATE1;
+	else if (raw_state == 0x11)
+		state = PSR_STATE1a;
+	else if (raw_state == 0x20)
+		state = PSR_STATE2;
+	else if (raw_state == 0x21)
+		state = PSR_STATE2a;
+	else if (raw_state == 0x30)
+		state = PSR_STATE3;
+	else if (raw_state == 0x31)
+		state = PSR_STATE3Init;
+	else if (raw_state == 0x40)
+		state = PSR_STATE4;
+	else if (raw_state == 0x41)
+		state = PSR_STATE4a;
+	else if (raw_state == 0x42)
+		state = PSR_STATE4b;
+	else if (raw_state == 0x43)
+		state = PSR_STATE4c;
+	else if (raw_state == 0x44)
+		state = PSR_STATE4d;
+	else if (raw_state == 0x50)
+		state = PSR_STATE5;
+	else if (raw_state == 0x51)
+		state = PSR_STATE5a;
+	else if (raw_state == 0x52)
+		state = PSR_STATE5b;
+	else if (raw_state == 0x53)
+		state = PSR_STATE5c;
+
+	return state;
 }
 
 /**
  * Get PSR state from firmware.
  */
-static void dmub_psr_get_state(struct dmub_psr *dmub, uint32_t *psr_state)
+static void dmub_psr_get_state(struct dmub_psr *dmub, enum dc_psr_state *state)
 {
-	struct dmub_srv *srv = dmub->ctx->dmub_srv->dmub;
-
-	// Send gpint command and wait for ack
-	dmub_srv_send_gpint_command(srv, DMUB_GPINT__GET_PSR_STATE, 0, 30);
-
-	dmub_srv_get_gpint_response(srv, psr_state);
-
-	convert_psr_state(psr_state);
+	uint32_t raw_state = 0;
+	uint32_t retry_count = 0;
+
+	do {
+		// Send gpint command and wait for ack
+		if (dc_wake_and_execute_gpint(dmub->ctx, DMUB_GPINT__GET_PSR_STATE, 0,
+					      &raw_state, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY)) {
+			*state = convert_psr_state(raw_state);
+		} else {
+			// Return invalid state when GPINT times out
+			*state = PSR_STATE_INVALID;
+		}
+	} while (++retry_count <= 1000 && *state == PSR_STATE_INVALID);
+
+	// Assert if max retry hit
+	if (retry_count >= 1000 && *state == PSR_STATE_INVALID) {
+		ASSERT(0);
+		DC_TRACE_LEVEL_MESSAGE(DAL_TRACE_LEVEL_ERROR,
+				WPP_BIT_FLAG_Firmware_PsrState,
+				"Unable to get PSR state from FW.");
+	} else
+		DC_TRACE_LEVEL_MESSAGE(DAL_TRACE_LEVEL_VERBOSE,
+				WPP_BIT_FLAG_Firmware_PsrState,
+				"Got PSR state from FW. PSR state: %d, Retry count: %d",
+				*state, retry_count);
 }
 
 /**
@@ -123,7 +146,8 @@ static void dmub_psr_enable(struct dmub_psr *dmub, bool enable, bool wait)
 {
 	union dmub_rb_cmd cmd;
 	struct dc_context *dc = dmub->ctx;
-	uint32_t retry_count, psr_state = 0;
+	uint32_t retry_count;
+	enum dc_psr_state state = PSR_STATE0;
 
 	cmd.psr_enable.header.type = DMUB_CMD__PSR;
 
@@ -144,13 +168,13 @@ static void dmub_psr_enable(struct dmub_psr *dmub, bool enable, bool wait)
 	 */
 	if (wait) {
 		for (retry_count = 0; retry_count <= 1000; retry_count++) {
-			dmub_psr_get_state(dmub, &psr_state);
+			dmub_psr_get_state(dmub, &state);
 
 			if (enable) {
-				if (psr_state != 0)
+				if (state != PSR_STATE0)
 					break;
 			} else {
-				if (psr_state == 0)
+				if (state == PSR_STATE0)
 					break;
 			}
 
@@ -169,12 +193,12 @@ static void dmub_psr_enable(struct dmub_psr *dmub, bool enable, bool wait)
 static void dmub_psr_set_level(struct dmub_psr *dmub, uint16_t psr_level)
 {
 	union dmub_rb_cmd cmd;
-	uint32_t psr_state = 0;
+	enum dc_psr_state state = PSR_STATE0;
 	struct dc_context *dc = dmub->ctx;
 
-	dmub_psr_get_state(dmub, &psr_state);
+	dmub_psr_get_state(dmub, &state);
 
-	if (psr_state == 0)
+	if (state == PSR_STATE0)
 		return;
 
 	cmd.psr_set_level.header.type = DMUB_CMD__PSR;
@@ -269,11 +293,29 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
 	return true;
 }
 
+/**
+ * Send command to PSR to force static ENTER and ignore all state changes until exit
+ */
+static void dmub_psr_force_static(struct dmub_psr *dmub)
+{
+	union dmub_rb_cmd cmd;
+	struct dc_context *dc = dmub->ctx;
+
+	cmd.psr_force_static.header.type = DMUB_CMD__PSR;
+	cmd.psr_force_static.header.sub_type = DMUB_CMD__PSR_FORCE_STATIC;
+	cmd.psr_enable.header.payload_bytes = 0;
+
+	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
+	dc_dmub_srv_cmd_execute(dc->dmub_srv);
+	dc_dmub_srv_wait_idle(dc->dmub_srv);
+}
+
 static const struct dmub_psr_funcs psr_funcs = {
 	.psr_copy_settings		= dmub_psr_copy_settings,
 	.psr_enable			= dmub_psr_enable,
 	.psr_get_state			= dmub_psr_get_state,
 	.psr_set_level			= dmub_psr_set_level,
+	.psr_force_static		= dmub_psr_force_static,
 };
 
 /**
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h
index dc121ed92d2e..4e113ac5a56b 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h
@@ -37,8 +37,9 @@ struct dmub_psr {
 struct dmub_psr_funcs {
 	bool (*psr_copy_settings)(struct dmub_psr *dmub, struct dc_link *link, struct psr_context *psr_context);
 	void (*psr_enable)(struct dmub_psr *dmub, bool enable, bool wait);
-	void (*psr_get_state)(struct dmub_psr *dmub, uint32_t *psr_state);
+	void (*psr_get_state)(struct dmub_psr *dmub, enum dc_psr_state *dc_psr_state);
 	void (*psr_set_level)(struct dmub_psr *dmub, uint16_t psr_level);
+	void (*psr_force_static)(struct dmub_psr *dmub);
 };
 
 struct dmub_psr *dmub_psr_create(struct dc_context *ctx);
diff --git a/drivers/gpu/drm/amd/display/dc/dm_services.h b/drivers/gpu/drm/amd/display/dc/dm_services.h
index fdd1943c828d..569cdbdc4746 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_services.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_services.h
@@ -42,6 +42,7 @@
 
 struct dmub_srv;
 struct dc_dmub_srv;
+union dmub_rb_cmd;
 
 irq_handler_idx dm_register_interrupt(
 	struct dc_context *ctx,
@@ -294,6 +295,14 @@ unsigned long long dm_get_elapse_time_in_ns(struct dc_context *ctx,
 		__CTX->perf_trace->write_count, &__CTX->perf_trace->last_entry_read,\
 		&__CTX->perf_trace->last_entry_write, __func__, __LINE__)
 
+/*
+ * DMUB Interfaces
+ */
+bool dm_execute_dmub_cmd(const struct dc_context *ctx, union dmub_rb_cmd *cmd,
+			 enum dm_dmub_wait_type wait_type);
+
+bool dm_execute_dmub_cmd_list(const struct dc_context *ctx, unsigned int count,
+			      union dmub_rb_cmd *cmd, enum dm_dmub_wait_type wait_type);
 
 /*
  * Debug and verification hooks
diff --git a/drivers/gpu/drm/amd/display/dc/dm_services_types.h b/drivers/gpu/drm/amd/display/dc/dm_services_types.h
index b52ba6ffabe1..facf269c4326 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_services_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_services_types.h
@@ -269,4 +269,10 @@ struct dtn_min_clk_info {
 	uint32_t min_memory_clock_khz;
 };
 
+enum dm_dmub_wait_type {
+	DM_DMUB_WAIT_TYPE_NO_WAIT,
+	DM_DMUB_WAIT_TYPE_WAIT,
+	DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY,
+};
+
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
index 947d6106f341..c22d6dd9dfec 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
@@ -231,6 +231,7 @@ struct clk_mgr_funcs {
 	int (*get_dp_ref_clk_frequency)(struct clk_mgr *clk_mgr);
 
 	void (*set_low_power_state)(struct clk_mgr *clk_mgr);
+	void (*exit_low_power_state)(struct clk_mgr *clk_mgr);
 
 	void (*init_clocks)(struct clk_mgr *clk_mgr);
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h
index 5315f1f86b21..69d9fbfb4bec 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h
@@ -66,7 +66,7 @@ struct dmcu_funcs {
 	bool (*setup_psr)(struct dmcu *dmcu,
 			struct dc_link *link,
 			struct psr_context *psr_context);
-	void (*get_psr_state)(struct dmcu *dmcu, uint32_t *psr_state);
+	void (*get_psr_state)(struct dmcu *dmcu, enum dc_psr_state *dc_psr_state);
 	void (*set_psr_wait_loop)(struct dmcu *dmcu,
 			unsigned int wait_loop_number);
 	void (*get_psr_wait_loop)(struct dmcu *dmcu,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
index 3165a66c5362..03c075ea5fc1 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
@@ -213,7 +213,8 @@ struct hw_sequencer_funcs {
 	/* Idle Optimization Related */
 	bool (*apply_idle_power_optimizations)(struct dc *dc, bool enable);
 #endif
-
+	void (*set_idle_state)(const struct dc *dc, bool allow_idle);
+	uint32_t (*get_idle_state)(const struct dc *dc);
 };
 
 void color_space_to_black_color(
diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
index 882b4e2816b5..9ff364c6353d 100644
--- a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
@@ -264,6 +264,8 @@ struct dmub_srv_hw_funcs {
 
 	bool (*is_hw_init)(struct dmub_srv *dmub);
 
+	bool (*is_hw_powered_up)(struct dmub_srv *dmub);
+
 	bool (*is_phy_init)(struct dmub_srv *dmub);
 
 	bool (*is_auto_load_done)(struct dmub_srv *dmub);
@@ -486,6 +488,24 @@ enum dmub_status dmub_srv_cmd_queue(struct dmub_srv *dmub,
  */
 enum dmub_status dmub_srv_cmd_execute(struct dmub_srv *dmub);
 
+/**
+ * dmub_srv_wait_for_hw_pwr_up() - Waits for firmware hardware power up is completed
+ * @dmub: the dmub service
+ * @timeout_us: the maximum number of microseconds to wait
+ *
+ * Waits until firmware hardware is powered up. The maximum
+ * wait time is given in microseconds to prevent spinning forever.
+ *
+ * Return:
+ *   DMUB_STATUS_OK - success
+ *   DMUB_STATUS_TIMEOUT - timed out
+ *   DMUB_STATUS_INVALID - unspecified error
+ */
+enum dmub_status dmub_srv_wait_for_hw_pwr_up(struct dmub_srv *dmub,
+					     uint32_t timeout_us);
+
+bool dmub_srv_is_hw_pwr_up(struct dmub_srv *dmub);
+
 /**
  * dmub_srv_wait_for_auto_load() - Waits for firmware auto load to complete
  * @dmub: the dmub service
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index d103ec1eaa73..c741aaa7cd34 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -104,6 +104,11 @@ union dmub_psr_debug_flags {
 	uint32_t u32All;
 };
 
+struct dmub_feature_caps {
+	uint8_t psr;
+	uint8_t reserved[7];
+};
+
 #if defined(__cplusplus)
 }
 #endif
@@ -123,6 +128,17 @@ union dmub_psr_debug_flags {
 /* Offset from the end of the file to the dmub_fw_meta_info */
 #define DMUB_FW_META_OFFSET 0x24
 
+/**
+ *
+ * PSR control version legacy
+ */
+#define DMUB_CMD_PSR_CONTROL_VERSION_UNKNOWN 0x0
+/**
+ * PSR control version with multi edp support
+ */
+#define DMUB_CMD_PSR_CONTROL_VERSION_1 0x1
+
+
 /**
  * struct dmub_fw_meta_info - metadata associated with fw binary
  *
@@ -183,6 +199,11 @@ enum dmub_fw_boot_status_bit {
 	DMUB_FW_BOOT_STATUS_BIT_RESTORE_REQUIRED = (1 << 3),
 };
 
+#define DMUB_IPS1_ALLOW_MASK 0x00000001
+#define DMUB_IPS2_ALLOW_MASK 0x00000002
+#define DMUB_IPS1_COMMIT_MASK 0x00000004
+#define DMUB_IPS2_COMMIT_MASK 0x00000008
+
 /* Register bit definition for SCRATCH15 */
 union dmub_fw_boot_options {
 	struct {
@@ -272,6 +293,7 @@ enum dmub_gpint_command {
 	 * ARGS: Stream mask, 1 bit per active stream index.
 	 */
 	DMUB_GPINT__IDLE_OPT_NOTIFY_STREAM_MASK = 8,
+	DMUB_GPINT__PSR_RESIDENCY = 9,
 };
 
 //==============================================================================
@@ -297,11 +319,13 @@ enum dmub_cmd_type {
 	DMUB_CMD__REG_SEQ_BURST_WRITE = 3,
 	DMUB_CMD__REG_REG_WAIT = 4,
 	DMUB_CMD__PLAT_54186_WA = 5,
+	DMUB_CMD__QUERY_FEATURE_CAPS = 6,
 	DMUB_CMD__PSR = 64,
 	DMUB_CMD__ABM = 66,
 	DMUB_CMD__HW_LOCK = 69,
 	DMUB_CMD__DP_AUX_ACCESS = 70,
 	DMUB_CMD__OUTBOX1_ENABLE = 71,
+	DMUB_CMD__IDLE_OPT = 72,
 	DMUB_CMD__VBIOS = 128,
 };
 
@@ -316,7 +340,8 @@ enum dmub_out_cmd_type {
 struct dmub_cmd_header {
 	unsigned int type : 8;
 	unsigned int sub_type : 8;
-	unsigned int reserved0 : 8;
+	unsigned int ret_status : 1;
+	unsigned int reserved0 : 7;
 	unsigned int payload_bytes : 6;  /* up to 60 bytes */
 	unsigned int reserved1 : 2;
 };
@@ -549,6 +574,7 @@ enum dmub_cmd_psr_type {
 	DMUB_CMD__PSR_ENABLE			= 2,
 	DMUB_CMD__PSR_DISABLE			= 3,
 	DMUB_CMD__PSR_SET_LEVEL			= 4,
+	DMUB_CMD__PSR_FORCE_STATIC		= 5,
 };
 
 enum psr_version {
@@ -560,6 +586,9 @@ struct dmub_cmd_psr_copy_settings_data {
 	union dmub_psr_debug_flags debug;
 	uint16_t psr_level;
 	uint8_t dpp_inst;
+	/* opp_inst and mpcc_inst will not be used in dmub fw,
+	 * dmub fw will get active opp by reading odm registers.
+	 */
 	uint8_t mpcc_inst;
 	uint8_t opp_inst;
 	uint8_t otg_inst;
@@ -603,6 +632,10 @@ struct dmub_rb_cmd_psr_set_version {
 	struct dmub_cmd_psr_set_version_data psr_set_version_data;
 };
 
+struct dmub_rb_cmd_psr_force_static {
+	struct dmub_cmd_header header;
+};
+
 union dmub_hw_lock_flags {
 	struct {
 		uint8_t lock_pipe   : 1;
@@ -744,6 +777,45 @@ struct dmub_rb_cmd_abm_init_config {
 	struct dmub_cmd_abm_init_config_data abm_init_config_data;
 };
 
+/**
+ * enum dmub_cmd_idle_opt_type - Idle optimization command type.
+ */
+enum dmub_cmd_idle_opt_type {
+	/**
+	 * DCN hardware restore.
+	 */
+	DMUB_CMD__IDLE_OPT_DCN_RESTORE = 0,
+
+	/**
+	 * DCN hardware save.
+	 */
+	DMUB_CMD__IDLE_OPT_DCN_SAVE_INIT = 1,
+
+	/**
+	 * DCN hardware notify idle.
+	 */
+	DMUB_CMD__IDLE_OPT_DCN_NOTIFY_IDLE = 2
+};
+
+struct dmub_dcn_notify_idle_cntl_data {
+	uint8_t driver_idle;
+	uint8_t pad[1];
+};
+
+struct dmub_rb_cmd_idle_opt_dcn_notify_idle {
+	struct dmub_cmd_header header; /**< header */
+	struct dmub_dcn_notify_idle_cntl_data cntl_data;
+};
+
+struct dmub_cmd_query_feature_caps_data {
+	struct dmub_feature_caps feature_caps;
+};
+
+struct dmub_rb_cmd_query_feature_caps {
+	struct dmub_cmd_header header;
+	struct dmub_cmd_query_feature_caps_data query_feature_caps_data;
+};
+
 union dmub_rb_cmd {
 	struct dmub_rb_cmd_lock_hw lock_hw;
 	struct dmub_rb_cmd_read_modify_write read_modify_write;
@@ -760,6 +832,7 @@ union dmub_rb_cmd {
 	struct dmub_rb_cmd_psr_copy_settings psr_copy_settings;
 	struct dmub_rb_cmd_psr_enable psr_enable;
 	struct dmub_rb_cmd_psr_set_level psr_set_level;
+	struct dmub_rb_cmd_psr_force_static psr_force_static;
 	struct dmub_rb_cmd_PLAT_54186_wa PLAT_54186_wa;
 	struct dmub_rb_cmd_abm_set_pipe abm_set_pipe;
 	struct dmub_rb_cmd_abm_set_backlight abm_set_backlight;
@@ -769,6 +842,8 @@ union dmub_rb_cmd {
 	struct dmub_rb_cmd_abm_init_config abm_init_config;
 	struct dmub_rb_cmd_dp_aux_access dp_aux_access;
 	struct dmub_rb_cmd_outbox1_enable outbox1_enable;
+	struct dmub_rb_cmd_query_feature_caps query_feature_caps;
+	struct dmub_rb_cmd_idle_opt_dcn_notify_idle idle_opt_notify_idle;
 };
 
 union dmub_rb_out_cmd {
@@ -831,7 +906,7 @@ static inline bool dmub_rb_push_front(struct dmub_rb *rb,
 {
 	uint64_t volatile *dst = (uint64_t volatile *)(rb->base_address) + rb->wrpt / sizeof(uint64_t);
 	const uint64_t *src = (const uint64_t *)cmd;
-	int i;
+	uint8_t i;
 
 	if (dmub_rb_full(rb))
 		return false;
@@ -868,14 +943,14 @@ static inline bool dmub_rb_out_push_front(struct dmub_rb *rb,
 }
 
 static inline bool dmub_rb_front(struct dmub_rb *rb,
-				 union dmub_rb_cmd  *cmd)
+				 union dmub_rb_cmd **cmd)
 {
-	uint8_t *rd_ptr = (uint8_t *)rb->base_address + rb->rptr;
+	uint8_t *rb_cmd = (uint8_t *)(rb->base_address) + rb->rptr;
 
 	if (dmub_rb_empty(rb))
 		return false;
 
-	dmub_memcpy(cmd, rd_ptr, DMUB_RB_CMD_SIZE);
+	*cmd = (union dmub_rb_cmd *)rb_cmd;
 
 	return true;
 }
@@ -885,7 +960,7 @@ static inline bool dmub_rb_out_front(struct dmub_rb *rb,
 {
 	const uint64_t volatile *src = (const uint64_t volatile *)(rb->base_address) + rb->rptr / sizeof(uint64_t);
 	uint64_t *dst = (uint64_t *)cmd;
-	int i;
+	uint8_t i;
 
 	if (dmub_rb_empty(rb))
 		return false;
@@ -917,7 +992,7 @@ static inline void dmub_rb_flush_pending(const struct dmub_rb *rb)
 
 	while (rptr != wptr) {
 		uint64_t volatile *data = (uint64_t volatile *)rb->base_address + rptr / sizeof(uint64_t);
-		int i;
+		uint8_t i;
 
 		for (i = 0; i < DMUB_RB_CMD_SIZE / sizeof(uint64_t); i++)
 			*data++;
@@ -937,6 +1012,17 @@ static inline void dmub_rb_init(struct dmub_rb *rb,
 	rb->wrpt = init_params->write_ptr;
 }
 
+static inline void dmub_rb_get_return_data(struct dmub_rb *rb,
+					   union dmub_rb_cmd *cmd)
+{
+	// Copy rb entry back into command
+	uint8_t *rd_ptr = (rb->rptr == 0) ?
+		(uint8_t *)rb->base_address + rb->capacity - DMUB_RB_CMD_SIZE :
+		(uint8_t *)rb->base_address + rb->rptr - DMUB_RB_CMD_SIZE;
+
+	dmub_memcpy(cmd, rd_ptr, DMUB_RB_CMD_SIZE);
+}
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
index 08da423b24a1..b2f909d58a05 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
@@ -516,6 +516,33 @@ enum dmub_status dmub_srv_cmd_execute(struct dmub_srv *dmub)
 	return DMUB_STATUS_OK;
 }
 
+bool dmub_srv_is_hw_pwr_up(struct dmub_srv *dmub)
+{
+	if (!dmub->hw_funcs.is_hw_powered_up)
+		return true;
+
+	return dmub->hw_funcs.is_hw_powered_up(dmub) &&
+		dmub->hw_funcs.is_hw_init(dmub);
+}
+
+enum dmub_status dmub_srv_wait_for_hw_pwr_up(struct dmub_srv *dmub,
+					     uint32_t timeout_us)
+{
+	uint32_t i;
+
+	if (!dmub->hw_init)
+		return DMUB_STATUS_INVALID;
+
+	for (i = 0; i <= timeout_us; i += 100) {
+		if (dmub_srv_is_hw_pwr_up(dmub))
+			return DMUB_STATUS_OK;
+
+		udelay(100);
+	}
+
+	return DMUB_STATUS_TIMEOUT;
+}
+
 enum dmub_status dmub_srv_wait_for_auto_load(struct dmub_srv *dmub,
 					     uint32_t timeout_us)
 {
-- 
2.34.1

