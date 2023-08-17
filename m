Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CFB77F1A7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 10:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EA110E409;
	Thu, 17 Aug 2023 08:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20C010E406
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1692259252; x=1723795252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e4QVQqRKbpc2JnD7NGflMC3Dg1adC78I28qOMMHfrHU=;
 b=IdN1fU9FWsMSjwTkORuzyUPj0X6peq+hwe6X+O0R9kkLree3rw7ZzpTS
 s4e8ZYduA0fU6XqU3Vm4h5kDXqvB6VZorebQXAawGaAOuiM52wqkXZvsI
 GSJvFYdkaX5WIAZexWKdGKsafT62vyjYRAbOKPoxoVx+dyEREJSP0DMzq
 ivi2jdA4OQgs807NhvK6vE0fFrUV2odG+F4FwjRKHo0qCSJ3vHtNUTYly
 pf1ByMDsHGxS38ASIfnbDeWil814sXV+B79H12xe3GC3V21B3uCm6RpSU
 sDgCmhXJq0NRzIQ07hQIc9SqRhygCvEU8Jxjg7E3kfPPoh269DOqzPAZa g==;
X-IronPort-AV: E=Sophos;i="6.01,179,1684792800"; d="scan'208";a="32487215"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Aug 2023 10:00:48 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B12D5280075;
 Thu, 17 Aug 2023 10:00:48 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/7] drm: bridge: tc358767: Sort volatile registers according
 to address
Date: Thu, 17 Aug 2023 10:00:42 +0200
Message-Id: <20230817080045.1077600-5-alexander.stein@ew.tq-group.com>
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

Sort the list by the starting address to ease adding new entries.
No functional change intended.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index cbecf31bca473..b56dd3861dc2a 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2047,13 +2047,13 @@ static bool tc_readable_reg(struct device *dev, unsigned int reg)
 }
 
 static const struct regmap_range tc_volatile_ranges[] = {
+	regmap_reg_range(VFUEN0, VFUEN0),
+	regmap_reg_range(GPIOI, GPIOI),
+	regmap_reg_range(INTSTS_G, INTSTS_G),
 	regmap_reg_range(DP0_AUXWDATA(0), DP0_AUXSTATUS),
 	regmap_reg_range(DP0_LTSTAT, DP0_SNKLTCHGREQ),
 	regmap_reg_range(DP_PHY_CTRL, DP_PHY_CTRL),
 	regmap_reg_range(DP0_PLLCTRL, PXL_PLLCTRL),
-	regmap_reg_range(VFUEN0, VFUEN0),
-	regmap_reg_range(INTSTS_G, INTSTS_G),
-	regmap_reg_range(GPIOI, GPIOI),
 };
 
 static const struct regmap_access_table tc_volatile_table = {
-- 
2.34.1

