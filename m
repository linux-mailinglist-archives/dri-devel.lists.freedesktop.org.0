Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0CA5900A9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1E5B477F;
	Thu, 11 Aug 2022 15:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EB6B4768
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 15:46:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AA6F616F2;
 Thu, 11 Aug 2022 15:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AE5C433C1;
 Thu, 11 Aug 2022 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660232788;
 bh=cEAsVg0Acc+hjGpatOmTCRsm4X/W/HIkiV10ng5PMCc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iRnd+bZU3MrFSTKm/OK9z48ksdn8Uea/2ujfK1160KyzYvZMfDYAWoOJnGRdjX3zb
 JiGFl36kiEJ9Z6in0/pXAzTtHKJYihPrVNX7yR4S7BeLuE+sKImK6Ef4jGNQ5Ei6zU
 kyKcwGDGFc8tu3j7afroSJXB9zKcCWoFk2v+mgLax504WCkamX2ffJCi2nkDWkDoMh
 x8Hk0H/YwlUUfrgpl9TqEM94NYKXblCLTEKVTRs8gxu/AuraeKnFTZ3P8xBd2TDRmJ
 iXLPo2VyvCkPKDKApG1KmKSer640jfc0XDdoEWGIhZQIBY02rMGmtL8mEI1JdjhTL6
 0oSwYJE+6snXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 35/93] drm/bridge/tc358775: Fix DSI clock
 division for vsync delay calculation
Date: Thu, 11 Aug 2022 11:41:29 -0400
Message-Id: <20220811154237.1531313-35-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811154237.1531313-1-sashal@kernel.org>
References: <20220811154237.1531313-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, narmstrong@baylibre.com, airlied@linux.ie,
 Jiri Vanek <jirivanek1@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 Vinay Simha BN <simhavcs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jiri Vanek <jirivanek1@gmail.com>

[ Upstream commit 993a87917c2af59efb0ee1ce43c878ca8790ba1c ]

Use the same PCLK divide option (divide DSI clock to generate pixel clock)
which is set to LVDS Configuration Register (LVCFG) also for a VSync delay
calculation. Without this change an auxiliary variable could underflow
during the calculation for some dual-link LVDS panels and then calculated
VSync delay is wrong. This leads to a shifted picture on a panel.

Tested-by: Jiri Vanek <jirivanek1@gmail.com>
Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
Reviewed-by: Vinay Simha BN <simhavcs@gmail.com>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20220615222221.1501-3-jirivanek1@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 695af3badcc7..0cc047d2a8a1 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -429,7 +429,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 		val = TC358775_VPCTRL_MSF(1);
 
 	dsiclk = mode->crtc_clock * 3 * tc->bpc / tc->num_dsi_lanes / 1000;
-	clkdiv = dsiclk / DIVIDE_BY_3 * tc->lvds_link;
+	clkdiv = dsiclk / (tc->lvds_link == DUAL_LINK ? DIVIDE_BY_6 : DIVIDE_BY_3);
 	byteclk = dsiclk / 4;
 	t1 = hactive * (tc->bpc * 3 / 8) / tc->num_dsi_lanes;
 	t2 = ((100000 / clkdiv)) * (hactive + hback_porch + hsync_len + hfront_porch) / 1000;
-- 
2.35.1

