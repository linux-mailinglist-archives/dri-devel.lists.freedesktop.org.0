Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E03475FF7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 18:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D18510F613;
	Wed, 15 Dec 2021 17:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CE610F612;
 Wed, 15 Dec 2021 17:55:55 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id r5so20765866pgi.6;
 Wed, 15 Dec 2021 09:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QZ3LpjtL0YwyX+2dJ2ef+7lZVvlqJTjbm/p+yQNc6As=;
 b=ln+w3Wmc1irEPAgq4GSqmPmrFaT74X8U/B0ctUo+WElfqKyG7EbYw6e0Ij2mAFl+mN
 cSMgK6H0EGR/Hcbzo82ViMs6m2V9JUC3n94U+bqPi9OT24jgKu5JnIBFXVBjf84Zi6B9
 u9HkSFArVI6eBh4mTgCjGY62ulMTVx2kRczh39eVZZHmKP62Z5eQIuoqlUuMsVro+vtD
 WRFCPF3e3CGo4Z7XJh4vpg6/JNxRY/ZvECW4BBl0z/lxZiLLkKJR+9VQKfJ9sFRVUf1i
 fgI1HoEpOOIwbV1zfqE3RAU3oubbG2iAhm7IF4LoVG9GDGeXR5GEzRnjl9n6pmHg3XxB
 IDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QZ3LpjtL0YwyX+2dJ2ef+7lZVvlqJTjbm/p+yQNc6As=;
 b=758zqNGFeMKwS4GX83SFdl+rY/sDsbr2a5au03e25WRaIY+6fHzEX8eH2b6N+zKTsz
 qjo7qx7epthcLO4kPqnodqw76JsXGPM4kFkrXg4SLizaIQHvRALmw/kIaK1cymR4zJl1
 fdE+QohdwVgua/9wDMBN1MzCfmFJE3KFo7r5TKSAQkPeYx9aCJVieupAitbz+kIJDRRE
 jOlL1iMNCitr84YGAFYJVtvsvTTtP6c/S21rrrnio9eazQlAcafm0sGUFVhQebR660Wc
 RlqOhhajQjh/EEbokWcR9MZ4MubD5avR8zpHWH+ChLmDHBSq0c5Yd4EqZ/gFXMjhrz++
 XRTA==
X-Gm-Message-State: AOAM531uyo6Kz4uI2ZiBsgmvG/gx132wAXw0Z8zEApr+epoCtj9jdb3S
 Tf7cYjptcZ/5f9P+BbD++ScR7ykAfqg=
X-Google-Smtp-Source: ABdhPJxDFJaT/pQWOIsDrLIBG60oATcp+dgTrUx2Pl/YVvoNcVC6KPYi9NxgjPfjNu8ZRmlkuK5yPw==
X-Received: by 2002:a63:5c64:: with SMTP id n36mr8707927pgm.61.1639590954046; 
 Wed, 15 Dec 2021 09:55:54 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 t8sm3041723pgk.66.2021.12.15.09.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 09:55:52 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Don't use autosuspend for display
Date: Wed, 15 Dec 2021 09:59:02 -0800
Message-Id: <20211215175910.1744151-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

No functional change, as we only actually enable autosuspend for the GPU
device.  But lets not encourage thinking that autosuspend is a good idea
for anything display related.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c     | 8 ++++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c  | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 5b4bb722f750..6b3ced4aaaf5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2020,7 +2020,7 @@ void msm_dsi_host_xfer_restore(struct mipi_dsi_host *host,
 	/* TODO: unvote for bus bandwidth */
 
 	cfg_hnd->ops->link_clk_disable(msm_host);
-	pm_runtime_put_autosuspend(&msm_host->pdev->dev);
+	pm_runtime_put(&msm_host->pdev->dev);
 }
 
 int msm_dsi_host_cmd_tx(struct mipi_dsi_host *host,
@@ -2252,7 +2252,7 @@ int msm_dsi_host_enable(struct mipi_dsi_host *host)
 	 */
 	/* if (msm_panel->mode == MSM_DSI_CMD_MODE) {
 	 *	dsi_link_clk_disable(msm_host);
-	 *	pm_runtime_put_autosuspend(&msm_host->pdev->dev);
+	 *	pm_runtime_put(&msm_host->pdev->dev);
 	 * }
 	 */
 	msm_host->enabled = true;
@@ -2344,7 +2344,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 
 fail_disable_clk:
 	cfg_hnd->ops->link_clk_disable(msm_host);
-	pm_runtime_put_autosuspend(&msm_host->pdev->dev);
+	pm_runtime_put(&msm_host->pdev->dev);
 fail_disable_reg:
 	dsi_host_regulator_disable(msm_host);
 unlock_ret:
@@ -2371,7 +2371,7 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
 	pinctrl_pm_select_sleep_state(&msm_host->pdev->dev);
 
 	cfg_hnd->ops->link_clk_disable(msm_host);
-	pm_runtime_put_autosuspend(&msm_host->pdev->dev);
+	pm_runtime_put(&msm_host->pdev->dev);
 
 	dsi_host_regulator_disable(msm_host);
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 0b2ae5c15240..c2ed177717c7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -602,7 +602,7 @@ static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
 static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
 {
 	clk_disable_unprepare(phy->ahb_clk);
-	pm_runtime_put_autosuspend(&phy->pdev->dev);
+	pm_runtime_put(&phy->pdev->dev);
 }
 
 static const struct of_device_id dsi_phy_dt_match[] = {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 211b73dddf65..68fba4bf7212 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -69,7 +69,7 @@ static void power_off(struct drm_bridge *bridge)
 	if (ret)
 		DRM_DEV_ERROR(dev->dev, "failed to disable pwr regulator: %d\n", ret);
 
-	pm_runtime_put_autosuspend(&hdmi->pdev->dev);
+	pm_runtime_put(&hdmi->pdev->dev);
 }
 
 #define AVI_IFRAME_LINE_NUMBER 1
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 1cda7bf23b3b..75605ddac7c4 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -205,7 +205,7 @@ void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge)
 	msm_hdmi_set_mode(hdmi, false);
 
 	enable_hpd_clocks(hdmi, false);
-	pm_runtime_put_autosuspend(dev);
+	pm_runtime_put(dev);
 
 	ret = gpio_config(hdmi, false);
 	if (ret)
@@ -260,7 +260,7 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
 
 	enable_hpd_clocks(hdmi, false);
-	pm_runtime_put_autosuspend(&hdmi->pdev->dev);
+	pm_runtime_put(&hdmi->pdev->dev);
 
 	return (hpd_int_status & HDMI_HPD_INT_STATUS_CABLE_DETECTED) ?
 			connector_status_connected : connector_status_disconnected;
-- 
2.33.1

