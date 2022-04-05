Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640C34F4815
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 01:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83ED510ED3C;
	Tue,  5 Apr 2022 23:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9679110EB6E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 23:45:55 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a30so1013054ljq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 16:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Iqbt8lWWr5PzRARKZi/p/Y11hVS9kTb+tshjhqgJ7E=;
 b=wRW6uTvNQyhoC+8+zMwMBjUsGSemFwkaIJ8xaNBFrridKcCvtpLpQyKrjQi92H0RXs
 1D/QOTXmnzYeouRzogg5XhCE2NbolhKi7R5bnxy0vwps03S5Kw6INRd3FQJNmj01+qPz
 xauU8d/5fQNStJjmZafsoSV03V45G4aKtm3lWT4i/jYtKvl9TDeSnsP9arkpL4sZm3a5
 847El/elkSrnN4m36pMvypC4m362PwtvyUhNsxl+pRqclq/77+e0knH7z6rF3T7L0Gyh
 PcQMS8E6R8iKI4SvjktmVpngyc9yrfgZA7SoDx3dX7mepxwHdlYbPNfer0R3yXioZ5DV
 QFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Iqbt8lWWr5PzRARKZi/p/Y11hVS9kTb+tshjhqgJ7E=;
 b=e8XDdm/Zu7XF6GdSbCyNUP+dF/cpDFQ2w/CFl96wpwZLPGd5LHiEejJbXZZh3/UaHX
 h5fhujOQ44svT/Es/MqPRmR5FitCbm366g667msfugDk8MLxIXvcd19nlLGGrKbdCg6M
 wWp+J6PaR2hGmMYKxU1ezFz3Scb64JTKKVHvuoNMO9F9vYS4gDqxjN02ijOZ13bBLaKG
 s2iDe9CCeoY3dRYHzKkhkHbHgU+psb/nfPUNd+f/bmUa7vzbaHql7cQdFRCtM5tb2n8e
 158jOjUgy8x47dGDkfQfSx84q04sGaMWuJATM7I9m4seTP8QrhTrU/rOB+XkTH92+v6c
 SJJw==
X-Gm-Message-State: AOAM533W35OibhZk8EmZPxxxqzOmiYjaxIjh6Uggnf5og0XksWfjXlua
 pTt1wV8mvhKeFDC/nSpuU6k7TqsffZbCuQ==
X-Google-Smtp-Source: ABdhPJw4ndQZB0hZbehYl/6rPiUUMMPM2zRus59KEaw1GkIplzOXt3oANnF+9oTn3gbdRdhjTxezXw==
X-Received: by 2002:a2e:b88b:0:b0:249:a45a:b9a3 with SMTP id
 r11-20020a2eb88b000000b00249a45ab9a3mr3670215ljp.48.1649202353964; 
 Tue, 05 Apr 2022 16:45:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 g11-20020ac24d8b000000b0044a3454c858sm1651897lfe.81.2022.04.05.16.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 16:45:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/4] drm/msm/dsi: properly add and remove created bridges
Date: Wed,  6 Apr 2022 02:45:49 +0300
Message-Id: <20220405234551.359453-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add calls to drm_bridge_add()/drm_bridge_remove() for the internal DSI
bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 0c1b7dde377c..918498e71255 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -665,6 +665,8 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
+	drm_bridge_add(bridge);
+
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret)
 		goto fail;
@@ -735,6 +737,7 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 
 void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
 {
+	drm_bridge_remove(bridge);
 }
 
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg)
-- 
2.35.1

