Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9633451CF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 22:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142D389C69;
	Mon, 22 Mar 2021 21:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from libero.it (smtp-17.italiaonline.it [213.209.10.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F2D89C69
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 21:33:50 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197]) by smtp-17.iol.local with ESMTPA
 id OSB9lKwj3tpGHOSBIlyOiw; Mon, 22 Mar 2021 22:33:49 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1616448829; bh=WJGuGkzei1qnQ9F2BQzc6/TuQAnEMYCJ7ZCc+MNegg4=;
 h=From;
 b=TkkegkwfnTs2feRN2ISozdzpcLnTS6P8KEDs/XK0bfNpJ7BtoGA5taY6RAYuZgtCX
 URaas7A/vIdWdJnDZT9O3kmU5a+t3fE3TruSTpVPRx3okZ3vE0UZ/Hlh0mC50DQwM5
 cH+nMA67314nVf9fZoZ7D7DJ7ki1WRligdbMwjb9buPDFzoSMbygZSUA+abQWkPQ6c
 087a2k7frcj20qnreJtO1W9uwDkzSOH+rtOuBF8dtREH44xxQBp1NleEEMPiOko1cr
 XX5nVrpyJyZZkbBiTvQ6fw7nBLl0fJsAT7GHOIJWK2ZNxy88EzxSgMYTTe7ubPXzA4
 gVk0VTwwyeXZQ==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60590d3d cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=1RDr0-BV0bhq8KCB1kIA:9
From: Dario Binacchi <dariobin@libero.it>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] drm/tilcdc: fix pixel clock setting warning message
Date: Mon, 22 Mar 2021 22:33:37 +0100
Message-Id: <20210322213337.26667-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210322213337.26667-1-dariobin@libero.it>
References: <20210322213337.26667-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfD+W9cIU8kLoffCHlI5vlPRI6Ep8bkY7qzqNV0S0VeXqRMuyH77z0c2lABF7urCSlO4+eDWz4FmhasgWjTJbzi2OZnir0WR6u8eRV2P4ylOw0FjBHO2/
 Z/34T1XRXVDK9qcTGBYLBXpa3tXWEm2AE1QVMLuugrZxtjsCof+EMC+GdKfqUrNdFUOqTkRIBv4bqML7fJGAmKH1j1/4dfjnhZ1y8k9oZMoXqE8/NKA0MdtZ
 zDR1JWClLB+3SNj0QAgqECOyrHSmMTuvC5v1UbamaMtiNjJvasR5BHn2NKOekYXk8VP9MBzjRz5zK+5vuZr18vriHpH6FxR1H959dX9+/aFFgFZ4SlFRdkP7
 NWdQ8659CHH+E6hRR+2P9uAVGU93dVfWI2b/EWeLxVtSKwXHnS766ktHDu9B/vQzyvfHdmMR
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

The warning message did not printed the LCD pixel clock rate but the LCD
clock divisor input rate. As a consequence, the required and real pixel
clock rates are now passed to the tilcdc_pclk_diff().

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

Changes in v3:
- Replace calculated with requested in the warning message.
- Swap the positions of the real_pclk_rate, and pclk_rate parameters
  in the warning message.

Changes in v2:
- The patch has been added in version 2.

 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index ac6228cb04d9..381a706ab7c2 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -203,7 +203,7 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	unsigned long clk_rate, real_rate, real_pclk_rate, pclk_rate;
+	unsigned long clk_rate, real_pclk_rate, pclk_rate;
 	unsigned int clkdiv;
 	int ret;
 
@@ -239,12 +239,12 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 		 * 5% is an arbitrary value - LCDs are usually quite tolerant
 		 * about pixel clock rates.
 		 */
-		real_rate = clkdiv * pclk_rate;
+		real_pclk_rate = clk_rate / clkdiv;
 
-		if (tilcdc_pclk_diff(clk_rate, real_rate) > 5) {
+		if (tilcdc_pclk_diff(pclk_rate, real_pclk_rate) > 5) {
 			dev_warn(dev->dev,
-				 "effective pixel clock rate (%luHz) differs from the calculated rate (%luHz)\n",
-				 clk_rate, real_rate);
+				 "effective pixel clock rate (%luHz) differs from the requested rate (%luHz)\n",
+				 real_pclk_rate, pclk_rate);
 		}
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
