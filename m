Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lIMwGHVidWl+EwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 01:23:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680AD7F5AE
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 01:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D5D10E0BA;
	Sun, 25 Jan 2026 00:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Nqpk9nG4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D0E10E0BA
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 00:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769300590;
 bh=PS8RAj9emcxdAPA8GEJARM/pErd4GWL1kB8KR+loG88=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Nqpk9nG41NrMo+JN00pL6gmKhTiT++Wi47waFYn7U6p4vRkAk46kF3de6QNJHjj1y
 vl+ltYeoXAkK8tr4udoinjWR16/+DU/r+lijIs7ABhmhle29oIErhBeS1i+ky6TQhA
 WDOwMS/yXpPOLaWBXgKGoTiipnm+F/kkcoXFG7C8OUs/WysmtohfnUS1zO2pJh8fr5
 5QV28yY5LyuaprLHlBlYsdMlzHI1xQR5dcQ12biX5f53YEK7HUWy7ZxrLMFK283YXY
 t2mL4vWAFuuonvBH9P2XCN6g9u9PiHfW7rkYop6tv+F98AduvTlEx9QWZqpVLyx3kK
 HzygJmQvjh86Q==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5177B17E139A;
 Sun, 25 Jan 2026 01:23:10 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 25 Jan 2026 02:22:59 +0200
Subject: [PATCH 1/5] drm/bridge: dw-hdmi-qp: Provide HDMI Vendor Specific
 InfoFrame
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-dw-hdmi-qp-iframe-v1-1-e0f7649ecc4b@collabora.com>
References: <20260125-dw-hdmi-qp-iframe-v1-0-e0f7649ecc4b@collabora.com>
In-Reply-To: <20260125-dw-hdmi-qp-iframe-v1-0-e0f7649ecc4b@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 680AD7F5AE
X-Rspamd-Action: no action

Since commit b626b1a1c9cc ("drm/bridge: refactor HDMI InfoFrame
callbacks"), the following warning is generated:

  [   13.654149] rockchip-drm display-subsystem: [drm] HDMI VSI not supported

Add the missing support for sending HDMI Vendor-Specific Infoframes.

Additionally, introduce the dw_hdmi_qp_write_pkt() utility function, as
a prerequisite to rework the *_write_*_infoframe() callbacks and get rid
of some boilerplate code.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 32 +++++++++++++++++++++++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h |  2 ++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 036316e2b60d..b37af6a7e194 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/i2c.h>
 #include <linux/irq.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -969,9 +970,9 @@ static int dw_hdmi_qp_bridge_clear_avi_infoframe(struct drm_bridge *bridge)
 
 static int dw_hdmi_qp_bridge_clear_hdmi_infoframe(struct drm_bridge *bridge)
 {
-	/* FIXME: add support for this InfoFrame */
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
-	drm_warn_once(bridge->encoder->dev, "HDMI VSI not supported\n");
+	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_VSI_TX_EN, PKTSCHED_PKT_EN);
 
 	return 0;
 }
@@ -998,6 +999,18 @@ static int dw_hdmi_qp_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
 	return 0;
 }
 
+static void dw_hdmi_qp_write_pkt(struct dw_hdmi_qp *hdmi, const u8 *buffer,
+				 size_t start, size_t len, unsigned int reg)
+{
+	u32 val = 0;
+	size_t i;
+
+	for (i = start; i < start + len; i++)
+		val |= buffer[i] << ((i % 4) * 8);
+
+	dw_hdmi_qp_write(hdmi, val, reg);
+}
+
 static int dw_hdmi_qp_bridge_write_avi_infoframe(struct drm_bridge *bridge,
 						 const u8 *buffer, size_t len)
 {
@@ -1011,9 +1024,22 @@ static int dw_hdmi_qp_bridge_write_avi_infoframe(struct drm_bridge *bridge,
 static int dw_hdmi_qp_bridge_write_hdmi_infoframe(struct drm_bridge *bridge,
 						  const u8 *buffer, size_t len)
 {
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+	size_t i;
+
 	dw_hdmi_qp_bridge_clear_hdmi_infoframe(bridge);
 
-	/* FIXME: add support for the HDMI VSI */
+	/* VSI packet header */
+	dw_hdmi_qp_write_pkt(hdmi, buffer, 1, 2, PKT_VSI_CONTENTS0);
+
+	/* VSI packet body */
+	for (i = 0; i < len - 3; i += 4)
+		dw_hdmi_qp_write_pkt(hdmi, buffer + 3, i, min(len - i - 3, 4),
+				     PKT_VSI_CONTENTS1 + i);
+
+	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_VSI_FIELDRATE, PKTSCHED_PKT_CONFIG1);
+	dw_hdmi_qp_mod(hdmi, PKTSCHED_VSI_TX_EN, PKTSCHED_VSI_TX_EN,
+		       PKTSCHED_PKT_EN);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
index 91a15f82e32a..53688eae8dba 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
@@ -198,6 +198,7 @@
 #define PKTSCHED_PRQUEUE2_CONFIG2			0xa94
 #define PKTSCHED_PKT_CONFIG0				0xa98
 #define PKTSCHED_PKT_CONFIG1				0xa9c
+#define PKTSCHED_VSI_FIELDRATE				BIT(14)
 #define PKTSCHED_DRMI_FIELDRATE				BIT(13)
 #define PKTSCHED_AVI_FIELDRATE				BIT(12)
 #define PKTSCHED_PKT_CONFIG2				0xaa0
@@ -206,6 +207,7 @@
 #define PKTSCHED_DRMI_TX_EN				BIT(17)
 #define PKTSCHED_AUDI_TX_EN				BIT(15)
 #define PKTSCHED_AVI_TX_EN				BIT(13)
+#define PKTSCHED_VSI_TX_EN				BIT(12)
 #define PKTSCHED_EMP_CVTEM_TX_EN			BIT(10)
 #define PKTSCHED_AMD_TX_EN				BIT(8)
 #define PKTSCHED_GCP_TX_EN				BIT(3)

-- 
2.52.0

