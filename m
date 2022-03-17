Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FCB4DD103
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 00:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A18610E095;
	Thu, 17 Mar 2022 23:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 403 seconds by postgrey-1.36 at gabe;
 Thu, 17 Mar 2022 23:02:58 UTC
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by gabe.freedesktop.org (Postfix) with ESMTP id 383F410E098
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 23:02:58 +0000 (UTC)
Received: from hq-00021.fritz.box (p57bc9ac9.dip0.t-ipconnect.de
 [87.188.154.201])
 by mail.bugwerft.de (Postfix) with ESMTPSA id D569B502857;
 Thu, 17 Mar 2022 22:55:43 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: dillon.minfei@gmail.com,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Subject: [PATCH] drm/panel: ili9341: fix optional regulator handling
Date: Thu, 17 Mar 2022 23:55:37 +0100
Message-Id: <20220317225537.826302-1-daniel@zonque.org>
X-Mailer: git-send-email 2.35.1
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
Cc: airlied@linux.ie, Daniel Mack <daniel@zonque.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the optional regulator lookup fails, reset the pointer to NULL.
Other functions such as mipi_dbi_poweron_reset_conditional() only do
a NULL pointer check and will otherwise dereference the error pointer.

Fixes: 5a04227326b04c15 ("drm/panel: Add ilitek ili9341 panel driver")
Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 2c3378a259b1..e1542451ef9d 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -612,8 +612,10 @@ static int ili9341_dbi_probe(struct spi_device *spi, struct gpio_desc *dc,
 	int ret;
 
 	vcc = devm_regulator_get_optional(dev, "vcc");
-	if (IS_ERR(vcc))
+	if (IS_ERR(vcc)) {
 		dev_err(dev, "get optional vcc failed\n");
+		vcc = NULL;
+	}
 
 	dbidev = devm_drm_dev_alloc(dev, &ili9341_dbi_driver,
 				    struct mipi_dbi_dev, drm);
-- 
2.35.1

