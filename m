Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B023BBD04
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 14:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976E789AEB;
	Mon,  5 Jul 2021 12:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFF689AEB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:45:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1CA4322653;
 Mon,  5 Jul 2021 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625489119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30hZAUkqX52sSfIQrqN5UgoP7+uc3V/uLjvUGl/qzDc=;
 b=Ee5UbmMhxYt+hFipUPT7sXPAf0RZW8szlgGusQAYpZk8CxUoDxpP3jj4bMwO1Kd0mFLTon
 owqs5K/W0spv+0/o92NTIBICsMj4C/WfLuQmDI8ruLsjJoxvAnNVBBKyeYv6yI7Do9Pc/C
 K6hwzBhFqgr+ffm8eV62PYD0msQJdS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625489119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30hZAUkqX52sSfIQrqN5UgoP7+uc3V/uLjvUGl/qzDc=;
 b=kIwl//0QS5T3y1OIC6HuOjM14bcawITExQgQQB2ArHBZBNzwJji8HwblB8v4eXs4bZ93v5
 Q32Z3JbVt/qy/GAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB2A013A7E;
 Mon,  5 Jul 2021 12:45:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IPJ3NN7+4mDkcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 12:45:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 emil.velikov@collabora.com, John.p.donnelly@oracle.com
Subject: [PATCH 09/12] drm/mgag200: Split PLL computation for G200SE
Date: Mon,  5 Jul 2021 14:45:12 +0200
Message-Id: <20210705124515.27253-10-tzimmermann@suse.de>
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

The compute function for G200SE pixle PLLs handles two revisions with
different algorithms. Split it accordingly to make it readable.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 165 +++++++++++++++----------
 1 file changed, 97 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 72fdf242cac7..99b35e4f9353 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -184,100 +184,118 @@ static int mgag200_compute_pixpll_values_g200(struct mga_device *mdev, long cloc
 	return 0;
 }
 
