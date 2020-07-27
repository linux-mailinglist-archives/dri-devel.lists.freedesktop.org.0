Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D5F22E623
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 08:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A097E89B78;
	Mon, 27 Jul 2020 06:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8171B89755
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 06:03:45 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id f7so2534808pln.13
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 23:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p9TrPMv1GvqaxejuDsYKgVYNmiSWdV8LyIQoXnPdKOE=;
 b=W3rWk6qRg7TGPltuV7Z/y+yOnPBOVX1t0cfZ7MaptJLterQPzGHxkjU6asEbZXIiGX
 vmBh7oRYHuh3e2AOiYyMh96t39Nx+F43u7MjgiPGlbeDXc9hMpCiKoj+oHkBgYzoa9lG
 l3NYOawcxMOhS5ToJw28afbcD+NAdrVc77NZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p9TrPMv1GvqaxejuDsYKgVYNmiSWdV8LyIQoXnPdKOE=;
 b=oG7o7jroy9S4/itg5vSDIiBx0kYXQ1ng9HTJPsfDREbw/hAZEbtX9fAZro3uq0VIY5
 6dvsDzZBppRgWXIHqGpsqNol7cFyb17LGvGjoGRk4Vt/huhBuKvcK8gOS1JKl4H9WuXR
 450xiIVGuRMi9xg2QEg3U72FdLRzlMTAbFIKhBwyUDvRcm1a41Gyz/us7sESrRac2YWy
 GvgSg5bRMT+zsVApQxgw5WxK8S73/vdEKuOxWI7CPMTJMLYAM9RjaXqFdGUHVy3L+tgo
 nl/BNmholYdHjqN5/4DB6NUxIAD1VRL47zbpfa13CLNZUu5JNCVRbtJh8X03jOl0HLIp
 9Dkg==
X-Gm-Message-State: AOAM533bSQIpZJ9eFl3JOaS1yikjp/bjam82bmCyJLM9CRO+2bdCmIoO
 sp8+tWFXP+IlQXkLJ7Hp6qC0xg==
X-Google-Smtp-Source: ABdhPJwrAeZdDRuy+aZSso7QE+3e2VEeiDQ3/nePIPbOq9zUfvDfaIi12TAdsuSIdXoJ1Vt7o1ob2Q==
X-Received: by 2002:a17:902:d702:: with SMTP id
 w2mr6582165ply.159.1595829824834; 
 Sun, 26 Jul 2020 23:03:44 -0700 (PDT)
Received: from localhost ([2401:fa00:9:15:7220:84ff:fe09:cabc])
 by smtp.gmail.com with ESMTPSA id 137sm13802617pgg.72.2020.07.26.23.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jul 2020 23:03:43 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/dp_mst: Support remote i2c writes
Date: Mon, 27 Jul 2020 16:03:37 +1000
Message-Id: <20200727160225.1.I4e95a534de051551cd143e6cb83d4c5a9b0ad1cd@changeid>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Jul 2020 06:57:56 +0000
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
 Sam McNally <sammc@chromium.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For DP MST outputs, the i2c device currently only supports transfers
that can be implemented using remote i2c reads. Such transfers must
consist of zero or more write transactions followed by one read
transaction. DDC/CI commands require standalone write transactions and
hence aren't supported.

Since each remote i2c write is handled as a separate transfer, remote
i2c writes can support transfers consisting of write transactions, where
all but the last have I2C_M_STOP set. According to the DDC/CI 1.1
standard, DDC/CI commands only require a single write or read
transaction in a transfer, so this is sufficient.

For i2c transfers meeting the above criteria, generate and send a remote
i2c write message for each transaction. Add the trivial remote i2c write
reply parsing support so remote i2c write acks bubble up correctly.

Signed-off-by: Sam McNally <sammc@chromium.org>
---

 drivers/gpu/drm/drm_dp_mst_topology.c | 106 ++++++++++++++++++++++----
 1 file changed, 90 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 09b32289497e..1ac874e4e7a1 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -961,6 +961,8 @@ static bool drm_dp_sideband_parse_reply(struct drm_dp_sideband_msg_rx *raw,
 		return drm_dp_sideband_parse_remote_dpcd_write(raw, msg);
 	case DP_REMOTE_I2C_READ:
 		return drm_dp_sideband_parse_remote_i2c_read_ack(raw, msg);
+	case DP_REMOTE_I2C_WRITE:
+		return true; /* since there's nothing to parse */
 	case DP_ENUM_PATH_RESOURCES:
 		return drm_dp_sideband_parse_enum_path_resources_ack(raw, msg);
 	case DP_ALLOCATE_PAYLOAD:
@@ -5326,29 +5328,29 @@ static bool remote_i2c_read_ok(const struct i2c_msg msgs[], int num)
 		msgs[num - 1].len <= 0xff;
 }
 
