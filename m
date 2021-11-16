Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D496452A95
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 07:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4876EDB5;
	Tue, 16 Nov 2021 06:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0376EDA3;
 Tue, 16 Nov 2021 06:24:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B33961101;
 Tue, 16 Nov 2021 06:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637043849;
 bh=WV9KzT/ywbkRXWjgDAW62P+fnoVkE7AXsmYbCescSRs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MYcH/S5iCSliOtrXn6Zqdy9+iU8l84dwbc4HDpuDS8BlzkG9D0yvmOYDPgjpNm15m
 SaCeAsVWFEBSqU7cG7ziscBJHAeT7mzqJaBzh1MQQEvin8esTKB0LUO55tTKhd7qTN
 mAMMzZnQXKxsz2nQ8qzO3rJ77WsQ15I8cgQEIi6NgjdcB9jv7jjrvLFtygGOKu6rif
 /P0F3Tx+qeFVQBy8JPYDtBz3DON1UuABF881dgcZSOdYHuM1FzERsMnyu+3PiT4FYy
 n2SiSWKak79qhubRljKfohUcIS1kY+hIvq+F1KeVfR3J8VhnOei1mWenVIdrRWrbdK
 gzmFiRh2BZzjA==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v3 11/13] drm/msm/dsi: add mode valid callback for dsi_mgr
Date: Tue, 16 Nov 2021 11:52:54 +0530
Message-Id: <20211116062256.2417186-12-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116062256.2417186-1-vkoul@kernel.org>
References: <20211116062256.2417186-1-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a mode valid callback for dsi_mgr for checking mode being valid in
case of DSC. For DSC the height and width needs to be multiple of slice,
so we check that here

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 12 ++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 569c8ff062ba..e7affab2fc1e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -115,6 +115,8 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 int msm_dsi_host_power_off(struct mipi_dsi_host *host);
 int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 				  const struct drm_display_mode *mode);
+enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
+					    const struct drm_display_mode *mode);
 struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host);
 unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 30c1e299aa52..31d385d8d834 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2588,6 +2588,32 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 	return 0;
 }
 
+enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
+					    const struct drm_display_mode *mode)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+	struct msm_display_dsc_config *dsc = msm_host->dsc;
+	int pic_width = mode->hdisplay;
+	int pic_height = mode->vdisplay;
+
+	if (!msm_host->dsc)
+		return MODE_OK;
+
+	if (pic_width % dsc->drm->slice_width) {
+		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
+		       pic_width, dsc->drm->slice_width);
+		return MODE_H_ILLEGAL;
+	}
+
+	if (pic_height % dsc->drm->slice_height) {
+		pr_err("DSI: pic_height %d has to be multiple of slice %d\n",
+		       pic_height, dsc->drm->slice_height);
+		return MODE_V_ILLEGAL;
+	}
+
+	return MODE_OK;
+}
+
 struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host)
 {
 	return of_drm_find_panel(to_msm_dsi_host(host)->device_node);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 20c4d650fd80..0ad8a53aaa0e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -579,6 +579,17 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
 		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
 }
 
+static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
+						      const struct drm_display_info *info,
+						      const struct drm_display_mode *mode)
+{
+	int id = dsi_mgr_bridge_get_id(bridge);
+	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
+	struct mipi_dsi_host *host = msm_dsi->host;
+
+	return msm_dsi_host_check_dsc(host, mode);
+}
+
 static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
 	.detect = dsi_mgr_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -600,6 +611,7 @@ static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
 	.disable = dsi_mgr_bridge_disable,
 	.post_disable = dsi_mgr_bridge_post_disable,
 	.mode_set = dsi_mgr_bridge_mode_set,
+	.mode_valid = dsi_mgr_bridge_mode_valid,
 };
 
 /* initialize connector when we're connected to a drm_panel */
-- 
2.31.1

