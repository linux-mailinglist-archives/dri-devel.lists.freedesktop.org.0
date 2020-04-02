Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A6B19BEEE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 11:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E436EA38;
	Thu,  2 Apr 2020 09:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC156EA33
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 09:53:36 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CC9F80E;
 Thu,  2 Apr 2020 11:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1585821215;
 bh=tDuoun2j+1h5NtCFxtfhisJohP5EPRywtUTzUnFzhQ8=;
 h=From:To:Cc:Subject:Date:From;
 b=uXXinP3YfQbIqSZ6TY1WbeA7OyCbl5lKajTIInDKB+ycWc9GlhEdkjPzvJRrxir+A
 d1z57nvzr4/9DdtoZUckhoK0U7YKxdEMS5Qrjix1ZUPFL/twNKzamg3RNxW2GoHAOM
 uwJ9jJgBaxaXEXzGNYrIS8FzoyWyru+DthwJJ2eo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Fix wrong kfree() in managed resource usage example
Date: Thu,  2 Apr 2020 12:53:25 +0300
Message-Id: <20200402095325.5266-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The example code showing how to use the managed resource API calls
kfree() on the wrong pointer. Fix it.

Fixes: d33b58d0115e ("drm: Garbage collect drm_dev_fini")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7dad7813fca1..c15c9b4540e1 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -305,7 +305,7 @@ void drm_minor_release(struct drm_minor *minor)
  *
  *		ret = devm_drm_dev_init(&pdev->dev, drm, &driver_drm_driver);
  *		if (ret) {
- *			kfree(drm);
+ *			kfree(priv);
  *			return ret;
  *		}
  *		drmm_add_final_kfree(drm, priv);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
