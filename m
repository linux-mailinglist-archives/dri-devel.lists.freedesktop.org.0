Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 293BA3431A9
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 09:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B0489F41;
	Sun, 21 Mar 2021 08:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from libero.it (smtp-17.italiaonline.it [213.209.10.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2953589F85
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 08:32:22 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197]) by smtp-17.iol.local with ESMTPA
 id NtVMlAZljtpGHNtVUlqmO0; Sun, 21 Mar 2021 09:32:21 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1616315541; bh=zVkuQ2oGVldVrVFvB2CtFewtN+s31qqxbZSXdfUASHo=;
 h=From;
 b=epsGvrqty3s6iFfes2spvJSYvC7S/QX9vSanM/ueqgb91eqsI3bglYSMZhREP0j4Y
 Wk1eLwF1NbgZyzQAer4inFW7Jrh9sfDhGOZeVXvc5Bs3idT45Us2BjEPd7pCecy4HI
 y+gFG1wk9PsMsijRKr080oJddayveH6VB9BWQjtFfxW+2ZeiyIU9Zi/rpiYtLa4azI
 95oHmZPtkxm3zxwSixJNXpwNOUWtahVTrPCeXlXp+YoelxYpBCC5VldvTZ+a+eqmVh
 VkFaeqZchwEf4/E+0FlWrxbfpioWyPd4XgVSsjMhxgNey6prbdT3envruUlzz52mEB
 0keUqygT+rqCQ==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60570495 cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=1RDr0-BV0bhq8KCB1kIA:9
From: Dario Binacchi <dariobin@libero.it>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] drm/tilcdc: fix pixel clock setting warning message
Date: Sun, 21 Mar 2021 09:31:53 +0100
Message-Id: <20210321083153.2810-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210321083153.2810-1-dariobin@libero.it>
References: <20210321083153.2810-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfDfpQSq7LzLNjIKjRNpVkFUqvjQm8/IVFQmhMqy2ynSc8QsfkjfF2nqwWdIFB3L0yfo9Rzyps2fqvsxnn+mAU8JHdnKfvY3Kt0gTRdl5vF6fMK1Gwt+3
 JPOH5Sxi/oPF59IyD+mw6UA+sSIHmN52JOQDWl1GPJ0bKlv5mtyHw0JCcDkyzWoT057xrVfzThytZYwDmKIimPoaLYGmzf9l7h1dGZgJ0yKgbLr2W5NE7Hen
 c/U8znWRWyATFFNV/XbkVSS0HMrmm2tJ2i8wRzFhBai4/xHXXOTlKkALIPaNOYVCgjuHvJBKuJdMvKPytAjnJWjqGzO0VoZu32M8gvR0w0qGEu/eBhiKcSli
 l5O+EXUfU7pQj24oxDR9+zO2v2pzP5j/lXOw6NIzajJrCv4Md1MogOKhbjqfZaTJxnuCKuBd
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

Changes in v2:
- The patch has been added in version 2.

 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index ac6228cb04d9..c0792c52dc02 100644
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
 				 "effective pixel clock rate (%luHz) differs from the calculated rate (%luHz)\n",
-				 clk_rate, real_rate);
+				 pclk_rate, real_pclk_rate);
 		}
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
