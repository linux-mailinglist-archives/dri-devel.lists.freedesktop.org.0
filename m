Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6866A671CCE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 14:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9139910E73D;
	Wed, 18 Jan 2023 13:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AB710E73D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 13:00:30 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id vm8so83004554ejc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 05:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o8KcKlOKvCT1RhL/1bTXTH5peRxlu6t4vAM/1NMH6zM=;
 b=MYDih5Yobi173RFOnC/C/JTrtV1ft2cGlcfBLnnvOpujt/PMLp0mM52t3mqxxqrF6w
 UXFOeBLh0SYyoYmY/sPtYUTVhKh7SgeRjW7PFIS32o7rNSIQn8Ccby43Ye6cS/Xvl+gn
 M6nKfTZk9/VpuH4bWXoGTd0ON/REmvX6vjiAbl0zySkT5yDnkmIeabfyEj517jg7uLPN
 ust8Ye8M5pPZ1jByLC89I3P52qq0uINnCHy3/UeM0YFkU/d5yhxMzKKwpmCTfeqoep8w
 oWnuE2m2ydBx0zMJWvdM4POKO6TzC3deIjE169rYX/332NoiZX3yOBSBtr6LzT3pxYU5
 ThIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o8KcKlOKvCT1RhL/1bTXTH5peRxlu6t4vAM/1NMH6zM=;
 b=0+WuORameVvkqlKzBAAi1Dld8JOtAeDP3Qzr24L+IvaIxD6exWw/2HFniMcjgKI/lP
 a0R5iCtlH4duUvB6rklmHuAo1JElATGwzOEFLkKJNk/MmFTjgIDzMIhv4dQR2hQDb7nB
 JZJMRMNms+s7y1VBGtfMKj3/u4b/ty5CjFNvHT+3nsYVUniRw85MnqnKpu1jhCB6RmZd
 YGeLR8MJiViWoXZaNaEfOX93thz1ZIk357zVWVEThI4FITlriMrM01uLxm6XCMRPosBp
 L4IEqSrNNgRwxEJ+6zmFOQpBVmbfnT6ikKd+MvgM4qeJ7t2/zdF84bzk1Ukwb8uJO4WU
 zG3Q==
X-Gm-Message-State: AFqh2krlTloopgXlN/wZsJSooTDGmmxeY49sPn+RuM17MB4sxa/95ww/
 JNU1uALQZJ5VJfHx6wv9XAmhyw==
X-Google-Smtp-Source: AMrXdXvOwCxXci9FlJdC38rItACst1z0ITs/WpWk09TtajFJiqVIQzZvfGmWJ6CaOdNbLEB56deQdg==
X-Received: by 2002:a17:907:3ea9:b0:7ff:727f:65cb with SMTP id
 hs41-20020a1709073ea900b007ff727f65cbmr4374843ejc.19.1674046828803; 
 Wed, 18 Jan 2023 05:00:28 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 vw22-20020a170907059600b0084d43def70esm3073180ejb.25.2023.01.18.05.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 05:00:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dsi: correct byte intf clock rate for 14nm DSI PHY
Date: Wed, 18 Jan 2023 15:00:27 +0200
Message-Id: <20230118130027.2345719-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to the vendor kernel, byte intf clock rate should be a half of
the byte clock only when DSI PHY version is above 2.0 (in other words,
10nm PHYs and later) and only if PHY is used in D-PHY mode. Currently
MSM DSI code handles only the second part of the clause (C-PHY vs
D-PHY), skipping DSI PHY version check, which causes issues on some of
14nm DSI PHY platforms (e.g. qcm2290).

Move divisor selection to DSI PHY code, pass selected divisor through
shared timings and set byte intf clock rate accordingly.

Cc: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

This patch is a reimplementation of [1] in a slightly more flexible way.

[1] https://patchwork.kernel.org/project/linux-arm-msm/patch/1642586079-12472-1-git-send-email-loic.poulain@linaro.org/

---
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 14 ++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c |  4 ++++
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 1a551cc0e889..bd3763a5d723 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -141,6 +141,7 @@ struct msm_dsi_phy_shared_timings {
 	u32 clk_post;
 	u32 clk_pre;
 	bool clk_pre_inc_by_2;
+	bool byte_intf_clk_div_2;
 };
 
 struct msm_dsi_phy_clk_request {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 7c21f2fba520..18fa30e1e858 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -122,6 +122,7 @@ struct msm_dsi_host {
 	struct clk *byte_intf_clk;
 
 	unsigned long byte_clk_rate;
+	unsigned long byte_intf_clk_rate;
 	unsigned long pixel_clk_rate;
 	unsigned long esc_clk_rate;
 
@@ -398,7 +399,6 @@ int msm_dsi_runtime_resume(struct device *dev)
 
 int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 {
-	unsigned long byte_intf_rate;
 	int ret;
 
 	DBG("Set clk rates: pclk=%d, byteclk=%lu",
@@ -418,13 +418,7 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 	}
 
 	if (msm_host->byte_intf_clk) {
-		/* For CPHY, byte_intf_clk is same as byte_clk */
-		if (msm_host->cphy_mode)
-			byte_intf_rate = msm_host->byte_clk_rate;
-		else
-			byte_intf_rate = msm_host->byte_clk_rate / 2;
-
-		ret = clk_set_rate(msm_host->byte_intf_clk, byte_intf_rate);
+		ret = clk_set_rate(msm_host->byte_intf_clk, msm_host->byte_intf_clk_rate);
 		if (ret) {
 			pr_err("%s: Failed to set rate byte intf clk, %d\n",
 			       __func__, ret);
@@ -2394,6 +2388,10 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 		goto unlock_ret;
 	}
 
+	msm_host->byte_intf_clk_rate = msm_host->byte_clk_rate;
+	if (phy_shared_timings->byte_intf_clk_div_2)
+		msm_host->byte_intf_clk_rate /= 2;
+
 	msm_dsi_sfpb_config(msm_host, true);
 
 	ret = regulator_bulk_enable(msm_host->cfg_hnd->cfg->num_regulators,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 57445a5dc816..bb09cbe8ff86 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -350,6 +350,8 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
 		timing->shared_timings.clk_pre_inc_by_2 = 0;
 	}
 
+	timing->shared_timings.byte_intf_clk_div_2 = true;
+
 	timing->ta_go = 3;
 	timing->ta_sure = 0;
 	timing->ta_get = 4;
@@ -454,6 +456,8 @@ int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 	tmax = 255;
 	timing->shared_timings.clk_pre = DIV_ROUND_UP((tmax - tmin) * 125, 10000) + tmin;
 
+	timing->shared_timings.byte_intf_clk_div_2 = true;
+
 	DBG("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
 		timing->shared_timings.clk_pre, timing->shared_timings.clk_post,
 		timing->clk_zero, timing->clk_trail, timing->clk_prepare, timing->hs_exit,
-- 
2.39.0

