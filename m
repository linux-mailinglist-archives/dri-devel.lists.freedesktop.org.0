Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B597BEC24
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 22:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A3E10E2EC;
	Mon,  9 Oct 2023 20:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D381A10E1AC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 20:57:32 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50444e756deso6616335e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 13:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696885051; x=1697489851; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6mRCiNMZCeM+Ar6Xq8Rd6MAb4ZZFbkMJC2m2U/eGMOM=;
 b=hAXrsTxyqkbaWwqlrxw1FxDVPjcynV2A6waENgk4FMYLuWtbOk7GVpEGx4yqkAlysc
 d+noYdn9MYYhMMP8P9D7RXnsQm0LEvsq+AbvGpvdp3R8sfohbyb3+QXXG5ffHcoZev/R
 rKgZHVKyjk9UdPpHDPbJUMSp3KFkmJaZb9CQlOJd5yAIb87IoGQXDBH+D2aU4TDXik2u
 97KiFVomicDA/WtgKtDSehnr7YawMhjoMv4LOqV5OS1FXCMme/xapmYBQVAyeUx7mcbQ
 Nd4T12+LiAayqqwEu19t3tWNJs0sSL0024g5aUh2efU/dElZJ+bI0VLR42X4CFlrv1mR
 iE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696885051; x=1697489851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6mRCiNMZCeM+Ar6Xq8Rd6MAb4ZZFbkMJC2m2U/eGMOM=;
 b=oZTJdQnfPCPBgBAJ+/s8YerfKIO8W3Kz7z+M+JuK6xDYbqJnJvN+a6eOYRiPIIlZfk
 ZPtDkw/rcQ5opP+JlVZthM48T36PIcz9lEaMor+qRwoYI5kOn2fUdqPqRjEhq2eu12Xg
 g7wWGg6f3XCExiBvptVFmIJgtgpXNHKaT5Uwh6RcGnKLSq/4itZ/JEy5B4xCe0HuU6R0
 EkxwV33uZTK3JCbDZ6EL0E6pB5UXF2gi5Umt16HQiq1fvXRheHnZg5GpkSA1OB6eSrHn
 eaXHxFecj/l5r1DORTp2m8uIBBZ7gKoHoFLaWupmSyCMW0yURmOP0dy5IEX7sem/w19n
 PG6g==
X-Gm-Message-State: AOJu0YyHpH5X9ujTXNdKQ/LEb60GMdtMCxospb/hCNrE39hwy9BeSRYP
 2stTteNvyIRzFNXmMX5giQbrKQ==
X-Google-Smtp-Source: AGHT+IFU7X41OGXzJD9SvazQZs/emXDkqZ6yVTu4T54nQhn3J7EF1X9dwl5ts7ONPF9ntJ0mSqjYQg==
X-Received: by 2002:a05:6512:3993:b0:503:15a5:b368 with SMTP id
 j19-20020a056512399300b0050315a5b368mr14955585lfu.16.1696885050980; 
 Mon, 09 Oct 2023 13:57:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f5-20020ac251a5000000b0050300e013f3sm1540844lfk.254.2023.10.09.13.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 13:57:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 2/5] drm/msm/dsi: drop msm_dsi_device_connected() function
Date: Mon,  9 Oct 2023 23:57:24 +0300
Message-Id: <20231009205727.2781802-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order") the
DSI hosts are not bound through the component framework if the DSI
driver wasn't attached to the DSI device connected to this host.

Afterwards, if there is no bridge (including the panel bridge) created
for the DSI device then devm_drm_of_get_bridge() will return an error,
also making msm_dsi_manager_ext_bridge_init() and thus DSI modesetting
init fail.

This way there can be no 'unconnected' MSM DSI bridges. Remove the
msm_dsi_device_connected() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         | 6 ------
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 5 -----
 2 files changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 269975002b95..b7edcb7b3ddc 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -61,12 +61,6 @@ int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_tpg_enable(void);
 
-/* msm dsi */
-static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
-{
-	return msm_dsi->external_bridge;
-}
-
 /* dsi host */
 struct msm_dsi_host;
 int msm_dsi_host_xfer_prepare(struct mipi_dsi_host *host,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 59f4728fc772..af840a1e9fc0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -305,8 +305,6 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	int ret;
 
 	DBG("id=%d", id);
-	if (!msm_dsi_device_connected(msm_dsi))
-		return;
 
 	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
 	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
@@ -364,9 +362,6 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 
 	DBG("id=%d", id);
 
-	if (!msm_dsi_device_connected(msm_dsi))
-		return;
-
 	/*
 	 * Do nothing with the host if it is slave-DSI in case of bonded DSI.
 	 * It is safe to call dsi_mgr_phy_disable() here because a single PHY
-- 
2.39.2

