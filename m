Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32013590175
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CF2B497F;
	Thu, 11 Aug 2022 16:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAC98D580
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 16:00:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E27AB82172;
 Thu, 11 Aug 2022 16:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988A6C433D7;
 Thu, 11 Aug 2022 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660233614;
 bh=SyOADJj+ILiiJ+e/eFz+NYJUoMOSMjGukNO2QZYUOu8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y56U1lVvIe7KVK8vD3Y6y6LzIL3yJZL0DY0748gFxDwEojLoG/R7AwHN0O9s3Mig7
 qGZdld1Qc8J/JeTXrSPUndG6c4s+Vgu8SXUsvazbwU1thrAsY6iF9ZiadAkZAaWCsi
 Is2MkhqA0qXiByQVJIzUJfDFYEDCTfDLbuEVJZDcqIQIWFNN1Fl0Wfxxr//ij1jTsC
 GKH85WFC4V/VNr4+vXJ+nPekXcM3r0CLkDDMedPuYmq6db9Ff+SIWr9xOz6P7+HBRN
 hKQQqtW44NAERPdVLFZDQ/5+V+ewXTqIXxeaUpWBfUfeYGBYJVo8F0mztaEEVwmyc8
 eIhwOzjcEmx3w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 30/69] drm/bridge/tc358775: Fix DSI clock
 division for vsync delay calculation
Date: Thu, 11 Aug 2022 11:55:39 -0400
Message-Id: <20220811155632.1536867-30-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811155632.1536867-1-sashal@kernel.org>
References: <20220811155632.1536867-1-sashal@kernel.org>
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
index 2272adcc5b4a..70b6210c9803 100644
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

