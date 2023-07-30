Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEDD768333
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 03:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444D510E196;
	Sun, 30 Jul 2023 01:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E12810E24A
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 01:19:38 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99bf9252eddso180425366b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690679977; x=1691284777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2E4DJFLdWI1gv/JfAdeR4c5wO3YFF9TAJvQtru6WdMU=;
 b=U2x9JK9wxLEcJHMFDMhuABRRsOEpQL6Sge8ZApiKMTeb/UkBeKMzpZwoDAgWJ5fgBO
 K1vj1SOGO94ispOLe+veW1RJT5L9OGywOZrSk+xgRRSzHHHiA++dngQSgyY5jT0b9QJi
 3ova/vpaSeUH6E66K6K7qjdZU+YfsusVY2hujzZiGbCodLMx38qsW+ihv1ROgglDWC5r
 ogx7Nvf0/XldA7ChrjAQyRin0lJi7PxrRFqrixRGo0peljaROXFsw6DpuyDslHoK/TmG
 fTStFyTijeG6Mfd8KBenuyKYadcUz/ZiDrFIQLuxVqOAGvIyywd3Ctcs/SRCcAXyBzJl
 Jcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690679977; x=1691284777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2E4DJFLdWI1gv/JfAdeR4c5wO3YFF9TAJvQtru6WdMU=;
 b=BfnjMbyAhvwvrX9XWWP8CWugIjBh1yyWZcOg0bqhxy/wY34QoMFMqaIuzoqUDeTKEQ
 rdRA/TdBx4PBPPPF7oIM+W+Ykx3nY6VAlu2fdQ9vy0+M8tqfhyPK905xYleUsxpCxnSk
 FxLfmzRnUxjyDbsq9vmY6OutsfrXcfK1sp4YMNZ1uW1AuGBzMfV44z2tVD3FRzllLJAq
 3K17R88V5ecaZ16MHDN2XX6K3SasbFGTQUTN+Kj0y3BFXvPiAcHMO3wLRKpkJo7TIBxf
 t9diqW7Nl/Uf9RpEW5exOY7PelF7VgkNxEsLelsPkLeZb5ulkx3rjW8XdbnWzGkNScK6
 GBWQ==
X-Gm-Message-State: ABy/qLZD297tNng+1vtkh0DuwVItzU98nu+a26z1zu3NhTyPE4lZOCcx
 TNgmSxB5RV2Wt+dYvmc75FZaeA==
X-Google-Smtp-Source: APBJJlETVWWvYdxFB7cfwYCav7PRokMM199LskN/Ydx26JUHyemzI/a76JYScnv+UMriMgn1PJrhZw==
X-Received: by 2002:a17:907:7819:b0:99b:c778:d46d with SMTP id
 la25-20020a170907781900b0099bc778d46dmr3577525ejc.75.1690679976916; 
 Sat, 29 Jul 2023 18:19:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:19:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 10/13] drm/msm/dpu: use drmm-managed allocation for dpu_crtc
Date: Sun, 30 Jul 2023 04:19:17 +0300
Message-Id: <20230730011920.354575-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change struct dpu_crtc allocation to use drmm_crtc_alloc_with_planes().
This removes the need to perform any actions on CRTC destruction.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 25 +++++++-----------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 8ce7586e2ddf..c908dae54678 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -51,17 +51,6 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 	return to_dpu_kms(priv->kms);
 }
 
-static void dpu_crtc_destroy(struct drm_crtc *crtc)
-{
-	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
-
-	if (!crtc)
-		return;
-
-	drm_crtc_cleanup(crtc);
-	kfree(dpu_crtc);
-}
-
 static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
@@ -1435,7 +1424,6 @@ static int dpu_crtc_late_register(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = dpu_crtc_destroy,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = dpu_crtc_reset,
 	.atomic_duplicate_state = dpu_crtc_duplicate_state,
@@ -1469,9 +1457,13 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 	struct dpu_crtc *dpu_crtc = NULL;
 	int i, ret;
 
-	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
-	if (!dpu_crtc)
-		return ERR_PTR(-ENOMEM);
+	dpu_crtc = drmm_crtc_alloc_with_planes(dev, struct dpu_crtc, base,
+					       plane, cursor,
+					       &dpu_crtc_funcs,
+					       NULL);
+
+	if (IS_ERR(dpu_crtc))
+		return ERR_CAST(dpu_crtc);
 
 	crtc = &dpu_crtc->base;
 	crtc->dev = dev;
@@ -1491,9 +1483,6 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 				dpu_crtc_frame_event_work);
 	}
 
-	drm_crtc_init_with_planes(dev, crtc, plane, cursor, &dpu_crtc_funcs,
-				NULL);
-
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
 	if (dpu_kms->catalog->dspp_count)
-- 
2.39.2