-/* I2C device */
-static int drm_dp_mst_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
-			       int num)
+static bool remote_i2c_write_ok(const struct i2c_msg msgs[], int num)
+{
+	int i;
+
+	for (i = 0; i < num - 1; i++) {
+		if (msgs[i].flags & I2C_M_RD || !(msgs[i].flags & I2C_M_STOP) ||
+		    msgs[i].len > 0xff)
+			return false;
+	}
+
+	return !(msgs[num - 1].flags & I2C_M_RD) && msgs[num - 1].len <= 0xff;
+}
+
+static int drm_dp_mst_i2c_read(struct drm_dp_mst_branch *mstb,
+			       struct drm_dp_mst_port *port,
+			       struct i2c_msg *msgs, int num)
 {
-	struct drm_dp_aux *aux = adapter->algo_data;
-	struct drm_dp_mst_port *port = container_of(aux, struct drm_dp_mst_port, aux);
-	struct drm_dp_mst_branch *mstb;
 	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
 	unsigned int i;
 	struct drm_dp_sideband_msg_req_body msg;
 	struct drm_dp_sideband_msg_tx *txmsg = NULL;
 	int ret;
 
-	mstb = drm_dp_mst_topology_get_mstb_validated(mgr, port->parent);
-	if (!mstb)
-		return -EREMOTEIO;
-
-	if (!remote_i2c_read_ok(msgs, num)) {
-		DRM_DEBUG_KMS("Unsupported I2C transaction for MST device\n");
-		ret = -EIO;
-		goto out;
-	}
-
 	memset(&msg, 0, sizeof(msg));
 	msg.req_type = DP_REMOTE_I2C_READ;
 	msg.u.i2c_read.num_transactions = num - 1;
@@ -5389,6 +5391,78 @@ static int drm_dp_mst_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs
 	}
 out:
 	kfree(txmsg);
+	return ret;
+}
+
+static int drm_dp_mst_i2c_write(struct drm_dp_mst_branch *mstb,
+				struct drm_dp_mst_port *port,
+				struct i2c_msg *msgs, int num)
+{
+	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
+	unsigned int i;
+	struct drm_dp_sideband_msg_req_body msg;
+	struct drm_dp_sideband_msg_tx *txmsg = NULL;
+	int ret;
+
+	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
+	if (!txmsg) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	for (i = 0; i < num; i++) {
+		memset(&msg, 0, sizeof(msg));
+		msg.req_type = DP_REMOTE_I2C_WRITE;
+		msg.u.i2c_write.port_number = port->port_num;
+		msg.u.i2c_write.write_i2c_device_id = msgs[i].addr;
+		msg.u.i2c_write.num_bytes = msgs[i].len;
+		msg.u.i2c_write.bytes = msgs[i].buf;
+
+		memset(txmsg, 0, sizeof(*txmsg));
+		txmsg->dst = mstb;
+
+		drm_dp_encode_sideband_req(&msg, txmsg);
+		drm_dp_queue_down_tx(mgr, txmsg);
+
+		ret = drm_dp_mst_wait_tx_reply(mstb, txmsg);
+		if (ret > 0) {
+			if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
+				ret = -EREMOTEIO;
+				goto out;
+			}
+		} else {
+			goto out;
+		}
+	}
+	ret = num;
+out:
+	kfree(txmsg);
+	return ret;
+}
+
+/* I2C device */
+static int drm_dp_mst_i2c_xfer(struct i2c_adapter *adapter,
+			       struct i2c_msg *msgs, int num)
+{
+	struct drm_dp_aux *aux = adapter->algo_data;
+	struct drm_dp_mst_port *port =
+		container_of(aux, struct drm_dp_mst_port, aux);
+	struct drm_dp_mst_branch *mstb;
+	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
+	int ret;
+
+	mstb = drm_dp_mst_topology_get_mstb_validated(mgr, port->parent);
+	if (!mstb)
+		return -EREMOTEIO;
+
+	if (remote_i2c_read_ok(msgs, num)) {
+		ret = drm_dp_mst_i2c_read(mstb, port, msgs, num);
+	} else if (remote_i2c_write_ok(msgs, num)) {
+		ret = drm_dp_mst_i2c_write(mstb, port, msgs, num);
+	} else {
+		DRM_DEBUG_KMS("Unsupported I2C transaction for MST device\n");
+		ret = -EIO;
+	}
+
 	drm_dp_mst_topology_put_mstb(mstb);
 	return ret;
 }
-- 
2.28.0.rc0.142.g3c755180ce-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
