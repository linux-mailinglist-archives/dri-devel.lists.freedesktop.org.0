Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B293BBD03
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 14:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73908897EE;
	Mon,  5 Jul 2021 12:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D96897EE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:45:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6073D1FE78;
 Mon,  5 Jul 2021 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625489118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/EXfMxzVZtzbb0moC/e72YDugiU6UmwOfUzmCfU62Pk=;
 b=T95CiQGZnkZmILBz/Wz3cwCBwEOiR4Ga4dSlJSiUF+jCgD4hB8HvJWsBMARE7bNhT2Dmz5
 Tpy4RQCnwYCk+cU6EQCmDgVTTpt596xd7U+qYfCNJ9RNeAlx3KAdz8Or03rjJ1pWvQw4le
 PehBCWykyZ5Kk/PK/bP5M+3JLnLJzvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625489118;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/EXfMxzVZtzbb0moC/e72YDugiU6UmwOfUzmCfU62Pk=;
 b=uO7WmWmAgGi64OCuquMBQn9XF0cUY6jWD7z/mtIdipXlXvm9lPzewHw7xt+Qvd8Ok7M4Gm
 mxYfGiGPBGIoQ6Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2653A139F6;
 Mon,  5 Jul 2021 12:45:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AKdGCN7+4mDkcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 12:45:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 emil.velikov@collabora.com, John.p.donnelly@oracle.com
Subject: [PATCH 06/12] drm/mgag200: Store values (not bits) in struct
 mgag200_pll_values
Date: Mon,  5 Jul 2021 14:45:09 +0200
Message-Id: <20210705124515.27253-7-tzimmermann@suse.de>
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

The fields in struct mgag200_pll_values currently hold the bits of
each register. Store the PLL values instead and let the PLL-update
code figure out the bits for each register.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 153 +++++++++++++++----------
 1 file changed, 91 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 9f6fe7673674..7d6707bd6c27 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -123,7 +123,7 @@ static int mgag200_compute_pixpll_values_g200(struct mga_device *mdev, long cloc
 	const int in_div_max = 6;
 	const int feed_div_min = 7;
 	const int feed_div_max = 127;
-	u8 testm, testn;
+	u8 testp, testm, testn;
 	u8 n = 0, m = 0, p, s;
 	long f_vco;
 	long computed;
@@ -141,10 +141,11 @@ static int mgag200_compute_pixpll_values_g200(struct mga_device *mdev, long cloc
 		clock = p_clk_min >> 3;
 
 	f_vco = clock;
-	for (p = 0;
-	     p <= post_div_max && f_vco < p_clk_min;
-	     p = (p << 1) + 1, f_vco <<= 1)
+	for (testp = 0;
+	     testp <= post_div_max && f_vco < p_clk_min;
+	     testp = (testp << 1) + 1, f_vco <<= 1)
 		;
+	p = testp + 1;
 
 	delta = clock;
 
@@ -157,12 +158,12 @@ static int mgag200_compute_pixpll_values_g200(struct mga_device *mdev, long cloc
 				tmp_delta = computed - f_vco;
 			if (tmp_delta < delta) {
 				delta = tmp_delta;
-				m = testm;
-				n = testn;
+				m = testm + 1;
+				n = testn + 1;
 			}
 		}
 	}
-	f_vco = ref_clk * (n + 1) / (m + 1);
+	f_vco = ref_clk * n / m;
 	if (f_vco < 100000)
 		s = 0;
 	else if (f_vco < 140000)
@@ -186,6 +187,7 @@ static int mgag200_compute_pixpll_values_g200(struct mga_device *mdev, long cloc
 static void mgag200_set_pixpll_g200(struct mga_device *mdev,
 				    const struct mgag200_pll_values *pixpllc)
 {
+	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
 	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp;
 
 	misc = RREG8(MGA_MISC_IN);
@@ -193,9 +195,14 @@ static void mgag200_set_pixpll_g200(struct mga_device *mdev,
 	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
 	WREG8(MGA_MISC_OUT, misc);
 
-	xpixpllcm = pixpllc->m;
-	xpixpllcn = pixpllc->n;
-	xpixpllcp = pixpllc->p | (pixpllc->s << 3);
+	pixpllcm = pixpllc->m - 1;
+	pixpllcn = pixpllc->n - 1;
+	pixpllcp = pixpllc->p - 1;
+	pixpllcs = pixpllc->s;
+
+	xpixpllcm = pixpllcm;
+	xpixpllcn = pixpllcn;
+	xpixpllcp = (pixpllcs << 3) | pixpllcp;
 	WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
 	WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
 	WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
@@ -240,9 +247,9 @@ static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long cl
 						tmpdelta = clock - computed;
 					if (tmpdelta < delta) {
 						delta = tmpdelta;
-						m = testm - 1;
-						n = testn - 1;
-						p = testp - 1;
+						m = testm;
+						n = testn;
+						p = testp;
 					}
 				}
 			}
@@ -280,22 +287,19 @@ static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long cl
 
 					if (tmpdelta < delta) {
 						delta = tmpdelta;
-						m = testm - 1;
-						n = testn - 1;
-						p = testp - 1;
+						m = testm;
+						n = testn;
+						p = testp;
 					}
 				}
 			}
 		}
 
