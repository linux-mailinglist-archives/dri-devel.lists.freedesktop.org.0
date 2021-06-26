Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F1A3B4FA7
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jun 2021 18:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB786E081;
	Sat, 26 Jun 2021 16:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (unknown [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D846E027;
 Sat, 26 Jun 2021 16:52:13 +0000 (UTC)
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 26 Jun 2021 09:52:05 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 26 Jun 2021 09:52:04 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 26 Jun 2021 22:21:28 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id CFE6321478; Sat, 26 Jun 2021 22:21:25 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v8 4/6] drm/panel-simple: Update validation warnings for eDP panel
 description
Date: Sat, 26 Jun 2021 22:21:06 +0530
Message-Id: <1624726268-14869-5-git-send-email-rajeevny@codeaurora.org>
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
 mkrishn@codeaurora.org, jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, dianders@chromium.org, a.hajda@samsung.com,
 thierry.reding@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, kalyan_t@codeaurora.org,
 hoegsberg@chromium.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do not give a warning for the eDP panels if the "bus_format" is
not specified, since most eDP panels can support more than one
bus formats and this can be auto-detected.
Also, update the check to include bpc=10 for the eDP panel.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---

Changes in v8:
- New patch, to address the review comments of Sam Ravnborg [1]

[1] https://lore.kernel.org/dri-devel/20210621184157.GB918146@ravnborg.org/

 drivers/gpu/drm/panel/panel-simple.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 86e5a45..f966b562 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -772,10 +772,8 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 			desc->bpc != 8);
 		break;
 	case DRM_MODE_CONNECTOR_eDP:
-		if (desc->bus_format == 0)
-			dev_warn(dev, "Specify missing bus_format\n");
-		if (desc->bpc != 6 && desc->bpc != 8)
-			dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
+		if (desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10)
+			dev_warn(dev, "Expected bpc in {6,8,10} but got: %u\n", desc->bpc);
 		break;
 	case DRM_MODE_CONNECTOR_DSI:
 		if (desc->bpc != 6 && desc->bpc != 8)
-- 
2.7.4

