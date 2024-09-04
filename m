Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498E296BB94
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EED10E752;
	Wed,  4 Sep 2024 12:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="dUZPCihh";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Co8mFidp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA9B10E752
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 12:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1725451572; x=1756987572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MZO2+A9qhMx/vtq4ZcJAHouq6Gc/o3MZqjq9U8ynBSU=;
 b=dUZPCihhvre2+veWkMfNVAv4PZ68fOxn77i7njgE1kHGN3Taobh8X5he
 zoBTicmAHjvgYgSPSs5BQJwJv5cY0lgUbh6BCrczneKsHs8Pn3FQdj/+U
 YRJgHlHRvJ8/bc3CooGkKb+zsGG3dzlweaZOko/fw7KNXFIDkrmP8ud2A
 rr31/O/PIdJVA+/YToFXkjaijOi00uYgRHDDrzvq3Wka5ZbIwDLKbjrcu
 7Q3N5dvOzKXpLQK6974fn3SK8222VeSER2W8rJo33bz2hx8YkbfyWvbGc
 Ay11NMYbROPqsDRKdc3anZyLUV3mgapvRxMBr91dXid+UIASK7Oi7IVeJ A==;
X-CSE-ConnectionGUID: uAeUHnF4Qv6Yru00un7Cyg==
X-CSE-MsgGUID: yf8i1uEoQleF89+42bAuuQ==
X-IronPort-AV: E=Sophos;i="6.10,201,1719871200"; d="scan'208";a="38762455"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 04 Sep 2024 14:06:11 +0200
X-CheckPoint: {66D84D33-28-E520F13A-D17B83D9}
X-MAIL-CPID: 9456EAE7F1187E878E346CA9AC04C97F_2
X-Control-Analysis: str=0001.0A782F1C.66D84D34.0001, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 08C7A160024; Wed,  4 Sep 2024 14:06:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1725451567; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=MZO2+A9qhMx/vtq4ZcJAHouq6Gc/o3MZqjq9U8ynBSU=;
 b=Co8mFidpRANqj5uhUBrIkhmuJPZLlSak0cddvK+MiJWLMxHWQyQh6FzpDf4cv5zRtTEjZE
 GG62A8Q7VyBmHe4xtG6VJgZpQR0xnWFprDnuLBydQwFuxKTcotDrKHcbcn6GI5bBWb45Xh
 QGBySNQNu5McMaCf0c87Rd71eMx4RpBhKp4ESYYLpWKBBcM6HyiOHanGnVprIMoK9OYAy3
 YpYfZDRtvFpL3E7mL4fToUp4OaXUlmLzGBK5K0xN5m8EOLnxnli7v9hXuWKmgkKK4sG16E
 s600d98QnJMmhWmzlnubX+Fr6EF+FkUS/yR/gpSN5LRegaMTGAE5d3WkInJo7g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] drm/bridge: tc358767: Support write-only registers
Date: Wed,  4 Sep 2024 14:05:45 +0200
Message-Id: <20240904120546.1845856-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904120546.1845856-1-alexander.stein@ew.tq-group.com>
References: <20240904120546.1845856-1-alexander.stein@ew.tq-group.com>
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
Reviewed-by: Robert Foss <rfoss@kernel.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 40 ++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 1c42c8c6e632e..159c95b26d33c 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2169,19 +2169,31 @@ static const struct regmap_access_table tc_precious_table = {
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
@@ -2191,9 +2203,9 @@ static const struct regmap_config tc_regmap_config = {
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

