Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7333BBD0A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 14:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAC989C9A;
	Mon,  5 Jul 2021 12:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3964D897EE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:45:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DE8031FE74;
 Mon,  5 Jul 2021 12:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625489117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=azGPpIhyM/dFb99nBTCUCEC8LMu6Jph7O3gVZnIcfQ8=;
 b=rzSNoGLAyBjvH9sMPghLAqT0YwkG3bEmjlZ/BjpHU8YYYsKVD6g9J6lhHF9lGBJdjCGQUt
 r6nDrEI0ruEyZ/b5sKg4ue6P7hPejs8kKHybpbqNfbA+B+xsPV3tw5mrbypMi82WReZc52
 dqoC9khFBSmhEwfODo7Wl7hVj09zyN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625489117;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=azGPpIhyM/dFb99nBTCUCEC8LMu6Jph7O3gVZnIcfQ8=;
 b=Xv/mlIlU5P3quZz4ZXqOO7txi3LHNCaYJq1xMC1iynaameI616XhnQkDAHAKFi7ZeYLHTa
 +kYLOmal7nYKu9Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A463A139F6;
 Mon,  5 Jul 2021 12:45:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IHYzJ93+4mDkcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 12:45:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 emil.velikov@collabora.com, John.p.donnelly@oracle.com
Subject: [PATCH 04/12] drm/mgag200: Split PLL setup into compute and update
 functions
Date: Mon,  5 Jul 2021 14:45:07 +0200
Message-Id: <20210705124515.27253-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705124515.27253-1-tzimmermann@suse.de>
References: <20210705124515.27253-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The _set_plls() functions compute a pixel clock's PLL values
and program the hardware accordingly. This happens during atomic
commits.

For atomic modesetting, it's better to separate computation and
programming from each other. This will allow to compute the PLL
value during atomic checks and catch unsupported modes early.

Split the PLL setup into a compute and a update functions, and
call them one after the other. Computed PLL values are store in
struct mgag200_pll_values. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  17 ++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 234 +++++++++++++++++++------
 2 files changed, 196 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index f7a0537c0d0a..fca3904fde0c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -110,6 +110,23 @@
 #define MGAG200_MAX_FB_HEIGHT 4096
 #define MGAG200_MAX_FB_WIDTH 4096
 
