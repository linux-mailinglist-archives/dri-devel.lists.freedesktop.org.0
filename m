Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F453C7C2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 11:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F4B112BA4;
	Fri,  3 Jun 2022 09:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C56112B35;
 Fri,  3 Jun 2022 09:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654249361; x=1685785361;
 h=from:to:cc:subject:date:message-id;
 bh=h1ycCMU/KenX12jnDfFrZf+jaTNtbm+BdV0bwumh8A0=;
 b=dAcWIW1OQEYgl3O3zsHwthBhpsFWNKb4LuKmVWV3+S7H7SNZd+e3oVLI
 A4bPl1vE5pKXWctVi5QVUrnkhohE2CR7xjhdzFOBk+N8Gi54qE56NIM3F
 v1Fbzd+vpvdIHkLcXo4ZrCA7dKUR9FQLIaT04t/e5A3xoqU62hcpeFUiT U=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 03 Jun 2022 02:42:41 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 03 Jun 2022 02:42:39 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 03 Jun 2022 15:12:27 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 431113A4E; Fri,  3 Jun 2022 15:12:25 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v2] drm/msm: add null checks for drm device to avoid crash during
 probe defer
Date: Fri,  3 Jun 2022 15:12:23 +0530
Message-Id: <1654249343-24959-1-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
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
Cc: vpolimer@quicinc.com, dianders@chromium.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, kalyant@quicinc.com,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During probe defer, drm device is not initialized and an external
trigger to shutdown is trying to clean up drm device leading to crash.
Add checks to avoid drm device cleanup in such cases.

BUG: unable to handle kernel NULL pointer dereference at virtual
address 00000000000000b8

Call trace:

drm_atomic_helper_shutdown+0x44/0x144
msm_pdev_shutdown+0x2c/0x38
platform_shutdown+0x2c/0x38
device_shutdown+0x158/0x210
kernel_restart_prepare+0x40/0x4c
kernel_restart+0x20/0x6c
__arm64_sys_reboot+0x194/0x23c
invoke_syscall+0x50/0x13c
el0_svc_common+0xa0/0x17c
do_el0_svc_compat+0x28/0x34
el0_svc_compat+0x20/0x70
el0t_32_sync_handler+0xa8/0xcc
el0t_32_sync+0x1a8/0x1ac

Changes in v2:
- Add fixes tag.

Fixes: 623f279c778 ("drm/msm: fix shutdown hook in case GPU components failed to bind")
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4448536..d62ac66 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -142,6 +142,9 @@ static void msm_irq_uninstall(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 
+	if (!irq_has_action(kms->irq))
+		return;
+
 	kms->funcs->irq_uninstall(kms);
 	if (kms->irq_requested)
 		free_irq(kms->irq, dev);
@@ -259,6 +262,7 @@ static int msm_drm_uninit(struct device *dev)
 
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
+	priv->dev = NULL;
 
 	destroy_workqueue(priv->wq);
 
@@ -1167,7 +1171,7 @@ void msm_drv_shutdown(struct platform_device *pdev)
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *drm = priv ? priv->dev : NULL;
 
-	if (!priv || !priv->kms)
+	if (!priv || !priv->kms || !drm)
 		return;
 
 	drm_atomic_helper_shutdown(drm);
-- 
2.7.4

