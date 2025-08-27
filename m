Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF25B385E8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D56610E84F;
	Wed, 27 Aug 2025 15:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W7iZDn1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BB510E846
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 15:13:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BF2854197C;
 Wed, 27 Aug 2025 15:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50512C4CEF0;
 Wed, 27 Aug 2025 15:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756307582;
 bh=ZbI27RylcyMGj+s7T7zJmmbfZNuvnXtkNAubQV1O/80=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=W7iZDn1qymdPZrY75n9JZjKKu/mpClOMOjfEHpFcAYrjtAOpnFU2bqrXZnLZ7O5kC
 kakPvexQvAARuuyUF4LUlFgQ3KXvIaAzUXX3RFe4jp7bsrMXzQqOkup2LLGujqZj8W
 tZzOKqM+510F38N+klZuH3UGQKklZIHD8L16I9WpxjkCfoFzc/brr2bbJCGiPHFmz+
 V9F6NUfgZHMyk+/8vYp3Q3EUWNdcdcX6O0J91D4Ok6nqkAKOfOC2mKgasf0BrnfAAx
 kKm9QRekIN50aUyfsNcVXlvDq9aA4HCIUS6/wKaBIGCJubIxAnb7WcFY3v/ZrAb/JK
 vAsHN5kjDOzdA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Aug 2025 17:12:38 +0200
Subject: [PATCH v3 07/14] drm/tidss: dispc: Switch REG_GET to using a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-drm-tidss-field-api-v3-7-7689b664cc63@kernel.org>
References: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
In-Reply-To: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZbI27RylcyMGj+s7T7zJmmbfZNuvnXtkNAubQV1O/80=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnrFdJWpiukixxoSfzV8Ob8zzje2IrTG3V1n1l0p0qfP
 P3hqEZ0x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI22zGhiP98WulyxjOGZat
 FlherOlSVuT9bn17ZOXyFV80gs+8rQw//Mbi0PSM1/E/rV+2ddmmMtaZWi4vPX3nPmvIfbbgJ0f
 +NZpu11tpoXlfj8mXcZrw4uMrcufwsFequM49pMpQU1/27CMA
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
index 4eeeae6e0a0ecc8bb5bbc5f455e9fab6b913097a..48985f0bbbacacf76293f24414470664c74c40ec 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -592,13 +592,12 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
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
@@ -2792,30 +2791,30 @@ int dispc_runtime_resume(struct dispc_device *dispc)
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

