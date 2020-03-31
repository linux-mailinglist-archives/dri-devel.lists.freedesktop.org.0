Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06828199490
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 13:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8416E804;
	Tue, 31 Mar 2020 11:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665376E804;
 Tue, 31 Mar 2020 11:00:08 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id de14so24555422edb.4;
 Tue, 31 Mar 2020 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zuaN52xsii1nkewLclaEgErZ6VbY6cJA1W1RVUe2nIo=;
 b=ZIZNKMgCZPie+6/xKuknbjjV8ivj+xn5graIVnc/VmbKwaiwufTcg6dUR8MMl+i7VT
 BOXRq7CnVXllalwNEdxPsJl3uXBv1b8Bri7lPO84WkBgbNNrPbdV2mcB5s1snKT49fjh
 eASV+fWrqknSUABdRLdigjRuhdxWxyK37/8vTDgdsxMnfZtgnce2XZB4HkH9hGXAHiGD
 chjzH0k2l5/+PPvmScK7acW8MNztYXrkIOH4pg1lkmaX9HbckOjWI2PYohI7esv93Kzg
 i4d6zcRfHPZ2zfPRrlkSPX1x48m9eolCzGJT2l0EnHpDYQ88LiEitrVV0T+pUpaYmMlU
 O7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zuaN52xsii1nkewLclaEgErZ6VbY6cJA1W1RVUe2nIo=;
 b=JeE2d3qrWTs9j018JnEQMIFvMbbV3eMxkCxM6cJUrrUnYRB1GgXoKUyqEqurFTgoUm
 YTmhPLD8JLRdd1CLkHr2ev9f+HfmbQLAsC4BIeH12L1rILcRbC1nFFizZCB8Gib93KBe
 eoa+yiGmF1nV83QXVJAsx6J80h8HNaVbkYCNY1fZUKeoK1PYWiN7rcZa98TJIIqptA59
 qdNmfidWhy93aY29AcPjqkbSW5fG6ioY9cUYGiLMnJos9P7dkAVDqiERn4MREpzDKinL
 sgCGX/SKZkpLShVLlt9KXT5ElS6ff7eEznH4XWud+bJmTQC4YSgb6iWkfKDfAKDoa9qQ
 xN1A==
X-Gm-Message-State: ANhLgQ28GtyqwUs+ykRNjozybaBCWPTdK+lcZwnsifaHGg+Ok/t35ca9
 OdVXciOoXMgaedPj4flCF+KXLUURd1+ifg==
X-Google-Smtp-Source: ADFU+vtSKz2VtHVqR9EE3SB9V+IuZby7oghEv/sLKC0UX6uBBS6XBiv8avp9lWVSxIJ2HyZ5ABApiQ==
X-Received: by 2002:a50:af85:: with SMTP id h5mr15757516edd.300.1585652406937; 
 Tue, 31 Mar 2020 04:00:06 -0700 (PDT)
Received: from smtp.gmail.com ([2001:818:e238:a000:51c6:2c09:a768:9c37])
 by smtp.gmail.com with ESMTPSA id rk25sm1904397ejb.14.2020.03.31.04.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 04:00:06 -0700 (PDT)
Date: Tue, 31 Mar 2020 07:59:59 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Rodrigo.Siqueira@amd.com
Subject: [PATCH 3/4] drm/amd/display: code cleanup on dc_link from
 is_same_edid to get_ddc_line
Message-ID: <362423a97e7e4a66cf9f63c221453be6634fd1dd.1585651869.git.melissa.srw@gmail.com>
References: <cover.1585651869.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1585651869.git.melissa.srw@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removes codestyle issues on the file dc_link between is_same_edid and
get_ddc_line as suggested by checkpatch.pl.

Types covered:

CHECK: Blank lines aren't necessary after an open brace '{'
CHECK: Blank lines aren't necessary before a close brace '}'
WARNING: braces {} are not necessary for single statement blocks
CHECK: Comparison to NULL could be written
CHECK: Lines should not end with a '('
CHECK: Alignment should match open parenthesis
CHECK: Using comparison to false is error prone
CHECK: Using comparison to true is error prone
WARNING: Avoid multiple line dereference - prefer 'link->dpcd_caps.sink_count.bits.SINK_COUNT'
CHECK: Unnecessary parentheses around
WARNING: Missing a blank line after declarations

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 130 +++++++++---------
 1 file changed, 62 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 0b303d17e543..b5b202bd9d7c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -677,12 +677,12 @@ static bool is_same_edid(struct dc_edid *old_edid, struct dc_edid *new_edid)
 	if (new_edid->length == 0)
 		return false;
 
