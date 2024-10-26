Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241A79B1B26
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 00:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4A810E056;
	Sat, 26 Oct 2024 22:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="NDQeZixg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F29210E056
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 22:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=qhyyxt3+fwlP6e+aCR51ac6iwRI01AJeU0CzuMQ+1V8=; b=NDQeZixgWW/MNKeP
 JOK07FjY++WDNsSZcBbAjcMBeO8tihqOmUKK/lwiKy/ZS+OK9uUO8dFYvjvhkNLbFW5e5XLT01+XX
 kGaA6ZC8I/24mdRKvX/w8Jylrsk5YLQKRatTb9IFSALwOo/dG4+N4ZthpHGsA7FOndSRss4DdgZc+
 q4cqpDUKxrFcU/Ndw4kxUXLMXohu3Hq/BZI3ujxKwO/ggudZPvfUSQImCqkRraCZM7to8dUG/Gcm5
 jnqz9eYcUSxc0CAkXO4W/MsiKw0FRNRdxeQPq4p3vTbmpSO8ahVvUs+9e8pEH9h1p7dG3BUOqYcav
 1FI/6zthyEsOYjNokg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t4oqk-00Djna-2u;
 Sat, 26 Oct 2024 22:01:34 +0000
From: linux@treblig.org
To: deller@gmx.de,
	u.kleine-koenig@baylibre.com,
	linux-omap@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] fbdev: omapfb: Remove some deadcode
Date: Sat, 26 Oct 2024 23:01:33 +0100
Message-ID: <20241026220133.93956-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

commit f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
took a copy of the omapdrm code into omapfb, however at that point
a couple of functions were already unused at that point.

Remove dispc_mgr_get_clock_div() and dispc_enable_fifomerge() from
the omapfb copy.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 27 --------------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.h   |  3 ---
 2 files changed, 30 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index 5832485ab998..c3329c8b4c16 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -1230,17 +1230,6 @@ void dispc_ovl_set_fifo_threshold(enum omap_plane plane, u32 low, u32 high)
 		dispc_write_reg(DISPC_OVL_PRELOAD(plane), min(high, 0xfffu));
 }
 
-void dispc_enable_fifomerge(bool enable)
-{
-	if (!dss_has_feature(FEAT_FIFO_MERGE)) {
-		WARN_ON(enable);
-		return;
-	}
-
-	DSSDBG("FIFO merge %s\n", enable ? "enabled" : "disabled");
-	REG_FLD_MOD(DISPC_CONFIG, enable ? 1 : 0, 14, 14);
-}
-
 void dispc_ovl_compute_fifo_thresholds(enum omap_plane plane,
 		u32 *fifo_low, u32 *fifo_high, bool use_fifomerge,
 		bool manual_update)
@@ -3656,22 +3645,6 @@ void dispc_mgr_set_clock_div(enum omap_channel channel,
 	dispc_mgr_set_lcd_divisor(channel, cinfo->lck_div, cinfo->pck_div);
 }
 
-int dispc_mgr_get_clock_div(enum omap_channel channel,
-		struct dispc_clock_info *cinfo)
-{
-	unsigned long fck;
-
-	fck = dispc_fclk_rate();
-
-	cinfo->lck_div = REG_GET(DISPC_DIVISORo(channel), 23, 16);
-	cinfo->pck_div = REG_GET(DISPC_DIVISORo(channel), 7, 0);
-
-	cinfo->lck = fck / cinfo->lck_div;
-	cinfo->pck = cinfo->lck / cinfo->pck_div;
-
-	return 0;
-}
-
 u32 dispc_read_irqstatus(void)
 {
 	return dispc_read_reg(DISPC_IRQSTATUS);
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.h b/drivers/video/fbdev/omap2/omapfb/dss/dss.h
index 21cfcbf74a6d..a33a43f26829 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.h
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.h
@@ -366,7 +366,6 @@ void dispc_disable_sidle(void);
 
 void dispc_lcd_enable_signal(bool enable);
 void dispc_pck_free_enable(bool enable);
-void dispc_enable_fifomerge(bool enable);
 void dispc_enable_gamma_table(bool enable);
 
 typedef bool (*dispc_div_calc_func)(int lckd, int pckd, unsigned long lck,
@@ -388,8 +387,6 @@ void dispc_ovl_compute_fifo_thresholds(enum omap_plane plane,
 
 void dispc_mgr_set_clock_div(enum omap_channel channel,
 		const struct dispc_clock_info *cinfo);
-int dispc_mgr_get_clock_div(enum omap_channel channel,
-		struct dispc_clock_info *cinfo);
 void dispc_set_tv_pclk(unsigned long pclk);
 
 u32 dispc_read_irqstatus(void);
-- 
2.47.0

