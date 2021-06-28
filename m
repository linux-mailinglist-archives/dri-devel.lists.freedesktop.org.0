Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C42C53B5B10
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB0489CB5;
	Mon, 28 Jun 2021 09:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9D489CB5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 09:17:26 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id g192so13578638pfb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 02:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=21k231iYronjuvnyYK5DtKewl+/dujygOQnBwVDhWTo=;
 b=gD6p+lr2Z/ePaM+h+oz9gO/Oj7qzryOx0BBj13Y/0giZ/nS3IMwWgWFz7BsiAAbFRy
 n4MukdwjJyOnA/RyYcvTNVfZ5BXLvkmIY0jw6T2gbe4QD4TbWfQhM2KaLf40k7e9tkQy
 Ztm1bi8K9Db6tORZDHgtXD11tbNZXVWqKZosw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=21k231iYronjuvnyYK5DtKewl+/dujygOQnBwVDhWTo=;
 b=AfWJV18lMj0tLqhZq2Db37Dgc1alFkxoSoXUHA95KA+h2H5C4UhA4oOzp5fPMvihc9
 qZVH5iyKjKX5de9iJlTyC0AmtnfZmGl5lv+xeWZg2DzMwyUXCNi9ct2Xi4Epfs01W75B
 orlnpVU+G/r6bkoNpxVFzghUKz/utS/ePzjvfdsC/xk2hrBBQvU8TGOMoN6COP/lmAs2
 r97Xi6yIWvYhN8nrLnRJZHAshxfgiN8xHnLeZ1GGD6KXvjtLIJKxcpIhrqpiGZV6okRq
 vhVze81ze4gPgMBYHSklKmb/jLoDQlMAnrKwP/puJ9rjFZld0JviDBI5B8A2tx8O5sPk
 pPJA==
X-Gm-Message-State: AOAM532edjNGs9dzCBW66VAdZO/pg4ehDv5VvLKz9LiEt46W9vQD3V31
 pPosvob37SaKslNlBARd6YyfnQ==
X-Google-Smtp-Source: ABdhPJxUAr2KKX1yFf14vWpkJtd+ilKl7bz1guVg0BfnsHDb4JUhuiu9Ktd8xepwlZ+0K3AxDe/2ZA==
X-Received: by 2002:a62:a507:0:b029:30d:82e1:ce14 with SMTP id
 v7-20020a62a5070000b029030d82e1ce14mr643943pfm.29.1624871845702; 
 Mon, 28 Jun 2021 02:17:25 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:d9cf:d433:6a82:6f81])
 by smtp.gmail.com with UTF8SMTPSA id s4sm13769691pju.17.2021.06.28.02.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 02:17:25 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 1/3] drm/dp_mst: Add self-tests for up requests
Date: Mon, 28 Jun 2021 19:17:01 +1000
Message-Id: <20210628191617.v7.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
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

Up requests are decoded by drm_dp_sideband_parse_req(), which operates
on a drm_dp_sideband_msg_rx, unlike down requests. Expand the existing
self-test helper sideband_msg_req_encode_decode() to copy the message
contents and length from a drm_dp_sideband_msg_tx to
drm_dp_sideband_msg_rx and use the parse function under test in place of
decode. Add an additional helper for testing clearly-invalid up
messages, verifying that parse rejects them.

Add support for currently-supported up requests to
drm_dp_dump_sideband_msg_req_body(); add support to
drm_dp_encode_sideband_req() to allow encoding for the self-tests.

Add self-tests for CONNECTION_STATUS_NOTIFY and RESOURCE_STATUS_NOTIFY.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Sam McNally <sammc@chromium.org>
---

(no changes since v5)

Changes in v5:
- Set mock device name to more clearly attribute error/debug logging to
  the self-test, in particular for cases where failures are expected

Changes in v4:
- New in v4

 drivers/gpu/drm/drm_dp_mst_topology.c         |  54 ++++++-
 .../gpu/drm/drm_dp_mst_topology_internal.h    |   4 +
 .../drm/selftests/test-drm_dp_mst_helper.c    | 149 ++++++++++++++++--
 3 files changed, 192 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index ad0795afc21c..ee58f6517482 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -445,6 +445,37 @@ drm_dp_encode_sideband_req(const struct drm_dp_sideband_msg_req_body *req,
 		idx++;
 		}
 		break;
