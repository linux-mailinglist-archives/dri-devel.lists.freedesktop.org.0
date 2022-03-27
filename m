Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 510214E868D
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 09:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C1810E054;
	Sun, 27 Mar 2022 07:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF13110E054;
 Sun, 27 Mar 2022 07:33:01 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so9738928pjo.1; 
 Sun, 27 Mar 2022 00:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=YKubZFE6bM+QSkBsG+9QO1RxuSxqs+5gFlfSVbQQPZM=;
 b=VZ4ulUcfcPskQTm+VP+1tNFGk9rxfIjmMpkWEYsSvkdG8F0oPCs5b2j+Ayxot6MhTY
 sIM1zO7pvPXr5csmHmxug3yU8T450E66bZa5PM+UuyTrhahCi0J2x7zs20c5uNpWDEuS
 2u2N/5dr8tpEwfrho4YZuhqrVZxQnX/9dIdWW9C+rp2SxaWzPFpAyVsTSw4odFx6+yaV
 FSCc40Sy0WVQl/2T0zNgitx5om5ds0AE41dxr6Ebah7IdMOL5ZnHulfneOygKC9kmivs
 /r/CwCmM0C2nB5zyeH5ZpDG3Ja1/VcfegeGPnV2xbjA76xO0jczW9+GI0EIQjXLnhVbN
 PSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YKubZFE6bM+QSkBsG+9QO1RxuSxqs+5gFlfSVbQQPZM=;
 b=ZdmFbp/+/CGC6bcHRkLirTp6KvLreW1iQkvuJX1hYKX5r8JjKEdAuUf5wX3d4d5/8Y
 ruF6GgVkDudoasJyAnv8J00qJGfZxrYLaNvWd4YDtEmOaLZPEYCRnKIGfhFj6YnVJEQN
 U1NCGnGFFmmMcmMFye8roAu8nfLtC8wGQUdsv2C4gg1TFraabJpK1ry6ghLDBwTIk/0L
 IauFOPYqejpIn2oOdzprSodtxzgnHMiVc3bUnN/htiBooJ2GtoVmh1sz0q4J2o50EJJU
 39EfuLtplzF72/rSNOMMLO+sC2DXRJh6kBYnLrgSycQ4Xn79DmrgpeZnt6u5hH6F5NFL
 66rA==
X-Gm-Message-State: AOAM530Cvz+iE5dRjCQSfYIeUVMURHoqtrcrkiXJ8kIUrVygG/D4GkD2
 PEVugTjyTN/a0KTnPME3fL0=
X-Google-Smtp-Source: ABdhPJzze9ezzNVHssEARN6KgfiGzfb3NOY5VDH6d7E2Cd06YEKl1rpHROxsCkMbscLIKv1rf2DGqQ==
X-Received: by 2002:a17:90a:4897:b0:1c7:5fce:cbcd with SMTP id
 b23-20020a17090a489700b001c75fcecbcdmr32747388pjh.45.1648366381225; 
 Sun, 27 Mar 2022 00:33:01 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 h14-20020a63384e000000b00366ba5335e7sm9528888pgn.72.2022.03.27.00.33.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 00:33:00 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] dpu1: dpu_encoder: fix a missing check on list iterator
Date: Sun, 27 Mar 2022 15:32:52 +0800
Message-Id: <20220327073252.10871-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: quic_kalyant@quicinc.com, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>, stable@vger.kernel.org,
 dmitry.baryshkov@linaro.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bug is here:
	 cstate = to_dpu_crtc_state(drm_crtc->state);

For the drm_for_each_crtc(), just like list_for_each_entry(),
the list iterator 'drm_crtc' will point to a bogus position
containing HEAD if the list is empty or no element is found.
This case must be checked before any use of the iterator,
otherwise it will lead to a invalid memory access.

To fix this bug, use a new variable 'iter' as the list iterator,
while use the origin variable 'drm_crtc' as a dedicated pointer
to point to the found element.

Cc: stable@vger.kernel.org
Fixes: b107603b4ad0f ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1e648db439f9..d3fdb18e96f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -965,7 +965,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_kms *dpu_kms;
 	struct list_head *connector_list;
 	struct drm_connector *conn = NULL, *conn_iter;
-	struct drm_crtc *drm_crtc;
+	struct drm_crtc *drm_crtc = NULL, *iter;
 	struct dpu_crtc_state *cstate;
 	struct dpu_global_state *global_state;
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
@@ -1007,9 +1007,14 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		return;
 	}
 
-	drm_for_each_crtc(drm_crtc, drm_enc->dev)
-		if (drm_crtc->state->encoder_mask & drm_encoder_mask(drm_enc))
+	drm_for_each_crtc(iter, drm_enc->dev)
+		if (iter->state->encoder_mask & drm_encoder_mask(drm_enc)) {
+			drm_crtc = iter;
 			break;
+		}
+
+	if (!drm_crtc)
+		return;
 
 	/* Query resource that have been reserved in atomic check step. */
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-- 
2.17.1

