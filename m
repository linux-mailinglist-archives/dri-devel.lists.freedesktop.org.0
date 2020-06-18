Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 923F31FDBF9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 03:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAF46EA39;
	Thu, 18 Jun 2020 01:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A1E6EA39
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 01:16:05 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 594E821D7E;
 Thu, 18 Jun 2020 01:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442965;
 bh=LhWCgqMpOimMUIh/VYqwEEVS7oF4YKfUj2TxcSiqHWQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ajg9zMXoZxqCDKv/BrESYzlXrE9U3txM37zo6XSP/sqXrYW6cLra/ZbVKk/DiQJyt
 LIgOUIqjiGplfg9Fn6mziK2/Z52+1skZFUtG+H5sE6kF0fakIJ1dHfkgctV8Dgg+lS
 vpnp8lvrPCgi3MAHRX71/8VTpyTXMQhp/+uGgG+w=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 370/388] drm/sun4i: hdmi ddc clk: Fix size of m
 divider
Date: Wed, 17 Jun 2020 21:07:47 -0400
Message-Id: <20200618010805.600873-370-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jernej Skrabec <jernej.skrabec@siol.net>

[ Upstream commit 54e1e06bcf1cf6e7ac3f86daa5f7454add24b494 ]

m divider in DDC clock register is 4 bits wide. Fix that.

Fixes: 9c5681011a0c ("drm/sun4i: Add HDMI support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/20200413095457.1176754-1-jernej.skrabec@siol.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi.h         | 2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
index 7ad3f06c127e..00ca35f07ba5 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
@@ -148,7 +148,7 @@
 #define SUN4I_HDMI_DDC_CMD_IMPLICIT_WRITE	3
 
 #define SUN4I_HDMI_DDC_CLK_REG		0x528
-#define SUN4I_HDMI_DDC_CLK_M(m)			(((m) & 0x7) << 3)
+#define SUN4I_HDMI_DDC_CLK_M(m)			(((m) & 0xf) << 3)
 #define SUN4I_HDMI_DDC_CLK_N(n)			((n) & 0x7)
 
 #define SUN4I_HDMI_DDC_LINE_CTRL_REG	0x540
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
index 2ff780114106..12430b9d4e93 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
@@ -33,7 +33,7 @@ static unsigned long sun4i_ddc_calc_divider(unsigned long rate,
 	unsigned long best_rate = 0;
 	u8 best_m = 0, best_n = 0, _m, _n;
 
-	for (_m = 0; _m < 8; _m++) {
+	for (_m = 0; _m < 16; _m++) {
 		for (_n = 0; _n < 8; _n++) {
 			unsigned long tmp_rate;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
