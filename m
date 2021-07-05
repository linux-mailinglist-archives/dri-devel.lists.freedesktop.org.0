Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DDA3BBD09
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 14:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460DB89CA8;
	Mon,  5 Jul 2021 12:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F212E89AEB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:45:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 99B361FE7A;
 Mon,  5 Jul 2021 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625489118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TNAHYgx75/tOJLkwH6HyB6kaxI1+t61+42sdhKGwyVo=;
 b=pxdW4RcN38hVt8GPqEXrBp7JprsiLVz6bynn6FwtO3oq2kNqlYmkRc3Vkxkh50CD76IhWV
 +t2+hz6VPsqHdxnMOS8gPgrMDgxWcGfGQhqSiLch1FANR0jV2x/NzmjkdbM2ZNT2/m9oDg
 kk5oQ0yBlnNJbhpCX7l0pqCJBTH7Ym0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625489118;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TNAHYgx75/tOJLkwH6HyB6kaxI1+t61+42sdhKGwyVo=;
 b=Pt3UUQtsZrBfBwM3qBlv2Rq/V1mbvKJr8Mz5vHw2fq48Jq2WYy4wH7oeXEkSjP2St4oZ+b
 E0ulbHxaKNQtFCDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60E3513A7E;
 Mon,  5 Jul 2021 12:45:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EF/AFt7+4mDkcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 12:45:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 emil.velikov@collabora.com, John.p.donnelly@oracle.com
Subject: [PATCH 07/12] drm/mgag200: Split several PLL functions by device type
Date: Mon,  5 Jul 2021 14:45:10 +0200
Message-Id: <20210705124515.27253-8-tzimmermann@suse.de>
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

