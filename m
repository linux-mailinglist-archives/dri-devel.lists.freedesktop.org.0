Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB13177F1A6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 10:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3095210E408;
	Thu, 17 Aug 2023 08:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9782F10E412
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1692259252; x=1723795252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d94fo1iG+Nv7sID4bnP6/d9Pm4cN0q832knyEUJgfC4=;
 b=AvdsiB8jjs/3RBBk9d6lxZsrRKi8cMkcH5xXDL6yKnL8iDIs/Zbt8+Ak
 wrV6heYi69wHnSEU8cfXXuTY8Tb4ghs0syEnn10ORzUge5Er5jMbBSLVd
 k3WMggRxFsiiZCOWXubI/fITN+JUB59IVIfeGU2kXmvC4kaM34fK1r1vI
 WArWa3uZV0M5BbD8Rzf08XA2xfNs8K871t7SXOTc9OQaRPElmhs/c5ArV
 169zJf3EYFn3yeNIGNS4iWlkUx1NdAzRyYhlraOOpc+ui3mi7hzBL9HBX
 o6rn9dDMFie6ORv8BX5ezYB9J44JxpnDGJ7Mb2iAbKtflQdCAJIFhE9qg w==;
X-IronPort-AV: E=Sophos;i="6.01,179,1684792800"; d="scan'208";a="32487217"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Aug 2023 10:00:49 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 17166280075;
 Thu, 17 Aug 2023 10:00:49 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 6/7] drm: bridge: tc358767: Add precious register SYSSTAT
Date: Thu, 17 Aug 2023 10:00:44 +0200
Message-Id: <20230817080045.1077600-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817080045.1077600-1-alexander.stein@ew.tq-group.com>
References: <20230817080045.1077600-1-alexander.stein@ew.tq-group.com>
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
index f1d9deabae39b..0a4d5dfcc0a5a 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2068,6 +2068,15 @@ static const struct regmap_access_table tc_volatile_table = {
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
@@ -2091,6 +2100,7 @@ static const struct regmap_config tc_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 	.readable_reg = tc_readable_reg,
 	.volatile_table = &tc_volatile_table,
+	.precious_table = &tc_precious_table,
 	.wr_table = &tc_writeable_table,
 	.reg_format_endian = REGMAP_ENDIAN_BIG,
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
-- 
2.34.1

