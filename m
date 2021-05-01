Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75393707B6
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 17:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C578A6E5A0;
	Sat,  1 May 2021 15:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A2C6E192
 for <dri-devel@lists.freedesktop.org>; Sat,  1 May 2021 11:51:59 +0000 (UTC)
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d12 with ME
 id zPrv2400321Fzsu03PrvnW; Sat, 01 May 2021 13:51:57 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 01 May 2021 13:51:57 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, heiko.stuebner@theobroma-systems.com
Subject: [PATCH] drm/panel: leadtek: Fix an error handling path
Date: Sat,  1 May 2021 13:51:54 +0200
Message-Id: <588e8b4519487f6d33419c4b0fa7f8ea1b26cb58.1619869792.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 01 May 2021 15:24:43 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'ret' is know to be >=0 a this point. Checking the return value of
'mipi_dsi_dcs_enter_sleep_mode()' was intended instead.

So add the missing assignment.

Fixes: 6ea4383b9214 ("drm/panel: add panel driver for Leadtek LTK050H3146W")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index ed0d5f959037..6044703df1a7 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -450,7 +450,7 @@ static int ltk050h3146w_unprepare(struct drm_panel *panel)
 		return ret;
 	}
 
-	mipi_dsi_dcs_enter_sleep_mode(dsi);
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
 	if (ret < 0) {
 		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
 		return ret;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