Several PLL functions compute values for different device types. Split
them up to make the code more readable. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 256 ++++++++++++++-----------
 1 file changed, 146 insertions(+), 110 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 7d6707bd6c27..d3b15e60f057 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -353,7 +353,7 @@ static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long cl
 {
 	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta;
-	unsigned int testp, testm, testn, testp2;
+	unsigned int testp, testm, testn;
 	unsigned int p, m, n, s;
 	unsigned int computed;
 
@@ -361,64 +361,29 @@ static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long cl
 
 	delta = 0xffffffff;
 
-	if (mdev->type == G200_EW3) {
-		vcomax = 800000;
-		vcomin = 400000;
-		pllreffreq = 25000;
-
-		for (testp = 1; testp < 8; testp++) {
-			for (testp2 = 1; testp2 < 8; testp2++) {
-				if (testp < testp2)
-					continue;
-				if ((clock * testp * testp2) > vcomax)
-					continue;
-				if ((clock * testp * testp2) < vcomin)
-					continue;
-				for (testm = 1; testm < 26; testm++) {
-					for (testn = 32; testn < 2048 ; testn++) {
-						computed = (pllreffreq * testn) /
-							(testm * testp * testp2);
-						if (computed > clock)
-							tmpdelta = computed - clock;
-						else
-							tmpdelta = clock - computed;
-						if (tmpdelta < delta) {
-							delta = tmpdelta;
-							m = testm + 1;
-							n = testn + 1;
-							p = testp + 1;
-							s = testp2;
-						}
-					}
-				}
-			}
-		}
-	} else {
-		vcomax = 550000;
-		vcomin = 150000;
-		pllreffreq = 48000;
+	vcomax = 550000;
+	vcomin = 150000;
+	pllreffreq = 48000;
 
-		for (testp = 1; testp < 9; testp++) {
-			if (clock * testp > vcomax)
-				continue;
-			if (clock * testp < vcomin)
-				continue;
+	for (testp = 1; testp < 9; testp++) {
+		if (clock * testp > vcomax)
+			continue;
+		if (clock * testp < vcomin)
+			continue;
 
-			for (testm = 1; testm < 17; testm++) {
-				for (testn = 1; testn < 151; testn++) {
-					computed = (pllreffreq * testn) /
-						(testm * testp);
-					if (computed > clock)
-						tmpdelta = computed - clock;
-					else
-						tmpdelta = clock - computed;
-					if (tmpdelta < delta) {
-						delta = tmpdelta;
-						n = testn;
-						m = testm;
-						p = testp;
-						s = 0;
-					}
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
 				}
 			}
 		}
@@ -681,66 +646,30 @@ static int mgag200_compute_pixpll_values_g200eh(struct mga_device *mdev, long cl
 
 	m = n = p = s = 0;
 
-	if (mdev->type == G200_EH3) {
-		vcomax = 3000000;
-		vcomin = 1500000;
-		pllreffreq = 25000;
+	vcomax = 800000;
+	vcomin = 400000;
+	pllreffreq = 33333;
 
-		delta = 0xffffffff;
+	delta = 0xffffffff;
 
-		testp = 0;
+	for (testp = 16; testp > 0; testp >>= 1) {
+		if (clock * testp > vcomax)
+			continue;
+		if (clock * testp < vcomin)
+			continue;
 
-		for (testm = 150; testm >= 6; testm--) {
-			if (clock * testm > vcomax)
-				continue;
-			if (clock * testm < vcomin)
-				continue;
-			for (testn = 120; testn >= 60; testn--) {
-				computed = (pllreffreq * testn) / testm;
+		for (testm = 1; testm < 33; testm++) {
+			for (testn = 17; testn < 257; testn++) {
+				computed = (pllreffreq * testn) / (testm * testp);
 				if (computed > clock)
 					tmpdelta = computed - clock;
 				else
 					tmpdelta = clock - computed;
 				if (tmpdelta < delta) {
 					delta = tmpdelta;
-					n = testn + 1;
-					m = testm + 1;
-					p = testp + 1;
-				}
-				if (delta == 0)
-					break;
-			}
-			if (delta == 0)
-				break;
-		}
-	} else {
-
-		vcomax = 800000;
-		vcomin = 400000;
-		pllreffreq = 33333;
-
-		delta = 0xffffffff;
-
-		for (testp = 16; testp > 0; testp >>= 1) {
-			if (clock * testp > vcomax)
-				continue;
-			if (clock * testp < vcomin)
-				continue;
-
-			for (testm = 1; testm < 33; testm++) {
-				for (testn = 17; testn < 257; testn++) {
-					computed = (pllreffreq * testn) /
-						(testm * testp);
-					if (computed > clock)
-						tmpdelta = computed - clock;
-					else
-						tmpdelta = clock - computed;
-					if (tmpdelta < delta) {
-						delta = tmpdelta;
-						n = testn;
-						m = testm;
-						p = testp;
-					}
+					n = testn;
+					m = testm;
+					p = testp;
 				}
 			}
 		}
@@ -825,6 +754,57 @@ static void mgag200_set_pixpll_g200eh(struct mga_device *mdev,
 	}
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
+
+	vcomax = 3000000;
+	vcomin = 1500000;
+	pllreffreq = 25000;
+
+	delta = 0xffffffff;
+
+	testp = 0;
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
 static int mgag200_compute_pixpll_values_g200er(struct mga_device *mdev, long clock,
 						struct mgag200_pll_values *pixpllc)
 {
@@ -932,6 +912,58 @@ static void mgag200_set_pixpll_g200er(struct mga_device *mdev,
 	udelay(50);
 }
 
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
+
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
 static void mgag200_crtc_set_plls(struct mga_device *mdev, long clock)
 {
 	struct mgag200_pll_values pixpll;
@@ -947,19 +979,23 @@ static void mgag200_crtc_set_plls(struct mga_device *mdev, long clock)
 		ret = mgag200_compute_pixpll_values_g200se(mdev, clock, &pixpll);
 		break;
 	case G200_WB:
-	case G200_EW3:
 		ret = mgag200_compute_pixpll_values_g200wb(mdev, clock, &pixpll);
 		break;
 	case G200_EV:
 		ret = mgag200_compute_pixpll_values_g200ev(mdev, clock, &pixpll);
 		break;
 	case G200_EH:
-	case G200_EH3:
 		ret = mgag200_compute_pixpll_values_g200eh(mdev, clock, &pixpll);
 		break;
+	case G200_EH3:
+		ret = mgag200_compute_pixpll_values_g200eh3(mdev, clock, &pixpll);
+		break;
 	case G200_ER:
 		ret = mgag200_compute_pixpll_values_g200er(mdev, clock, &pixpll);
 		break;
+	case G200_EW3:
+		ret = mgag200_compute_pixpll_values_g200ew3(mdev, clock, &pixpll);
+		break;
 	}
 
 	if (ret)
-- 
2.32.0

