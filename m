Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E06274534E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 02:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6533710E179;
	Mon,  3 Jul 2023 00:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3852B10E08D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:53 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b6c5ede714so46796811fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344671; x=1690936671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gi6uYs0yy4iwxnVM5Npf/ZisXoud61FuBDGjFnoLitw=;
 b=bPclgG/9b5NaCNxTxnhM6g+c02HqU/l4Xc7QOmVOxGLUiRZ3oqbxpUo3q351s1G3fE
 Tj5V+qwfI2yC3fC4cFY/y2WsKyJXTas7V9wSxsl/qf9wRvbgR4ogfYafJs8RM7ssqtdX
 r8MuPyjgtCfnIpXeOyVY/a8buxGWRrwAiYgLDXJ3g+SPg2prRmwuAHxO0AsqaTHkZpze
 0/Ozh4nFoeBI8AK/MQOqrXeXgpuL85s1SSsvR9tA1/cYwkFDGA7Bm9Vapdq+9aOanIIY
 8frFITUoOaVe4atGCrInx/yVZ9xoEBPu4Kl6O6WfxoQ3Da6Ul8ddanDLbT2T2hMcWlBg
 jVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344671; x=1690936671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gi6uYs0yy4iwxnVM5Npf/ZisXoud61FuBDGjFnoLitw=;
 b=YfxI380ELTtFt02B1KMrE+6/xXCJsMzATIuh/Dul+9rMjdNmVwtFMHTJ/0ZNZYAV86
 446p1FXgXkFz+QA6rJ3x7rsfd5hmCz/c/R4C9cCCxCZ3ciHHS/YWwVtD6IDQk1VRdsha
 fc3pZcGmmM2VhVQ7djlnilN8ZwZGnVPx0YUVuJKNN/r9NZEsnQ0gx1ztg1Mlz7SsPTUh
 NkBc3fhQIbcuTAX3Nc87Ud7fNH0EtMD999OzoRlYd+Rk4fk51JGYoWAZBOqVKH9MQ6qJ
 pP/Ay1RkyeckqapLktdbeoHHlrlSA4jbOli7OIsnM6ypvuIba1EfrYV4KsqqvPCwmOrH
 tQLQ==
X-Gm-Message-State: AC+VfDw2+aMRl6KLFwmJVhi10lGouRZinXuYtCS2o1WSEHChsQMRYhB0
 cWHTFWJIrBWLphAF9/EFVG2QmQ==
X-Google-Smtp-Source: ACHHUZ6cEuCuRJauL94EMMA9/zg+ErB/kYdxQ2lOaMyLtFzzNZ5MR+FZ2EF3HsTFomamhe4i+lBc1Q==
X-Received: by 2002:a05:651c:124b:b0:2b6:a694:aaa1 with SMTP id
 h11-20020a05651c124b00b002b6a694aaa1mr4520858ljh.1.1688344671623; 
 Sun, 02 Jul 2023 17:37:51 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 06/13] drm/msm: drop pm ops from the headless msm driver
Date: Mon,  3 Jul 2023 03:37:38 +0300
Message-Id: <20230703003745.34239-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
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

The msm_pm_prepare()/msm_pm_complete() only make sense for the
KMS-enabled devices, they have priv->kms guards inside. Drop global
msm_pm_ops, which were used only by the headless msm device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9fe789a546f5..a85eb7b21061 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1123,11 +1123,6 @@ void msm_pm_complete(struct device *dev)
 	drm_mode_config_helper_resume(ddev);
 }
 
-static const struct dev_pm_ops msm_pm_ops = {
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
-};
-
 /*
  * Componentized driver support:
  */
@@ -1308,7 +1303,6 @@ static struct platform_driver msm_platform_driver = {
 	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
-		.pm     = &msm_pm_ops,
 	},
 };
 
-- 
2.39.2

