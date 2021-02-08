Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199A314362
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 00:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5E66EA1A;
	Mon,  8 Feb 2021 23:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506366EA16
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 22:38:21 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612823899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0cq3WK986SUH+YkubdosVAvIMlSY7yYpl0TWaVW1sQ=;
 b=wuwra8SrIErSfUEvj46Wmh4CpVPpBAnZBmNF4wCyT1u4UhvfrSvb2NW9wYUfSXi37IkEoU
 oEYNHL9bgB/n1/yZoBInp+B7RDD2KizFqPICjE94ofmycg9xKsq+id3Gwb4UrmpJ+XKor1
 H3gzYfc0VtkE6GEgHj8+rkWpLQ74HzbkYKjlhFUnaV+00Zhy09oB9EHnBdzPWKysFARZpA
 NfbbXmFxJ3C6uhUrJ6EUlpx9Wq9o0UEdmwjER8hh+yXmU2QAoHQc25caGgFns27M7PJuH7
 bRUBGrl4d7LTJpiBUwuZI7wFto4EX4RYfaNxHHzf9x3nDiOlg0DxNa76bODtcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612823899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0cq3WK986SUH+YkubdosVAvIMlSY7yYpl0TWaVW1sQ=;
 b=x8XMjFq1YWqgn/3UQwkMOZ42YQcUoy9EzkqPUkf3l/Y2t3VRpF2H5ckJPaIuOMFQxuFOgI
 z1/Q+GJSz87c8kCA==
To: linux-fbdev@vger.kernel.org
Subject: [PATCH 3/3] video: fbdev: amba-clcd: Always use msleep() for waiting
Date: Mon,  8 Feb 2021 23:38:10 +0100
Message-Id: <20210208223810.388502-4-bigeasy@linutronix.de>
In-Reply-To: <20210208223810.388502-1-bigeasy@linutronix.de>
References: <20210208223810.388502-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Feb 2021 23:01:06 +0000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver uses in_atomic() to distinguish between mdelay() and msleep().

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

I traced the usage of in_interrupt() back to its initial merge:
    bfe694f833643 ("[ARM] Add ARM AMBA CLCD framebuffer driver.")
    https://git.kernel.org/history/history/c/bfe694f833643

The driver has been removed and added back in the meantime.
I've been looking for the IRQ context as described in the comment and
couldn't find it. The functions calling clcdfb_sleep() also call
conditionally backlight_update_status() which acquires a mutex. If it is
okay to acquire a mutex then it is okay to use msleep() since both
functions must be used in preemptible context.

Replace clcdfb_sleep() with msleep().

Cc: Peter Collingbourne <pcc@google.com>
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/video/fbdev/amba-clcd.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
index 33595cc4778e9..9ec969e136bfd 100644
--- a/drivers/video/fbdev/amba-clcd.c
+++ b/drivers/video/fbdev/amba-clcd.c
@@ -35,19 +35,6 @@
 /* This is limited to 16 characters when displayed by X startup */
 static const char *clcd_name = "CLCD FB";
 
-/*
- * Unfortunately, the enable/disable functions may be called either from
- * process or IRQ context, and we _need_ to delay.  This is _not_ good.
- */
-static inline void clcdfb_sleep(unsigned int ms)
-{
-	if (in_atomic()) {
-		mdelay(ms);
-	} else {
-		msleep(ms);
-	}
-}
-
 static inline void clcdfb_set_start(struct clcd_fb *fb)
 {
 	unsigned long ustart = fb->fb.fix.smem_start;
@@ -77,7 +64,7 @@ static void clcdfb_disable(struct clcd_fb *fb)
 		val &= ~CNTL_LCDPWR;
 		writel(val, fb->regs + fb->off_cntl);
 
-		clcdfb_sleep(20);
+		msleep(20);
 	}
 	if (val & CNTL_LCDEN) {
 		val &= ~CNTL_LCDEN;
@@ -109,7 +96,7 @@ static void clcdfb_enable(struct clcd_fb *fb, u32 cntl)
 	cntl |= CNTL_LCDEN;
 	writel(cntl, fb->regs + fb->off_cntl);
 
-	clcdfb_sleep(20);
+	msleep(20);
 
 	/*
 	 * and now apply power.
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
