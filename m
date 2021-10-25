Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F54943A6B4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109966E2B8;
	Mon, 25 Oct 2021 22:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E57D6E283
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635201535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cF8zcjzWqgLa6mljRWdh7bo0UpSpCgcCScA0xBdV3nw=;
 b=g/84e3YGgIfUV/WseIO/PKmBHY2XuDHKtBY0N4pH4NplHkz7oWfqwmaj/HVdP9ibiMWTcv
 JmGsEoUivmpRZ2lbzEySm7Ay4wrt8t6Oh0Zstu3+6Pza35DVijehgOnXsuvhG3ys7NpIF0
 9bGma8Y5GootuXPb3j6HPapjQYDKkR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-0JdTjDLBO7yBf2NkbEOx6A-1; Mon, 25 Oct 2021 18:38:53 -0400
X-MC-Unique: 0JdTjDLBO7yBf2NkbEOx6A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EB52A0CAB;
 Mon, 25 Oct 2021 22:38:50 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.9.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE9E860BF1;
 Mon, 25 Oct 2021 22:38:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>, "Lin, Wayne" <Wayne.Lin@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Anson Jacob <Anson.Jacob@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Jake Wang <haonan.wang2@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>, Eric Yang <Eric.Yang2@amd.com>,
 Lee Jones <lee.jones@linaro.org>, Lewis Huang <Lewis.Huang@amd.com>,
 Roy Chan <roy.chan@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Mark Morra <MarkAlbert.Morra@amd.com>,
 Robin Singh <robin.singh@amd.com>, George Shen <george.shen@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Stylon Wang <stylon.wang@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Rouven Czerwinski <rouven@czerwinskis.de>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Jayendran Ramani <Jayendran.Ramani@amd.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND v5 3/4] drm/amd/display: Add DP 2.0 MST DC Support
Date: Mon, 25 Oct 2021 18:38:23 -0400
Message-Id: <20211025223825.301703-4-lyude@redhat.com>
In-Reply-To: <20211025223825.301703-1-lyude@redhat.com>
References: <20211025223825.301703-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

From: Fangzhi Zuo <Jerry.Zuo@amd.com>

[Why]
configure/call DC interface for DP2 mst support. This is needed to make DP2
mst work.

[How]
- add encoding type, logging, mst update/reduce payload functions

Use the link encoding to determine the DP type (1.4 or 2.0) and add a
flag to dc_stream_update to determine whether to increase/reduce
payloads.

