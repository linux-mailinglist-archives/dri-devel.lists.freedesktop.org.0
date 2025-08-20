Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99892B2DE90
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EA710E745;
	Wed, 20 Aug 2025 14:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eyDTCNW1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D8210E74B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:02:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8FC425C69A4;
 Wed, 20 Aug 2025 14:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6F7C4CEE7;
 Wed, 20 Aug 2025 14:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755698540;
 bh=NPKE0HzA70wlsc3DhdEGt6RObPp32ugchgS24Nhjfqc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eyDTCNW1qws1n3jaCS7qXvN4ke3vb7HK6sJyxhs7xW2YIDg4upsMipqf4chm0zGC8
 fjy59+HFTOhk9mfbrdLqDa6NMOsIspgScpx+oDlxvpP8AT1nSkuUuSUyj7ZGKDAxHQ
 LFCcGyyDQkGJR2pV1pSTxG37TTxj0nw4Vtyl5wZfL667ol1iyaZ20Ahg3SIQHabEdo
 JGdH6MtpTmEHxIhGnSM7Hehvq2qHWD97X7WG7LlLBactyQtXMqPXBGrBc9fufzVSzV
 i84x/KhrtxHq6qrEGy97W2Caikh8sYmobzFyeMAd+eC+JfNvY5ESiOEyjW07QT60na
 Zf2Q09vCb86yQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Aug 2025 16:01:47 +0200
Subject: [PATCH v2 07/14] drm/tidss: dispc: Switch REG_GET to using a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-drm-tidss-field-api-v2-7-43cab671c648@kernel.org>
References: <20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org>
In-Reply-To: <20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NPKE0HzA70wlsc3DhdEGt6RObPp32ugchgS24Nhjfqc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlLrwZ9C2JYHPY2SiZeuyJx3fGWg8H1ui8zHY5ceX9NR
 mVRfK9vx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIbC/Geu8PJ7331OYxNyq8
 eZnO+W6qy67Ln0ssyhh09S+civGcW6O/KthwQtqzw1ZMewQDi2UfMDYc3HX07xUBgfWuXW+6pmn
 cckpnMGz9fGb9t+2zp8U/3qtfta9gcenu3m670kpJR+WCBVcB
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The REG_GET function takes the start and end bits as parameter and will
generate a mask out of them.

This makes it difficult to share the masks between callers, since we now
need two arguments and to keep them consistent.

Let's change REG_GET to take the mask as an argument instead, and let
the caller create the mask. Eventually, this mask will be moved to a
define.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index fef56aed3f6edb6630d079f354821ada5fad327d..807ab0e0afc7f95efe55764dcb08da695fb85963 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -607,13 +607,12 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 /*
  * TRM gives bitfields as start:end, where start is the higher bit
  * number. For example 7:0
  */
 
-#define REG_GET(dispc, idx, start, end)					\
-	((u32)FIELD_GET(GENMASK((start), (end)),			\
-			dispc_read((dispc), (idx))))
+#define REG_GET(dispc, idx, mask)					\
+	((u32)FIELD_GET((mask), dispc_read((dispc), (idx))))
 
 #define REG_FLD_MOD(dispc, idx, val, start, end)			\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _idx = (idx);					\
@@ -2807,30 +2806,30 @@ int dispc_runtime_resume(struct dispc_device *dispc)
 {
 	dev_dbg(dispc->dev, "resume\n");
 
 	clk_prepare_enable(dispc->fclk);
 
-	if (REG_GET(dispc, DSS_SYSSTATUS, 0, 0) == 0)
+	if (REG_GET(dispc, DSS_SYSSTATUS, GENMASK(0, 0)) == 0)
 		dev_warn(dispc->dev, "DSS FUNC RESET not done!\n");
 
 	dev_dbg(dispc->dev, "OMAP DSS7 rev 0x%x\n",
 		dispc_read(dispc, DSS_REVISION));
 
 	dev_dbg(dispc->dev, "VP RESETDONE %d,%d,%d\n",
-		REG_GET(dispc, DSS_SYSSTATUS, 1, 1),
-		REG_GET(dispc, DSS_SYSSTATUS, 2, 2),
-		REG_GET(dispc, DSS_SYSSTATUS, 3, 3));
+		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(1, 1)),
+		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(2, 2)),
+		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(3, 3)));
 
 	if (dispc->feat->subrev == DISPC_AM625 ||
 	    dispc->feat->subrev == DISPC_AM65X)
 		dev_dbg(dispc->dev, "OLDI RESETDONE %d,%d,%d\n",
-			REG_GET(dispc, DSS_SYSSTATUS, 5, 5),
-			REG_GET(dispc, DSS_SYSSTATUS, 6, 6),
-			REG_GET(dispc, DSS_SYSSTATUS, 7, 7));
+			REG_GET(dispc, DSS_SYSSTATUS, GENMASK(5, 5)),
+			REG_GET(dispc, DSS_SYSSTATUS, GENMASK(6, 6)),
+			REG_GET(dispc, DSS_SYSSTATUS, GENMASK(7, 7)));
 
 	dev_dbg(dispc->dev, "DISPC IDLE %d\n",
-		REG_GET(dispc, DSS_SYSSTATUS, 9, 9));
+		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(9, 9)));
 
 	dispc_initial_config(dispc);
 
 	dispc->is_enabled = true;
 

-- 
2.50.1

