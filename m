Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E12354CD7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 08:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2860B6E5CA;
	Tue,  6 Apr 2021 06:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C3589856;
 Tue,  6 Apr 2021 05:10:22 +0000 (UTC)
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 22:10:22 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Apr 2021 22:10:21 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 06 Apr 2021 10:40:07 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 90E7C21B31; Tue,  6 Apr 2021 10:40:05 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v1 2/4] drm/msm/disp/dpu1: add intf offsets for SC7280 target
Date: Tue,  6 Apr 2021 10:39:50 +0530
Message-Id: <1617685792-14376-3-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617685792-14376-1-git-send-email-mkrishn@codeaurora.org>
References: <1617685792-14376-1-git-send-email-mkrishn@codeaurora.org>
X-Mailman-Approved-At: Tue, 06 Apr 2021 06:25:33 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Interface block offsets are different for SC7280 family
when compared to existing targets. These offset values
are used to access the interface irq registers. This
change adds proper interface offsets for SC7280 target.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5c521de..c289b7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -25,6 +25,9 @@
 #define MDP_AD4_INTR_EN_OFF		0x41c
 #define MDP_AD4_INTR_CLEAR_OFF		0x424
 #define MDP_AD4_INTR_STATUS_OFF		0x420
+#define MDP_INTF_0_OFF_REV_7xxx             0x34000
+#define MDP_INTF_1_OFF_REV_7xxx             0x35000
+#define MDP_INTF_5_OFF_REV_7xxx             0x39000
 
 /**
  * WB interrupt status bit definitions
@@ -242,7 +245,22 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 		MDP_AD4_1_OFF + MDP_AD4_INTR_CLEAR_OFF,
 		MDP_AD4_1_OFF + MDP_AD4_INTR_EN_OFF,
 		MDP_AD4_1_OFF + MDP_AD4_INTR_STATUS_OFF,
-	}
+	},
+	{
+		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_CLEAR,
+		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_EN,
+		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_STATUS
+	},
+	{
+		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_CLEAR,
+		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_EN,
+		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_STATUS
+	},
+	{
+		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_CLEAR,
+		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
+		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_STATUS
+	},
 };
 
 /*
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