+/*
+ * Stores parameters for programming the PLLs
+ *
+ * Fref: reference frequency (A: 25.175 Mhz, B: 28.361, C: XX Mhz)
+ * Fo: output frequency
+ * Fvco = Fref * (N / M)
+ * Fo = Fvco / P
+ *
+ * S = [0..3]
+ */
+struct mgag200_pll_values {
+	unsigned int m;
+	unsigned int n;
+	unsigned int p;
+	unsigned int s;
+};
+
 #define to_mga_connector(x) container_of(x, struct mga_connector, base)
 
 struct mga_i2c_chan {
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index fa06f1994d68..961bd128fea3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -114,7 +114,8 @@ static inline void mga_wait_busy(struct mga_device *mdev)
  * PLL setup
  */
 
-static int mgag200_g200_set_plls(struct mga_device *mdev, long clock)
+static int mgag200_compute_pixpll_values_g200(struct mga_device *mdev, long clock,
+					      struct mgag200_pll_values *pixpllc)
 {
 	struct drm_device *dev = &mdev->base;
 	const int post_div_max = 7;
@@ -130,7 +131,6 @@ static int mgag200_g200_set_plls(struct mga_device *mdev, long clock)
 	long ref_clk = mdev->model.g200.ref_clk;
 	long p_clk_min = mdev->model.g200.pclk_min;
 	long p_clk_max =  mdev->model.g200.pclk_max;
-	u8 misc;
 
 	if (clock > p_clk_max) {
 		drm_err(dev, "Pixel Clock %ld too high\n", clock);
@@ -175,19 +175,34 @@ static int mgag200_g200_set_plls(struct mga_device *mdev, long clock)
 	drm_dbg_kms(dev, "clock: %ld vco: %ld m: %d n: %d p: %d s: %d\n",
 		    clock, f_vco, m, n, p, s);
 
+	pixpllc->m = m;
+	pixpllc->n = n;
+	pixpllc->p = p;
+	pixpllc->s = s;
+
+	return 0;
+}
+
+static void mgag200_set_pixpll_g200(struct mga_device *mdev,
+				    const struct mgag200_pll_values *pixpllc)
+{
+	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp;
+
 	misc = RREG8(MGA_MISC_IN);
 	misc &= ~MGAREG_MISC_CLK_SEL_MASK;
 	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
 	WREG8(MGA_MISC_OUT, misc);
 
-	WREG_DAC(MGA1064_PIX_PLLC_M, m);
-	WREG_DAC(MGA1064_PIX_PLLC_N, n);
-	WREG_DAC(MGA1064_PIX_PLLC_P, (p | (s << 3)));
-
-	return 0;
+	xpixpllcm = pixpllc->m;
+	xpixpllcn = pixpllc->n;
+	xpixpllcp = pixpllc->p | (pixpllc->s << 3);
+	WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
+	WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
+	WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
 }
 
-static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
+static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long clock,
+						struct mgag200_pll_values *pixpllc)
 {
 	static const unsigned int pvalues_e4[] = {16, 14, 12, 10, 8, 6, 4, 2, 1};
 
@@ -199,7 +214,6 @@ static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
 	unsigned int computed;
 	unsigned int fvv;
 	unsigned int i;
-	u8 misc;
 
 	if (unique_rev_id <= 0x03) {
 
@@ -295,35 +309,47 @@ static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
 		return -EINVAL;
 	}
 
+	pixpllc->m = m;
+	pixpllc->n = n;
+	pixpllc->p = p;
+	pixpllc->s = 0;
+
+	return 0;
+}
+
+static void mgag200_set_pixpll_g200se(struct mga_device *mdev,
+				      const struct mgag200_pll_values *pixpllc)
+{
+	u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
+	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp;
+
 	misc = RREG8(MGA_MISC_IN);
 	misc &= ~MGAREG_MISC_CLK_SEL_MASK;
 	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
 	WREG8(MGA_MISC_OUT, misc);
 
-	WREG_DAC(MGA1064_PIX_PLLC_M, m);
-	WREG_DAC(MGA1064_PIX_PLLC_N, n);
-	WREG_DAC(MGA1064_PIX_PLLC_P, p);
+	xpixpllcm = pixpllc->m;
+	xpixpllcn = pixpllc->n;
+	xpixpllcp = pixpllc->p | (pixpllc->s << 3);
+	WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
+	WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
+	WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
 
 	if (unique_rev_id >= 0x04) {
 		WREG_DAC(0x1a, 0x09);
 		msleep(20);
 		WREG_DAC(0x1a, 0x01);
-
 	}
-
-	return 0;
 }
 
-static int mga_g200wb_set_plls(struct mga_device *mdev, long clock)
+static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long clock,
+						struct mgag200_pll_values *pixpllc)
 {
 	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta;
 	unsigned int testp, testm, testn, testp2;
 	unsigned int p, m, n;
 	unsigned int computed;
-	int i, j, tmpcount, vcount;
-	bool pll_locked = false;
-	u8 tmp, misc;
 
 	m = n = p = 0;
 
@@ -396,11 +422,30 @@ static int mga_g200wb_set_plls(struct mga_device *mdev, long clock)
 		}
 	}
 
