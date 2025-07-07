Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF439AFBD6E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 23:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48EF10E56A;
	Mon,  7 Jul 2025 21:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="BH2F/Snx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35C310E300
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 01:32:31 +0000 (UTC)
X-UUID: 3ede10725ad211f0b1510d84776b8c0b-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=32eg1xCTEuL1CEe62V7ZpYLRmuNDaQRPGE2A01EwBXI=; 
 b=BH2F/SnxkJU6uFjpLyUD1twxYMs8jhizCOyMV4RZOqToEX15Pgk146ZN7HfOVtpqcHGjLV1fXlGY44jhru7cu6MsNpnWFUiZsw84IPhxfbqsXF+BcqZiHUI63NP7Z4Cr1hpEGwMwa+7h6fplJs5q6Xkt9xroFuJghHajMTQLe7g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:7de560d3-16ef-4dd5-84e3-1fdddb831e7f, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:575c9382-cc21-4267-87cf-e75829fa6365,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3ede10725ad211f0b1510d84776b8c0b-20250707
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <shangyao.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 773160539; Mon, 07 Jul 2025 09:32:29 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:32:27 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:32:27 +0800
From: shangyao lin <shangyao.lin@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Shangyao Lin <shangyao.lin@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 06/13] media: platform: mediatek: add isp_7x state ctrl
Date: Mon, 7 Jul 2025 09:31:47 +0800
Message-ID: <20250707013154.4055874-7-shangyao.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 07 Jul 2025 21:23:55 +0000
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

From: "shangyao.lin" <shangyao.lin@mediatek.com>

Introduce state management and debugging mechanisms for the MediaTek ISP7.x
camsys platform. State management establishes control over ISP operations and
events, defining distinct states for request handling, sensor control, and
frame synchronization, ensuring proper event processing. The debugging
mechanism ensures stable operation and timely data collection during anomalies.

---

Changes in v2:
- Removed mtk_cam-debug.c and mtk_cam-debug.h, along with related code
- Various fixes per review comments

Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
---
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c | 1409 +++++++++++++++++
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h |  131 ++
 2 files changed, 1540 insertions(+)
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h

diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c
new file mode 100755
index 000000000000..15af1eac5444
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c
@@ -0,0 +1,1409 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#include <linux/list.h>
+#include <linux/math64.h>
+#include <linux/of.h>
+#include <linux/videodev2.h>
+#include <linux/hrtimer.h>
+
+#include <media/v4l2-event.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-ioctl.h>
+
+#include "mtk_cam.h"
+#include "mtk_cam-ctrl.h"
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
+	struct mtk_cam_ctx *sync_ctx[MTKCAM_SUBDEV_MAX];
+	int i;
+	u32 ctx_cnt = 0;
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
+	dev_dbg(cam->dev, "%s:%s:target/on/off(%d/%d/%d)\n", __func__,
+		req->req.debug_str, req->fs.target, req->fs.on_cnt,
+		req->fs.off_cnt);
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
+	if (s_data->flags & MTK_CAM_REQ_S_DATA_FLAG_SENSOR_HDL_EN) {
+		v4l2_ctrl_request_setup(&req->req,
+					s_data->sensor->ctrl_handler);
+		time_after_sof =
+			div_u64(ktime_get_boottime_ns(), 1000000) -
+				ctx->sensor_ctrl.sof_time;
+		dev_dbg(cam->dev,
+			"[SOF+%dms] Sensor request:%d[ctx:%d] setup\n",
+			time_after_sof, s_data->frame_seq_no,
+			ctx->stream_id);
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
+	/*for 1st unsync, sensor setting will be set at enque thread*/
+	if (ctx->used_raw_num) {
+		if (ctx->pipe->feature_active == 0 && sensor_seq_no_next <= 2)
+			return;
+	} else {
+		if (sensor_seq_no_next <= 2)
+			return;
+	}
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
+
+			} else if (state_entry->estate <= E_STATE_SENSOR) {
+				spin_unlock(&sensor_ctrl->camsys_state_lock);
+				dev_dbg(ctx->cam->dev,
+					"[%s] wrong state:%d (sensor workqueue delay)\n",
+					__func__, state_entry->estate);
+				return;
+			}
+		} else if (req_stream_data->frame_seq_no ==
+			atomic_read(&sensor_ctrl->sensor_request_seq_no) - 1) {
+			if (state_entry->estate < E_STATE_INNER) {
+				spin_unlock(&sensor_ctrl->camsys_state_lock);
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
+
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
+				     ctx->composed_frame_seq_no, dequeued_frame_seq_no,
+				     irq_info->ts_ns);
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
+			req_stream_data = mtk_cam_ctrl_state_to_req_s_data(current_state);
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
+					       struct mtk_cam_buffer,
+					       list);
+			if (buf->state.estate == E_BUF_STATE_CQ)
+				buf->state.estate = E_BUF_STATE_OUTER;
+			spin_unlock(&ctx->cam->dma_processing_lock);
+			mtk_cam_stream_on(raw_dev, ctx);
+			return;
+		}
+		spin_unlock(&ctx->cam->dma_processing_lock);
+		req_stream_data = mtk_cam_get_req_s_data(ctx, ctx->stream_id, 1);
+		if (!req_stream_data) {
+			dev_err(raw_dev->dev, "Cannot find req stream data with stream_id:%d\n",
+				ctx->stream_id);
+			return;
+		}
+		if (req_stream_data->state.estate >= E_STATE_SENSOR || !ctx->sensor) {
+			mtk_cam_stream_on(raw_dev, ctx);
+		} else {
+			dev_dbg(raw_dev->dev,
+				"[CQD] 1st sensor not set yet, req:%d, state:%d\n",
+				req_stream_data->frame_seq_no, req_stream_data->state.estate);
+		}
+	}
+	/* Legacy CQ done will be always happened at frame done */
+	spin_lock(&sensor_ctrl->camsys_state_lock);
+	list_for_each_entry(state_entry, &sensor_ctrl->camsys_state_list,
+			    state_element) {
+		req_stream_data = mtk_cam_ctrl_state_to_req_s_data(state_entry);
+		if (req_stream_data->frame_seq_no == frame_seq_no_outer) {
+			if (frame_seq_no_outer > atomic_read(&sensor_ctrl->isp_request_seq_no)) {
+				/*
+				 * outer number is 1 more from last SOF's
+				 * inner number
+				 */
+				if (frame_seq_no_outer == 1)
+					state_entry->estate = E_STATE_OUTER;
+				state_transition(state_entry, E_STATE_CQ,
+						 E_STATE_OUTER);
+				state_transition(state_entry, E_STATE_CQ_SCQ_DELAY,
+						 E_STATE_OUTER);
+				state_transition(state_entry, E_STATE_SENINF,
+						 E_STATE_OUTER);
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
+	mtk_cam_handle_frame_done(ctx,
+					req_stream_data->frame_seq_no,
+					req_stream_data->pipe_id);
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
+		dev_err(ctx->cam->dev,
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
+	// update cq done status
+	ctx->cq_done_status |= (1 << pipe_id);
+
+	// check cq done status
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
+		if (mtk_camsys_is_all_cq_done(ctx, ctx->pipe->id))
+				mtk_camsys_raw_cq_done(raw_dev, ctx,
+						       irq_info->frame_idx);
+	}
+
+	/* raw's DMA done, we only allow AFO done here */
+	if (irq_info->irq_type & 1 << CAMSYS_IRQ_AFO_DONE)
+		mtk_cam_meta1_done(ctx, ctx->dequeued_frame_seq_no, ctx->stream_id);
+
+	/* raw's SW done */
+	if (irq_info->irq_type & 1 << CAMSYS_IRQ_FRAME_DONE) {
+		mtk_camsys_frame_done(ctx, ctx->dequeued_frame_seq_no,
+						ctx->stream_id);
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
+			 unsigned int engine_id,
+			 struct mtk_camsys_irq_info *irq_info)
+{
+	int ret = 0;
+
+	ret = mtk_camsys_event_handle_raw(cam, engine_id, irq_info);
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
\ No newline at end of file
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h
new file mode 100755
index 000000000000..c59e0241a706
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h
@@ -0,0 +1,131 @@
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
+void mtk_cam_set_sensor_full(struct mtk_cam_request_stream_data *s_data,
+			     struct mtk_camsys_sensor_ctrl *sensor_ctrl);
+void state_transition(struct mtk_camsys_ctrl_state *state_entry,
+		      enum MTK_CAMSYS_STATE_IDX from,
+		      enum MTK_CAMSYS_STATE_IDX to);
+void mtk_cam_set_sensor_switch(struct mtk_cam_request_stream_data *s_data,
+			       struct mtk_camsys_sensor_ctrl *sensor_ctrl);
+
+#endif /* __MTK_CAM_CTRL_H */
-- 
2.18.0

