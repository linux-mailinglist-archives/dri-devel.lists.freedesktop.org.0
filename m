Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF723BBD02
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 14:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DBF89915;
	Mon,  5 Jul 2021 12:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773C189870
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:45:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 20CCC1FE77;
 Mon,  5 Jul 2021 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625489118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GgeH0ker2mz5aHVuiO05W4ONcqiYVtDEHpU9egOWotw=;
 b=SNNXJxsPi+GeVBrhAb8/H+xSjmq6NljGxYj2tjQjb7bkYJ0KoOk1HWr8WwrQS5CeCATttG
 mOgjLzW44iY0Zdqk957fRlmhtmsX6ElmivtLu0NngRnO8DxnMO9vLG2QIDimN4rA3JYQ73
 9Ibr8D+7eqSjuj5VyxSypbEBL37pUbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625489118;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GgeH0ker2mz5aHVuiO05W4ONcqiYVtDEHpU9egOWotw=;
 b=d3bQ7YAlF0qjSBsMBK8GmptRUISZqqBPTTWCghXZFcJ00eQDbqAXMs3HZDWhyeeISIy2/o
 5ap2w6q1jB3oOqCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E230613A7E;
 Mon,  5 Jul 2021 12:45:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uM88Nt3+4mDkcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 12:45:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 emil.velikov@collabora.com, John.p.donnelly@oracle.com
Subject: [PATCH 05/12] drm/mgag200: Introduce separate variable for PLL S
 parameter
Date: Mon,  5 Jul 2021 14:45:08 +0200
Message-Id: <20210705124515.27253-6-tzimmermann@suse.de>
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

The S parameter is controls the loop filter bandwidth when programming
the PLL. It's currently stored as part of P (i.e., the clock divider.)
Add a separate variable for S prepares the PLL code for a further
refactoring.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 36 ++++++++++++--------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 961bd128fea3..9f6fe7673674 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -210,18 +210,17 @@ static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long cl
 	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta, permitteddelta;
 	unsigned int testp, testm, testn;
-	unsigned int p, m, n;
+	unsigned int p, m, n, s;
 	unsigned int computed;
 	unsigned int fvv;
 	unsigned int i;
 
-	if (unique_rev_id <= 0x03) {
+	m = n = p = s = 0;
 
-		m = n = p = 0;
+	if (unique_rev_id <= 0x03) {
 		vcomax = 320000;
 		vcomin = 160000;
 		pllreffreq = 25000;
-
 		delta = 0xffffffff;
 		permitteddelta = clock * 5 / 1000;
 
@@ -249,9 +248,6 @@ static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long cl
 			}
 		}
 	} else {
-
-
-		m = n = p = 0;
 		vcomax        = 1600000;
 		vcomin        = 800000;
 		pllreffreq    = 25000;
@@ -312,7 +308,7 @@ static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long cl
 	pixpllc->m = m;
 	pixpllc->n = n;
 	pixpllc->p = p;
-	pixpllc->s = 0;
+	pixpllc->s = s;
 
 	return 0;
 }
@@ -348,10 +344,10 @@ static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long cl
 	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta;
 	unsigned int testp, testm, testn, testp2;
-	unsigned int p, m, n;
+	unsigned int p, m, n, s;
 	unsigned int computed;
 
-	m = n = p = 0;
+	m = n = p = s = 0;
 
 	delta = 0xffffffff;
 
@@ -425,7 +421,7 @@ static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long cl
 	pixpllc->m = m;
 	pixpllc->n = n;
 	pixpllc->p = p;
-	pixpllc->s = 0;
+	pixpllc->s = s;
 
 	return 0;
 }
@@ -549,10 +545,10 @@ static int mgag200_compute_pixpll_values_g200ev(struct mga_device *mdev, long cl
 	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta;
 	unsigned int testp, testm, testn;
-	unsigned int p, m, n;
+	unsigned int p, m, n, s;
 	unsigned int computed;
 
-	m = n = p = 0;
+	m = n = p = s = 0;
 	vcomax = 550000;
 	vcomin = 150000;
 	pllreffreq = 50000;
@@ -586,7 +582,7 @@ static int mgag200_compute_pixpll_values_g200ev(struct mga_device *mdev, long cl
 	pixpllc->m = m;
 	pixpllc->n = n;
 	pixpllc->p = p;
-	pixpllc->s = 0;
+	pixpllc->s = s;
 
 	return 0;
 }
@@ -662,10 +658,10 @@ static int mgag200_compute_pixpll_values_g200eh(struct mga_device *mdev, long cl
 	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta;
 	unsigned int testp, testm, testn;
-	unsigned int p, m, n;
+	unsigned int p, m, n, s;
 	unsigned int computed;
 
-	m = n = p = 0;
+	m = n = p = s = 0;
 
 	if (mdev->type == G200_EH3) {
 		vcomax = 3000000;
@@ -737,7 +733,7 @@ static int mgag200_compute_pixpll_values_g200eh(struct mga_device *mdev, long cl
 	pixpllc->m = m;
 	pixpllc->n = n;
 	pixpllc->p = p;
-	pixpllc->s = 0;
+	pixpllc->s = s;
 
 	return 0;
 }
@@ -814,10 +810,10 @@ static int mgag200_compute_pixpll_values_g200er(struct mga_device *mdev, long cl
 	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta;
 	int testr, testn, testm, testo;
-	unsigned int p, m, n;
+	unsigned int p, m, n, s;
 	unsigned int computed, vco;
 
-	m = n = p = 0;
+	m = n = p = s = 0;
 	vcomax = 1488000;
 	vcomin = 1056000;
 	pllreffreq = 48000;
@@ -859,7 +855,7 @@ static int mgag200_compute_pixpll_values_g200er(struct mga_device *mdev, long cl
 	pixpllc->m = m;
 	pixpllc->n = n;
 	pixpllc->p = p;
-	pixpllc->s = 0;
+	pixpllc->s = s;
 
 	return 0;
 }
-- 
2.32.0

