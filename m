Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBCqDAGnk2ly7QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6127A1480FA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC6010E408;
	Mon, 16 Feb 2026 23:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=puri.sm header.i=@puri.sm header.b="cDrcZ4li";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 409 seconds by postgrey-1.36 at gabe;
 Mon, 16 Feb 2026 17:52:26 UTC
Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EED10E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 17:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
 t=1771263935; bh=QDjI7MxDc9tNLfe2Zf6+1XD5ktYd7ry15WkQWujbde0=;
 h=From:Date:Subject:To:Cc;
 b=cDrcZ4liqruMeKDh7O1bIU+SKY+EJQtaWn9vcFszWwqGoWw48claQtfx4An++GZZJ
 Lvg40uwXGahM31QoTJL+hrir2Ku/rSvHddwEp4A8TTECrO/qbmaHlDIdTBi4FXuPfc
 5AAH8hRuWoPFmJ7leMimVkQiQqwzDBaeZRSuogWKehFRUJ0b3PSAwOigkMrg2BomRK
 Sk4pQf5fE6QoD8Gz4+TOYkv45N+k4Vq1MVi1jXE54fG2beXJma/xYja/p8m0gN+v11
 X9cffY/FWxA4dYsFNJJYbBH3M25qnkPDp3vyQZEZjpaR8lx/4f/N+F2g1lgz+axuGR
 P52uO5XT5kbfA==
Received: from pliszka.localdomain (83.24.23.188.ipv4.supernova.orange.pl
 [83.24.23.188]) by ms.puri.sm (Postfix) with ESMTPSA id BD1F41FCC3;
 Mon, 16 Feb 2026 09:45:34 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Mon, 16 Feb 2026 18:45:30 +0100
Subject: [PATCH] drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync timing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-nwl-sync-timing-v1-1-b0ff6ecf204a@puri.sm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MPQ7CMAxA4atUnrFIMwTKVRCDk5rWUmuQXf5U9
 e4Exm94bwVnE3Y4NSsYP8XlphXtroEykg6M0ldDDDGF2CbU14T+0YKLzKIDHo5diJRTF3IPtbo
 bX+X9P54v1ZmcMRtpGX+fSfTh+5l8YYNt+wKq0K7agAAAAA==
X-Change-ID: 20260216-nwl-sync-timing-78902ab690bd
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Robert Chiras <robert.chiras@nxp.com>, Fabio Estevam <festevam@gmail.com>
Cc: kernel@puri.sm, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, "Oliver F. Brown" <oliver.brown@oss.nxp.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4255;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=R/VUS2MGXIFHdl7AHx/nvlpF7bfgL1M4MGRy5oiKxmo=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpk1e+46JRX5i48E5ybVOU9AqkvGT4NiXfS9fIk
 dPdggOc7YGJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZNXvgAKCRDo8jXPO9vD
 //DaD/9ikR/bRJqHyVg0AC2B4Tz7eJeu4ugfoaX/tHvnNV+UazMHCTYVGQL6Mm1VuqMZfRkUrlF
 cbvhLwUwhnlZWWf0cNtKEIuXcrFLA3uMhfMbRVjfKO9vS1n883yzHVkBUBgR/jDr+iKG9tVvF+l
 YIEwuZWtrsH9syPlVFOPvTjeQaKA5awNU2SAfelRzskX0R/ONr52ryJkHAb4HKU0Au776mtunAD
 fKoFiMT6UxJQGafj5jf+RAZInvFHXW6+PT/UbxF/Bw+rdOVAM1otgSGIgwlPvgEu+IfJBaJqD/J
 JmDc8vTar7qZzX/6cfg6Ag04vbLcVu1xj1bgo3wq43iXv84ziqSFV4mpY5BBYle/MQ0zkAyz8HC
 0idv8sCB8EwG+at2a/vtTsDUYgIvwbhdjo8upmeuZH/R1XQXBz2G28biQqvL+eXKhFoQOUokUnc
 sAzmQv3Ad7208KRkqZstEzGr34eoPg4l5aJ8KEeDS6LrxTFRrbhCV6O6o7HeJnIzZ92SsBBoAiI
 F2blbT3GNa6rSRu/EbYRcHcUHHvJDbcdAePHSyj25fhksw7ClhrFSorML/vcuX18eNeBjpXx+Qh
 MWVoxrS1Kkmu8V3EVLFuE3I6laBXxfcK6o0HfDB3qjHCO8lrIakNus8LT6DYQwxRa0+rmvUtXpl
 HumRG/DWTeMgQXA==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Mailman-Approved-At: Mon, 16 Feb 2026 23:23:19 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[puri.sm,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[puri.sm:s=smtp2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sam@ravnborg.org,m:agx@sigxcpu.org,m:robert.chiras@nxp.com,m:festevam@gmail.com,m:kernel@puri.sm,m:linux-kernel@vger.kernel.org,m:oliver.brown@oss.nxp.com,m:sebastian.krzyszkowiak@puri.sm,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sebastian.krzyszkowiak@puri.sm,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,sigxcpu.org,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[puri.sm:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sebastian.krzyszkowiak@puri.sm,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,puri.sm:mid,puri.sm:dkim,puri.sm:email]
X-Rspamd-Queue-Id: 6127A1480FA
X-Rspamd-Action: no action

From: Robert Chiras <robert.chiras@nxp.com>

The NWL MIPI Host controller registers set the number of bytes for the
horzontal front porch, sync pulse, and back porch, not the number of
pixels. The formula converts the hfp, hsa, and hbp to bytes then subtracts
the number of packet overhead bytes in the horizontal line which totals 32.
The overhead is split into three proportional chunks and subtracted from
fp, hsa, and hbp.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Oliver F. Brown <oliver.brown@oss.nxp.com>
Fixes: 44cfc6233447 ("drm/bridge: Add NWL MIPI DSI host controller support")
Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
Taken from the NXP linux-imx fork. This makes it possible to e.g.
correctly drive the Librem 5's internal DSI panel at 60 Hz.
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 66 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 2f7429b24fc2..18e4bfe66b4b 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -260,6 +260,10 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
 	bool burst_mode;
 	int hfront_porch, hback_porch, vfront_porch, vback_porch;
 	int hsync_len, vsync_len;
+	int hfp, hbp, hsa;
+	unsigned long long pclk_period;
+	unsigned long long hs_period;
+	int h_blank, pkt_hdr_len, pkt_len;
 
 	hfront_porch = dsi->mode.hsync_start - dsi->mode.hdisplay;
 	hsync_len = dsi->mode.hsync_end - dsi->mode.hsync_start;
@@ -313,9 +317,65 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
 			      dsi->mode.hdisplay);
 	}
 