+	case DP_CONNECTION_STATUS_NOTIFY: {
+		const struct drm_dp_connection_status_notify *msg;
+
+		msg = &req->u.conn_stat;
+		buf[idx] = (msg->port_number & 0xf) << 4;
+		idx++;
+		memcpy(&raw->msg[idx], msg->guid, 16);
+		idx += 16;
+		raw->msg[idx] = 0;
+		raw->msg[idx] |= msg->legacy_device_plug_status ? BIT(6) : 0;
+		raw->msg[idx] |= msg->displayport_device_plug_status ? BIT(5) : 0;
+		raw->msg[idx] |= msg->message_capability_status ? BIT(4) : 0;
+		raw->msg[idx] |= msg->input_port ? BIT(3) : 0;
+		raw->msg[idx] |= FIELD_PREP(GENMASK(2, 0), msg->peer_device_type);
+		idx++;
+		break;
+	}
+	case DP_RESOURCE_STATUS_NOTIFY: {
+		const struct drm_dp_resource_status_notify *msg;
+
+		msg = &req->u.resource_stat;
+		buf[idx] = (msg->port_number & 0xf) << 4;
+		idx++;
+		memcpy(&raw->msg[idx], msg->guid, 16);
+		idx += 16;
+		buf[idx] = (msg->available_pbn & 0xff00) >> 8;
+		idx++;
+		buf[idx] = (msg->available_pbn & 0xff);
+		idx++;
+		break;
+	}
 	}
 	raw->cur_len = idx;
 }
@@ -675,6 +706,22 @@ drm_dp_dump_sideband_msg_req_body(const struct drm_dp_sideband_msg_req_body *req
 		  req->u.enc_status.stream_behavior,
 		  req->u.enc_status.valid_stream_behavior);
 		break;
+	case DP_CONNECTION_STATUS_NOTIFY:
+		P("port=%d guid=%*ph legacy=%d displayport=%d messaging=%d input=%d peer_type=%d",
+		  req->u.conn_stat.port_number,
+		  (int)ARRAY_SIZE(req->u.conn_stat.guid), req->u.conn_stat.guid,
+		  req->u.conn_stat.legacy_device_plug_status,
+		  req->u.conn_stat.displayport_device_plug_status,
+		  req->u.conn_stat.message_capability_status,
+		  req->u.conn_stat.input_port,
+		  req->u.conn_stat.peer_device_type);
+		break;
+	case DP_RESOURCE_STATUS_NOTIFY:
+		P("port=%d guid=%*ph pbn=%d",
+		  req->u.resource_stat.port_number,
+		  (int)ARRAY_SIZE(req->u.resource_stat.guid), req->u.resource_stat.guid,
+		  req->u.resource_stat.available_pbn);
+		break;
 	default:
 		P("???\n");
 		break;
@@ -1119,9 +1166,9 @@ static bool drm_dp_sideband_parse_resource_status_notify(const struct drm_dp_mst
 	return false;
 }
 
-static bool drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
-				      struct drm_dp_sideband_msg_rx *raw,
-				      struct drm_dp_sideband_msg_req_body *msg)
+bool drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
+			       struct drm_dp_sideband_msg_rx *raw,
+			       struct drm_dp_sideband_msg_req_body *msg)
 {
 	memset(msg, 0, sizeof(*msg));
 	msg->req_type = (raw->msg[0] & 0x7f);
@@ -1137,6 +1184,7 @@ static bool drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
 		return false;
 	}
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_dp_sideband_parse_req);
 
 static void build_dpcd_write(struct drm_dp_sideband_msg_tx *msg,
 			     u8 port_num, u32 offset, u8 num_bytes, u8 *bytes)
