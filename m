Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE3307138
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1ADA6E938;
	Thu, 28 Jan 2021 08:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD716E86A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 17:29:16 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1611768553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gV4s82FEuVJugdNoRBb0xE+COjn/uKSW2UKMDbD6jHQ=;
 b=wuR6CRkyif58OjIS/1cWiPhdkXgbh0OqmSlzr7gMAtiiifGyw7zj8i7FN1PfpPjucFGtZg
 CA1lCRgAHYo766uQ0mV0iaP5l4k2JuL7uaQF4DhG88oUB0jsOTiNUe45KPn/WeV/mp5xcW
 2Wj74lJO1uAMK/1hcdw6stC+FgTFqwI2i9kzTd+FtnLqZ1vd6aTy8Y6pKTE2CZX4DCAtd8
 zTiPqDaAa7AQfweHPFdkFyMEWwFZcXMDFe4IV+qvOssPV9a0TraLPIajnhVptgqQhDKyl+
 OTGE2j8s413MmOvIzgLY6bkRtFHqRsHHrx2kqvZSFjnSwBFf0209WFc1lYduuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1611768553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gV4s82FEuVJugdNoRBb0xE+COjn/uKSW2UKMDbD6jHQ=;
 b=NaDYvA+wOnqKU2brmmYmjgXx9Os1WNewhM31jbnuz8NnIT52LlmN3YFszE6p1b0tADmnBN
 v0WyuLWIENFZMKAg==
To: linux-omap@vger.kernel.org
Subject: [PATCH 2/2] video: omapfb: Remove WARN_ON(in_interrupt()).
Date: Wed, 27 Jan 2021 18:29:02 +0100
Message-Id: <20210127172902.145335-3-bigeasy@linutronix.de>
In-Reply-To: <20210127172902.145335-1-bigeasy@linutronix.de>
References: <20210127172902.145335-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org,
 "Ahmed S. Darwish" <a.darwish@linutronix.de>
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