-	nwl_dsi_write(dsi, NWL_DSI_HFP, hfront_porch);
-	nwl_dsi_write(dsi, NWL_DSI_HBP, hback_porch);
-	nwl_dsi_write(dsi, NWL_DSI_HSA, hsync_len);
+	pclk_period = ALIGN(PSEC_PER_SEC, dsi->mode.clock * 1000);
+	do_div(pclk_period, dsi->mode.clock * 1000);
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "pclk_period: %llu\n", pclk_period);
+
+	hs_period = ALIGN(PSEC_PER_SEC, dsi->phy_cfg.mipi_dphy.hs_clk_rate);
+	do_div(hs_period, dsi->phy_cfg.mipi_dphy.hs_clk_rate);
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "hs_period: %llu\n", hs_period);
+
+	/*
+	 * Calculate the bytes needed, according to the RM formula:
+	 * Time of DPI event = time to transmit x number of bytes on the DSI
+	 * interface
+	 * dpi_event_size * dpi_pclk_period = dsi_bytes * 8 * hs_bit_period /
+	 * num_lanes
+	 * ===>
+	 * dsi_bytes = dpi_event_size * dpi_pclk_period * num_lanes /
+	 * (8 * hs_bit_period)
+	 */
+	hfp = hfront_porch * pclk_period * dsi->lanes / (8 * hs_period);
+	hbp = hback_porch * pclk_period * dsi->lanes / (8 * hs_period);
+	hsa = hsync_len * pclk_period * dsi->lanes / (8 * hs_period);
+
+	/* Make sure horizontal blankins are even numbers */
+	hfp = roundup(hfp, 2);
+	hbp = roundup(hbp, 2);
+	hsa = roundup(hsa, 2);
+
+	/*
+	 * We need to subtract the packet header length: 32
+	 * In order to make sure we don't get negative values,
+	 * subtract a proportional value to the total length of the
+	 * horizontal blanking duration.
+	 */
+	h_blank = hfp + hbp + hsa;
+
+	pkt_len = roundup(((hfp * 100 / h_blank) * 32) / 100, 2);
+	pkt_hdr_len = pkt_len;
+	hfp -= pkt_len;
+
+	pkt_len = roundup(((hbp * 100 / h_blank) * 32) / 100, 2);
+	pkt_hdr_len += pkt_len;
+	hbp -= pkt_len;
+
+	hsa -= (32 - pkt_hdr_len);
+
+	if (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
+		hfp = hfront_porch;
+	if (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
+		hbp = hback_porch;
+	if (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
+		hsa = hsync_len;
+
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Actual hfp: %d\n", hfp);
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Actual hbp: %d\n", hbp);
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Actual hsa: %d\n", hsa);
+
+	nwl_dsi_write(dsi, NWL_DSI_HFP, hfp);
+	nwl_dsi_write(dsi, NWL_DSI_HBP, hbp);
+	nwl_dsi_write(dsi, NWL_DSI_HSA, hsa);
 
 	nwl_dsi_write(dsi, NWL_DSI_ENABLE_MULT_PKTS, 0x0);
 	nwl_dsi_write(dsi, NWL_DSI_BLLP_MODE, 0x1);

---
base-commit: 0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
change-id: 20260216-nwl-sync-timing-78902ab690bd

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

