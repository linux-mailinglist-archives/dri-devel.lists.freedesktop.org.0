Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02220912AB1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B42C10F304;
	Fri, 21 Jun 2024 15:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="oL2mlxjz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A8710F303
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:53:43 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6F6E9884C6;
 Fri, 21 Jun 2024 17:53:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718985221;
 bh=3r0+r8xGz/hv4yHCe4aXqefvsWq6FBncDmn7sO5XBSA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oL2mlxjzxIi0LrGjtPeaP554IyaDbCyELuCA5TbIl6nteKYm5NQo0SaxiBCYXT2KM
 ZqKKVsC89FcW3vqI32FBsrqXHdIPY9FJ4ZM5DVeNFxwmO/iWs4EZBkNGroLsb91CP5
 iN+w7oeVonw50n63rb4Vl25JlL2/AZ7go83o7wuMc4PKFVbrbav00wjxhb4//TCsnk
 ySSWKSiNyQl63c15tGxTAEtG8FbOaaAaw6bj++5CUaZ0s+OBA1Ce/iz9wpL+7Cqusx
 jHuDNh6c/QOOIrkrjodeIZa6OOIvXByY8+sFTtO0yMTdS7nyRxMFrHA/5auNOURSLB
 D0iNOR1tz7t3g==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
Subject: [PATCH v2 5/6] drm/bridge: tc358767: Set LSCLK divider for SYSCLK to 1
Date: Fri, 21 Jun 2024 17:52:53 +0200
Message-ID: <20240621155320.92864-5-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240621155320.92864-1-marex@denx.de>
References: <20240621155320.92864-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

The only information in the datasheet regarding this divider is a note
in SYS_PLLPARAM register documentation which states that when LSCLK is
270 MHz, LSCLK_DIV should be 1. What should LSCLK_DIV be set to when
LSCLK is 162 MHz (for DP 1.62G mode) is unclear, but empirical test
confirms using LSCLK_DIV 1 has no adverse effects either. In the worst
case, the internal TC358767 clock would run faster.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: kernel@dh-electronics.com
---
V2: No change
---
 drivers/gpu/drm/bridge/tc358767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index a48454fe2f634..743bf1334923d 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -738,7 +738,7 @@ static int tc_stream_clock_calc(struct tc_data *tc)
 static int tc_set_syspllparam(struct tc_data *tc)
 {
 	unsigned long rate;
-	u32 pllparam = SYSCLK_SEL_LSCLK | LSCLK_DIV_2;
+	u32 pllparam = SYSCLK_SEL_LSCLK | LSCLK_DIV_1;
 
 	rate = clk_get_rate(tc->refclk);
 	switch (rate) {
-- 
2.43.0

