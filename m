Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA10846C779
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 23:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A4C6E5AE;
	Tue,  7 Dec 2021 22:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898B36E0F6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 22:29:14 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id u22so783561lju.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 14:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KQyhi8Tuxu4/knDgfSprik7qylpNwng9tPAXIuAarNU=;
 b=k/AvE5IQ4Q/PFTfvJMJ0uSLl5kcm6XNcaI9lVQ45leWD0miLV5lZHTzOeEpb+pLhNQ
 +D0v7qQ8+l8B7LPLkr99/0D7TAgq6FVa6URdy0Oeb3qVg5g5KDlckKPR3JAbRQxKpeCg
 Kkrb2tytTbO7EmZiQHMGCiReqcoQYWGDKPMtg89Q45EF8gE0j1P11v/LKWuP2tv1Kgr6
 PwjVlQtyds1IMXskORj8WGpCRNMb/fivMQ7a84WjJMo7pmFTW1SjALjeL2sIc8RAt+U9
 DSq2+XQ5xC/PfBIbnZRKM9AzkaVdNnq2UhdDKgilj+0PjYh73M0SGZXO1w43bnvynu27
 K1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KQyhi8Tuxu4/knDgfSprik7qylpNwng9tPAXIuAarNU=;
 b=5Zl7UYzYJEn5oizPsdU3ExHLd5ZaQ12htxZHuhNZcDB0OW/+5R0aGOjr39a82uXJ87
 JjIdeiM64+V2LNnCs5kcZA7lyOvEe0LpO3NcPM8WXS5e+JtNYf/58xlRDp6U1PuwdpZK
 kH2U9oWqa49hEegGCXrrjDkS5jwZ1X0tKyhGi95WiiH4QZck/WmdZP2pCm6g5RFd2qkU
 g7FHCkk249+l1VE+d3J5tFrA7iYF5GgoJUamPfBlyLtvWfOmlxS0/crcnKuj/PUN/b38
 puYY+rmqIvDYcax7mvi84LBxbs+IjOb6GP14jRrUQzfm4+R/ld3bb8YJqwVTai/VPTNe
 16Qg==
X-Gm-Message-State: AOAM531T7AZX1dd08NNqBEB7RR12FWPLl7aH7bqL5x7bXaZNQsF3OeDZ
 IKcSIedkatjavp2bzsjqy4RZyw==
X-Google-Smtp-Source: ABdhPJwaJD5QSZR55EHDPoWozhEUL1ggzjH3xoDUZkWnIZmB4+spSLntf0X6cX/dbQC/au0flZ2kVQ==
X-Received: by 2002:a2e:a54d:: with SMTP id e13mr43939891ljn.319.1638916152710; 
 Tue, 07 Dec 2021 14:29:12 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p22sm79423lfe.257.2021.12.07.14.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 14:29:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 1/2] drm/msm/dsi: move DSI host powerup to modeset time
Date: Wed,  8 Dec 2021 01:29:00 +0300
Message-Id: <20211207222901.988484-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
References: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI subsystem does not fully fall into the pre-enable/enable system
of callbacks, since typically DSI device bridge drivers expect to be
able to communicate with DSI devices at the pre-enable() callback. The
reason is that for some DSI hosts enabling the video stream would
prevent other drivers from sending DSI commands. For example see the
panel-bridge driver, which does drm_panel_prepare() from the
pre_enable() callback (which would be called before our pre_enable()
callback, resulting in panel preparation failures as the link is not yet
ready).

Therewere several attempts to solve this issue, but currently the best
approach is to power up the DSI link from the mode_set() callback,
allowing next bridge/panel to use DSI transfers in the pre_enable()
time. Follow this approach.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 +++++++++++++++++++--------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 681ca74fe410..497719efb9e9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -336,13 +336,12 @@ dsi_mgr_connector_best_encoder(struct drm_connector *connector)
 	return msm_dsi_get_encoder(msm_dsi);
 }
 
-static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
+static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 {
 	int id = dsi_mgr_bridge_get_id(bridge);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
 	struct mipi_dsi_host *host = msm_dsi->host;
-	struct drm_panel *panel = msm_dsi->panel;
 	struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
 	bool is_bonded_dsi = IS_BONDED_DSI();
 	int ret;
@@ -383,6 +382,34 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (is_bonded_dsi && msm_dsi1)
 		msm_dsi_host_enable_irq(msm_dsi1->host);
 
+	return;
+
+host1_on_fail:
+	msm_dsi_host_power_off(host);
+host_on_fail:
+	dsi_mgr_phy_disable(id);
+phy_en_fail:
+	return;
+}
+
+static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	int id = dsi_mgr_bridge_get_id(bridge);
+	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
+	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
+	struct mipi_dsi_host *host = msm_dsi->host;
+	struct drm_panel *panel = msm_dsi->panel;
+	bool is_bonded_dsi = IS_BONDED_DSI();
+	int ret;
+
+	DBG("id=%d", id);
+	if (!msm_dsi_device_connected(msm_dsi))
+		return;
+
+	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
+	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
+		return;
+
 	/* Always call panel functions once, because even for dual panels,
 	 * there is only one drm_panel instance.
 	 */
@@ -417,17 +444,7 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (panel)
 		drm_panel_unprepare(panel);
 panel_prep_fail:
-	msm_dsi_host_disable_irq(host);
-	if (is_bonded_dsi && msm_dsi1)
-		msm_dsi_host_disable_irq(msm_dsi1->host);
 
-	if (is_bonded_dsi && msm_dsi1)
-		msm_dsi_host_power_off(msm_dsi1->host);
-host1_on_fail:
-	msm_dsi_host_power_off(host);
-host_on_fail:
-	dsi_mgr_phy_disable(id);
-phy_en_fail:
 	return;
 }
 
@@ -573,6 +590,8 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
 	msm_dsi_host_set_display_mode(host, adjusted_mode);
 	if (is_bonded_dsi && other_dsi)
 		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
+
+	dsi_mgr_bridge_power_on(bridge);
 }
 
 static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
-- 
2.33.0