-static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long clock,
-						struct mgag200_pll_values *pixpllc)
+static int mgag200_compute_pixpll_values_g200se_00(struct mga_device *mdev, long clock,
+						   struct mgag200_pll_values *pixpllc)
 {
-	static const unsigned int pvalues_e4[] = {16, 14, 12, 10, 8, 6, 4, 2, 1};
-
-	u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
 	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta, permitteddelta;
 	unsigned int testp, testm, testn;
 	unsigned int p, m, n, s;
 	unsigned int computed;
-	unsigned int fvv;
-	unsigned int i;
 
 	m = n = p = s = 0;
 	delta = 0xffffffff;
 
-	if (unique_rev_id <= 0x03) {
-		vcomax = 320000;
-		vcomin = 160000;
-		pllreffreq = 25000;
-		permitteddelta = clock * 5 / 1000;
+	vcomax = 320000;
+	vcomin = 160000;
+	pllreffreq = 25000;
+	permitteddelta = clock * 5 / 1000;
 
-		for (testp = 8; testp > 0; testp /= 2) {
-			if (clock * testp > vcomax)
-				continue;
-			if (clock * testp < vcomin)
-				continue;
+	for (testp = 8; testp > 0; testp /= 2) {
+		if (clock * testp > vcomax)
+			continue;
+		if (clock * testp < vcomin)
+			continue;
 
-			for (testn = 17; testn < 256; testn++) {
-				for (testm = 1; testm < 32; testm++) {
-					computed = (pllreffreq * testn) /
-						(testm * testp);
-					if (computed > clock)
-						tmpdelta = computed - clock;
-					else
-						tmpdelta = clock - computed;
-					if (tmpdelta < delta) {
-						delta = tmpdelta;
-						m = testm;
-						n = testn;
-						p = testp;
-					}
+		for (testn = 17; testn < 256; testn++) {
+			for (testm = 1; testm < 32; testm++) {
+				computed = (pllreffreq * testn) / (testm * testp);
+				if (computed > clock)
+					tmpdelta = computed - clock;
+				else
+					tmpdelta = clock - computed;
+				if (tmpdelta < delta) {
+					delta = tmpdelta;
+					m = testm;
+					n = testn;
+					p = testp;
 				}
 			}
 		}
-	} else {
-		vcomax        = 1600000;
-		vcomin        = 800000;
-		pllreffreq    = 25000;
+	}
 
-		if (clock < 25000)
-			clock = 25000;
-		clock = clock * 2;
+	if (delta > permitteddelta) {
+		pr_warn("PLL delta too large\n");
+		return -EINVAL;
+	}
 
-		/* Permited delta is 0.5% as VESA Specification */
-		permitteddelta = clock * 5 / 1000;
+	pixpllc->m = m;
+	pixpllc->n = n;
+	pixpllc->p = p;
+	pixpllc->s = s;
 
-		for (i = 0 ; i < ARRAY_SIZE(pvalues_e4); i++) {
-			testp = pvalues_e4[i];
+	return 0;
+}
 
-			if ((clock * testp) > vcomax)
-				continue;
-			if ((clock * testp) < vcomin)
-				continue;
+static int mgag200_compute_pixpll_values_g200se_04(struct mga_device *mdev, long clock,
+						   struct mgag200_pll_values *pixpllc)
+{
+	static const unsigned int pvalues_e4[] = {16, 14, 12, 10, 8, 6, 4, 2, 1};
 
-			for (testn = 50; testn <= 256; testn++) {
-				for (testm = 1; testm <= 32; testm++) {
-					computed = (pllreffreq * testn) /
-						(testm * testp);
-					if (computed > clock)
-						tmpdelta = computed - clock;
-					else
-						tmpdelta = clock - computed;
+	unsigned int vcomax, vcomin, pllreffreq;
+	unsigned int delta, tmpdelta, permitteddelta;
+	unsigned int testp, testm, testn;
+	unsigned int p, m, n, s;
+	unsigned int computed;
+	unsigned int fvv;
+	unsigned int i;
 
-					if (tmpdelta < delta) {
-						delta = tmpdelta;
-						m = testm;
-						n = testn;
-						p = testp;
-					}
+	m = n = p = s = 0;
+	delta = 0xffffffff;
+
+	vcomax        = 1600000;
+	vcomin        = 800000;
+	pllreffreq    = 25000;
+
+	if (clock < 25000)
+		clock = 25000;
+	clock = clock * 2;
+
+	/* Permited delta is 0.5% as VESA Specification */
+	permitteddelta = clock * 5 / 1000;
+
+	for (i = 0 ; i < ARRAY_SIZE(pvalues_e4); i++) {
+		testp = pvalues_e4[i];
+
+		if ((clock * testp) > vcomax)
+			continue;
+		if ((clock * testp) < vcomin)
+			continue;
+
+		for (testn = 50; testn <= 256; testn++) {
+			for (testm = 1; testm <= 32; testm++) {
+				computed = (pllreffreq * testn) / (testm * testp);
+				if (computed > clock)
+					tmpdelta = computed - clock;
+				else
+					tmpdelta = clock - computed;
+
+				if (tmpdelta < delta) {
+					delta = tmpdelta;
+					m = testm;
+					n = testn;
+					p = testp;
 				}
 			}
 		}
-
-		fvv = pllreffreq * n / m;
-		fvv = (fvv - 800000) / 50000;
-		if (fvv > 15)
-			fvv = 15;
-		s = fvv << 1;
-
-		clock = clock / 2;
 	}
 
+	fvv = pllreffreq * n / m;
+	fvv = (fvv - 800000) / 50000;
+	if (fvv > 15)
+		fvv = 15;
+	s = fvv << 1;
+
 	if (delta > permitteddelta) {
 		pr_warn("PLL delta too large\n");
 		return -EINVAL;
@@ -291,6 +309,17 @@ static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long cl
 	return 0;
 }
 
+static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long clock,
+						struct mgag200_pll_values *pixpllc)
+{
+	u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
+
+	if (unique_rev_id >= 0x04)
+		return mgag200_compute_pixpll_values_g200se_04(mdev, clock, pixpllc);
+	else
+		return mgag200_compute_pixpll_values_g200se_00(mdev, clock, pixpllc);
+}
+
 static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long clock,
 						struct mgag200_pll_values *pixpllc)
 {
-- 
2.32.0