v2:
* add DP_UNKNOWN_ENCODING handling

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Reviewed-by: "Lin, Wayne" <Wayne.Lin@amd.com>
Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  14 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 292 ++++++++++++++++++
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  |  19 ++
 drivers/gpu/drm/amd/display/dc/dc_link.h      |   7 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |  13 +
 5 files changed, 345 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index da942e9f5142..782141ba8ac5 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2356,6 +2356,11 @@ static enum surface_update_type check_update_surfaces_for_stream(
 		if (stream_update->dsc_config)
 			su_flags->bits.dsc_changed = 1;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+		if (stream_update->mst_bw_update)
+			su_flags->bits.mst_bw = 1;
+#endif
+
 		if (su_flags->raw != 0)
 			overall_type = UPDATE_TYPE_FULL;
 
@@ -2741,6 +2746,15 @@ static void commit_planes_do_stream_update(struct dc *dc,
 			if (stream_update->dsc_config)
 				dp_update_dsc_config(pipe_ctx);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+			if (stream_update->mst_bw_update) {
+				if (stream_update->mst_bw_update->is_increase)
+					dc_link_increase_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
+				else
+					dc_link_reduce_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
+			}
+#endif
+
 			if (stream_update->pending_test_pattern) {
 				dc_link_dp_set_test_pattern(stream->link,
 					stream->test_pattern.type,
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index ca5dc3c168ec..fd12561b70cc 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3272,6 +3272,9 @@ static struct fixed31_32 get_pbn_from_timing(struct pipe_ctx *pipe_ctx)
 static void update_mst_stream_alloc_table(
 	struct dc_link *link,
 	struct stream_encoder *stream_enc,
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct hpo_dp_stream_encoder *hpo_dp_stream_enc, // TODO: Rename stream_enc to dio_stream_enc?
+#endif
 	const struct dp_mst_stream_allocation_table *proposed_table)
 {
 	struct link_mst_stream_allocation work_table[MAX_CONTROLLER_NUM] = {
@@ -3308,6 +3311,9 @@ static void update_mst_stream_alloc_table(
 			work_table[i].slot_count =
 				proposed_table->stream_allocations[i].slot_count;
 			work_table[i].stream_enc = stream_enc;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+			work_table[i].hpo_dp_stream_enc = hpo_dp_stream_enc;
+#endif
 		}
 	}
 
@@ -3430,6 +3436,10 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	struct dc_link *link = stream->link;
 	struct link_encoder *link_encoder = NULL;
 	struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct hpo_dp_link_encoder *hpo_dp_link_encoder = link->hpo_dp_link_enc;
+	struct hpo_dp_stream_encoder *hpo_dp_stream_encoder = pipe_ctx->stream_res.hpo_dp_stream_enc;
+#endif
 	struct dp_mst_stream_allocation_table proposed_table = {0};
 	struct fixed31_32 avg_time_slots_per_mtp;
 	struct fixed31_32 pbn;
@@ -3457,7 +3467,14 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 		&proposed_table,
 		true)) {
 		update_mst_stream_alloc_table(
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+					link,
+					pipe_ctx->stream_res.stream_enc,
+					pipe_ctx->stream_res.hpo_dp_stream_enc,
+					&proposed_table);
+#else
 					link, pipe_ctx->stream_res.stream_enc, &proposed_table);
+#endif
 	}
 	else
 		DC_LOG_WARNING("Failed to update"
@@ -3471,23 +3488,56 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 			link->mst_stream_alloc_table.stream_count);
 
 	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 		DC_LOG_MST("stream_enc[%d]: %p      "
+		"stream[%d].hpo_dp_stream_enc: %p      "
 		"stream[%d].vcp_id: %d      "
 		"stream[%d].slot_count: %d\n",
 		i,
 		(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
 		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
+		i,
 		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
 		i,
 		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+#else
+		DC_LOG_MST("stream_enc[%d]: %p      "
+		"stream[%d].vcp_id: %d      "
+		"stream[%d].slot_count: %d\n",
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+#endif
 	}
 
 	ASSERT(proposed_table.stream_count > 0);
 
 	/* program DP source TX for payload */
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
+	case DP_8b_10b_ENCODING:
+		link_encoder->funcs->update_mst_stream_allocation_table(
+			link_encoder,
+			&link->mst_stream_alloc_table);
+		break;
+	case DP_128b_132b_ENCODING:
+		hpo_dp_link_encoder->funcs->update_stream_allocation_table(
+				hpo_dp_link_encoder,
+				&link->mst_stream_alloc_table);
+		break;
+	case DP_UNKNOWN_ENCODING:
+		DC_LOG_ERROR("Failure: unknown encoding format\n");
+		return DC_ERROR_UNEXPECTED;
+	}
+#else
 	link_encoder->funcs->update_mst_stream_allocation_table(
 		link_encoder,
 		&link->mst_stream_alloc_table);
+#endif
 
 	/* send down message */
 	ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
@@ -3510,13 +3560,191 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	pbn = get_pbn_from_timing(pipe_ctx);
 	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
+	case DP_8b_10b_ENCODING:
+		stream_encoder->funcs->set_throttled_vcp_size(
+			stream_encoder,
+			avg_time_slots_per_mtp);
+		break;
+	case DP_128b_132b_ENCODING:
+		hpo_dp_link_encoder->funcs->set_throttled_vcp_size(
+				hpo_dp_link_encoder,
+				hpo_dp_stream_encoder->inst,
+				avg_time_slots_per_mtp);
+		break;
+	case DP_UNKNOWN_ENCODING:
+		DC_LOG_ERROR("Failure: unknown encoding format\n");
+		return DC_ERROR_UNEXPECTED;
+	}
+#else
 	stream_encoder->funcs->set_throttled_vcp_size(
 		stream_encoder,
 		avg_time_slots_per_mtp);
+#endif
+
+	return DC_OK;
+
+}
+
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw_in_kbps)
+{
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
+	struct fixed31_32 avg_time_slots_per_mtp;
+	struct fixed31_32 pbn;
+	struct fixed31_32 pbn_per_slot;
+	struct link_encoder *link_encoder = link->link_enc;
+	struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
+	struct dp_mst_stream_allocation_table proposed_table = {0};
+	uint8_t i;
+	enum act_return_status ret;
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	/* decrease throttled vcp size */
+	pbn_per_slot = get_pbn_per_slot(stream);
+	pbn = get_pbn_from_bw_in_kbps(bw_in_kbps);
+	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
+
+	stream_encoder->funcs->set_throttled_vcp_size(
+				stream_encoder,
+				avg_time_slots_per_mtp);
+
+	/* send ALLOCATE_PAYLOAD sideband message with updated pbn */
+	dm_helpers_dp_mst_send_payload_allocation(
+			stream->ctx,
+			stream,
+			true);
+
+	/* notify immediate branch device table update */
+	if (dm_helpers_dp_mst_write_payload_allocation_table(
+			stream->ctx,
+			stream,
+			&proposed_table,
+			true)) {
+		/* update mst stream allocation table software state */
+		update_mst_stream_alloc_table(
+				link,
+				pipe_ctx->stream_res.stream_enc,
+				pipe_ctx->stream_res.hpo_dp_stream_enc,
+				&proposed_table);
+	} else {
+		DC_LOG_WARNING("Failed to update"
+				"MST allocation table for"
+				"pipe idx:%d\n",
+				pipe_ctx->pipe_idx);
+	}
+
+	DC_LOG_MST("%s  "
+			"stream_count: %d: \n ",
+			__func__,
+			link->mst_stream_alloc_table.stream_count);
+
+	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
+		DC_LOG_MST("stream_enc[%d]: %p      "
+				"stream[%d].vcp_id: %d      "
+				"stream[%d].slot_count: %d\n",
+				i,
+				(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
+				i,
+				link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
+				i,
+				link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+	}
+
+	ASSERT(proposed_table.stream_count > 0);
+
+	/* update mst stream allocation table hardware state */
+	link_encoder->funcs->update_mst_stream_allocation_table(
+			link_encoder,
+			&link->mst_stream_alloc_table);
+
+	/* poll for immediate branch device ACT handled */
+	ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
+			stream->ctx,
+			stream);
 
 	return DC_OK;
+}
+
+enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw_in_kbps)
+{
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
+	struct fixed31_32 avg_time_slots_per_mtp;
+	struct fixed31_32 pbn;
+	struct fixed31_32 pbn_per_slot;
+	struct link_encoder *link_encoder = link->link_enc;
+	struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
+	struct dp_mst_stream_allocation_table proposed_table = {0};
+	uint8_t i;
+	enum act_return_status ret;
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	/* notify immediate branch device table update */
+	if (dm_helpers_dp_mst_write_payload_allocation_table(
+				stream->ctx,
+				stream,
+				&proposed_table,
+				true)) {
+		/* update mst stream allocation table software state */
+		update_mst_stream_alloc_table(
+				link,
+				pipe_ctx->stream_res.stream_enc,
+				pipe_ctx->stream_res.hpo_dp_stream_enc,
+				&proposed_table);
+	}
+
+	DC_LOG_MST("%s  "
+			"stream_count: %d: \n ",
+			__func__,
+			link->mst_stream_alloc_table.stream_count);
+
+	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
+		DC_LOG_MST("stream_enc[%d]: %p      "
+				"stream[%d].vcp_id: %d      "
+				"stream[%d].slot_count: %d\n",
+				i,
+				(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
+				i,
+				link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
+				i,
+				link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+	}
+
+	ASSERT(proposed_table.stream_count > 0);
+
+	/* update mst stream allocation table hardware state */
+	link_encoder->funcs->update_mst_stream_allocation_table(
+			link_encoder,
+			&link->mst_stream_alloc_table);
+
+	/* poll for immediate branch device ACT handled */
+	ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
+			stream->ctx,
+			stream);
+
+	if (ret != ACT_LINK_LOST) {
+		/* send ALLOCATE_PAYLOAD sideband message with updated pbn */
+		dm_helpers_dp_mst_send_payload_allocation(
+				stream->ctx,
+				stream,
+				true);
+	}
 
+	/* increase throttled vcp size */
+	pbn = get_pbn_from_bw_in_kbps(bw_in_kbps);
+	pbn_per_slot = get_pbn_per_slot(stream);
+	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
+
+	stream_encoder->funcs->set_throttled_vcp_size(
+				stream_encoder,
+				avg_time_slots_per_mtp);
+
+	return DC_OK;
 }
