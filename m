Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E4569277
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 21:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7888511B1AE;
	Wed,  6 Jul 2022 19:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E94113935
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 19:14:45 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so11056094pjn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 12:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rmyIuGz4xgr5RGO7XFrd0kJyn+/e00wc5WntWtW/Wbo=;
 b=lONXGA0Oa94we1VM7SSu7upm24Oh6HuikccFcEH52YRtWEe8CoVmmJw6AlYuEhyklh
 GhsqRocP4eFVQvD8NknHWpsvJ20dKMNLUp8qwtWaozNM7OA2uVx9cz3ROUU1epoBvz9S
 07+zyYz+BjlojJI3SZUG4GbsjOnPHRpGMAUp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rmyIuGz4xgr5RGO7XFrd0kJyn+/e00wc5WntWtW/Wbo=;
 b=zkDVFc0e8HAeBW3o489npP2b9wA/h3jxwcjAIEd2YijCcbuxRiZW9Eo9W1CXRGt6LN
 KlD6mbqQTuuUUjdRPE4wXamzRvx0mzm4/BhGqy6aMzEqnb2ruzTzdHHNvsNmZAs2Z6HE
 SlBUYXNEA908mQGwEuWqsOd0MM0IRuTj5XnBNW2epYtk/PwPKgBtD6bTjp1W+l7obSqm
 YmkCtSUJTS6GtxuV0RagmQG7rr8dHPkzEeQzBN0mdTB4UVKUlPJzwGTvbs2oUf5M5CDT
 GxomAZ2AxsNw309+pMWFIjnwZemLBF7ACyENJQsBlV7Oqv1Skzk6RR7qncMhuvXdHh/m
 Np7A==
X-Gm-Message-State: AJIora+pGcpSWze+XY3Opm0Ub83U3+khXUC5LMhz8BBt6Ue5dZCzEM7+
 kC1PJTBNDN2UDcAPv+RgKVEEjw==
X-Google-Smtp-Source: AGRyM1s4Ik+wpzNwQpGqqCRJEELSjtoAI7uTiFsZlXwgvkaUnMOhJxHPZHTcNWqz5GJbIRFES3lg7A==
X-Received: by 2002:a17:902:988b:b0:16b:fae3:fcd5 with SMTP id
 s11-20020a170902988b00b0016bfae3fcd5mr7996093plp.109.1657134884659; 
 Wed, 06 Jul 2022 12:14:44 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:a20f:cad4:2229:c6bb])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a17090b0d0900b001ef8912f763sm7051714pjz.7.2022.07.06.12.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 12:14:44 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/msm/dsi: Set panel orientation when directly connected
Date: Wed,  6 Jul 2022 12:14:42 -0700
Message-Id: <20220706191442.1150634-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
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
Cc: Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Hsin-Yi Wang <hsinyi@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the panel orientation in drm when the panel is directly connected,
i.e. we're not using an external bridge. The external bridge case is
already handled by the panel bridge code, so we only update the path we
take when the panel is directly connected/internal. This silences a
warning splat coming from __drm_mode_object_add() on Wormdingler boards.

Cc: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
to set orientation from panel") which is in drm-misc

 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index cb84d185d73a..9333f7095acd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -268,6 +268,8 @@ static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
 		return PTR_ERR(panel);
 	}
 
+	drm_connector_set_orientation_from_panel(conn, panel);
+
 	if (!panel || !IS_BONDED_DSI())
 		goto out;
 

base-commit: 15b9ca1641f0c3cd74885280331e9172c62a125e
-- 
https://chromeos.dev

