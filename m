Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E98E3629C1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 22:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1902A6ECF1;
	Fri, 16 Apr 2021 20:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3B86ECE6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 20:57:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618606671; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Fq3XSKPxo5GYxR6mtbpTVRK4RAzIQrWpMoVi0ajCYKc=;
 b=a5fVwxjAd4NCeG/vSIsKS+3LKy4FGXfbXAKPhw5idrF+QfPRSRCkwGYz6oCITEnzGpeBOv0y
 P/vyGn6Qu5oJnnpF+SMFxbpRfM9XJ2MtCn3btTttruvLxlopnBoQ66BI7c2JPGoGtoF0DuXH
 /guDi83esgX3b9KpnzHztfegTXI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6079fa43853c0a2c465f7893 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 20:57:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 963BAC43462; Fri, 16 Apr 2021 20:57:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0435FC43462;
 Fri, 16 Apr 2021 20:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0435FC43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 3/7] drm/msm/dsi: add API to take DSI register snapshot
Date: Fri, 16 Apr 2021 13:57:21 -0700
Message-Id: <1618606645-19695-4-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
References: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an API to take a snapshot of DSI controller registers. This API
will be used by the msm_disp_snapshot module to capture the DSI
snapshot.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c      |  4 ++++
 drivers/gpu/drm/msm/dsi/dsi.h      |  5 ++++-
 drivers/gpu/drm/msm/dsi/dsi_host.c | 15 +++++++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index f68f34b..bccc006 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -266,4 +266,8 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 	return ret;
 }
 
+void msm_dsi_snapshot(struct msm_dsi *msm_dsi)
+{
+	msm_dsi_host_snapshot(msm_dsi->host);
+}
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 7abfeab..e26223c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -15,6 +15,7 @@
 #include <drm/drm_panel.h>
 
 #include "msm_drv.h"
+#include "disp/msm_disp_snapshot.h"
 
 #define DSI_0	0
 #define DSI_1	1
@@ -90,6 +91,8 @@ static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
 	return msm_dsi->panel || msm_dsi->external_bridge;
 }
 
+void msm_dsi_snapshot(struct msm_dsi *msm_dsi);
+
 struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
 
 /* dsi host */
@@ -146,7 +149,7 @@ int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
 int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_dual_dsi);
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_dual_dsi);
-
+void msm_dsi_host_snapshot(struct mipi_dsi_host *host);
 /* dsi phy */
 struct msm_dsi_phy;
 struct msm_dsi_phy_shared_timings {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 316e78d..899b6fc 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2488,3 +2488,18 @@ struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
 	return of_drm_find_bridge(msm_host->device_node);
 }
 
+void msm_dsi_host_snapshot(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+	struct drm_device *dev = msm_host->dev;
+	struct msm_disp_state *disp_state;
+
+	disp_state = msm_disp_state_get(dev);
+
+	pm_runtime_get_sync(&msm_host->pdev->dev);
+
+	msm_disp_snapshot_add_block(disp_state, msm_iomap_size(msm_host->pdev, "dsi_ctrl"),
+			msm_host->ctrl_base, "dsi%d_ctrl", msm_host->id);
+
+	pm_runtime_put_sync(&msm_host->pdev->dev);
+}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
