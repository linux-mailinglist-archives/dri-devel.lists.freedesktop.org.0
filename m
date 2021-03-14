Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8512833A555
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 16:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2821789FEA;
	Sun, 14 Mar 2021 15:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from libero.it (smtp-17-i2.italiaonline.it [213.209.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9472089FEA
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Mar 2021 15:13:59 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197]) by smtp-17.iol.local with ESMTPA
 id LSRAlDnJYtpGHLSRHlAQKh; Sun, 14 Mar 2021 16:13:56 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1615734836; bh=4LiH4eemN3AT+2Fo6A4+E/U5d16NklG/3kjcvEQGKGU=;
 h=From;
 b=t9Eq2PKQKBiBLh2ig7HS/WcQrqc3uvMCq8a6A1Fnp3rNMNl3VuRrQOd7mQxhMe6Gt
 ZcE4HpkdC8YFDLOTn0p0uQK2lHwHjjr3gzHh36brolIvhLPOPle0aRdZiyonJVqX+W
 os9AeRLJdIWzUoSm+exeHc0ZKQulYJNpwCoY2phSOlgCSmEGXoeNe3iun/W/snrDMg
 ziA2d48zrqsa5tAngVe4ZTNU1hrm+cRT93wlJUHzSrQZ5FNFTqGPJl2qc6aacK9Lwe
 ayNFRztSDGwR9FT/aNGck7lQJTa5r/HSl3Z2MJ56HctqqUkmTiQuYcJ/gdbKu4BSkz
 YZjwNLc8Nkjmg==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=604e2834 cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=lnTs3XerFxmm0CipDzYA:9
From: Dario Binacchi <dariobin@libero.it>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tilcdc: fix LCD pixel clock setting
Date: Sun, 14 Mar 2021 16:13:41 +0100
Message-Id: <20210314151342.23404-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfJ3IOLksAOLKMHBjJUHJ8C33pm/tpWwf2AZBxwcvuuq3NfmiHoveW4kSWQc6lg7BFBbuqPbMy9EiQt+foLbvWoOhA40cle8b86JjJ8xgDlIdjjxl8sIr
 hA0U8jU6QONZidr86fvMlUzzVTQXNZ92Lwj1rV/HiE0F8aoqJT95yLnyUPTHJXK2DFtQwJTJQFR2KWfCSuHxrnZQj3mKQ4PHc92OArrEssUhiJ0gIsv8HQYf
 mbnw01iu2UzHltnfZI06QjUZvMHVj1d7yqcNmtnk4JBSzYgdoFfmj78aW8TwWGOf8rx3f9S/wY9EqaIRRYULsUZFQYfoCxYTu71UOAfxo6acWjeFXuGoyZ3a
 YO1OJfSshi3AnkvEL3jmqaZRdX+hOCfnqAf/gGubrxdEFqnWtQeh+wBgYQsdfJg78e+4HrYA
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

As reported by TI spruh73x RM, the LCD pixel clock (LCD_PCLK) frequency
is obtained by dividing LCD_CLK, the LCD controller reference clock,
for CLKDIV:

LCD_PCLK = LCD_CLK / CLKDIV

where CLKDIV must be greater than 1.

Therefore LCD_CLK must be set to 'req_rate * CLKDIV' instead of req_rate
and the real LCD_CLK rate must be compared with 'req_rate * CLKDIV' and
not with req_rate.
Passing req_rate instead of 'req_rate * CLKDIV' to the tilcdc_pclk_diff
routine caused it to fail even if LCD_CLK was properly set.

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 30213708fc99..02f56c9a5da5 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -203,7 +203,7 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	unsigned long clk_rate, real_rate, req_rate;
+	unsigned long clk_rate, real_rate, req_rate, clk_div_rate;
 	unsigned int clkdiv;
 	int ret;
 
@@ -211,10 +211,11 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 
 	/* mode.clock is in KHz, set_rate wants parameter in Hz */
 	req_rate = crtc->mode.clock * 1000;
-
-	ret = clk_set_rate(priv->clk, req_rate * clkdiv);
+	/* LCD clock divisor input rate */
+	clk_div_rate = req_rate * clkdiv;
+	ret = clk_set_rate(priv->clk, clk_div_rate);
 	clk_rate = clk_get_rate(priv->clk);
-	if (ret < 0 || tilcdc_pclk_diff(req_rate, clk_rate) > 5) {
+	if (ret < 0 || tilcdc_pclk_diff(clk_div_rate, clk_rate) > 5) {
 		/*
 		 * If we fail to set the clock rate (some architectures don't
 		 * use the common clock framework yet and may not implement
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
