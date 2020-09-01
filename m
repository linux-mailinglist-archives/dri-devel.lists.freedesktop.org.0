Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F3B258803
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 08:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB616E049;
	Tue,  1 Sep 2020 06:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396596E049
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 06:22:37 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id np15so190781pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 23:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lRIHcVNxVGPyHgfpqDwa33OIPQovgsuZYgCyV3RsN4U=;
 b=bbjai8uAfQTONaD7KIS+VvI0y9gAklINsoRx4g7eLrbLP5Af077ZQYThvPgH1KaxaN
 lSiUGHPyy1Ixzsi835Q19YIiFeVyTpA3jXFhHIKdctbYgjH8x7OLJGCTPjg7aYrhaRhu
 /yEHG7bSgsx5cpODbWFnyTcusm++jPyWGxmKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lRIHcVNxVGPyHgfpqDwa33OIPQovgsuZYgCyV3RsN4U=;
 b=cywDFgwdOMmK5d4gRoqtP5i2lnGAjmcVSd/gJ8H6NSMqyIyHxh97+YOFwMrnNcUh6m
 jkO6sMLdJ9hl9siwB0fqy+H92bX+NWddksIn1ckhJE0USsCA6ykI6dBknL8t0DmmjKxw
 bi5U3m3vWz445Ddjxx5mx9ulW04cRjukpPG4vjIL+EVBhnuA738xZmeP4rQlIGLEKvQe
 Sr0qWKv66+uDuBfm7xwsCmNEkzRaW7u/FQDy6L75AY7hssKXedCoWfAsqQwKeJA90lzW
 e6dkKj038g7YBS5bba2EvEOFdggG4Eo64Q3ok7rRzIBxoW4eYQn68U8HrNOmHya7fss7
 wukA==
X-Gm-Message-State: AOAM532bI8sckAiAQ9bRhclgCl7mtKQyZFu2b+/zJCKg1/VfQsmtT2KD
 oqqCLk0avumVuK7Uf3eZLAUI1w==
X-Google-Smtp-Source: ABdhPJzcdZL4p0b4GPPuCv+/lxRBzo2wGELTyfZ/HfU5w9m3LhPY2jVp17FziATH/kJ+fkOyP2la1Q==
X-Received: by 2002:a17:90b:282:: with SMTP id az2mr144138pjb.66.1598941356873; 
 Mon, 31 Aug 2020 23:22:36 -0700 (PDT)
Received: from localhost ([2401:fa00:9:15:7220:84ff:fe09:cabc])
 by smtp.gmail.com with ESMTPSA id n1sm372069pfu.2.2020.08.31.23.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2020 23:22:36 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/5] drm_dp_mst_topology: use correct AUX channel
Date: Tue,  1 Sep 2020 16:22:16 +1000
Message-Id: <20200901162133.2.Ided0ab0808c4908238bd2eb9ebb6ffb2c9312789@changeid>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
In-Reply-To: <20200901162133.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
References: <20200901162133.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
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
 Sam McNally <sammc@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hans Verkuil <hans.verkuil@cisco.com>

For adapters behind an MST hub use the correct AUX channel.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
[sammc@chromium.org: rebased, removing redundant changes]
Signed-off-by: Sam McNally <sammc@chromium.org>
---

 drivers/gpu/drm/drm_dp_mst_topology.c | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 15b6cc39a754..0d753201adbd 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2255,6 +2255,9 @@ drm_dp_mst_topology_unlink_port(struct drm_dp_mst_topology_mgr *mgr,
 	drm_dp_mst_topology_put_port(port);
 }
 
+static ssize_t
+drm_dp_mst_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg);
+
 static struct drm_dp_mst_port *
 drm_dp_mst_add_port(struct drm_device *dev,
 		    struct drm_dp_mst_topology_mgr *mgr,
@@ -2271,9 +2274,13 @@ drm_dp_mst_add_port(struct drm_device *dev,
 	port->port_num = port_number;
 	port->mgr = mgr;
 	port->aux.name = "DPMST";
+	mutex_init(&port->aux.hw_mutex);
+	mutex_init(&port->aux.cec.lock);
 	port->aux.dev = dev->dev;
 	port->aux.is_remote = true;
 
+	port->aux.transfer = drm_dp_mst_aux_transfer;
+
 	/* initialize the MST downstream port's AUX crc work queue */
 	drm_dp_remote_aux_init(&port->aux);
 
@@ -3503,6 +3510,35 @@ static int drm_dp_send_up_ack_reply(struct drm_dp_mst_topology_mgr *mgr,
 	return 0;
 }
 
+static ssize_t
+drm_dp_mst_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
+{
+	struct drm_dp_mst_port *port =
+		container_of(aux, struct drm_dp_mst_port, aux);
+	int ret;
+
+	switch (msg->request & ~DP_AUX_I2C_MOT) {
+	case DP_AUX_NATIVE_WRITE:
+	case DP_AUX_I2C_WRITE:
+	case DP_AUX_I2C_WRITE_STATUS_UPDATE:
+		ret = drm_dp_send_dpcd_write(port->mgr, port, msg->address,
+					     msg->size, msg->buffer);
+		break;
+
+	case DP_AUX_NATIVE_READ:
+	case DP_AUX_I2C_READ:
+		ret = drm_dp_send_dpcd_read(port->mgr, port, msg->address,
+					    msg->size, msg->buffer);
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
 static int drm_dp_get_vc_payload_bw(u8 dp_link_bw, u8  dp_link_count)
 {
 	if (dp_link_bw == 0 || dp_link_count == 0)
-- 
2.28.0.402.g5ffc5be6b7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
