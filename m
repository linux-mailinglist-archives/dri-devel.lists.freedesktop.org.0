Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D720314361
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 00:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3066C6EA16;
	Mon,  8 Feb 2021 23:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487476EA15
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 22:38:21 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612823899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3Vm5cN5ZRUgTJMYYFZ2xGq76D9G/sCK8skQRU1NGXs=;
 b=zdkkD1GHAcXiTl5Xp5WBjkMHpvlCx8N1EMZZ0J5omzWl5zGMWQHcfr2leKqZ2OuFdFoxzo
 LDNYCWrbNxQVyWVzbJZX40rmBncOwnx+IlIA/uWBNHfku+mwB5EF5GFyP6tSxz3SWjy06I
 2vRBMefxXCJrCqlO3/xUg9aW21005IA0v8xkGMYSv1fGS7EUfolXQ0fNcBN1I2aGJLb1jM
 vmGB6hTk034GoKkwiQwEBfai9G6Zi7jmYQrm+4bobOJYsU629npnlIduQTlvDVb5i06C/4
 Ldr8LxS4CiXN7kcPb1E6TGdMyOwP2WiiuW3G9Gg8yKwfWwZuii+KTvk/zv1ayA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612823899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3Vm5cN5ZRUgTJMYYFZ2xGq76D9G/sCK8skQRU1NGXs=;
 b=KYB6Smx+kX0Y4v7x1cybAQtIzFv1RIr5biZy0O2ij6xXZJDo1M0tA6FUs+Iwi0KZrgY8UL
 8QHHojAdWC4YLZCA==
To: linux-fbdev@vger.kernel.org
Subject: [PATCH 2/3] video: omapfb: Remove WARN_ON(in_interrupt()).
Date: Mon,  8 Feb 2021 23:38:09 +0100
Message-Id: <20210208223810.388502-3-bigeasy@linutronix.de>
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
 "Ahmed S. Darwish" <a.darwish@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Ahmed S. Darwish" <a.darwish@linutronix.de>

dsi_sync_vc() uses in_interrupt() to create a warning if the function is
used in non-preemptible context.

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

The wait_for_completion() function (used in dsi_sync_vc_vp() and
dsi_sync_vc_l4() has already a check if it is invoked from proper
context.

Remove WARN_ON(in_interrupt()) from the driver.

Cc: linux-omap@vger.kernel.org
Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index dc34bb04b865c..df90091de75f8 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -2373,8 +2373,6 @@ static int dsi_sync_vc(struct platform_device *dsidev, int channel)
 
 	WARN_ON_ONCE(!dsi_bus_is_locked(dsidev));
 
-	WARN_ON(in_interrupt());
-
 	if (!dsi_vc_is_enabled(dsidev, channel))
 		return 0;
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
