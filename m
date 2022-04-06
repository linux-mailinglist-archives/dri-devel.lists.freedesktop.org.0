Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F934F5A81
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E74210EC99;
	Wed,  6 Apr 2022 10:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8229E10E759
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:12:53 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id m3so3184304lfj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 03:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FE6MvnURSjfbK37LkPPxzBMps2ILsbNccb9PZm35uUY=;
 b=mpoYhMKZ+o4x4KT+byOPfYhZac7KhjkQPEfuSQgQLMrp4BXVDSdhwoDZbRyuIKBiXA
 8vxtDwuqaIapUeN9hetIBliDwIKMMf2SuMVszUPcjznPb7gZalGUHd0NjXiKHKEmBNU+
 aI2zQHqsz6ncGQKEGhtj707cooPbPZVg6RpXFVOB6+O8/tbmYy9js82/io5oG2z6KeEH
 LTmpDoo8L9K6jYtto7OmJNr8qp5+lUbjUKktnBH9NxYkjjmLnEwc0z3Z2jgZ4KBChgau
 jSIepOBbGLiM2/dwxiwHdhusqqbGPXL0I9+DBsX3KaK1Qt/C1W4XLoCUhlkyIkLtBHWH
 OB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FE6MvnURSjfbK37LkPPxzBMps2ILsbNccb9PZm35uUY=;
 b=EwHicSwaQjt4+Fp+VZqNkcUdGkVUSEFb2dqV0OZACrAD5ZzFwNYg6S4OFbFS1MnYjO
 +wK+AmbVQCjJY+BgkYYbmOl6eAmBxMDDaHXqnlORVhh1qpBsVTIbcSFQHKQhbD6jkfvw
 OtwaqU6kXzU7LfSL1VxnGo9iIFd1PbBNloF3tklMkrI5YgeE6MlBU9Vked1LefPj2ctZ
 FG5CfmfIp/44Bc+b/UcMRqknDP+SIeeoZ4C9b0nap6W68Orx8p5j7iFlrmrpVaJZwa5V
 DTqbpNz0PQ+ROQBxjKQVJv6BEdaqaU8V4Rgy3riV2x7K1EwHqChlcUPWNvgBXOY2WNj7
 fZkA==
X-Gm-Message-State: AOAM531ZqMyzCuTiNgXr4McGEU2UTWKXeNIyJG19lsZv2GYj4TBUMsRw
 f2aPvcdToSExBNC30/FCKhByVQ==
X-Google-Smtp-Source: ABdhPJxewWHmM56gH2X7UlQdsdnqP32bRtqY3BkZHZiecYcUmIlsIwToxFqKqokI9ghZwYyWJhYGoQ==
X-Received: by 2002:a05:6512:555:b0:44a:a75c:885c with SMTP id
 h21-20020a056512055500b0044aa75c885cmr5507568lfl.80.1649239971136; 
 Wed, 06 Apr 2022 03:12:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i4-20020a056512340400b0044a310f72f6sm1782154lfr.250.2022.04.06.03.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 03:12:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 2/3] drm/msm: loop over encoders using
 drm_for_each_encoder()
Date: Wed,  6 Apr 2022 13:12:46 +0300
Message-Id: <20220406101247.483649-3-dmitry.baryshkov@linaro.org>
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

Rather than manually looping over encoders array, use standard
drm_for_each_encoder() macro.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 5 +++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 6 ++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d0525a9ea92b..0bc33243dae8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -681,6 +681,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	struct drm_plane *primary_planes[MAX_PLANES], *plane;
 	struct drm_plane *cursor_planes[MAX_PLANES] = { NULL };
 	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
 
 	struct msm_drm_private *priv;
 	struct dpu_mdss_cfg *catalog;
@@ -745,8 +746,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	}
 
 	/* All CRTCs are compatible with all encoders */
-	for (i = 0; i < priv->num_encoders; i++)
-		priv->encoders[i]->possible_crtcs = (1 << priv->num_crtcs) - 1;
+	drm_for_each_encoder(encoder, dev)
+		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3b92372e7bdf..2ba06f979f72 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -434,6 +434,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	int i, ret, pi = 0, ci = 0;
 	struct drm_plane *primary[MAX_BASES] = { NULL };
 	struct drm_plane *cursor[MAX_BASES] = { NULL };
+	struct drm_encoder *encoder;
 
 	/*
 	 * Construct encoders and modeset initialize connector devices
@@ -499,11 +500,8 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	 * Now that we know the number of crtcs we've created, set the possible
 	 * crtcs for the encoders
 	 */
-	for (i = 0; i < priv->num_encoders; i++) {
-		struct drm_encoder *encoder = priv->encoders[i];
-
+	drm_for_each_encoder(encoder, dev)
 		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
-	}
 
 	return 0;
 
-- 
2.35.1

