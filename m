Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2F38D6AF3
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 22:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A8210E4B1;
	Fri, 31 May 2024 20:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="JEJracLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA7210E392
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 20:41:54 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9F557885AF;
 Fri, 31 May 2024 22:41:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717188113;
 bh=jNUfw6DlnFWdbcRDy4dDKSjnwpkNiZThBi4HC3hIy/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JEJracLNr7/s4bjYdow/L677zOsPcSn7AsRrvH36Q0flf343/SG1zp3jxv9YiEZDI
 Z9z/DGBP3WWvRVOMifYUAXPsFSyx0fBMsp8TZq84KdrikGX/TH0dL/qYcpQqRzait7
 HoaQd38Rys6ixVd62zhK4+9gGgVUAQupEbCmrpSL0urF07cEcKmUrpON0ngYpV9/Xz
 xbVTpgERrtH/vFTcw0JnCM22n1h8KX+qlr4D9cKRPQiG5oQ3EilWhs2vzDSaoGVVZf
 UovGKh52T27x7EoEYp9s8xRftpB2CLQGh7+cx/TzH2HuknVKRPwXpAzt10gEoE21eo
 AAfHbpgEFpf2Q==
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
Subject: [PATCH 5/6] drm/bridge: tc358767: Set LSCLK divider for SYSCLK to 1
Date: Fri, 31 May 2024 22:39:51 +0200
Message-ID: <20240531204130.277800-5-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531204130.277800-1-marex@denx.de>
References: <20240531204130.277800-1-marex@denx.de>
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
 drivers/gpu/drm/bridge/tc358767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 926921a8d29d7..156297131a6cc 100644
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

