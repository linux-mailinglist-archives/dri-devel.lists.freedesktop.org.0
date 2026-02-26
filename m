Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB0/DT1yoGlZjwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:18:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A91A9F31
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A1110E9AD;
	Thu, 26 Feb 2026 16:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SHZw10H+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9500310E99D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 16:17:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 168D9C4069A;
 Thu, 26 Feb 2026 16:18:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 94A3A5FDE9;
 Thu, 26 Feb 2026 16:17:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D0A25103693F9; Thu, 26 Feb 2026 17:17:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1772122675; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=w5vPufaau/3I2QpJ9e2+Z9v2JqhTHbqrTx3oXaG/ZO4=;
 b=SHZw10H+CRxh0DMlHtFEARQLTPyEM0rce1xFoOvnREX4YLoCytnQZn7K8oGDwMTn0RWNLX
 tRLdcrIZzQ49RjSThw8Z3cIBWZ7+LffiQHIpdK578hl5UCFpCyd1eGXhyaeY3aClwuGi90
 X4w3RZh1u3fOK4Et881Ya/FA2ZlwXAtYT5gt/gPS9pqzVEzoKGXB/6puAtUM6pc8BtJEzu
 WroSs6fqNMgHWL5VkqqvU0CBRVWs6pv90Z7dy1D1cVUXs/F+YFOOXPhh/L6L7WaotxZKMm
 OP94AVuy4REkMxP+fcj5vPEafML0Uw5buzRAc4GikxobSkqYVLQvA484TdCkhA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 26 Feb 2026 17:16:46 +0100
Subject: [PATCH 3/3] drm/bridge: ti-sn65dsi83: add test pattern generation
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-3-2e15f5a9a6a0@bootlin.com>
References: <20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-0-2e15f5a9a6a0@bootlin.com>
In-Reply-To: <20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-0-2e15f5a9a6a0@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, Marek Vasut <marex@denx.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:frieder.schrempf@kontron.de,m:marex@denx.de,m:linusw@kernel.org,m:thomas.petazzoni@bootlin.com,m:linux-kernel@vger.kernel.org,m:luca.ceresoli@bootlin.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,kontron.de,denx.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ti.com:url]
X-Rspamd-Queue-Id: BA4A91A9F31
X-Rspamd-Action: no action

Generation of a test pattern output is a useful tool for panel bringup and
debugging, and very simple to support with this chip.

The value of REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW needs to be divided by two
for the test pattern to work in dual LVDS mode. While not clearly stated in
the datasheet, this is needed according to the DSI Tuner [0] output. And
some dual-LVDS panels refuse to show any picture without this division by
two.

[0] https://www.ti.com/tool/DSI-TUNER

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 17a885244e1e..ddc8b5e1dd15 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -114,6 +114,7 @@
 #define REG_VID_CHA_HORIZONTAL_FRONT_PORCH	0x38
 #define REG_VID_CHA_VERTICAL_FRONT_PORCH	0x3a
 #define REG_VID_CHA_TEST_PATTERN		0x3c
+#define  REG_VID_CHA_TEST_PATTERN_EN		BIT(4)
 /* IRQ registers */
 #define REG_IRQ_GLOBAL				0xe0
 #define  REG_IRQ_GLOBAL_IRQ_EN			BIT(0)
@@ -134,6 +135,9 @@
 #define  REG_IRQ_STAT_CHA_SOT_BIT_ERR		BIT(2)
 #define  REG_IRQ_STAT_CHA_PLL_UNLOCK		BIT(0)
 
+static bool sn65dsi83_test_pattern;
+module_param_named(test_pattern, sn65dsi83_test_pattern, bool, 0644);
+
 enum sn65dsi83_channel {
 	CHANNEL_A,
 	CHANNEL_B
@@ -645,7 +649,11 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 			  REG_LVDS_LANE_CHB_LVDS_TERM : 0));
 	regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
 
-	le16val = cpu_to_le16(mode->hdisplay);
+	/*
+	 * Active line length needs to be halved for test pattern
+	 * generation in dual LVDS output.
+	 */
+	le16val = cpu_to_le16(mode->hdisplay / (sn65dsi83_test_pattern ? 2 : 1));
 	regmap_bulk_write(ctx->regmap, REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
 			  &le16val, 2);
 	le16val = cpu_to_le16(mode->vdisplay);
@@ -668,7 +676,8 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 		     (mode->hsync_start - mode->hdisplay) / dual_factor);
 	regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_FRONT_PORCH,
 		     mode->vsync_start - mode->vdisplay);
-	regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);
+	regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN,
+		     sn65dsi83_test_pattern ? REG_VID_CHA_TEST_PATTERN_EN : 0);
 
 	/* Enable PLL */
 	regmap_write(ctx->regmap, REG_RC_PLL_EN, REG_RC_PLL_EN_PLL_EN);

-- 
2.53.0

