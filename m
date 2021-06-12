Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 559613A4E87
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jun 2021 14:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD1E6E157;
	Sat, 12 Jun 2021 12:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CDC6E101;
 Sat, 12 Jun 2021 12:09:08 +0000 (UTC)
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 12 Jun 2021 05:09:09 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 12 Jun 2021 05:09:07 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg02-blr.qualcomm.com with ESMTP; 12 Jun 2021 17:38:40 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 3F25221465; Sat, 12 Jun 2021 17:38:39 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v6 3/5] drm/panel-simple: Support for delays between GPIO & regulator
Date: Sat, 12 Jun 2021 17:38:00 +0530
Message-Id: <1623499682-2140-4-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623499682-2140-1-git-send-email-rajeevny@codeaurora.org>
References: <1623499682-2140-1-git-send-email-rajeevny@codeaurora.org>
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
Cc: daniel.thompson@linaro.org, Rajeev Nandan <rajeevny@codeaurora.org>,
 mkrishn@codeaurora.org, jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, dianders@chromium.org, a.hajda@samsung.com,
 thierry.reding@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, kalyan_t@codeaurora.org,
 hoegsberg@chromium.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some panels datasheets may specify a delay between the enable GPIO and
the regulator. Support this in panel-simple.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- New

Changes in v5:
- Update description (Douglas)
- Warn if "power_to_enable" or "disable_to_power_off" is non-zero and panel->enable_gpio
  is NULL (Douglas)

Changes in v6:
- Update warning message to make it more meaningful. (Douglas)

 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 26555ec..86e5a45 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -133,6 +133,22 @@ struct panel_desc {
 		unsigned int prepare_to_enable;
 
 		/**
+		 * @delay.power_to_enable: Time for the power to enable the display on.
+		 *
+		 * The time (in milliseconds) to wait after powering up the display
+		 * before asserting its enable pin.
+		 */
+		unsigned int power_to_enable;
+
+		/**
+		 * @delay.disable_to_power_off: Time for the disable to power the display off.
+		 *
+		 * The time (in milliseconds) to wait before powering off the display
+		 * after deasserting its enable pin.
+		 */
+		unsigned int disable_to_power_off;
+
+		/**
 		 * @delay.enable: Time for the panel to display a valid frame.
 		 *
 		 * The time (in milliseconds) that it takes for the panel to
@@ -347,6 +363,10 @@ static int panel_simple_suspend(struct device *dev)
 	struct panel_simple *p = dev_get_drvdata(dev);
 
 	gpiod_set_value_cansleep(p->enable_gpio, 0);
+
+	if (p->desc->delay.disable_to_power_off)
+		msleep(p->desc->delay.disable_to_power_off);
+
 	regulator_disable(p->supply);
 	p->unprepared_time = ktime_get();
 
@@ -407,6 +427,9 @@ static int panel_simple_prepare_once(struct panel_simple *p)
 		return err;
 	}
 
+	if (p->desc->delay.power_to_enable)
+		msleep(p->desc->delay.power_to_enable);
+
 	gpiod_set_value_cansleep(p->enable_gpio, 1);
 
 	delay = p->desc->delay.prepare;
@@ -782,6 +805,11 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 		break;
 	}
 
+	if (!panel->enable_gpio && desc->delay.disable_to_power_off)
+		dev_warn(dev, "Need a delay after disabling panel GPIO, but a GPIO wasn't provided\n");
+	if (!panel->enable_gpio && desc->delay.power_to_enable)
+		dev_warn(dev, "Need a delay before enabling panel GPIO, but a GPIO wasn't provided\n");
+
 	dev_set_drvdata(dev, panel);
 
 	/*
-- 
2.7.4

