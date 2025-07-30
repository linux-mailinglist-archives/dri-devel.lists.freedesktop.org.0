Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F11B15B07
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 10:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5679610E432;
	Wed, 30 Jul 2025 08:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SO2hbWaq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6FD10E432
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 08:57:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BFCB6601DB;
 Wed, 30 Jul 2025 08:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8E4C4CEF5;
 Wed, 30 Jul 2025 08:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753865852;
 bh=NXOHjZ58aGBvwMQrtBkDomOQELY6ttJK1yROEv5Iv3k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SO2hbWaqBX+2PMs8syTDt8lJb8OZEyqKfN31Gvroq5Qzaaw3sgdcf79vgpWdhGpdN
 1mBT001jGpmrfnRrwDyEWqTEWbnDTQy7m7eADhsPtmsN+hoTUIQcmXYNK5F7bHqf3H
 pdX3b1KYrk9H4FneyKCJfDvkupe8EFRaROkYQhBNnpYHYkOFX83aXg/Y5KqWR7la5b
 PY+QJ77Aj4gJB1Z2qx8q7nch+9cfTETdIyAv9iZ4gUbNacMdiPEPwPFDntHoIz6SNb
 ysLs35y7r5EblxMilH3GMkGiFTNozkN4KNVsdk+rTHaIt8ea2sYIHl+bRSNXSAmEWo
 VRG5b2pLWzx+A==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 30 Jul 2025 10:57:07 +0200
Subject: [PATCH 07/14] drm/tidss: dispc: Switch REG_GET to using a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-drm-tidss-field-api-v1-7-a71ae8dd2782@kernel.org>
References: <20250730-drm-tidss-field-api-v1-0-a71ae8dd2782@kernel.org>
In-Reply-To: <20250730-drm-tidss-field-api-v1-0-a71ae8dd2782@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2793; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NXOHjZ58aGBvwMQrtBkDomOQELY6ttJK1yROEv5Iv3k=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmd95Lu+JoHfiwMmsy34av3FbGI299XPribdO2Lms71U
 9sXK/Z7dUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJvG5nrJV6ued+8ZuDTIu0
 pD/OXJYdbcHlvHfOohQzrmWB06STZCu9MkX2d8neTH4w44jk80unwhgbbrsGznUS2Ltm8pbptua
 N7jPml7u2rDXWfbD9+OkPiYr558vWyW87r73x9hlra5Eep9MrAA==
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
 drivers/gpu/drm/tidss/tidss_dispc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index e4729a5b79ed5d554e05c020adb7e2d3e7a8f4d3..cfd6c4cf716904cf78699baf2eb4c3a0f57a1abe 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -612,13 +612,13 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 static u32 FLD_MOD(u32 orig, u32 val, u32 mask)
 {
 	return (orig & ~mask) | FIELD_PREP(mask, val);
 }
 
-static u32 REG_GET(struct dispc_device *dispc, u32 idx, u32 start, u32 end)
+static u32 REG_GET(struct dispc_device *dispc, u32 idx, u32 mask)
 {
-	return FIELD_GET(GENMASK(start, end), dispc_read(dispc, idx));
+	return FIELD_GET(mask, dispc_read(dispc, idx));
 }
 
 static void REG_FLD_MOD(struct dispc_device *dispc, u32 idx, u32 val,
 			u32 start, u32 end)
 {
@@ -2808,30 +2808,30 @@ int dispc_runtime_resume(struct dispc_device *dispc)
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