-		fvv = pllreffreq * (n + 1) / (m + 1);
+		fvv = pllreffreq * n / m;
 		fvv = (fvv - 800000) / 50000;
-
 		if (fvv > 15)
 			fvv = 15;
-
-		p |= (fvv << 4);
-		m |= 0x80;
+		s = fvv << 1;
 
 		clock = clock / 2;
 	}
@@ -317,6 +321,7 @@ static void mgag200_set_pixpll_g200se(struct mga_device *mdev,
 				      const struct mgag200_pll_values *pixpllc)
 {
 	u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
+	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
 	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp;
 
 	misc = RREG8(MGA_MISC_IN);
@@ -324,9 +329,14 @@ static void mgag200_set_pixpll_g200se(struct mga_device *mdev,
 	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
 	WREG8(MGA_MISC_OUT, misc);
 
-	xpixpllcm = pixpllc->m;
-	xpixpllcn = pixpllc->n;
-	xpixpllcp = pixpllc->p | (pixpllc->s << 3);
+	pixpllcm = pixpllc->m - 1;
+	pixpllcn = pixpllc->n - 1;
+	pixpllcp = pixpllc->p - 1;
+	pixpllcs = pixpllc->s;
+
+	xpixpllcm = pixpllcm | ((pixpllcn & BIT(8)) >> 1);
+	xpixpllcn = pixpllcn;
+	xpixpllcp = (pixpllcs << 3) | pixpllcp;
 	WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
 	WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
 	WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
@@ -352,7 +362,6 @@ static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long cl
 	delta = 0xffffffff;
 
 	if (mdev->type == G200_EW3) {
-
 		vcomax = 800000;
 		vcomin = 400000;
 		pllreffreq = 25000;
@@ -375,19 +384,16 @@ static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long cl
 							tmpdelta = clock - computed;
 						if (tmpdelta < delta) {
 							delta = tmpdelta;
-							m = ((testn & 0x100) >> 1) |
-								(testm);
-							n = (testn & 0xFF);
-							p = ((testn & 0x600) >> 3) |
-								(testp2 << 3) |
-								(testp);
+							m = testm + 1;
+							n = testn + 1;
+							p = testp + 1;
+							s = testp2;
 						}
 					}
 				}
 			}
 		}
 	} else {
-
 		vcomax = 550000;
 		vcomin = 150000;
 		pllreffreq = 48000;
@@ -408,10 +414,10 @@ static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long cl
 						tmpdelta = clock - computed;
 					if (tmpdelta < delta) {
 						delta = tmpdelta;
-						n = testn - 1;
-						m = (testm - 1) |
-							((n >> 1) & 0x80);
-						p = testp - 1;
+						n = testn;
+						m = testm;
+						p = testp;
+						s = 0;
 					}
 				}
 			}
