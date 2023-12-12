Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAAC80E51C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 08:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999E410E579;
	Tue, 12 Dec 2023 07:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0896310E585
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 07:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702367583; x=1733903583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pWGJUzccpdPIDmU34V7E4MmEdi5whZf6jhKGrNoa30U=;
 b=UVn6Ma9ZwvjnYQDSlGynTjay+chy0cG+x2aaQLrdnCiZyfXn8DBjzOmQ
 wPFrn4RS3KSql7v3001aaByiwfdUDay80rxLmNfjTqW9ddBritt2+Md2x
 +s3gBwQ7Yg20uj/m7Vw8hiDPnFaC6/CDyo8LAbCNd4N/07IqMbM2sxy4U
 aqcG/Dl2ZdDB2ju0tEAoqSLNs9glYN/09Jawm/eW8DbjupGlZkoDQi78y
 kjWYavVri1Gyv8ippoNefEXjCj78eJ9l7qV2E2m/9Kw1cgP4ayPowGjki
 6pHZYElFkYS0N4DqFUn5JXmlFPfNg+4uUuQvEwL1LIFkYwrKs4ufS6CXP A==;
X-IronPort-AV: E=Sophos;i="6.04,269,1695679200"; d="scan'208";a="34448094"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Dec 2023 08:52:59 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 202AE280075;
 Tue, 12 Dec 2023 08:52:59 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 4/7] drm/bridge: tc358767: Sort volatile registers
 according to address
Date: Tue, 12 Dec 2023 08:52:54 +0100
Message-Id: <20231212075257.75084-5-alexander.stein@ew.tq-group.com>
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

Sort the list by the starting address to ease adding new entries.
No functional change intended.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 5c0292b71e9fa..61d8710f46293 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2049,13 +2049,13 @@ static bool tc_readable_reg(struct device *dev, unsigned int reg)
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