diff --git a/drivers/gpu/drm/drm_dp_mst_topology_internal.h b/drivers/gpu/drm/drm_dp_mst_topology_internal.h
index eeda9a61c657..0356a2e0dba1 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology_internal.h
+++ b/drivers/gpu/drm/drm_dp_mst_topology_internal.h
@@ -21,4 +21,8 @@ void
 drm_dp_dump_sideband_msg_req_body(const struct drm_dp_sideband_msg_req_body *req,
 				  int indent, struct drm_printer *printer);
 
+bool
+drm_dp_sideband_parse_req(const struct drm_dp_mst_topology_mgr *mgr,
+			  struct drm_dp_sideband_msg_rx *raw,
+			  struct drm_dp_sideband_msg_req_body *msg);
 #endif /* !_DRM_DP_MST_HELPER_INTERNAL_H_ */
diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
index 6b4759ed6bfd..7bbeb1e5bc97 100644
--- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
@@ -13,6 +13,10 @@
 #include "../drm_dp_mst_topology_internal.h"
 #include "test-drm_modeset_common.h"
 
+static void mock_release(struct device *dev)
+{
+}
+
 int igt_dp_mst_calc_pbn_mode(void *ignored)
 {
 	int pbn, i;
@@ -120,27 +124,60 @@ sideband_msg_req_equal(const struct drm_dp_sideband_msg_req_body *in,
 static bool
 sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
 {
-	struct drm_dp_sideband_msg_req_body *out;
+	struct drm_dp_sideband_msg_req_body *out = NULL;
 	struct drm_printer p = drm_err_printer(PREFIX_STR);
-	struct drm_dp_sideband_msg_tx *txmsg;
+	struct drm_dp_sideband_msg_tx *txmsg = NULL;
+	struct drm_dp_sideband_msg_rx *rxmsg = NULL;
+	struct drm_dp_mst_topology_mgr *mgr = NULL;
 	int i, ret;
-	bool result = true;
+	bool result = false;
 
 	out = kzalloc(sizeof(*out), GFP_KERNEL);
 	if (!out)
-		return false;
+		goto out;
 
 	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
 	if (!txmsg)
-		return false;
+		goto out;
 
-	drm_dp_encode_sideband_req(in, txmsg);
-	ret = drm_dp_decode_sideband_req(txmsg, out);
-	if (ret < 0) {
-		drm_printf(&p, "Failed to decode sideband request: %d\n",
-			   ret);
-		result = false;
+	rxmsg = kzalloc(sizeof(*rxmsg), GFP_KERNEL);
+	if (!rxmsg)
 		goto out;
+
+	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
+	if (!mgr)
+		goto out;
+
+	mgr->dev = kzalloc(sizeof(*mgr->dev), GFP_KERNEL);
+	if (!mgr->dev)
+		goto out;
+
+	mgr->dev->dev = kzalloc(sizeof(*mgr->dev->dev), GFP_KERNEL);
+	if (!mgr->dev->dev)
+		goto out;
+
+	mgr->dev->dev->release = mock_release;
+	mgr->dev->dev->init_name = PREFIX_STR;
+	device_initialize(mgr->dev->dev);
+
+	drm_dp_encode_sideband_req(in, txmsg);
+	switch (in->req_type) {
+	case DP_CONNECTION_STATUS_NOTIFY:
+	case DP_RESOURCE_STATUS_NOTIFY:
+		memcpy(&rxmsg->msg, txmsg->msg, ARRAY_SIZE(rxmsg->msg));
+		rxmsg->curlen = txmsg->cur_len;
+		if (!drm_dp_sideband_parse_req(mgr, rxmsg, out)) {
+			drm_printf(&p, "Failed to decode sideband request\n");
+			goto out;
+		}
+		break;
+	default:
+		ret = drm_dp_decode_sideband_req(txmsg, out);
+		if (ret < 0) {
+			drm_printf(&p, "Failed to decode sideband request: %d\n", ret);
+			goto out;
+		}
+		break;
 	}
 
 	if (!sideband_msg_req_equal(in, out)) {
@@ -148,9 +185,9 @@ sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
 		drm_dp_dump_sideband_msg_req_body(in, 1, &p);
 		drm_printf(&p, "Got:\n");
 		drm_dp_dump_sideband_msg_req_body(out, 1, &p);
-		result = false;
 		goto out;
 	}
+	result = true;
 
 	switch (in->req_type) {
 	case DP_REMOTE_DPCD_WRITE:
@@ -171,6 +208,66 @@ sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
 out:
 	kfree(out);
 	kfree(txmsg);
+	kfree(rxmsg);
+	if (mgr) {
+		if (mgr->dev) {
+			put_device(mgr->dev->dev);
+			kfree(mgr->dev);
+		}
+		kfree(mgr);
+	}
+	return result;
+}
+
+static bool
+sideband_msg_req_parse(int req_type)
+{
+	struct drm_dp_sideband_msg_req_body *out = NULL;
+	struct drm_printer p = drm_err_printer(PREFIX_STR);
+	struct drm_dp_sideband_msg_rx *rxmsg = NULL;
+	struct drm_dp_mst_topology_mgr *mgr = NULL;
+	bool result = false;
+
+	out = kzalloc(sizeof(*out), GFP_KERNEL);
+	if (!out)
+		goto out;
+
+	rxmsg = kzalloc(sizeof(*rxmsg), GFP_KERNEL);
+	if (!rxmsg)
+		goto out;
+
+	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
+	if (!mgr)
+		goto out;
+
+	mgr->dev = kzalloc(sizeof(*mgr->dev), GFP_KERNEL);
+	if (!mgr->dev)
+		goto out;
+
+	mgr->dev->dev = kzalloc(sizeof(*mgr->dev->dev), GFP_KERNEL);
+	if (!mgr->dev->dev)
+		goto out;
+
+	mgr->dev->dev->release = mock_release;
+	mgr->dev->dev->init_name = PREFIX_STR " expected parse failure";
+	device_initialize(mgr->dev->dev);
+
+	rxmsg->curlen = 1;
+	rxmsg->msg[0] = req_type & 0x7f;
+	if (drm_dp_sideband_parse_req(mgr, rxmsg, out))
+		drm_printf(&p, "Unexpectedly decoded invalid sideband request\n");
+	else
+		result = true;
+out:
+	kfree(out);
+	kfree(rxmsg);
+	if (mgr) {
+		if (mgr->dev) {
+			put_device(mgr->dev->dev);
+			kfree(mgr->dev);
+		}
+		kfree(mgr);
+	}
 	return result;
 }
 
@@ -268,6 +365,34 @@ int igt_dp_mst_sideband_msg_req_decode(void *unused)
 	in.u.enc_status.valid_stream_behavior = 1;
 	DO_TEST();
 
+	in.req_type = DP_CONNECTION_STATUS_NOTIFY;
+	in.u.conn_stat.port_number = 0xf;
+	get_random_bytes(in.u.conn_stat.guid, sizeof(in.u.conn_stat.guid));
+	in.u.conn_stat.legacy_device_plug_status = 1;
+	in.u.conn_stat.displayport_device_plug_status = 0;
+	in.u.conn_stat.message_capability_status = 0;
+	in.u.conn_stat.input_port = 0;
+	in.u.conn_stat.peer_device_type = 7;
+	DO_TEST();
+	in.u.conn_stat.displayport_device_plug_status = 1;
+	DO_TEST();
+	in.u.conn_stat.message_capability_status = 1;
+	DO_TEST();
+	in.u.conn_stat.input_port = 1;
+	DO_TEST();
+
+	in.req_type = DP_RESOURCE_STATUS_NOTIFY;
+	in.u.resource_stat.port_number = 0xf;
+	get_random_bytes(in.u.resource_stat.guid, sizeof(in.u.resource_stat.guid));
+	in.u.resource_stat.available_pbn = 0xcdef;
+	DO_TEST();
+
+#undef DO_TEST
+#define DO_TEST(req_type) FAIL_ON(!sideband_msg_req_parse(req_type))
+	DO_TEST(DP_CONNECTION_STATUS_NOTIFY);
+	DO_TEST(DP_RESOURCE_STATUS_NOTIFY);
+
+	DO_TEST(DP_REMOTE_I2C_WRITE);
 #undef DO_TEST
 	return 0;
 }
-- 
2.32.0.93.g670b81a890-goog

