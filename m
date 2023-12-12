Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A3380E51F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 08:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060E110E55F;
	Tue, 12 Dec 2023 07:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7485410E55F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702367583; x=1733903583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rbj/gyoJoBvI2OuTbChBZwqL4yPaZIDosCgwxkbrrtE=;
 b=lbAcTXTN9gATBD7urGIaR1G/NzN9jseO1fm3+K/7xAAhMUgaD+qDl2ES
 uvhhgw7sIaA+wmlKsVt1mqy8ROJEoa2uF2AIOjwFPIn1Fl4Qbjk8Qesvs
 ZkbOpR2hfJlffYdEGNv7a3Jw2l2hNPrw/Ek2t8haqyaO7hRpHmwLZAUkH
 ih3gCCg2nG+G012emfTH03QtPfuSlYnxNqa5FzzBjLzYaWdr1DMafLXcG
 Eju7vMXnO6iD5xcH2pjPmKo+LVwsogcfnV5obHs5g7AkZO6UHSHg1xwIl
 FtWxT/s8SYhUR/eLkCqHWJyqtdclzF/+7dqm+jWwO3dhUpXtz9hG4tmz6 w==;
X-IronPort-AV: E=Sophos;i="6.04,269,1695679200"; d="scan'208";a="34448095"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Dec 2023 08:52:59 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 513D0280084;
 Tue, 12 Dec 2023 08:52:59 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 5/7] drm/bridge: tc358767: Add more volatile registers
Date: Tue, 12 Dec 2023 08:52:55 +0100
Message-Id: <20231212075257.75084-6-alexander.stein@ew.tq-group.com>
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

These registers might change their value without any host write operation.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 61d8710f46293..152a6dc916079 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2049,9 +2049,16 @@ static bool tc_readable_reg(struct device *dev, unsigned int reg)
 }
 
 static const struct regmap_range tc_volatile_ranges[] = {
+	regmap_reg_range(PPI_BUSYPPI, PPI_BUSYPPI),
+	regmap_reg_range(DSI_BUSYDSI, DSI_BUSYDSI),
+	regmap_reg_range(DSI_LANESTATUS0, DSI_INTSTATUS),
+	regmap_reg_range(DSIERRCNT, DSIERRCNT),
 	regmap_reg_range(VFUEN0, VFUEN0),
+	regmap_reg_range(SYSSTAT, SYSSTAT),
 	regmap_reg_range(GPIOI, GPIOI),
 	regmap_reg_range(INTSTS_G, INTSTS_G),
+	regmap_reg_range(DP0_VMNGENSTATUS, DP0_VMNGENSTATUS),
+	regmap_reg_range(DP0_AMNGENSTATUS, DP0_AMNGENSTATUS),
 	regmap_reg_range(DP0_AUXWDATA(0), DP0_AUXSTATUS),
 	regmap_reg_range(DP0_LTSTAT, DP0_SNKLTCHGREQ),
 	regmap_reg_range(DP_PHY_CTRL, DP_PHY_CTRL),
-- 
2.34.1

