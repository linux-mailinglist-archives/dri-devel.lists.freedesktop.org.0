Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F844824B0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 17:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9127089F97;
	Fri, 31 Dec 2021 16:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DC289F97
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 16:01:13 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E9EBA80202;
 Fri, 31 Dec 2021 17:01:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1640966471;
 bh=2/iZK3mfDTOMfSaH5KM+mN14InKkAvZy0x7AARFNpHc=;
 h=From:To:Cc:Subject:Date:From;
 b=0K8K0JFaiwEP7i/VUjx6cqRqGHnP9Mf1SN74b62itCTe6HegEEAivuRDcx1dPdyrQ
 xAm1iJFS3+efxxH9XWysS3ThrhciNR+RXQNtfumplNn9MbhlkQb3YTEyVJwNUK4yPl
 RBcYn+tHSj1vJcDOop6fCQJ4AmCvR3TpdrjhMHn1AzH6B3xZUcGnlvYq/y5halD1bB
 nQungfM/JxNck3Hxvcl1OyeGUkB4wPaWsuUecldNdiE5RX690Z/lA7/1h7oLoGMt2F
 QdRLB2uPkqkAX/renxRmpLVr9z0Clu1ph2bs806JVVKDx23joK2Fp8BK1DFeYrJBvJ
 LSOalJ1O/aFoA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: mxsfb: Shutdown the display on remove
Date: Fri, 31 Dec 2021 17:00:56 +0100
Message-Id: <20211231160056.302276-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the device is unbound from the driver, the display may be active.
Make sure it gets shut down.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 86d78634a9799..6d7a3aeff50b0 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -374,6 +374,7 @@ static int mxsfb_remove(struct platform_device *pdev)
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
 	drm_dev_unregister(drm);
+	drm_atomic_helper_shutdown(drm);
 	mxsfb_unload(drm);
 	drm_dev_put(drm);
 
-- 
2.34.1

