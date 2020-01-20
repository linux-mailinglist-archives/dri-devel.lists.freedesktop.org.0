Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50846143092
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 18:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80DF6EA23;
	Mon, 20 Jan 2020 17:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D3E6EA1C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 17:06:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 28AD3291322
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/5] drm/rockchip: Fix the device unbind order
Date: Mon, 20 Jan 2020 14:05:59 -0300
Message-Id: <20200120170602.3832-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120170602.3832-1-ezequiel@collabora.com>
References: <20200120170602.3832-1-ezequiel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Jan 2020 17:09:27 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to cleanup the configuration, destroying the components
in the pipeline, the components must be present.

Therefore, cleanup the config first, and unbind the components
later.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 20ecb1508a22..ca12a35483f9 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -108,6 +108,11 @@ static void rockchip_iommu_cleanup(struct drm_device *drm_dev)
 	iommu_domain_free(private->domain);
 }
 
+static void unbind_cleanup(void *data)
+{
+	drm_mode_config_cleanup((struct drm_device *)data);
+}
+
 static int rockchip_drm_bind(struct device *dev)
 {
 	struct drm_device *drm_dev;
@@ -140,13 +145,13 @@ static int rockchip_drm_bind(struct device *dev)
 	rockchip_drm_mode_config_init(drm_dev);
 
 	/* Try to bind all sub drivers. */
-	ret = component_bind_all(dev, drm_dev);
+	ret = component_bind_all_or_cleanup(dev, drm_dev, unbind_cleanup);
 	if (ret)
-		goto err_mode_config_cleanup;
+		goto err_free;
 
 	ret = drm_vblank_init(drm_dev, drm_dev->mode_config.num_crtc);
 	if (ret)
-		goto err_unbind_all;
+		goto err_drm_cleanup;
 
 	drm_mode_config_reset(drm_dev);
 
@@ -158,7 +163,7 @@ static int rockchip_drm_bind(struct device *dev)
 
 	ret = rockchip_drm_fbdev_init(drm_dev);
 	if (ret)
-		goto err_unbind_all;
+		goto err_drm_cleanup;
 
 	/* init kms poll for handling hpd */
 	drm_kms_helper_poll_init(drm_dev);
@@ -171,10 +176,9 @@ static int rockchip_drm_bind(struct device *dev)
 err_kms_helper_poll_fini:
 	drm_kms_helper_poll_fini(drm_dev);
 	rockchip_drm_fbdev_fini(drm_dev);
-err_unbind_all:
-	component_unbind_all(dev, drm_dev);
-err_mode_config_cleanup:
+err_drm_cleanup:
 	drm_mode_config_cleanup(drm_dev);
+	component_unbind_all(dev, drm_dev);
 	rockchip_iommu_cleanup(drm_dev);
 err_free:
 	drm_dev->dev_private = NULL;
@@ -193,8 +197,8 @@ static void rockchip_drm_unbind(struct device *dev)
 	drm_kms_helper_poll_fini(drm_dev);
 
 	drm_atomic_helper_shutdown(drm_dev);
-	component_unbind_all(dev, drm_dev);
 	drm_mode_config_cleanup(drm_dev);
+	component_unbind_all(dev, drm_dev);
 	rockchip_iommu_cleanup(drm_dev);
 
 	drm_dev->dev_private = NULL;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