@@ -429,6 +435,7 @@ static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long cl
 static void mgag200_set_pixpll_g200wb(struct mga_device *mdev,
 				      const struct mgag200_pll_values *pixpllc)
 {
+	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
 	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
 	int i, j, tmpcount, vcount;
 	bool pll_locked = false;
@@ -438,9 +445,14 @@ static void mgag200_set_pixpll_g200wb(struct mga_device *mdev,
 	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
 	WREG8(MGA_MISC_OUT, misc);
 
-	xpixpllcm = pixpllc->m;
-	xpixpllcn = pixpllc->n;
-	xpixpllcp = pixpllc->p | (pixpllc->s << 3);
+	pixpllcm = pixpllc->m - 1;
+	pixpllcn = pixpllc->n - 1;
+	pixpllcp = pixpllc->p - 1;
+	pixpllcs = pixpllc->s;
+
+	xpixpllcm = ((pixpllcn & BIT(8)) >> 1) | pixpllcm;
+	xpixpllcn = pixpllcn;
+	xpixpllcp = ((pixpllcn & GENMASK(10, 9)) >> 3) | (pixpllcs << 3) | pixpllcp;
 
 	for (i = 0; i <= 32 && pll_locked == false; i++) {
 		if (i > 0) {
@@ -571,9 +583,9 @@ static int mgag200_compute_pixpll_values_g200ev(struct mga_device *mdev, long cl
 					tmpdelta = clock - computed;
 				if (tmpdelta < delta) {
 					delta = tmpdelta;
-					n = testn - 1;
-					m = testm - 1;
-					p = testp - 1;
+					n = testn;
+					m = testm;
+					p = testp;
 				}
 			}
 		}
@@ -590,6 +602,7 @@ static int mgag200_compute_pixpll_values_g200ev(struct mga_device *mdev, long cl
 static void mgag200_set_pixpll_g200ev(struct mga_device *mdev,
 				      const struct mgag200_pll_values *pixpllc)
 {
+	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
 	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
 
 	misc = RREG8(MGA_MISC_IN);
@@ -597,9 +610,14 @@ static void mgag200_set_pixpll_g200ev(struct mga_device *mdev,
 	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
 	WREG8(MGA_MISC_OUT, misc);
 
-	xpixpllcm = pixpllc->m;
-	xpixpllcn = pixpllc->n;
-	xpixpllcp = pixpllc->p | (pixpllc->s << 3);
+	pixpllcm = pixpllc->m - 1;
+	pixpllcn = pixpllc->n - 1;
+	pixpllcp = pixpllc->p - 1;
+	pixpllcs = pixpllc->s;
+
+	xpixpllcm = pixpllcm;
+	xpixpllcn = pixpllcn;
+	xpixpllcp = (pixpllcs << 3) | pixpllcp;
 
 	WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
 	tmp = RREG8(DAC_DATA);
@@ -685,9 +703,9 @@ static int mgag200_compute_pixpll_values_g200eh(struct mga_device *mdev, long cl
 					tmpdelta = clock - computed;
 				if (tmpdelta < delta) {
 					delta = tmpdelta;
-					n = testn;
-					m = testm;
-					p = testp;
+					n = testn + 1;
+					m = testm + 1;
+					p = testp + 1;
 				}
 				if (delta == 0)
 					break;
@@ -719,12 +737,10 @@ static int mgag200_compute_pixpll_values_g200eh(struct mga_device *mdev, long cl
 						tmpdelta = clock - computed;
 					if (tmpdelta < delta) {
 						delta = tmpdelta;
-						n = testn - 1;
-						m = (testm - 1);
-						p = testp - 1;
+						n = testn;
+						m = testm;
+						p = testp;
 					}
-					if ((clock * testp) >= 600000)
-						p |= 0x80;
 				}
 			}
 		}
@@ -741,6 +757,7 @@ static int mgag200_compute_pixpll_values_g200eh(struct mga_device *mdev, long cl
 static void mgag200_set_pixpll_g200eh(struct mga_device *mdev,
 				      const struct mgag200_pll_values *pixpllc)
 {
+	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
 	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
 	int i, j, tmpcount, vcount;
 	bool pll_locked = false;
@@ -750,9 +767,14 @@ static void mgag200_set_pixpll_g200eh(struct mga_device *mdev,
 	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
 	WREG8(MGA_MISC_OUT, misc);
 
-	xpixpllcm = pixpllc->m;
-	xpixpllcn = pixpllc->n;
-	xpixpllcp = pixpllc->p | (pixpllc->s << 3);
+	pixpllcm = pixpllc->m - 1;
+	pixpllcn = pixpllc->n - 1;
+	pixpllcp = pixpllc->p - 1;
+	pixpllcs = pixpllc->s;
+
+	xpixpllcm = ((pixpllcn & BIT(8)) >> 1) | pixpllcm;
+	xpixpllcn = pixpllcn;
+	xpixpllcp = (pixpllcs << 3) | pixpllcp;
 
 	for (i = 0; i <= 32 && pll_locked == false; i++) {
 		WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
@@ -843,9 +865,10 @@ static int mgag200_compute_pixpll_values_g200er(struct mga_device *mdev, long cl
 						tmpdelta = clock - computed;
 					if (tmpdelta < delta) {
 						delta = tmpdelta;
-						m = testm | (testo << 3);
-						n = testn;
-						p = testr | (testr << 3);
+						m = (testm | (testo << 3)) + 1;
+						n = testn + 1;
+						p = testr + 1;
+						s = testr;
 					}
 				}
 			}
@@ -863,6 +886,7 @@ static int mgag200_compute_pixpll_values_g200er(struct mga_device *mdev, long cl
 static void mgag200_set_pixpll_g200er(struct mga_device *mdev,
 				      const struct mgag200_pll_values *pixpllc)
 {
+	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
 	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp, tmp;
 
 	misc = RREG8(MGA_MISC_IN);
@@ -870,9 +894,14 @@ static void mgag200_set_pixpll_g200er(struct mga_device *mdev,
 	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
 	WREG8(MGA_MISC_OUT, misc);
 
-	xpixpllcm = pixpllc->m;
-	xpixpllcn = pixpllc->n;
-	xpixpllcp = pixpllc->p | (pixpllc->s << 3);
+	pixpllcm = pixpllc->m - 1;
+	pixpllcn = pixpllc->n - 1;
+	pixpllcp = pixpllc->p - 1;
+	pixpllcs = pixpllc->s;
+
+	xpixpllcm = pixpllcm;
+	xpixpllcn = pixpllcn;
+	xpixpllcp = (pixpllcs << 3) | pixpllcp;
 
 	WREG8(DAC_INDEX, MGA1064_PIX_CLK_CTL);
 	tmp = RREG8(DAC_DATA);
-- 
2.32.0

