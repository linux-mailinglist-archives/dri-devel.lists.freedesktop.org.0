Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EEB8776FC
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 14:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A835710E171;
	Sun, 10 Mar 2024 13:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="X+LJ+PCX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5749510E171
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 13:22:32 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Tt0v91JvGz9sqF;
 Sun, 10 Mar 2024 14:22:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1710076949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSwEbrk7HLbiVNg/S8Upg2syVPjC3LO4YtPCBym8jns=;
 b=X+LJ+PCXGwxG9G4WS/TRRQQWedm3WrIvjNGcf3IyPuDYlUdkiR8+aKGzow9mcas8qKnQRc
 YGAWtICRa3gwaSG28TKplt4sqEY+4NUQmZ0zL+6hYrWsIWUtn91n5bqKyqg2Wjd1mQXvBL
 adkL/gXYJtM6gtLySg6aq4Ut0PxfzncW71dPvTN5I8wlyeutdRULyOCh6mRDQZJAXyeCni
 4GFFGLolP9o/Ouaog8EbHezhjNKSdGhE0vDOe+xPOOfrSr2GrUqJfB3tyy7cmzKo4fjzwG
 NiwFP9RBa/Et2VvysOvVi9wnvUOaU3baDGHcIoqF2ihzLO2IaBWLZDMIXpSV5Q==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Sun, 10 Mar 2024 14:21:14 +0100
Subject: [PATCH v4 4/5] clk: sunxi-ng: a64: Add constraints on PLL-MIPI's
 n/m ratio and parent rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240310-pinephone-pll-fixes-v4-4-46fc80c83637@oltmanns.dev>
References: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
In-Reply-To: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Frank Oltmanns <frank@oltmanns.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1259; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=ZV5lBxre/6M2MuCOOKXnH1cRS8cfBKGM9w8C16rRn4M=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBl7bP5PzKfaGxOhYTmRIANrgQLfc29z0qkcLMY5
 hLBpAPDsGyJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZe2z+QAKCRCaaaIIlErT
 x4qGC/9nHquFxNJvKofeUqKDlB8/fyTNUMkYgkr2J09KVCyCOfKhKLCLPq1RbvhQHYMFO+KkUVi
 y09BPXCYu7AzXNqEIRKtZukM9fWHve4cd4fn87D+lG71JxXN00HbEXZm1dgoL0g7PPhI1rtkpkh
 cEQk4PpdAm5ES+3EA0gIisbpVs2dDJiBke4aib93cTm0KUGdaLdePvgGbiqRI5oW0h85QSEDYCZ
 bN5UgmdeX2wdyPM9YAgVh0eK7uzfFYC0lXvOBN+Tf2gWOYWTQTcerLgSAzSyAvt7YSBwFd8rmxC
 mbBedFXmxAD1HzkgRCB+raRJF2V6Gx8Itmz78c15p0/X5+Ci0BURgx74ArMWF3d+o96FD30kvh9
 MURe4DjLkNSjQ1wlKtBIerPYzvzllO/ffiZYcBxhFF0qy6WFQ4BDY6xBsayaq5T2Kxb8N13aMp/
 S77ODkYZ1lsCkQhkMtZ/6r4PLF3vDI+AiEsk02A0igrDst6vqtx9CCYEGZxXgJEMDgCH0=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4Tt0v91JvGz9sqF
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

The Allwinner A64 manual lists the following constraints for the
PLL-MIPI clock:
 - M/N <= 3
 - (PLL_VIDEO0)/M >= 24MHz

Use these constraints.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 6a4b2b9ef30a..07796c79a23e 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -171,11 +171,13 @@ static struct ccu_nkm pll_mipi_clk = {
 	 * user manual, and by experiments the PLL doesn't work without
 	 * these bits toggled.
 	 */
-	.enable		= BIT(31) | BIT(23) | BIT(22),
-	.lock		= BIT(28),
-	.n		= _SUNXI_CCU_MULT(8, 4),
-	.k		= _SUNXI_CCU_MULT_MIN(4, 2, 2),
-	.m		= _SUNXI_CCU_DIV(0, 4),
+	.enable			= BIT(31) | BIT(23) | BIT(22),
+	.lock			= BIT(28),
+	.n			= _SUNXI_CCU_MULT(8, 4),
+	.k			= _SUNXI_CCU_MULT_MIN(4, 2, 2),
+	.m			= _SUNXI_CCU_DIV(0, 4),
+	.max_m_n_ratio		= 3,
+	.min_parent_m_ratio	= 24000000,
 	.common		= {
 		.reg		= 0x040,
 		.hw.init	= CLK_HW_INIT("pll-mipi", "pll-video0",

-- 
2.44.0

