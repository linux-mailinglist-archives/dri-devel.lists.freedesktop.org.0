Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2978C38F744
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 03:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964016E4FF;
	Tue, 25 May 2021 01:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B11C6E4E6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 01:00:19 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id ot16so13922777pjb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 18:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZssohslpgJJarbGljg9md8jASBqlkMACAwU4BBdWl4=;
 b=D8ZcpJNtdqU8ia04fJ/cn5MNjfIBs6gkHpPam55utD+DgjQIj/DFd27fQozlzEZk51
 8p2/mzX4n9+H55HlUuxxoSMdato54hQEw++ZtcLb4IF8TVVHkiPQQIBkHT4/R8o/xm/6
 gRXKQXkwUr5v4DsnJ18pBtp2QbG7Q8xeaSFRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZssohslpgJJarbGljg9md8jASBqlkMACAwU4BBdWl4=;
 b=dUF7eHB88Y2OK/YYMWT/toMH9yXCQyFJRR5EUaJAXDDDF4pG9k4H1LLPJxu/WGZY1E
 TTW8+jiP9RGsdn/PGm8HaMBzDjKKBkuaxOW3Xfd2deLqBzGMN6BiHvFQsiOi2ZNlbriZ
 oCjBPCF8i+YkqxIWQwaYt8oovMyCxgJqJS8dxTFn3iC9hRLr/tPhwEKkB8EmrOUpvXOf
 OZzvvt/9sByLqjrUAbIK7UXLIDBcCQje3LxHnskhPXYm31AqHOurlDR+TrvbinQ2AtpG
 1b440KLCisX/K9w47n9dCJNEtDt3A1DpVIZ0rQdY1hF7MyI7mWLgzNewcHtLgifrnYss
 MuXg==
X-Gm-Message-State: AOAM533gssXvq4jKQLlqOmXGeyk/RDl+xdVg0I8gvpM5Ik09CZBzCMNZ
 GI80GVV4Nt2J3+7mYxYdACV8Kg==
X-Google-Smtp-Source: ABdhPJyInOXeHXmoIj50onKoxEsmcZwWflpDKI3DgfB0vYXyjt0lNFx05/y1TOKz8gaZxQo2oYGkFA==
X-Received: by 2002:a17:902:9f97:b029:ef:9a89:6e72 with SMTP id
 g23-20020a1709029f97b02900ef9a896e72mr27980122plq.45.1621904418704; 
 Mon, 24 May 2021 18:00:18 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:768b:3ffb:3070:acdc])
 by smtp.gmail.com with UTF8SMTPSA id y14sm481055pjr.51.2021.05.24.18.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 18:00:18 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 2/3] drm/dp_mst: Add support for sink event notify messages
Date: Tue, 25 May 2021 10:59:55 +1000
Message-Id: <20210525105913.v5.2.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210525105913.v5.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
References: <20210525105913.v5.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Anshuman Gupta <anshuman.gupta@intel.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sam McNally <sammc@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sink event notify messages are used for MST CEC IRQs. Add parsing
support for sink event notify messages in preparation for handling MST
CEC IRQs.

Signed-off-by: Sam McNally <sammc@chromium.org>
---

(no changes since v4)

Changes in v4:
- Changed logging to use drm_dbg_kms()
- Added self-test

 drivers/gpu/drm/drm_dp_mst_topology.c         | 57 ++++++++++++++++++-
 .../drm/selftests/test-drm_dp_mst_helper.c    |  8 +++
 include/drm/drm_dp_mst_helper.h               | 14 +++++
 3 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 573f39a3dc16..29aad3b6b31a 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -473,6 +473,20 @@ drm_dp_encode_sideband_req(const struct drm_dp_sideband_msg_req_body *req,
 		idx++;
 		break;
 	}