+#endif
 
 static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 {
@@ -3524,6 +3752,10 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	struct dc_link *link = stream->link;
 	struct link_encoder *link_encoder = NULL;
 	struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct hpo_dp_link_encoder *hpo_dp_link_encoder = link->hpo_dp_link_enc;
+	struct hpo_dp_stream_encoder *hpo_dp_stream_encoder = pipe_ctx->stream_res.hpo_dp_stream_enc;
+#endif
 	struct dp_mst_stream_allocation_table proposed_table = {0};
 	struct fixed31_32 avg_time_slots_per_mtp = dc_fixpt_from_int(0);
 	uint8_t i;
@@ -3545,9 +3777,28 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 	 */
 
 	/* slot X.Y */
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
+	case DP_8b_10b_ENCODING:
+		stream_encoder->funcs->set_throttled_vcp_size(
+			stream_encoder,
+			avg_time_slots_per_mtp);
+		break;
+	case DP_128b_132b_ENCODING:
+		hpo_dp_link_encoder->funcs->set_throttled_vcp_size(
+				hpo_dp_link_encoder,
+				hpo_dp_stream_encoder->inst,
+				avg_time_slots_per_mtp);
+		break;
+	case DP_UNKNOWN_ENCODING:
+		DC_LOG_ERROR("Failure: unknown encoding format\n");
+		return DC_ERROR_UNEXPECTED;
+	}
+#else
 	stream_encoder->funcs->set_throttled_vcp_size(
 		stream_encoder,
 		avg_time_slots_per_mtp);
