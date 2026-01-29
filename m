Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGK3JPhOe2n9DgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 13:13:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44795AFF4A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 13:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEA910E84A;
	Thu, 29 Jan 2026 12:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V+zMPHJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D42610E244
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769688817;
 bh=xdhkekPo3kh19syYUuARxRHdMgZBVsCYB5XBYgJUQpk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=V+zMPHJg+jKRTTIkPwBQSQjzQb2QiYWk4tTQ5P38cjFNCgYSrg1y8xPWyu6nPj3EZ
 VDgXuyPIOHAEjocygwLSjv0cTKRLub5a4BGfb/lnwZ9kqlYyAznOxzvj7oEGS4Z7kp
 F38kQLDVCOHRo61Jic2Ma0iihHwcSOypUfOLGfusOE3/QiEI74087fhOlnYfwVVi0j
 RVX3EMqOqheA1EK9VNh5NamVNSk6UNJfSTPODJxkUVQ9YbV4h1AbQSwuUUjwv6R9GA
 Ozbo5Rnl5tA5pZfe2gsgD0mjtVToBkJf1HUmLUrC/04qfCs2oX37KHBL1UKg9Ndj1C
 T149mAkPgGNFg==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AA8D717E1305;
 Thu, 29 Jan 2026 13:13:37 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 29 Jan 2026 14:13:32 +0200
Subject: [PATCH v2 1/5] drm/bridge: dw-hdmi-qp: Provide HDMI Vendor
 Specific InfoFrame
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-dw-hdmi-qp-iframe-v2-1-0157ad05232c@collabora.com>
References: <20260129-dw-hdmi-qp-iframe-v2-0-0157ad05232c@collabora.com>
In-Reply-To: <20260129-dw-hdmi-qp-iframe-v2-0-0157ad05232c@collabora.com>
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
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 44795AFF4A
X-Rspamd-Action: no action

Since commit b626b1a1c9cc ("drm/bridge: refactor HDMI InfoFrame
callbacks"), the following warning is generated:

  [   13.654149] rockchip-drm display-subsystem: [drm] HDMI VSI not supported

Add the missing support for sending HDMI Vendor-Specific Infoframes.

Additionally, introduce dw_hdmi_qp_write_{pkt|infoframe}() helpers, as a
prerequisite to rework all dw_hdmi_qp_bridge_write_*_infoframe()
callbacks and get rid of some boilerplate code.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 39 +++++++++++++++++++++++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h |  2 ++
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 036316e2b60d..93aae1d8027d 100644
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
@@ -998,6 +999,32 @@ static int dw_hdmi_qp_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
 	return 0;
 }
 
+static void dw_hdmi_qp_write_pkt(struct dw_hdmi_qp *hdmi, const u8 *buffer,
+				 size_t start, size_t len, unsigned int reg)
+{
+	u32 val = 0;
+	size_t i;
+
+	for (i = start; i < start + len; i++)
+		val |= buffer[i] << ((i % 4) * BITS_PER_BYTE);
+
+	dw_hdmi_qp_write(hdmi, val, reg);
+}
+
+static void dw_hdmi_qp_write_infoframe(struct dw_hdmi_qp *hdmi, const u8 *buffer,
+				       size_t len, unsigned int reg)
+{
+	size_t i;
+
+	/* InfoFrame packet header */
+	dw_hdmi_qp_write_pkt(hdmi, buffer, 1, 2, reg);
+
+	/* InfoFrame packet body */
+	for (i = 0; i < len - 3; i += 4)
+		dw_hdmi_qp_write_pkt(hdmi, buffer + 3, i, min(len - i - 3, 4),
+				     reg + i + 4);
+}
+
 static int dw_hdmi_qp_bridge_write_avi_infoframe(struct drm_bridge *bridge,
 						 const u8 *buffer, size_t len)
 {
@@ -1011,9 +1038,15 @@ static int dw_hdmi_qp_bridge_write_avi_infoframe(struct drm_bridge *bridge,
 static int dw_hdmi_qp_bridge_write_hdmi_infoframe(struct drm_bridge *bridge,
 						  const u8 *buffer, size_t len)
 {
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
 	dw_hdmi_qp_bridge_clear_hdmi_infoframe(bridge);
 
-	/* FIXME: add support for the HDMI VSI */
+	dw_hdmi_qp_write_infoframe(hdmi, buffer, len, PKT_VSI_CONTENTS0);
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