+	case DP_SINK_EVENT_NOTIFY: {
+		const struct drm_dp_sink_event_notify *msg;
+
+		msg = &req->u.sink_event;
+		buf[idx] = (msg->port_number & 0xf) << 4;
+		idx++;
+		memcpy(&raw->msg[idx], msg->guid, 16);
+		idx += 16;
+		buf[idx] = (msg->event_id & 0xff00) >> 8;
+		idx++;
+		buf[idx] = (msg->event_id & 0xff);
+		idx++;
+		break;
+	}
 	}
 	raw->cur_len = idx;
 }
@@ -719,6 +733,12 @@ drm_dp_dump_sideband_msg_req_body(const struct drm_dp_sideband_msg_req_body *req
 		  (int)ARRAY_SIZE(req->u.resource_stat.guid), req->u.resource_stat.guid,
 		  req->u.resource_stat.available_pbn);
 		break;
+	case DP_SINK_EVENT_NOTIFY:
+		P("port=%d guid=%*ph event=%d",
+		  req->u.sink_event.port_number,
+		  (int)ARRAY_SIZE(req->u.sink_event.guid), req->u.sink_event.guid,
+		  req->u.sink_event.event_id);
+		break;
 	default:
 		P("???\n");
 		break;
@@ -1163,6 +1183,30 @@ static bool drm_dp_sideband_parse_resource_status_notify(const struct drm_dp_mst
 	return false;
 }
 
+static bool drm_dp_sideband_parse_sink_event_notify(const struct drm_dp_mst_topology_mgr *mgr,
+	struct drm_dp_sideband_msg_rx *raw,
+	struct drm_dp_sideband_msg_req_body *msg)
+{
+	int idx = 1;
+
+	msg->u.sink_event.port_number = (raw->msg[idx] & 0xf0) >> 4;
+	idx++;
+	if (idx > raw->curlen)
+		goto fail_len;
+
+	memcpy(msg->u.sink_event.guid, &raw->msg[idx], 16);
+	idx += 16;
+	if (idx > raw->curlen)
+		goto fail_len;
+
+	msg->u.sink_event.event_id = (raw->msg[idx] << 8) | (raw->msg[idx + 1]);
+	idx++;
+	return true;
+fail_len:
+	drm_dbg_kms(mgr->dev, "sink event notify parse length fail %d %d\n", idx, raw->curlen);
+	return false;
+}
+
 bool drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
 			       struct drm_dp_sideband_msg_rx *raw,
 			       struct drm_dp_sideband_msg_req_body *msg)
@@ -1175,6 +1219,8 @@ bool drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
 		return drm_dp_sideband_parse_connection_status_notify(mgr, raw, msg);
 	case DP_RESOURCE_STATUS_NOTIFY:
 		return drm_dp_sideband_parse_resource_status_notify(mgr, raw, msg);
+	case DP_SINK_EVENT_NOTIFY:
+		return drm_dp_sideband_parse_sink_event_notify(mgr, raw, msg);
 	default:
 		drm_err(mgr->dev, "Got unknown request 0x%02x (%s)\n",
 			msg->req_type, drm_dp_mst_req_type_str(msg->req_type));
@@ -4106,6 +4152,8 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 			guid = msg->u.conn_stat.guid;
 		else if (msg->req_type == DP_RESOURCE_STATUS_NOTIFY)
 			guid = msg->u.resource_stat.guid;
+		else if (msg->req_type == DP_SINK_EVENT_NOTIFY)
+			guid = msg->u.sink_event.guid;
 
 		if (guid)
 			mstb = drm_dp_get_mst_branch_device_by_guid(mgr, guid);
