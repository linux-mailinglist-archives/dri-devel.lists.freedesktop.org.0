Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F17B438FBC9
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 09:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA806E9B8;
	Tue, 25 May 2021 07:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11696E9B2;
 Tue, 25 May 2021 07:31:31 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 25 May 2021 00:31:32 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 25 May 2021 00:31:30 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 25 May 2021 13:00:38 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 68E8D21467; Tue, 25 May 2021 13:00:37 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: y@qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [v4 2/4] drm/panel-simple: Support for delays between GPIO & regulator
Date: Tue, 25 May 2021 13:00:29 +0530
Message-Id: <1621927831-29471-3-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
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
---

Changes in v4:
- New

 drivers/gpu/drm/panel/panel-simple.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f9e4e60..caed71b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -134,6 +134,22 @@ struct panel_desc {
 		unsigned int prepare_to_enable;
 
 		/**
+		 * @delay.power_to_enable: Time for the power to enable the display on.
+		 *
+		 * The time (in milliseconds) that it takes for the panel to
+		 * turn the display on.
+		 */
+		unsigned int power_to_enable;
+
+		/**
+		 * @delay.disable_to_power_off: Time for the disable to power the display off.
+		 *
+		 * The time (in milliseconds) that it takes for the panel to
+		 * turn the display off.
+		 */
+		unsigned int disable_to_power_off;
+
+		/**
 		 * @delay.enable: Time for the panel to display a valid frame.
 		 *
 		 * The time (in milliseconds) that it takes for the panel to
@@ -367,6 +383,10 @@ static int panel_simple_suspend(struct device *dev)
 	struct panel_simple *p = dev_get_drvdata(dev);
 
 	gpiod_set_value_cansleep(p->enable_gpio, 0);
+
+	if (p->desc->delay.disable_to_power_off)
+		msleep(p->desc->delay.disable_to_power_off);
+
 	regulator_disable(p->supply);
 	p->unprepared_time = ktime_get();
 
@@ -427,6 +447,9 @@ static int panel_simple_prepare_once(struct panel_simple *p)
 		return err;
 	}
 
+	if (p->desc->delay.power_to_enable)
+		msleep(p->desc->delay.power_to_enable);
+
 	gpiod_set_value_cansleep(p->enable_gpio, 1);
 
 	delay = p->desc->delay.prepare;
-- 
2.7.4

