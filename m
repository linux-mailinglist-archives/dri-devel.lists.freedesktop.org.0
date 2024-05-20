Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03438C9A97
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 11:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8816E10E0F5;
	Mon, 20 May 2024 09:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="oTUzr4Cg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msa.smtpout.orange.fr (smtp-70.smtpout.orange.fr [80.12.242.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A3710E568
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 09:43:57 +0000 (UTC)
Received: from localhost.localdomain ([86.243.17.157])
 by smtp.orange.fr with ESMTPA
 id 8zPjslTpy8GJA8zPjsKGeh; Mon, 20 May 2024 11:34:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1716197683;
 bh=bGqQuOEblhAm3peYnZztYMLeh0ncPzzrHa3zUm2ihUg=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=oTUzr4CgJ6FLx6ZgfRHMG1ly1+nqheFVnGDh8WEpzjTwnS6lXkT48+ruiXWnaZzLM
 tB8onbUJyl/Cr/5Ws+TElQS8zZaHT4wJuirCmcDnUNAyDAQTKTXCduuWcBwDs4UEic
 vaWqvbPozYOxYMNrOby0imhcE/uRcyrUJp13y1Pk1JlnXUx5Re7qmM9FJtew+wqouc
 5VnuiqU5RGZKWOwtNBuAtQjLLOl1vKSJOyc0d15Pikiaq+sOZl8cxVtIEPw0hrnkDR
 664iNHRCDMI8Nmnr63+GfbXwGuvwWVQmLGFnxUqrhHehwyvRLId4X17qMFDNz1+8bz
 ZaYljy5npEpMA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 20 May 2024 11:34:43 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Caleb Connolly <caleb@connolly.tech>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: lg-sw43408: Fix an error handling path in
 sw43408_probe()
Date: Mon, 20 May 2024 11:34:31 +0200
Message-ID: <b8dfafaf1516b33dfc21e9ad27e31fe2a5820a5c.1716197626.git.christophe.jaillet@wanadoo.fr>
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

If mipi_dsi_attach() fails, we must undo the drm_panel_add() call hidden in
sw43408_add(), as already done in the remove function.

Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 115f4702d59f..27f2ad788d38 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -286,7 +286,15 @@ static int sw43408_probe(struct mipi_dsi_device *dsi)
 
 	dsi->dsc = &ctx->dsc;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0)
+		goto err_remove_panel;
+
+	return 0;
+
+err_remove_panel:
+	drm_panel_remove(&ctx->base);
+	return ret;
 }
 
 static void sw43408_remove(struct mipi_dsi_device *dsi)
-- 
2.45.1

