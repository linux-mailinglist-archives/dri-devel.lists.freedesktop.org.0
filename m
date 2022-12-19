Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A887651214
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 19:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D9810E00C;
	Mon, 19 Dec 2022 18:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56BA10E00C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 18:34:09 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p7KvY-0005ab-HI; Mon, 19 Dec 2022 19:31:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p7KvW-000OnX-DQ; Mon, 19 Dec 2022 19:31:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p7KvV-006OwU-HL; Mon, 19 Dec 2022 19:31:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/drv: Make use of local variable driver in
 drm_dev_register()
Date: Mon, 19 Dec 2022 19:31:47 +0100
Message-Id: <20221219183147.1639399-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=4EHdyiCOiow/TXEEMfdCxhYadgOyM565KTE63jHV8H0=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjoK4Q2Y3gKrJ7Eb/EId58j8jfsVw2fw0lfDJWaDOa
 DdR9LFyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY6CuEAAKCRDB/BR4rcrsCd9wB/
 9NvrEEWi4JpVvHohFl79vVBuv5gAnBq8zY1lNhEf3WM9/wY5b08a9wYVk/6W3LDigutvH1qNlYkSpw
 mYZ/RAroFsSSRDGiwvPBj0u66oMFbz3uCte2SJyKoD12HxW7bZmldd1LwGIuXG+C+oUrEMoZ+HS57+
 PKDd8AC9HLMA1L5GO5r13U7UiIgZGptfsUJ4kp3VxY/Eh7KyjD3kEqxmA7xJ76HefjXfYRhCMGcQHq
 pPGCsdzE3er4P1aElpEXSP1qFhuyfq0P4DwZaXQSbVw7XGf0ki0EP3/YNYe56K5YfyMYblN01vOa9l
 4th5Ow81u3s8+AskDZDNikOFWhRixd
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a local variable that contains dev->driver. Make use of it
instead of "open coding" it.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 203bf8d6c34c..3cc8e8111d16 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -889,8 +889,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 
 	dev->registered = true;
 
-	if (dev->driver->load) {
-		ret = dev->driver->load(dev, flags);
+	if (driver->load) {
+		ret = driver->load(dev, flags);
 		if (ret)
 			goto err_minors;
 	}

base-commit: 678e5b2258e871b22fe8c26edac2723feb852a47
-- 
2.38.1

