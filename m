Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4167FBBBA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DC410E52A;
	Tue, 28 Nov 2023 13:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FD110E1B7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1701178722; x=1732714722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vrinOZZ50Y6Au+zZcSN5E1UPvc+t6KJI+yarOYm+qWg=;
 b=Jzjq05FjEwHLag7SZ5jRI14tjBhdW6SUm+GEV4zXqUVhzF/uIRXhrTjT
 takagxvvyTaYcuvAYnzEymAbr0GUO878+J+NjvwUkwBOtP2IFtxWQKaso
 dasFd6GVYFTYyZmHEjq2dSMhb0lfiIbjMDAQ03RIzuxSsu/zwcVwSZxpl
 f7QVtN6/E7udmj7TX1CAn3aYNM2sMkKnOURP3qvb3d8aHoudptSrL1f4o
 v6aOiLqY21r+9YWfyVkgOeyaGGQ6Asnefb6Q9QAT0X8aSJ68zOXRDtdIB
 Hefy7ZsQYhL0TQsLYnGbja7XZfF1sdDyI8RghXsuQMdU9KqYlyY4teUuk w==;
X-IronPort-AV: E=Sophos;i="6.04,233,1695679200"; d="scan'208";a="34216289"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 28 Nov 2023 14:38:39 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5CBEB280084;
 Tue, 28 Nov 2023 14:38:39 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/7] drm/bridge: tc358767: Use regmap_access_table for
 writeable registers
Date: Tue, 28 Nov 2023 14:38:30 +0100
Message-Id: <20231128133836.2923081-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128133836.2923081-1-alexander.stein@ew.tq-group.com>
References: <20231128133836.2923081-1-alexander.stein@ew.tq-group.com>
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
index a7104b5c83826..f934bdd5a87f1 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2000,12 +2000,15 @@ static const struct regmap_access_table tc_volatile_table = {
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
@@ -2016,7 +2019,7 @@ static const struct regmap_config tc_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 	.readable_reg = tc_readable_reg,
 	.volatile_table = &tc_volatile_table,
-	.writeable_reg = tc_writeable_reg,
+	.wr_table = &tc_writeable_table,
 	.reg_format_endian = REGMAP_ENDIAN_BIG,
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
-- 
2.34.1

