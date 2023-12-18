Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1436D817B17
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B5E10E07D;
	Mon, 18 Dec 2023 19:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD9D10E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:32:56 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Sv17Q1Z1Cz9sv0;
 Mon, 18 Dec 2023 14:36:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1702906578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zHjXX8T22A8vSDhmcbXCgVqx2gpy6+LirkB+PVRAonw=;
 b=eLflKYcE7WuO2izSmh+X4mn7M4W4r5tiLf9tLy/gpwJ+HYuWpLQlyVLDfp3gMot+v2Cv2N
 EiK/PmJIEErOafvsXPHmGQY90NZMbO/zi1o7/xuzR2ocO/zYJ/N6j/s/YVYfb39sT3SwtT
 aoww2i0Hke2YsfumQiIWt5egYYkJCVFq9CmRzwfLV3N+waySq5cjnUT1xoiZ3BSY9ChWB3
 U7I7zD9g71JhPSGIUVT448PdHgMiaNjileX7O6INdR6Jrij23kJ3GNRPPEaVbmlIW+BcsX
 1DwPFtGSrXbqD8QVz8/tksdd7MGBqGQ42fZMYiESibwLRyicfQwoUSb2sybBmQ==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 18 Dec 2023 14:35:23 +0100
Subject: [PATCH 5/5] drm/panel: st7703: Drive XBD599 panel at higher clock rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231218-pinephone-pll-fixes-v1-5-e238b6ed6dc1@oltmanns.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=SAMO997ikQjd5G5gtpw1xcptKu2mOxUiT+50d/YBtmI=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBlgEq1fGk87SLdf4iGeylAn1TQ+0H3qF+BNVT6u
 HjpEFxEqgCJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZYBKtQAKCRCaaaIIlErT
 x9WPC/97CEvcAl7/lqqTgFUkj4zb5ppCtk9rJIICkdmTftzH99U8PSxmXE0nEf8iTgYdjng9Bx0
 k8h58NQZlu9Ps/sbc+lo0PbQuWCGnDUYRSw3H97Ct1ju7uKs714t69LhGUtgBK1JFsg4vrhv9Ch
 d9E6vrurGJ+KKUbl1lHArTu3cD9ygcg1q6K1kfD1AsHzfH/dQWXUYjSTsrv8jgagl7VerjnL4r6
 dqLNaVl1q5iSJV/RqerAulhUjp6A0frnJOsnltaZiECVdfsoa2ermOBOgrApTJHE8wsJwTw0FXy
 pkBvnm9ZXsaQNI+jbMt5sWUZDld7hwsIn15rF6BpanhgXL0XS8fDVgpKQFLfLK6+HyfkX8js4u5
 X9xCCISayV/Nd+L7Wlx0um2UprwxuUoJ5uwkLqD9urRVV6ievIWaBnoNMSnOoQs5Xk8GancYKVF
 Tun737PSoCemEJMoweiWRqO/Jb7lnbvPtEmDmapfv8mKeBY6rfIUXBPJc2BlVRJ+rq9Gs=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
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

This panel is used in the pinephone that runs on a Allwinner A64 SOC.
Acoording to it's datasheet, the SOC requires PLL-MIPI to run at more
than 500 MHz.

Therefore, change [hv]sync_(start|end) so that we reach a clock rate
that is high enough to drive PLL-MIPI within its limits.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index b55bafd1a8be..6886fd7f765e 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -320,14 +320,14 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 
 static const struct drm_display_mode xbd599_mode = {
 	.hdisplay    = 720,
-	.hsync_start = 720 + 40,
-	.hsync_end   = 720 + 40 + 40,
-	.htotal	     = 720 + 40 + 40 + 40,
+	.hsync_start = 720 + 65,
+	.hsync_end   = 720 + 65 + 65,
+	.htotal      = 720 + 65 + 65 + 65,
 	.vdisplay    = 1440,
-	.vsync_start = 1440 + 18,
-	.vsync_end   = 1440 + 18 + 10,
-	.vtotal	     = 1440 + 18 + 10 + 17,
-	.clock	     = 69000,
+	.vsync_start = 1440 + 30,
+	.vsync_end   = 1440 + 30 + 22,
+	.vtotal	     = 1440 + 30 + 22 + 29,
+	.clock	     = (720 + 65 + 65 + 65) * (1440 + 30 + 22 + 29) * 60 / 1000,
 	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 	.width_mm    = 68,
 	.height_mm   = 136,

-- 
2.43.0