+	pixpllc->m = m;
+	pixpllc->n = n;
+	pixpllc->p = p;
+	pixpllc->s = 0;
+
+	return 0;
+}
+
+static void mgag200_set_pixpll_g200wb(struct mga_device *mdev,
+				      const struct mgag200_pll_values *pixpllc)
+{
+	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
+	int i, j, tmpcount, vcount;
+	bool pll_locked = false;
+
 	misc = RREG8(MGA_MISC_IN);
 	misc &= ~MGAREG_MISC_CLK_SEL_MASK;
 	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
 	WREG8(MGA_MISC_OUT, misc);
 
+	xpixpllcm = pixpllc->m;
+	xpixpllcn = pixpllc->n;
+	xpixpllcp = pixpllc->p | (pixpllc->s << 3);
+
 	for (i = 0; i <= 32 && pll_locked == false; i++) {
 		if (i > 0) {
 			WREG8(MGAREG_CRTC_INDEX, 0x1e);
@@ -441,9 +486,9 @@ static int mga_g200wb_set_plls(struct mga_device *mdev, long clock)
 		udelay(50);
 
 		/* program pixel pll register */
-		WREG_DAC(MGA1064_WB_PIX_PLLC_N, n);
-		WREG_DAC(MGA1064_WB_PIX_PLLC_M, m);
-		WREG_DAC(MGA1064_WB_PIX_PLLC_P, p);
+		WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
+		WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
+		WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
 
 		udelay(50);
 
@@ -491,21 +536,21 @@ static int mga_g200wb_set_plls(struct mga_device *mdev, long clock)
 				udelay(5);
 		}
 	}
+
 	WREG8(DAC_INDEX, MGA1064_REMHEADCTL);
 	tmp = RREG8(DAC_DATA);
 	tmp &= ~MGA1064_REMHEADCTL_CLKDIS;
 	WREG_DAC(MGA1064_REMHEADCTL, tmp);
-	return 0;
 }
 
-static int mga_g200ev_set_plls(struct mga_device *mdev, long clock)
+static int mgag200_compute_pixpll_values_g200ev(struct mga_device *mdev, long clock,
+						struct mgag200_pll_values *pixpllc)
 {
 	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta;
 	unsigned int testp, testm, testn;
 	unsigned int p, m, n;
 	unsigned int computed;
-	u8 tmp, misc;
 
 	m = n = p = 0;
 	vcomax = 550000;
@@ -538,11 +583,28 @@ static int mga_g200ev_set_plls(struct mga_device *mdev, long clock)
 		}
 	}
 
+	pixpllc->m = m;
+	pixpllc->n = n;
+	pixpllc->p = p;
+	pixpllc->s = 0;
+
+	return 0;
+}
+
+static void mgag200_set_pixpll_g200ev(struct mga_device *mdev,
+				      const struct mgag200_pll_values *pixpllc)
+{
+	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
+
 	misc = RREG8(MGA_MISC_IN);
 	misc &= ~MGAREG_MISC_CLK_SEL_MASK;
 	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
 	WREG8(MGA_MISC_OUT, misc);
 
+	xpixpllcm = pixpllc->m;
+	xpixpllcn = pixpllc->n;
+	xpixpllcp = pixpllc->p | (pixpllc->s << 3);
+
 	WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
 	tmp = RREG8(DAC_DATA);
 	tmp |= MGA1064_PIX_CLK_CTL_CLK_DIS;
@@ -561,9 +623,9 @@ static int mga_g200ev_set_plls(struct mga_device *mdev, long clock)
 	tmp |= MGA1064_PIX_CLK_CTL_CLK_POW_DOWN;
 	WREG8(DAC_DATA, tmp);
 
-	WREG_DAC(MGA1064_EV_PIX_PLLC_M, m);
-	WREG_DAC(MGA1064_EV_PIX_PLLC_N, n);
-	WREG_DAC(MGA1064_EV_PIX_PLLC_P, p);
+	WREG_DAC(MGA1064_EV_PIX_PLLC_M, xpixpllcm);
+	WREG_DAC(MGA1064_EV_PIX_PLLC_N, xpixpllcn);
+	WREG_DAC(MGA1064_EV_PIX_PLLC_P, xpixpllcp);
 
 	udelay(50);
 
@@ -592,20 +654,16 @@ static int mga_g200ev_set_plls(struct mga_device *mdev, long clock)
 	tmp = RREG8(DAC_DATA);
 	tmp &= ~MGA1064_PIX_CLK_CTL_CLK_DIS;
 	WREG8(DAC_DATA, tmp);
-
-	return 0;
 }
 
