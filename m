Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBEC817B15
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C8710E391;
	Mon, 18 Dec 2023 19:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1961610E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:32:56 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Sv1785yHbz9sdL;
 Mon, 18 Dec 2023 14:36:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1702906564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDFi8CTJUkTd5zxbOYuJnvPd3KneFrWxg/uiRc7lnPo=;
 b=tBVSsvYIVe0xQT3B+rWNnbM9Mi4E3pe48xmfJm1SiCfeYA6B8oTUhgzOtkiyY0819Cg1kU
 VoPkjVwLWJHmqoWMMcEPBUj+g/rZBDOV/EoK4f3EkXyJJVl0szABd9M3N80vfc3WjBNgJV
 784nPvTIAfDAUid3GVK1SYBzdSBw76w3CxeytU8qZ+0kyknyj9Hu1HWYJKSdnD5d2Rf8gz
 /l7H8EwarwJpulkAHJ7i6gnfIu72MSHCAKOwPTOwDS996ynOkzOzvhZGlOXONBC9suUtaC
 MVdvzB1SmZQfcI0Dr/2YPy1MD2hXOeFFJGU1MgZOhQyCnJOj+HMApnw8nEUjHw==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 18 Dec 2023 14:35:20 +0100
Subject: [PATCH 2/5] clk: sunxi-ng: a64: Add constraints on PLL-MIPI's n/m
 ratio and parent rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231218-pinephone-pll-fixes-v1-2-e238b6ed6dc1@oltmanns.dev>
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
In-Reply-To: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
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
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Developer-Signature: v=1; a=openpgp-sha256; l=831; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=9VxWwX1vCUxu7Hc741L8dSjIHrhsgQCwsWW/01PJBwE=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBlgEq19E5P79VQDYi6Zr///gDuzEr7rVmNkbiml
 VePSHhJbqeJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZYBKtQAKCRCaaaIIlErT
 x+SiC/oDWxNg5UY7m1mF7KBxsid/6Tsx9F75ZRYqKpRotMZqwuElIehxafv898mDjPDG2d0vqkM
 FeinlyPRktnISeycYImZL6xQCyhqipZn6aQnvPZPXHw7jvx9+sM3Ua2QktJ+GI4VBDgYIKh+2od
 2EkRw270C90pMsuT/oHwwh3lSzE1MRTDtuGRyxT0PJbZ7sJfAgvFSEK/Gohm8AWpcDzU/QnFDbA
 0R8uKC9mxI48xBzq+4Pma8DuVEmmFqSWeh7A7m58EE3pIzoSDC/n06f3U88bBFT/fCTjX2eXg/l
 DxFYwNwg8cqLmMuz/nWxfjbYItGpSRtu5+2eLNRDdMVqkgVUrNjNR8CVVbHLY1eEkvcf/W1NRcC
 Y6OTZvk4tvpfzAo7uR/yWo3RBXwDwmJ+UC5c4RE1uJXxje2pR4kCQvYHfx1FCb3HtoetLSXSPFN
 oBBfjNGeX5SrbcIahVWk7H5OF13yM0JEtFZSRP/Yt0zJIX8MBa7mD4+pIGVbMtnLKuyLI=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4Sv1785yHbz9sdL
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Frank Oltmanns <frank@oltmanns.dev>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Allwinner A64 manual lists the following constraints for the
PLL-MIPI clock:
 - M/N >= 3
 - (PLL_VIDEO0)/M >= 24MHz

Use these constraints.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 8951ffc14ff5..c034ac027d1c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -176,6 +176,8 @@ static struct ccu_nkm pll_mipi_clk = {
 	.n		= _SUNXI_CCU_MULT(8, 4),
 	.k		= _SUNXI_CCU_MULT_MIN(4, 2, 2),
 	.m		= _SUNXI_CCU_DIV(0, 4),
+	.max_mn_ratio	= 3,
+	.parent_wo_nk	= 24000000,
 	.common		= {
 		.reg		= 0x040,
 		.hw.init	= CLK_HW_INIT("pll-mipi", "pll-video0",

-- 
2.43.0

