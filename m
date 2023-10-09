Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621D07BE8F9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774F110E2A2;
	Mon,  9 Oct 2023 18:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7CF10E2A4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:47 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50307acd445so6045260e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875046; x=1697479846; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PDffGe9s39I6J3ue64oALa7ElHnsr/uXc2xUK2PVAIo=;
 b=iuJBA8FsduxvlZI0SQk1w/cJ6299HVmHiwU/Njh76XHTUVMdl255skk/7tkhtIXho4
 3nSpsNvUOI05bzNeDtrFPJhNapRstVa+o5bcByr0Klp2nT6Ph+7SdEeut+uOV4FLreF5
 UIOb7ryEzts4tcL0G4rOkoXp2IReVvpVims+dAiy1L+Fq4Egf2dh/2HbRl8MFU/bSwyS
 ADzoRWO0IElrYn046eAHVQngZ16Jcmq9ayTK7BRBNoSA1/2rSQql5whHFZ6RIVrRp2HH
 RhHoYqU3//otInOMqbMNFKaYIEFzgpTW3syfwZTlSFHEKbGzeIOnpflxZovMw/iUVfrX
 PKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875046; x=1697479846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PDffGe9s39I6J3ue64oALa7ElHnsr/uXc2xUK2PVAIo=;
 b=E7q+bn38jpxJxHz0DugF+WdsEKPnQj+nz2+Yi+wNSVW8utWN2QBf/ITmNB76EYud7L
 cqiA0twJTclqk/kAai7PR8CZKFhvkzQeeRYcR3VC8rKNOketa1gVf2YDTXRKcSx7en2U
 m5evqGApuAoY3nu7jPK0kU0abOBN/MfyV80iygxoxPLmOgHkdxQNZcw+zB49cWxSkTuD
 Usuu6Jz/s/vr8xBEmHxji65EMbzxV28CBuAGDIcbED2X33XuSdUNtpQGV6Dk96ljnmDS
 H24vhgcdsuKsvMUpjFHeYnmqb+sx9cR4+TjBmCZ3CGrFXbGMe8f/K8N3INYfeFjUAhqv
 eMCg==
X-Gm-Message-State: AOJu0YxKsu102oChoHHv0XEwHsGzutnZkDabyjzoryKzHcJfBq9PWRS0
 rMWMJcu0g8/xFzC9riyU6Ams1Q==
X-Google-Smtp-Source: AGHT+IEoGY8TGh+MeEfY49+EpGtxtl6bqUGlHjpkO9fRAkDexHyvI42sNQOanvPNMbrl/GeB9/SU9g==
X-Received: by 2002:a05:6512:159d:b0:503:1722:9c5a with SMTP id
 bp29-20020a056512159d00b0050317229c5amr19024534lfb.3.1696875045806; 
 Mon, 09 Oct 2023 11:10:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 05/13] drm/msm: remove msm_drm_private::bridges field
Date: Mon,  9 Oct 2023 21:10:32 +0300
Message-Id: <20231009181040.2743847-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
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

As all output devices have switched to devm_drm_bridge_add(), we can
drop the bridges array from struct msm_drm_private.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ----
 drivers/gpu/drm/msm/msm_drv.h | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5b937c3879af..7617c456475a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -240,10 +240,6 @@ static int msm_drm_uninit(struct device *dev)
 
 	drm_mode_config_cleanup(ddev);
 
-	for (i = 0; i < priv->num_bridges; i++)
-		drm_bridge_remove(priv->bridges[i]);
-	priv->num_bridges = 0;
-
 	if (kms) {
 		pm_runtime_get_sync(dev);
 		msm_irq_uninstall(ddev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 80085d644c1e..a6a29093bbe5 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -206,9 +206,6 @@ struct msm_drm_private {
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
-	unsigned int num_bridges;
-	struct drm_bridge *bridges[MAX_BRIDGES];
-
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.39.2

