Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 458B93BBD05
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 14:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5E289C19;
	Mon,  5 Jul 2021 12:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388A2897EE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:45:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DC3A21FE7C;
 Mon,  5 Jul 2021 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625489118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvQ1mGcPqlknuZg1mMsM9Y+z4UjRg7mtaM4tgQV7ikc=;
 b=wujieMVy3aamSO0VrzNlhJnRlOdgE+Mlyxn6oQ8RzdzUsycbK0dmXllUKWMQFqIkaclBDg
 jS7fUlcUb9WuU1CZcq5F9ZbS54r7RrMAy+bmdhWWt+4iKUoB0Z45y6M2UK4VsrVncNPzBS
 kckROe9Flm83o/F5wErzyop8q5al9Y4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625489118;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvQ1mGcPqlknuZg1mMsM9Y+z4UjRg7mtaM4tgQV7ikc=;
 b=YiaNW4kzm1insdj9XCzgNHDu1Zi5Vv9xN5HgEYwjJu7vPKzwpwUPu1XGI9A6louo603fIj
 RMzTlwF/GgWLD2BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A85E139F6;
 Mon,  5 Jul 2021 12:45:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sOfAJN7+4mDkcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 12:45:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 emil.velikov@collabora.com, John.p.donnelly@oracle.com
Subject: [PATCH 08/12] drm/mgag200: Separate PLL compute and update functions
 from each other
Date: Mon,  5 Jul 2021 14:45:11 +0200
Message-Id: <20210705124515.27253-9-tzimmermann@suse.de>
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

Move PLL compute and update functionality to distict places within
the file. Contains some minor style cleanups, but no functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 737 +++++++++++++------------
 1 file changed, 369 insertions(+), 368 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index d3b15e60f057..72fdf242cac7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -184,30 +184,6 @@ static int mgag200_compute_pixpll_values_g200(struct mga_device *mdev, long cloc
 	return 0;
 }
 