@@ -4177,7 +4225,8 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 	drm_dp_sideband_parse_req(mgr, &mgr->up_req_recv, &up_req->msg);
 
 	if (up_req->msg.req_type != DP_CONNECTION_STATUS_NOTIFY &&
-	    up_req->msg.req_type != DP_RESOURCE_STATUS_NOTIFY) {
+	    up_req->msg.req_type != DP_RESOURCE_STATUS_NOTIFY &&
+	    up_req->msg.req_type != DP_SINK_EVENT_NOTIFY) {
 		drm_dbg_kms(mgr->dev, "Received unknown up req type, ignoring: %x\n",
 			    up_req->msg.req_type);
 		kfree(up_req);
@@ -4205,6 +4254,12 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 		drm_dbg_kms(mgr->dev, "Got RSN: pn: %d avail_pbn %d\n",
 			    res_stat->port_number,
 			    res_stat->available_pbn);
+	} else if (up_req->msg.req_type == DP_SINK_EVENT_NOTIFY) {
+		const struct drm_dp_sink_event_notify *sink_event =
+			&up_req->msg.u.sink_event;
+
+		drm_dbg_kms(mgr->dev, "Got SEN: pn: %d event_id %d\n",
+			    sink_event->port_number, sink_event->event_id);
 	}
 
 	up_req->hdr = mgr->up_req_recv.initial_hdr;
diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
index 7bbeb1e5bc97..d49c10d52d88 100644
--- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
@@ -164,6 +164,7 @@ sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
 	switch (in->req_type) {
 	case DP_CONNECTION_STATUS_NOTIFY:
 	case DP_RESOURCE_STATUS_NOTIFY:
+	case DP_SINK_EVENT_NOTIFY:
 		memcpy(&rxmsg->msg, txmsg->msg, ARRAY_SIZE(rxmsg->msg));
 		rxmsg->curlen = txmsg->cur_len;
 		if (!drm_dp_sideband_parse_req(mgr, rxmsg, out)) {
@@ -387,10 +388,17 @@ int igt_dp_mst_sideband_msg_req_decode(void *unused)
 	in.u.resource_stat.available_pbn = 0xcdef;
 	DO_TEST();
 
+	in.req_type = DP_SINK_EVENT_NOTIFY;
+	in.u.sink_event.port_number = 0xf;
+	get_random_bytes(in.u.sink_event.guid, sizeof(in.u.sink_event.guid));
+	in.u.sink_event.event_id = 0xcdef;
+	DO_TEST();
+
 #undef DO_TEST
 #define DO_TEST(req_type) FAIL_ON(!sideband_msg_req_parse(req_type))
 	DO_TEST(DP_CONNECTION_STATUS_NOTIFY);
 	DO_TEST(DP_RESOURCE_STATUS_NOTIFY);
+	DO_TEST(DP_SINK_EVENT_NOTIFY);
 
 	DO_TEST(DP_REMOTE_I2C_WRITE);
 #undef DO_TEST
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index c87a829b6498..96c87f761129 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -439,6 +439,19 @@ struct drm_dp_resource_status_notify {
 	u16 available_pbn;
 };
 
+#define DP_SINK_EVENT_PANEL_REPLAY_ACTIVE_FRAME_CRC_ERROR	BIT(0)
+#define DP_SINK_EVENT_PANEL_REPLAY_RFB_STORAGE_ERROR		BIT(1)
+#define DP_SINK_EVENT_DSC_RC_BUFFER_UNDER_RUN			BIT(2)
+#define DP_SINK_EVENT_DSC_RC_BUFFER_OVERFLOW			BIT(3)
+#define DP_SINK_EVENT_DSC_CHUNK_LENGTH_ERROR			BIT(4)
+#define DP_SINK_EVENT_CEC_IRQ_EVENT				BIT(5)
+
+struct drm_dp_sink_event_notify {
+	u8 port_number;
+	u8 guid[16];
+	u16 event_id;
+};
+
 struct drm_dp_query_payload_ack_reply {
 	u8 port_number;
 	u16 allocated_pbn;
@@ -450,6 +463,7 @@ struct drm_dp_sideband_msg_req_body {
 		struct drm_dp_connection_status_notify conn_stat;
 		struct drm_dp_port_number_req port_num;
 		struct drm_dp_resource_status_notify resource_stat;
+		struct drm_dp_sink_event_notify sink_event;
 
 		struct drm_dp_query_payload query_payload;
 		struct drm_dp_allocate_payload allocate_payload;
-- 
2.31.1.818.g46aad6cb9e-goog

