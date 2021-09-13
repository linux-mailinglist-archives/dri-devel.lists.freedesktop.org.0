Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB99409B80
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 19:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418626ECEE;
	Mon, 13 Sep 2021 17:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659F56ECEF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 17:58:35 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id p4so11506634qki.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+6WaFPuJNdulE2a71MWNvhB4HPvAyDmtnLHBKmekCU=;
 b=PKMyuyd9+YkMiZsAsexpW3DBB1F7oyi/nm4F/w7UslRR542ivJ5iyxBN+WbK56b7mo
 LQ67aEy5Vx2EQZr877k1fxvFMSikgFMlYqLwLZJV3q9iC0RPq4zGvjBGjLuWKaDj8D7i
 wfsi///GS5B+pNWTH+JB5XFmDuMlpk6vMDQ+bnpIDj3ay47Mf7pz3K+ovl9IBedLuinV
 qJZEP47RH9/V91WEdeDSR5/KxkvZwrd+VhZkL9ubhg8xxyBu5ggwhBlyykt+42VnirI0
 jIa28TMnbWzrrCc7nnj1Q2J79i3U9I7+bO6Eh78elFVSNGF+3nOI3bM3CgSxm/7hd9Xi
 GERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+6WaFPuJNdulE2a71MWNvhB4HPvAyDmtnLHBKmekCU=;
 b=DwZ6S1ENUPNgQdv4In6bqFzv+buWiKFCyL5vzzegnzbg7pmGmSEKnSdqiv2rL5ozBo
 L3OuUG9KwCIlcc06l6htV4Vvwu4DIWJCvVzClAQY/ncemuH43VfG4WpGovbqZHKXgqUI
 xgMsoAKPEY52aMohGYbnwiV1wzzk4DAU+gfHMC42DXv9ONoDiYn3nrLnq81aGMQv8YsB
 SK4mOkNmuKZ89UaXcbYU58pj1oX+Sob2bMYGQmnawsMxw8FraHl/R2NRT/3Wmr/ymwdb
 gPQ0Y9bOWmi/sDqC1ISIYqo9rOxi3/mF/sBqXYH5oqXrBP4ysLyzQoLvk4byfMcSdFYh
 DwcA==
X-Gm-Message-State: AOAM531Ij+MGoxzuMYKu79zoHAo4koezjIp4sH3CtKR3Gzlkec/ZnqBq
 cbN54evNoFRP7jhGSZjDGwLPt6y7waeeoQ==
X-Google-Smtp-Source: ABdhPJwl+Td2WMm8W4F3OofmEcObzvIvucw3dtD/kh41IeSvVHSFPiXgVUnsjCdQKbfmKKO+iNP+8A==
X-Received: by 2002:ae9:ef96:: with SMTP id d144mr870327qkg.9.1631555914473;
 Mon, 13 Sep 2021 10:58:34 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id p123sm5989677qke.94.2021.09.13.10.58.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Sep 2021 10:58:34 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 09/14] drm/msm/dpu: Remove useless checks in dpu_encoder
Date: Mon, 13 Sep 2021 13:57:40 -0400
Message-Id: <20210913175747.47456-10-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

A couple more useless checks to remove in dpu_encoder.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0e9d3fa1544b..984f8a59cb73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1153,10 +1153,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	struct drm_display_mode *cur_mode = NULL;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
 	mutex_lock(&dpu_enc->enc_lock);
@@ -1203,14 +1199,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	int i = 0;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	} else if (!drm_enc->dev) {
-		DPU_ERROR("invalid dev\n");
-		return;
-	}
-
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

