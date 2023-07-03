Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405AF74535A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 02:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDA510E1A2;
	Mon,  3 Jul 2023 00:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9759E10E169
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:57 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b6c5ede714so46797641fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344676; x=1690936676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S7GwLdWUZVT1Ti3y8jUA1Y6eL5SvuXMoiLEPs7RJxLY=;
 b=QNNnPQQ7dz3xZB2ev0BD7VEVrGaMkcM2tKSTv88yUcMezVqyKYeVdzKNsvehicWi2n
 PKFrwHTrZuNCIzFRLqaG7p1PwS8xQNbvKqZWNMALbZk2ylClaH4h0IqhjmYzhjnPm8h4
 LZcQbcItjVHRC7t5riXOR37329lDjDrCuJocVBrKSiMgK29gedWxLyvxwj3Irccxc4oG
 EvhlcAMAMfXPF17X+Fd3v5hy1tOq3tix0l4VRzQtjcTzrAGUD/oyD1GOBR14xnxYn+bz
 BHclThixPj6tclubtQkRJisBAPEaBiImHyeUz/Yx1RQYEG8dTvmyXJQODFQl0ezXqbZM
 +4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344676; x=1690936676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S7GwLdWUZVT1Ti3y8jUA1Y6eL5SvuXMoiLEPs7RJxLY=;
 b=InOO5uHNQuKOw8Sirkzh4NcLhjUoshfL1VqB0+EJCH2EFx2NN919hAY9+r+09N1UEm
 F9f1GBH87T3l+vwqLqC8YF5rKklnnolCbFAFfDF2lM6tDkls0n/GYB1wX9TpRv8+yBKD
 R0qPVaxym4603zfl0BsTKk/e8MHXcra5CRJ9v7H1DqKXFSAtnCaQxiaoIr8hIeLQCGHt
 cOcXfUMy4ixQM++JWBec1EsuRXR1sTkC+ZbagZOW6hpnEMaaoTWrB7VbyfgVahcEbCDq
 upzVVfT+TCWG1gAOGAPfHP9cqUb90d+lR9mwyhVuc7iB6Q22HDy/IbsFYHo9VHl9QphC
 mZIw==
X-Gm-Message-State: ABy/qLZN4ijx2lc8j5bpjAsNmhXF5AElL0xRHovE5wRoD2KSUjM9oPPP
 gVUpJJ2hy6UuwE+H+0atD3Hzdg==
X-Google-Smtp-Source: APBJJlFKRoblJGMV6xQ3svB6jx8CgG7VOpUhAHBXfpfUHeZCmBR7GQEL8V/eIHQSK5ZNriWsQ9dXzA==
X-Received: by 2002:a05:651c:2ce:b0:2b6:d956:79d4 with SMTP id
 f14-20020a05651c02ce00b002b6d95679d4mr1708631ljo.14.1688344675998; 
 Sun, 02 Jul 2023 17:37:55 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 11/13] drm/msm: only register 'kms' debug file if KMS is used
Date: Mon,  3 Jul 2023 03:37:43 +0300
Message-Id: <20230703003745.34239-12-dmitry.baryshkov@linaro.org>
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

There is little point in having the empty debugfs file which always
returns -ENODEV. Change this file to be created only if KMS is actually
used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index a0a936f80ae3..06fc632fd6f9 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -314,8 +314,9 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
-	debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
-		dev, &msm_kms_fops);
+	if (priv->kms)
+		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
+				    dev, &msm_kms_fops);
 
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
-- 
2.39.2

