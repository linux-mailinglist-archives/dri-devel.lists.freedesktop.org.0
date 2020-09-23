Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA8A274EDD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 04:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506F56E0C2;
	Wed, 23 Sep 2020 02:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ECD6E0C2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 02:14:12 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 5so2752487pgf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 19:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WwWFLVcsl8hY0toIAd3WE4dUvBpqlvZYT4x8hQzEp/c=;
 b=ISsDGXn+cWfkSQWsM/dsabiEgxRAik26IWpYhWuxsBEePLy2o3V8KOOsYDi3JcLhz+
 K+bGAmKfDVVtkBkTXeRtPhOsplEGAhuQDKex7V5b1f2Q23444sGFMe5SM7ec3PdHZxea
 Sr9ZNu5PLRxndnKyi+UItnLo36mICgO9D5r7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WwWFLVcsl8hY0toIAd3WE4dUvBpqlvZYT4x8hQzEp/c=;
 b=qvH8dQrQBjnS8lcxM/UMTootVBra1WI0o58R+TXtlFMBApe7WiJfN94w2w8B+IdMb+
 92g3JJ1v4LZwfwlO4f6lPD3wD1Wog4EPcDgEj80E6pnyPOiH0qes7PVPELpof7lBVlQ+
 o5prAdA1RcuajsJP4mo1v0Dv2C/PzqiQKDQuLqn82Jb0j2srwb1gduGAHqWwMiXnIaGK
 mQrOUa/Rqf05tst3Pn/m2rmiXyJK5mSzB+HS5l6kx0rE9hHV81O2rsN485tVFr3xvnV2
 Wfjs8/XWz7r4Kzd2wF+hwaSaSfdJMFrClg8Vo/bPEFHagQOWqwhKG8MPMPLElWfFrnyU
 /Acg==
X-Gm-Message-State: AOAM5333KrLGFws38I/oYotOQpFeCmH/rJzWG5Jg+yjfiw2wXFOy6k96
 ZB8nry1yto7cTL7KdY5+ogSKTw==
X-Google-Smtp-Source: ABdhPJxLxVTqKyMSoZHyDDric81McwvV6shEQbZIbXA8MW3tWMyMUFMlDcPCq/eEuRaybPTZxTiVsw==
X-Received: by 2002:a62:1902:0:b029:13e:d13d:a12e with SMTP id
 2-20020a6219020000b029013ed13da12emr6793083pfz.22.1600827252292; 
 Tue, 22 Sep 2020 19:14:12 -0700 (PDT)
Received: from localhost ([2401:fa00:9:15:7220:84ff:fe09:cabc])
 by smtp.gmail.com with ESMTPSA id co3sm3298687pjb.31.2020.09.22.19.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 19:14:11 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/4] dp/dp_mst: Add support for sink event notify messages
Date: Wed, 23 Sep 2020 12:13:52 +1000
Message-Id: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sink event notify messages are used for MST CEC IRQs. Add parsing
support for sink event notify messages in preparation for handling MST
CEC IRQs.

Signed-off-by: Sam McNally <sammc@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/drm_dp_mst_topology.c | 37 ++++++++++++++++++++++++++-
 include/drm/drm_dp_mst_helper.h       | 14 ++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 17dbed0a9800..15b6cc39a754 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1027,6 +1027,30 @@ static bool drm_dp_sideband_parse_resource_status_notify(struct drm_dp_sideband_
 	return false;
 }
 
+static bool drm_dp_sideband_parse_sink_event_notify(
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
+	DRM_DEBUG_KMS("sink event notify parse length fail %d %d\n", idx, raw->curlen);
+	return false;
+}
+
 static bool drm_dp_sideband_parse_req(struct drm_dp_sideband_msg_rx *raw,
 				      struct drm_dp_sideband_msg_req_body *msg)
 {
@@ -1038,6 +1062,8 @@ static bool drm_dp_sideband_parse_req(struct drm_dp_sideband_msg_rx *raw,
 		return drm_dp_sideband_parse_connection_status_notify(raw, msg);
 	case DP_RESOURCE_STATUS_NOTIFY:
 		return drm_dp_sideband_parse_resource_status_notify(raw, msg);
+	case DP_SINK_EVENT_NOTIFY:
+		return drm_dp_sideband_parse_sink_event_notify(raw, msg);
 	default:
 		DRM_ERROR("Got unknown request 0x%02x (%s)\n", msg->req_type,
 			  drm_dp_mst_req_type_str(msg->req_type));
@@ -3875,6 +3901,8 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 			guid = msg->u.conn_stat.guid;
 		else if (msg->req_type == DP_RESOURCE_STATUS_NOTIFY)
 			guid = msg->u.resource_stat.guid;
+		else if (msg->req_type == DP_SINK_EVENT_NOTIFY)
+			guid = msg->u.sink_event.guid;
 
 		if (guid)
 			mstb = drm_dp_get_mst_branch_device_by_guid(mgr, guid);
@@ -3948,7 +3976,8 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 	drm_dp_sideband_parse_req(&mgr->up_req_recv, &up_req->msg);
 
 	if (up_req->msg.req_type != DP_CONNECTION_STATUS_NOTIFY &&
-	    up_req->msg.req_type != DP_RESOURCE_STATUS_NOTIFY) {
+	    up_req->msg.req_type != DP_RESOURCE_STATUS_NOTIFY &&
+	    up_req->msg.req_type != DP_SINK_EVENT_NOTIFY) {
 		DRM_DEBUG_KMS("Received unknown up req type, ignoring: %x\n",
 			      up_req->msg.req_type);
 		kfree(up_req);
@@ -3976,6 +4005,12 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 		DRM_DEBUG_KMS("Got RSN: pn: %d avail_pbn %d\n",
 			      res_stat->port_number,
 			      res_stat->available_pbn);
+	} else if (up_req->msg.req_type == DP_SINK_EVENT_NOTIFY) {
+		const struct drm_dp_sink_event_notify *sink_event =
+			&up_req->msg.u.sink_event;
+
+		DRM_DEBUG_KMS("Got SEN: pn: %d event_id %d\n",
+			      sink_event->port_number, sink_event->event_id);
 	}
 
 	up_req->hdr = mgr->up_req_recv.initial_hdr;
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 6ae5860d8644..c7c79e0ced18 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -402,6 +402,19 @@ struct drm_dp_resource_status_notify {
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
@@ -413,6 +426,7 @@ struct drm_dp_sideband_msg_req_body {
 		struct drm_dp_connection_status_notify conn_stat;
 		struct drm_dp_port_number_req port_num;
 		struct drm_dp_resource_status_notify resource_stat;
+		struct drm_dp_sink_event_notify sink_event;
 
 		struct drm_dp_query_payload query_payload;
 		struct drm_dp_allocate_payload allocate_payload;
-- 
2.28.0.681.g6f77f65b4e-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
