Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BF974534A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 02:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10D610E175;
	Mon,  3 Jul 2023 00:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585F110E08D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:52 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b6a1245542so63378901fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344670; x=1690936670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJT3A9uNfEQ8+tvyxbze44I0KEmknlkiQGr1UM0OaH4=;
 b=d7ThNK+o9atNh//6q81rE7YgLwYJx2IHYIHa9ebgYCVF30cx9+mwklMAUJQ/oKB7d6
 dgf9EQEZdnhldn1jKZ9o2eHwSGs0a8VdK4v3LNiIjPhsc8iejAtHB29ObNh9lgQ8Zoo+
 W4Lx1WhQS/C0cDaCjZZ2KhQSmHv5VtjqhX2kfN6FO6oVkileZYVFWLgcY6dxwg4oWRgp
 oesqJxUGryi4eptwhHGLNVm2yUJ97tVhBkNS8kSgdnL2qkmb/Kots7UEpSc1Uj+MRxik
 FG2dlW7IiGAjq8JJjYNf12tHkt6ASLsqn0AQnl03j3lirSLjBdBpXqAn5CAQfR7T/Nx5
 aW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344670; x=1690936670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kJT3A9uNfEQ8+tvyxbze44I0KEmknlkiQGr1UM0OaH4=;
 b=aGdhrOVtBq1zbMMNPHLnwYCIXjbyIG1yCvfTFbfBQMtZNEI+qfU+ndUjpaZaw63TFb
 BInDfI1XlncrfVgmvN5Az9x5xW/bJN2dOS0pQash2RnbbwPxBAhp1oVDiOACkzARB57d
 Fo2qwZXwcEW54Q9/7mdL1ZxCzCNNcvTjHwSbvniBLa65hsjtwFoPRTOegtDOY1HqdMQN
 8OnhIRPqEPNp2yh84QcseLuckO+tB01tREWtgvDSw2EZ/KBPtkGWZk9nBnSveF+TnukF
 XgYILwB8TYGu0gpjqzU2PWYLiX7SvlCK8d44gDTWGUFG1Oi9Ff9i4Zk7ESwR3uUjW669
 qUKg==
X-Gm-Message-State: ABy/qLZO7FKA398unjiAilwniU3KWXYKktgPGAU5c4VHmHDPdI4JPHA3
 Y2sCppzCuHI8+qtE2Epitf3vaw==
X-Google-Smtp-Source: APBJJlEMQuY75NfZIMuHrnBLD/fH8zkaxyPk5kvE/0tWTWrL6JojSH2RFylPfgTHHTuCSKAQEYKOtg==
X-Received: by 2002:a2e:8216:0:b0:2b6:a475:2989 with SMTP id
 w22-20020a2e8216000000b002b6a4752989mr6001546ljg.30.1688344670741; 
 Sun, 02 Jul 2023 17:37:50 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 05/13] drm/msm: remove msm_drm_private::bridges field
Date: Mon,  3 Jul 2023 03:37:37 +0300
Message-Id: <20230703003745.34239-6-dmitry.baryshkov@linaro.org>
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

As all output devices have switched to devm_drm_bridge_add(), we can
drop the bridges array from struct msm_drm_private.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ----
 drivers/gpu/drm/msm/msm_drv.h | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f06a06ab26fa..9fe789a546f5 100644
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
index 6787bd302dfa..deb5ee236a2a 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -202,9 +202,6 @@ struct msm_drm_private {
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
-	unsigned int num_bridges;
-	struct drm_bridge *bridges[MAX_BRIDGES];
-
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.39.2

