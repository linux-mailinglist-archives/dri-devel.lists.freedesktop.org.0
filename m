Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680EE80E519
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 08:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A3810E58E;
	Tue, 12 Dec 2023 07:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7030910E585
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 07:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702367581; x=1733903581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pYQ5XfT3XHWeP5G1Fj8kOF4NkR0rE2zXEsS+JLBbFU0=;
 b=HI/arggzx98CDC/MdXwAR1TMOz1NvwpTYVVwp6PnF/CAxz2IRO6vTbzU
 r0wqCLtskREN9VjFqVij+Y3e05qhviQj2IfmrDLeWE8IPK8c3w8ul+iCG
 VvQRJpQzgsrOuBeZfrMK3YYA5mGoq8oNytjmvixgBJU9JYLZomCVuLgtA
 rDipVrXwDz7RE0LmRqPsncqI3qz5JGrnARhjlL9z9Y2xBVITqoi1vwHDm
 x+gHg/CY4MbkJmbQ8CpD1f+uYibiekGgWnf42rl8ECgGOobGVxv9ugxST
 adrA67AdSesxknB+H2gL5s97hk7sQRT7UW6EOvVeD+7Gr4G88SzJUoHG/ w==;
X-IronPort-AV: E=Sophos;i="6.04,269,1695679200"; d="scan'208";a="34448091"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Dec 2023 08:52:58 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 79F2B280084;
 Tue, 12 Dec 2023 08:52:58 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 1/7] drm/bridge: tc358767: Use regmap_access_table for
 writeable registers
Date: Tue, 12 Dec 2023 08:52:51 +0100
Message-Id: <20231212075257.75084-2-alexander.stein@ew.tq-group.com>
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

Using ranges it is easier to add more register where writing is not allowed,
especially for sequences of registers.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 4904248e3c750..258eacb4125a4 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1992,12 +1992,15 @@ static const struct regmap_access_table tc_volatile_table = {
 	.n_yes_ranges = ARRAY_SIZE(tc_volatile_ranges),
 };
 
-static bool tc_writeable_reg(struct device *dev, unsigned int reg)
-{
-	return (reg != TC_IDREG) &&
-	       (reg != DP0_LTSTAT) &&
-	       (reg != DP0_SNKLTCHGREQ);
-}
+static const struct regmap_range tc_non_writeable_ranges[] = {
+	regmap_reg_range(TC_IDREG, TC_IDREG),
+	regmap_reg_range(DP0_LTSTAT, DP0_SNKLTCHGREQ),
+};
+
+static const struct regmap_access_table tc_writeable_table = {
+	.no_ranges = tc_non_writeable_ranges,
+	.n_no_ranges = ARRAY_SIZE(tc_non_writeable_ranges),
+};
 
 static const struct regmap_config tc_regmap_config = {
 	.name = "tc358767",
@@ -2008,7 +2011,7 @@ static const struct regmap_config tc_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 	.readable_reg = tc_readable_reg,
 	.volatile_table = &tc_volatile_table,
-	.writeable_reg = tc_writeable_reg,
+	.wr_table = &tc_writeable_table,
 	.reg_format_endian = REGMAP_ENDIAN_BIG,
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
-- 
2.34.1

