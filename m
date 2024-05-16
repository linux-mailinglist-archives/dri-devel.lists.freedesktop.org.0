Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C188C719C
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 08:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0003210E35B;
	Thu, 16 May 2024 06:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="OvVRu5Be";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GzR3r79t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631CB10E35F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1715840716; x=1747376716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pjwDRb2G8zbxPaNc+6tKezQ18Sz0q1wOIQZhKqVMLVI=;
 b=OvVRu5BebKHRHR+BtHfXcFHqHYcMldAqGx3xh3ZB+6RX5QtpSzD1ExzL
 6OrVUN4Z04654b6H/dUolXaiBRnFdr5Yhkk5J9m2knKXVFVzA7eik0078
 xku89WTm3nwGTlxdWYoM6JWXX7Pcs4sw0y1jO4J+yOXwM+PrBP8Fqsek1
 O72G0Pl6Qyx/qVccNho8gB4Bo7GVM1JuDO176HYE1r30qlRDyU2BqO5me
 yZS6ZFYdZ0M+UmsAjk4CUVu260K+w/dx1Rq03fBKouYsJbRLDeY2qZxLy
 oR3ENDM9uOBU3cfVT/VRYWvwUOjC1MuMf1vX0CD8+eXtt8HqFaTvtuksb g==;
X-CSE-ConnectionGUID: 8Zh0bOBDSNqc60l5W+vPSw==
X-CSE-MsgGUID: HmPVmQodSIaBzFT1MtwTfQ==
X-IronPort-AV: E=Sophos;i="6.08,163,1712613600"; d="scan'208";a="36926967"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 16 May 2024 08:25:15 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 54669172BB1; Thu, 16 May 2024 08:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1715840711; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=pjwDRb2G8zbxPaNc+6tKezQ18Sz0q1wOIQZhKqVMLVI=;
 b=GzR3r79t9O7j1ByvAwCMbL1xieMpA+SDimX0ooFuOfNOlHs937Tc8x+Q7yT2Pr3gp6LEKi
 +RUePh2UyGihMp6CnJ5swrw8lTGV7bBZthQoCqXgMVGltCqUwtZAtONSkzsG6c+ByRpl9J
 XGrAPhVVMDbuqLpBf5hxrEgyCNgZfq9D1YDFvGw+JrEyfbGwNOn2UrYMSPb2k5ZvVV2LGT
 /pfwh5UKBCNwm9AOWoiniV6B20tc4QPQPCEjk0I7I51/eTgMq21/nztZa90PQExrHW2O4H
 NaIXL3cB3MB0WkdrMUqyVlcSYtOjOmTW2+ToDngyY7jn7jFvtvYzBptzlge+hA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] drm/bridge: tc358767: Support write-only registers
Date: Thu, 16 May 2024 08:24:55 +0200
Message-Id: <20240516062455.106266-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516062455.106266-1-alexander.stein@ew.tq-group.com>
References: <20240516062455.106266-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Most registers are read-writable, but some are only RO or even WO.
regmap does not support using readable_reg and wr_table when outputting
in debugfs, so switch to writeable_reg.
First check for RO or WO registers and fallback tc_readable_reg() for the
leftover RW registers.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 40 ++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 8874713bdd4a4..04c98ab1991bd 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2086,19 +2086,31 @@ static const struct regmap_access_table tc_precious_table = {
 	.n_yes_ranges = ARRAY_SIZE(tc_precious_ranges),
 };
 
-static const struct regmap_range tc_non_writeable_ranges[] = {
-	regmap_reg_range(PPI_BUSYPPI, PPI_BUSYPPI),
-	regmap_reg_range(DSI_BUSYDSI, DSI_BUSYDSI),
-	regmap_reg_range(DSI_LANESTATUS0, DSI_INTSTATUS),
-	regmap_reg_range(TC_IDREG, SYSSTAT),
-	regmap_reg_range(GPIOI, GPIOI),
-	regmap_reg_range(DP0_LTSTAT, DP0_SNKLTCHGREQ),
-};
-
-static const struct regmap_access_table tc_writeable_table = {
-	.no_ranges = tc_non_writeable_ranges,
-	.n_no_ranges = ARRAY_SIZE(tc_non_writeable_ranges),
-};
+static bool tc_writeable_reg(struct device *dev, unsigned int reg)
+{
+	/* RO reg */
+	switch (reg) {
+	case PPI_BUSYPPI:
+	case DSI_BUSYDSI:
+	case DSI_LANESTATUS0:
+	case DSI_LANESTATUS1:
+	case DSI_INTSTATUS:
+	case TC_IDREG:
+	case SYSBOOT:
+	case SYSSTAT:
+	case GPIOI:
+	case DP0_LTSTAT:
+	case DP0_SNKLTCHGREQ:
+		return false;
+	}
+	/* WO reg */
+	switch (reg) {
+	case DSI_STARTDSI:
+	case DSI_INTCLR:
+		return true;
+	}
+	return tc_readable_reg(dev, reg);
+}
 
 static const struct regmap_config tc_regmap_config = {
 	.name = "tc358767",
@@ -2108,9 +2120,9 @@ static const struct regmap_config tc_regmap_config = {
 	.max_register = PLL_DBG,
 	.cache_type = REGCACHE_MAPLE,
 	.readable_reg = tc_readable_reg,
+	.writeable_reg = tc_writeable_reg,
 	.volatile_table = &tc_volatile_table,
 	.precious_table = &tc_precious_table,
-	.wr_table = &tc_writeable_table,
 	.reg_format_endian = REGMAP_ENDIAN_BIG,
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
-- 
2.34.1

