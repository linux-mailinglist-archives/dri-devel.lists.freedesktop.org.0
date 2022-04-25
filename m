Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BE850D77F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 05:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8624E10E5B4;
	Mon, 25 Apr 2022 03:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC44910E5B4;
 Mon, 25 Apr 2022 03:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650857232; x=1682393232;
 h=from:to:cc:subject:date:message-id;
 bh=YjOcgIOFXyRnwECVbo7xYwtnF1RAoHpr1cKLFYwgHuA=;
 b=fcDVdDpI2jjjtmSVq9sH1GKF7KwWrK3e1bPXrjlo5XpHXD0F2WUyOUuE
 Y3+ms09O6hgJLkPWgUusegJ4stwhl4y4Dpy+4n/2ijMa3eBKX1/9d62nJ
 6sme/Yw3rtP1Lu9bgbFDBE44ci7vQ0XN1rCs8CA6Wc0YESPEfjDnrNu6p 0=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 24 Apr 2022 20:27:11 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 24 Apr 2022 20:27:10 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 25 Apr 2022 08:56:56 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 0A71255BD; Mon, 25 Apr 2022 08:56:55 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH] drm/msm/disp/dpu1: set vbif hw config to NULL to avoid use
 after memory free during pm runtime resume
Date: Mon, 25 Apr 2022 08:56:53 +0530
Message-Id: <1650857213-30075-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BUG: Unable to handle kernel paging request at virtual address 006b6b6b6b6b6be3

Call trace:
  dpu_vbif_init_memtypes+0x40/0xb8
  dpu_runtime_resume+0xcc/0x1c0
  pm_generic_runtime_resume+0x30/0x44
  __genpd_runtime_resume+0x68/0x7c
  genpd_runtime_resume+0x134/0x258
  __rpm_callback+0x98/0x138
  rpm_callback+0x30/0x88
  rpm_resume+0x36c/0x49c
  __pm_runtime_resume+0x80/0xb0
  dpu_core_irq_uninstall+0x30/0xb0
  dpu_irq_uninstall+0x18/0x24
  msm_drm_uninit+0xd8/0x16c

Fixes: 25fdd5933e4 ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 9c346ce..59982d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -793,8 +793,10 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 		for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
 			u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
 
-			if ((vbif_idx < VBIF_MAX) && dpu_kms->hw_vbif[vbif_idx])
+			if ((vbif_idx < VBIF_MAX) && dpu_kms->hw_vbif[vbif_idx]) {
 				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[vbif_idx]);
+				dpu_kms->hw_vbif[vbif_idx] = NULL;
+			}
 		}
 	}
 
-- 
2.7.4

