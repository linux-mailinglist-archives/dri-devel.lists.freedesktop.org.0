Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71F18CE3B0
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 11:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C52310E232;
	Fri, 24 May 2024 09:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE7C10E15A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 09:25:50 +0000 (UTC)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <s.pueschel@pengutronix.de>)
 id 1sARBB-0007SY-J8; Fri, 24 May 2024 11:25:37 +0200
From: =?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>,
 =?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>
Subject: [PATCH] drm/rockchip: Set DMA max segment size
Date: Fri, 24 May 2024 11:23:59 +0200
Message-Id: <20240524092400.2019587-1-s.pueschel@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 24 May 2024 09:45:44 +0000
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

From: Michael Tretter <m.tretter@pengutronix.de>

There is no reason to limit the DMA max segment size for the Rockchip
VOP and VOP2. Set it to the maximum.

This prevents the following warning when DMA API debugging is enabled
with CONFIG_DMA_API_DEBUG_SG=y:

	DMA-API: rockchip-drm display-subsystem: mapping sg segment longer than device claims to support [len=208896] [max=65536]

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index ab55d7132550..0f93efd1a8fa 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -67,6 +67,8 @@ int rockchip_drm_dma_attach_device(struct drm_device *drm_dev,
 		}
 	}
 
+	dma_set_max_seg_size(drm_dev->dev, UINT_MAX);
+
 	ret = iommu_attach_device(private->domain, dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "Failed to attach iommu device\n");

base-commit: 39bc27bd688066a63e56f7f64ad34fae03fbe3b8
-- 
2.39.2

