Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270D43B4FA8
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jun 2021 18:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35AF6E0D9;
	Sat, 26 Jun 2021 16:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (unknown [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1196E03D;
 Sat, 26 Jun 2021 16:52:13 +0000 (UTC)
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 26 Jun 2021 09:52:06 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 26 Jun 2021 09:52:05 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 26 Jun 2021 22:21:23 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id A927B21478; Sat, 26 Jun 2021 22:21:20 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v8 2/6] drm/panel-simple: Support DP AUX backlight
Date: Sat, 26 Jun 2021 22:21:04 +0530
Message-Id: <1624726268-14869-3-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
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
 mkrishn@codeaurora.org, jani.nikula@intel.com, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, dianders@chromium.org,
 a.hajda@samsung.com, thierry.reding@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, linux-fbdev@vger.kernel.org,
 kalyan_t@codeaurora.org, jingoohan1@gmail.com, hoegsberg@chromium.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If there is no backlight specified in the device tree and the panel
has access to the DP AUX channel then create a DP AUX backlight if
supported by the panel.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v5)

This patch depends on the previous patch (2/5) of this series.

Changes in v4:
- New

Changes in v5:
- Address review comments and move backlight functions to drm_panel.c (Douglas)
- Create and register DP AUX backlight if there is no backlight specified in the
  device tree and panel has the DP AUX channel. (Douglas)
- The new drm_panel_dp_aux_backlight() will do the drm_edp_backlight_supported() check.

 drivers/gpu/drm/panel/panel-simple.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index df6fbd1..26555ec 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -800,6 +800,12 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 	if (err)
 		goto disable_pm_runtime;
 
+	if (!panel->base.backlight && panel->aux) {
+		err = drm_panel_dp_aux_backlight(&panel->base, panel->aux);
+		if (err)
+			goto disable_pm_runtime;
+	}
+
 	drm_panel_add(&panel->base);
 
 	return 0;
-- 
2.7.4

