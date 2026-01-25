Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKC3KXZidWl+EwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 01:23:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5788A7F5B6
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 01:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBBE10E34F;
	Sun, 25 Jan 2026 00:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="frFEKuGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF1C10E0BA
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 00:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769300591;
 bh=8wqL/j4IJaRId1cc1OMklQAuagooBA7lFvGgZ3lacX8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=frFEKuGokJ0COs1C06/4drGybqj+WfBIdgKTIXNgv6FZFFmcKIg79ENI62cf5r/Dl
 9IakN36H7UPg9kN247/Fr/BPLSvqL8hsbTwoWEe2s+h22Ir++ne8mrQzjHA7h7/Jia
 teWhm666YmzAg3OZcBaV8hGJCDouNp8qK8ZwzWgqjsT/UHspHvvzbCH0J9+lI036Yi
 9vLq40BndVRcdVgtjem9rj+fmd2YTrUpyx5rpv0Y1FbesA9Jh3FEMRFW9Zm6pxfBOh
 a1BxUi8z44Oh3ibjCh904dWMcnU6NwL3E+NGvgBi3nyV8wJDzIxJ+NiJ5GnBtj0t2I
 pQixPbjWrXSSA==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 291F117E141C;
 Sun, 25 Jan 2026 01:23:11 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 25 Jan 2026 02:23:00 +0200
Subject: [PATCH 2/5] drm/bridge: dw-hdmi-qp: Provide SPD InfoFrame
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-dw-hdmi-qp-iframe-v1-2-e0f7649ecc4b@collabora.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 5788A7F5B6
X-Rspamd-Action: no action

The hardware is capable of sending Source Product Description (SPD)
InfoFrames, hence enable the missing support.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 36 +++++++++++++++++++++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h |  1 +
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index b37af6a7e194..429736486d85 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -986,6 +986,15 @@ static int dw_hdmi_qp_bridge_clear_hdr_drm_infoframe(struct drm_bridge *bridge)
 	return 0;
 }
 
+static int dw_hdmi_qp_bridge_clear_spd_infoframe(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_SPDI_TX_EN, PKTSCHED_PKT_EN);
+
+	return 0;
+}
+
 static int dw_hdmi_qp_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
@@ -1054,6 +1063,28 @@ static int dw_hdmi_qp_bridge_write_hdr_drm_infoframe(struct drm_bridge *bridge,
 	return dw_hdmi_qp_config_drm_infoframe(hdmi, buffer, len);
 }
 
+static int dw_hdmi_qp_bridge_write_spd_infoframe(struct drm_bridge *bridge,
+						 const u8 *buffer, size_t len)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+	size_t i;
+
+	dw_hdmi_qp_bridge_clear_spd_infoframe(bridge);
+
+	/* SPD packet header */
+	dw_hdmi_qp_write_pkt(hdmi, buffer, 1, 2, PKT_SPDI_CONTENTS0);
+
+	/* SPD packet body */
+	for (i = 0; i < len - 3; i += 4)
+		dw_hdmi_qp_write_pkt(hdmi, buffer + 3, i, min(len - i - 3, 4),
+				     PKT_SPDI_CONTENTS1 + i);
+
+	dw_hdmi_qp_mod(hdmi, PKTSCHED_SPDI_TX_EN, PKTSCHED_SPDI_TX_EN,
+		       PKTSCHED_PKT_EN);
+
+	return 0;
+}
+
 static int dw_hdmi_qp_bridge_write_audio_infoframe(struct drm_bridge *bridge,
 						   const u8 *buffer, size_t len)
 {
@@ -1252,6 +1283,8 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.hdmi_write_hdmi_infoframe = dw_hdmi_qp_bridge_write_hdmi_infoframe,
 	.hdmi_clear_hdr_drm_infoframe = dw_hdmi_qp_bridge_clear_hdr_drm_infoframe,
 	.hdmi_write_hdr_drm_infoframe = dw_hdmi_qp_bridge_write_hdr_drm_infoframe,
+	.hdmi_clear_spd_infoframe = dw_hdmi_qp_bridge_clear_spd_infoframe,
+	.hdmi_write_spd_infoframe = dw_hdmi_qp_bridge_write_spd_infoframe,
 	.hdmi_clear_audio_infoframe = dw_hdmi_qp_bridge_clear_audio_infoframe,
 	.hdmi_write_audio_infoframe = dw_hdmi_qp_bridge_write_audio_infoframe,
 	.hdmi_audio_startup = dw_hdmi_qp_audio_enable,
@@ -1368,7 +1401,8 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 			   DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HDMI |
 			   DRM_BRIDGE_OP_HDMI_AUDIO |
-			   DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME;
+			   DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME |
+			   DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
 	if (!hdmi->no_hpd)
 		hdmi->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.of_node = pdev->dev.of_node;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
index 53688eae8dba..c07847e8d7dd 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
@@ -206,6 +206,7 @@
 #define PKTSCHED_PKT_EN					0xaa8
 #define PKTSCHED_DRMI_TX_EN				BIT(17)
 #define PKTSCHED_AUDI_TX_EN				BIT(15)
+#define PKTSCHED_SPDI_TX_EN				BIT(14)
 #define PKTSCHED_AVI_TX_EN				BIT(13)
 #define PKTSCHED_VSI_TX_EN				BIT(12)
 #define PKTSCHED_EMP_CVTEM_TX_EN			BIT(10)

-- 
2.52.0