-static int mga_g200eh_set_plls(struct mga_device *mdev, long clock)
+static int mgag200_compute_pixpll_values_g200eh(struct mga_device *mdev, long clock,
+						struct mgag200_pll_values *pixpllc)
 {
 	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta;
 	unsigned int testp, testm, testn;
 	unsigned int p, m, n;
 	unsigned int computed;
-	int i, j, tmpcount, vcount;
-	u8 tmp, misc;
-	bool pll_locked = false;
 
 	m = n = p = 0;
 
@@ -676,11 +734,30 @@ static int mga_g200eh_set_plls(struct mga_device *mdev, long clock)
 		}
 	}
 
+	pixpllc->m = m;
+	pixpllc->n = n;
+	pixpllc->p = p;
+	pixpllc->s = 0;
+
+	return 0;
+}
+
+static void mgag200_set_pixpll_g200eh(struct mga_device *mdev,
+				      const struct mgag200_pll_values *pixpllc)
+{
+	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
+	int i, j, tmpcount, vcount;
+	bool pll_locked = false;
+
 	misc = RREG8(MGA_MISC_IN);
 	misc &= ~MGAREG_MISC_CLK_SEL_MASK;
 	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
 	WREG8(MGA_MISC_OUT, misc);
 
+	xpixpllcm = pixpllc->m;
+	xpixpllcn = pixpllc->n;
+	xpixpllcp = pixpllc->p | (pixpllc->s << 3);
+
 	for (i = 0; i <= 32 && pll_locked == false; i++) {
 		WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
 		tmp = RREG8(DAC_DATA);
@@ -698,9 +775,9 @@ static int mga_g200eh_set_plls(struct mga_device *mdev, long clock)
 
 		udelay(500);
 
-		WREG_DAC(MGA1064_EH_PIX_PLLC_M, m);
-		WREG_DAC(MGA1064_EH_PIX_PLLC_N, n);
-		WREG_DAC(MGA1064_EH_PIX_PLLC_P, p);
+		WREG_DAC(MGA1064_EH_PIX_PLLC_M, xpixpllcm);
+		WREG_DAC(MGA1064_EH_PIX_PLLC_N, xpixpllcn);
+		WREG_DAC(MGA1064_EH_PIX_PLLC_P, xpixpllcp);
 
 		udelay(500);
 
@@ -728,11 +805,10 @@ static int mga_g200eh_set_plls(struct mga_device *mdev, long clock)
 				udelay(5);
 		}
 	}
-
-	return 0;
 }
 
-static int mga_g200er_set_plls(struct mga_device *mdev, long clock)
+static int mgag200_compute_pixpll_values_g200er(struct mga_device *mdev, long clock,
+						struct mgag200_pll_values *pixpllc)
 {
 	static const unsigned int m_div_val[] = { 1, 2, 4, 8 };
 	unsigned int vcomax, vcomin, pllreffreq;
@@ -740,8 +816,6 @@ static int mga_g200er_set_plls(struct mga_device *mdev, long clock)
 	int testr, testn, testm, testo;
 	unsigned int p, m, n;
 	unsigned int computed, vco;
-	int tmp;
-	u8 misc;
 
 	m = n = p = 0;
 	vcomax = 1488000;
@@ -782,11 +856,28 @@ static int mga_g200er_set_plls(struct mga_device *mdev, long clock)
 		}
 	}
 
