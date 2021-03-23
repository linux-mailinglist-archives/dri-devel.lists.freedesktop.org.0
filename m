Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA83034544C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 01:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B406E817;
	Tue, 23 Mar 2021 00:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BC26E808
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:57:08 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57CCA8F0;
 Tue, 23 Mar 2021 01:57:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616461026;
 bh=cxNXwLl1bpW8Kb5Kd6WkWoYN/NfLRBADz7YLk2AsHdI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m3QRNi4SKs1yaisOlk/sPwFgobMxHmI0jGCNEeurqeXtBjYdAR9G9f8PQPJ+WBKIE
 qcZ4aze8Oo7SY4kBReEjSwt2EifgWfrkcGDHSdXILUQ8X6wTtamOaB5GKUTLQ0hobZ
 i4UVT4SwJho4Oi/oQ6u8oKLPVpkroPRIcvSXlLvM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: rcar-du: Shutdown the display on remove
Date: Tue, 23 Mar 2021 02:56:16 +0200
Message-Id: <20210323005616.20110-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210323005616.20110-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210323005616.20110-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the device is unbound from the driver (the DU being a platform
device, this occurs either when removing the DU module, or when
unbinding the device manually through sysfs), the display may be active.
Make sure it gets shut down.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 2a06ec1cbefb..9f1a3aad4dd7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -553,6 +553,7 @@ static int rcar_du_remove(struct platform_device *pdev)
 	struct drm_device *ddev = &rcdu->ddev;
 
 	drm_dev_unregister(ddev);
+	drm_atomic_helper_shutdown(ddev);
 
 	drm_kms_helper_poll_fini(ddev);
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