-	return (memcmp(old_edid->raw_edid, new_edid->raw_edid, new_edid->length) == 0);
+	return (memcmp(old_edid->raw_edid,
+		       new_edid->raw_edid, new_edid->length) == 0);
 }
 
 static bool wait_for_alt_mode(struct dc_link *link)
 {
-
 	/**
 	 * something is terribly wrong if time out is > 200ms. (5Hz)
 	 * 500 microseconds * 400 tries us 200 ms
@@ -697,7 +697,7 @@ static bool wait_for_alt_mode(struct dc_link *link)
 
 	DC_LOGGER_INIT(link->ctx->logger);
 
-	if (link->link_enc->funcs->is_in_alt_mode == NULL)
+	if (!link->link_enc->funcs->is_in_alt_mode)
 		return true;
 
 	is_in_alt_mode = link->link_enc->funcs->is_in_alt_mode(link->link_enc);
@@ -712,21 +712,21 @@ static bool wait_for_alt_mode(struct dc_link *link)
 		udelay(sleep_time_in_microseconds);
 		/* ask the link if alt mode is enabled, if so return ok */
 		if (link->link_enc->funcs->is_in_alt_mode(link->link_enc)) {
-
 			finish_timestamp = dm_get_timestamp(link->ctx);
-			time_taken_in_ns = dm_get_elapse_time_in_ns(
-				link->ctx, finish_timestamp, enter_timestamp);
+			time_taken_in_ns =
+				dm_get_elapse_time_in_ns(link->ctx,
+							 finish_timestamp,
+							 enter_timestamp);
 			DC_LOG_WARNING("Alt mode entered finished after %llu ms\n",
 				       div_u64(time_taken_in_ns, 1000000));
 			return true;
 		}
-
 	}
 	finish_timestamp = dm_get_timestamp(link->ctx);
 	time_taken_in_ns = dm_get_elapse_time_in_ns(link->ctx, finish_timestamp,
 						    enter_timestamp);
 	DC_LOG_WARNING("Alt mode has timed out after %llu ms\n",
-			div_u64(time_taken_in_ns, 1000000));
+		       div_u64(time_taken_in_ns, 1000000));
 	return false;
 }
 
@@ -762,30 +762,30 @@ static bool dc_link_detect_helper(struct dc_link *link,
 		return false;
 
 	if ((link->connector_signal == SIGNAL_TYPE_LVDS ||
-			link->connector_signal == SIGNAL_TYPE_EDP) &&
-			link->local_sink) {
-
+	     link->connector_signal == SIGNAL_TYPE_EDP) &&
+	    link->local_sink) {
 		// need to re-write OUI and brightness in resume case
 		if (link->connector_signal == SIGNAL_TYPE_EDP) {
 			dpcd_set_source_specific_data(link);
-			dc_link_set_default_brightness_aux(link); //TODO: use cached
+			dc_link_set_default_brightness_aux(link);
+			//TODO: use cached
 		}
 
 		return true;
 	}
 
