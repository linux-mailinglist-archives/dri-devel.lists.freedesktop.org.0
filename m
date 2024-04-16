Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6E38A61E9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 05:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126CE10E292;
	Tue, 16 Apr 2024 03:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC2B10E292;
 Tue, 16 Apr 2024 03:59:02 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4VJVZS4G74z1hwZR;
 Tue, 16 Apr 2024 11:56:00 +0800 (CST)
Received: from dggpeml500025.china.huawei.com (unknown [7.185.36.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 568271A0188;
 Tue, 16 Apr 2024 11:58:57 +0800 (CST)
Received: from hulk-vt.huawei.com (10.67.174.21) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 11:58:56 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <qingqing.zhuo@amd.com>, <stylon.wang@amd.com>, <Josip.Pavic@amd.com>,
 <trix@redhat.com>, <cruise.hung@amd.com>, <Eric.Yang2@amd.com>,
 <mario.limonciello@amd.com>, <alvin.lee2@amd.com>, <jun.lei@amd.com>,
 <austin.zheng@amd.com>, <sunglee@amd.com>, <paul.hsieh@amd.com>,
 <hanghong.ma@amd.com>, <JinZe.Xu@amd.com>, <lewis.huang@amd.com>,
 <zhengzengkai@huawei.com>, <alex.hung@amd.com>, <syed.hassan@amd.com>,
 <gregkh@linuxfoundation.org>, <wayne.lin@amd.com>,
 <nicholas.kazlauskas@amd.com>, <chiahsuan.chung@amd.com>,
 <aurabindo.pillai@amd.com>, <wangzhu9@huawei.com>, <aric.cyr@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6.6] drm/amd/display: Wake DMCUB before executing GPINT
 commands
Date: Tue, 16 Apr 2024 03:52:40 +0000
Message-ID: <20240416035240.2450127-1-wangzhu9@huawei.com>
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
commit 2ef98c6d753a744e333b7e34b9cf687040fba57d
category: bugfix
bugzilla: https://gitee.com/src-openeuler/kernel/issues/I9BV4C
CVE: CVE-2023-52624

Reference: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2ef98c6d753a744e333b7e34b9cf687040fba57d

--------------------------------

[ Upstream commit e5ffd1263dd5b44929c676171802e7b6af483f21 ]

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

This commit comes from following commits:

 8774029f76b9 ("drm/amd/display: Add DCN35 CLK_MGR")
 65138eb72e1f ("drm/amd/display: Add DCN35 DMUB")
 dc01c4b79bfe ("drm/amd/display: Update driver and IPS interop")
 820c3870c491 ("drm/amd/display: Refactor DMCUB enter/exit idle interface")
 2ef98c6d753a ("drm/amd/display: Wake DMCUB before executing GPINT commands")

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  | 173 ++++++++++++++++--
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h  |  18 ++
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c |  19 +-
 .../gpu/drm/amd/display/dc/inc/hw/clk_mgr.h   |   1 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h   |  20 ++
 .../gpu/drm/amd/display/dmub/src/dmub_srv.c   |  33 +++-
 6 files changed, 232 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 4c5ef3ef8dbd..003b2d3d1750 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -32,6 +32,7 @@
 #include "../basics/conversion.h"
 #include "cursor_reg_cache.h"
 #include "resource.h"
+#include "clk_mgr.h"
 
 #define CTX dc_dmub_srv->ctx
 #define DC_LOGGER CTX->logger
@@ -207,17 +208,11 @@ bool dc_dmub_srv_optimized_init_done(struct dc_dmub_srv *dc_dmub_srv)
 bool dc_dmub_srv_notify_stream_mask(struct dc_dmub_srv *dc_dmub_srv,
 				    unsigned int stream_mask)
 {
-	struct dmub_srv *dmub;
-	const uint32_t timeout = 30;
-
 	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
 		return false;
 
-	dmub = dc_dmub_srv->dmub;
-
-	return dmub_srv_send_gpint_command(
-		       dmub, DMUB_GPINT__IDLE_OPT_NOTIFY_STREAM_MASK,
-		       stream_mask, timeout) == DMUB_STATUS_OK;
+	return dc_wake_and_execute_gpint(dc_dmub_srv->ctx, DMUB_GPINT__IDLE_OPT_NOTIFY_STREAM_MASK,
+					 stream_mask, NULL, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 bool dc_dmub_srv_is_restore_required(struct dc_dmub_srv *dc_dmub_srv)
@@ -1030,28 +1025,170 @@ bool dc_dmub_check_min_version(struct dmub_srv *srv)
 void dc_dmub_srv_enable_dpia_trace(const struct dc *dc)
 {
 	struct dc_dmub_srv *dc_dmub_srv = dc->ctx->dmub_srv;
-	struct dmub_srv *dmub;
-	enum dmub_status status;
-	static const uint32_t timeout_us = 30;
 
 	if (!dc_dmub_srv || !dc_dmub_srv->dmub) {
 		DC_LOG_ERROR("%s: invalid parameters.", __func__);
 		return;
 	}
 
-	dmub = dc_dmub_srv->dmub;
-
-	status = dmub_srv_send_gpint_command(dmub, DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD1, 0x0010, timeout_us);
-	if (status != DMUB_STATUS_OK) {
+	if (!dc_wake_and_execute_gpint(dc->ctx, DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD1,
+				       0x0010, NULL, DM_DMUB_WAIT_TYPE_WAIT)) {
 		DC_LOG_ERROR("timeout updating trace buffer mask word\n");
 		return;
 	}
 
-	status = dmub_srv_send_gpint_command(dmub, DMUB_GPINT__UPDATE_TRACE_BUFFER_MASK, 0x0000, timeout_us);
-	if (status != DMUB_STATUS_OK) {
+	if (!dc_wake_and_execute_gpint(dc->ctx, DMUB_GPINT__UPDATE_TRACE_BUFFER_MASK,
+				       0x0000, NULL, DM_DMUB_WAIT_TYPE_WAIT)) {
 		DC_LOG_ERROR("timeout updating trace buffer mask word\n");
 		return;
 	}
 
 	DC_LOG_DEBUG("Enabled DPIA trace\n");
-}
\ No newline at end of file
+}
+
+bool dc_dmub_srv_is_hw_pwr_up(struct dc_dmub_srv *dc_dmub_srv, bool wait)
+{
+	struct dc_context *dc_ctx = dc_dmub_srv->ctx;
+	enum dmub_status status;
+
+	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
+		return true;
+
+	if (dc_dmub_srv->ctx->dc->debug.dmcub_emulation)
+		return true;
+
+	if (wait) {
+		status = dmub_srv_wait_for_hw_pwr_up(dc_dmub_srv->dmub, 500000);
+		if (status != DMUB_STATUS_OK) {
+			DC_ERROR("Error querying DMUB hw power up status: error=%d\n", status);
+			return false;
+		}
+	} else
+		return dmub_srv_is_hw_pwr_up(dc_dmub_srv->dmub);
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
+	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+
+	if (allow_idle)
+		udelay(500);
+}
+
+static void dc_dmub_srv_exit_low_power_state(const struct dc *dc)
+{
+	if (dc->debug.dmcub_emulation)
+		return;
+
+	if (!dc->idle_optimizations_allowed)
+		return;
+
+	if (!dc->ctx->dmub_srv || !dc->ctx->dmub_srv->dmub)
+		return;
+
+	// Tell PMFW to exit low power state
+	if (dc->clk_mgr->funcs->exit_low_power_state)
+		dc->clk_mgr->funcs->exit_low_power_state(dc->clk_mgr);
+
+	// Wait for dmcub to load up
+	dc_dmub_srv_is_hw_pwr_up(dc->ctx->dmub_srv, true);
+
+	// Notify dmcub disallow idle
+	dc_dmub_srv_notify_idle(dc, false);
+
+	// Confirm dmu is powered up
+	dc_dmub_srv_is_hw_pwr_up(dc->ctx->dmub_srv, true);
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
+
+	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
+		return false;
+
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
+
+	if (result && reallow_idle)
+		dc_dmub_srv_apply_idle_power_optimizations(ctx->dc, true);
+
+	return result;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
index bb3fe162dd93..80c98b2d8094 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
@@ -50,6 +50,8 @@ struct dc_dmub_srv {
 
 	struct dc_context *ctx;
 	void *dm;
+
+	bool idle_allowed;
 };
 
 void dc_dmub_srv_wait_idle(struct dc_dmub_srv *dc_dmub_srv);
@@ -90,4 +92,20 @@ bool dc_dmub_check_min_version(struct dmub_srv *srv);
 
 void dc_dmub_srv_enable_dpia_trace(const struct dc *dc);
 
+bool dc_dmub_srv_is_hw_pwr_up(struct dc_dmub_srv *dc_dmub_srv, bool wait);
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
+			uint16_t param, uint32_t *response, enum dm_dmub_wait_type wait_type);
+
 #endif /* _DMUB_DC_SRV_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index 4704c9c85ee6..e0b4ef444fda 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -104,23 +104,18 @@ static enum dc_psr_state convert_psr_state(uint32_t raw_state)
  */
 static void dmub_psr_get_state(struct dmub_psr *dmub, enum dc_psr_state *state, uint8_t panel_inst)
 {
-	struct dmub_srv *srv = dmub->ctx->dmub_srv->dmub;
 	uint32_t raw_state = 0;
 	uint32_t retry_count = 0;
-	enum dmub_status status;
 
 	do {
 		// Send gpint command and wait for ack
-		status = dmub_srv_send_gpint_command(srv, DMUB_GPINT__GET_PSR_STATE, panel_inst, 30);
-
-		if (status == DMUB_STATUS_OK) {
-			// GPINT was executed, get response
-			dmub_srv_get_gpint_response(srv, &raw_state);
+		if (dc_wake_and_execute_gpint(dmub->ctx, DMUB_GPINT__GET_PSR_STATE, panel_inst,
+					      &raw_state, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY)) {
 			*state = convert_psr_state(raw_state);
-		} else
+		} else {
 			// Return invalid state when GPINT times out
 			*state = PSR_STATE_INVALID;
-
+		}
 	} while (++retry_count <= 1000 && *state == PSR_STATE_INVALID);
 
 	// Assert if max retry hit
@@ -444,13 +439,11 @@ static void dmub_psr_force_static(struct dmub_psr *dmub, uint8_t panel_inst)
  */
 static void dmub_psr_get_residency(struct dmub_psr *dmub, uint32_t *residency, uint8_t panel_inst)
 {
-	struct dmub_srv *srv = dmub->ctx->dmub_srv->dmub;
 	uint16_t param = (uint16_t)(panel_inst << 8);
 
 	/* Send gpint command and wait for ack */
-	dmub_srv_send_gpint_command(srv, DMUB_GPINT__PSR_RESIDENCY, param, 30);
-
-	dmub_srv_get_gpint_response(srv, residency);
+	dc_wake_and_execute_gpint(dmub->ctx, DMUB_GPINT__PSR_RESIDENCY, param, residency,
+				  DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY);
 }
 
 static const struct dmub_psr_funcs psr_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
index ecb7bcc39469..580fea4fde52 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
@@ -258,6 +258,7 @@ struct clk_mgr_funcs {
 	int (*get_dtb_ref_clk_frequency)(struct clk_mgr *clk_mgr);
 
 	void (*set_low_power_state)(struct clk_mgr *clk_mgr);
+	void (*exit_low_power_state)(struct clk_mgr *clk_mgr);
 
 	void (*init_clocks)(struct clk_mgr *clk_mgr);
 
diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
index d3c4a9a577ee..7f9b122e2ce1 100644
--- a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
@@ -376,6 +376,7 @@ struct dmub_srv_hw_funcs {
 	bool (*is_psrsu_supported)(struct dmub_srv *dmub);
 
 	bool (*is_hw_init)(struct dmub_srv *dmub);
+	bool (*is_hw_powered_up)(struct dmub_srv *dmub);
 
 	void (*enable_dmub_boot_options)(struct dmub_srv *dmub,
 				const struct dmub_srv_hw_params *params);
@@ -420,6 +421,7 @@ struct dmub_srv_create_params {
 	struct dmub_srv_base_funcs funcs;
 	struct dmub_srv_hw_funcs *hw_funcs;
 	void *user_ctx;
+	struct dc_context *dc_ctx;
 	enum dmub_asic asic;
 	uint32_t fw_version;
 	bool is_virtual;
@@ -652,6 +654,24 @@ enum dmub_status dmub_srv_cmd_queue(struct dmub_srv *dmub,
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
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
index 6c45e216c709..aca79c982511 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
@@ -751,10 +751,38 @@ enum dmub_status dmub_srv_cmd_execute(struct dmub_srv *dmub)
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
 	uint32_t i;
+	bool hw_on = true;
 
 	if (!dmub->hw_init)
 		return DMUB_STATUS_INVALID;
@@ -762,7 +790,10 @@ enum dmub_status dmub_srv_wait_for_auto_load(struct dmub_srv *dmub,
 	for (i = 0; i <= timeout_us; i += 100) {
 		union dmub_fw_boot_status status = dmub->hw_funcs.get_fw_status(dmub);
 
-		if (status.bits.dal_fw && status.bits.mailbox_rdy)
+		if (dmub->hw_funcs.is_hw_powered_up)
+			hw_on = dmub->hw_funcs.is_hw_powered_up(dmub);
+
+		if (status.bits.dal_fw && status.bits.mailbox_rdy && hw_on)
 			return DMUB_STATUS_OK;
 
 		udelay(100);
-- 
2.34.1

