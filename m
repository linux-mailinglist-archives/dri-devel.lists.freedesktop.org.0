Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK7OKcckemkO3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5470DA36CE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1D610E71B;
	Wed, 28 Jan 2026 15:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=thundersoft.com header.i=@thundersoft.com header.b="ZQUJCJQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3292.qiye.163.com (mail-m3292.qiye.163.com
 [220.197.32.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C57E10E20E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:16:23 +0000 (UTC)
Received: from [127.0.1.1] (unknown [36.129.139.90])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3248e5337;
 Wed, 28 Jan 2026 19:16:18 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 28 Jan 2026 19:15:46 +0800
Subject: [PATCH v2 2/3] drm/bridge: lt9611: Add support for single Port B input
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-rubikpi-next-20260116-v2-2-ba51ce8d2bd2@thundersoft.com>
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
In-Reply-To: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Roger Shimizu <rosh@debian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769598974; l=4141;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=P24MgliIXqQoKaVeSTragp6vBnLujAdeb6uaFGa5sG8=;
 b=3O48scbre/K2d0nzF1KjNpGFcT1recqKPlu/U6zkNq/x908N4l0ZLXErYC1UjPxq+MbsVZQ9v
 B6S3AFAYCyUD65eIgFR09D5fiiOexZ6W68TqUE9VU/HsHnhh0QDfIs8
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9c04518ac109d5kunm18b1b2c5170bab
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ04aVkodGE0ZH0JOTklPTVYVFAkWGhdVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
 VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
 b=ZQUJCJQgIPFxIRt++F2CjDFn2Wmyev54Eo5funB67YTgdaJKP3wPwu923DXWew4Gh9qTHp1t2ZvIAOD+6vroVlsKF3Um/60Nh5xqq1hRs9hFcU35L32Q/K3cHhIN+F/u1oC6/yM0GAbfJBl9YOfOXzC0pEE2KY2CZMGlAnW05j4=;
 c=relaxed/relaxed; s=default; d=thundersoft.com; v=1; 
 bh=PSv0omJh9EzIj+WWaulrqOd7cQdLigSwaZkNMWMYuNc=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Wed, 28 Jan 2026 15:01:07 +0000
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
X-Spamd-Result: default: False [8.69 / 15.00];
	URIBL_BLACK(7.50)[thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[thundersoft.com:s=default];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:hongyang.zhao@thundersoft.com,m:rosh@debian.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[thundersoft.com,none];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[hongyang.zhao.thundersoft.com:query timed out];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid]
X-Rspamd-Queue-Id: 5470DA36CE
X-Rspamd-Action: add header
X-Spam: Yes

The LT9611 has two DSI input ports. The driver currently assumes Port A
is always used for single-port configurations. However, some boards
connect DSI to Port B only.

Update the driver to detect which ports are populated from devicetree
and configure the hardware accordingly:

- If only port@1 (Port B) is populated, configure port swap (0x8303
  bit 6) and byte_clk source (0x8250 bit 3:2) for Port B operation
- If both ports are populated, use dual-port mode (Port A + B)
- If only port@0 (Port A) is populated, use single Port A (existing
  behavior)

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Reviewed-by: Roger Shimizu <rosh@debian.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 46 +++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744..5fc22489b078 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -116,12 +116,25 @@ static int lt9611_mipi_input_digital(struct lt9611 *lt9611,
 		{ 0x830a, 0x00 },
 		{ 0x824f, 0x80 },
 		{ 0x8250, 0x10 },
+		{ 0x8303, 0x00 },
 		{ 0x8302, 0x0a },
 		{ 0x8306, 0x0a },
 	};
 
-	if (lt9611->dsi1_node)
-		reg_cfg[1].def = 0x03;
+	if (lt9611->dsi1_node) {
+		if (lt9611->dsi0_node) {
+			/* Dual port (Port A + B) */
+			reg_cfg[1].def = 0x03;
+		} else {
+			/*
+			 * Single port B:
+			 * - 0x8303 bit 6: port swap (1=PortB as primary)
+			 * - 0x8250 bit 3:2: byte_clk source (01=PortB)
+			 */
+			reg_cfg[3].def = 0x14;
+			reg_cfg[4].def = 0x40;
+		}
+	}
 
 	return regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
 }
@@ -202,7 +215,9 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 	regmap_write(lt9611->regmap, 0x831d, pol);
 
 	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
-	if (lt9611->dsi1_node) {
+
+	/* dual port: configure hact for combining two DSI inputs */
+	if (lt9611->dsi0_node && lt9611->dsi1_node) {
 		unsigned int hact = mode->hdisplay;
 
 		hact >>= 2;
@@ -759,7 +774,8 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->hdisplay > 3840)
 		return MODE_BAD_HVALUE;
 
-	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
+	/* high resolution requires dual port (Port A + B) */
+	if (mode->hdisplay > 2000 && !(lt9611->dsi0_node && lt9611->dsi1_node))
 		return MODE_PANEL;
 
 	return MODE_OK;
@@ -1015,13 +1031,13 @@ static int lt9611_parse_dt(struct device *dev,
 			   struct lt9611 *lt9611)
 {
 	lt9611->dsi0_node = of_graph_get_remote_node(dev->of_node, 0, -1);
-	if (!lt9611->dsi0_node) {
-		dev_err(lt9611->dev, "failed to get remote node for primary dsi\n");
+	lt9611->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
+
+	if (!lt9611->dsi0_node && !lt9611->dsi1_node) {
+		dev_err(lt9611->dev, "failed to get remote node for dsi\n");
 		return -ENODEV;
 	}
 
-	lt9611->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
-
 	lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
 
 	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611->next_bridge);
@@ -1142,14 +1158,16 @@ static int lt9611_probe(struct i2c_client *client)
 
 	drm_bridge_add(&lt9611->bridge);
 
-	/* Attach primary DSI */
-	lt9611->dsi0 = lt9611_attach_dsi(lt9611, lt9611->dsi0_node);
-	if (IS_ERR(lt9611->dsi0)) {
-		ret = PTR_ERR(lt9611->dsi0);
-		goto err_remove_bridge;
+	/* Attach primary DSI (directly drives or Port A in dual-port mode) */
+	if (lt9611->dsi0_node) {
+		lt9611->dsi0 = lt9611_attach_dsi(lt9611, lt9611->dsi0_node);
+		if (IS_ERR(lt9611->dsi0)) {
+			ret = PTR_ERR(lt9611->dsi0);
+			goto err_remove_bridge;
+		}
 	}
 
-	/* Attach secondary DSI, if specified */
+	/* Attach secondary DSI (Port B in single or dual-port mode) */
 	if (lt9611->dsi1_node) {
 		lt9611->dsi1 = lt9611_attach_dsi(lt9611, lt9611->dsi1_node);
 		if (IS_ERR(lt9611->dsi1)) {

-- 
2.43.0

