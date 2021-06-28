Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECAA3B5A40
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 10:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA396E2C8;
	Mon, 28 Jun 2021 08:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CF86E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 08:07:19 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id kt19so1659105pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 01:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dc4RVK46lJ9dFpM9qqdODpD8RCANfeN3A+EDvdvclNM=;
 b=NDrZoroGtzddV1pWww3F2gixubaolKg7c1wAS2pNUPWkE4gHVyQ3sCrlRwGAjtBbiP
 eS0qaxxUUlHpLVKJh9sCj40BqYvpW1TT2ELDElN6T4adJjc5xjqPS0r3blHpdtygSHCm
 Y+f7HDEM1BOolkKptr+PWuozH57iXhsnI3Dbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dc4RVK46lJ9dFpM9qqdODpD8RCANfeN3A+EDvdvclNM=;
 b=sp49jXMRf4DgsMs36HxB3rtpn81XSauebMcGv7vmVSZTDk0jaFSGuTQSAIDkrrdZhp
 D+Trzj0dXFRL6eGNihIkTtJB+ZPssd+ZJdli4wWmxsCr6jsnue6KUmDi+//WaglFvD1J
 VKUuUKZ+yHN36O0z3JHOkGDozdOLXQAilPe4D6dl87mLEDNmTOuHxqoxqlKjMXXuWzMr
 4JD3aoelTG0tNUZjmXIp5Av2rEvNbd1HbC2hUiP3yI5yGeZgdg4LRJMs63wFtj/fBS+p
 7pPYaA8FUBJBdONSUzkF4Ao1D1dZRK072kE6y+syz2gc2M6IL1VKQd4VMYQTVmALPERW
 6kGg==
X-Gm-Message-State: AOAM531STtu+AnSP6Vjf3St7n60VCDsb67Qm8OXfUONLdBxILyPkjTB/
 wKjK7ob2dmE8bck0m5rhUTxQCg==
X-Google-Smtp-Source: ABdhPJwHq7ZU49BhVOQH5lgS534rk8F5F/coMFl4C+FoJ11mxiCsy+jc4fXszpvvxFflGv534cPvLw==
X-Received: by 2002:a17:903:1c1:b029:125:b183:7989 with SMTP id
 e1-20020a17090301c1b0290125b1837989mr21037389plh.57.1624867639385; 
 Mon, 28 Jun 2021 01:07:19 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:d9cf:d433:6a82:6f81])
 by smtp.gmail.com with UTF8SMTPSA id o5sm9679527pfg.106.2021.06.28.01.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 01:07:19 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 2/3] drm/dp_mst: Add support for sink event notify messages
Date: Mon, 28 Jun 2021 18:06:42 +1000
Message-Id: <20210628180604.v6.2.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210628180604.v6.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
References: <20210628180604.v6.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
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
 Hans Verkuil <hverkuil@xs4all.nl>, Sam McNally <sammc@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sink event notify messages are used for MST CEC IRQs. Add parsing
support for sink event notify messages in preparation for handling MST
CEC IRQs.

Reviewed-by: Lyude Paul <lyude@redhat.com>
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
index ee58f6517482..1cc1a58cfa8b 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -476,6 +476,20 @@ drm_dp_encode_sideband_req(const struct drm_dp_sideband_msg_req_body *req,
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
@@ -722,6 +736,12 @@ drm_dp_dump_sideband_msg_req_body(const struct drm_dp_sideband_msg_req_body *req
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
@@ -1166,6 +1186,30 @@ static bool drm_dp_sideband_parse_resource_status_notify(const struct drm_dp_mst
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
@@ -1178,6 +1222,8 @@ bool drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
 		return drm_dp_sideband_parse_connection_status_notify(mgr, raw, msg);
 	case DP_RESOURCE_STATUS_NOTIFY:
 		return drm_dp_sideband_parse_resource_status_notify(mgr, raw, msg);
+	case DP_SINK_EVENT_NOTIFY:
+		return drm_dp_sideband_parse_sink_event_notify(mgr, raw, msg);
 	default:
 		drm_err(mgr->dev, "Got unknown request 0x%02x (%s)\n",
 			msg->req_type, drm_dp_mst_req_type_str(msg->req_type));
@@ -4113,6 +4159,8 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 			guid = msg->u.conn_stat.guid;
 		else if (msg->req_type == DP_RESOURCE_STATUS_NOTIFY)
 			guid = msg->u.resource_stat.guid;
+		else if (msg->req_type == DP_SINK_EVENT_NOTIFY)
+			guid = msg->u.sink_event.guid;
 
 		if (guid)
 			mstb = drm_dp_get_mst_branch_device_by_guid(mgr, guid);
@@ -4184,7 +4232,8 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 	drm_dp_sideband_parse_req(mgr, &mgr->up_req_recv, &up_req->msg);
 
 	if (up_req->msg.req_type != DP_CONNECTION_STATUS_NOTIFY &&
-	    up_req->msg.req_type != DP_RESOURCE_STATUS_NOTIFY) {
+	    up_req->msg.req_type != DP_RESOURCE_STATUS_NOTIFY &&
+	    up_req->msg.req_type != DP_SINK_EVENT_NOTIFY) {
 		drm_dbg_kms(mgr->dev, "Received unknown up req type, ignoring: %x\n",
 			    up_req->msg.req_type);
 		kfree(up_req);
@@ -4212,6 +4261,12 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
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
index ddb9231d0309..dd1cac5cdb0f 100644
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
2.32.0.93.g670b81a890-goog