-	if (false == dc_link_detect_sink(link, &new_connection_type)) {
+	if (!dc_link_detect_sink(link, &new_connection_type)) {
 		BREAK_TO_DEBUGGER();
 		return false;
 	}
 
 	prev_sink = link->local_sink;
-	if (prev_sink != NULL) {
+	if (prev_sink) {
 		dc_sink_retain(prev_sink);
 		memcpy(&prev_dpcd_caps, &link->dpcd_caps, sizeof(struct dpcd_caps));
 	}
-	link_disconnect_sink(link);
 
+	link_disconnect_sink(link);
 	if (new_connection_type != dc_connection_none) {
 		link->type = new_connection_type;
 		link->link_state_valid = false;
@@ -832,35 +832,31 @@ static bool dc_link_detect_helper(struct dc_link *link,
 		}
 
 		case SIGNAL_TYPE_DISPLAY_PORT: {
-
 			/* wa HPD high coming too early*/
 			if (link->link_enc->features.flags.bits.DP_IS_USB_C == 1) {
-
 				/* if alt mode times out, return false */
-				if (wait_for_alt_mode(link) == false) {
+				if (!wait_for_alt_mode(link))
 					return false;
-				}
 			}
 
-			if (!detect_dp(
-				link,
-				&sink_caps,
-				&converter_disable_audio,
-				aud_support, reason)) {
-				if (prev_sink != NULL)
+			if (!detect_dp(link, &sink_caps,
+				       &converter_disable_audio,
+				       aud_support, reason)) {
+				if (prev_sink)
 					dc_sink_release(prev_sink);
 				return false;
 			}
 
 			// Check if dpcp block is the same
-			if (prev_sink != NULL) {
-				if (memcmp(&link->dpcd_caps, &prev_dpcd_caps, sizeof(struct dpcd_caps)))
+			if (prev_sink) {
+				if (memcmp(&link->dpcd_caps, &prev_dpcd_caps,
+					   sizeof(struct dpcd_caps)))
 					same_dpcd = false;
 			}
 			/* Active dongle downstream unplug*/
 			if (link->type == dc_connection_active_dongle &&
-				link->dpcd_caps.sink_count.bits.SINK_COUNT == 0) {
-				if (prev_sink != NULL)
+			    link->dpcd_caps.sink_count.bits.SINK_COUNT == 0) {
+				if (prev_sink)
 					/* Downstream unplug */
 					dc_sink_release(prev_sink);
 				return true;
@@ -868,7 +864,7 @@ static bool dc_link_detect_helper(struct dc_link *link,
 
 			if (link->type == dc_connection_mst_branch) {
 				LINK_INFO("link=%d, mst branch is now Connected\n",
-					link->link_index);
+					  link->link_index);
 				/* Need to setup mst link_cap struct here
 				 * otherwise dc_link_detect() will leave mst link_cap
 				 * empty which leads to allocate_mst_payload() has "0"
@@ -876,15 +872,15 @@ static bool dc_link_detect_helper(struct dc_link *link,
 				 */
 				dp_verify_mst_link_cap(link);
 
-				if (prev_sink != NULL)
+				if (prev_sink)
 					dc_sink_release(prev_sink);
 				return false;
 			}
 
 			// For seamless boot, to skip verify link cap, we read UEFI settings and set them as verified.
 			if (reason == DETECT_REASON_BOOT &&
-					dc_ctx->dc->config.power_down_display_on_boot == false &&
-					link->link_status.link_active == true)
+			    !dc_ctx->dc->config.power_down_display_on_boot &&
+			    link->link_status.link_active)
 				perform_dp_seamless_boot = true;
 
 			if (perform_dp_seamless_boot) {
@@ -897,24 +893,23 @@ static bool dc_link_detect_helper(struct dc_link *link,
 
 		default:
 			DC_ERROR("Invalid connector type! signal:%d\n",
-				link->connector_signal);
-			if (prev_sink != NULL)
+				 link->connector_signal);
+			if (prev_sink)
 				dc_sink_release(prev_sink);
 			return false;
 		} /* switch() */
 
 		if (link->dpcd_caps.sink_count.bits.SINK_COUNT)
-			link->dpcd_sink_count = link->dpcd_caps.sink_count.
-					bits.SINK_COUNT;
+			link->dpcd_sink_count =
+				link->dpcd_caps.sink_count.bits.SINK_COUNT;
 		else
 			link->dpcd_sink_count = 1;
 
-		dal_ddc_service_set_transaction_type(
-						link->ddc,
-						sink_caps.transaction_type);
+		dal_ddc_service_set_transaction_type(link->ddc,
+						     sink_caps.transaction_type);
 
-		link->aux_mode = dal_ddc_service_is_in_aux_transaction_mode(
-				link->ddc);
+		link->aux_mode =
+			dal_ddc_service_is_in_aux_transaction_mode(link->ddc);
 
 		sink_init_data.link = link;
 		sink_init_data.sink_signal = sink_caps.signal;
@@ -922,7 +917,7 @@ static bool dc_link_detect_helper(struct dc_link *link,
 		sink = dc_sink_create(&sink_init_data);
 		if (!sink) {
 			DC_ERROR("Failed to create sink!\n");
-			if (prev_sink != NULL)
+			if (prev_sink)
 				dc_sink_release(prev_sink);
 			return false;
 		}
@@ -933,10 +928,8 @@ static bool dc_link_detect_helper(struct dc_link *link,
 		/* dc_sink_create returns a new reference */
 		link->local_sink = sink;
 
-		edid_status = dm_helpers_read_local_edid(
-				link->ctx,
-				link,
-				sink);
+		edid_status = dm_helpers_read_local_edid(link->ctx,
+							 link, sink);
 
 		switch (edid_status) {
 		case EDID_BAD_CHECKSUM:
@@ -944,7 +937,6 @@ static bool dc_link_detect_helper(struct dc_link *link,
 			break;
 		case EDID_NO_RESPONSE:
 			DC_LOG_ERROR("No EDID read.\n");
-
 			/*
 			 * Abort detection for non-DP connectors if we have
 			 * no EDID
@@ -955,7 +947,7 @@ static bool dc_link_detect_helper(struct dc_link *link,
 			 */
 			if (dc_is_hdmi_signal(link->connector_signal) ||
 			    dc_is_dvi_signal(link->connector_signal)) {
-				if (prev_sink != NULL)
+				if (prev_sink)
 					dc_sink_release(prev_sink);
 
 				return false;
@@ -968,14 +960,17 @@ static bool dc_link_detect_helper(struct dc_link *link,
 			link->ctx->dc->debug.disable_fec = true;
 
 		// Check if edid is the same
-		if ((prev_sink != NULL) && ((edid_status == EDID_THE_SAME) || (edid_status == EDID_OK)))
-			same_edid = is_same_edid(&prev_sink->dc_edid, &sink->dc_edid);
+		if ((prev_sink) &&
+		    (edid_status == EDID_THE_SAME || edid_status == EDID_OK))
+			same_edid = is_same_edid(&prev_sink->dc_edid,
+						 &sink->dc_edid);
 
 		if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
 			link->ctx->dc->debug.hdmi20_disable = true;
 
 		if (link->connector_signal == SIGNAL_TYPE_DISPLAY_PORT &&
-			sink_caps.transaction_type == DDC_TRANSACTION_TYPE_I2C_OVER_AUX) {
+		    sink_caps.transaction_type ==
+		    DDC_TRANSACTION_TYPE_I2C_OVER_AUX) {
 			/*
 			 * TODO debug why Dell 2413 doesn't like
 			 *  two link trainings
@@ -984,29 +979,28 @@ static bool dc_link_detect_helper(struct dc_link *link,
 			// verify link cap for SST non-seamless boot
 			if (!perform_dp_seamless_boot)
 				dp_verify_link_cap_with_retries(link,
-						&link->reported_link_cap,
-						LINK_TRAINING_MAX_VERIFY_RETRY);
+								&link->reported_link_cap,
+								LINK_TRAINING_MAX_VERIFY_RETRY);
 		} else {
 			// If edid is the same, then discard new sink and revert back to original sink
 			if (same_edid) {
 				link_disconnect_remap(prev_sink, link);
 				sink = prev_sink;
 				prev_sink = NULL;
-
 			}
 		}
 
 		/* HDMI-DVI Dongle */
 		if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A &&
-				!sink->edid_caps.edid_hdmi)
+		    !sink->edid_caps.edid_hdmi)
 			sink->sink_signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
 
 		/* Connectivity log: detection */
 		for (i = 0; i < sink->dc_edid.length / DC_EDID_BLOCK_SIZE; i++) {
 			CONN_DATA_DETECT(link,
-					&sink->dc_edid.raw_edid[i * DC_EDID_BLOCK_SIZE],
-					DC_EDID_BLOCK_SIZE,
-					"%s: [Block %d] ", sink->edid_caps.display_name, i);
+					 &sink->dc_edid.raw_edid[i * DC_EDID_BLOCK_SIZE],
+					 DC_EDID_BLOCK_SIZE,
+					 "%s: [Block %d] ", sink->edid_caps.display_name, i);
 		}
 
 		DC_LOG_DETECTION_EDID_PARSER("%s: "
@@ -1041,17 +1035,18 @@ static bool dc_link_detect_helper(struct dc_link *link,
 				sink->edid_caps.audio_modes[i].sample_rate,
 				sink->edid_caps.audio_modes[i].sample_size);
 		}
-
 	} else {
 		/* From Connected-to-Disconnected. */
 		if (link->type == dc_connection_mst_branch) {
 			LINK_INFO("link=%d, mst branch is now Disconnected\n",
-				link->link_index);
+				  link->link_index);
 
 			dm_helpers_dp_mst_stop_top_mgr(link->ctx, link);
 
 			link->mst_stream_alloc_table.stream_count = 0;
-			memset(link->mst_stream_alloc_table.stream_allocations, 0, sizeof(link->mst_stream_alloc_table.stream_allocations));
+			memset(link->mst_stream_alloc_table.stream_allocations,
+			       0,
+			       sizeof(link->mst_stream_alloc_table.stream_allocations));
 		}
 
 		link->type = dc_connection_none;
@@ -1065,16 +1060,15 @@ static bool dc_link_detect_helper(struct dc_link *link,
 	}
 
 	LINK_INFO("link=%d, dc_sink_in=%p is now %s prev_sink=%p dpcd same=%d edid same=%d\n",
-		link->link_index, sink,
-		(sink_caps.signal == SIGNAL_TYPE_NONE ?
-			"Disconnected":"Connected"), prev_sink,
-			same_dpcd, same_edid);
+		  link->link_index, sink,
+		  (sink_caps.signal ==
+		   SIGNAL_TYPE_NONE ? "Disconnected" : "Connected"),
+		  prev_sink, same_dpcd, same_edid);
 
-	if (prev_sink != NULL)
+	if (prev_sink)
 		dc_sink_release(prev_sink);
 
 	return true;
-
 }
 
 bool dc_link_detect(struct dc_link *link, enum dc_detect_reason reason)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
