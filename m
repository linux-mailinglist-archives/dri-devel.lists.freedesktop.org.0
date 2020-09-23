Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD539274EDF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 04:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA706E0F0;
	Wed, 23 Sep 2020 02:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F666E0E0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 02:14:19 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id d6so14092107pfn.9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 19:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ayUkH7l5CPlRC3YVFDHaRBHhROsz6N6CbKDEAWespPw=;
 b=PwE/D0s06SrN9M9kYTLMAsu9vmMvgM8NCW2Fo/jiWi08DaG2LQMfT6dgJtx5z6t3rb
 OhUycuW/b/UwreEhWSP7AgO3aAfEUlqeyYgFYLcc922EPJcTNsgiNyO+90yiHTDT+lJz
 2EU33h//Yer0GP1qSJ1O1SXp8Nfdiw3019Ba0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ayUkH7l5CPlRC3YVFDHaRBHhROsz6N6CbKDEAWespPw=;
 b=adgG6MzNWPSwBxWdtbNZoNIS73xXxL0olqD9ss6rBLh3dbpLl2SrdhcwDMotd1CEtw
 L7eTF/eu//2eKwtCxt6RbUXBKdPBhfgd5Az19ePqyr4FzySgeZ+7hSKwLoEUe+MbCcoN
 9LnCDKaOWfHUI0NUaKHtVSubZLgp3rR8Trvho6f01eaYTqsRrUF4zATshNlDKKBpHLOl
 XTrBQAeW714Ks5B4oO9tEpY3pr6wCKAkuo9QeoEAxfXmodiRjQ4VsvhxeiIYqtNSaiXS
 MZ5Ifr9aR2Z+s29hmjnsu+W1H9sSinsJMe64yzNLlOefdCPdiJf4wu/DZt1RzEeMh7MZ
 1+tg==
X-Gm-Message-State: AOAM533oV8SeJPUo2en+KjRhm8hM1d3DJJnCEnatKvcjNGnazNog7EvT
 x8ytb6ltSXeSSTVveG96myE1Cg==
X-Google-Smtp-Source: ABdhPJxztMFOxwZNyHlRolA/1SgBvOAmoY5zPmMSVICK7rjlC2H8IpJuQY9UKyJO2lt7AwkWOSGN9w==
X-Received: by 2002:a62:dd01:0:b029:13c:f607:5fff with SMTP id
 w1-20020a62dd010000b029013cf6075fffmr6492251pff.3.1600827258660; 
 Tue, 22 Sep 2020 19:14:18 -0700 (PDT)
Received: from localhost ([2401:fa00:9:15:7220:84ff:fe09:cabc])
 by smtp.gmail.com with ESMTPSA id x3sm15853111pgg.54.2020.09.22.19.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 19:14:18 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/4] drm_dp_mst_topology: use correct AUX channel
Date: Wed, 23 Sep 2020 12:13:53 +1000
Message-Id: <20200923121320.v3.2.Ided0ab0808c4908238bd2eb9ebb6ffb2c9312789@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
References: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
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
 Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org
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
2.28.0.681.g6f77f65b4e-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