-static void mgag200_set_pixpll_g200(struct mga_device *mdev,
-				    const struct mgag200_pll_values *pixpllc)
-{
-	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
-	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp;
-
-	misc = RREG8(MGA_MISC_IN);
-	misc &= ~MGAREG_MISC_CLK_SEL_MASK;
-	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
-	WREG8(MGA_MISC_OUT, misc);
-
-	pixpllcm = pixpllc->m - 1;
-	pixpllcn = pixpllc->n - 1;
-	pixpllcp = pixpllc->p - 1;
-	pixpllcs = pixpllc->s;
-
-	xpixpllcm = pixpllcm;
-	xpixpllcn = pixpllcn;
-	xpixpllcp = (pixpllcs << 3) | pixpllcp;
-	WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
-	WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
-	WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
-}
-
 static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long clock,
 						struct mgag200_pll_values *pixpllc)
 {
@@ -223,12 +199,12 @@ static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long cl
 	unsigned int i;
 
 	m = n = p = s = 0;
+	delta = 0xffffffff;
 
 	if (unique_rev_id <= 0x03) {
 		vcomax = 320000;
 		vcomin = 160000;
 		pllreffreq = 25000;
-		delta = 0xffffffff;
 		permitteddelta = clock * 5 / 1000;
 
 		for (testp = 8; testp > 0; testp /= 2) {
@@ -261,10 +237,8 @@ static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long cl
 
 		if (clock < 25000)
 			clock = 25000;
-
 		clock = clock * 2;
 
-		delta = 0xFFFFFFFF;
 		/* Permited delta is 0.5% as VESA Specification */
 		permitteddelta = clock * 5 / 1000;
 
@@ -317,38 +291,55 @@ static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long cl
 	return 0;
 }
 
-static void mgag200_set_pixpll_g200se(struct mga_device *mdev,
-				      const struct mgag200_pll_values *pixpllc)
+static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long clock,
+						struct mgag200_pll_values *pixpllc)
 {
-	u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
-	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
-	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp;
+	unsigned int vcomax, vcomin, pllreffreq;
+	unsigned int delta, tmpdelta;
+	unsigned int testp, testm, testn;
+	unsigned int p, m, n, s;
+	unsigned int computed;
 
-	misc = RREG8(MGA_MISC_IN);
-	misc &= ~MGAREG_MISC_CLK_SEL_MASK;
-	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
-	WREG8(MGA_MISC_OUT, misc);
+	m = n = p = s = 0;
+	delta = 0xffffffff;
 
-	pixpllcm = pixpllc->m - 1;
-	pixpllcn = pixpllc->n - 1;
-	pixpllcp = pixpllc->p - 1;
-	pixpllcs = pixpllc->s;
+	vcomax = 550000;
+	vcomin = 150000;
+	pllreffreq = 48000;
 
-	xpixpllcm = pixpllcm | ((pixpllcn & BIT(8)) >> 1);
-	xpixpllcn = pixpllcn;
-	xpixpllcp = (pixpllcs << 3) | pixpllcp;
-	WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
-	WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
-	WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
+	for (testp = 1; testp < 9; testp++) {
+		if (clock * testp > vcomax)
+			continue;
+		if (clock * testp < vcomin)
+			continue;
 
-	if (unique_rev_id >= 0x04) {
-		WREG_DAC(0x1a, 0x09);
-		msleep(20);
-		WREG_DAC(0x1a, 0x01);
+		for (testm = 1; testm < 17; testm++) {
+			for (testn = 1; testn < 151; testn++) {
+				computed = (pllreffreq * testn) / (testm * testp);
+				if (computed > clock)
+					tmpdelta = computed - clock;
+				else
+					tmpdelta = clock - computed;
+				if (tmpdelta < delta) {
+					delta = tmpdelta;
+					n = testn;
+					m = testm;
+					p = testp;
+					s = 0;
+				}
+			}
+		}
 	}
+
+	pixpllc->m = m;
+	pixpllc->n = n;
+	pixpllc->p = p;
+	pixpllc->s = s;
+
+	return 0;
 }
 
-static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long clock,
+static int mgag200_compute_pixpll_values_g200ev(struct mga_device *mdev, long clock,
 						struct mgag200_pll_values *pixpllc)
 {
 	unsigned int vcomax, vcomin, pllreffreq;
@@ -358,21 +349,68 @@ static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long cl
 	unsigned int computed;
 
 	m = n = p = s = 0;
-
 	delta = 0xffffffff;
 
 	vcomax = 550000;
 	vcomin = 150000;
-	pllreffreq = 48000;
+	pllreffreq = 50000;
 
-	for (testp = 1; testp < 9; testp++) {
+	for (testp = 16; testp > 0; testp--) {
 		if (clock * testp > vcomax)
 			continue;
 		if (clock * testp < vcomin)
 			continue;
 
-		for (testm = 1; testm < 17; testm++) {
-			for (testn = 1; testn < 151; testn++) {
+		for (testn = 1; testn < 257; testn++) {
+			for (testm = 1; testm < 17; testm++) {
+				computed = (pllreffreq * testn) /
+					(testm * testp);
+				if (computed > clock)
+					tmpdelta = computed - clock;
+				else
+					tmpdelta = clock - computed;
+				if (tmpdelta < delta) {
+					delta = tmpdelta;
+					n = testn;
+					m = testm;
+					p = testp;
+				}
+			}
+		}
+	}
+
+	pixpllc->m = m;
+	pixpllc->n = n;
+	pixpllc->p = p;
+	pixpllc->s = s;
+
+	return 0;
+}
+
+static int mgag200_compute_pixpll_values_g200eh(struct mga_device *mdev, long clock,
+						struct mgag200_pll_values *pixpllc)
+{
+	unsigned int vcomax, vcomin, pllreffreq;
+	unsigned int delta, tmpdelta;
+	unsigned int testp, testm, testn;
+	unsigned int p, m, n, s;
+	unsigned int computed;
+
+	m = n = p = s = 0;
+	delta = 0xffffffff;
+
+	vcomax = 800000;
+	vcomin = 400000;
+	pllreffreq = 33333;
+
+	for (testp = 16; testp > 0; testp >>= 1) {
+		if (clock * testp > vcomax)
+			continue;
+		if (clock * testp < vcomin)
+			continue;
+
+		for (testm = 1; testm < 33; testm++) {
+			for (testn = 17; testn < 257; testn++) {
 				computed = (pllreffreq * testn) / (testm * testp);
 				if (computed > clock)
 					tmpdelta = computed - clock;
@@ -383,7 +421,6 @@ static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long cl
 					n = testn;
 					m = testm;
 					p = testp;
-					s = 0;
 				}
 			}
 		}
@@ -397,6 +434,256 @@ static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long cl
 	return 0;
 }
 
+static int mgag200_compute_pixpll_values_g200eh3(struct mga_device *mdev, long clock,
+						 struct mgag200_pll_values *pixpllc)
+{
+	unsigned int vcomax, vcomin, pllreffreq;
+	unsigned int delta, tmpdelta;
+	unsigned int testp, testm, testn;
+	unsigned int p, m, n, s;
+	unsigned int computed;
+
+	m = n = p = s = 0;
+	delta = 0xffffffff;
+	testp = 0;
+
+	vcomax = 3000000;
+	vcomin = 1500000;
+	pllreffreq = 25000;
+
+	for (testm = 150; testm >= 6; testm--) {
+		if (clock * testm > vcomax)
+			continue;
+		if (clock * testm < vcomin)
+			continue;
+		for (testn = 120; testn >= 60; testn--) {
+			computed = (pllreffreq * testn) / testm;
+			if (computed > clock)
+				tmpdelta = computed - clock;
+			else
+				tmpdelta = clock - computed;
+			if (tmpdelta < delta) {
+				delta = tmpdelta;
+				n = testn + 1;
+				m = testm + 1;
+				p = testp + 1;
+			}
+			if (delta == 0)
+				break;
+		}
+		if (delta == 0)
+			break;
+	}
+
+	pixpllc->m = m;
+	pixpllc->n = n;
+	pixpllc->p = p;
+	pixpllc->s = s;
+
+	return 0;
+}
+
+static int mgag200_compute_pixpll_values_g200er(struct mga_device *mdev, long clock,
+						struct mgag200_pll_values *pixpllc)
+{
+	static const unsigned int m_div_val[] = { 1, 2, 4, 8 };
+	unsigned int vcomax, vcomin, pllreffreq;
+	unsigned int delta, tmpdelta;
+	int testr, testn, testm, testo;
+	unsigned int p, m, n, s;
+	unsigned int computed, vco;
+
+	vcomax = 1488000;
+	vcomin = 1056000;
+	pllreffreq = 48000;
+
+	m = n = p = s = 0;
+	delta = 0xffffffff;
+
+	for (testr = 0; testr < 4; testr++) {
+		if (delta == 0)
+			break;
+		for (testn = 5; testn < 129; testn++) {
+			if (delta == 0)
+				break;
+			for (testm = 3; testm >= 0; testm--) {
+				if (delta == 0)
+					break;
+				for (testo = 5; testo < 33; testo++) {
+					vco = pllreffreq * (testn + 1) /
+						(testr + 1);
+					if (vco < vcomin)
+						continue;
+					if (vco > vcomax)
+						continue;
+					computed = vco / (m_div_val[testm] * (testo + 1));
+					if (computed > clock)
+						tmpdelta = computed - clock;
+					else
+						tmpdelta = clock - computed;
+					if (tmpdelta < delta) {
+						delta = tmpdelta;
+						m = (testm | (testo << 3)) + 1;
+						n = testn + 1;
+						p = testr + 1;
+						s = testr;
+					}
+				}
+			}
+		}
+	}
+
+	pixpllc->m = m;
+	pixpllc->n = n;
+	pixpllc->p = p;
+	pixpllc->s = s;
+
+	return 0;
+}
+
+static int mgag200_compute_pixpll_values_g200ew3(struct mga_device *mdev, long clock,
+						 struct mgag200_pll_values *pixpllc)
+{
+	unsigned int vcomax, vcomin, pllreffreq;
+	unsigned int delta, tmpdelta;
+	unsigned int testp, testm, testn, testp2;
+	unsigned int p, m, n, s;
+	unsigned int computed;
+
+	m = n = p = s = 0;
+	delta = 0xffffffff;
+
+	vcomax = 800000;
+	vcomin = 400000;
+	pllreffreq = 25000;
+
+	for (testp = 1; testp < 8; testp++) {
+		for (testp2 = 1; testp2 < 8; testp2++) {
+			if (testp < testp2)
+				continue;
+			if ((clock * testp * testp2) > vcomax)
+				continue;
+			if ((clock * testp * testp2) < vcomin)
+				continue;
+			for (testm = 1; testm < 26; testm++) {
+				for (testn = 32; testn < 2048 ; testn++) {
+					computed = (pllreffreq * testn) / (testm * testp * testp2);
+					if (computed > clock)
+						tmpdelta = computed - clock;
+					else
+						tmpdelta = clock - computed;
+					if (tmpdelta < delta) {
+						delta = tmpdelta;
+						m = testm + 1;
+						n = testn + 1;
+						p = testp + 1;
+						s = testp2;
+					}
+				}
+			}
+		}
+	}
+
+	pixpllc->m = m;
+	pixpllc->n = n;
+	pixpllc->p = p;
+	pixpllc->s = s;
+
+	return 0;
+}
+
+static int mgag200_compute_pixpll_values(struct mga_device *mdev, long clock,
+					 struct mgag200_pll_values *pixpll)
+{
+	int ret;
+
+	switch (mdev->type) {
+	case G200_PCI:
+	case G200_AGP:
+		ret = mgag200_compute_pixpll_values_g200(mdev, clock, pixpll);
+		break;
+	case G200_SE_A:
+	case G200_SE_B:
+		ret = mgag200_compute_pixpll_values_g200se(mdev, clock, pixpll);
+		break;
+	case G200_WB:
+		ret = mgag200_compute_pixpll_values_g200wb(mdev, clock, pixpll);
+		break;
+	case G200_EV:
+		ret = mgag200_compute_pixpll_values_g200ev(mdev, clock, pixpll);
+		break;
+	case G200_EH:
+		ret = mgag200_compute_pixpll_values_g200eh(mdev, clock, pixpll);
+		break;
+	case G200_EH3:
+		ret = mgag200_compute_pixpll_values_g200eh3(mdev, clock, pixpll);
+		break;
+	case G200_ER:
+		ret = mgag200_compute_pixpll_values_g200er(mdev, clock, pixpll);
+		break;
+	case G200_EW3:
+		ret = mgag200_compute_pixpll_values_g200ew3(mdev, clock, pixpll);
+		break;
+	}
+
+	return ret;
+}
+
+static void mgag200_set_pixpll_g200(struct mga_device *mdev,
+				    const struct mgag200_pll_values *pixpllc)
+{
+	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
+	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp;
+
+	misc = RREG8(MGA_MISC_IN);
+	misc &= ~MGAREG_MISC_CLK_SEL_MASK;
+	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
+	WREG8(MGA_MISC_OUT, misc);
+
+	pixpllcm = pixpllc->m - 1;
+	pixpllcn = pixpllc->n - 1;
+	pixpllcp = pixpllc->p - 1;
+	pixpllcs = pixpllc->s;
+
+	xpixpllcm = pixpllcm;
+	xpixpllcn = pixpllcn;
+	xpixpllcp = (pixpllcs << 3) | pixpllcp;
+	WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
+	WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
+	WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
+}
+
+static void mgag200_set_pixpll_g200se(struct mga_device *mdev,
+				      const struct mgag200_pll_values *pixpllc)
+{
+	u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
+	unsigned int pixpllcm, pixpllcn, pixpllcp, pixpllcs;
+	u8 misc, xpixpllcm, xpixpllcn, xpixpllcp;
+
+	misc = RREG8(MGA_MISC_IN);
+	misc &= ~MGAREG_MISC_CLK_SEL_MASK;
+	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
+	WREG8(MGA_MISC_OUT, misc);
+
+	pixpllcm = pixpllc->m - 1;
+	pixpllcn = pixpllc->n - 1;
+	pixpllcp = pixpllc->p - 1;
+	pixpllcs = pixpllc->s;
+
+	xpixpllcm = pixpllcm | ((pixpllcn & BIT(8)) >> 1);
+	xpixpllcn = pixpllcn;
+	xpixpllcp = (pixpllcs << 3) | pixpllcp;
+	WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
+	WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
+	WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
+
+	if (unique_rev_id >= 0x04) {
+		WREG_DAC(0x1a, 0x09);
+		msleep(20);
+		WREG_DAC(0x1a, 0x01);
+	}
+}
+
 static void mgag200_set_pixpll_g200wb(struct mga_device *mdev,
 				      const struct mgag200_pll_values *pixpllc)
 {
@@ -500,68 +787,20 @@ static void mgag200_set_pixpll_g200wb(struct mga_device *mdev,
 		vcount = RREG8(MGAREG_VCOUNT);
 
 		for (j = 0; j < 30 && pll_locked == false; j++) {
-			tmpcount = RREG8(MGAREG_VCOUNT);
-			if (tmpcount < vcount)
-				vcount = 0;
-			if ((tmpcount - vcount) > 2)
-				pll_locked = true;
-			else
-				udelay(5);
-		}
-	}
-
-	WREG8(DAC_INDEX, MGA1064_REMHEADCTL);
-	tmp = RREG8(DAC_DATA);
-	tmp &= ~MGA1064_REMHEADCTL_CLKDIS;
-	WREG_DAC(MGA1064_REMHEADCTL, tmp);
-}
-
-static int mgag200_compute_pixpll_values_g200ev(struct mga_device *mdev, long clock,
-						struct mgag200_pll_values *pixpllc)
-{
-	unsigned int vcomax, vcomin, pllreffreq;
-	unsigned int delta, tmpdelta;
-	unsigned int testp, testm, testn;
-	unsigned int p, m, n, s;
-	unsigned int computed;
-
-	m = n = p = s = 0;
-	vcomax = 550000;
-	vcomin = 150000;
-	pllreffreq = 50000;
-
-	delta = 0xffffffff;
-
-	for (testp = 16; testp > 0; testp--) {
-		if (clock * testp > vcomax)
-			continue;
-		if (clock * testp < vcomin)
-			continue;
-
-		for (testn = 1; testn < 257; testn++) {
-			for (testm = 1; testm < 17; testm++) {
-				computed = (pllreffreq * testn) /
-					(testm * testp);
-				if (computed > clock)
-					tmpdelta = computed - clock;
-				else
-					tmpdelta = clock - computed;
-				if (tmpdelta < delta) {
-					delta = tmpdelta;
-					n = testn;
-					m = testm;
-					p = testp;
-				}
-			}
+			tmpcount = RREG8(MGAREG_VCOUNT);
+			if (tmpcount < vcount)
+				vcount = 0;
+			if ((tmpcount - vcount) > 2)
+				pll_locked = true;
+			else
+				udelay(5);
 		}
 	}
 
-	pixpllc->m = m;
-	pixpllc->n = n;
-	pixpllc->p = p;
-	pixpllc->s = s;
-
-	return 0;
+	WREG8(DAC_INDEX, MGA1064_REMHEADCTL);
+	tmp = RREG8(DAC_DATA);
+	tmp &= ~MGA1064_REMHEADCTL_CLKDIS;
+	WREG_DAC(MGA1064_REMHEADCTL, tmp);
 }
 
 static void mgag200_set_pixpll_g200ev(struct mga_device *mdev,
@@ -635,54 +874,6 @@ static void mgag200_set_pixpll_g200ev(struct mga_device *mdev,
 	WREG8(DAC_DATA, tmp);
 }
 
-static int mgag200_compute_pixpll_values_g200eh(struct mga_device *mdev, long clock,
-						struct mgag200_pll_values *pixpllc)
-{
-	unsigned int vcomax, vcomin, pllreffreq;
-	unsigned int delta, tmpdelta;
-	unsigned int testp, testm, testn;
-	unsigned int p, m, n, s;
-	unsigned int computed;
-
-	m = n = p = s = 0;
-
-	vcomax = 800000;
-	vcomin = 400000;
-	pllreffreq = 33333;
-
-	delta = 0xffffffff;
-
-	for (testp = 16; testp > 0; testp >>= 1) {
-		if (clock * testp > vcomax)
-			continue;
-		if (clock * testp < vcomin)
-			continue;
-
-		for (testm = 1; testm < 33; testm++) {
-			for (testn = 17; testn < 257; testn++) {
-				computed = (pllreffreq * testn) / (testm * testp);
-				if (computed > clock)
-					tmpdelta = computed - clock;
-				else
-					tmpdelta = clock - computed;
-				if (tmpdelta < delta) {
-					delta = tmpdelta;
-					n = testn;
-					m = testm;
-					p = testp;
-				}
-			}
-		}
-	}
-
-	pixpllc->m = m;
-	pixpllc->n = n;
-	pixpllc->p = p;
-	pixpllc->s = s;
-
-	return 0;
-}
-
 static void mgag200_set_pixpll_g200eh(struct mga_device *mdev,
 				      const struct mgag200_pll_values *pixpllc)
 {
@@ -754,115 +945,6 @@ static void mgag200_set_pixpll_g200eh(struct mga_device *mdev,
 	}
 }
 
-static int mgag200_compute_pixpll_values_g200eh3(struct mga_device *mdev, long clock,
-						 struct mgag200_pll_values *pixpllc)
-{
-	unsigned int vcomax, vcomin, pllreffreq;
-	unsigned int delta, tmpdelta;
-	unsigned int testp, testm, testn;
-	unsigned int p, m, n, s;
-	unsigned int computed;
-
-	m = n = p = s = 0;
-
-	vcomax = 3000000;
-	vcomin = 1500000;
-	pllreffreq = 25000;
-
-	delta = 0xffffffff;
-
-	testp = 0;
-
-	for (testm = 150; testm >= 6; testm--) {
-		if (clock * testm > vcomax)
-			continue;
-		if (clock * testm < vcomin)
-			continue;
-		for (testn = 120; testn >= 60; testn--) {
-			computed = (pllreffreq * testn) / testm;
-			if (computed > clock)
-				tmpdelta = computed - clock;
-			else
-				tmpdelta = clock - computed;
-			if (tmpdelta < delta) {
-				delta = tmpdelta;
-				n = testn + 1;
-				m = testm + 1;
-				p = testp + 1;
-			}
-			if (delta == 0)
-				break;
-		}
-		if (delta == 0)
-			break;
-	}
-
-	pixpllc->m = m;
-	pixpllc->n = n;
-	pixpllc->p = p;
-	pixpllc->s = s;
-
-	return 0;
-}
-
-static int mgag200_compute_pixpll_values_g200er(struct mga_device *mdev, long clock,
-						struct mgag200_pll_values *pixpllc)
-{
-	static const unsigned int m_div_val[] = { 1, 2, 4, 8 };
-	unsigned int vcomax, vcomin, pllreffreq;
-	unsigned int delta, tmpdelta;
-	int testr, testn, testm, testo;
-	unsigned int p, m, n, s;
-	unsigned int computed, vco;
-
-	m = n = p = s = 0;
-	vcomax = 1488000;
-	vcomin = 1056000;
-	pllreffreq = 48000;
-
-	delta = 0xffffffff;
-
-	for (testr = 0; testr < 4; testr++) {
-		if (delta == 0)
-			break;
-		for (testn = 5; testn < 129; testn++) {
-			if (delta == 0)
-				break;
-			for (testm = 3; testm >= 0; testm--) {
-				if (delta == 0)
-					break;
-				for (testo = 5; testo < 33; testo++) {
-					vco = pllreffreq * (testn + 1) /
-						(testr + 1);
-					if (vco < vcomin)
-						continue;
-					if (vco > vcomax)
-						continue;
-					computed = vco / (m_div_val[testm] * (testo + 1));
-					if (computed > clock)
-						tmpdelta = computed - clock;
-					else
-						tmpdelta = clock - computed;
-					if (tmpdelta < delta) {
-						delta = tmpdelta;
-						m = (testm | (testo << 3)) + 1;
-						n = testn + 1;
-						p = testr + 1;
-						s = testr;
-					}
-				}
-			}
-		}
-	}
-
-	pixpllc->m = m;
-	pixpllc->n = n;
-	pixpllc->p = p;
-	pixpllc->s = s;
-
-	return 0;
-}
-
 static void mgag200_set_pixpll_g200er(struct mga_device *mdev,
 				      const struct mgag200_pll_values *pixpllc)
 {
@@ -912,121 +994,38 @@ static void mgag200_set_pixpll_g200er(struct mga_device *mdev,
 	udelay(50);
 }
 
-static int mgag200_compute_pixpll_values_g200ew3(struct mga_device *mdev, long clock,
-						 struct mgag200_pll_values *pixpllc)
-{
-	unsigned int vcomax, vcomin, pllreffreq;
-	unsigned int delta, tmpdelta;
-	unsigned int testp, testm, testn, testp2;
-	unsigned int p, m, n, s;
-	unsigned int computed;
-
-	m = n = p = s = 0;
-
-	delta = 0xffffffff;
-
-	vcomax = 800000;
-	vcomin = 400000;
-	pllreffreq = 25000;
-
-	for (testp = 1; testp < 8; testp++) {
-		for (testp2 = 1; testp2 < 8; testp2++) {
-			if (testp < testp2)
-				continue;
-			if ((clock * testp * testp2) > vcomax)
-				continue;
-			if ((clock * testp * testp2) < vcomin)
-				continue;
-			for (testm = 1; testm < 26; testm++) {
-				for (testn = 32; testn < 2048 ; testn++) {
-					computed = (pllreffreq * testn) / (testm * testp * testp2);
-					if (computed > clock)
-						tmpdelta = computed - clock;
-					else
-						tmpdelta = clock - computed;
-					if (tmpdelta < delta) {
-						delta = tmpdelta;
-						m = testm + 1;
-						n = testn + 1;
-						p = testp + 1;
-						s = testp2;
-					}
-				}
-			}
-		}
-	}
-
-	pixpllc->m = m;
-	pixpllc->n = n;
-	pixpllc->p = p;
-	pixpllc->s = s;
-
-	return 0;
-}
-
-static void mgag200_crtc_set_plls(struct mga_device *mdev, long clock)
+static void mgag200_set_pixpll(struct mga_device *mdev, const struct mgag200_pll_values *pixpll)
 {
-	struct mgag200_pll_values pixpll;
-	int ret;
-
-	switch(mdev->type) {
-	case G200_PCI:
-	case G200_AGP:
-		ret = mgag200_compute_pixpll_values_g200(mdev, clock, &pixpll);
-		break;
-	case G200_SE_A:
-	case G200_SE_B:
-		ret = mgag200_compute_pixpll_values_g200se(mdev, clock, &pixpll);
-		break;
-	case G200_WB:
-		ret = mgag200_compute_pixpll_values_g200wb(mdev, clock, &pixpll);
-		break;
-	case G200_EV:
-		ret = mgag200_compute_pixpll_values_g200ev(mdev, clock, &pixpll);
-		break;
-	case G200_EH:
-		ret = mgag200_compute_pixpll_values_g200eh(mdev, clock, &pixpll);
-		break;
-	case G200_EH3:
-		ret = mgag200_compute_pixpll_values_g200eh3(mdev, clock, &pixpll);
-		break;
-	case G200_ER:
-		ret = mgag200_compute_pixpll_values_g200er(mdev, clock, &pixpll);
-		break;
-	case G200_EW3:
-		ret = mgag200_compute_pixpll_values_g200ew3(mdev, clock, &pixpll);
-		break;
-	}
-
-	if (ret)
-		return;
-
 	switch (mdev->type) {
 	case G200_PCI:
 	case G200_AGP:
-		mgag200_set_pixpll_g200(mdev, &pixpll);
+		mgag200_set_pixpll_g200(mdev, pixpll);
 		break;
 	case G200_SE_A:
 	case G200_SE_B:
-		mgag200_set_pixpll_g200se(mdev, &pixpll);
+		mgag200_set_pixpll_g200se(mdev, pixpll);
 		break;
 	case G200_WB:
 	case G200_EW3:
-		mgag200_set_pixpll_g200wb(mdev, &pixpll);
+		mgag200_set_pixpll_g200wb(mdev, pixpll);
 		break;
 	case G200_EV:
-		mgag200_set_pixpll_g200ev(mdev, &pixpll);
+		mgag200_set_pixpll_g200ev(mdev, pixpll);
 		break;
 	case G200_EH:
 	case G200_EH3:
-		mgag200_set_pixpll_g200eh(mdev, &pixpll);
+		mgag200_set_pixpll_g200eh(mdev, pixpll);
 		break;
 	case G200_ER:
-		mgag200_set_pixpll_g200er(mdev, &pixpll);
+		mgag200_set_pixpll_g200er(mdev, pixpll);
 		break;
 	}
 }
 
+/*
+ * Modesetting helpers
+ */
+
 static void mgag200_g200wb_hold_bmc(struct mga_device *mdev)
 {
 	u8 tmp;
@@ -1790,13 +1789,15 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 		.y1 = 0,
 		.y2 = fb->height,
 	};
+	struct mgag200_pll_values pixpll;
 
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
 		mgag200_g200wb_hold_bmc(mdev);
 
 	mgag200_set_format_regs(mdev, fb);
 	mgag200_set_mode_regs(mdev, adjusted_mode);
-	mgag200_crtc_set_plls(mdev, adjusted_mode->clock);
+	mgag200_compute_pixpll_values(mdev, adjusted_mode->clock, &pixpll);
+	mgag200_set_pixpll(mdev, &pixpll);
 
 	if (mdev->type == G200_ER)
 		mgag200_g200er_reset_tagfifo(mdev);
-- 
2.32.0