+#endif
 
 	/* TODO: which component is responsible for remove payload table? */
 	if (mst_mode) {
@@ -3557,8 +3808,16 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 				&proposed_table,
 				false)) {
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+			update_mst_stream_alloc_table(
+						link,
+						pipe_ctx->stream_res.stream_enc,
+						pipe_ctx->stream_res.hpo_dp_stream_enc,
+						&proposed_table);
+#else
 			update_mst_stream_alloc_table(
 				link, pipe_ctx->stream_res.stream_enc, &proposed_table);
+#endif
 		}
 		else {
 				DC_LOG_WARNING("Failed to update"
@@ -3574,6 +3833,20 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 			link->mst_stream_alloc_table.stream_count);
 
 	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+		DC_LOG_MST("stream_enc[%d]: %p      "
+		"stream[%d].hpo_dp_stream_enc: %p      "
+		"stream[%d].vcp_id: %d      "
+		"stream[%d].slot_count: %d\n",
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+#else
 		DC_LOG_MST("stream_enc[%d]: %p      "
 		"stream[%d].vcp_id: %d      "
 		"stream[%d].slot_count: %d\n",
@@ -3583,11 +3856,30 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
 		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
 		i,
 		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+#endif
 	}
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
+	case DP_8b_10b_ENCODING:
+		link_encoder->funcs->update_mst_stream_allocation_table(
+			link_encoder,
+			&link->mst_stream_alloc_table);
+		break;
+	case DP_128b_132b_ENCODING:
+		hpo_dp_link_encoder->funcs->update_stream_allocation_table(
+				hpo_dp_link_encoder,
+				&link->mst_stream_alloc_table);
+		break;
+	case DP_UNKNOWN_ENCODING:
+		DC_LOG_ERROR("Failure: unknown encoding format\n");
+		return DC_ERROR_UNEXPECTED;
+	}
+#else
 	link_encoder->funcs->update_mst_stream_allocation_table(
 		link_encoder,
 		&link->mst_stream_alloc_table);
+#endif
 
 	if (mst_mode) {
 		dm_helpers_dp_mst_poll_for_allocation_change_trigger(
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 54662d74c65a..ab13d2304f3e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -5993,6 +5993,25 @@ enum dp_link_encoding dp_get_link_encoding_format(const struct dc_link_settings
 }
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
+enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(const struct dc_link *link)
+{
+	struct dc_link_settings link_settings = {0};
+
+	if (!dc_is_dp_signal(link->connector_signal))
+		return DP_UNKNOWN_ENCODING;
+
+	if (link->preferred_link_setting.lane_count !=
+			LANE_COUNT_UNKNOWN &&
+			link->preferred_link_setting.link_rate !=
+					LINK_RATE_UNKNOWN) {
+		link_settings = link->preferred_link_setting;
+	} else {
+		decide_mst_link_settings(link, &link_settings);
+	}
+
+	return dp_get_link_encoding_format(&link_settings);
+}
+
 // TODO - DP2.0 Link: Fix get_lane_status to handle LTTPR offset (SST and MST)
 static void get_lane_status(
 	struct dc_link *link,
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index 69b008bafbbc..d9fb43d99dc0 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -296,6 +296,10 @@ enum dc_detect_reason {
 bool dc_link_detect(struct dc_link *dc_link, enum dc_detect_reason reason);
 bool dc_link_get_hpd_state(struct dc_link *dc_link);
 enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx);
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
+enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
+#endif
 
 /* Notify DC about DP RX Interrupt (aka Short Pulse Interrupt).
  * Return:
@@ -425,4 +429,7 @@ uint32_t dc_bandwidth_in_kbps_from_timing(
 bool dc_link_is_fec_supported(const struct dc_link *link);
 bool dc_link_should_enable_fec(const struct dc_link *link);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(const struct dc_link *link);
+#endif
 #endif /* DC_LINK_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index b8ebc1f09538..e37c4a10bfd5 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -115,6 +115,13 @@ struct periodic_interrupt_config {
 	int lines_offset;
 };
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+struct dc_mst_stream_bw_update {
+	bool is_increase; // is bandwidth reduced or increased
+	uint32_t mst_stream_bw; // new mst bandwidth in kbps
+};
+#endif
+
 union stream_update_flags {
 	struct {
 		uint32_t scaling:1;
@@ -125,6 +132,9 @@ union stream_update_flags {
 		uint32_t gamut_remap:1;
 		uint32_t wb_update:1;
 		uint32_t dsc_changed : 1;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+		uint32_t mst_bw : 1;
+#endif
 	} bits;
 
 	uint32_t raw;
@@ -278,6 +288,9 @@ struct dc_stream_update {
 
 	struct dc_writeback_update *wb_update;
 	struct dc_dsc_config *dsc_config;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	struct dc_mst_stream_bw_update *mst_bw_update;
+#endif
 	struct dc_transfer_func *func_shaper;
 	struct dc_3dlut *lut3d_func;
 
-- 
2.31.1

