Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOREIckge2lPBgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:56:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A95BADD86
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C11210E825;
	Thu, 29 Jan 2026 08:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=orange.fr header.i=@orange.fr header.b="i1/0Za00";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 543 seconds by postgrey-1.36 at gabe;
 Wed, 28 Jan 2026 21:36:35 UTC
Received: from smtp.smtpout.orange.fr (smtp-81.smtpout.orange.fr
 [80.12.242.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8B310E2E9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 21:36:35 +0000 (UTC)
Received: from cyber-villager.home
 ([IPv6:2a01:cb1c:8326:c500:bfc0:b7c5:d0ed:4f38])
 by smtp.orange.fr with ESMTPA
 id lD4SvI2AvEcXwlD4Svk1IB; Wed, 28 Jan 2026 22:27:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
 s=t20230301; t=1769635650;
 bh=esahnId/W+bwrnYCC8NREjRi6iSOW0UNlTcA4g2FuLk=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=i1/0Za00yQcwQ8kzuBpu4B/eky+iIvduq/rDDVCPbGdwU2k28XmQCxFNTNb0B3cB8
 k3q9yP+BSsqC926s3ILm9A7eFiERVma+qC8SKnz6XZoN1z2F/pYYRABFE5SFCbQbie
 a0J2Zitmd2KrUKrDXXQSzcrFbt5mGEnUAyH4UCC/HGQ22Nv7PP5/L1YylFvdoXkE7S
 Ardxjjqm2Uih8Y4l2Ve0IVnB6cOcM6kiAy2E/yoRz0mLOq1m1vl3vg8Sp1rqz6pCEJ
 6lRkVBoRxv63lUxEbv9Dzi9H69TPU7oc6wf99eUt30gPAbbduxSK7U9vSSEwL0Qp5/
 foBI3NGbJNzxw==
X-ME-Helo: cyber-villager.home
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Wed, 28 Jan 2026 22:27:30 +0100
X-ME-IP: 2a01:cb1c:8326:c500:bfc0:b7c5:d0ed:4f38
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: use guard() to simplify code
Date: Wed, 28 Jan 2026 22:26:42 +0100
Message-ID: <20260128212644.1170970-1-paul.retourne@orange.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jan 2026 08:56:34 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[orange.fr,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[orange.fr:s=t20230301];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:paul.retourne@orange.fr,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[paul.retourne@orange.fr,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[orange.fr];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[orange.fr,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	DKIM_TRACE(0.00)[orange.fr:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.retourne@orange.fr,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0A95BADD86
X-Rspamd-Action: no action

Use guard() to simplify mutex locking. No functional change.

Signed-off-by: Paul Retourné <paul.retourne@orange.fr>
---
 drivers/staging/fbtft/fb_ssd1305.c  | 4 ++--
 drivers/staging/fbtft/fb_ssd1306.c  | 4 ++--
 drivers/staging/fbtft/fbtft-sysfs.c | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1305.c b/drivers/staging/fbtft/fb_ssd1305.c
index 020fe48fed0be..d9215cb35e8f8 100644
--- a/drivers/staging/fbtft/fb_ssd1305.c
+++ b/drivers/staging/fbtft/fb_ssd1305.c
@@ -10,6 +10,7 @@
 #include <linux/init.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
+#include <linux/cleanup.h>
 
 #include "fbtft.h"
 
@@ -35,12 +36,11 @@ static int init_display(struct fbtft_par *par)
 	par->fbtftops.reset(par);
 
 	if (par->gamma.curves[0] == 0) {
-		mutex_lock(&par->gamma.lock);
+		guard(mutex)(&par->gamma.lock);
 		if (par->info->var.yres == 64)
 			par->gamma.curves[0] = 0xCF;
 		else
 			par->gamma.curves[0] = 0x8F;
-		mutex_unlock(&par->gamma.lock);
 	}
 
 	/* Set Display OFF */
diff --git a/drivers/staging/fbtft/fb_ssd1306.c b/drivers/staging/fbtft/fb_ssd1306.c
index 478d710469b91..c230d599ff928 100644
--- a/drivers/staging/fbtft/fb_ssd1306.c
+++ b/drivers/staging/fbtft/fb_ssd1306.c
@@ -10,6 +10,7 @@
 #include <linux/init.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
+#include <linux/cleanup.h>
 
 #include "fbtft.h"
 
@@ -34,12 +35,11 @@ static int init_display(struct fbtft_par *par)
 	par->fbtftops.reset(par);
 
 	if (par->gamma.curves[0] == 0) {
-		mutex_lock(&par->gamma.lock);
+		guard(mutex)(&par->gamma.lock);
 		if (par->info->var.yres == 64)
 			par->gamma.curves[0] = 0xCF;
 		else
 			par->gamma.curves[0] = 0x8F;
-		mutex_unlock(&par->gamma.lock);
 	}
 
 	/* Set Display OFF */
diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index e45c90a03a903..72d6cf899336e 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/cleanup.h>
+
 #include "fbtft.h"
 #include "internal.h"
 
@@ -95,14 +97,13 @@ sprintf_gamma(struct fbtft_par *par, u32 *curves, char *buf)
 	ssize_t len = 0;
 	unsigned int i, j;
 
-	mutex_lock(&par->gamma.lock);
+	guard(mutex)(&par->gamma.lock);
 	for (i = 0; i < par->gamma.num_curves; i++) {
 		for (j = 0; j < par->gamma.num_values; j++)
 			len += scnprintf(&buf[len], PAGE_SIZE,
 			     "%04x ", curves[i * par->gamma.num_values + j]);
 		buf[len - 1] = '\n';
 	}
-	mutex_unlock(&par->gamma.lock);
 
 	return len;
 }
@@ -124,11 +125,10 @@ static ssize_t store_gamma_curve(struct device *device,
 	if (ret)
 		return ret;
 
-	mutex_lock(&par->gamma.lock);
+	guard(mutex)(&par->gamma.lock);
 	memcpy(par->gamma.curves, tmp_curves,
 	       par->gamma.num_curves * par->gamma.num_values *
 	       sizeof(tmp_curves[0]));
-	mutex_unlock(&par->gamma.lock);
 
 	return count;
 }
-- 
2.52.0

