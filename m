Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP9sH31idWl+EwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 01:23:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3797F5D2
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 01:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F7C10E354;
	Sun, 25 Jan 2026 00:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VFaZ89uz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7A310E34D
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 00:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769300593;
 bh=QAI83uqgo/uM7ljLBwxT2ak27ApMzV7L2qapCKL1Egc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=VFaZ89uz3ICNtu7MxnfBngLjSgA0J+OXuDSuA0fY6+3KAWESx29mM3aA7KaDDtV7L
 8dWq1ZsvyjSc7GHjn/BQyAHwl2P57N/3c6bFf+9oePd+MZCRerYM6P6Et9x/KDVvfl
 ALvAuWX5ceGX/bBCyRWB5Fmvrz+DJfG6p9ZhLeszQAJJerWW9rn6gSM12Rs3huGmli
 CPa0HzCxLvHuvbM0XbuVe3+0bG3dX+T2i86DQiXy890BJr1HYT5Esc6TP66g5sn23n
 esrpAi9xNuCEm+z88Wrih0HzzA3/bvSABYh38CTEjT/ChgQfwT1l0Px0LKtEVKY6px
 KN8/oJKO77Uxw==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BB62B17E14A5;
 Sun, 25 Jan 2026 01:23:13 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 25 Jan 2026 02:23:03 +0200
Subject: [PATCH 5/5] drm/bridge: dw-hdmi-qp: Rework Audio InfoFrame handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-dw-hdmi-qp-iframe-v1-5-e0f7649ecc4b@collabora.com>
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
X-Rspamd-Queue-Id: 2C3797F5D2
X-Rspamd-Action: no action

Make use of the recently introduced dw_hdmi_qp_write_pkt() helper to
simplify the writing of the Audio InfoFrame packet header and body
registers.

Additionally, discard the redundant static values identifying the frame
version and length.

Moreover, since now having dedicated callbacks per InfoFrame type, move
the implementation to dw_hdmi_qp_bridge_write_audio_infoframe() and
drop dw_hdmi_qp_config_audio_infoframe().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 80 ++++++++++++----------------
 1 file changed, 34 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 178d95a8ecbb..3e612f82c303 100644
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
@@ -1046,10 +1001,43 @@ static int dw_hdmi_qp_bridge_write_audio_infoframe(struct drm_bridge *bridge,
 						   const u8 *buffer, size_t len)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+	size_t i;
 
 	dw_hdmi_qp_bridge_clear_audio_infoframe(bridge);
 
-	return dw_hdmi_qp_config_audio_infoframe(hdmi, buffer, len);
+	/*
+	 * Audio packet header
+	 * AUDI_CONTENTS0: { RSV, HB2, HB1, RSV }
+	 */
+	dw_hdmi_qp_write_pkt(hdmi, buffer, 1, 2, PKT_AUDI_CONTENTS0);
+
+	/*
+	 * Audio packet body
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
+	for (i = 0; i < len - 3; i += 4)
+		dw_hdmi_qp_write_pkt(hdmi, buffer + 3, i, min(len - i - 3, 4),
+				     PKT_AUDI_CONTENTS1 + i);
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

