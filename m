Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4738C713
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 14:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D0B6F629;
	Fri, 21 May 2021 12:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDB86F643;
 Fri, 21 May 2021 12:51:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B158B613DF;
 Fri, 21 May 2021 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621601474;
 bh=jEvngLW/cjGIBmD812MSfH6Z7qHrHgE9F0mc+LlnVCU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eYH2aO+avVrOJeVmpIWkod3vEau0fORf9Df3DZDMoskPVFvaUvPY+5szCcRutxyor
 my/mvi2OEBri3/ZHX84NlAG9J6Zi50Ukj4foiizCf540o36gs0yeyf2JOAjTkENiKr
 IEkFzsYiZ51NtQuzVrPhuQb3pDd/zTwNRyYjDAvn/zDDr82dpjYXzpg2ANpeadLb4Q
 vYGPdPWRxaonJ8oCAhedKvcyTFZrD0KLhqfFPSqGJF1QfvlPokiljPLqAx4I8l/h9j
 mGurVFDjsR6red27U+RBw8U0+HIeCtypozMPYBw84krdbWWpiGGB+LADU0cOc4AbTa
 erFTEMQAFEt+Q==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH 13/13] drm/msm/dsi: Pass DSC params to drm_panel
Date: Fri, 21 May 2021 18:19:46 +0530
Message-Id: <20210521124946.3617862-18-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210521124946.3617862-1-vkoul@kernel.org>
References: <20210521124946.3617862-1-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When DSC is enabled, we need to pass the DSC parameters to panel driver
as well, so add a dsc parameter in panel and set it when DSC is enabled

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 5 +++++
 include/drm/drm_panel.h            | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e26545fc82e0..7fc7002eda78 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1700,6 +1700,7 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 					struct mipi_dsi_device *dsi)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+	struct drm_panel *panel;
 	int ret;
 
 	if (dsi->lanes > msm_host->num_data_lanes)
@@ -1719,6 +1720,10 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	if (msm_host->dev)
 		queue_work(msm_host->workqueue, &msm_host->hpd_work);
 
+	panel = msm_dsi_host_get_panel(host);
+	if (panel)
+		panel->dsc = &msm_host->dsc->drm;
+
 	return 0;
 }
 
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 33605c3f0eba..27a7808a29f2 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -171,6 +171,13 @@ struct drm_panel {
 	 * Panel entry in registry.
 	 */
 	struct list_head list;
+
+	/**
+	 * @dsc:
+	 *
+	 * Panel DSC pps payload to be sent
+	 */
+	struct drm_dsc_config *dsc;
 };
 
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
-- 
2.26.3

