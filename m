Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD312A59164
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 11:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D2D10E217;
	Mon, 10 Mar 2025 10:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="CD0Drn0Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m21471.qiye.163.com (mail-m21471.qiye.163.com
 [117.135.214.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B831410E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 10:42:01 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id dc18821c;
 Mon, 10 Mar 2025 18:41:54 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org,
 dianders@chromium.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com,
 l.stach@pengutronix.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v8 01/13] drm/bridge: analogix_dp: Add irq flag IRQF_NO_AUTOEN
 instead of calling disable_irq()
Date: Mon, 10 Mar 2025 18:41:02 +0800
Message-Id: <20250310104114.2608063-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310104114.2608063-1-damon.ding@rock-chips.com>
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0JJH1ZDQx5KH0tPTE1LT0xWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
 NVSktLVUpCWQY+
X-HM-Tid: 0a957fa59b2003a3kunmdc18821c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MhA6PCo6OTJCMiNOSj81PT1C
 K1YKChdVSlVKTE9KTUtISEpNTkhKVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTkNCNwY+
DKIM-Signature: a=rsa-sha256;
 b=CD0Drn0ZAsnZI1F2EtQ8+1DsVhJ5NdU/2kJ6OWoE0ztftqb828JW0L/7VV9PEJhbo98VDLbowO0FKOJFO+HHJnAmhrNPzxH8CvE5G27qtEjOItCpWjCd/Bc9/u8I6q5c+trV/weHnq2ED9XuMuJXlS6EDQFdBYC3n7K52uu8o/Y=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=wRX2UV7UIbMXXJUCACRskX22cpHmCmmZGazxoGSyC3I=;
 h=date:mime-version:subject:message-id:from;
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

The IRQF_NO_AUTOEN can be used for the drivers that don't want
interrupts to be enabled automatically via devm_request_threaded_irq().
Using this flag can provide be more robust compared to the way of
calling disable_irq() after devm_request_threaded_irq() without the
IRQF_NO_AUTOEN flag.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 817070613b03..5ef6bb6010ca 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1630,10 +1630,10 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		 * that we can get the current state of the GPIO.
 		 */
 		dp->irq = gpiod_to_irq(dp->hpd_gpiod);
-		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
+		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN;
 	} else {
 		dp->irq = platform_get_irq(pdev, 0);
-		irq_flags = 0;
+		irq_flags = IRQF_NO_AUTOEN;
 	}
 
 	if (dp->irq == -ENXIO) {
@@ -1649,7 +1649,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		dev_err(&pdev->dev, "failed to request irq\n");
 		return ERR_PTR(ret);
 	}
-	disable_irq(dp->irq);
 
 	return dp;
 }
-- 
2.34.1

