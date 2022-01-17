Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3A1491000
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 19:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978CB10F62E;
	Mon, 17 Jan 2022 18:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7CE10F62E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 18:04:04 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id E9AFB2803BE;
 Mon, 17 Jan 2022 18:04:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1642442643; bh=33eQEETxfERBMS7qtT+2wI7RlDlwhQOJPaA8rO+sDYw=;
 h=From:To:Cc:Subject:Date:From;
 b=Mjhjhu/r3cFlAQsKztuxXBoIlu2wxQHROCV5M/mIM7DQstTk0rz+4T7ZZzBj7oOZm
 zpXBRtebFNIuZ38jC9eyBWD92dKIcl9JQMZImC1ZFT6snMxgi+qZXe17CLfaIJwHIN
 h040F++kyAC05uVoYCCj7bmk9tHtyVVZ0IjqPhACnJbe0N4aOYHDxxe1ukYLjmR3mo
 Tm9JeC25WKNfUWVft9QJJ6EgbQq5REeyp9hxwy4r+ykpqIM4r8iMLigP3m7d54aDlV
 E8p2/Qp7hcKdtrswhGj/htWouFZqrNc+fpO/23Z5v+KGtl3GX+Zn3AvbyqpHYpWTXZ
 m69e6WYJ6SCtg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Stop requesting the pci regions
Date: Mon, 17 Jan 2022 13:03:59 -0500
Message-Id: <20220117180359.18114-1-zack@kde.org>
X-Mailer: git-send-email 2.32.0
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, stable@vger.kernel.org, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

When sysfb_simple is enabled loading vmwgfx fails because the regions
are held by the platform. In that case remove_conflicting*_framebuffers
only removes the simplefb but not the regions held by sysfb.

Like the other drm drivers we need to stop requesting all the pci regions
to let the driver load with platform code enabled.
This allows vmwgfx to load correctly on systems with sysfb_simple enabled.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: 523375c943e5 ("drm/vmwgfx: Port vmwgfx to arm64")
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index fe36efdb7ff5..27feb19f3324 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -724,10 +724,6 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 
 	pci_set_master(pdev);
 
-	ret = pci_request_regions(pdev, "vmwgfx probe");
-	if (ret)
-		return ret;
-
 	dev->pci_id = pci_id;
 	if (pci_id == VMWGFX_PCI_ID_SVGA3) {
 		rmmio_start = pci_resource_start(pdev, 0);
-- 
2.32.0

