Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A50F84FA6A4
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 12:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B65E10E2A0;
	Sat,  9 Apr 2022 10:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A35F10E2A0
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 10:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1649498423; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=A5PJEamvB/Q6ZdrsbhzIrxfL3V+SEu121g25tOfMR6k=;
 b=K0HGJxv37mBu5ndPyGax7E9gMrLHTdObUC76F2MRpH4+rdMGmFgkxSyrXr9KyoF2jV7e5X
 hzbkrhMbeW6m5Or/XLj/z0SmJbXHItUt+0fLyRC1SnfLMtV5F30+OH9KUcLhfv5WJJPbDw
 Pv9nsv+bcslHCLeYaR5Qm39g52ZuVI4=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/panel: newvision-nv3052c: Fix build
Date: Sat,  9 Apr 2022 11:00:16 +0100
Message-Id: <20220409100016.9337-1-paul@crapouillou.net>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 kbuild-all <kbuild-all@lists.01.org>, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver was compile-tested then rebased on drm-misc-next, and not
compile-tested after the rebase; unfortunately the driver didn't compile
anymore when it hit drm-misc-next.

Fixes: 49956b505c53 ("drm/panel: Add panel driver for NewVision NV3052C based LCDs")
Cc: Christophe Branchereau <cbranchereau@gmail.com>
Cc: kbuild-all <kbuild-all@lists.01.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index 127bcfdb59df..cf078f0d3cd3 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -416,15 +416,13 @@ static int nv3052c_probe(struct spi_device *spi)
 	return 0;
 }
 
-static int nv3052c_remove(struct spi_device *spi)
+static void nv3052c_remove(struct spi_device *spi)
 {
 	struct nv3052c *priv = spi_get_drvdata(spi);
 
 	drm_panel_remove(&priv->panel);
 	drm_panel_disable(&priv->panel);
 	drm_panel_unprepare(&priv->panel);
-
-	return 0;
 }
 
 static const struct drm_display_mode ltk035c5444t_modes[] = {
-- 
2.35.1

