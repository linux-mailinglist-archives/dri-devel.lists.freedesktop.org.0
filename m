Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF998C9A89
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 11:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0692710E59F;
	Mon, 20 May 2024 09:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="L+2yBEhh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr
 [80.12.242.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C937010E59F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 09:40:55 +0000 (UTC)
Received: from localhost.localdomain ([86.243.17.157])
 by smtp.orange.fr with ESMTPA
 id 8zVgsQHohrcIM8zVgsAdfk; Mon, 20 May 2024 11:40:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1716198053;
 bh=3kjknBbjqfJQ6eLw8k3gflhIVcgh33eEwLFPSws9YCE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=L+2yBEhhgXi5xu2+LX9rSSwCMEbjT5QHl4m86H69IUBp1fMCGwNDcI+Uk5cNUKJwO
 B5A0GHGgSK3/XSJWXi1qZ+pCVqUX4832Ujg5925ZFmBOsmXN8l5PNZ6/f1C8YjOFrB
 ZJ/Q6dJ5aa6zqvnYVCJH/VvJnnclhbgGMuv3uSVpUgE5jX6i3Zah9nfranCk+lXFDM
 msfF8qGUAEfd6fTYV3OLoDLqRyRf8yiY+n6b62yr4VutEUjhw8Yv6qGqbEmCh+3XOo
 jLgNLXk+QFwblsvPg6jKAIvZKRFLOS0mjQCjeOkwAtE1hmy2EEhkmaq7zDJpXLCgLb
 EDrvMFjLxmxlQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 20 May 2024 11:40:53 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 Sean Anderson <sean.anderson@linux.dev>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm: zynqmp_dpsub: Fix an error handling path in
 zynqmp_dpsub_probe()
Date: Mon, 20 May 2024 11:40:37 +0200
Message-ID: <974d1b062d7c61ee6db00d16fa7c69aa1218ee02.1716198025.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.1
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

If zynqmp_dpsub_drm_init() fails, we must undo the previous
drm_bridge_add() call.

Fixes: be3f3042391d ("drm: zynqmp_dpsub: Always register bridge")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index face8d6b2a6f..f5781939de9c 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -269,6 +269,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	return 0;
 
 err_disp:
+	drm_bridge_remove(dpsub->bridge);
 	zynqmp_disp_remove(dpsub);
 err_dp:
 	zynqmp_dp_remove(dpsub);
-- 
2.45.1

