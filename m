Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F075164E3
	for <lists+dri-devel@lfdr.de>; Sun,  1 May 2022 17:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE9210F23B;
	Sun,  1 May 2022 15:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184DD10F239
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 15:12:25 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id c15so15832947ljr.9
 for <dri-devel@lists.freedesktop.org>; Sun, 01 May 2022 08:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ce4A8wMAvBJZnLY4Vg9L/lhIMXxs87k9mqHw26OfST8=;
 b=gjHGYTcvqx4d6Bv0cZY2fCzUjQWr4EPLQV7QknyllrvEV/EpvaI2hyEOySVyyutGww
 8BjCmyFZEI8GHnxU5AiJ9OkiUqtWJmNBeXoEmBfbffWjPhkUL18y5whPY9PMG6Hd+4Hb
 mEFHGb6ISo+XrEvj9CrryfK2Y9aHE34kTRBZrhf81a/K740/QZrLlCTZ11wMvH0DWOq8
 LNIiAjqXw/PM7JG3pss4txr1I3kkHTbInnp7yUxRxS6VXwBhdS0th8nV4AJtsrq2Kd+i
 UMienQEv09yytTSIQorxzSnUpPRxxYnWnrL9OIsqi9azzC/9RyVamuSWFlwLxwA4PvJn
 3Caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ce4A8wMAvBJZnLY4Vg9L/lhIMXxs87k9mqHw26OfST8=;
 b=gzeJBOQNVFWFefNwlEqkscrlmduKyTK9qhPsqdPG0lzXtYxzJbmDxh6LaO526v67q4
 YGphMWa9TcZo9AbRmh7D8kGmA3FL2HPNMzKaE67Wmk9eQC2k5lJqSqpKlzFNzIatD1Wp
 xrS876EWdN/eEDt6og9aaXoeGCKSQ5GHALv6gfHNCu+z+TWGlcUc91YVi2qnULBAHHsn
 MINq+3RTKNEoF708ndwQtk90zGUkRmLUIvGiD016wOix9XWH1TV8XrtjLeUiKZByqcRm
 6gOQguVLatQifA/Y8+JWN/M0x66yGcembFnQntCfKRGWMpMn7uta2If+EdR+1ZL4X+XD
 DKYQ==
X-Gm-Message-State: AOAM533unujhrTX42lfwCPv4fm0IC4NQ1AwNWrsdbvZeh+4jnKB7GpOz
 PgYnR68JCeDWTN+/GibFjPuA4Q==
X-Google-Smtp-Source: ABdhPJxYLBWRih7LcolP7XgihrHaq5BfPrrpzEQadwR5izXUNeUDfSjYqK/SKWFWz89qUTtf0OEgiA==
X-Received: by 2002:a2e:5407:0:b0:24f:64c:980c with SMTP id
 i7-20020a2e5407000000b0024f064c980cmr5783370ljb.163.1651417943463; 
 Sun, 01 May 2022 08:12:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 l16-20020ac25550000000b0047255d210dbsm461975lfk.10.2022.05.01.08.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 08:12:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/3] drm/msm/dsi: fetch DSC pps payload from struct
 mipi_dsi_device
Date: Sun,  1 May 2022 18:12:19 +0300
Message-Id: <20220501151220.3999164-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
References: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that struct mipi_dsi_device provides DSC data, fetch it from the
mentioned struct rather than from the struct drm_panel itself. This
would allow supporting MIPI DSI bridges handling DSC on their input
side.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a95d5df52653..173df1fd3692 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1690,6 +1690,17 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
+	if (dsi->dsc) {
+		struct msm_display_dsc_config *dsc = msm_host->dsc;
+
+		if (!dsc) {
+			dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), GFP_KERNEL);
+			if (!dsc)
+				return -ENOMEM;
+			dsc->drm = dsi->dsc;
+			msm_host->dsc = dsc;
+		}
+	}
 
 	/* Some gpios defined in panel DT need to be controlled by host */
 	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
@@ -2164,23 +2175,9 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
-	struct drm_panel *panel;
 	int ret;
 
 	msm_host->dev = dev;
-	panel = msm_dsi_host_get_panel(&msm_host->base);
-
-	if (!IS_ERR(panel) && panel->dsc) {
-		struct msm_display_dsc_config *dsc = msm_host->dsc;
-
-		if (!dsc) {
-			dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), GFP_KERNEL);
-			if (!dsc)
-				return -ENOMEM;
-			dsc->drm = panel->dsc;
-			msm_host->dsc = dsc;
-		}
-	}
 
 	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
 	if (ret) {
-- 
2.35.1

