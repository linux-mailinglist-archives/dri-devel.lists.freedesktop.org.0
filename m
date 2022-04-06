Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53F44F5A7C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A483A10E354;
	Wed,  6 Apr 2022 10:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B7D10E30E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:12:51 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b21so3231091lfb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 03:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y7XhTOS8dyDsJq/tLHxB8s8UpB/ZC8LdUdSKfZZti7Q=;
 b=lBMNDe7gQCC4ebFNFGkC26gogyipiwJpnq+UUgho6W5FDPVtZBBJ2TbdeFuD8Iyws+
 0Cmjjd3a0qkYR7ffYMxGZTDCCyCDSyC1fD/L9e0WpxuJ/9lOOSu3wvby4164Vt0A5v82
 wgr+U7vIb9Vn39TSzE7EnXeyutb87PFKKZn1aKLpZrB2o7WsbZX4IMOba2V2z9wEq5Ul
 pxNRKtcTzfWjzg8AmtL4Kne50qx+kWZuFgjqDD8gYEdD/q4tCCfnxKaVDShJcHtEKYd7
 CJh6PIa+skjqafUh/UJqNC/lxBCWT1ZoW78W2NnC/9J4AqKabCf62PtwBx1Tv4HJAssl
 RdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y7XhTOS8dyDsJq/tLHxB8s8UpB/ZC8LdUdSKfZZti7Q=;
 b=OKo60KA6Ey8Hs6c4Zudtxa+S93aG9v2Fz2Wz7d7bIQcQ/YJU3nN71tCFvZ+SZ+/xPl
 lSqgzblnaG5HiZ1QlJUXTYIOnHcLQ2p1ZTyhGEjP8o/76l66QkWJocNckDCodBhH5mKU
 cDjaNFceNzZtG9i+UkjFNg4hvw3lilVAZ8200Qqrp3ENuC3/zONzjOBeLXm6lpn57fWi
 DLgZxa3f02oApXzZrCe2Va1mRsyx6UWO6cRh588DblSmFvX3Vj+qKoXhdrtmuWENsGRQ
 8Q9Kvmgv43L6IflPEpqz84NJJAJf+/lSJMwo0NMCc4Y0sRaRRr6irbw6SwIHDBPcuVcv
 RFyg==
X-Gm-Message-State: AOAM530xt1xadO/1hT/ESB8EDOEJD6xR9ejE61EOLefDk5m1rdHdJ5ff
 wPdjEPvNpq70HPxomZH9182AM5PZxyOG9g==
X-Google-Smtp-Source: ABdhPJyLBSnTtkWo/vQTUbP0vBJBZvPflYJTgehBeZ456ZJrkY0WQK6Nu1zweHG/3EPRSjO68Tok4w==
X-Received: by 2002:a19:7501:0:b0:44a:2f6f:3ae8 with SMTP id
 y1-20020a197501000000b0044a2f6f3ae8mr5430428lfe.143.1649239969985; 
 Wed, 06 Apr 2022 03:12:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i4-20020a056512340400b0044a310f72f6sm1782154lfr.250.2022.04.06.03.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 03:12:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/3] drm/msm/dpu: remove manual destruction of DRM objects
Date: Wed,  6 Apr 2022 13:12:45 +0300
Message-Id: <20220406101247.483649-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
References: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
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

Remove manual removal of DRM modesetting objects, it is done anyway by
the drm_mode_config_cleanup() called from msm_drm_uninit(). Other
MSM display drivers (MDP4, MDP5) do not manually destroy objects and
trust generic code to do it's work.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 33 +++----------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e29796c4f27b..d0525a9ea92b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -675,30 +675,6 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 	return rc;
 }
 
-static void _dpu_kms_drm_obj_destroy(struct dpu_kms *dpu_kms)
-{
-	struct msm_drm_private *priv;
-	int i;
-
-	priv = dpu_kms->dev->dev_private;
-
-	for (i = 0; i < priv->num_crtcs; i++)
-		priv->crtcs[i]->funcs->destroy(priv->crtcs[i]);
-	priv->num_crtcs = 0;
-
-	for (i = 0; i < priv->num_planes; i++)
-		priv->planes[i]->funcs->destroy(priv->planes[i]);
-	priv->num_planes = 0;
-
-	for (i = 0; i < priv->num_connectors; i++)
-		priv->connectors[i]->funcs->destroy(priv->connectors[i]);
-	priv->num_connectors = 0;
-
-	for (i = 0; i < priv->num_encoders; i++)
-		priv->encoders[i]->funcs->destroy(priv->encoders[i]);
-	priv->num_encoders = 0;
-}
-
 static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 {
 	struct drm_device *dev;
@@ -721,7 +697,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	 */
 	ret = _dpu_kms_setup_displays(dev, priv, dpu_kms);
 	if (ret)
-		goto fail;
+		return ret;
 
 	max_crtc_count = min(catalog->mixer_count, priv->num_encoders);
 
@@ -746,7 +722,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		if (IS_ERR(plane)) {
 			DPU_ERROR("dpu_plane_init failed\n");
 			ret = PTR_ERR(plane);
-			goto fail;
+			return ret;
 		}
 		priv->planes[priv->num_planes++] = plane;
 
@@ -763,7 +739,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
 		if (IS_ERR(crtc)) {
 			ret = PTR_ERR(crtc);
-			goto fail;
+			return ret;
 		}
 		priv->crtcs[priv->num_crtcs++] = crtc;
 	}
@@ -773,9 +749,6 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		priv->encoders[i]->possible_crtcs = (1 << priv->num_crtcs) - 1;
 
 	return 0;
-fail:
-	_dpu_kms_drm_obj_destroy(dpu_kms);
-	return ret;
 }
 
 static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
-- 
2.35.1

