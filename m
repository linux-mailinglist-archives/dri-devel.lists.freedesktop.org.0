Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A7A6B903
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 11:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A23910E036;
	Fri, 21 Mar 2025 10:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MjoP/Xji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93FB10E036
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 10:46:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [157.231.223.213])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAB37F6;
 Fri, 21 Mar 2025 11:44:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742553895;
 bh=zgkx+mvkOnrCh2pBOwwEUvScJTGSdLxt/O+zjzEmDi0=;
 h=From:To:Cc:Subject:Date:From;
 b=MjoP/XjihxRO1BSEk4Me9n1B1T6TiQ+e76KkqhTsiOQCNUs6TvQFgbH7Tiqi/OmmO
 IkJAw0UUCISQ0SpmURwV4q1BRApix4mERyddqmJUehpVDAU7d2w7wJdOPfMRyLbaGl
 NDMABlx1PKKVKuoe4ayacehrX213yuJS1xpnekZI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] drm: renesas: rz-du: Support dmabuf import
Date: Fri, 21 Mar 2025 12:46:15 +0200
Message-ID: <20250321104615.31809-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.48.1
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

The rz-du driver uses GEM DMA helpers, but does not implement the
drm_driver .gem_prime_import_sg_table operation. This  prevents
importing dmabufs. Fix it by implementing the missing operation using
the DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE() helper macro.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Kieran, would you be able to test this ?
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index cbd9b9841267..5e40f0c1e7b0 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -79,7 +79,7 @@ DEFINE_DRM_GEM_DMA_FOPS(rzg2l_du_fops);
 
 static const struct drm_driver rzg2l_du_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	.dumb_create		= rzg2l_du_dumb_create,
+	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(rzg2l_du_dumb_create),
 	DRM_FBDEV_DMA_DRIVER_OPS,
 	.fops			= &rzg2l_du_fops,
 	.name			= "rzg2l-du",

base-commit: 9e75b6ef407fee5d4ed8021cd7ddd9d6a8f7b0e8
-- 
Regards,

Laurent Pinchart

