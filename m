Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C4F80CEB9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 15:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D7210E474;
	Mon, 11 Dec 2023 14:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973CA10E474
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 14:54:43 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c9c18e7990so62353921fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 06:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702306482; x=1702911282; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RgFTnt3qZJvfNWf3lL//IEKsENotxReRQKOq8qe68lI=;
 b=SC+zBsp8Fxivln8S9r1iUKs2lW2EU+msJ+4irgvJFZLIEEVS1nBZzDdYvXlcCD/+tr
 2X84oOMC1DGVYugmBdM8uSA3ZRp3a6p5GWrkpfhzs0ZjezcVUtEKjzDLl9a6fAJdTnf8
 lH49TNoTbcEQzvKV2HmHKbHDm55hTK5Jhx5pUcRvr5sdaOfAfHNIFmucVXhrWypgFxZk
 AmsyXgUL4eSBXfu6QGwk2hJiEbQlMQSGyZ+b1rGsu+jhTCkh+ud8MFk9xd3MPXu+25ci
 eaAVCW3wwLA3Tc4uP1yLhEHWORsr3nxs3eB3xKSIQ6AwHkdLrqKLRa070xWVz9erQPWk
 ODsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702306482; x=1702911282;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RgFTnt3qZJvfNWf3lL//IEKsENotxReRQKOq8qe68lI=;
 b=OQDnYE915PGZc1JQvPW3a7ecaXRYdyr2ou/K/DFvBcFO86U/K2/Edf153C2l2Q6zEV
 CmgSri8sEHR+wrbUc1oEihsq8jUUjg5iQGs3cExJNSlLbGF5ct8ocb/27fnvhju00AKK
 fk/r12iy4RvlOnP8MgVsGUgq1CaUzQCX1xo6ipuemSvCA5TyvOiD8DXYG/rYBkKCbR6o
 ljfl1lElZrMzEOd77tA2oUkUkAeGoSw6j0oHpvOalc309NIqaxtKtuYW62UqXgXh5ztA
 YyJ9q0lg1NjCETQ4hrtWT2U8zos3AWdCfC7eAQPtEcxQ2adzgLV+Hb1xmhPE2G/6vxad
 UzzQ==
X-Gm-Message-State: AOJu0YzqsKSoxqOQN4BEVzd95IU0OIZ7xBZLr0K+AeONoPbVePet7OaX
 zEFv8Qm41BQf2BquWvmZMk2NZA==
X-Google-Smtp-Source: AGHT+IGr8J6w01NY5cbDlOuF4emsiRJ9tq/klXFYiGXVOl3b/5MMkmAtpWW7+TzLdyUHXnRrH7RA7w==
X-Received: by 2002:a05:651c:990:b0:2cc:1ea9:2b9d with SMTP id
 b16-20020a05651c099000b002cc1ea92b9dmr1735596ljq.48.1702306481659; 
 Mon, 11 Dec 2023 06:54:41 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a2e8ec5000000b002c9f1fdea4bsm1244272ljl.17.2023.12.11.06.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 06:54:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/dpu: remove extra drm_encoder_cleanup from the error
 path
Date: Mon, 11 Dec 2023 17:54:40 +0300
Message-Id: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

The drmm handler will perform drm_encoder_cleanup() for us. Moreover if
we call drm_encoder_cleanup() manually, the drmm_encoder_alloc_release()
will spawn warnings at drivers/gpu/drm/drm_encoder.c:214. Drop these
extra drm_encoder_cleanup() calls.

Fixes: cd42c56d9c0b ("drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index dc24fe4bb3b0..d60edb93d4f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -586,7 +586,6 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
-			drm_encoder_cleanup(encoder);
 			return rc;
 		}
 	}
@@ -619,7 +618,6 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 	rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
 	if (rc) {
 		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
-		drm_encoder_cleanup(encoder);
 		return rc;
 	}
 
@@ -651,7 +649,6 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 			n_formats);
 	if (rc) {
 		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
-		drm_encoder_cleanup(encoder);
 		return rc;
 	}
 
-- 
2.39.2

