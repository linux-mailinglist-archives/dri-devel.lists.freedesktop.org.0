Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 254715A697A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5473610E23D;
	Tue, 30 Aug 2022 17:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1697810E22E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 17:18:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8592661775;
 Tue, 30 Aug 2022 17:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5EFBC433D6;
 Tue, 30 Aug 2022 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661879917;
 bh=lPDqattntsJEG0XxXrX717mGqdP6yGADrTYv2gqoSd4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RTLeqDhq1ypKkDalE9A9AeABAdPnkaem42lcIsFuyVpSQc70+pr3IQtHH7DAuuC00
 7U8UAbdxgIRGzvoF5aXV7hTMu62+pEOMvAnHHXG7DTVUFNNXRDUuWsXV2nFxGNX/Qf
 fUQxnAX9Del4nKioxbjTZG5lia1nY6ywbuhCYCR0iJVNh4b1jo549TYENolNG9jtE+
 1Piuq2ayWVS+fuo0wMunA46wdH2FRk/xgw4cwcbFSsP9n2U6Z2RGOfGLoNA6i74qys
 W53VnbA8V06c1lAxZ/BQW4B3YtUfiZ7UjRLi1Pm6H2O/enbX30MBOFe70IXb3gC1rT
 CIiKddBoA2NBA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 06/33] drm/vc4: hdmi: Rework power up
Date: Tue, 30 Aug 2022 13:17:57 -0400
Message-Id: <20220830171825.580603-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830171825.580603-1-sashal@kernel.org>
References: <20220830171825.580603-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Sasha Levin <sashal@kernel.org>,
 emma@anholt.net, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxime Ripard <maxime@cerno.tech>

[ Upstream commit 258e483a4d5e97a6a8caa74381ddc1f395ac1c71 ]

The current code tries to handle the case where CONFIG_PM isn't selected
by first calling our runtime_resume implementation and then properly
report the power state to the runtime_pm core.

This allows to have a functionning device even if pm_runtime_get_*
functions are nops.

However, the device power state if CONFIG_PM is enabled is
RPM_SUSPENDED, and thus our vc4_hdmi_write() and vc4_hdmi_read() calls
in the runtime_pm hooks will now report a warning since the device might
not be properly powered.

Even more so, we need CONFIG_PM enabled since the previous RaspberryPi
have a power domain that needs to be powered up for the HDMI controller
to be usable.

The previous patch has created a dependency on CONFIG_PM, now we can
just assume it's there and only call pm_runtime_resume_and_get() to make
sure our device is powered in bind.

Link: https://lore.kernel.org/r/20220629123510.1915022-39-maxime@cerno.tech
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
(cherry picked from commit 53565c28e6af2cef6bbf438c34250135e3564459)
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index c5702f22fe1a8..199bc398817fa 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2992,17 +2992,15 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			vc4_hdmi->disable_4kp60 = true;
 	}
 
+	pm_runtime_enable(dev);
+
 	/*
-	 * We need to have the device powered up at this point to call
-	 * our reset hook and for the CEC init.
+	 *  We need to have the device powered up at this point to call
+	 *  our reset hook and for the CEC init.
 	 */
-	ret = vc4_hdmi_runtime_resume(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-		goto err_put_ddc;
-
-	pm_runtime_get_noresume(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_disable_runtime_pm;
 
 	if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi0") ||
 	     of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi1")) &&
@@ -3048,6 +3046,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 err_destroy_encoder:
 	drm_encoder_cleanup(encoder);
 	pm_runtime_put_sync(dev);
+err_disable_runtime_pm:
 	pm_runtime_disable(dev);
 err_put_ddc:
 	put_device(&vc4_hdmi->ddc->dev);
-- 
2.35.1

