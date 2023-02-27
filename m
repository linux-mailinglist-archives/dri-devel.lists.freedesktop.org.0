Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960E6A3768
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726E510E329;
	Mon, 27 Feb 2023 02:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB81D10E329
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 02:09:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 328B360DBA;
 Mon, 27 Feb 2023 02:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901BCC433D2;
 Mon, 27 Feb 2023 02:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463748;
 bh=Pem5mvft+brAVE/Z2ORVJW8cEkXk7ExiLz1nak+RvcE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PET/UhrNlciOzHkeDKSLERG63IIxyxmDNmGtt3/PtFTsHTtntA+wv1h0S/ykTq1TG
 aw51b7+UOCZizTE4GN9pDLiAjXu8KbAKaPBSvfiwDubYIX+gbI9P3NURqY8J85CPTz
 0ZcOWXZHkpyXL0XBOicHbRjixOjokF24RO8gZKtuOMvAtnOpaajKm3u+u5SSqSreC4
 yjiW/luS8ojAxXiK8fmMAEr+G0RvRtpk0WPjRjYjQGJY6MS7ilKzQpakrooT1cwmaA
 xYzys6etG3oOZKpCl+UqFqJ+eqZqO3qJH+/c/qvpiFE+Gcmt4k2wcYxwBmVskN5dte
 UQgQT2ly6cRFw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 03/25] drm/omap: dsi: Fix excessive stack usage
Date: Sun, 26 Feb 2023 21:08:26 -0500
Message-Id: <20230227020855.1051605-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020855.1051605-1-sashal@kernel.org>
References: <20230227020855.1051605-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, kernel test robot <lkp@intel.com>,
 tomba@kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

[ Upstream commit cfca78971b9233aef0891507a98fba62046d4542 ]

dsi_dump_dsi_irqs(), a function used for debugfs prints, has a large
struct in its frame, which can result in:

drivers/gpu/drm/omapdrm/dss/dsi.c:1126:1: warning: the frame size of 1060 bytes is larger than 1024 bytes [-Wframe-larger-than=]

As the performance of the function is of no concern, let's allocate the
struct with kmalloc instead.

Compile-tested only.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20220916082206.167427-1-tomi.valkeinen@ideasonboard.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 5f1722b040f46..41da86cd8b64c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -1039,22 +1039,26 @@ static int dsi_dump_dsi_irqs(struct seq_file *s, void *p)
 {
 	struct dsi_data *dsi = s->private;
 	unsigned long flags;
-	struct dsi_irq_stats stats;
+	struct dsi_irq_stats *stats;
+
+	stats = kmalloc(sizeof(*stats), GFP_KERNEL);
+	if (!stats)
+		return -ENOMEM;
 
 	spin_lock_irqsave(&dsi->irq_stats_lock, flags);
 
-	stats = dsi->irq_stats;
+	*stats = dsi->irq_stats;
 	memset(&dsi->irq_stats, 0, sizeof(dsi->irq_stats));
 	dsi->irq_stats.last_reset = jiffies;
 
 	spin_unlock_irqrestore(&dsi->irq_stats_lock, flags);
 
 	seq_printf(s, "period %u ms\n",
-			jiffies_to_msecs(jiffies - stats.last_reset));
+			jiffies_to_msecs(jiffies - stats->last_reset));
 
-	seq_printf(s, "irqs %d\n", stats.irq_count);
+	seq_printf(s, "irqs %d\n", stats->irq_count);
 #define PIS(x) \
-	seq_printf(s, "%-20s %10d\n", #x, stats.dsi_irqs[ffs(DSI_IRQ_##x)-1]);
+	seq_printf(s, "%-20s %10d\n", #x, stats->dsi_irqs[ffs(DSI_IRQ_##x)-1]);
 
 	seq_printf(s, "-- DSI%d interrupts --\n", dsi->module_id + 1);
 	PIS(VC0);
@@ -1078,10 +1082,10 @@ static int dsi_dump_dsi_irqs(struct seq_file *s, void *p)
 
 #define PIS(x) \
 	seq_printf(s, "%-20s %10d %10d %10d %10d\n", #x, \
-			stats.vc_irqs[0][ffs(DSI_VC_IRQ_##x)-1], \
-			stats.vc_irqs[1][ffs(DSI_VC_IRQ_##x)-1], \
-			stats.vc_irqs[2][ffs(DSI_VC_IRQ_##x)-1], \
-			stats.vc_irqs[3][ffs(DSI_VC_IRQ_##x)-1]);
+			stats->vc_irqs[0][ffs(DSI_VC_IRQ_##x)-1], \
+			stats->vc_irqs[1][ffs(DSI_VC_IRQ_##x)-1], \
+			stats->vc_irqs[2][ffs(DSI_VC_IRQ_##x)-1], \
+			stats->vc_irqs[3][ffs(DSI_VC_IRQ_##x)-1]);
 
 	seq_printf(s, "-- VC interrupts --\n");
 	PIS(CS);
@@ -1097,7 +1101,7 @@ static int dsi_dump_dsi_irqs(struct seq_file *s, void *p)
 
 #define PIS(x) \
 	seq_printf(s, "%-20s %10d\n", #x, \
-			stats.cio_irqs[ffs(DSI_CIO_IRQ_##x)-1]);
+			stats->cio_irqs[ffs(DSI_CIO_IRQ_##x)-1]);
 
 	seq_printf(s, "-- CIO interrupts --\n");
 	PIS(ERRSYNCESC1);
@@ -1122,6 +1126,8 @@ static int dsi_dump_dsi_irqs(struct seq_file *s, void *p)
 	PIS(ULPSACTIVENOT_ALL1);
 #undef PIS
 
+	kfree(stats);
+
 	return 0;
 }
 #endif
-- 
2.39.0

