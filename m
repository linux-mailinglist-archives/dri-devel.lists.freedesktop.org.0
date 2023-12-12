Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBDE80E51D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 08:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006B810E57E;
	Tue, 12 Dec 2023 07:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C181010E57E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702367584; x=1733903584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IrKQKPZDEh5P7o0gxSHKQnyhAuUR/HQb6Gt4EeyWYWo=;
 b=VAJOrNMDA1xuQJqwdGcwSxeCx5Kxv+4iblbFB/u9RERdAYJUwW4NIR+D
 Y5oodejuTx/Qa8QCCy8/ma41KWIqxqaxNgt/IO5v/dF4ciu42XL+K/cp1
 v6TOA8Xb+vZKPdW1st+Lqmp2yBsOMgsx1W94i9RAP3Ck+JYW9DzYUzqbB
 W1DGCFpozqGSCAnWlH7eQpRy1siJrFPC/czQ983Wi8e3cjNPXEHUgDzFH
 zauCRUZDepAtQ1xRn0csgfahHAvYPFmtJBjYvINM9yPzAwzjYBBO7I1h6
 CZTkmCR+nZvRNbXAVqQpw+dXPbSOq5uKiyPUMzs90PB83nYHVmXrZdoHC w==;
X-IronPort-AV: E=Sophos;i="6.04,269,1695679200"; d="scan'208";a="34448096"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Dec 2023 08:52:59 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8466C280075;
 Tue, 12 Dec 2023 08:52:59 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 6/7] drm/bridge: tc358767: Add precious register SYSSTAT
Date: Tue, 12 Dec 2023 08:52:56 +0100
Message-Id: <20231212075257.75084-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212075257.75084-1-alexander.stein@ew.tq-group.com>
References: <20231212075257.75084-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the single register which clears its value upon read operation.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 152a6dc916079..93fa057eca8dc 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2070,6 +2070,15 @@ static const struct regmap_access_table tc_volatile_table = {
 	.n_yes_ranges = ARRAY_SIZE(tc_volatile_ranges),
 };
 
+static const struct regmap_range tc_precious_ranges[] = {
+	regmap_reg_range(SYSSTAT, SYSSTAT),
+};
+
+static const struct regmap_access_table tc_precious_table = {
+	.yes_ranges = tc_precious_ranges,
+	.n_yes_ranges = ARRAY_SIZE(tc_precious_ranges),
+};
+
 static const struct regmap_range tc_non_writeable_ranges[] = {
 	regmap_reg_range(PPI_BUSYPPI, PPI_BUSYPPI),
 	regmap_reg_range(DSI_BUSYDSI, DSI_BUSYDSI),
@@ -2093,6 +2102,7 @@ static const struct regmap_config tc_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 	.readable_reg = tc_readable_reg,
 	.volatile_table = &tc_volatile_table,
+	.precious_table = &tc_precious_table,
 	.wr_table = &tc_writeable_table,
 	.reg_format_endian = REGMAP_ENDIAN_BIG,
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
-- 
2.34.1

