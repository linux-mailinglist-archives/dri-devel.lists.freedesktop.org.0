Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD46E8B26
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1295910EBB2;
	Thu, 20 Apr 2023 07:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C7A10E6B6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 07:40:47 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
 by mail.gandi.net (Postfix) with ESMTPSA id 39B58FF803;
 Tue, 18 Apr 2023 07:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
 t=1681803644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QGdxm1MZfKiixTZRAK84Xihyd7IYkMPBrEsYiqEHj7g=;
 b=cvF9wZRMZo9QffL/EYafEymCRnRmfFhAqANyq0Uga3jWnhxlANUzXIma0oasCVdku8imLG
 tlyonZJHlrWzJo2n43gqZnR+mdaKosAu2UVqHLAZdWs9RNTWSa59+94amuxOukCxYvc1W9
 EfP354qSdQ31lO57wT8kAGb2lrBm59D2X27uBCBCpoBu8UfRAmG75JVCCCx0HT6w4RNRHk
 W3Q5UR7LocJKDqTqfV+sL8fZDVC9Et2s6jQ1m7zRAR/0qQ7NIZwbRQXo5rDqab+mUn7Ceh
 iGHnsIhBnVbyUTRLPI6zJTm2wYJkEGBz65ELKm6qNoifQv+D5JmZ/JV+iASlvQ==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 1/7] clk: sunxi-ng: a64: propagate rate change from pll-mipi
Date: Tue, 18 Apr 2023 09:40:02 +0200
Message-Id: <20230418074008.69752-2-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20230418074008.69752-1-me@crly.cz>
References: <20230418074008.69752-1-me@crly.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: linux-kernel@vger.kernel.org, Frank Oltmanns <frank@oltmanns.dev>,
 dri-devel@lists.freedesktop.org, Roman Beranek <me@crly.cz>,
 Ondrej Jirman <megi@xff.cz>, Icenowy Zheng <icenowy@aosp.io>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Propagating rate change from tcon0 all the way to pll-video0 allows for
greater precision in matching requested display timing.

Signed-off-by: Roman Beranek <me@crly.cz>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 41519185600a..dd6212286dcd 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -179,7 +179,8 @@ static struct ccu_nkm pll_mipi_clk = {
 	.common		= {
 		.reg		= 0x040,
 		.hw.init	= CLK_HW_INIT("pll-mipi", "pll-video0",
-					      &ccu_nkm_ops, CLK_SET_RATE_UNGATE),
+					      &ccu_nkm_ops, CLK_SET_RATE_UNGATE
+							  | CLK_SET_RATE_PARENT),
 	},
 };
 
-- 
2.34.1


