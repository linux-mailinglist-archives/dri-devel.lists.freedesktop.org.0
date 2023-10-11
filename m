Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4FD7C6135
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 01:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A515210E2F2;
	Wed, 11 Oct 2023 23:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C90610E2DF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 23:39:24 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5068dab8c00so559102e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 16:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697067562; x=1697672362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f3PVSUQHKZ6hB5jZ1fmYau7crWDHRuDRekZrM5LlEds=;
 b=NrkhgHrJkMDLAEZtWr/BTmOISVjRX9z47THiBp+pqymYTm2LDxva+rEs7OfW8469Wo
 KJabB/ioNGJE3vE0aqib2F3DuOWbQSoWUH9FvnJOxtyBdWl542tu19+CQ21B4LZuN5bl
 Uy9cDJQVkTwQQVZLrNSggcvQYyK5todk56OS4THd1o2H5oHm36antfT1I/t/Q7R+8GX1
 ZyGkatCzjz5w6kgWt2VH0bPw4ncDPruDnqGkna9SnYZiGGc+l07NmQXA95dIXLccfxqR
 kFuG6a0LG5CZzunBQBt3Qw26uW+7Fns/qUxhRMoLW/s+MWnNYv0w+gnIoBIYPd9tIYuV
 yRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697067562; x=1697672362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f3PVSUQHKZ6hB5jZ1fmYau7crWDHRuDRekZrM5LlEds=;
 b=pfh+updebfCyQZYYgKo4wVSDNRjuqYS2l1tpir8852jvHeVgaQMy0cdmrXpsGDIXjQ
 Pu37Zx/FIbhRzNr1gCIOZanCQWP9qAR/rsaJ9T/KUwYYm6ERwnxva1v7yaBgRfSEgvk7
 OnvwsEtaU6uPgnfmTLxo0jlqHL7ZCEuJhpXXijK7WU2qw0iBsBxMcuJCsv6+7KMk4EN1
 G6lWxvg9DBzQCO6mlpMLDXZgKM9LNr9qzu9JJpP6MrA0lnL0wRSn6/mXd0MHzIGDkPuU
 EQVaf+HtmyR6XX1JQQZRJ8fts2psdvWeW1lc/mDgUEZTFiEZayS5iDkLOKKykZroUV86
 KBiA==
X-Gm-Message-State: AOJu0YyJXC9dZ7eZa7Y3MGoorohH4EzwvzNUoSAJhnoXGmq+vHa3tcTJ
 rPQ13B+4m5zPLmWdS6VCaPGR/Q==
X-Google-Smtp-Source: AGHT+IHV2B+ot6nPMqGPH3HG54KxhnKQgY12O7J8603eGHewHHexetWcVbhBXwTD+TIYGLxrkj4XXw==
X-Received: by 2002:a19:ee17:0:b0:500:bb99:69b0 with SMTP id
 g23-20020a19ee17000000b00500bb9969b0mr16819362lfb.57.1697067562326; 
 Wed, 11 Oct 2023 16:39:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056512015b00b0050567cdb8f6sm2466032lfo.239.2023.10.11.16.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 16:39:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 2/2] drm/msm/dsi: free TX buffer in unbind
Date: Thu, 12 Oct 2023 02:39:19 +0300
Message-Id: <20231011233919.410099-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011233919.410099-1-dmitry.baryshkov@linaro.org>
References: <20231011233919.410099-1-dmitry.baryshkov@linaro.org>
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

If the drm/msm init code gets an error during output modeset
initialisation, the kernel will report an error regarding DRM memory
manager not being clean during shutdown. This is because
msm_dsi_modeset_init() allocates a piece of GEM memory for the TX
buffer, but destruction of the buffer happens only at
msm_dsi_host_destroy(), which is called during DSI driver's remove()
time, much later than the DRM MM shutdown.

To solve this issue, move the TX buffer destruction to dsi_unbind(), so
that the buffer is destructed at the correct time. Note, we also have to
store a reference to the address space, because priv->kms->aspace is
cleared before components are unbound.

Reported-by: Bjorn Andersson <andersson@kernel.org>
Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c      |  1 +
 drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 13 +++++++++----
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 47f327e68471..c6bd7bf15605 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -131,6 +131,7 @@ static void dsi_unbind(struct device *dev, struct device *master,
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 
+	msm_dsi_tx_buf_free(msm_dsi->host);
 	priv->dsi[msm_dsi->id] = NULL;
 }
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index a01c326774a6..28379b1af63f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -124,6 +124,7 @@ int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size);
 void *dsi_tx_buf_get_6g(struct msm_dsi_host *msm_host);
 void *dsi_tx_buf_get_v2(struct msm_dsi_host *msm_host);
 void dsi_tx_buf_put_6g(struct msm_dsi_host *msm_host);
+void msm_dsi_tx_buf_free(struct mipi_dsi_host *mipi_host);
 int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *iova);
 int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *iova);
 int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 19019c764f11..3357b2a80786 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -147,6 +147,7 @@ struct msm_dsi_host {
 
 	/* DSI 6G TX buffer*/
 	struct drm_gem_object *tx_gem_obj;
+	struct msm_gem_address_space *aspace;
 
 	/* DSI v2 TX buffer */
 	void *tx_buf;
@@ -1134,8 +1135,10 @@ int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size)
 	uint64_t iova;
 	u8 *data;
 
+	msm_host->aspace = msm_gem_address_space_get(priv->kms->aspace);
+
 	data = msm_gem_kernel_new(dev, size, MSM_BO_WC,
-					priv->kms->aspace,
+					msm_host->aspace,
 					&msm_host->tx_gem_obj, &iova);
 
 	if (IS_ERR(data)) {
@@ -1164,8 +1167,9 @@ int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size)
 	return 0;
 }
 
-static void dsi_tx_buf_free(struct msm_dsi_host *msm_host)
+void msm_dsi_tx_buf_free(struct mipi_dsi_host *host)
 {
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	struct drm_device *dev = msm_host->dev;
 	struct msm_drm_private *priv;
 
@@ -1180,8 +1184,10 @@ static void dsi_tx_buf_free(struct msm_dsi_host *msm_host)
 
 	priv = dev->dev_private;
 	if (msm_host->tx_gem_obj) {
-		msm_gem_kernel_put(msm_host->tx_gem_obj, priv->kms->aspace);
+		msm_gem_kernel_put(msm_host->tx_gem_obj, msm_host->aspace);
+		msm_gem_address_space_put(msm_host->aspace);
 		msm_host->tx_gem_obj = NULL;
+		msm_host->aspace = NULL;
 	}
 
 	if (msm_host->tx_buf)
@@ -1967,7 +1973,6 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
 	DBG("");
-	dsi_tx_buf_free(msm_host);
 	if (msm_host->workqueue) {
 		destroy_workqueue(msm_host->workqueue);
 		msm_host->workqueue = NULL;
-- 
2.39.2

