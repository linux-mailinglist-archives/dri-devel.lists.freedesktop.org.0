Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIwBIwNPe2n9DgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 13:13:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA23AFF6D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 13:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6155210E851;
	Thu, 29 Jan 2026 12:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SrC7j+Yj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D1110E84C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 12:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769688819;
 bh=P/Sm7GjE1nvAjNucuQIDX7Zjc+ux74akiKeAHYyhoRY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SrC7j+Yj5gS12FdPNTHMHTAiJY2jqucBrUPY6xMffBhaqnzh0X90BrL0RMhvOwEkM
 dKs+S6AOWK/AjZ8ioMMzPnA22c7d0g5UZqs0nVzmxo4Fv5jNM6BsQHEt6cxKfHUi7P
 N/yzqXhuQdkQmYZi5NRXrysFFLx3Jc/oPnXuyEwD74Y0+snIOhDZlhjzPZEbrtbJ0h
 DqOC8+gfKTLwGkc+oWB3tGksyeWqU7MkEWWNX1eEF7NyZ1HnpvboizmsbEvpMD4X2v
 eb94S933Nh27P4/OZzEQFHVcrG8mUbgG+ViKYvRg1F4f0NZSHF0ccrtXXAagHq1/ND
 KTU97gjUiVBtQ==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F1F217E1418;
 Thu, 29 Jan 2026 13:13:39 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 29 Jan 2026 14:13:34 +0200
Subject: [PATCH v2 3/5] drm/bridge: dw-hdmi-qp: Rework AVI InfoFrame
 handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-dw-hdmi-qp-iframe-v2-3-0157ad05232c@collabora.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 3EA23AFF6D
X-Rspamd-Action: no action

Make use of the recently introduced dw_hdmi_qp_write_infoframe() helper
to simplify the writing of the Auxiliary Video InfoFrame (AVI) packet
header and body registers.

Moreover, since now having dedicated callbacks per InfoFrame type, move
the implementation to dw_hdmi_qp_bridge_write_avi_infoframe() and drop
dw_hdmi_qp_config_avi_infoframe().

While at it, also discard the superfluous infoframe size verification.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 45 +++++-----------------------
 1 file changed, 7 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index c006939a0f87..abfe5641158f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -748,43 +748,6 @@ static struct i2c_adapter *dw_hdmi_qp_i2c_adapter(struct dw_hdmi_qp *hdmi)
 	return adap;
 }
 
-static int dw_hdmi_qp_config_avi_infoframe(struct dw_hdmi_qp *hdmi,
-					   const u8 *buffer, size_t len)
-{
-	u32 val, i, j;
-
-	if (len != HDMI_INFOFRAME_SIZE(AVI)) {
-		dev_err(hdmi->dev, "failed to configure avi infoframe\n");
-		return -EINVAL;
-	}
-
-	/*
-	 * DW HDMI QP IP uses a different byte format from standard AVI info
-	 * frames, though generally the bits are in the correct bytes.
-	 */
-	val = buffer[1] << 8 | buffer[2] << 16;
-	dw_hdmi_qp_write(hdmi, val, PKT_AVI_CONTENTS0);
-
-	for (i = 0; i < 4; i++) {
-		for (j = 0; j < 4; j++) {
-			if (i * 4 + j >= 14)
-				break;
-			if (!j)
-				val = buffer[i * 4 + j + 3];
-			val |= buffer[i * 4 + j + 3] << (8 * j);
-		}
-
-		dw_hdmi_qp_write(hdmi, val, PKT_AVI_CONTENTS1 + i * 4);
-	}
-
-	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_AVI_FIELDRATE, PKTSCHED_PKT_CONFIG1);
-
-	dw_hdmi_qp_mod(hdmi, PKTSCHED_AVI_TX_EN | PKTSCHED_GCP_TX_EN,
-		       PKTSCHED_AVI_TX_EN | PKTSCHED_GCP_TX_EN, PKTSCHED_PKT_EN);
-
-	return 0;
-}
-
 static int dw_hdmi_qp_config_drm_infoframe(struct dw_hdmi_qp *hdmi,
 					   const u8 *buffer, size_t len)
 {
@@ -1041,7 +1004,13 @@ static int dw_hdmi_qp_bridge_write_avi_infoframe(struct drm_bridge *bridge,
 
 	dw_hdmi_qp_bridge_clear_avi_infoframe(bridge);
 
-	return dw_hdmi_qp_config_avi_infoframe(hdmi, buffer, len);
+	dw_hdmi_qp_write_infoframe(hdmi, buffer, len, PKT_AVI_CONTENTS0);
+
+	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_AVI_FIELDRATE, PKTSCHED_PKT_CONFIG1);
+	dw_hdmi_qp_mod(hdmi, PKTSCHED_AVI_TX_EN | PKTSCHED_GCP_TX_EN,
+		       PKTSCHED_AVI_TX_EN | PKTSCHED_GCP_TX_EN, PKTSCHED_PKT_EN);
+
+	return 0;
 }
 
 static int dw_hdmi_qp_bridge_write_hdmi_infoframe(struct drm_bridge *bridge,

-- 
2.52.0

