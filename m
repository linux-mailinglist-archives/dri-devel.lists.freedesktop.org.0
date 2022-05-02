Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 388E05174C8
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61D410F0EE;
	Mon,  2 May 2022 16:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E679110F0E4;
 Mon,  2 May 2022 16:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651509883; x=1683045883;
 h=from:to:cc:subject:date:message-id;
 bh=/hBP51dakvyFvptK3SaVoqwhUb9b+sUY7FBEgdyP/G0=;
 b=hyPm767w2Y6qJH/Q7FTsMJK1LB4mEBeX5HVhp+DL0BUq34mzquY69SiZ
 V7m90xKJwq8exLjXVZ6rLb1sIs/hyFXD3DKLA/nMipn84yXJWvqNclD0Y
 c3agREp+YRM/fCGXVH7f8jLsreNxEU3VYW651gxcJ0yYi7qS9uee/0i2n c=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 02 May 2022 09:44:42 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 02 May 2022 09:44:25 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 02 May 2022 22:14:11 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 8727E28A6; Mon,  2 May 2022 22:14:09 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2] drm/msm/disp/dpu1: avoid clearing hw interrupts if hw_intr
 is null during drm uninit
Date: Mon,  2 May 2022 22:14:06 +0530
Message-Id: <1651509846-4842-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_abhinavk@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If edp modeset init is failed due to panel being not ready and
probe defers during drm bind, avoid clearing irqs and derefernce
hw_intr when hw_intr is null.

BUG: Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000

Call trace:
 dpu_core_irq_uninstall+0x50/0xb0
 dpu_irq_uninstall+0x18/0x24
 msm_drm_uninit+0xd8/0x16c
 msm_drm_bind+0x580/0x5fc
 try_to_bring_up_master+0x168/0x1c0
 __component_add+0xb4/0x178
 component_add+0x1c/0x28
 dp_display_probe+0x38c/0x400
 platform_probe+0xb0/0xd0
 really_probe+0xcc/0x2c8
 __driver_probe_device+0xbc/0xe8
 driver_probe_device+0x48/0xf0
 __device_attach_driver+0xa0/0xc8
 bus_for_each_drv+0x8c/0xd8
 __device_attach+0xc4/0x150
 device_initial_probe+0x1c/0x28

Changes in V2:
- Update commit message and coreect fixes tag.

Fixes: f25f656608e3 ("drm/msm/dpu: merge struct dpu_irq into struct dpu_hw_intr")
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index c515b7c..ab28577 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -599,6 +599,9 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
 {
 	int i;
 
+	if (!dpu_kms->hw_intr)
+		return;
+
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
 		if (!list_empty(&dpu_kms->hw_intr->irq_cb_tbl[i]))
-- 
2.7.4

