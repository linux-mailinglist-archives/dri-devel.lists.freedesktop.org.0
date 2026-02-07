Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFJSCaqAh2lQYwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2464106D15
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7397610E2A6;
	Sat,  7 Feb 2026 18:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=thundersoft.com header.i=@thundersoft.com header.b="IT8kiHUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49219.qiye.163.com (mail-m49219.qiye.163.com
 [45.254.49.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC72C10E034
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 07:33:45 +0000 (UTC)
Received: from [127.0.1.1] (unknown [113.235.123.225])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3372cf66c;
 Sat, 7 Feb 2026 15:33:40 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Sat, 07 Feb 2026 15:32:55 +0800
Subject: [PATCH v3 2/3] drm/bridge: lt9611: Add support for single Port B input
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-rubikpi-next-20260116-v3-2-23b9aa189a3a@thundersoft.com>
References: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
In-Reply-To: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
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
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Shimizu <rosh@debian.org>, 
 linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770449616; l=4162;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=PTcMGocOGLNZzpDNYg1KuEyBmQ+wecbqFTkvC/xXswA=;
 b=D6xU4W1qPw4YTCvAhUtr9fmS/t5iXXLLGgCXL/QUflLYt4XU2U/yAknbhEHrR8tCUVIwzJyw5
 TC0QAxCN6smAVL4ZhAyfsl0sJcU4PWnarpMvbH1VNZZIRGd5rDrsMo0
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9c37054dc609d5kunm3723250e7f307e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTU1IVkoYHRgZTE1OHUhJQlYVFAkWGhdVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJSFVJSU5ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
 tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=IT8kiHUSj4RARAHRV+rCu7+NpdqWtXrnpANLHCEhGApNdyAKlcVqUMkDgOI+UuTkwC9EuHSPdTy5AZeW3OyEKcwVkw+oz4PoC7mVcEfdPSUJ+UeunT79qefO9Ouki1sVIkX4DwwNttZeo7pJKQHPerMxxnYtx+FV28F/h5MJvsI=;
 c=relaxed/relaxed; s=default; d=thundersoft.com; v=1; 
 bh=pHs0dodq2NjkLOpG7xo8CQbHcYnp5U793Xup4vGHqgY=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Sat, 07 Feb 2026 18:12:44 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:christopher.obbard@linaro.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rosh@debian.org,m:linux-arm-msm@vger.kernel.org,m:hongyang.zhao@thundersoft.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,oss.qualcomm.com];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.928];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: B2464106D15
X-Rspamd-Action: no action

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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
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

