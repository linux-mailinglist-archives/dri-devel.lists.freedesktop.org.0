Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA7261FC04
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D3110E890;
	Mon,  7 Nov 2022 17:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7982A10E887
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667843585; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+z/oCmrgfNuhQAhzbfugeqmZ78ZoFecrDmP1bKTWk8=;
 b=KGHwj+jfA9G1xuTz36ToXIS3vucb81msxxeXvGUuUDbCqzZpRaWO38q8EHhxyQMFS8Whtj
 kUn1E8HBKyQnQijAKkoDIPjncRg1DpWtjlWQMERSwipljUQbnOEvSJ1s4tvHnQGMayp0eO
 iFcKtqwLpYC/EhxDdm9u44rF7VN6IJM=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 11/26] drm: bridge/dw-hdmi: Remove #ifdef guards for PM
 related functions
Date: Mon,  7 Nov 2022 17:52:41 +0000
Message-Id: <20221107175256.360839-1-paul@crapouillou.net>
In-Reply-To: <20221107175106.360578-1-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to handle
the .suspend/.resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

The #ifdef IS_NOT_BROKEN guard was also changed to a
IS_ENABLED(IS_NOT_BROKEN) check within the PM functions.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Note:
 Checkpatch complains as I replaced a "#if defined(IS_NOT_BROKEN)"
 to a "if (IS_ENABLED(IS_NOT_BROKEN))".
 I don't really know how to make it better so I left it like that.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index 4efb62bcdb63..2ae231af7e4b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -593,7 +593,6 @@ static int snd_dw_hdmi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#if defined(CONFIG_PM_SLEEP) && defined(IS_NOT_BROKEN)
 /*
  * This code is fine, but requires implementation in the dw_hdmi_trigger()
  * method which is currently missing as I have no way to test this.
@@ -602,7 +601,8 @@ static int snd_dw_hdmi_suspend(struct device *dev)
 {
 	struct snd_dw_hdmi *dw = dev_get_drvdata(dev);
 
-	snd_power_change_state(dw->card, SNDRV_CTL_POWER_D3cold);
+	if (IS_ENABLED(IS_NOT_BROKEN))
+		snd_power_change_state(dw->card, SNDRV_CTL_POWER_D3cold);
 
 	return 0;
 }
@@ -611,24 +611,21 @@ static int snd_dw_hdmi_resume(struct device *dev)
 {
 	struct snd_dw_hdmi *dw = dev_get_drvdata(dev);
 
-	snd_power_change_state(dw->card, SNDRV_CTL_POWER_D0);
+	if (IS_ENABLED(IS_NOT_BROKEN))
+		snd_power_change_state(dw->card, SNDRV_CTL_POWER_D0);
 
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(snd_dw_hdmi_pm, snd_dw_hdmi_suspend,
-			 snd_dw_hdmi_resume);
-#define PM_OPS &snd_dw_hdmi_pm
-#else
-#define PM_OPS NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_dw_hdmi_pm_ops, snd_dw_hdmi_suspend,
+				snd_dw_hdmi_resume);
 
 static struct platform_driver snd_dw_hdmi_driver = {
 	.probe	= snd_dw_hdmi_probe,
 	.remove	= snd_dw_hdmi_remove,
 	.driver	= {
 		.name = DRIVER_NAME,
-		.pm = PM_OPS,
+		.pm = pm_sleep_ptr(&snd_dw_hdmi_pm_ops),
 	},
 };
 
-- 
2.35.1

