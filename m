Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 316144F481F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 01:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F72C10E5DE;
	Tue,  5 Apr 2022 23:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD3510E428
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 23:51:04 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id z12so1165198lfu.10
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 16:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GdBxSh9sm8JFxfcg4oZuWWjNQ4XkQKxAD+ykd2e7Nqo=;
 b=a1MrN49R7Y+OXVs56RUzeKwoND1E0SLksNg3VGcWXZTzNDbb3zzEMPXJ6ku+pX72/L
 jnsqp2kp4B35YeytTJBtFtRNj8Mig39RygT8v2RsUDzsaPAxTRPL4Iks6eOQqOBZD+PO
 qrG448SjP8q+oKjNU5JRQqK/4fh28kjGZ8JH6Zqd9qFD150qhjvabZEkW49HqsC60LOa
 VSQRxwFxvmtDtXZPO1r9je3+sqTRkz6De0c1Q6QPRvdzK7iXjv6TGeluHzCjQR0F1KhD
 o9UqaYP8kkSysqjfNg049A35T64SFNz1vmHo3xaLz2MmBOxG1dcYbIZ3LAhAR03at1g2
 umMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GdBxSh9sm8JFxfcg4oZuWWjNQ4XkQKxAD+ykd2e7Nqo=;
 b=rhRMh1tPDYJZytro1GuNyEfNLbuIJS58Nqfj48bIn5n/VjDpoXhX4DzJVee4KtjBjo
 NnWsdZx6N1CzQl8siUjMGgI3MMcyCawW0PdAoZ2hMS3Nj+jk7l7qbv4dFUj/g6ato03Z
 J94HcUpGK/7Cgl4nYa6FdzVOqtyb+yJinxgMkZVXDGpROcjs0Dqj/8mGJBmRVIyANl2h
 1rVyMyOM3y3hqAWbfJRGJuHXPRjmebm10K9Jgx3ADsHLdKdcPJe1KdQ7oVk19MeI7bzq
 mMISUkGFEYNn7rUJtC3FGnemsFrEpfpLpDswZoBZIyVXeHjQ01uTwa+FNMRiN8IgKr6y
 xyQA==
X-Gm-Message-State: AOAM531tKwk6+GkBTSfoMQxrQX2KImMCMfPeufLbIm2hZBJDP3XK4fih
 ksMaS4pz9dhi0Q96jgqXoWq/1w==
X-Google-Smtp-Source: ABdhPJxbihuuvB0EymKlPYm1DN2/hIoDbDRW283pP9l8yyUgGD4CiLfRQ2M+4enOXS9v/1+CCveTXg==
X-Received: by 2002:a05:6512:3052:b0:44a:5104:5646 with SMTP id
 b18-20020a056512305200b0044a51045646mr4095313lfb.286.1649202662488; 
 Tue, 05 Apr 2022 16:51:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f26-20020a19381a000000b0044ad7a29b4csm1645280lfa.37.2022.04.05.16.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 16:51:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/3] drm/msm: loop over encoders using drm_for_each_encoder()
Date: Wed,  6 Apr 2022 02:50:58 +0300
Message-Id: <20220405235059.359738-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
References: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
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

