Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5C3996BE7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 15:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D0510E6FA;
	Wed,  9 Oct 2024 13:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="agwaDnYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204710E6E1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 11:16:17 +0000 (UTC)
X-UUID: e3576716862f11ef88ecadb115cee93b-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8WnBIzf6vDW1wcLaoyU3ovzHi/IOQz093KVsB/jZhz4=; 
 b=agwaDnYJjiR3QmQI/0aEwzhYEUvNCYXoXEcEM349HfIih+wWM7dSrA6qE2aXZo6yyNKWMI+sYMwlYAAKNgNPiYvyXpwSrlgX48yuDYHr3GxDWHHt0YmHoMYdPgxVyXNk/4QrBxS/Hb41p81SKxhy/qPPF5lphXwIVrnkb7JYbzY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:3f4ffbbc-efcd-4ac6-8cbd-9c9ae400400d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:ff53fe64-444a-4b47-a99a-591ade3b04b2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH|NGT
X-CID-BAS: 2,OSH|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e3576716862f11ef88ecadb115cee93b-20241009
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <shu-hsiang.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 522432242; Wed, 09 Oct 2024 19:16:10 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 04:16:09 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 19:16:09 +0800
From: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian Konig <christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <yaya.chang@mediatek.com>, <teddy.chen@mediatek.com>,
 <hidenorik@chromium.org>, <yunkec@chromium.org>, <shun-yi.wang@mediatek.com>, 
 Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
Subject: [PATCH v1 08/10] media: platform: mediatek: add isp_7x state ctrl
Date: Wed, 9 Oct 2024 19:15:49 +0800
Message-ID: <20241009111551.27052-9-Shu-hsiang.Yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 09 Oct 2024 13:31:32 +0000
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

Introduces state management and debugging mechanisms for the MediaTek
ISP7.x camsys platform. State management establishes control over ISP
operations and events, defining distinct states for request handling,
sensor control, and frame synchronization, ensuring event processing.
The debugging mechanism ensures stable operation and timely data
collection during anomalies.

Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
---
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c | 1797 +++++++++++++++++
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h |  140 ++
 .../isp/isp_7x/camsys/mtk_cam-debug.c         | 1271 ++++++++++++
 .../isp/isp_7x/camsys/mtk_cam-debug.h         |  273 +++
 4 files changed, 3481 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.h

diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c
new file mode 100644
index 000000000000..82173adb50f8
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c
@@ -0,0 +1,1797 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#include <linux/list.h>
+#include <linux/math64.h>
+#include <linux/of.h>
+#include <linux/videodev2.h>
+
+#include <media/v4l2-event.h>
+#include <media/v4l2-subdev.h>
+
+#include "mtk_cam.h"
+#include "mtk_cam-feature.h"
+#include "mtk_cam-ctrl.h"
+#include "mtk_cam-debug.h"
+#include "mtk_cam-pool.h"
+#include "mtk_cam-raw.h"
+
+#include "mtk_cam-regs-mt8188.h"
+
+#include "mtk_camera-v4l2-controls.h"
+
+#define SENSOR_SET_DEADLINE_MS  18
+#define SENSOR_SET_RESERVED_MS  7
+#define SENSOR_SET_DEADLINE_MS_60FPS  6
+#define SENSOR_SET_RESERVED_MS_60FPS  6
+#define STATE_NUM_AT_SOF 3
+#define INITIAL_DROP_FRAME_CNT 1
+
+enum MTK_CAMSYS_STATE_RESULT {
+	STATE_RESULT_TRIGGER_CQ = 0,
+	STATE_RESULT_PASS_CQ_INIT,
+	STATE_RESULT_PASS_CQ_SW_DELAY,
+	STATE_RESULT_PASS_CQ_SCQ_DELAY,
+	STATE_RESULT_PASS_CQ_HW_DELAY,
+};
+
+void state_transition(struct mtk_camsys_ctrl_state *state_entry,
+		      enum MTK_CAMSYS_STATE_IDX from,
+		      enum MTK_CAMSYS_STATE_IDX to)
+{
+	if (state_entry->estate == from)
+		state_entry->estate = to;
+}
+
+static void mtk_cam_event_eos(struct mtk_raw_pipeline *pipeline)
+{
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_EOS,
+	};
+	v4l2_event_queue(pipeline->subdev.devnode, &event);
+}
+
+static void mtk_cam_event_frame_sync(struct mtk_raw_pipeline *pipeline,
+				     unsigned int frame_seq_no)
+{
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+		.u.frame_sync.frame_sequence = frame_seq_no,
+	};
+	v4l2_event_queue(pipeline->subdev.devnode, &event);
+}
+
+static void mtk_cam_event_request_drained(struct mtk_raw_pipeline *pipeline)
+{
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_REQUEST_DRAINED,
+	};
+	v4l2_event_queue(pipeline->subdev.devnode, &event);
+}
+
+static bool mtk_cam_request_drained(struct mtk_camsys_sensor_ctrl *sensor_ctrl)
+{
+	struct mtk_cam_ctx *ctx = sensor_ctrl->ctx;
+	int sensor_seq_no_next =
+		atomic_read(&sensor_ctrl->sensor_request_seq_no) + 1;
+	int res = 0;
+
+	if (sensor_seq_no_next <= atomic_read(&ctx->enqueued_frame_seq_no))
+		res = 1;
+	/* Send V4L2_EVENT_REQUEST_DRAINED event */
+	if (res == 0) {
+		mtk_cam_event_request_drained(ctx->pipe);
+		dev_dbg(ctx->cam->dev, "request_drained:(%d)\n",
+			sensor_seq_no_next);
+	}
+	return (res == 0);
+}
+
+static bool mtk_cam_req_frame_sync_start(struct mtk_cam_request *req)
+{
+	/* All ctx with sensor is in ready state */
+	struct mtk_cam_device *cam =
+		container_of(req->req.mdev, struct mtk_cam_device, media_dev);
+	struct mtk_cam_ctx *ctx;
+	struct mtk_cam_ctx *sync_ctx[MTKCAM_SUBDEV_MAX];
+	int i;
+	u32 ctx_cnt = 0, synced_cnt = 0;
+	bool ret = false;
+
+	/* pick out the used ctxs */
+	for (i = 0; i < cam->max_stream_num; i++) {
+		if (!(1 << i & req->ctx_used))
+			continue;
+
+		sync_ctx[ctx_cnt] = &cam->ctxs[i];
+		ctx_cnt++;
+	}
+
+	mutex_lock(&req->fs.op_lock);
+	if (ctx_cnt > 1) {
+		/* multi sensor case */
+		req->fs.on_cnt++;
+		/* not first time */
+		if (req->fs.on_cnt != 1)
+			goto EXIT;
+
+		for (i = 0; i < ctx_cnt; i++) {
+			ctx = sync_ctx[i];
+			spin_lock(&ctx->streaming_lock);
+			if (!ctx->streaming) {
+				spin_unlock(&ctx->streaming_lock);
+				dev_info(cam->dev,
+					 "%s: ctx(%d): is streamed off\n",
+					 __func__, ctx->stream_id);
+				continue;
+			}
+			spin_unlock(&ctx->streaming_lock);
+
+			/* update sensor frame sync */
+			if (ctx->synced)
+				synced_cnt++;
+		}
+
+		/*
+		 * the prepared sensor is no enough, skip
+		 * frame sync set failed or stream off
+		 */
+		if (synced_cnt < 2) {
+			mtk_cam_fs_reset(&req->fs);
+			dev_info(cam->dev, "%s:%s: sensor is not ready\n",
+				 __func__, req->req.debug_str);
+			goto EXIT;
+		}
+
+		dev_dbg(cam->dev, "%s:%s:fs_sync_frame(1): ctxs: 0x%x\n",
+			__func__, req->req.debug_str, req->ctx_used);
+
+		ret = true;
+		goto EXIT;
+	}
+	/* single sensor case: unsupported sensor hardware sync */
+
+EXIT:
+	dev_dbg(cam->dev, "%s:%s:target/on/off(%d/%d/%d)\n", __func__,
+		req->req.debug_str, req->fs.target, req->fs.on_cnt,
+		req->fs.off_cnt);
+	mutex_unlock(&req->fs.op_lock);
+	return ret;
+}
+
+static bool mtk_cam_req_frame_sync_end(struct mtk_cam_request *req)
+{
+	/* All ctx with sensor is not in ready state */
+	struct mtk_cam_device *cam =
+		container_of(req->req.mdev, struct mtk_cam_device, media_dev);
+	bool ret = false;
+
+	mutex_lock(&req->fs.op_lock);
+	if (req->fs.target && req->fs.on_cnt) {
+		/* check fs on */
+		req->fs.off_cnt++;
+		if (req->fs.on_cnt != req->fs.target ||
+		    req->fs.off_cnt != req->fs.target) {
+			/* not the last */
+			goto EXIT;
+		}
+		dev_dbg(cam->dev,
+			"%s:%s:fs_sync_frame(0): ctxs: 0x%x\n",
+			__func__, req->req.debug_str, req->ctx_used);
+		ret = true;
+		goto EXIT;
+	}
+EXIT:
+	dev_dbg(cam->dev, "%s:%s:target/on/off(%d/%d/%d)\n", __func__,
+		req->req.debug_str, req->fs.target, req->fs.on_cnt,
+		req->fs.off_cnt);
+	mutex_unlock(&req->fs.op_lock);
+	return ret;
+}
+
+static void mtk_cam_stream_on(struct mtk_raw_device *raw_dev,
+			      struct mtk_cam_ctx *ctx)
+{
+	spin_lock(&ctx->streaming_lock);
+	if (ctx->streaming)
+		mtk_cam_raw_stream_on(raw_dev, 1);
+
+	spin_unlock(&ctx->streaming_lock);
+}
+
+static void mtk_cam_m2m_sensor_skip(struct mtk_cam_request_stream_data *data)
+{
+	struct mtk_cam_request *req = mtk_cam_s_data_get_req(data);
+	struct mtk_cam_ctx *ctx = mtk_cam_s_data_get_ctx(data);
+
+	dev_dbg(ctx->cam->dev,
+		"%s:%s:ctx(%d):sensor ctrl skip frame_seq_no %d\n",
+		__func__, req->req.debug_str,
+		ctx->stream_id, data->frame_seq_no);
+	state_transition(&data->state, E_STATE_READY, E_STATE_SENSOR);
+	mtk_cam_complete_sensor_hdl(data);
+}
+
+void mtk_cam_set_sensor_full(struct mtk_cam_request_stream_data *s_data,
+			     struct mtk_camsys_sensor_ctrl *sensor_ctrl)
+{
+	struct mtk_cam_device *cam;
+	struct mtk_cam_ctx *ctx;
+	struct mtk_cam_request *req;
+	struct mtk_raw_device *raw_dev;
+	unsigned int time_after_sof = 0;
+
+	/* EnQ this request's state element to state_list (STATE:READY) */
+	spin_lock(&sensor_ctrl->camsys_state_lock);
+	list_add_tail(&s_data->state.state_element,
+		      &sensor_ctrl->camsys_state_list);
+	atomic_set(&sensor_ctrl->sensor_request_seq_no, s_data->frame_seq_no);
+	spin_unlock(&sensor_ctrl->camsys_state_lock);
+
+	if (mtk_cam_is_m2m(sensor_ctrl->ctx)) {
+		mtk_cam_m2m_sensor_skip(s_data);
+		return;
+	}
+
+	/* sensor_worker task */
+	ctx = mtk_cam_s_data_get_ctx(s_data);
+	cam = ctx->cam;
+	req = mtk_cam_s_data_get_req(s_data);
+
+	dev_dbg(cam->dev, "%s:%s:ctx(%d) req(%d):sensor try set start\n",
+		__func__, req->req.debug_str, ctx->stream_id, s_data->frame_seq_no);
+
+	if (ctx->used_raw_num && mtk_cam_req_frame_sync_start(req))
+		dev_dbg(cam->dev,
+			"%s:%s:ctx(%d): sensor ctrl with frame sync - start\n",
+			__func__, req->req.debug_str, ctx->stream_id);
+
+	/*
+	 * request setup
+	 * 1st frame sensor setting is treated like normal frame
+	 * and is set with other settings like max fps.
+	 * 2nd is special, only exposure is set.
+	 */
+	if (!mtk_cam_is_m2m(ctx)) {
+		if (s_data->flags & MTK_CAM_REQ_S_DATA_FLAG_SENSOR_HDL_EN) {
+			v4l2_ctrl_request_setup(&req->req,
+						s_data->sensor->ctrl_handler);
+			time_after_sof =
+				div_u64(ktime_get_boottime_ns(), 1000000) -
+					ctx->sensor_ctrl.sof_time;
+			dev_dbg(cam->dev,
+				"[SOF+%dms] Sensor request:%d[ctx:%d] setup\n",
+				time_after_sof, s_data->frame_seq_no,
+				ctx->stream_id);
+		}
+	}
+
+	state_transition(&s_data->state, E_STATE_READY, E_STATE_SENSOR);
+
+	if (ctx->used_raw_num && mtk_cam_req_frame_sync_end(req))
+		dev_dbg(cam->dev,
+			"%s:ctx(%d): sensor ctrl with frame sync - stop\n",
+			__func__, ctx->stream_id);
+
+	if (ctx->used_raw_num) {
+		raw_dev = get_main_raw_dev(ctx->cam, ctx->pipe);
+		if (raw_dev && atomic_read(&raw_dev->vf_en) == 0 &&
+		    ctx->sensor_ctrl.initial_cq_done == 1 &&
+		    s_data->frame_seq_no == 1)
+			mtk_cam_stream_on(raw_dev, ctx);
+	}
+
+	dev_dbg(cam->dev, "%s:%s:ctx(%d)req(%d):sensor done at SOF+%dms\n",
+		__func__, req->req.debug_str, ctx->stream_id,
+		s_data->frame_seq_no, time_after_sof);
+
+	mtk_cam_complete_sensor_hdl(s_data);
+}
+
+static void mtk_cam_try_set_sensor(struct mtk_cam_ctx *ctx)
+{
+	struct mtk_camsys_sensor_ctrl *sensor_ctrl = &ctx->sensor_ctrl;
+	struct mtk_cam_device *cam = ctx->cam;
+	struct mtk_cam_request_stream_data *req_stream_data;
+	struct mtk_camsys_ctrl_state *state_entry;
+	struct mtk_cam_request *req;
+	int sensor_seq_no_next =
+		atomic_read(&sensor_ctrl->sensor_request_seq_no) + 1;
+	int time_after_sof = div_u64(ktime_get_boottime_ns(), 1000000) -
+			   ctx->sensor_ctrl.sof_time;
+
+	/* for 1st unsync, sensor setting will be set at enque thread */
+	if (ctx->used_raw_num) {
+		if (ctx->pipe->feature_active == 0 && sensor_seq_no_next <= 2)
+			return;
+	} else {
+		if (sensor_seq_no_next <= 2)
+			return;
+	}
+
+	spin_lock(&sensor_ctrl->camsys_state_lock);
+	/* Check if previous state was without cq done */
+	list_for_each_entry(state_entry, &sensor_ctrl->camsys_state_list,
+			    state_element) {
+		req_stream_data = mtk_cam_ctrl_state_to_req_s_data(state_entry);
+		if (req_stream_data->frame_seq_no ==
+			atomic_read(&sensor_ctrl->sensor_request_seq_no)) {
+			if (state_entry->estate == E_STATE_CQ &&
+			    req_stream_data->frame_seq_no > INITIAL_DROP_FRAME_CNT) {
+				state_entry->estate = E_STATE_CQ_SCQ_DELAY;
+				spin_unlock(&sensor_ctrl->camsys_state_lock);
+
+				dev_dbg(ctx->cam->dev,
+					"[%s] SCQ DELAY STATE at SOF+%dms\n",
+					__func__, time_after_sof);
+				return;
+			} else if (state_entry->estate == E_STATE_CAMMUX_OUTER_CFG) {
+				state_entry->estate =
+					E_STATE_CAMMUX_OUTER_CFG_DELAY;
+				spin_unlock(&sensor_ctrl->camsys_state_lock);
+
+				dev_dbg(ctx->cam->dev,
+					"[%s] CAMMUX OUTTER CFG DELAY STATE\n",
+					__func__);
+				return;
+			} else if (state_entry->estate <= E_STATE_SENSOR) {
+				spin_unlock(&sensor_ctrl->camsys_state_lock);
+
+				dev_dbg(ctx->cam->dev,
+					"[%s] wrong state:%d (sensor workqueue delay)\n",
+					__func__, state_entry->estate);
+				return;
+			}
+		} else if (req_stream_data->frame_seq_no ==
+			atomic_read(&sensor_ctrl->sensor_request_seq_no) - 1) {
+			if (state_entry->estate < E_STATE_INNER) {
+				spin_unlock(&sensor_ctrl->camsys_state_lock);
+
+				dev_dbg(ctx->cam->dev,
+					"[%s] req:%d isn't arrive inner at SOF+%dms\n",
+					__func__, req_stream_data->frame_seq_no,
+					time_after_sof);
+				return;
+			}
+		}
+	}
+	spin_unlock(&sensor_ctrl->camsys_state_lock);
+
+	/** Frame sync:
+	 * make sure the all ctxs of previous request are triggered
+	 */
+	req_stream_data = mtk_cam_get_req_s_data(ctx, ctx->stream_id,
+						 sensor_seq_no_next - 1);
+	if (req_stream_data) {
+		req = mtk_cam_s_data_get_req(req_stream_data);
+		/* fs complete: fs.target <= off and on == off */
+		if (!(req->fs.target <= req->fs.off_cnt &&
+		      req->fs.off_cnt == req->fs.on_cnt)) {
+			dev_info(ctx->cam->dev,
+				 "[TimerIRQ] ctx:%d the fs of req(%s/%d) is not completed, target/on/off(%d/%d/%d)\n",
+				 ctx->stream_id, req->req.debug_str,
+				 sensor_seq_no_next - 1, req->fs.target,
+				 req->fs.on_cnt, req->fs.off_cnt);
+			return;
+		}
+	}
+
+	req_stream_data =
+		mtk_cam_get_req_s_data(ctx, ctx->stream_id, sensor_seq_no_next);
+	if (req_stream_data) {
+		req = mtk_cam_s_data_get_req(req_stream_data);
+		mtk_cam_set_sensor_full(req_stream_data, &ctx->sensor_ctrl);
+
+		dev_dbg(cam->dev,
+			"%s:[TimerIRQ [SOF+%dms]:] ctx:%d, sensor_req_seq_no:%d\n",
+			__func__, time_after_sof, ctx->stream_id,
+			sensor_seq_no_next);
+	} else {
+		dev_dbg(cam->dev,
+			"%s:[TimerIRQ [SOF+%dms]] ctx:%d, empty req_queue, sensor_req_seq_no:%d\n",
+			__func__, time_after_sof, ctx->stream_id,
+			atomic_read(&sensor_ctrl->sensor_request_seq_no));
+	}
+}
+
+static void mtk_cam_sensor_worker_in_sensorctrl(struct kthread_work *work)
+{
+	struct mtk_camsys_sensor_ctrl *sensor_ctrl =
+			container_of(work, struct mtk_camsys_sensor_ctrl, work);
+	struct mtk_cam_ctx *ctx;
+
+	ctx = sensor_ctrl->ctx;
+	mtk_cam_try_set_sensor(ctx);
+}
+
+bool mtk_cam_submit_kwork_in_sensorctrl(struct kthread_worker *worker,
+					struct mtk_camsys_sensor_ctrl *sensor_ctrl)
+{
+	if (!worker) {
+		pr_info("%s: not queue work since kthread_worker is null\n",
+			__func__);
+
+		return false;
+	}
+
+	return kthread_queue_work(worker, &sensor_ctrl->work);
+}
+
+static enum hrtimer_restart sensor_set_handler(struct hrtimer *t)
+{
+	struct mtk_camsys_sensor_ctrl *sensor_ctrl =
+		container_of(t, struct mtk_camsys_sensor_ctrl,
+			     sensor_deadline_timer);
+
+	mtk_cam_submit_kwork_in_sensorctrl(sensor_ctrl->sensorsetting_wq,
+					   sensor_ctrl);
+
+	return HRTIMER_NORESTART;
+}
+
+static enum hrtimer_restart sensor_deadline_timer_handler(struct hrtimer *t)
+{
+	unsigned int enq_no, sen_no;
+	struct mtk_camsys_sensor_ctrl *sensor_ctrl =
+		container_of(t, struct mtk_camsys_sensor_ctrl,
+			     sensor_deadline_timer);
+	struct mtk_cam_ctx *ctx = sensor_ctrl->ctx;
+	struct mtk_cam_device *cam = ctx->cam;
+	ktime_t m_kt;
+	int time_after_sof = div_u64(ktime_get_boottime_ns(), 1000000) -
+			   sensor_ctrl->sof_time;
+	bool drained_res = false;
+
+	sensor_ctrl->sensor_deadline_timer.function = sensor_set_handler;
+
+	m_kt = ktime_set(0, sensor_ctrl->timer_req_sensor * 1000000);
+
+	if (ctx->used_raw_num) {
+		/* handle V4L2_EVENT_REQUEST_DRAINED event */
+		drained_res = mtk_cam_request_drained(sensor_ctrl);
+	}
+	dev_dbg(cam->dev,
+		"[TimerIRQ [SOF+%dms]] ctx:%d, sensor_req_seq_no:%d\n",
+		time_after_sof, ctx->stream_id,
+		atomic_read(&sensor_ctrl->sensor_request_seq_no));
+	if (drained_res == 0) {
+		sen_no = atomic_read(&sensor_ctrl->sensor_enq_seq_no);
+		enq_no = atomic_read(&ctx->enqueued_frame_seq_no);
+		if (enq_no == sen_no) {
+			mtk_cam_submit_kwork_in_sensorctrl(sensor_ctrl->sensorsetting_wq,
+							   sensor_ctrl);
+			return HRTIMER_NORESTART;
+		}
+		dev_dbg(cam->dev,
+			"[TimerIRQ [SOF+%dms]] ctx:%d, enq:%d/sensor_enq:%d\n",
+			time_after_sof, ctx->stream_id, enq_no, sen_no);
+	}
+	/*using enque timing for sensor setting*/
+	if (ctx->used_raw_num) {
+		if (ctx->pipe->feature_active == 0) {
+			int drained_seq_no =
+				atomic_read(&sensor_ctrl->sensor_request_seq_no) + 1;
+			atomic_set(&sensor_ctrl->last_drained_seq_no, drained_seq_no);
+			return HRTIMER_NORESTART;
+		}
+	}
+	hrtimer_forward_now(&sensor_ctrl->sensor_deadline_timer, m_kt);
+
+	return HRTIMER_RESTART;
+}
+
+static void mtk_cam_sof_timer_setup(struct mtk_cam_ctx *ctx)
+{
+	struct mtk_camsys_sensor_ctrl *sensor_ctrl = &ctx->sensor_ctrl;
+	ktime_t m_kt;
+	int after_sof_ms = div_u64(ktime_get_boottime_ns(), 1000000) -
+			sensor_ctrl->sof_time;
+
+	sensor_ctrl->sensor_deadline_timer.function =
+		sensor_deadline_timer_handler;
+	sensor_ctrl->ctx = ctx;
+	if (after_sof_ms < 0)
+		after_sof_ms = 0;
+	else if (after_sof_ms > sensor_ctrl->timer_req_event)
+		after_sof_ms = sensor_ctrl->timer_req_event - 1;
+	m_kt = ktime_set(0, sensor_ctrl->timer_req_event * 1000000 -
+			 after_sof_ms * 1000000);
+	hrtimer_start(&sensor_ctrl->sensor_deadline_timer, m_kt, HRTIMER_MODE_REL);
+}
+
+static void
+mtk_cam_set_timestamp(struct mtk_cam_request_stream_data *stream_data,
+		      u64 time_boot,
+		      u64 time_mono)
+{
+	stream_data->timestamp = time_boot;
+	stream_data->timestamp_mono = time_mono;
+}
+
+static int
+mtk_camsys_raw_state_handle(struct mtk_raw_device *raw_dev,
+			    struct mtk_camsys_sensor_ctrl *sensor_ctrl,
+			    struct mtk_camsys_ctrl_state **current_state,
+			    struct mtk_camsys_irq_info *irq_info)
+{
+	struct mtk_cam_ctx *ctx = sensor_ctrl->ctx;
+	struct mtk_camsys_ctrl_state *state_temp, *state_outer = NULL;
+	struct mtk_camsys_ctrl_state *state_inner = NULL;
+	struct mtk_camsys_ctrl_state *state_rec[STATE_NUM_AT_SOF];
+	struct mtk_cam_request_stream_data *req_stream_data;
+	int frame_idx_inner = irq_info->frame_idx_inner;
+	int stateidx;
+	int que_cnt = 0;
+	int write_cnt;
+	u64 time_boot = ktime_get_boottime_ns();
+	u64 time_mono = ktime_get_ns();
+	int working_req_found = 0;
+
+	/* List state-queue status*/
+	spin_lock(&sensor_ctrl->camsys_state_lock);
+	list_for_each_entry(state_temp, &sensor_ctrl->camsys_state_list,
+			    state_element) {
+		req_stream_data = mtk_cam_ctrl_state_to_req_s_data(state_temp);
+		stateidx = atomic_read(&sensor_ctrl->sensor_request_seq_no) -
+			   req_stream_data->frame_seq_no;
+		if (stateidx < STATE_NUM_AT_SOF && stateidx > -1) {
+			state_rec[stateidx] = state_temp;
+			if (stateidx == 0)
+				working_req_found = 1;
+
+			/* Find outer state element */
+			if (state_temp->estate == E_STATE_OUTER ||
+			    state_temp->estate == E_STATE_CAMMUX_OUTER ||
+			    state_temp->estate == E_STATE_OUTER_HW_DELAY) {
+				state_outer = state_temp;
+				mtk_cam_set_timestamp(req_stream_data,
+						      time_boot, time_mono);
+			}
+
+			/* Find inner state element request */
+			if (state_temp->estate == E_STATE_INNER ||
+			    state_temp->estate == E_STATE_INNER_HW_DELAY)
+				state_inner = state_temp;
+
+			dev_dbg(raw_dev->dev,
+				"[SOF] STATE_CHECK [N-%d] Req:%d / State:%d\n",
+				stateidx, req_stream_data->frame_seq_no,
+				state_rec[stateidx]->estate);
+		}
+		/* counter for state queue*/
+		que_cnt++;
+	}
+	spin_unlock(&sensor_ctrl->camsys_state_lock);
+
+	/* HW imcomplete case */
+	if (state_inner) {
+		req_stream_data = mtk_cam_ctrl_state_to_req_s_data(state_inner);
+		write_cnt = (atomic_read(&sensor_ctrl->isp_request_seq_no) / 256)
+					* 256 + irq_info->write_cnt;
+
+		if (frame_idx_inner > atomic_read(&sensor_ctrl->isp_request_seq_no) ||
+		    atomic_read(&req_stream_data->frame_done_work.is_queued) == 1) {
+			dev_dbg_ratelimited(raw_dev->dev,
+					    "[SOF] frame done work too late frames. req(%d),ts(%llu)\n",
+					    req_stream_data->frame_seq_no,
+					    irq_info->ts_ns);
+		} else if (write_cnt >= req_stream_data->frame_seq_no) {
+			dev_info_ratelimited(raw_dev->dev,
+					     "[SOF] frame done reading lost %d frames. req(%d),ts(%llu)\n",
+					     write_cnt - req_stream_data->frame_seq_no + 1,
+					     req_stream_data->frame_seq_no,
+					     irq_info->ts_ns);
+			mtk_cam_set_timestamp(req_stream_data,
+					      time_boot - 1000, time_mono - 1000);
+			mtk_camsys_frame_done(ctx, write_cnt, ctx->stream_id);
+		} else if ((write_cnt >= req_stream_data->frame_seq_no - 1) &&
+			   irq_info->fbc_cnt == 0) {
+			dev_info_ratelimited(raw_dev->dev,
+					     "[SOF] frame done reading lost frames. req(%d),ts(%llu)\n",
+					     req_stream_data->frame_seq_no, irq_info->ts_ns);
+			mtk_cam_set_timestamp(req_stream_data,
+					      time_boot - 1000, time_mono - 1000);
+			mtk_camsys_frame_done(ctx, write_cnt + 1, ctx->stream_id);
+		} else {
+			state_transition(state_inner,
+					 E_STATE_INNER, E_STATE_INNER_HW_DELAY);
+			if (state_outer) {
+				state_transition(state_outer,
+						 E_STATE_OUTER,
+						 E_STATE_OUTER_HW_DELAY);
+				state_transition(state_outer,
+						 E_STATE_CAMMUX_OUTER,
+						 E_STATE_OUTER_HW_DELAY);
+			}
+			dev_info_ratelimited(raw_dev->dev,
+					     "[SOF] HW_IMCOMPLETE state cnt(%d,%d),req(%d),ts(%llu)\n",
+					     write_cnt, irq_info->write_cnt,
+					     req_stream_data->frame_seq_no,
+					     irq_info->ts_ns);
+			return STATE_RESULT_PASS_CQ_HW_DELAY;
+		}
+	}
+
+	/* Transit outer state to inner state */
+	if (state_outer && sensor_ctrl->sensorsetting_wq) {
+		req_stream_data = mtk_cam_ctrl_state_to_req_s_data(state_outer);
+		if (atomic_read(&sensor_ctrl->initial_drop_frame_cnt) == 0 &&
+		    req_stream_data->frame_seq_no > frame_idx_inner) {
+			dev_info(raw_dev->dev,
+				 "[SOF-noDBLOAD] HW delay outer_no:%d, inner_idx:%d <= processing_idx:%d,ts:%llu\n",
+				 req_stream_data->frame_seq_no, frame_idx_inner,
+				 atomic_read(&sensor_ctrl->isp_request_seq_no),
+				 irq_info->ts_ns);
+			return STATE_RESULT_PASS_CQ_HW_DELAY;
+		}
+
+		if (atomic_read(&sensor_ctrl->initial_drop_frame_cnt) == 0 &&
+		    req_stream_data->frame_seq_no == frame_idx_inner) {
+			if (frame_idx_inner >
+			    atomic_read(&sensor_ctrl->isp_request_seq_no)) {
+				state_transition(state_outer,
+						 E_STATE_OUTER_HW_DELAY,
+						 E_STATE_INNER_HW_DELAY);
+				state_transition(state_outer,
+						 E_STATE_OUTER,
+						 E_STATE_INNER);
+				state_transition(state_outer,
+						 E_STATE_CAMMUX_OUTER,
+						 E_STATE_INNER);
+				atomic_set(&sensor_ctrl->isp_request_seq_no, frame_idx_inner);
+				dev_dbg(raw_dev->dev,
+					"[SOF-DBLOAD] frame_seq_no:%d, OUTER->INNER state:%d,ts:%llu\n",
+					req_stream_data->frame_seq_no,
+					state_outer->estate, irq_info->ts_ns);
+			}
+		}
+	}
+
+	/* Trigger high resolution timer to try sensor setting */
+	sensor_ctrl->sof_time = div_u64(irq_info->ts_ns, 1000000);
+	mtk_cam_sof_timer_setup(ctx);
+
+	if (que_cnt > 1 && state_rec[1]) {
+		state_temp = state_rec[1];
+		req_stream_data = mtk_cam_ctrl_state_to_req_s_data(state_temp);
+		if (req_stream_data->frame_seq_no == 1)
+			state_transition(state_temp,
+					 E_STATE_SENSOR, E_STATE_INNER);
+	}
+
+	if (que_cnt > 0) {
+		if (working_req_found && state_rec[0]) {
+			if (state_rec[0]->estate == E_STATE_READY) {
+				dev_info(raw_dev->dev, "[SOF] sensor delay ts:%llu\n",
+					 irq_info->ts_ns);
+				req_stream_data =
+					mtk_cam_ctrl_state_to_req_s_data(state_rec[0]);
+				req_stream_data->flags |=
+					MTK_CAM_REQ_S_DATA_FLAG_SENSOR_HDL_DELAYED;
+			}
+
+			if (state_rec[0]->estate == E_STATE_SENINF)
+				dev_info(raw_dev->dev, "[SOF] sensor switch delay\n");
+
+			/* CQ triggering judgment*/
+			if (state_rec[0]->estate == E_STATE_SENSOR) {
+				*current_state = state_rec[0];
+				return STATE_RESULT_TRIGGER_CQ;
+			}
+			/* last SCQ triggering delay judgment*/
+			if (state_rec[0]->estate == E_STATE_CQ_SCQ_DELAY) {
+				state_transition(state_rec[0],
+						 E_STATE_CQ_SCQ_DELAY,
+						 E_STATE_OUTER);
+				dev_info(raw_dev->dev, "[SOF] SCQ_DELAY state:%d ts:%llu\n",
+					 state_rec[0]->estate, irq_info->ts_ns);
+				return STATE_RESULT_PASS_CQ_SCQ_DELAY;
+			}
+		} else {
+			dev_dbg(raw_dev->dev, "[SOF] working request not found\n");
+		}
+	}
+	return STATE_RESULT_PASS_CQ_SW_DELAY;
+}
+
+static void mtk_cam_handle_m2m_frame_done(struct mtk_cam_ctx *ctx,
+					  unsigned int dequeued_frame_seq_no,
+					  unsigned int pipe_id)
+{
+	struct mtk_raw_device *raw_dev;
+	struct mtk_camsys_ctrl_state *state_temp, *state_inner = NULL;
+	struct mtk_camsys_ctrl_state *state_sensor = NULL;
+	struct mtk_cam_request *req;
+	struct mtk_cam_request_stream_data *req_stream_data;
+	struct mtk_cam_working_buf_entry *buf_entry;
+	struct mtk_camsys_sensor_ctrl *sensor_ctrl = &ctx->sensor_ctrl;
+	dma_addr_t base_addr;
+	u32 que_cnt = 0;
+	u64 time_boot = ktime_get_boottime_ns();
+	u64 time_mono = ktime_get_ns();
+	u32 dequeue_cnt;
+
+	spin_lock(&ctx->streaming_lock);
+	if (!ctx->streaming) {
+		dev_dbg(ctx->cam->dev,
+			"%s: skip frame done for stream off ctx:%d\n",
+			__func__, ctx->stream_id);
+		spin_unlock(&ctx->streaming_lock);
+		return;
+	}
+	spin_unlock(&ctx->streaming_lock);
+
+	raw_dev = get_main_raw_dev(ctx->cam, ctx->pipe);
+	if (!raw_dev) {
+		dev_err(ctx->cam->dev, "%s: not found raw device\n", __func__);
+		return;
+	}
+	mtk_cam_event_frame_sync(ctx->pipe, dequeued_frame_seq_no);
+
+	/* No SOF in M2M, so we update ctx's dequeued_frame_seq_no here */
+	ctx->dequeued_frame_seq_no = dequeued_frame_seq_no;
+
+	/* List state-queue status*/
+	spin_lock(&sensor_ctrl->camsys_state_lock);
+	list_for_each_entry(state_temp, &sensor_ctrl->camsys_state_list,
+			    state_element) {
+		req = mtk_cam_ctrl_state_get_req(state_temp);
+		req_stream_data = mtk_cam_req_get_s_data(req, ctx->stream_id, 0);
+
+		if (state_temp->estate == E_STATE_INNER && !state_inner)
+			state_inner = state_temp;
+		else if (state_temp->estate == E_STATE_SENSOR && !state_sensor)
+			state_sensor = state_temp;
+		/* counter for state queue*/
+		que_cnt++;
+	}
+	spin_unlock(&sensor_ctrl->camsys_state_lock);
+
+	/* Transit inner state to done state */
+	if (state_inner) {
+		req = mtk_cam_ctrl_state_get_req(state_inner);
+		req_stream_data = mtk_cam_req_get_s_data(req, ctx->stream_id, 0);
+
+		dev_dbg(raw_dev->dev,
+			"[M2M P1 Don] req_stream_data->frame_seq_no:%d dequeued_frame_seq_no:%d\n",
+			req_stream_data->frame_seq_no, dequeued_frame_seq_no);
+
+		if (req_stream_data->frame_seq_no == dequeued_frame_seq_no) {
+			state_transition(state_inner,
+					 E_STATE_INNER, E_STATE_DONE_NORMAL);
+			atomic_set(&sensor_ctrl->isp_request_seq_no, dequeued_frame_seq_no);
+			dev_dbg(raw_dev->dev,
+				"[Frame done] frame_seq_no:%d, INNER->DONE_NORMAL state:%d\n",
+				req_stream_data->frame_seq_no, state_inner->estate);
+		}
+	}
+
+	req_stream_data = mtk_cam_get_req_s_data(ctx, ctx->stream_id,
+						 dequeued_frame_seq_no);
+	dequeue_cnt = mtk_cam_dequeue_req_frame(ctx, dequeued_frame_seq_no,
+						ctx->stream_id);
+	complete(&ctx->m2m_complete);
+
+	/* apply next composed buffer */
+	spin_lock(&ctx->composed_buffer_list.lock);
+	dev_dbg(raw_dev->dev,
+		"[M2M check next action] que_cnt:%d composed_buffer_list.cnt:%d\n",
+		que_cnt, ctx->composed_buffer_list.cnt);
+
+	if (list_empty(&ctx->composed_buffer_list.list)) {
+		dev_info(raw_dev->dev,
+			 "[M2M] no buffer, cq_num:%d, frame_seq:%d, composed_buffer_list.cnt :%d\n",
+			 ctx->composed_frame_seq_no, dequeued_frame_seq_no,
+			 ctx->composed_buffer_list.cnt);
+		spin_unlock(&ctx->composed_buffer_list.lock);
+	} else {
+		buf_entry = list_first_entry(&ctx->composed_buffer_list.list,
+					     struct mtk_cam_working_buf_entry,
+					     list_entry);
+		list_del(&buf_entry->list_entry);
+		ctx->composed_buffer_list.cnt--;
+		spin_unlock(&ctx->composed_buffer_list.lock);
+		spin_lock(&ctx->processing_buffer_list.lock);
+		list_add_tail(&buf_entry->list_entry,
+			      &ctx->processing_buffer_list.list);
+		ctx->processing_buffer_list.cnt++;
+
+		dev_dbg(raw_dev->dev,
+			"[M2M P1 Don] ctx->processing_buffer_list.cnt:%d\n",
+			ctx->processing_buffer_list.cnt);
+
+		spin_unlock(&ctx->processing_buffer_list.lock);
+
+		base_addr = buf_entry->buffer.iova;
+
+		if (!state_sensor) {
+			dev_info(raw_dev->dev,
+				 "[M2M P1 Don] Invalid state_sensor\n");
+			return;
+		}
+
+		req = mtk_cam_ctrl_state_get_req(state_sensor);
+		req_stream_data = mtk_cam_req_get_s_data(req, ctx->stream_id, 0);
+		req_stream_data->timestamp = time_boot;
+		req_stream_data->timestamp_mono = time_mono;
+
+		mtk_cam_raw_apply_cq(raw_dev, base_addr,
+				     buf_entry->cq_desc_size,
+				     buf_entry->cq_desc_offset,
+				     buf_entry->sub_cq_desc_size,
+				     buf_entry->sub_cq_desc_offset);
+		/* Transit state from Sensor -> CQ */
+		if (ctx->sensor) {
+			state_transition(state_sensor,
+					 E_STATE_SENSOR, E_STATE_CQ);
+
+			dev_dbg(raw_dev->dev,
+				"M2M apply_cq [ctx:%d-#%d], CQ-%d, composed:%d, cq_addr:0x%pad\n",
+				ctx->stream_id, dequeued_frame_seq_no,
+				req_stream_data->frame_seq_no,
+				ctx->composed_frame_seq_no, &base_addr);
+
+			dev_dbg(raw_dev->dev,
+				"M2M apply_cq: composed_buffer_list.cnt:%d time:%lld, monotime:%lld\n",
+				ctx->composed_buffer_list.cnt,
+				req_stream_data->timestamp,
+				req_stream_data->timestamp_mono);
+		}
+	}
+
+	if (dequeue_cnt) {
+		mutex_lock(&ctx->cam->queue_lock);
+		mtk_cam_dev_req_try_queue(ctx->cam);
+		mutex_unlock(&ctx->cam->queue_lock);
+	}
+}
+
+static void mtk_camsys_raw_frame_start(struct mtk_raw_device *raw_dev,
+				       struct mtk_cam_ctx *ctx,
+				       struct mtk_camsys_irq_info *irq_info)
+{
+	unsigned int dequeued_frame_seq_no = irq_info->frame_idx_inner;
+	struct mtk_cam_request_stream_data *req_stream_data;
+	struct mtk_camsys_sensor_ctrl *sensor_ctrl = &ctx->sensor_ctrl;
+	struct mtk_cam_working_buf_entry *buf_entry;
+	struct mtk_camsys_ctrl_state *current_state;
+	struct mtk_cam_buffer *buf;
+
+	dma_addr_t base_addr;
+	enum MTK_CAMSYS_STATE_RESULT state_handle_ret;
+
+	/* touch watchdog*/
+	if (watchdog_scenario(ctx))
+		mtk_ctx_watchdog_kick(ctx);
+	/* inner register dequeue number */
+	ctx->dequeued_frame_seq_no = dequeued_frame_seq_no;
+	/* Send V4L2_EVENT_FRAME_SYNC event */
+	mtk_cam_event_frame_sync(ctx->pipe, dequeued_frame_seq_no);
+
+	/* Handle directly enque buffers */
+	spin_lock(&ctx->cam->dma_processing_lock);
+	list_for_each_entry(buf, &ctx->cam->dma_processing, list) {
+		if (buf->state.estate == E_BUF_STATE_COMPOSED) {
+			spin_unlock(&ctx->cam->dma_processing_lock);
+			goto apply_cq;
+		}
+	}
+	spin_unlock(&ctx->cam->dma_processing_lock);
+	buf = NULL;
+	current_state = NULL;
+
+	/* Find request of this dequeued frame */
+	req_stream_data =
+		mtk_cam_get_req_s_data(ctx, ctx->stream_id, dequeued_frame_seq_no);
+	/* Detect no frame done and trigger camsys dump for debugging */
+	mtk_cam_debug_detect_dequeue_failed(req_stream_data, 30, irq_info, raw_dev);
+	if (ctx->sensor) {
+		state_handle_ret =
+			mtk_camsys_raw_state_handle(raw_dev, sensor_ctrl,
+						    &current_state, irq_info);
+
+		if (state_handle_ret != STATE_RESULT_TRIGGER_CQ) {
+			dev_dbg(raw_dev->dev, "[SOF] CQ drop s:%d deq:%d\n",
+				state_handle_ret, dequeued_frame_seq_no);
+			return;
+		}
+	}
+
+apply_cq:
+	/* Update CQ base address if needed */
+	if (ctx->composed_frame_seq_no <= dequeued_frame_seq_no) {
+		dev_info_ratelimited(raw_dev->dev,
+				     "SOF[ctx:%d-#%d], CQ isn't updated [composed_frame_deq (%d) ts:%llu]\n",
+				     ctx->stream_id, dequeued_frame_seq_no,
+				     ctx->composed_frame_seq_no, irq_info->ts_ns);
+		return;
+	}
+	/* apply next composed buffer */
+	spin_lock(&ctx->composed_buffer_list.lock);
+	if (list_empty(&ctx->composed_buffer_list.list)) {
+		dev_info_ratelimited(raw_dev->dev,
+				     "SOF_INT_ST, no buffer update, cq_num:%d, frame_seq:%d, ts:%llu\n",
+				     ctx->composed_frame_seq_no,
+				     dequeued_frame_seq_no, irq_info->ts_ns);
+		spin_unlock(&ctx->composed_buffer_list.lock);
+	} else {
+		buf_entry = list_first_entry(&ctx->composed_buffer_list.list,
+					     struct mtk_cam_working_buf_entry,
+					     list_entry);
+		list_del(&buf_entry->list_entry);
+		ctx->composed_buffer_list.cnt--;
+		spin_unlock(&ctx->composed_buffer_list.lock);
+		spin_lock(&ctx->processing_buffer_list.lock);
+		list_add_tail(&buf_entry->list_entry,
+			      &ctx->processing_buffer_list.list);
+		ctx->processing_buffer_list.cnt++;
+		spin_unlock(&ctx->processing_buffer_list.lock);
+		base_addr = buf_entry->buffer.iova;
+		mtk_cam_raw_apply_cq(raw_dev, base_addr,
+				     buf_entry->cq_desc_size,
+				     buf_entry->cq_desc_offset,
+				     buf_entry->sub_cq_desc_size,
+				     buf_entry->sub_cq_desc_offset);
+
+		if (buf) {
+			buf->state.estate = E_BUF_STATE_CQ;
+			return;
+		}
+
+		/* Transit state from Sensor -> CQ */
+		if (ctx->sensor) {
+			/* req_stream_data of req_cq*/
+			req_stream_data =
+				mtk_cam_ctrl_state_to_req_s_data(current_state);
+			state_transition(current_state,
+					 E_STATE_SENSOR, E_STATE_CQ);
+
+			dev_dbg(raw_dev->dev,
+				"SOF[ctx:%d-#%d], CQ-%d is update, composed:%d, cq_addr:0x%pad, time:%lld, monotime:%lld\n",
+				ctx->stream_id, dequeued_frame_seq_no,
+				req_stream_data->frame_seq_no,
+				ctx->composed_frame_seq_no, &base_addr,
+				req_stream_data->timestamp,
+				req_stream_data->timestamp_mono);
+		}
+	}
+}
+
+static void mtk_camsys_raw_m2m_cq_done(struct mtk_raw_device *raw_dev,
+				       struct mtk_cam_ctx *ctx,
+				       unsigned int frame_seq_no_outer)
+{
+	struct mtk_camsys_sensor_ctrl *sensor_ctrl = &ctx->sensor_ctrl;
+	struct mtk_camsys_ctrl_state *state_entry;
+	struct mtk_cam_request *req;
+	struct mtk_cam_request_stream_data *req_stream_data;
+
+	if (frame_seq_no_outer == 1)
+		mtk_cam_raw_stream_on(raw_dev, 1);
+
+	dev_dbg(raw_dev->dev,
+		"[M2M CQD] frame_seq_no_outer:%d composed_buffer_list.cnt:%d\n",
+		frame_seq_no_outer, ctx->composed_buffer_list.cnt);
+
+	spin_lock(&sensor_ctrl->camsys_state_lock);
+	list_for_each_entry(state_entry, &sensor_ctrl->camsys_state_list,
+			    state_element) {
+		req = mtk_cam_ctrl_state_get_req(state_entry);
+		req_stream_data = mtk_cam_req_get_s_data(req, ctx->stream_id, 0);
+
+		if (req_stream_data->frame_seq_no == frame_seq_no_outer) {
+			if (frame_seq_no_outer >
+			    atomic_read(&sensor_ctrl->isp_request_seq_no)) {
+				/**
+				 * outer number is 1 more from last SOF's
+				 * inner number
+				 */
+				state_transition(state_entry,
+						 E_STATE_CQ, E_STATE_OUTER);
+
+				dev_dbg(raw_dev->dev,
+					"[M2M CQD] req:%d, CQ->OUTER state:%d\n",
+					req_stream_data->frame_seq_no,
+					state_entry->estate);
+			}
+		}
+	}
+	spin_unlock(&sensor_ctrl->camsys_state_lock);
+}
+
+static void mtk_camsys_raw_cq_done(struct mtk_raw_device *raw_dev,
+				   struct mtk_cam_ctx *ctx,
+				   unsigned int frame_seq_no_outer)
+{
+	struct mtk_camsys_sensor_ctrl *sensor_ctrl = &ctx->sensor_ctrl;
+	struct mtk_camsys_ctrl_state *state_entry;
+	struct mtk_cam_request_stream_data *req_stream_data;
+	struct mtk_cam_buffer *buf;
+
+	/* initial CQ done */
+	if (raw_dev->sof_count == 0) {
+		sensor_ctrl->initial_cq_done = 1;
+		spin_lock(&ctx->cam->dma_processing_lock);
+		if (!list_empty(&ctx->cam->dma_processing)) {
+			buf = list_first_entry(&ctx->cam->dma_processing,
+					       struct mtk_cam_buffer, list);
+			if (buf->state.estate == E_BUF_STATE_CQ)
+				buf->state.estate = E_BUF_STATE_OUTER;
+			spin_unlock(&ctx->cam->dma_processing_lock);
+			mtk_cam_stream_on(raw_dev, ctx);
+			return;
+		}
+		spin_unlock(&ctx->cam->dma_processing_lock);
+
+		req_stream_data = mtk_cam_get_req_s_data(ctx, ctx->stream_id, 1);
+		if (!req_stream_data) {
+			dev_err(raw_dev->dev,
+				"Cannot find req stream data with stream_id:%d\n",
+				ctx->stream_id);
+			return;
+		}
+		if (req_stream_data->state.estate >= E_STATE_SENSOR || !ctx->sensor) {
+			mtk_cam_stream_on(raw_dev, ctx);
+		} else {
+			dev_dbg(raw_dev->dev,
+				"[CQD] 1st sensor not set yet, req:%d, state:%d\n",
+				req_stream_data->frame_seq_no,
+				req_stream_data->state.estate);
+		}
+	}
+	/* Legacy CQ done will be always happened at frame done */
+	spin_lock(&sensor_ctrl->camsys_state_lock);
+	list_for_each_entry(state_entry, &sensor_ctrl->camsys_state_list,
+			    state_element) {
+		req_stream_data = mtk_cam_ctrl_state_to_req_s_data(state_entry);
+		if (req_stream_data->frame_seq_no == frame_seq_no_outer) {
+			if (frame_seq_no_outer >
+			    atomic_read(&sensor_ctrl->isp_request_seq_no)) {
+				/*
+				 * outer number is 1 more from last SOF's
+				 * inner number
+				 */
+				if (frame_seq_no_outer == 1)
+					state_entry->estate = E_STATE_OUTER;
+				state_transition(state_entry,
+						 E_STATE_CQ, E_STATE_OUTER);
+				state_transition(state_entry,
+						 E_STATE_CQ_SCQ_DELAY, E_STATE_OUTER);
+				state_transition(state_entry,
+						 E_STATE_SENINF, E_STATE_OUTER);
+
+				dev_dbg(raw_dev->dev,
+					"[CQD] req:%d, CQ->OUTER state:%d\n",
+					req_stream_data->frame_seq_no,
+					state_entry->estate);
+			}
+		}
+	}
+	spin_unlock(&sensor_ctrl->camsys_state_lock);
+}
+
+static void mtk_camsys_raw_m2m_trigger(struct mtk_raw_device *raw_dev,
+				       struct mtk_cam_ctx *ctx,
+				       unsigned int frame_seq_no_outer)
+{
+	struct mtk_camsys_sensor_ctrl *sensor_ctrl = &ctx->sensor_ctrl;
+	struct mtk_camsys_ctrl_state *state_entry;
+	struct mtk_cam_request *req;
+	struct mtk_cam_request_stream_data *req_stream_data;
+	bool triggered;
+
+	if (!mtk_cam_is_m2m(ctx))
+		return;
+
+	mtk_cam_raw_trigger_rawi(raw_dev, ctx, -1);
+
+	spin_lock(&sensor_ctrl->camsys_state_lock);
+	triggered = false;
+
+	list_for_each_entry(state_entry, &sensor_ctrl->camsys_state_list,
+			    state_element) {
+		int s_data_idx, s_data_num;
+
+		req = mtk_cam_ctrl_state_get_req(state_entry);
+		s_data_num = req->p_data[ctx->stream_id].s_data_num;
+
+		for (s_data_idx = 0; s_data_idx < s_data_num; s_data_idx++) {
+			req_stream_data = mtk_cam_req_get_s_data(req,
+								 ctx->stream_id,
+								 s_data_idx);
+			dev_dbg(raw_dev->dev,
+				"s_data_idx/s_data_num:%d/%d, req_stream_data->frame_seq_no:%d",
+				s_data_idx, s_data_num,
+				req_stream_data->frame_seq_no);
+			if (req_stream_data->frame_seq_no == frame_seq_no_outer) {
+				/**
+				 * outer number is 1 more from last SOF's
+				 * inner number
+				 */
+				atomic_set(&sensor_ctrl->isp_request_seq_no, frame_seq_no_outer);
+				state_transition(state_entry,
+						 E_STATE_OUTER, E_STATE_INNER);
+				dev_dbg(raw_dev->dev,
+					"[SW Trigger] req:%d, M2M CQ->INNER state:%d frame_seq_no:%d\n",
+					req_stream_data->frame_seq_no,
+					state_entry->estate,
+					frame_seq_no_outer);
+				triggered = true;
+				break;
+			}
+		}
+		if (triggered)
+			break;
+	}
+	spin_unlock(&sensor_ctrl->camsys_state_lock);
+}
+
+static bool
+mtk_camsys_raw_prepare_frame_done(struct mtk_raw_device *raw_dev,
+				  struct mtk_cam_ctx *ctx,
+				  unsigned int dequeued_frame_seq_no)
+{
+	struct mtk_cam_device *cam = ctx->cam;
+	struct mtk_camsys_sensor_ctrl *camsys_sensor_ctrl = &ctx->sensor_ctrl;
+	struct mtk_camsys_ctrl_state *state_entry;
+	struct mtk_cam_request *state_req;
+	struct mtk_cam_request_stream_data *s_data;
+
+	if (!ctx->sensor) {
+		dev_info(cam->dev, "%s: no sensor found in ctx:%d, req:%d",
+			 __func__, ctx->stream_id, dequeued_frame_seq_no);
+
+		return true;
+	}
+
+	spin_lock(&camsys_sensor_ctrl->camsys_state_lock);
+	/**
+	 * Find inner register number's request and transit to
+	 * STATE_DONE_xxx
+	 */
+	list_for_each_entry(state_entry, &camsys_sensor_ctrl->camsys_state_list,
+			    state_element) {
+		state_req = mtk_cam_ctrl_state_get_req(state_entry);
+		s_data = mtk_cam_ctrl_state_to_req_s_data(state_entry);
+		if (s_data->frame_seq_no == dequeued_frame_seq_no) {
+			state_transition(state_entry,
+					 E_STATE_INNER_HW_DELAY, E_STATE_DONE_MISMATCH);
+			state_transition(state_entry,
+					 E_STATE_INNER, E_STATE_DONE_NORMAL);
+			if (atomic_read(&camsys_sensor_ctrl->isp_request_seq_no) == 0)
+				state_transition(state_entry,
+						 E_STATE_CQ, E_STATE_OUTER);
+
+			dev_dbg(cam->dev,
+				"[SWD] req:%d/state:%d/time:%lld/sync_id:%lld\n",
+				s_data->frame_seq_no, state_entry->estate,
+				s_data->timestamp, state_req->sync_id);
+		}
+	}
+	spin_unlock(&camsys_sensor_ctrl->camsys_state_lock);
+
+	return true;
+}
+
+static void mtk_cam_handle_frame_done(struct mtk_cam_ctx *ctx,
+				      unsigned int frame_seq_no,
+				      unsigned int pipe_id)
+{
+	struct mtk_raw_device *raw_dev;
+	bool need_dequeue;
+
+	/**
+	 * If ctx is already off, just return; mtk_cam_dev_req_cleanup()
+	 * triggered by mtk_cam_vb2_stop_streaming() puts the all media
+	 * requests back.
+	 */
+	spin_lock(&ctx->streaming_lock);
+	if (!ctx->streaming) {
+		dev_info(ctx->cam->dev,
+			 "%s: skip frame done for stream off ctx:%d\n",
+			 __func__, ctx->stream_id);
+		spin_unlock(&ctx->streaming_lock);
+		return;
+	}
+	spin_unlock(&ctx->streaming_lock);
+
+	raw_dev = get_main_raw_dev(ctx->cam, ctx->pipe);
+	if (!raw_dev) {
+		dev_err(ctx->cam->dev, "%s: not found raw device\n", __func__);
+		return;
+	}
+
+	need_dequeue =
+		mtk_camsys_raw_prepare_frame_done(raw_dev, ctx, frame_seq_no);
+
+	if (!need_dequeue)
+		return;
+
+	dev_dbg(ctx->cam->dev, "[%s] job done ctx-%d:pipe-%d:req(%d)\n",
+		__func__, ctx->stream_id, pipe_id, frame_seq_no);
+	if (mtk_cam_dequeue_req_frame(ctx, frame_seq_no, pipe_id)) {
+		mutex_lock(&ctx->cam->queue_lock);
+		mtk_cam_dev_req_try_queue(ctx->cam);
+		mutex_unlock(&ctx->cam->queue_lock);
+	}
+}
+
+void mtk_cam_meta1_done_work(struct work_struct *work)
+{
+	struct mtk_cam_req_work *meta1_done_work =
+		(struct mtk_cam_req_work *)work;
+	struct mtk_cam_request_stream_data *s_data, *s_data_ctx;
+	struct mtk_cam_ctx *ctx;
+	struct mtk_cam_request *req;
+	struct mtk_cam_buffer *buf;
+	struct vb2_buffer *vb;
+	void *vaddr;
+	bool unreliable = false;
+
+	s_data = mtk_cam_req_work_get_s_data(meta1_done_work);
+	ctx = mtk_cam_s_data_get_ctx(s_data);
+	req = mtk_cam_s_data_get_req(s_data);
+	s_data_ctx = mtk_cam_req_get_s_data(req, ctx->stream_id, 0);
+
+	dev_dbg(ctx->cam->dev, "%s: ctx:%d\n", __func__, ctx->stream_id);
+
+	spin_lock(&ctx->streaming_lock);
+	if (!ctx->streaming) {
+		spin_unlock(&ctx->streaming_lock);
+		dev_info(ctx->cam->dev, "%s: skip for stream off ctx:%d\n",
+			 __func__, ctx->stream_id);
+		return;
+	}
+	spin_unlock(&ctx->streaming_lock);
+
+	if (!s_data) {
+		dev_info(ctx->cam->dev,
+			 "%s:ctx(%d): can't get s_data\n",
+			 __func__, ctx->stream_id);
+		return;
+	}
+
+	/* Copy the meta1 output content to user buffer */
+	buf = mtk_cam_s_data_get_vbuf(s_data, MTK_RAW_META_OUT_1);
+	if (!buf) {
+		dev_info(ctx->cam->dev,
+			 "ctx(%d): can't get MTK_RAW_META_OUT_1 buf from req(%d)\n",
+			 ctx->stream_id, s_data->frame_seq_no);
+		return;
+	}
+
+	vb = &buf->vbb.vb2_buf;
+	if (!vb) {
+		dev_info(ctx->cam->dev,
+			 "%s:ctx(%d): can't get vb2 buf\n",
+			 __func__, ctx->stream_id);
+		return;
+	}
+
+	vaddr = vb2_plane_vaddr(&buf->vbb.vb2_buf, 0);
+	if (!vaddr) {
+		dev_info(ctx->cam->dev,
+			 "%s:ctx(%d): can't get plane_vadd\n",
+			 __func__, ctx->stream_id);
+		return;
+	}
+
+	/* Update the timestamp for the buffer*/
+	mtk_cam_s_data_update_timestamp(buf, s_data_ctx);
+
+	/* clean the stream data for req reinit case */
+	mtk_cam_s_data_reset_vbuf(s_data, MTK_RAW_META_OUT_1);
+
+	/* Let user get the buffer */
+	if (unreliable)
+		vb2_buffer_done(&buf->vbb.vb2_buf, VB2_BUF_STATE_ERROR);
+	else
+		vb2_buffer_done(&buf->vbb.vb2_buf, VB2_BUF_STATE_DONE);
+
+	dev_dbg(ctx->cam->dev, "%s:%s: req(%d) done\n",
+		__func__, req->req.debug_str, s_data->frame_seq_no);
+}
+
+static void mtk_cam_meta1_done(struct mtk_cam_ctx *ctx,
+			       unsigned int frame_seq_no,
+			       unsigned int pipe_id)
+{
+	struct mtk_cam_request *req;
+	struct mtk_cam_request_stream_data *req_stream_data;
+	struct mtk_cam_req_work *meta1_done_work;
+
+	req = mtk_cam_get_req(ctx, frame_seq_no);
+	if (!req) {
+		dev_info(ctx->cam->dev, "%s:ctx-%d:pipe-%d:req(%d) not found!\n",
+			 __func__, ctx->stream_id, pipe_id, frame_seq_no);
+		return;
+	}
+
+	req_stream_data = mtk_cam_req_get_s_data(req, pipe_id, 0);
+	if (!req_stream_data) {
+		dev_info(ctx->cam->dev, "%s:ctx-%d:pipe-%d:s_data not found!\n",
+			 __func__, ctx->stream_id, pipe_id);
+		return;
+	}
+
+	if (!(req_stream_data->flags & MTK_CAM_REQ_S_DATA_FLAG_META1_INDEPENDENT))
+		return;
+
+	meta1_done_work = &req_stream_data->meta1_done_work;
+	atomic_set(&meta1_done_work->is_queued, 1);
+	queue_work(ctx->frame_done_wq, &meta1_done_work->work);
+}
+
+static void mtk_camsys_m2m_frame_done(struct mtk_cam_ctx *ctx,
+				      unsigned int frame_seq_no,
+				      unsigned int pipe_id)
+{
+	struct mtk_cam_req_work *frame_done_work;
+	struct mtk_cam_request_stream_data *req_stream_data;
+
+	req_stream_data = mtk_cam_get_req_s_data(ctx, pipe_id, frame_seq_no);
+	if (!req_stream_data) {
+		dev_err(ctx->cam->dev,
+			"cannot find req stream data, pipe_id:%d frm_seq_no:%d\n",
+			pipe_id, frame_seq_no);
+		return;
+	}
+	if (atomic_read(&req_stream_data->frame_done_work.is_queued)) {
+		dev_info(ctx->cam->dev,
+			 "already queue done work %d\n",
+			 req_stream_data->frame_seq_no);
+		return;
+	}
+
+	atomic_set(&req_stream_data->seninf_dump_state, MTK_CAM_REQ_DBGWORK_S_FINISHED);
+	atomic_set(&req_stream_data->frame_done_work.is_queued, 1);
+	frame_done_work = &req_stream_data->frame_done_work;
+	queue_work(ctx->frame_done_wq, &frame_done_work->work);
+}
+
+void mtk_cam_frame_done_work(struct work_struct *work)
+{
+	struct mtk_cam_req_work *frame_done_work =
+		(struct mtk_cam_req_work *)work;
+	struct mtk_cam_request_stream_data *req_stream_data;
+	struct mtk_cam_ctx *ctx;
+
+	req_stream_data = mtk_cam_req_work_get_s_data(frame_done_work);
+	ctx = mtk_cam_s_data_get_ctx(req_stream_data);
+
+	if (mtk_cam_is_m2m(ctx))
+		mtk_cam_handle_m2m_frame_done(ctx,
+					      req_stream_data->frame_seq_no,
+					      req_stream_data->pipe_id);
+	else
+		mtk_cam_handle_frame_done(ctx,
+					  req_stream_data->frame_seq_no,
+					  req_stream_data->pipe_id);
+}
+
+void mtk_camsys_frame_done(struct mtk_cam_ctx *ctx,
+			   unsigned int frame_seq_no,
+			   unsigned int pipe_id)
+{
+	struct mtk_cam_req_work *frame_done_work;
+	struct mtk_cam_request_stream_data *req_stream_data;
+	struct mtk_cam_buffer *buf;
+	struct mtk_cam_working_buf_entry *buf_entry = NULL;
+	bool is_pending_buffer = false;
+
+	spin_lock(&ctx->cam->dma_processing_lock);
+	if (!list_empty(&ctx->cam->dma_processing)) {
+		buf = list_first_entry(&ctx->cam->dma_processing,
+				       struct mtk_cam_buffer, list);
+		list_del(&buf->list);
+		ctx->cam->dma_processing_count--;
+		vb2_buffer_done(&buf->vbb.vb2_buf, VB2_BUF_STATE_DONE);
+		is_pending_buffer = true;
+	}
+	spin_unlock(&ctx->cam->dma_processing_lock);
+
+	if (is_pending_buffer) {
+		spin_lock(&ctx->processing_buffer_list.lock);
+		if (!list_empty(&ctx->processing_buffer_list.list)) {
+			buf_entry =
+				list_first_entry(&ctx->processing_buffer_list.list,
+						 struct mtk_cam_working_buf_entry,
+						 list_entry);
+			list_del(&buf_entry->list_entry);
+			ctx->processing_buffer_list.cnt--;
+		}
+		spin_unlock(&ctx->processing_buffer_list.lock);
+		if (buf_entry)
+			mtk_cam_working_buf_put(buf_entry);
+
+		mtk_cam_buf_try_queue(ctx);
+		return;
+	}
+
+	req_stream_data = mtk_cam_get_req_s_data(ctx, pipe_id, frame_seq_no);
+	if (!req_stream_data) {
+		dev_info(ctx->cam->dev,
+			 "%s:ctx-%d:pipe-%d:req(%d) not found!\n",
+			 __func__, ctx->stream_id, pipe_id, frame_seq_no);
+		return;
+	}
+
+	if (atomic_read(&req_stream_data->frame_done_work.is_queued)) {
+		dev_info(ctx->cam->dev,
+			 "already queue done work req:%d seq:%d pipe_id:%d\n",
+			 req_stream_data->frame_seq_no, frame_seq_no, pipe_id);
+		return;
+	}
+
+	atomic_set(&req_stream_data->seninf_dump_state, MTK_CAM_REQ_DBGWORK_S_FINISHED);
+	atomic_set(&req_stream_data->frame_done_work.is_queued, 1);
+	frame_done_work = &req_stream_data->frame_done_work;
+	queue_work(ctx->frame_done_wq, &frame_done_work->work);
+}
+
+void mtk_camsys_state_delete(struct mtk_cam_ctx *ctx,
+			     struct mtk_camsys_sensor_ctrl *sensor_ctrl,
+			     struct mtk_cam_request *req)
+{
+	struct mtk_camsys_ctrl_state *state_entry, *state_entry_prev;
+	struct mtk_cam_request_stream_data *s_data;
+	struct mtk_camsys_ctrl_state *req_state;
+	int state_found = 0;
+
+	if (ctx->sensor) {
+		spin_lock(&sensor_ctrl->camsys_state_lock);
+		list_for_each_entry_safe(state_entry, state_entry_prev,
+					 &sensor_ctrl->camsys_state_list,
+					 state_element) {
+			s_data = mtk_cam_req_get_s_data(req, ctx->stream_id, 0);
+			req_state = &s_data->state;
+
+			if (state_entry == req_state) {
+				list_del(&state_entry->state_element);
+				state_found = 1;
+			}
+		}
+		spin_unlock(&sensor_ctrl->camsys_state_lock);
+		if (state_found == 0)
+			dev_dbg(ctx->cam->dev, "state not found\n");
+	}
+}
+
+static bool mtk_camsys_is_all_cq_done(struct mtk_cam_ctx *ctx,
+				      unsigned int pipe_id)
+{
+	unsigned int all_subdevs = 0;
+	bool ret = false;
+
+	spin_lock(&ctx->first_cq_lock);
+	if (ctx->is_first_cq_done) {
+		ret = true;
+		spin_unlock(&ctx->first_cq_lock);
+		goto EXIT;
+	}
+
+	/* update cq done status */
+	ctx->cq_done_status |= (1 << pipe_id);
+
+	/* check cq done status */
+	if (ctx->used_raw_num)
+		all_subdevs |= (1 << ctx->pipe->id);
+	if ((ctx->cq_done_status & all_subdevs) == all_subdevs) {
+		ctx->is_first_cq_done = 1;
+		ret = true;
+	}
+	spin_unlock(&ctx->first_cq_lock);
+	dev_info(ctx->cam->dev,
+		 "[1st-CQD] all done:%d, pipe_id:%d (using raw:%d)\n",
+		 ctx->is_first_cq_done, pipe_id, ctx->used_raw_num);
+EXIT:
+	return ret;
+}
+
+static int mtk_camsys_event_handle_raw(struct mtk_cam_device *cam,
+				       unsigned int engine_id,
+				       struct mtk_camsys_irq_info *irq_info)
+{
+	struct mtk_raw_device *raw_dev;
+	struct mtk_cam_ctx *ctx;
+
+	raw_dev = dev_get_drvdata(cam->raw.devs[engine_id]);
+	ctx = mtk_cam_find_ctx(cam, &raw_dev->pipeline->subdev.entity);
+	if (!ctx) {
+		dev_err(raw_dev->dev, "cannot find ctx\n");
+		return -EINVAL;
+	}
+
+	/* raw's CQ done */
+	if (irq_info->irq_type & 1 << CAMSYS_IRQ_SETTING_DONE) {
+		if (mtk_cam_is_m2m(ctx)) {
+			mtk_camsys_raw_m2m_cq_done(raw_dev, ctx, irq_info->frame_idx);
+			mtk_camsys_raw_m2m_trigger(raw_dev, ctx, irq_info->frame_idx);
+		} else {
+			if (mtk_camsys_is_all_cq_done(ctx, ctx->pipe->id))
+				mtk_camsys_raw_cq_done(raw_dev, ctx,
+						       irq_info->frame_idx);
+		}
+	}
+
+	/* raw's DMA done, we only allow AFO done here */
+	if (irq_info->irq_type & 1 << CAMSYS_IRQ_AFO_DONE)
+		mtk_cam_meta1_done(ctx, ctx->dequeued_frame_seq_no, ctx->stream_id);
+
+	/* raw's SW done */
+	if (irq_info->irq_type & 1 << CAMSYS_IRQ_FRAME_DONE) {
+		if (mtk_cam_is_m2m(ctx))
+			mtk_camsys_m2m_frame_done(ctx, irq_info->frame_idx_inner,
+						  ctx->stream_id);
+		else
+			mtk_camsys_frame_done(ctx, ctx->dequeued_frame_seq_no,
+					      ctx->stream_id);
+	}
+	/* raw's SOF */
+	if (irq_info->irq_type & 1 << CAMSYS_IRQ_FRAME_START) {
+		if (atomic_read(&raw_dev->vf_en) == 0) {
+			dev_info(raw_dev->dev, "skip sof event when vf off\n");
+			return 0;
+		}
+		mtk_camsys_raw_frame_start(raw_dev, ctx, irq_info);
+	}
+
+	return 0;
+}
+
+int mtk_camsys_isr_event(struct mtk_cam_device *cam,
+			 enum MTK_CAMSYS_ENGINE_TYPE engine_type,
+			 unsigned int engine_id,
+			 struct mtk_camsys_irq_info *irq_info)
+{
+	int ret = 0;
+
+	switch (engine_type) {
+	case CAMSYS_ENGINE_RAW:
+		ret = mtk_camsys_event_handle_raw(cam, engine_id, irq_info);
+		break;
+	case CAMSYS_ENGINE_SENINF:
+		if (irq_info->irq_type & (1 << CAMSYS_IRQ_FRAME_DROP))
+			dev_info(cam->dev,
+				 "MTK_CAMSYS_ENGINE_SENINF_TAG engine:%d type:0x%x\n",
+				 engine_id, irq_info->irq_type);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+void mtk_cam_initial_sensor_setup(struct mtk_cam_request *initial_req,
+				  struct mtk_cam_ctx *ctx)
+{
+	struct mtk_camsys_sensor_ctrl *sensor_ctrl = &ctx->sensor_ctrl;
+	struct mtk_cam_request_stream_data *req_stream_data;
+
+	sensor_ctrl->ctx = ctx;
+	req_stream_data = mtk_cam_req_get_s_data(initial_req, ctx->stream_id, 0);
+	req_stream_data->ctx = ctx;
+	mtk_cam_set_sensor_full(req_stream_data, &ctx->sensor_ctrl);
+	dev_info(ctx->cam->dev, "Directly setup sensor req:%d\n",
+		 req_stream_data->frame_seq_no);
+}
+
+static void mtk_cam_complete_hdl(struct mtk_cam_request_stream_data *s_data,
+				 struct media_request_object *hdl_obj,
+				 char *name)
+{
+	char *debug_str;
+	u64 start, cost;
+
+	debug_str = mtk_cam_s_data_get_dbg_str(s_data);
+
+	start = ktime_get_boottime_ns();
+	if (hdl_obj->ops)
+		hdl_obj->ops->unbind(hdl_obj);	/* mutex used */
+	else
+		pr_info("%s:%s:pipe(%d):seq(%d): cannot unbind %s hd\n",
+			__func__, debug_str, s_data->pipe_id,
+			s_data->frame_seq_no, name);
+
+	cost = ktime_get_boottime_ns() - start;
+	if (cost > 1000000)
+		pr_info("%s:%s:pipe(%d):seq(%d): complete hdl:%s, cost:%llu ns\n",
+			__func__, debug_str, s_data->pipe_id,
+			s_data->frame_seq_no, name, cost);
+	else
+		pr_debug("%s:%s:pipe(%d):seq(%d): complete hdl:%s, cost:%llu ns\n",
+			 __func__, debug_str, s_data->pipe_id,
+			 s_data->frame_seq_no, name, cost);
+
+	media_request_object_complete(hdl_obj);
+}
+
+void mtk_cam_complete_sensor_hdl(struct mtk_cam_request_stream_data *s_data)
+{
+	if (s_data->flags & MTK_CAM_REQ_S_DATA_FLAG_SENSOR_HDL_EN &&
+	    !(s_data->flags & MTK_CAM_REQ_S_DATA_FLAG_SENSOR_HDL_COMPLETE) &&
+	    s_data->sensor_hdl_obj) {
+		mtk_cam_complete_hdl(s_data, s_data->sensor_hdl_obj, "sensor");
+		s_data->flags |= MTK_CAM_REQ_S_DATA_FLAG_SENSOR_HDL_COMPLETE;
+	}
+}
+
+void mtk_cam_complete_raw_hdl(struct mtk_cam_request_stream_data *s_data)
+{
+	if ((s_data->flags & MTK_CAM_REQ_S_DATA_FLAG_RAW_HDL_EN) &&
+	    !(s_data->flags & MTK_CAM_REQ_S_DATA_FLAG_RAW_HDL_COMPLETE) &&
+	    s_data->raw_hdl_obj) {
+		mtk_cam_complete_hdl(s_data, s_data->raw_hdl_obj, "raw");
+		s_data->flags |= MTK_CAM_REQ_S_DATA_FLAG_RAW_HDL_COMPLETE;
+	}
+}
+
+void mtk_cam_req_ctrl_setup(struct mtk_raw_pipeline *raw_pipe,
+			    struct mtk_cam_request *req)
+{
+	struct mtk_cam_request_stream_data *req_stream_data;
+
+	req_stream_data = mtk_cam_req_get_s_data(req, raw_pipe->id, 0);
+
+	/* request setup*/
+	if (req_stream_data->flags & MTK_CAM_REQ_S_DATA_FLAG_RAW_HDL_EN &&
+	    !(req_stream_data->flags & MTK_CAM_REQ_S_DATA_FLAG_RAW_HDL_COMPLETE) &&
+	    req_stream_data->raw_hdl_obj) {
+		dev_dbg(raw_pipe->subdev.v4l2_dev->dev,
+			"%s:%s:%s:raw ctrl set start (seq:%d)\n",
+			__func__, raw_pipe->subdev.name, req->req.debug_str,
+			req_stream_data->frame_seq_no);
+		v4l2_ctrl_request_setup(&req->req, &raw_pipe->ctrl_handler);
+
+		mtk_cam_complete_raw_hdl(req_stream_data);
+	}
+}
+
+static int timer_reqdrained_chk(int fps_ratio)
+{
+	int timer_ms = 0;
+
+	if (fps_ratio > 1)
+		timer_ms = SENSOR_SET_DEADLINE_MS / fps_ratio;
+	else
+		timer_ms = SENSOR_SET_DEADLINE_MS;
+	/* earlier request drained event*/
+	if (fps_ratio > 1)
+		timer_ms = SENSOR_SET_DEADLINE_MS_60FPS;
+
+	return timer_ms;
+}
+
+static int timer_setsensor(int fps_ratio)
+{
+	int timer_ms = 0;
+
+	if (fps_ratio > 1)
+		timer_ms = SENSOR_SET_RESERVED_MS / fps_ratio;
+	else
+		timer_ms = SENSOR_SET_RESERVED_MS;
+
+	/* faster sensor setting*/
+	if (fps_ratio > 1)
+		timer_ms = SENSOR_SET_RESERVED_MS_60FPS;
+
+	return timer_ms;
+}
+
+int mtk_camsys_ctrl_start(struct mtk_cam_ctx *ctx)
+{
+	struct mtk_camsys_sensor_ctrl *camsys_sensor_ctrl = &ctx->sensor_ctrl;
+	struct v4l2_subdev_frame_interval fi = {
+		.pad = 0,
+		.interval = {
+			.numerator = 1,
+			.denominator = 30
+		},
+	};
+	int fps_factor = 1;
+
+	if (ctx->used_raw_num) {
+		v4l2_subdev_call_state_active(ctx->sensor, pad, get_frame_interval, &fi);
+		fps_factor = (fi.interval.numerator > 0) ?
+			(fi.interval.denominator / fi.interval.numerator / 30) : 1;
+	}
+
+	camsys_sensor_ctrl->ctx = ctx;
+	atomic_set(&camsys_sensor_ctrl->sensor_enq_seq_no, 0);
+	atomic_set(&camsys_sensor_ctrl->sensor_request_seq_no, 0);
+	atomic_set(&camsys_sensor_ctrl->isp_request_seq_no, 0);
+	atomic_set(&camsys_sensor_ctrl->isp_enq_seq_no, 0);
+	atomic_set(&camsys_sensor_ctrl->last_drained_seq_no, 0);
+	camsys_sensor_ctrl->initial_cq_done = 0;
+	camsys_sensor_ctrl->sof_time = 0;
+	if (ctx->used_raw_num)
+		atomic_set(&camsys_sensor_ctrl->initial_drop_frame_cnt, 0);
+
+	camsys_sensor_ctrl->timer_req_event =
+		timer_reqdrained_chk(fps_factor);
+	camsys_sensor_ctrl->timer_req_sensor =
+		timer_setsensor(fps_factor);
+	INIT_LIST_HEAD(&camsys_sensor_ctrl->camsys_state_list);
+	spin_lock_init(&camsys_sensor_ctrl->camsys_state_lock);
+	if (ctx->sensor) {
+		hrtimer_init(&camsys_sensor_ctrl->sensor_deadline_timer,
+			     CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+		camsys_sensor_ctrl->sensor_deadline_timer.function =
+			sensor_deadline_timer_handler;
+		camsys_sensor_ctrl->sensorsetting_wq = &ctx->sensor_worker;
+	}
+	kthread_init_work(&camsys_sensor_ctrl->work,
+			  mtk_cam_sensor_worker_in_sensorctrl);
+
+	dev_info(ctx->cam->dev,
+		 "[%s] ctx:%d/raw_dev:0x%x drained/sensor (%d)%d/%d\n",
+		 __func__, ctx->stream_id, ctx->used_raw_dev, fps_factor,
+		 camsys_sensor_ctrl->timer_req_event,
+		 camsys_sensor_ctrl->timer_req_sensor);
+
+	return 0;
+}
+
+void mtk_camsys_ctrl_update(struct mtk_cam_ctx *ctx)
+{
+	struct mtk_camsys_sensor_ctrl *camsys_sensor_ctrl = &ctx->sensor_ctrl;
+	struct v4l2_subdev_frame_interval fi = {
+		.pad = 0,
+		.interval = {
+			.numerator = 1,
+			.denominator = 30
+		},
+	};
+	int fps_factor = 1;
+
+	if (ctx->used_raw_num) {
+		fi.pad = 0;
+		v4l2_subdev_call_state_active(ctx->sensor, pad, get_frame_interval, &fi);
+		fps_factor = (fi.interval.numerator > 0) ?
+			(fi.interval.denominator / fi.interval.numerator / 30) : 1;
+	}
+
+	camsys_sensor_ctrl->timer_req_event =
+		timer_reqdrained_chk(fps_factor);
+	camsys_sensor_ctrl->timer_req_sensor =
+		timer_setsensor(fps_factor);
+
+	dev_info(ctx->cam->dev,
+		 "[%s] ctx:%d/raw_dev:0x%x drained/sensor (%d)%d/%d\n",
+		 __func__, ctx->stream_id, ctx->used_raw_dev, fps_factor,
+		 camsys_sensor_ctrl->timer_req_event,
+		 camsys_sensor_ctrl->timer_req_sensor);
+}
+
+void mtk_camsys_ctrl_stop(struct mtk_cam_ctx *ctx)
+{
+	struct mtk_camsys_sensor_ctrl *camsys_sensor_ctrl = &ctx->sensor_ctrl;
+	struct mtk_camsys_ctrl_state *state_entry, *state_entry_prev;
+
+	spin_lock(&camsys_sensor_ctrl->camsys_state_lock);
+	list_for_each_entry_safe(state_entry, state_entry_prev,
+				 &camsys_sensor_ctrl->camsys_state_list,
+				 state_element) {
+		list_del(&state_entry->state_element);
+	}
+	spin_unlock(&camsys_sensor_ctrl->camsys_state_lock);
+
+	if (ctx->sensor) {
+		hrtimer_cancel(&camsys_sensor_ctrl->sensor_deadline_timer);
+		camsys_sensor_ctrl->sensorsetting_wq = NULL;
+	}
+	kthread_flush_work(&camsys_sensor_ctrl->work);
+	if (ctx->used_raw_num)
+		mtk_cam_event_eos(ctx->pipe);
+
+	dev_info(ctx->cam->dev, "[%s] ctx:%d/raw_dev:0x%x\n",
+		 __func__, ctx->stream_id, ctx->used_raw_dev);
+}
+
+void mtk_cam_m2m_enter_cq_state(struct mtk_camsys_ctrl_state *ctrl_state)
+{
+	state_transition(ctrl_state, E_STATE_SENSOR, E_STATE_CQ);
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h
new file mode 100644
index 000000000000..1b780a405193
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h
@@ -0,0 +1,140 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_CTRL_H
+#define __MTK_CAM_CTRL_H
+
+#include <linux/hrtimer.h>
+#include <linux/timer.h>
+
+struct mtk_cam_device;
+
+enum MTK_CAMSYS_ENGINE_TYPE {
+	CAMSYS_ENGINE_RAW,
+	CAMSYS_ENGINE_MRAW,
+	CAMSYS_ENGINE_CAMSV,
+	CAMSYS_ENGINE_SENINF,
+};
+
+enum MTK_CAMSYS_IRQ_EVENT {
+	/* with normal_data */
+	CAMSYS_IRQ_SETTING_DONE = 0,
+	CAMSYS_IRQ_FRAME_START,
+	CAMSYS_IRQ_AFO_DONE,
+	CAMSYS_IRQ_FRAME_DONE,
+	CAMSYS_IRQ_SUBSAMPLE_SENSOR_SET,
+	CAMSYS_IRQ_FRAME_DROP,
+
+	/* with error_data */
+	CAMSYS_IRQ_ERROR,
+};
+
+struct mtk_camsys_irq_normal_data {
+	/* with normal_status */
+};
+
+struct mtk_camsys_irq_error_data {
+	/* with error_status */
+	int err_status;
+};
+
+struct mtk_camsys_irq_info {
+	enum MTK_CAMSYS_IRQ_EVENT irq_type;
+	u64 ts_ns;
+	int frame_idx;
+	int frame_idx_inner;
+	bool sub_engine;
+	int write_cnt;
+	int fbc_cnt;
+	union {
+		struct mtk_camsys_irq_normal_data n;
+		struct mtk_camsys_irq_error_data e;
+	};
+};
+
+enum MTK_CAMSYS_STATE_IDX {
+	/* For state analysis and controlling for request */
+	E_STATE_READY = 0x0,
+	E_STATE_SENINF,
+	E_STATE_SENSOR,
+	E_STATE_CQ,
+	E_STATE_OUTER,
+	E_STATE_CAMMUX_OUTER_CFG,
+	E_STATE_CAMMUX_OUTER,
+	E_STATE_INNER,
+	E_STATE_DONE_NORMAL,
+	E_STATE_CQ_SCQ_DELAY,
+	E_STATE_CAMMUX_OUTER_CFG_DELAY,
+	E_STATE_OUTER_HW_DELAY,
+	E_STATE_INNER_HW_DELAY,
+	E_STATE_DONE_MISMATCH,
+};
+
+struct mtk_camsys_ctrl_state {
+	enum MTK_CAMSYS_STATE_IDX estate;
+	struct list_head state_element;
+};
+
+struct mtk_camsys_link_ctrl {
+	struct mtk_raw_pipeline *pipe;
+	struct media_pad remote;
+	struct mtk_cam_ctx *swapping_ctx;
+	u8 active;
+	u8 wait_exchange;
+};
+
+/* per stream from sensor */
+struct mtk_camsys_sensor_ctrl {
+	struct mtk_cam_ctx *ctx;
+	struct kthread_worker *sensorsetting_wq;
+	struct kthread_work work;
+	struct hrtimer sensor_deadline_timer;
+	u64 sof_time;
+	int timer_req_sensor;
+	int timer_req_event;
+	atomic_t sensor_enq_seq_no;
+	atomic_t sensor_request_seq_no;
+	atomic_t isp_request_seq_no;
+	atomic_t isp_enq_seq_no;
+	atomic_t last_drained_seq_no;
+	int initial_cq_done;
+	atomic_t initial_drop_frame_cnt;
+	struct list_head camsys_state_list;
+	spinlock_t camsys_state_lock; /* protect camsys_state_list */
+	/* link change ctrl */
+	struct mtk_camsys_link_ctrl link_ctrl;
+	struct mtk_cam_request *link_change_req;
+};
+
+void mtk_camsys_state_delete(struct mtk_cam_ctx *ctx,
+			     struct mtk_camsys_sensor_ctrl *sensor_ctrl,
+			     struct mtk_cam_request *req);
+void mtk_camsys_frame_done(struct mtk_cam_ctx *ctx, unsigned int frame_seq_no,
+			   unsigned int pipe_id);
+int mtk_camsys_isr_event(struct mtk_cam_device *cam,
+			 enum MTK_CAMSYS_ENGINE_TYPE engine_type,
+			 unsigned int engine_id,
+			 struct mtk_camsys_irq_info *irq_info);
+bool mtk_cam_submit_kwork_in_sensorctrl(struct kthread_worker *worker,
+					struct mtk_camsys_sensor_ctrl *sensor_ctrl);
+void mtk_cam_initial_sensor_setup(struct mtk_cam_request *req,
+				  struct mtk_cam_ctx *ctx);
+void mtk_cam_req_ctrl_setup(struct mtk_raw_pipeline *raw_pipe,
+			    struct mtk_cam_request *req);
+int mtk_camsys_ctrl_start(struct mtk_cam_ctx *ctx); /* ctx_stream_on */
+void mtk_camsys_ctrl_update(struct mtk_cam_ctx *ctx);
+void mtk_camsys_ctrl_stop(struct mtk_cam_ctx *ctx); /* ctx_stream_off */
+void mtk_cam_frame_done_work(struct work_struct *work);
+void mtk_cam_meta1_done_work(struct work_struct *work);
+void mtk_cam_m2m_enter_cq_state(struct mtk_camsys_ctrl_state *ctrl_state);
+void mtk_cam_set_sensor_full(struct mtk_cam_request_stream_data *s_data,
+			     struct mtk_camsys_sensor_ctrl *sensor_ctrl);
+void state_transition(struct mtk_camsys_ctrl_state *state_entry,
+		      enum MTK_CAMSYS_STATE_IDX from,
+		      enum MTK_CAMSYS_STATE_IDX to);
+void mtk_cam_set_sensor_switch(struct mtk_cam_request_stream_data *s_data,
+			       struct mtk_camsys_sensor_ctrl *sensor_ctrl);
+
+#endif /* __MTK_CAM_CTRL_H */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.c
new file mode 100644
index 000000000000..9e6f2a33a111
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.c
@@ -0,0 +1,1271 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2022 MediaTek Inc.
+
+#ifdef CONFIG_DEBUG_FS
+
+#include <linux/freezer.h>
+#include <linux/vmalloc.h>
+#include <linux/videodev2.h>
+#include <media/v4l2-event.h>
+
+#include <soc/mediatek/smi.h>
+#include "mtk_camera-v4l2-controls.h"
+#include "mtk_cam-regs-mt8188.h"
+#include "mtk_cam.h"
+#include "mtk_cam-raw.h"
+#include "mtk_cam-debug.h"
+
+#define CAMSYS_DUMP_SATATE_INIT		0
+#define CAMSYS_DUMP_SATATE_READY	1
+
+#define CTRL_BLOCK_STATE_EMPTY		0
+#define CTRL_BLOCK_STATE_WRITE		1
+#define CTRL_BLOCK_STATE_READY		2
+#define CTRL_BLOCK_STATE_READ		3
+
+static int
+mtk_cam_debug_init_dump_param(struct mtk_cam_ctx *ctx,
+			      struct mtk_cam_dump_param *param,
+			      struct mtk_cam_request_stream_data *stream_data,
+			      char *desc)
+{
+	struct mtk_cam_device *cam = ctx->cam;
+	struct mtk_cam_buffer *buf;
+	struct mtk_cam_video_device *node;
+	int request_fd = -1;
+
+	memset(param, 0, sizeof(*param));
+	param->stream_id = ctx->stream_id;
+	param->sequence = stream_data->frame_seq_no;
+	param->timestamp = stream_data->timestamp;
+
+	if (stream_data->working_buf) {
+		param->cq_cpu_addr = stream_data->working_buf->buffer.va;
+	} else {
+		dev_info(cam->dev,
+			 "%s:ctx(%d):req(%d):stream_data->working_buf is null\n",
+			 __func__, ctx->stream_id, param->sequence);
+		return -EINVAL;
+	}
+
+	buf = mtk_cam_s_data_get_vbuf(stream_data, MTK_RAW_META_IN);
+	if (buf) {
+		request_fd = buf->vbb.request_fd;
+		node = mtk_cam_vbq_to_vdev(buf->vbb.vb2_buf.vb2_queue);
+		param->meta_in_cpu_addr = vb2_plane_vaddr(&buf->vbb.vb2_buf, 0);
+		param->meta_in_dump_buf_size =
+			node->active_fmt.fmt.meta.buffersize;
+		param->meta_in_iova = buf->daddr;
+		dev_dbg(cam->dev,
+			"%s:ctx(%d):req(%d):MTK_RAW_META_IN(%s) found: %d\n",
+			__func__, ctx->stream_id, param->sequence,
+			node->desc.name, param->meta_in_dump_buf_size);
+	}
+
+	param->cq_size = stream_data->working_buf->buffer.size;
+	param->cq_iova = stream_data->working_buf->buffer.iova;
+	param->cq_desc_offset = stream_data->working_buf->cq_desc_offset;
+	param->cq_desc_size = stream_data->working_buf->cq_desc_size;
+	param->sub_cq_desc_size = stream_data->working_buf->sub_cq_desc_size;
+	param->sub_cq_desc_offset = stream_data->working_buf->sub_cq_desc_offset;
+
+	param->request_fd = request_fd;
+	param->desc = desc;
+
+	/* add mtkcam_ipi_frame_param to dump */
+	param->frame_params = &stream_data->frame_params;
+	param->frame_param_size = sizeof(stream_data->frame_params);
+	dev_dbg(cam->dev, "%s:ctx(%d):req(%d), frame_param size(%u)\n",
+		__func__, ctx->stream_id, param->sequence, param->frame_param_size);
+
+	/* add mtkcam_ipi_config_param to dump */
+	param->config_params = &ctx->config_params;
+	param->config_param_size = sizeof(ctx->config_params);
+	dev_dbg(cam->dev, "%s:ctx(%d):req(%d), cofig_param size(%u)\n",
+		__func__, ctx->stream_id, param->sequence, param->config_param_size);
+
+	return 0;
+}
+
+/* Dump single region to the buffer */
+static void mtk_cam_dump_buf_content(struct device *dev, void *buf, void *src,
+				     int offset, int size, char *buf_name)
+{
+	void *dest;
+
+	if (!src || size <= 0)
+		return;
+
+	dest = buf + offset;
+	dev_dbg(dev, "%s: dump:%s(%p --> %p), offset(%d), size(%d)",
+		__func__, buf_name, src, dest, offset, size);
+	memcpy(dest, src, size);
+}
+
+static void
+mtk_cam_debug_dump_all_content(struct mtk_cam_debug_fs *debug_fs,
+			       void *dump_buf,
+			       struct mtk_cam_dump_param *param)
+{
+	struct mtk_cam_dump_header *header;
+	struct device *dev = debug_fs->cam->dev;
+
+	header = (struct mtk_cam_dump_header *)dump_buf;
+	strscpy(header->desc, param->desc, MTK_CAM_DEBUG_DUMP_DESC_SIZE - 1);
+	header->request_fd = param->request_fd;
+	header->stream_id = param->stream_id;
+	header->timestamp = param->timestamp;
+	header->sequence = param->sequence;
+	header->header_size = sizeof(*header);
+	header->payload_offset = header->header_size;
+	header->payload_size = debug_fs->buf_size - header->header_size;
+
+	dev_dbg(dev,
+		"%s:ctx(%d):req_fd(%d),ts(%llu),req(%d),header_sz(%d),payload_offset(%d),payload_sz(%d)",
+		__func__, header->stream_id, header->request_fd,
+		header->timestamp, header->sequence, header->header_size,
+		header->payload_offset, header->payload_size);
+
+	/* meta file information */
+	header->meta_version_major = camsys_get_meta_version(true);
+	header->meta_version_minor = camsys_get_meta_version(false);
+
+	/* CQ dump */
+	header->cq_dump_buf_offset = header->payload_offset;
+	header->cq_size = param->cq_size;
+	header->cq_iova = param->cq_iova;
+	header->cq_desc_offset = param->cq_desc_offset;
+	header->cq_desc_size = param->cq_desc_size;
+	header->sub_cq_desc_offset = param->sub_cq_desc_offset;
+	header->sub_cq_desc_size = param->sub_cq_desc_size;
+
+	/* meta in */
+	header->meta_in_dump_buf_offset =
+		header->cq_dump_buf_offset + header->cq_size;
+	header->meta_in_dump_buf_size = param->meta_in_dump_buf_size;
+	header->meta_in_iova = param->meta_in_iova;
+
+	/* meta out 0 */
+	header->meta_out_0_dump_buf_offset =
+		header->meta_in_dump_buf_offset +
+		header->meta_in_dump_buf_size;
+	header->meta_out_0_dump_buf_size = param->meta_out_0_dump_buf_size;
+	header->meta_out_0_iova = param->meta_out_0_iova;
+
+	/* meta out 1 */
+	header->meta_out_1_dump_buf_offset =
+		header->meta_out_0_dump_buf_offset +
+		header->meta_out_0_dump_buf_size;
+	header->meta_out_1_dump_buf_size = param->meta_out_1_dump_buf_size;
+	header->meta_out_1_iova = param->meta_out_1_iova;
+
+	/* meta out 2 */
+	header->meta_out_2_dump_buf_offset =
+		header->meta_out_1_dump_buf_offset +
+		header->meta_out_1_dump_buf_size;
+	header->meta_out_2_dump_buf_size = param->meta_out_2_dump_buf_size;
+	header->meta_out_2_iova = param->meta_out_2_iova;
+
+	/* ipi frame param */
+	header->frame_dump_offset =
+		header->meta_out_2_dump_buf_offset +
+		header->meta_out_2_dump_buf_size;
+	header->frame_dump_size = param->frame_param_size;
+
+	/* ipi config param */
+	header->config_dump_offset =
+		header->frame_dump_offset +
+		header->frame_dump_size;
+	header->config_dump_size = param->config_param_size;
+	header->used_stream_num = 1;
+
+	mtk_cam_dump_buf_content(dev, dump_buf, param->cq_cpu_addr,
+				 header->cq_dump_buf_offset,
+				 header->cq_size,
+				 "CQ");
+
+	mtk_cam_dump_buf_content(dev, dump_buf, param->meta_in_cpu_addr,
+				 header->meta_in_dump_buf_offset,
+				 header->meta_in_dump_buf_size,
+				 "Meta-in");
+
+	mtk_cam_dump_buf_content(dev, dump_buf, param->meta_out_0_cpu_addr,
+				 header->meta_out_0_dump_buf_offset,
+				 header->meta_out_0_dump_buf_size,
+				 "Meta-out-0");
+
+	mtk_cam_dump_buf_content(dev, dump_buf, param->meta_out_1_cpu_addr,
+				 header->meta_out_1_dump_buf_offset,
+				 header->meta_out_1_dump_buf_size,
+				 "Meta-out-1");
+
+	mtk_cam_dump_buf_content(dev, dump_buf, param->meta_out_2_cpu_addr,
+				 header->meta_out_2_dump_buf_offset,
+				 header->meta_out_2_dump_buf_size,
+				 "Meta-out-2");
+
+	mtk_cam_dump_buf_content(dev, dump_buf, param->frame_params,
+				 header->frame_dump_offset,
+				 header->frame_dump_size,
+				 "Ipi-frame-params");
+
+	mtk_cam_dump_buf_content(dev, dump_buf, param->config_params,
+				 header->config_dump_offset,
+				 header->config_dump_size,
+				 "Ipi-config-params");
+}
+
+static struct mtk_cam_dump_ctrl_block *
+mtk_cam_dump_ctrl_block_next(struct mtk_cam_debug_fs *debug_fs,
+			     struct mtk_cam_dump_buf_ctrl *ctrl)
+{
+	struct device *dev = debug_fs->cam->dev;
+	struct mtk_cam_dump_ctrl_block *ctrl_block;
+	int head, tail;
+
+	head = ctrl->head;
+	tail = ctrl->tail;
+
+	if (ctrl->num <= 0) {
+		dev_info(dev, "%s:pipe(%d):no buffer allocated:%d\n",
+			 __func__, ctrl->pipe_id, ctrl->num);
+		return NULL;
+	}
+
+	if (ctrl->count) {
+		head++;
+		if (head == ctrl->num)
+			head = 0;
+		/* User is still reading the buffer*/
+		if (atomic_read(&ctrl->blocks[head].state) == CTRL_BLOCK_STATE_READ)
+			return NULL;
+		/* overwrite the last buffer */
+		if (head == tail)
+			tail++;
+		if (tail == ctrl->num)
+			tail = 0;
+	}
+
+	ctrl->tail = tail;
+	ctrl->head = head;
+	ctrl->count++;
+	if (ctrl->count > ctrl->num)
+		ctrl->count = ctrl->num;
+
+	ctrl_block = &ctrl->blocks[ctrl->head];
+	dev_dbg(dev,
+		"%s:pipe(%d):ctrl_block(%p),buf(%p),head(%d),tail(%d),cnt(%d),num(%d)\n",
+		__func__, ctrl->pipe_id, ctrl_block, ctrl_block->buf,
+		ctrl->head, ctrl->tail, ctrl->count, ctrl->num);
+
+	return ctrl_block;
+}
+
+static int mtk_cam_debug_dump(struct mtk_cam_debug_fs *debug_fs,
+			      struct mtk_cam_dump_param *param)
+{
+	struct device *dev = debug_fs->cam->dev;
+	struct mtk_cam_dump_buf_ctrl *ctrl = &debug_fs->ctrl[param->stream_id];
+	struct mtk_cam_dump_ctrl_block *ctrl_block;
+
+	mutex_lock(&ctrl->ctrl_lock);
+	ctrl_block = mtk_cam_dump_ctrl_block_next(debug_fs, ctrl);
+	if (!ctrl_block || !ctrl_block->buf) {
+		dev_info(dev, "%s:pipe(%d):req(%d):no free buffer, drop\n",
+			 __func__, param->stream_id, param->sequence);
+		mutex_unlock(&ctrl->ctrl_lock);
+
+		return -EINVAL;
+	}
+	mutex_unlock(&ctrl->ctrl_lock);
+
+	atomic_set(&ctrl_block->state, CTRL_BLOCK_STATE_WRITE);
+	mtk_cam_debug_dump_all_content(debug_fs, ctrl_block->buf, param);
+	atomic_set(&ctrl_block->state, CTRL_BLOCK_STATE_READY);
+
+	dev_dbg(dev, "%s:pipe(%d):req(%d):dump(%p) is ready to read, sz(%u)\n",
+		__func__, param->stream_id, param->sequence, ctrl_block->buf,
+		debug_fs->buf_size);
+
+	return 0;
+}
+
+static int mtk_cam_debug_exp_dump(struct mtk_cam_debug_fs *debug_fs,
+				  struct mtk_cam_dump_param *param)
+{
+	struct device *dev = debug_fs->cam->dev;
+	void *dump_buf = debug_fs->exp_dump_buf;
+
+	if (!dump_buf) {
+		dev_info(dev, "%s:pipe(%d):req(%d):no dump buffer. sz(%u)\n",
+			 __func__, param->stream_id, param->sequence,
+			 debug_fs->buf_size);
+		return -EINVAL;
+	}
+
+	mutex_lock(&debug_fs->exp_dump_buf_lock);
+	if (atomic_read(&debug_fs->exp_dump_state) != CAMSYS_DUMP_SATATE_INIT) {
+		dev_info(dev,
+			 "%s:pipe(%d):req(%d):dump can't be written, state(%d), buf(%p), sz(%u)\n",
+			 __func__, param->stream_id, param->sequence,
+			 atomic_read(&debug_fs->exp_dump_state), dump_buf,
+			 debug_fs->buf_size);
+		mutex_unlock(&debug_fs->exp_dump_buf_lock);
+
+		return -EINVAL;
+	}
+
+	memset(dump_buf, 0, debug_fs->buf_size);
+	mtk_cam_debug_dump_all_content(debug_fs, dump_buf, param);
+	atomic_set(&debug_fs->exp_dump_state, CAMSYS_DUMP_SATATE_READY);
+	mutex_unlock(&debug_fs->exp_dump_buf_lock);
+
+	dev_dbg(dev, "%s:pipe(%d):req(%d):dump is ready to read\n",
+		__func__, param->stream_id, param->sequence);
+
+	return 0;
+}
+
+static int mtk_cam_debug_find_dump_ctrl(struct mtk_cam_dump_buf_ctrl *ctrl,
+					unsigned long seq)
+{
+	int i = ctrl->head;
+	struct mtk_cam_dump_ctrl_block *ctrl_block;
+	struct mtk_cam_dump_header *header;
+
+	if (!ctrl->count)
+		return -EINVAL;
+
+	while (1) {
+		ctrl_block = &ctrl->blocks[i];
+		header = (struct mtk_cam_dump_header *)ctrl_block->buf;
+		if (header->sequence == seq)
+			return i;
+
+		if (i == ctrl->tail)
+			break;
+
+		if (--i < 0)
+			i = ctrl->num - 1;
+	}
+
+	return -EINVAL;
+}
+
+static int mtk_cam_debug_dump_ctrl_set(struct mtk_cam_dump_buf_ctrl *ctrl,
+				       unsigned long seq, bool start)
+{
+	struct mtk_cam_dump_ctrl_block *ctrl_block;
+	int ctrl_block_idx;
+
+	dev_info(ctrl->debug_fs->cam->dev,
+		 "%s:pipe_id(%d):to read req(%ld), start/end(%d)\n",
+		 __func__, ctrl->pipe_id, seq, start);
+	mutex_lock(&ctrl->ctrl_lock);
+	ctrl_block_idx = mtk_cam_debug_find_dump_ctrl(ctrl, seq);
+	if (ctrl_block_idx < 0) {
+		dev_info(ctrl->debug_fs->cam->dev,
+			 "%s:pipe_id(%d): to read req(%ld) dump, start/end(%d), not found\n",
+			 __func__, ctrl->pipe_id, seq, start);
+		goto FAIL_RELEASE_LOCK;
+	}
+	ctrl_block = &ctrl->blocks[ctrl_block_idx];
+	if (start) {
+		if (atomic_read(&ctrl_block->state) != CTRL_BLOCK_STATE_READY) {
+			dev_info(ctrl->debug_fs->cam->dev,
+				 "%s:pipe_id(%d):to get req(%ld) dump failed, state(%d)\n",
+				 __func__, ctrl->pipe_id, seq,
+				 atomic_read(&ctrl_block->state));
+			goto FAIL_RELEASE_LOCK;
+		}
+		atomic_set(&ctrl_block->state, CTRL_BLOCK_STATE_READ);
+		ctrl->cur_read = ctrl_block_idx;
+	} else {
+		if (atomic_read(&ctrl_block->state) != CTRL_BLOCK_STATE_READ) {
+			dev_info(ctrl->debug_fs->cam->dev,
+				 "%s:pipe_id(%d):to release req(%ld) dump failed, state(%d)\n",
+				 __func__, ctrl->pipe_id, seq,
+				 atomic_read(&ctrl_block->state));
+			goto FAIL_RELEASE_LOCK;
+		}
+		ctrl->cur_read = -1;
+		atomic_set(&ctrl_block->state, CTRL_BLOCK_STATE_READY);
+	}
+	mutex_unlock(&ctrl->ctrl_lock);
+	return 0;
+
+FAIL_RELEASE_LOCK:
+	ctrl->cur_read = -1;
+	mutex_unlock(&ctrl->ctrl_lock);
+	return -EINVAL;
+}
+
+static void mtk_cam_dump_ctrl_init(struct mtk_cam_debug_fs *debug_fs,
+				   struct mtk_cam_dump_buf_ctrl *ctrl, int num)
+{
+	ctrl->num = num;
+	ctrl->head = 0;
+	ctrl->tail = 0;
+	ctrl->count = 0;
+	ctrl->cur_read = -1;
+}
+
+static void mtk_cam_dump_ctrl_reinit(struct mtk_cam_dump_buf_ctrl *ctrl)
+{
+	int i;
+
+	mutex_lock(&ctrl->ctrl_lock);
+
+	ctrl->head = 0;
+	ctrl->tail = 0;
+	ctrl->count = 0;
+	ctrl->cur_read = -1;
+	for (i = 0; i < ctrl->num; i++)
+		atomic_set(&ctrl->blocks[i].state, CTRL_BLOCK_STATE_EMPTY);
+
+	mutex_unlock(&ctrl->ctrl_lock);
+}
+
+static int mtk_cam_dump_buf_realloc(struct mtk_cam_dump_buf_ctrl *ctrl,
+				    int num_of_bufs)
+{
+	int num_of_alloc = 0;
+	int i;
+	struct mtk_cam_dump_ctrl_block *ctrl_block;
+	struct mtk_cam_debug_fs *debug_fs = ctrl->debug_fs;
+	struct device *dev = debug_fs->cam->dev;
+	void *dump_buf;
+
+	mutex_lock(&ctrl->ctrl_lock);
+	/* Release the previous buffers */
+	for (i = 0; i < ctrl->num; i++) {
+		dev_dbg(dev, "%s:pipe(%d):free dump buf(%d):%p\n", __func__,
+			ctrl->pipe_id, i, ctrl->blocks[i].buf);
+		vfree(ctrl->blocks[i].buf);
+		ctrl->blocks[i].buf = NULL;
+	}
+
+	if (num_of_bufs > MTK_CAM_DEBUG_DUMP_MAX_BUF)
+		ctrl->num = MTK_CAM_DEBUG_DUMP_MAX_BUF;
+	else
+		ctrl->num = num_of_bufs;
+
+	for (i = 0; i < ctrl->num; i++) {
+		dump_buf = vzalloc(debug_fs->buf_size);
+		if (!dump_buf)
+			break;
+
+		ctrl_block = &ctrl->blocks[i];
+		atomic_set(&ctrl_block->state, CTRL_BLOCK_STATE_EMPTY);
+		ctrl_block->buf = dump_buf;
+		num_of_alloc++;
+		dev_dbg(dev, "%s:pipe(%d):alloc dump buf(%d):%p\n", __func__,
+			ctrl->pipe_id, i, ctrl->blocks[i].buf);
+	}
+
+	mtk_cam_dump_ctrl_init(debug_fs, ctrl, num_of_alloc);
+	dev_info(dev,
+		 "%s:pipe(%d):cnt(%d), head(%d), tail(%d), entry_sz(%u), entry_num(%d)\n",
+		 __func__, ctrl->pipe_id, ctrl->count, ctrl->head,
+		 ctrl->tail, debug_fs->buf_size, ctrl->num);
+	mutex_unlock(&ctrl->ctrl_lock);
+
+	return 0;
+}
+
+static int dbg_ctrl_open(struct inode *inode, struct file *file)
+{
+	struct mtk_cam_debug_fs *debug_fs;
+	struct mtk_cam_dump_buf_ctrl *ctrl;
+
+	if (inode->i_private)
+		file->private_data = inode->i_private;
+
+	ctrl = file->private_data;
+	debug_fs = ctrl->debug_fs;
+
+	dev_dbg(debug_fs->cam->dev,
+		"%s:pipe(%d):cnt(%d), head(%d), tail(%d), entry_sz(%u), entry_num(%d)\n",
+		__func__, ctrl->pipe_id, ctrl->count, ctrl->head, ctrl->tail,
+		debug_fs->buf_size, ctrl->num);
+
+	return 0;
+}
+
+static ssize_t dbg_ctrl_write(struct file *file, const char __user *data,
+			      size_t count, loff_t *ppos)
+{
+	struct mtk_cam_debug_fs *debug_fs;
+	struct mtk_cam_dump_buf_ctrl *ctrl;
+	char tmp[16];
+	char *parse_str = tmp;
+	char *cmd_str;
+	char *param_str_0;
+	char *param_str_1;
+	unsigned long seq = 0;
+	int ret = -EINVAL;
+
+	ctrl = file->private_data;
+	debug_fs = ctrl->debug_fs;
+	if (count >= 15) {
+		dev_info(ctrl->debug_fs->cam->dev,
+			 "%s:pipe(%d):Invalid cmd sz(%zu)\n", __func__,
+			 ctrl->pipe_id, count);
+		goto FAIL;
+	}
+
+	memset(tmp, 0, 16);
+	if (copy_from_user(tmp, data, count)) {
+		dev_info(ctrl->debug_fs->cam->dev,
+			 "%s:pipe(%d):copy_from_user failed, data(%p), sz(%zu)\n",
+			 __func__, ctrl->pipe_id, data, count);
+		ret = -EFAULT;
+		goto FAIL;
+	}
+	dev_dbg(ctrl->debug_fs->cam->dev, "%s:pipe(%d):received cmd(%s)\n",
+		__func__, ctrl->pipe_id, tmp);
+	cmd_str = strsep(&parse_str, ":");
+	param_str_0 = strsep(&parse_str, ":");
+
+	if (cmd_str[0] == 'r') {
+		param_str_1 = strsep(&parse_str, ":");
+		if (kstrtoul(param_str_1, 10, &seq)) {
+			ret = -EFAULT;
+			dev_dbg(ctrl->debug_fs->cam->dev, "kstrtoul failed:%s\n",
+				param_str_1);
+			goto FAIL;
+		}
+
+		if (param_str_0[0] == 's') {
+			ret = mtk_cam_debug_dump_ctrl_set(ctrl, seq, true);
+			if (ret < 0)
+				goto FAIL;
+		} else if (param_str_0[0] == 'e') {
+			ret = mtk_cam_debug_dump_ctrl_set(ctrl, seq, false);
+			if (ret < 0)
+				goto FAIL;
+		} else {
+			ret = -EFAULT;
+			goto FAIL;
+		}
+	} else if (cmd_str[0] == 'd') {
+		if (param_str_0[0] == 's') {
+			mtk_cam_dump_buf_realloc(ctrl, MTK_CAM_DEBUG_DUMP_MAX_BUF);
+			debug_fs->force_dump = MTK_CAM_REQ_DUMP_FORCE;
+		} else if (param_str_0[0] == 'r') {
+			mtk_cam_dump_ctrl_reinit(ctrl);
+			debug_fs->force_dump = MTK_CAM_REQ_DUMP_FORCE;
+		} else if (param_str_0[0] == 'e') {
+			debug_fs->force_dump = 0;
+			mtk_cam_dump_buf_realloc(ctrl, 0);
+		} else {
+			ret = -EFAULT;
+			goto FAIL;
+		}
+	}
+
+	return count;
+FAIL:
+	return ret;
+}
+
+static int dbg_data_open(struct inode *inode, struct file *file)
+{
+	struct mtk_cam_debug_fs *debug_fs;
+	struct mtk_cam_dump_buf_ctrl *ctrl;
+
+	if (inode->i_private)
+		file->private_data = inode->i_private;
+
+	ctrl = file->private_data;
+	debug_fs = ctrl->debug_fs;
+
+	dev_dbg(debug_fs->cam->dev,
+		"%s:pipe(%d):cnt(%d), head(%d), tail(%d), entry_sz(%u), entry_num(%d)\n",
+		__func__, ctrl->pipe_id, ctrl->count, ctrl->head, ctrl->tail,
+		debug_fs->buf_size, ctrl->num);
+
+	return 0;
+}
+
+static ssize_t dbg_data_read(struct file *file, char __user *user_buf,
+			     size_t count, loff_t *ppos)
+{
+	struct mtk_cam_dump_buf_ctrl *ctrl = file->private_data;
+	struct mtk_cam_debug_fs *debug_fs = ctrl->debug_fs;
+	struct mtk_cam_dump_ctrl_block *ctrl_block;
+
+	int cur_read = 0;
+	size_t read_count;
+
+	cur_read = ctrl->cur_read;
+	if (cur_read < 0) {
+		dev_dbg(debug_fs->cam->dev,
+			"%s:pipe(%d):user requested seq not found! cur_read(%d)\n",
+			__func__, ctrl->pipe_id, cur_read);
+		return 0;
+	}
+
+	ctrl_block = &ctrl->blocks[cur_read];
+	if (atomic_read(&ctrl_block->state) != CTRL_BLOCK_STATE_READ)
+		return 0;
+
+	dev_dbg(debug_fs->cam->dev,
+		"%s:pipe(%d):read buf request: %zu bytes\n", __func__,
+		ctrl->pipe_id, count);
+	read_count = simple_read_from_buffer(user_buf, count, ppos,
+					     ctrl_block->buf,
+					     debug_fs->buf_size);
+
+	return read_count;
+}
+
+static int mtk_cam_debug_has_exp_dump(struct mtk_cam_debug_fs *debug_fs)
+{
+	return (atomic_read(&debug_fs->exp_dump_state) == CAMSYS_DUMP_SATATE_READY);
+}
+
+static int exp_open(struct inode *inode, struct file *file)
+{
+	if (inode->i_private)
+		file->private_data = inode->i_private;
+
+	return 0;
+}
+
+static ssize_t exp_read(struct file *file, char __user *user_buf,
+			size_t count, loff_t *ppos)
+{
+	struct device *dev = file->private_data;
+	struct mtk_cam_device *cam;
+	struct mtk_cam_debug_fs *debug_fs;
+	size_t read_count;
+
+	if (!dev) {
+		pr_debug("%s: dev can't be null\n", __func__);
+		return 0;
+	}
+
+	cam = (struct mtk_cam_device *)dev_get_drvdata(dev);
+	if (!cam) {
+		dev_dbg(dev, "%s: cam can't be null\n", __func__);
+		return 0;
+	}
+
+	debug_fs = cam->debug_fs;
+	if (!debug_fs) {
+		dev_dbg(dev, "%s: debug_fs can't be null\n", __func__);
+		return 0;
+	}
+
+	if (!debug_fs->exp_dump_buf) {
+		dev_dbg(dev, "%s: dump buf can't be null\n", __func__);
+		return 0;
+	}
+
+	/* If no dump, return 0 byte read directly */
+	if (!mtk_cam_debug_has_exp_dump(debug_fs))
+		return 0;
+
+	dev_dbg(dev, "%s: read buf request: %zu bytes\n", __func__, count);
+	mutex_lock(&debug_fs->exp_dump_buf_lock);
+
+	read_count = simple_read_from_buffer(user_buf, count, ppos,
+					     debug_fs->exp_dump_buf,
+					     debug_fs->buf_size);
+
+	mutex_unlock(&debug_fs->exp_dump_buf_lock);
+
+	return read_count;
+}
+
+static int exp_release(struct inode *inode, struct file *file)
+{
+	struct device *dev;
+	struct mtk_cam_device *cam;
+	struct mtk_cam_debug_fs *debug_fs;
+
+	dev = file->private_data;
+	if (!dev) {
+		pr_debug("%s: dev is NULL", __func__);
+		return 0;
+	}
+
+	cam = (struct mtk_cam_device *)dev_get_drvdata(dev);
+	if (!cam) {
+		dev_dbg(dev, "%s: cam is NULL", __func__);
+		return 0;
+	}
+
+	debug_fs = cam->debug_fs;
+	dev_dbg(dev, "%s dump_state: %d\n", __func__,
+		atomic_read(&debug_fs->exp_dump_state));
+
+	return 0;
+}
+
+static const struct file_operations dbg_ctrl_fops = {
+	.open = dbg_ctrl_open,
+	.write = dbg_ctrl_write,
+};
+
+static const struct file_operations dbg_data_fops = {
+	.open = dbg_data_open,
+	.read = dbg_data_read,
+	.llseek = default_llseek,
+};
+
+static const struct file_operations exp_fops = {
+	.open = exp_open,
+	.read = exp_read,
+	.release = exp_release,
+};
+
+static int mtk_cam_exp_reinit(struct mtk_cam_debug_fs *debug_fs)
+{
+	/* Let the exception dump buffer can be written again */
+	mutex_lock(&debug_fs->exp_dump_buf_lock);
+	atomic_set(&debug_fs->exp_dump_state, CAMSYS_DUMP_SATATE_INIT);
+	mutex_unlock(&debug_fs->exp_dump_buf_lock);
+	return 0;
+}
+
+static int mtk_cam_debug_reinit(struct mtk_cam_debug_fs *debug_fs,
+				int streaming_id)
+{
+	struct mtk_cam_dump_buf_ctrl *ctrl;
+
+	if (!debug_fs->force_dump)
+		return 0;
+
+	ctrl = &debug_fs->ctrl[streaming_id];
+	mtk_cam_dump_ctrl_reinit(ctrl);
+
+	return 0;
+}
+
+static int mtk_cam_debug_init(struct mtk_cam_debug_fs *debug_fs,
+			      struct mtk_cam_device *cam, u32 content_size)
+{
+	struct mtk_cam_dump_buf_ctrl *ctrl;
+	void *exp_dump_buf;
+	int i;
+	u32 dump_mem_size;
+
+	dump_mem_size = content_size + sizeof(struct mtk_cam_dump_header);
+	debug_fs->cam = cam;
+	debug_fs->buf_size = dump_mem_size;
+
+	/* Exception dump initialization*/
+	exp_dump_buf = kzalloc(dump_mem_size, GFP_KERNEL);
+	if (!exp_dump_buf)
+		return -ENOMEM;
+
+	debug_fs->exp_dump_buf = exp_dump_buf;
+	atomic_set(&debug_fs->exp_dump_state, CAMSYS_DUMP_SATATE_INIT);
+	mutex_init(&debug_fs->exp_dump_buf_lock);
+
+	debug_fs->exp_dump_entry = debugfs_create_file("mtk_cam_exp_dump",
+						       0440, NULL, cam->dev,
+						       &exp_fops);
+	if (!debug_fs->exp_dump_entry) {
+		dev_err(cam->dev, "Can't create debug fs\n");
+		return -ENOMEM;
+	}
+
+	debug_fs->dbg_entry = debugfs_create_dir("mtk_cam_dbg", NULL);
+	for (i = 0; i < cam->max_stream_num; i++) {
+		char name[4];
+
+		ctrl = &debug_fs->ctrl[i];
+		ctrl->pipe_id = i;
+		ctrl->debug_fs = debug_fs;
+		atomic_set(&ctrl->dump_state, CAMSYS_DUMP_SATATE_INIT);
+		mutex_init(&ctrl->ctrl_lock);
+
+		snprintf(name, 4, "%d", i);
+		ctrl->dir_entry = debugfs_create_dir(name, debug_fs->dbg_entry);
+		if (!ctrl->dir_entry) {
+			dev_err(cam->dev, "Can't create dir for pipe:%d\n", i);
+			return -ENOMEM;
+		}
+
+		ctrl->ctrl_entry = debugfs_create_file("ctrl", 0640,
+						       ctrl->dir_entry, ctrl,
+						       &dbg_ctrl_fops);
+		if (!ctrl->ctrl_entry) {
+			dev_err(cam->dev,
+				"Can't create ctrl file for pipe:%d\n", i);
+			return -ENOMEM;
+		}
+
+		ctrl->data_entry = debugfs_create_file("data", 0440,
+						       ctrl->dir_entry, ctrl,
+						       &dbg_data_fops);
+		if (!ctrl->data_entry) {
+			dev_err(cam->dev,
+				"Can't create data file for pipe:%d\n", i);
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static void mtk_cam_debug_deinit(struct mtk_cam_debug_fs *debug_fs)
+{
+	struct mtk_cam_dump_buf_ctrl *ctrl;
+	int i;
+
+	if (!debug_fs)
+		return;
+
+	for (i = 0; i < debug_fs->cam->max_stream_num; i++) {
+		ctrl = &debug_fs->ctrl[i];
+		debugfs_remove(ctrl->ctrl_entry);
+		debugfs_remove(ctrl->data_entry);
+		debugfs_remove(ctrl->dir_entry);
+	}
+
+	debugfs_remove(debug_fs->dbg_entry);
+	kfree(debug_fs->exp_dump_buf);
+	dev_dbg(debug_fs->cam->dev, "Free exception dump buffer\n");
+	debugfs_remove(debug_fs->exp_dump_entry);
+}
+
+static void mtk_cam_debug_dump_work(struct work_struct *work)
+{
+	struct mtk_cam_req_dbg_work *dbg_work = to_mtk_cam_req_dbg_work(work);
+	struct mtk_cam_request_stream_data *s_data = dbg_work->s_data;
+	struct mtk_cam_ctx *ctx = mtk_cam_s_data_get_ctx(s_data);
+	struct mtk_cam_dump_param dump_param;
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_REQUEST_DUMPED,
+	};
+	int ret = 0;
+
+	ret = mtk_cam_debug_init_dump_param(ctx, &dump_param, s_data,
+					    dbg_work->desc);
+	if (ret < 0) {
+		atomic_set(&dbg_work->state, MTK_CAM_REQ_DBGWORK_S_FINISHED);
+		return;
+	}
+
+	ctx->cam->debug_fs->ops->dump(ctx->cam->debug_fs, &dump_param);
+	atomic_set(&dbg_work->state, MTK_CAM_REQ_DBGWORK_S_FINISHED);
+
+	event.u.frame_sync.frame_sequence = dump_param.sequence;
+	v4l2_event_queue(ctx->pipe->subdev.devnode, &event);
+}
+
+#define EXCEPT_DUMP_SIZE	128
+static void mtk_cam_exception_work(struct work_struct *work)
+{
+	struct mtk_cam_req_dbg_work *dbg_work = to_mtk_cam_req_dbg_work(work);
+	struct mtk_cam_request_stream_data *s_data = dbg_work->s_data;
+	struct mtk_cam_request *req = mtk_cam_s_data_get_req(s_data);
+	struct mtk_cam_ctx *ctx = mtk_cam_s_data_get_ctx(s_data);
+	struct mtk_cam_dump_param dump_param;
+	char warn_desc[EXCEPT_DUMP_SIZE];
+	char title_desc[EXCEPT_DUMP_SIZE];
+	int ret = 0;
+
+	if (!s_data)
+		return;
+
+	if (atomic_read(&s_data->dbg_exception_work.state) == MTK_CAM_REQ_DBGWORK_S_CANCEL) {
+		dev_info(ctx->cam->dev,
+			 "%s:ctx(%d):used_raw(0x%x):exception dump canceled\n",
+			 __func__, ctx->stream_id, ctx->used_raw_dev);
+		return;
+	}
+
+	ret = mtk_cam_debug_init_dump_param(ctx, &dump_param, s_data,
+					    dbg_work->desc);
+
+	if (ret < 0) {
+		atomic_set(&dbg_work->state, MTK_CAM_REQ_DBGWORK_S_FINISHED);
+		return;
+	}
+
+	ctx->cam->debug_fs->ops->exp_dump(ctx->cam->debug_fs, &dump_param);
+	snprintf(title_desc, EXCEPT_DUMP_SIZE, "Camsys:%s", dbg_work->desc);
+	snprintf(warn_desc, EXCEPT_DUMP_SIZE, "%s:ctx(%d):req(%d):%s",
+		 req->req.debug_str, ctx->stream_id, s_data->frame_seq_no,
+		 dbg_work->desc);
+	dev_info(ctx->cam->dev, "%s:camsys dump, %s\n",
+		 __func__, warn_desc);
+
+	WARN_ON(1);
+
+	atomic_set(&dbg_work->state, MTK_CAM_REQ_DBGWORK_S_FINISHED);
+}
+
+static bool
+mtk_cam_exceptoin_is_job_done(struct mtk_cam_request_stream_data *s_data,
+			      bool *streamoff)
+{
+	struct mtk_cam_ctx *ctx = mtk_cam_s_data_get_ctx(s_data);
+	int state;
+
+	spin_lock(&ctx->streaming_lock);
+	if (!ctx->streaming) {
+		spin_unlock(&ctx->streaming_lock);
+		*streamoff = true;
+		return true;
+	}
+	spin_unlock(&ctx->streaming_lock);
+
+	state = atomic_read(&s_data->dbg_exception_work.state);
+	if (state == MTK_CAM_REQ_DBGWORK_S_FINISHED ||
+	    state == MTK_CAM_REQ_DBGWORK_S_INIT ||
+	    state == MTK_CAM_REQ_DBGWORK_S_CANCEL) {
+		*streamoff = false;
+		return true;
+	}
+
+	return false;
+}
+
+static void mtk_cam_exceptoin_detect_work(struct work_struct *work)
+{
+	struct mtk_cam_req_dbg_work *dbg_work = to_mtk_cam_req_dbg_work(work);
+	struct mtk_cam_request_stream_data *s_data = dbg_work->s_data;
+	struct mtk_cam_request *req = mtk_cam_s_data_get_req(s_data);
+	struct mtk_cam_ctx *ctx = mtk_cam_s_data_get_ctx(s_data);
+	int ret;
+	bool streamoff = false;
+
+	ret = wait_event_freezable_timeout(ctx->cam->debug_exception_waitq,
+					   mtk_cam_exceptoin_is_job_done(s_data, &streamoff),
+					   msecs_to_jiffies(1000 / 30 * 8));
+	if (ret) {
+		if (!streamoff) {
+			dev_info(ctx->cam->dev,
+				 "%s:ctx(%d):%s:req(%d):skip dump since job done\n",
+				 __func__, ctx->stream_id, req->req.debug_str,
+				 s_data->frame_seq_no);
+			atomic_set(&dbg_work->state, MTK_CAM_REQ_DBGWORK_S_FINISHED);
+		} else {
+			/**
+			 * Workaround for abnormal request release after
+			 * streaming off now, we can't touch the request
+			 * any more.
+			 */
+			dev_info(ctx->cam->dev,
+				 "%s: skip dump work for stream off ctx:%d\n",
+				 __func__, ctx->stream_id);
+		}
+		return;
+	}
+
+	if (atomic_read(&s_data->dbg_exception_work.state) == MTK_CAM_REQ_DBGWORK_S_CANCEL) {
+		dev_info(ctx->cam->dev,
+			 "%s:ctx(%d):used_raw(0x%x):exception dump canceled\n",
+			 __func__, ctx->stream_id, ctx->used_raw_dev);
+		return;
+	}
+
+	if (ctx->seninf) {
+		ret = mtk_cam_seninf_dump(ctx->seninf);
+		dev_info(ctx->cam->dev,
+			 "%s:ctx(%d):used_raw(0x%x):mtk_cam_seninf_dump() ret=%d\n",
+			 __func__, ctx->stream_id, ctx->used_raw_dev, ret);
+	} else {
+		dev_info(ctx->cam->dev, "%s: cannot find ctx->seninf\n",
+			 __func__);
+	}
+
+	mtk_cam_exception_work(work);
+}
+
+int mtk_cam_req_dump(struct mtk_cam_request_stream_data *s_data,
+		     unsigned int dump_flag, char *desc, bool smi_dump)
+{
+	struct mtk_cam_ctx *ctx = mtk_cam_s_data_get_ctx(s_data);
+	struct mtk_cam_req_dbg_work *dbg_work;
+	void (*work_func)(struct work_struct *work);
+	struct workqueue_struct *wq;
+
+	if (!ctx->cam->debug_fs)
+		return false;
+
+	switch (dump_flag) {
+	case MTK_CAM_REQ_DUMP_FORCE:
+		if (!ctx->cam->debug_fs->force_dump ||
+		    !ctx->cam->debug_fs->ctrl[ctx->stream_id].num)
+			return false;
+
+		dbg_work = &s_data->dbg_work;
+		work_func = mtk_cam_debug_dump_work;
+		wq = ctx->cam->debug_wq;
+		break;
+	case MTK_CAM_REQ_DUMP_DEQUEUE_FAILED:
+		dbg_work =  &s_data->dbg_exception_work;
+		work_func = mtk_cam_exception_work;
+		wq = ctx->cam->debug_exception_wq;
+		break;
+	case MTK_CAM_REQ_DUMP_CHK_DEQUEUE_FAILED:
+		dbg_work =  &s_data->dbg_exception_work;
+		work_func = mtk_cam_exceptoin_detect_work;
+		wq = ctx->cam->debug_exception_wq;
+		break;
+	default:
+		dev_dbg(ctx->cam->dev,
+			"%s:seq(%d) dump skipped, unknown dump type (%d)\n",
+			__func__, s_data->frame_seq_no,
+			dump_flag);
+		return false;
+	}
+
+	if (atomic_read(&dbg_work->state) != MTK_CAM_REQ_DBGWORK_S_INIT)
+		return false;
+
+	INIT_WORK(&dbg_work->work, work_func);
+	dbg_work->s_data = s_data;
+	dbg_work->dump_flags = dump_flag;
+	dbg_work->smi_dump = smi_dump;
+	atomic_set(&dbg_work->state, MTK_CAM_REQ_DBGWORK_S_PREPARED);
+	snprintf(dbg_work->desc, MTK_CAM_DEBUG_DUMP_DESC_SIZE - 1, desc);
+	if (!queue_work(wq, &dbg_work->work)) {
+		dev_dbg(ctx->cam->dev,
+			"%s: seq(%d) failed, debug work is already in queue\n",
+			__func__, s_data->frame_seq_no);
+		return false;
+	}
+
+	return true;
+}
+
+void
+mtk_cam_debug_detect_dequeue_failed(struct mtk_cam_request_stream_data *s_data,
+				    const unsigned int frame_no_update_limit,
+				    struct mtk_camsys_irq_info *irq_info,
+				    struct mtk_raw_device *raw_dev)
+{
+#define NO_P1_DONE_DEBUG_START 3
+
+	struct mtk_cam_ctx *ctx;
+	struct mtk_cam_request *req;
+
+	if (irq_info->fbc_cnt == 0)
+		return;
+	/**
+	 * If the requset is already dequeued (for example, the p1 done and
+	 * sof interrupt come almost together), skip the check.
+	 */
+	if (!s_data)
+		return;
+
+	ctx = mtk_cam_s_data_get_ctx(s_data);
+	req = mtk_cam_s_data_get_req(s_data);
+
+	if (ctx->composed_frame_seq_no < ctx->dequeued_frame_seq_no)
+		return;
+
+	if (s_data->state.estate == E_STATE_CQ ||
+	    s_data->state.estate == E_STATE_OUTER ||
+	    s_data->state.estate == E_STATE_INNER ||
+	    s_data->state.estate == E_STATE_OUTER_HW_DELAY ||
+	    s_data->state.estate == E_STATE_INNER_HW_DELAY) {
+		s_data->no_frame_done_cnt++;
+		if (s_data->no_frame_done_cnt > 1)
+			dev_info(ctx->cam->dev,
+				 "%s:SOF[ctx:%d-#%d] no p1 done for %d sofs, FBC_CNT %d dump req(%d) state(%d) ts(%llu)\n",
+				 req->req.debug_str, ctx->stream_id,
+				 ctx->dequeued_frame_seq_no,
+				 s_data->no_frame_done_cnt, irq_info->fbc_cnt,
+				 s_data->frame_seq_no, s_data->state.estate,
+				 irq_info->ts_ns);
+	}
+	if (s_data->no_frame_done_cnt >= NO_P1_DONE_DEBUG_START) {
+		dev_info(raw_dev->dev,
+			 "INT_EN %x\n",
+			 readl_relaxed(raw_dev->base + REG_CTL_RAW_INT_EN));
+
+		dev_info(raw_dev->dev,
+			 "REQ RAW/2/3 DMA/2:%08x/%08x/%08x/%08x/%08x\n",
+			 readl_relaxed(raw_dev->base + REG_CTL_RAW_MOD_REQ_STAT),
+			 readl_relaxed(raw_dev->base + REG_CTL_RAW_MOD2_REQ_STAT),
+			 readl_relaxed(raw_dev->base + REG_CTL_RAW_MOD3_REQ_STAT),
+			 readl_relaxed(raw_dev->base + REG_CTL_RAW_MOD5_REQ_STAT),
+			 readl_relaxed(raw_dev->base + REG_CTL_RAW_MOD6_REQ_STAT));
+		dev_info(raw_dev->dev,
+			 "RDY RAW/2/3 DMA/2:%08x/%08x/%08x/%08x/%08x\n",
+			 readl_relaxed(raw_dev->base + REG_CTL_RAW_MOD_RDY_STAT),
+			 readl_relaxed(raw_dev->base + REG_CTL_RAW_MOD2_RDY_STAT),
+			 readl_relaxed(raw_dev->base + REG_CTL_RAW_MOD3_RDY_STAT),
+			 readl_relaxed(raw_dev->base + REG_CTL_RAW_MOD5_RDY_STAT),
+			 readl_relaxed(raw_dev->base + REG_CTL_RAW_MOD6_RDY_STAT));
+		dev_info(raw_dev->dev,
+			 "REQ YUV/2/3/4 WDMA:%08x/%08x/%08x/%08x/%08x\n",
+			 readl_relaxed(raw_dev->yuv_base + REG_CTL_RAW_MOD_REQ_STAT),
+			 readl_relaxed(raw_dev->yuv_base + REG_CTL_RAW_MOD2_REQ_STAT),
+			 readl_relaxed(raw_dev->yuv_base + REG_CTL_RAW_MOD3_REQ_STAT),
+			 readl_relaxed(raw_dev->yuv_base + REG_CTL_RAW_MOD4_REQ_STAT),
+			 readl_relaxed(raw_dev->yuv_base + REG_CTL_RAW_MOD5_REQ_STAT));
+		dev_info(raw_dev->dev,
+			 "RDY YUV/2/3/4 WDMA:%08x/%08x/%08x/%08x/%08x\n",
+			 readl_relaxed(raw_dev->yuv_base + REG_CTL_RAW_MOD_RDY_STAT),
+			 readl_relaxed(raw_dev->yuv_base + REG_CTL_RAW_MOD2_RDY_STAT),
+			 readl_relaxed(raw_dev->yuv_base + REG_CTL_RAW_MOD3_RDY_STAT),
+			 readl_relaxed(raw_dev->yuv_base + REG_CTL_RAW_MOD4_RDY_STAT),
+			 readl_relaxed(raw_dev->yuv_base + REG_CTL_RAW_MOD5_RDY_STAT));
+	}
+
+	if (s_data->no_frame_done_cnt > frame_no_update_limit &&
+	    s_data->dbg_work.dump_flags == 0) {
+		dev_info(ctx->cam->dev,
+			 "%s:SOF[ctx:%d-#%d] no p1 done for %d sofs, FBC_CNT %d dump req(%d) state(%d) ts(%llu)\n",
+			 req->req.debug_str, ctx->stream_id,
+			 ctx->dequeued_frame_seq_no,
+			 s_data->no_frame_done_cnt, irq_info->fbc_cnt,
+			 s_data->frame_seq_no,
+			 s_data->state.estate, irq_info->ts_ns);
+		mtk_cam_req_dump(s_data, MTK_CAM_REQ_DUMP_DEQUEUE_FAILED,
+				 "No P1 done", false);
+	} else if (s_data->no_frame_done_cnt > frame_no_update_limit &&
+		s_data->dbg_work.dump_flags != 0) {
+		dev_info(ctx->cam->dev,
+			 "%s:SOF[ctx:%d-#%d] no p1 done for %d sofs, s_data->dbg_work.dump_flags(%d) state(%d) ts(%llu)\n",
+			 req->req.debug_str, ctx->stream_id,
+			 ctx->dequeued_frame_seq_no,
+			 s_data->no_frame_done_cnt, s_data->dbg_work.dump_flags,
+			 s_data->state.estate, irq_info->ts_ns);
+	}
+}
+
+void mtk_cam_debug_wakeup(struct wait_queue_head *wq_head)
+{
+	wake_up(wq_head);
+}
+
+static void mtk_cam_req_seninf_dump_work(struct work_struct *work)
+{
+	struct mtk_cam_seninf_dump_work *seninf_dump_work;
+	struct v4l2_subdev *seninf;
+
+	seninf_dump_work = to_mtk_cam_seninf_dump_work(work);
+	seninf = seninf_dump_work->seninf;
+	if (!seninf)
+		pr_info("%s: filaed, seninf can't be NULL\n", __func__);
+	else
+		mtk_cam_seninf_dump(seninf);
+
+	kfree(seninf_dump_work);
+}
+
+void
+mtk_cam_debug_seninf_dump(struct mtk_cam_request_stream_data *s_data)
+{
+	struct mtk_cam_ctx *ctx;
+	struct mtk_cam_seninf_dump_work *dump_work;
+
+	ctx = mtk_cam_s_data_get_ctx(s_data);
+	if (!ctx) {
+		pr_info("%s: failed, ctx can't be NULL\n", __func__);
+		return;
+	}
+
+	spin_lock(&ctx->streaming_lock);
+	if (!ctx->streaming) {
+		dev_info(ctx->cam->dev,
+			 "%s:ctx(%d):s_data(%d) drop dump due to stream off\n",
+			 __func__, ctx->stream_id, s_data->frame_seq_no);
+		spin_unlock(&ctx->streaming_lock);
+		return;
+	}
+	spin_unlock(&ctx->streaming_lock);
+
+	if (atomic_read(&s_data->seninf_dump_state) != MTK_CAM_REQ_DBGWORK_S_INIT) {
+		dev_info(ctx->cam->dev,
+			 "%s:ctx(%d):s_data(%d) drop duplicated dump\n",
+			 __func__, ctx->stream_id, s_data->frame_seq_no);
+
+		return;
+	}
+
+	dump_work = kmalloc(sizeof(*dump_work), GFP_ATOMIC);
+	if (!dump_work)
+		return;
+
+	dump_work->seninf = ctx->seninf;
+	INIT_WORK(&dump_work->work, mtk_cam_req_seninf_dump_work);
+	if (!queue_work(ctx->frame_done_wq, &dump_work->work))
+		dev_info(ctx->cam->dev,
+			 "%s:ctx(%d):s_data(%d) work was already on a queue\n",
+			 __func__, ctx->stream_id, s_data->frame_seq_no);
+	else
+		atomic_set(&s_data->seninf_dump_state, MTK_CAM_REQ_DBGWORK_S_FINISHED);
+}
+
+void mtk_cam_req_dump_work_init(struct mtk_cam_request_stream_data *s_data)
+{
+	atomic_set(&s_data->seninf_dump_state, MTK_CAM_REQ_DBGWORK_S_INIT);
+}
+
+void mtk_cam_req_dbg_works_clean(struct mtk_cam_request_stream_data *s_data)
+{
+	struct mtk_cam_ctx *ctx = mtk_cam_s_data_get_ctx(s_data);
+	char *dbg_str = mtk_cam_s_data_get_dbg_str(s_data);
+	int state;
+	u64 start, cost;
+
+	/* clean seninf dump work */
+	atomic_set(&s_data->seninf_dump_state, MTK_CAM_REQ_DBGWORK_S_FINISHED);
+
+	/* clean execption dump work */
+	state = atomic_read(&s_data->dbg_exception_work.state);
+	if (state != MTK_CAM_REQ_DBGWORK_S_INIT &&
+	    state != MTK_CAM_REQ_DBGWORK_S_FINISHED) {
+		atomic_set(&s_data->dbg_exception_work.state, MTK_CAM_REQ_DBGWORK_S_CANCEL);
+		mtk_cam_debug_wakeup(&ctx->cam->debug_exception_waitq);
+		start = ktime_get_boottime_ns();
+		cancel_work_sync(&s_data->dbg_exception_work.work);
+		cost = ktime_get_boottime_ns() - start;
+
+		dev_info(ctx->cam->dev,
+			 "%s:ctx(%d):%s:seq(%d): cancel dbg_exception_work(%d), wait: %llu ns\n",
+			 __func__, ctx->stream_id, dbg_str,
+			 s_data->frame_seq_no, state, cost);
+		atomic_set(&s_data->dbg_exception_work.state, MTK_CAM_REQ_DBGWORK_S_FINISHED);
+	} else {
+		mtk_cam_debug_wakeup(&ctx->cam->debug_exception_waitq);
+		atomic_set(&s_data->dbg_exception_work.state, MTK_CAM_REQ_DBGWORK_S_FINISHED);
+	}
+
+	/* clean debug dump work */
+	state = atomic_read(&s_data->dbg_work.state);
+	if (state != MTK_CAM_REQ_DBGWORK_S_INIT &&
+	    state != MTK_CAM_REQ_DBGWORK_S_FINISHED) {
+		start = ktime_get_boottime_ns();
+		cancel_work_sync(&s_data->dbg_work.work);
+		cost = ktime_get_boottime_ns() - start;
+		dev_info(ctx->cam->dev,
+			 "%s:ctx(%d):%s:seq(%d): cancel dbg_work(%d), wait: %llu ns\n",
+			  __func__, ctx->stream_id, dbg_str,
+			 s_data->frame_seq_no, state, cost);
+		atomic_set(&s_data->dbg_work.state, MTK_CAM_REQ_DBGWORK_S_FINISHED);
+	}
+}
+
+static struct mtk_cam_debug_ops debug_ops = {
+	.init = mtk_cam_debug_init,
+	.reinit = mtk_cam_debug_reinit,
+	.deinit = mtk_cam_debug_deinit,
+	.dump = mtk_cam_debug_dump,
+	.exp_reinit = mtk_cam_exp_reinit,
+	.exp_dump = mtk_cam_debug_exp_dump,
+};
+
+static struct mtk_cam_debug_fs debug_fs = {
+	.ops = &debug_ops,
+};
+
+struct mtk_cam_debug_fs *mtk_cam_get_debugfs(void)
+{
+	return &debug_fs;
+}
+
+#endif /* CONFIG_DEBUG_FS */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.h
new file mode 100644
index 000000000000..91e695ff2e76
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.h
@@ -0,0 +1,273 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_DEBUG__
+#define __MTK_CAM_DEBUG__
+
+#include <linux/debugfs.h>
+
+struct mtk_cam_device;
+struct mtk_cam_dump_param;
+struct mtk_raw_device;
+struct mtk_cam_request;
+struct mtk_cam_request_stream_data;
+struct mtk_cam_debug_fs;
+
+#define MTK_CAM_DEBUG_DUMP_MAX_BUF		(33 * 5)
+#define MTK_CAM_DEBUG_DUMP_DESC_SIZE		64
+#define MTK_CAM_DEBUG_DUMP_HEADER_MAX_SIZE	0x1000
+
+/* Force dump by user */
+#define MTK_CAM_REQ_DUMP_FORCE			BIT(0)
+/* Triggered when dequeue failed */
+#define MTK_CAM_REQ_DUMP_DEQUEUE_FAILED		BIT(1)
+/**
+ * Triggered when SOF may not come aganin. In this
+ * case, we will check if the request's state is
+ * still the same as the original one and start the
+ * dump if the state does not change.
+ */
+#define MTK_CAM_REQ_DUMP_CHK_DEQUEUE_FAILED	BIT(2)
+#define MTK_CAM_REQ_DBGWORK_S_INIT		0
+#define MTK_CAM_REQ_DBGWORK_S_PREPARED		1
+#define MTK_CAM_REQ_DBGWORK_S_FINISHED		2
+#define MTK_CAM_REQ_DBGWORK_S_CANCEL		3
+
+struct mtk_cam_dump_param {
+	/* Common Debug Information*/
+	char *desc;
+	u32 request_fd;
+	u32 stream_id;
+	u64 timestamp;
+	u32 sequence;
+
+	/* CQ dump */
+	void *cq_cpu_addr;
+	u32 cq_size;
+	u64 cq_iova;
+	u32 cq_desc_offset;
+	u32 cq_desc_size;
+	u32 sub_cq_desc_offset;
+	u32 sub_cq_desc_size;
+
+	/* meta in */
+	void *meta_in_cpu_addr;
+	u32 meta_in_dump_buf_size;
+	u64 meta_in_iova;
+
+	/* meta out 0 */
+	void *meta_out_0_cpu_addr;
+	u32 meta_out_0_dump_buf_size;
+	u64 meta_out_0_iova;
+
+	/* meta out 1 */
+	void *meta_out_1_cpu_addr;
+	u32 meta_out_1_dump_buf_size;
+	u64 meta_out_1_iova;
+
+	/* meta out 2 */
+	void *meta_out_2_cpu_addr;
+	u32 meta_out_2_dump_buf_size;
+	u64 meta_out_2_iova;
+
+	/* ipi frame param */
+	struct mtkcam_ipi_frame_param *frame_params;
+	u32 frame_param_size;
+
+	/* ipi config param */
+	struct mtkcam_ipi_config_param *config_params;
+	u32 config_param_size;
+};
+
+struct mtk_cam_req_dump_work {
+	struct work_struct work;
+	atomic_t state;
+	unsigned int dump_flags;
+};
+
+struct mtk_cam_seninf_dump_work {
+	struct work_struct work;
+	struct v4l2_subdev *seninf;
+};
+
+struct mtk_cam_req_dbg_work {
+	struct work_struct work;
+	struct mtk_cam_request_stream_data *s_data;
+	atomic_t state;
+	unsigned int dump_flags;
+	int buffer_state;
+	char desc[MTK_CAM_DEBUG_DUMP_DESC_SIZE];
+	bool smi_dump;
+};
+
+struct mtk_cam_dump_header {
+	/* Common Debug Information*/
+	u8	desc[MTK_CAM_DEBUG_DUMP_DESC_SIZE];
+	u32	request_fd;
+	u32	stream_id;
+	u64	timestamp;
+	u32	sequence;
+	u32	header_size;
+	u32	payload_offset;
+	u32	payload_size;
+
+	/* meta file information */
+	u32	meta_version_major;
+	u32	meta_version_minor;
+
+	/* CQ dump */
+	u32	cq_dump_buf_offset;
+	u32	cq_size;
+	u64	cq_iova;
+	u32	cq_desc_offset;
+	u32	cq_desc_size;
+	u32	sub_cq_desc_offset;
+	u32	sub_cq_desc_size;
+
+	/* meta in */
+	u32	meta_in_dump_buf_offset;
+	u32	meta_in_dump_buf_size;
+	u64	meta_in_iova;
+
+	/* meta out 0 */
+	u32	meta_out_0_dump_buf_offset;
+	u32	meta_out_0_dump_buf_size;
+	u64	meta_out_0_iova;
+
+	/* meta out 1 */
+	u32	meta_out_1_dump_buf_offset;
+	u32	meta_out_1_dump_buf_size;
+	u64	meta_out_1_iova;
+
+	/* meta out 2 */
+	u32	meta_out_2_dump_buf_offset;
+	u32	meta_out_2_dump_buf_size;
+	u64	meta_out_2_iova;
+
+	/* status dump */
+	u32	status_dump_offset;
+	u32	status_dump_size;
+
+	/* ipi frame param */
+	u32	frame_dump_offset;
+	u32	frame_dump_size;
+
+	/* ipi config param */
+	u32	config_dump_offset;
+	u32	config_dump_size;
+	u32	used_stream_num;
+};
+
+struct mtk_cam_dump_ctrl_block {
+	atomic_t state;
+	void *buf;
+};
+
+struct mtk_cam_dump_buf_ctrl {
+	int pipe_id;
+	struct mtk_cam_debug_fs *debug_fs;
+	struct mtk_cam_dump_ctrl_block blocks[MTK_CAM_DEBUG_DUMP_MAX_BUF];
+	struct dentry *dir_entry;
+	struct dentry *ctrl_entry;
+	struct dentry *data_entry;
+	struct mutex ctrl_lock; /* protect blocks */
+	int head;
+	int tail;
+	int num;
+	int count;
+	int cur_read;
+	atomic_t dump_state;
+	struct dentry *dump_entry;
+};
+
+struct mtk_cam_debug_ops {
+	int (*init)(struct mtk_cam_debug_fs *debug_fs,
+		    struct mtk_cam_device *cam, u32 content_size);
+	int (*dump)(struct mtk_cam_debug_fs *debug_fs,
+		    struct mtk_cam_dump_param *param);
+	int (*exp_dump)(struct mtk_cam_debug_fs *debug_fs,
+			struct mtk_cam_dump_param *param);
+	int (*exp_reinit)(struct mtk_cam_debug_fs *debug_fs);
+	int (*reinit)(struct mtk_cam_debug_fs *debug_fs, int stream_id);
+	void (*deinit)(struct mtk_cam_debug_fs *debug_fs);
+};
+
+struct mtk_cam_debug_fs {
+	struct mtk_cam_device *cam;
+	uint force_dump;
+	void *exp_dump_buf; /* kernel exception dump */
+	atomic_t exp_dump_state;
+	struct mutex exp_dump_buf_lock; /* protect exp_dump_buf */
+	struct dentry *exp_dump_entry;
+	u32 buf_size;
+	struct dentry *dbg_entry;
+	struct mtk_cam_dump_buf_ctrl ctrl[MTKCAM_SUBDEV_MAX];
+	struct mtk_cam_debug_ops *ops;
+};
+
+#ifndef CONFIG_DEBUG_FS
+static inline struct mtk_cam_debug_fs *mtk_cam_get_debugfs(void)
+{
+	return NULL;
+}
+
+static inline int
+mtk_cam_req_dump(struct mtk_cam_request_stream_data *s_data,
+		 unsigned int dump_flag, char *desc, bool smi_dump)
+{
+	return 0;
+}
+
+static inline void
+mtk_cam_debug_detect_dequeue_failed(struct mtk_cam_request_stream_data *s_data,
+				    const unsigned int frame_no_update_limit,
+				    struct mtk_camsys_irq_info *irq_info,
+				    struct mtk_raw_device *raw_dev)
+{
+}
+
+static inline void mtk_cam_debug_wakeup(struct wait_queue_head *wq_head)
+{
+}
+
+static inline void
+mtk_cam_req_dump_work_init(struct mtk_cam_request_stream_data *s_data)
+{
+}
+
+static inline void
+mtk_cam_req_dbg_works_clean(struct mtk_cam_request_stream_data *s_data)
+{
+}
+
+static inline void
+mtk_cam_debug_seninf_dump(struct mtk_cam_request_stream_data *s_data)
+{
+}
+
+#else
+
+struct mtk_cam_debug_fs *mtk_cam_get_debugfs(void);
+
+int mtk_cam_req_dump(struct mtk_cam_request_stream_data *s_data,
+		     unsigned int dump_flag, char *desc, bool smi_dump);
+void
+mtk_cam_debug_detect_dequeue_failed(struct mtk_cam_request_stream_data *s_data,
+				    const unsigned int frame_no_update_limit,
+				    struct mtk_camsys_irq_info *irq_info,
+				    struct mtk_raw_device *raw_dev);
+void mtk_cam_debug_wakeup(struct wait_queue_head *wq_head);
+void mtk_cam_req_dump_work_init(struct mtk_cam_request_stream_data *s_data);
+void mtk_cam_req_dbg_works_clean(struct mtk_cam_request_stream_data *s_data);
+void mtk_cam_debug_seninf_dump(struct mtk_cam_request_stream_data *s_data);
+#endif /* CONFIG_DEBUG_FS */
+
+static inline struct mtk_cam_req_dbg_work *
+to_mtk_cam_req_dbg_work(struct work_struct *__work)
+{
+	return container_of(__work, struct mtk_cam_req_dbg_work, work);
+}
+
+#endif /* __MTK_CAM_DEBUG__ */
-- 
2.18.0

