Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AB33431AC
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 09:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290F389FAD;
	Sun, 21 Mar 2021 08:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from libero.it (smtp-17.italiaonline.it [213.209.10.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BE489FAD
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 08:32:22 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197]) by smtp-17.iol.local with ESMTPA
 id NtVMlAZljtpGHNtVUlqmNp; Sun, 21 Mar 2021 09:32:20 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1616315540; bh=7gky75t4IoUECjErvc/mg4sB/VMKlj95QT3AY4YVZaA=;
 h=From;
 b=pDkpcoYmdb/Xl9umTjrHkw747sidHRNg+5S4rirgii2srK9HWcCguS0592NNkD0F/
 CSU+c2xx2zqqGt7pOUzrSVQNRLcW/O4xN7XdD3m1eTO7PEOvhnlrphdYts8c1dcDwk
 +TE7MrlBHkw/qHIxMoglX/bmHpdv5u/6AExSM8n48FYa/lx96Y5Hi7gXH7ScofF9Zl
 xe+l6Lm0GqKvJQ9RL1yw+dNrSNgOZJt8ucFPjfteT61TLOJk9Z0iTI4ejvu0sorjkU
 AUjYzXIUyxaHNjQT67g5fuvgd0MTOQFhXZfeZZvaMteQpqwz4QJ4AkgwJizn+fljI2
 KJLQ8Vvg6+pYQ==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60570494 cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=OpddqcCamwGiTB6aXU0A:9
From: Dario Binacchi <dariobin@libero.it>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] drm/tilcdc: fix LCD pixel clock setting
Date: Sun, 21 Mar 2021 09:31:52 +0100
Message-Id: <20210321083153.2810-3-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210321083153.2810-1-dariobin@libero.it>
References: <20210321083153.2810-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfGYuO55UauguG8LZNRcmyHroAcDp+2JpRvAFwgtJL1cKoBrLU9V2fNiObqSUPbu4ZYo8PS28SddIoww3mb/t2bWNQMSdoY1uMv+6l99790V1o0u5/Z+c
 Eacui1h0yJDRDk9cfJ4aOSUaeTMeb6tFKScfpOY7cJgTuy7f2DbDyECbWrcDffVfRmCOgDcpl/uPnajgsnTofFIkrTZCVL0iauZeCaCa7SV3q2G8OtojHLo/
 1A/WPIQ6bKBX5byBSwJsJJBX4wj6OuwNXc++i4weGDAjlEszd2LndS2hdHwRreuuM5dC/ewFysrCYFnMv7u68YfGZ3pVvGVh6jd8TeA/cD9mafh9irH4feCg
 QhU5NS5uxCBlLXs/PXxDR93C66VDv2p7gX+G5TD0h+ZcVpbogpzXhKbY0l/LXmoF/KFLS1wc
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
Cc: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>,
 Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tilcdc_pclk_diff() compares the requested pixel clock rate to the
real one, so passing it clk_rate instead of clk_rate / clkdiv caused
it to fail even if the clk_rate was properly set. Adding the
real_pclk_rate variable makes the code more readable.

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

Changes in v2:
- Rename clk_div_rate to real_pclk_rate.
- Provide pixel clock rate to tilcdc_pclk_diff().

 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index aeec5786617d..ac6228cb04d9 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -203,7 +203,7 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	unsigned long clk_rate, real_rate, pclk_rate;
+	unsigned long clk_rate, real_rate, real_pclk_rate, pclk_rate;
 	unsigned int clkdiv;
 	int ret;
 
@@ -214,7 +214,8 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 
 	ret = clk_set_rate(priv->clk, pclk_rate * clkdiv);
 	clk_rate = clk_get_rate(priv->clk);
-	if (ret < 0 || tilcdc_pclk_diff(pclk_rate, clk_rate) > 5) {
+	real_pclk_rate = clk_rate / clkdiv;
+	if (ret < 0 || tilcdc_pclk_diff(pclk_rate, real_pclk_rate) > 5) {
 		/*
 		 * If we fail to set the clock rate (some architectures don't
 		 * use the common clock framework yet and may not implement
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