+	pixpllc->m = m;
+	pixpllc->n = n;
+	pixpllc->p = p;
+	pixpllc->s = 0;
+
+	return 0;
+}
+
+static void mgag200_set_pixpll_g200er(struct mga_device *mdev,
+				      const struct mgag200_pll_values *pixpllc)
+{
+	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
+
 	misc = RREG8(MGA_MISC_IN);
 	misc &= ~MGAREG_MISC_CLK_SEL_MASK;
 	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
 	WREG8(MGA_MISC_OUT, misc);
 
+	xpixpllcm = pixpllc->m;
+	xpixpllcn = pixpllc->n;
+	xpixpllcp = pixpllc->p | (pixpllc->s << 3);
+
 	WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
 	tmp = RREG8(DAC_DATA);
 	tmp |= MGA1064_PIX_CLK_CTL_CLK_DIS;
@@ -809,37 +900,70 @@ static int mga_g200er_set_plls(struct mga_device *mdev, long clock)
 
 	udelay(500);
 
-	WREG_DAC(MGA1064_ER_PIX_PLLC_N, n);
-	WREG_DAC(MGA1064_ER_PIX_PLLC_M, m);
-	WREG_DAC(MGA1064_ER_PIX_PLLC_P, p);
+	WREG_DAC(MGA1064_ER_PIX_PLLC_N, xpixpllcn);
+	WREG_DAC(MGA1064_ER_PIX_PLLC_M, xpixpllcm);
+	WREG_DAC(MGA1064_ER_PIX_PLLC_P, xpixpllcp);
 
 	udelay(50);
-
-	return 0;
 }
 
-static int mgag200_crtc_set_plls(struct mga_device *mdev, long clock)
+static void mgag200_crtc_set_plls(struct mga_device *mdev, long clock)
 {
+	struct mgag200_pll_values pixpll;
+	int ret;
+
 	switch(mdev->type) {
 	case G200_PCI:
 	case G200_AGP:
-		return mgag200_g200_set_plls(mdev, clock);
+		ret = mgag200_compute_pixpll_values_g200(mdev, clock, &pixpll);
+		break;
 	case G200_SE_A:
 	case G200_SE_B:
-		return mga_g200se_set_plls(mdev, clock);
+		ret = mgag200_compute_pixpll_values_g200se(mdev, clock, &pixpll);
+		break;
 	case G200_WB:
 	case G200_EW3:
-		return mga_g200wb_set_plls(mdev, clock);
+		ret = mgag200_compute_pixpll_values_g200wb(mdev, clock, &pixpll);
+		break;
 	case G200_EV:
-		return mga_g200ev_set_plls(mdev, clock);
+		ret = mgag200_compute_pixpll_values_g200ev(mdev, clock, &pixpll);
+		break;
 	case G200_EH:
 	case G200_EH3:
-		return mga_g200eh_set_plls(mdev, clock);
+		ret = mgag200_compute_pixpll_values_g200eh(mdev, clock, &pixpll);
+		break;
 	case G200_ER:
-		return mga_g200er_set_plls(mdev, clock);
+		ret = mgag200_compute_pixpll_values_g200er(mdev, clock, &pixpll);
+		break;
 	}
 
-	return 0;
+	if (ret)
+		return;
+
+	switch (mdev->type) {
+	case G200_PCI:
+	case G200_AGP:
+		mgag200_set_pixpll_g200(mdev, &pixpll);
+		break;
+	case G200_SE_A:
+	case G200_SE_B:
+		mgag200_set_pixpll_g200se(mdev, &pixpll);
+		break;
+	case G200_WB:
+	case G200_EW3:
+		mgag200_set_pixpll_g200wb(mdev, &pixpll);
+		break;
+	case G200_EV:
+		mgag200_set_pixpll_g200ev(mdev, &pixpll);
+		break;
+	case G200_EH:
+	case G200_EH3:
+		mgag200_set_pixpll_g200eh(mdev, &pixpll);
+		break;
+	case G200_ER:
+		mgag200_set_pixpll_g200er(mdev, &pixpll);
+		break;
+	}
 }
 
 static void mgag200_g200wb_hold_bmc(struct mga_device *mdev)
-- 
2.32.0

