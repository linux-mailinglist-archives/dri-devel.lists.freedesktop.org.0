Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 401A3262869
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13B789D64;
	Wed,  9 Sep 2020 07:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D076EA1E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 07:21:22 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id md22so924644pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 00:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bLPtTuLpMmqGcI18AHosC8t8jX+F5LJliVXfFXGdRzo=;
 b=dHllD90sWsIvfpw8cEKg4udYXNwUKGh2aJJesDyELYXYfTm6NHaITmgFkGFmy0HCjF
 1IhK/ljvkIzPQ0KnPfH4w/kpgG4MprLjzPzItFCHI9CiTLhFsvTLo8FJn3MNYeRaUhN/
 7tVvgDzaoWCkVlYgeasCYE6KCO3NFOsmShzEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bLPtTuLpMmqGcI18AHosC8t8jX+F5LJliVXfFXGdRzo=;
 b=NtpPOgIYnjG7Nnp1dyqi/WHtbWaXkzG0u89q4mkDMDfUijg9X8uyt0vuV7aOwqQwne
 oqeEuRJAojZTBl9BuINFQ8N+MkycxUsj6YKWYsNOuuur6jUb/Zzlg7r2/0ACYX3qTKJ6
 LL+IpvU8DLCScnsrR6/tb7cXPDs4Y10xLjCbGHIPpvhNNCKEe9K/hjpBEZNVMuTw9YuL
 dGSj1jbvc/iA6KMhcUHGYQHNlDTQrG7nNlsTyNNLzLhANxNPlI9+OeLCHPFOH2R8G9wD
 HPmx0uS1+Utlv3xLwWPK5NvhU51AOpPaEWTwOMkNI7F/Oa8MIY2Hw0yJ33Uo2KYLrkas
 5aVA==
X-Gm-Message-State: AOAM531LrZD0cOtM01Rx/+3+i9kTz2tTR+oNafNOFcrYQQxy2JORCH1e
 dlN1t30dR1e1k5VFo5Yg3tV4iA==
X-Google-Smtp-Source: ABdhPJzX1jP/qLLmt+a0xk0JgMFrrGWSt76WDoxrpIvUrtVywETiK7WFFc5/T+f1+qlCLVLotGekjA==
X-Received: by 2002:a17:90a:104f:: with SMTP id
 y15mr212144pjd.45.1599636082099; 
 Wed, 09 Sep 2020 00:21:22 -0700 (PDT)
Received: from localhost ([2401:fa00:9:15:7220:84ff:fe09:cabc])
 by smtp.gmail.com with ESMTPSA id q34sm1304145pgl.28.2020.09.09.00.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 00:21:21 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/4] drm_dp_mst_topology: use correct AUX channel
Date: Wed,  9 Sep 2020 17:20:50 +1000
Message-Id: <20200909172023.v2.2.Ided0ab0808c4908238bd2eb9ebb6ffb2c9312789@changeid>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200909172023.v2.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
References: <20200909172023.v2.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
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

(no changes since v1)

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
2.28.0.526.ge36021eeef-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
