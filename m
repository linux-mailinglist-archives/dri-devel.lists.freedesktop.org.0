Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2863A4281A5
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 16:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C29D6E30C;
	Sun, 10 Oct 2021 14:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp13.smtpout.orange.fr
 [80.12.242.135])
 by gabe.freedesktop.org (Postfix) with ESMTP id D75486E328
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 14:07:50 +0000 (UTC)
Received: from pop-os.home ([90.126.248.220]) by mwinf5d78 with ME
 id 4E0F260064m3Hzu03E0Fup; Sun, 10 Oct 2021 16:00:18 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 10 Oct 2021 16:00:18 +0200
X-ME-IP: 90.126.248.220
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robdclark@gmail.com, sean@poorly.run, jyri.sarha@iki.fi, tomba@kernel.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm: Remove redundant 'flush_workqueue()' calls
Date: Sun, 10 Oct 2021 15:59:40 +0200
Message-Id: <75e8ba40076ad707d47e3a3670e6b23c1b8b11bc.1633874223.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
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

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

This was generated with coccinelle:

@@
expression E;
@@
- 	flush_workqueue(E);
	destroy_workqueue(E);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 1 -
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 1 -
 drivers/gpu/drm/msm/edp/edp_ctrl.c    | 1 -
 drivers/gpu/drm/msm/hdmi/hdmi.c       | 4 +---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c   | 4 +---
 drivers/gpu/drm/vmwgfx/ttm_memory.c   | 1 -
 6 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 789acae37f55..06bde46df451 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1733,7 +1733,6 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
 
 	DBG("%s", dev_name(gpu->dev));
 
-	flush_workqueue(gpu->wq);
 	destroy_workqueue(gpu->wq);
 
 	etnaviv_sched_fini(gpu);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c86b5090fae6..462ea65ebf89 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1925,7 +1925,6 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
 	DBG("");
 	dsi_tx_buf_free(msm_host);
 	if (msm_host->workqueue) {
-		flush_workqueue(msm_host->workqueue);
 		destroy_workqueue(msm_host->workqueue);
 		msm_host->workqueue = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
index fe1366b4c49f..07129a6e5dbb 100644
--- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
+++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
@@ -1190,7 +1190,6 @@ void msm_edp_ctrl_destroy(struct edp_ctrl *ctrl)
 		return;
 
 	if (ctrl->workqueue) {
-		flush_workqueue(ctrl->workqueue);
 		destroy_workqueue(ctrl->workqueue);
 		ctrl->workqueue = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 737453b6e596..5ba7c8f28419 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -61,10 +61,8 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
 	 * at this point, hpd has been disabled,
 	 * after flush workq, it's safe to deinit hdcp
 	 */
-	if (hdmi->workq) {
-		flush_workqueue(hdmi->workq);
+	if (hdmi->workq)
 		destroy_workqueue(hdmi->workq);
-	}
 	msm_hdmi_hdcp_destroy(hdmi);
 
 	if (hdmi->phy_dev) {
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 6b03f89a98d4..3ddb7c710a3d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -186,10 +186,8 @@ static void tilcdc_fini(struct drm_device *dev)
 	if (priv->mmio)
 		iounmap(priv->mmio);
 
-	if (priv->wq) {
-		flush_workqueue(priv->wq);
+	if (priv->wq)
 		destroy_workqueue(priv->wq);
-	}
 
 	dev->dev_private = NULL;
 
diff --git a/drivers/gpu/drm/vmwgfx/ttm_memory.c b/drivers/gpu/drm/vmwgfx/ttm_memory.c
index edd17c30d5a5..7f7fe35fc21d 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_memory.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_memory.c
@@ -468,7 +468,6 @@ void ttm_mem_global_release(struct ttm_mem_global *glob)
 	struct ttm_mem_zone *zone;
 	unsigned int i;
 
-	flush_workqueue(glob->swap_queue);
 	destroy_workqueue(glob->swap_queue);
 	glob->swap_queue = NULL;
 	for (i = 0; i < glob->num_zones; ++i) {
-- 
2.30.2

