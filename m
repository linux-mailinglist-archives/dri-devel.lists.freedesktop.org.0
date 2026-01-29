Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNjkOfxOe2n9DgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 13:13:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8513BAFF51
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 13:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A5D10E84B;
	Thu, 29 Jan 2026 12:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HRQSns4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934A110E84B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769688821;
 bh=Y5cnz7/7Nno5HroZNG8LyxA6SXEx7p9n08HM8mkOWf0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HRQSns4JwKpSX88bs8nSt9oOm0RUHr2NNqNV25EXsoSf85EfLW9p7jk/0okJw2Xvy
 B3Z28H1Mi5cj0pqAjkMnRElb+Uwm0dEliGjwR2ly+IiL63hc00aixXBKPmzm8Uhoje
 mUcN+5WcFCyVAJqsysUxeed0A5dT+F/0jtO41F3wIwaCF3a659vxHERM5Wt74n7Mb9
 37Xca7SfNWQ6UE+xbc7R/6AC8QhJjELn0LYZsi6QC+5AQNlJkoyYl+jz4eQ3Hl16iT
 FdLDIo9m3NtpkZTbWCiI6FD6svxuCQASEzUuCemxF62YPJ18qbKhofd4D+2fSQ2lvT
 miLzTJ97yS6SQ==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1892517E14F5;
 Thu, 29 Jan 2026 13:13:41 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 29 Jan 2026 14:13:36 +0200
Subject: [PATCH v2 5/5] drm/bridge: dw-hdmi-qp: Rework Audio InfoFrame handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-dw-hdmi-qp-iframe-v2-5-0157ad05232c@collabora.com>
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
X-Rspamd-Queue-Id: 8513BAFF51
X-Rspamd-Action: no action

Make use of the recently introduced dw_hdmi_qp_write_infoframe() helper
to simplify the writing of the Audio InfoFrame packet header and body
registers.

Additionally, discard the redundant static values identifying the frame
version and length.

Moreover, since now having dedicated callbacks per InfoFrame type, move
the implementation to dw_hdmi_qp_bridge_write_audio_infoframe() and
drop dw_hdmi_qp_config_audio_infoframe().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 71 ++++++++++------------------
 1 file changed, 25 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 33c990e198e9..464ace1221d0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -748,51 +748,6 @@ static struct i2c_adapter *dw_hdmi_qp_i2c_adapter(struct dw_hdmi_qp *hdmi)
 	return adap;
 }
 
-/*
- * Static values documented in the TRM
- * Different values are only used for debug purposes
- */
-#define DW_HDMI_QP_AUDIO_INFOFRAME_HB1	0x1
-#define DW_HDMI_QP_AUDIO_INFOFRAME_HB2	0xa
-
-static int dw_hdmi_qp_config_audio_infoframe(struct dw_hdmi_qp *hdmi,
-					     const u8 *buffer, size_t len)
-{
-	/*
-	 * AUDI_CONTENTS0: { RSV, HB2, HB1, RSV }
-	 * AUDI_CONTENTS1: { PB3, PB2, PB1, PB0 }
-	 * AUDI_CONTENTS2: { PB7, PB6, PB5, PB4 }
-	 *
-	 * PB0: CheckSum
-	 * PB1: | CT3    | CT2  | CT1  | CT0  | F13  | CC2 | CC1 | CC0 |
-	 * PB2: | F27    | F26  | F25  | SF2  | SF1  | SF0 | SS1 | SS0 |
-	 * PB3: | F37    | F36  | F35  | F34  | F33  | F32 | F31 | F30 |
-	 * PB4: | CA7    | CA6  | CA5  | CA4  | CA3  | CA2 | CA1 | CA0 |
-	 * PB5: | DM_INH | LSV3 | LSV2 | LSV1 | LSV0 | F52 | F51 | F50 |
-	 * PB6~PB10: Reserved
-	 *
-	 * AUDI_CONTENTS0 default value defined by HDMI specification,
-	 * and shall only be changed for debug purposes.
-	 */
-	u32 header_bytes = (DW_HDMI_QP_AUDIO_INFOFRAME_HB1 << 8) |
-			  (DW_HDMI_QP_AUDIO_INFOFRAME_HB2 << 16);
-
-	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS0, &header_bytes, 1);
-	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 1);
-	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[4], 1);
-
-	/* Enable ACR, AUDI, AMD */
-	dw_hdmi_qp_mod(hdmi,
-		       PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
-		       PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
-		       PKTSCHED_PKT_EN);
-
-	/* Enable AUDS */
-	dw_hdmi_qp_mod(hdmi, PKTSCHED_AUDS_TX_EN, PKTSCHED_AUDS_TX_EN, PKTSCHED_PKT_EN);
-
-	return 0;
-}
-
 static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 					    struct drm_atomic_state *state)
 {
@@ -1035,7 +990,31 @@ static int dw_hdmi_qp_bridge_write_audio_infoframe(struct drm_bridge *bridge,
 
 	dw_hdmi_qp_bridge_clear_audio_infoframe(bridge);
 
-	return dw_hdmi_qp_config_audio_infoframe(hdmi, buffer, len);
+	/*
+	 * AUDI_CONTENTS0: { RSV, HB2, HB1, RSV }
+	 * AUDI_CONTENTS1: { PB3, PB2, PB1, PB0 }
+	 * AUDI_CONTENTS2: { PB7, PB6, PB5, PB4 }
+	 *
+	 * PB0: CheckSum
+	 * PB1: | CT3    | CT2  | CT1  | CT0  | F13  | CC2 | CC1 | CC0 |
+	 * PB2: | F27    | F26  | F25  | SF2  | SF1  | SF0 | SS1 | SS0 |
+	 * PB3: | F37    | F36  | F35  | F34  | F33  | F32 | F31 | F30 |
+	 * PB4: | CA7    | CA6  | CA5  | CA4  | CA3  | CA2 | CA1 | CA0 |
+	 * PB5: | DM_INH | LSV3 | LSV2 | LSV1 | LSV0 | F52 | F51 | F50 |
+	 * PB6~PB10: Reserved
+	 */
+	dw_hdmi_qp_write_infoframe(hdmi, buffer, len, PKT_AUDI_CONTENTS0);
+
+	/* Enable ACR, AUDI, AMD */
+	dw_hdmi_qp_mod(hdmi,
+		       PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
+		       PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
+		       PKTSCHED_PKT_EN);
+
+	/* Enable AUDS */
+	dw_hdmi_qp_mod(hdmi, PKTSCHED_AUDS_TX_EN, PKTSCHED_AUDS_TX_EN, PKTSCHED_PKT_EN);
+
+	return 0;
 }
 
 #ifdef CONFIG_DRM_DW_HDMI_QP_CEC

-- 
2.52.0

