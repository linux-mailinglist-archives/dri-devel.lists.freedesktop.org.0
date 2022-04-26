Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E27E50EDB0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 02:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21C910E3E6;
	Tue, 26 Apr 2022 00:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F89810E9E9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 00:41:31 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id k12so4773781lfr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 17:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BgJVXf3N+o2MbfE8Sxe7s3Hg4gl2fsc9sl4/MZ7Xec=;
 b=Y0uNStUwzU/oXitgusJQjzs+6P6vKrDOyx61uQ+wVP2xAfkFXurLACebiufrGx3Dom
 SwcPd5ljkUSl2dxQ3Tv4MJLO8ji75Xzg7E87+l5vKVzf8+cxIi89Ko3XJPQ9A1PJ8Z7C
 zwFGEtFgs9M9V70Q2BFqw0Lo53egxsmiPsHje1sq3xiBr5DYrn8p+N/+qREfiZGLxpSI
 ITKQ3Y39p9OvyDVnJuZS0BpUPnnuZNeP3lJ/X6GShrwmpGQJP1uoj6jQ08RGU4oPKdFt
 D6OCVQbF7qZjFmdKJQ7tjsWC8HsB9WjXU2qW/wX56kiNJA9hMcR+dc8nCPYyYN8/9Zn6
 HjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BgJVXf3N+o2MbfE8Sxe7s3Hg4gl2fsc9sl4/MZ7Xec=;
 b=af9wnqMa/3HaL/nTSd0CNfasN75pfbLclmsXv/3L+BDG4pzwxLNqlgL0pKWrqa30V3
 nognmZnAH0z3Y2j/2pU/WqqcDP8mY5nsbzqBU8Qfs4S/qWMpSnjYW1Uaryoq2zhkNEIh
 PGd4cyJsb0EzgEdGnbKvmnYsoX3Y/hcD/hmZrT3V9EhGQzHKramEMvJLSQu8WurE3Zd8
 sU5EMWYGcOqj55kj6ZPPKpmj1qAftQbT3XpH6hxMctfXtw58s9suh9KgKcVh7WS09F81
 y9PBRR9DPlGDpZKZH+U4+EKHqBDxXK4XMxbM58Ip770hVr+4uDk9caoPjsFC0gv5JAfd
 uj1Q==
X-Gm-Message-State: AOAM533CePyiZHcXsGIyrcMmzH1YwvnO5wC0R+0OZ4yy21/nmu3RMhCv
 lIDp4zeU/S7akRbftg3fhdZpIw==
X-Google-Smtp-Source: ABdhPJyfz2HW+yUkl/y/GKEmlC3J2qoEYBy4ZnCi7wRttEGrV1xocUKmOW+mhKSGpBGgAFvLgt+vJg==
X-Received: by 2002:a05:6512:1084:b0:471:d10b:4dec with SMTP id
 j4-20020a056512108400b00471d10b4decmr14921576lfg.21.1650933690030; 
 Mon, 25 Apr 2022 17:41:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 p2-20020a19f102000000b0046d09d60becsm1564792lfh.141.2022.04.25.17.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 17:41:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v1] drm/msm: select DRM_DP_AUX_BUS for the AUX bus support
Date: Tue, 26 Apr 2022 03:41:28 +0300
Message-Id: <20220426004128.2832555-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Add missing dependency on the AUX bus implementation.

Fixes: 82c59ed16695 ("drm/msm/dp: Add eDP support via aux_bus")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index e99719067cd0..a6110fc67ac4 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -12,6 +12,7 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
+	select DRM_DP_AUX_BUS
 	select DRM_DP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
-- 
2.35.1

