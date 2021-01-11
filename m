Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F50D2F12B5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 14:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2392F89C9A;
	Mon, 11 Jan 2021 13:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581A289F41
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dbF9ykhEhU7DXeQWClfDqFTyafksBZUNrtr89GfFeqc=; b=pBG4QfcHyw0Y8ZyBDYiZ6um05q
 ORHMQGNEgP8VLrK0GTAzFsG9h75F+Ux6q7zdiUewsO8KtHVeP7PgsMjV8Akwb4bn3dLEivRaWwn36
 nPfE/DC4EQ/5VxmGV8GYg5n3WqJK3lLi9XZJh8ohMHOjKHBixJ881kK2E3msWKcO8rHtAil37tZP8
 lAlpeCiIdBwUT+GODRCGieghnCTbpGxsu2cSP425iH3rNtZuk0W4+A8jpSIiVKSaAP6fLQqiYtVjj
 tHXF2XtyiG7nBufC3bMy3Cr1DVOR0aGILlmaKWBUQpG+0YAD430POATorHCgkC9j9HhQk4x6mMkEo
 fx6yAELA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kywo6-0002tl-HR; Mon, 11 Jan 2021 15:00:26 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v5 05/21] gpu: host1x: Use HW-equivalent syncpoint expiration
 check
Date: Mon, 11 Jan 2021 15:00:03 +0200
Message-Id: <20210111130019.3515669-6-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111130019.3515669-1-mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make syncpoint expiration checks always use the same logic used by
the hardware. This ensures that there are no race conditions that
could occur because of the hardware triggering a syncpoint interrupt
and then the driver disagreeing.

One situation where this could occur is if a job incremented a
syncpoint too many times -- then the hardware would trigger an
interrupt, but the driver would assume that a syncpoint value
greater than the syncpoint's max value is in the future, and not
clean up the job.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/syncpt.c | 51 ++-----------------------------------
 1 file changed, 2 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index e48b4595cf53..9ccdf7709946 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -306,59 +306,12 @@ EXPORT_SYMBOL(host1x_syncpt_wait);
 bool host1x_syncpt_is_expired(struct host1x_syncpt *sp, u32 thresh)
 {
 	u32 current_val;
-	u32 future_val;
 
 	smp_rmb();
 
 	current_val = (u32)atomic_read(&sp->min_val);
-	future_val = (u32)atomic_read(&sp->max_val);
-
-	/* Note the use of unsigned arithmetic here (mod 1<<32).
-	 *
-	 * c = current_val = min_val	= the current value of the syncpoint.
-	 * t = thresh			= the value we are checking
-	 * f = future_val  = max_val	= the value c will reach when all
-	 *				  outstanding increments have completed.
-	 *
-	 * Note that c always chases f until it reaches f.
-	 *
-	 * Dtf = (f - t)
-	 * Dtc = (c - t)
-	 *
-	 *  Consider all cases:
-	 *
-	 *	A) .....c..t..f.....	Dtf < Dtc	need to wait
-	 *	B) .....c.....f..t..	Dtf > Dtc	expired
-	 *	C) ..t..c.....f.....	Dtf > Dtc	expired	   (Dct very large)
-	 *
-	 *  Any case where f==c: always expired (for any t).	Dtf == Dcf
-	 *  Any case where t==c: always expired (for any f).	Dtf >= Dtc (because Dtc==0)
-	 *  Any case where t==f!=c: always wait.		Dtf <  Dtc (because Dtf==0,
-	 *							Dtc!=0)
-	 *
-	 *  Other cases:
-	 *
-	 *	A) .....t..f..c.....	Dtf < Dtc	need to wait
-	 *	A) .....f..c..t.....	Dtf < Dtc	need to wait
-	 *	A) .....f..t..c.....	Dtf > Dtc	expired
-	 *
-	 *   So:
-	 *	   Dtf >= Dtc implies EXPIRED	(return true)
-	 *	   Dtf <  Dtc implies WAIT	(return false)
-	 *
-	 * Note: If t is expired then we *cannot* wait on it. We would wait
-	 * forever (hang the system).
-	 *
-	 * Note: do NOT get clever and remove the -thresh from both sides. It
-	 * is NOT the same.
-	 *
-	 * If future valueis zero, we have a client managed sync point. In that
-	 * case we do a direct comparison.
-	 */
-	if (!host1x_syncpt_client_managed(sp))
-		return future_val - thresh >= current_val - thresh;
-	else
-		return (s32)(current_val - thresh) >= 0;
+
+	return ((current_val - thresh) & 0x80000000U) == 0U;
 }
 
 int host1x_syncpt_init(struct host1x *host)
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
