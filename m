Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5396CD38
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 05:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F71610E669;
	Thu,  5 Sep 2024 03:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I35ai81/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3453C10E63E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 03:26:20 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-535be093a43so261611e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 20:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725506778; x=1726111578; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dMVe3dV+riSJbx0XmpXNkjqyIshg14e/HbhXiq4bN9I=;
 b=I35ai81/rzzYK4oaV47+s4qbxjUQENVyqJ4HbKc7ka12oeiXb8MqTD5Igj66mKB18F
 8DzUaa2vDDyJy2use2VU8lQHgKMOjDHeM0FyEdC25/IJiVIePrZYV7Ipub0x9tn2dbUn
 dnd6rOjEwAyKyqk0mC+sDkMEYC7pI5DIaeAUBkZbra5qoX8IfACZe/eBRa6qyGZhNk0p
 ZErD/IWfh04SxOj0B86hFt+fIEc4X+GIuC/IAGQeCc6Zh9qY3QKfEysYmojUzOl+MOfm
 qjBQ776UN13VuYHS0bEkU+RvUUAAfU+uus0yJD//dqzkaXeGPWgoSH3K/Spkif1UYzDU
 3EVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725506778; x=1726111578;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dMVe3dV+riSJbx0XmpXNkjqyIshg14e/HbhXiq4bN9I=;
 b=sH++VB4VBn52djTCbued+Zt27FX0tGGry++iA22h5IgLtPTsMZL/G1urZu4glA1gyT
 Ee5dP2cvFnFMLSC/fTzkIO3PkNFdHRMiV7DIiPsr9mooqpk9mWG3A9oR362f7ysvHEs2
 NT4bqZVeGz/d6yPejV6alsffj3dNRbioF15CVwmMBPv3roxZafUVa6qwQhuwhFZnQH5b
 /b/m2VtLhzbmRDD3cTmLj0eKZhjLe7AR4YvvNueBy/2z90BUYITcAly8diZbrgI8MutA
 feeHPynTVBnaKloK7RwZZygpghhOVD68nLnWXMvkpVMKbEpPhPLlerhPTw87RkuP1tim
 +i1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWG1IR736LxzNScMZNdIHBSxXfKHh7pq/ljDvtF3Ssd+cjRNFrwK+Zc0ohqfEbcBl+/X19t+R+z6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuLRNisw7nRgdbXrVN+k1SqsgFVWKfcMOHW5mEJNcc0MFMhPfg
 /ZzdMjmzuvN35VzhvQpoTKQqkb3NLkCX65LQfD94W7T+A10p6gxiIhL4bcuvR2w=
X-Google-Smtp-Source: AGHT+IE+acS5vwCPZFfqy48BFrmCtYX0ql9IXQeheRpZrwQ/SpmPQiQYu7G/Vy0git+9k2kOjN0YnA==
X-Received: by 2002:a05:6512:3d24:b0:52e:a68a:6076 with SMTP id
 2adb3069b0e04-53546bb4d0fmr14476272e87.49.1725506778081; 
 Wed, 04 Sep 2024 20:26:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540841a3csm2533860e87.226.2024.09.04.20.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:26:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 05 Sep 2024 06:26:15 +0300
Subject: [PATCH 3/3] drm/msm/dpu: drop LM_3 / LM_4 on MSM8998
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-dpu-fix-sdm845-catalog-v1-3-3363d03998bd@linaro.org>
References: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
In-Reply-To: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Archit Taneja <architt@codeaurora.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KnnNbGZkukvbhdJ4+vjUC7nnvFSR94+qavRX0iu+euY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm2STWnttq8+i1NuRxG0sRjN+Pu4vbmRCduSOT5
 PdTVOSI9cuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtkk1gAKCRCLPIo+Aiko
 1Y0ACACbYLNDW/4i+2oZ6R8wbt8nuCMVXDGVTRy41HFmR9wJLSiqYXZdU88wXVZUoVToIy3ZnzQ
 MB2/Y7veEbRQQm+4ZuOLZh/+kALsNMc/GGZPH/pkBJAXCp5isa87fYxWtg35rn7kjsni0F1DSol
 OO+Xs35CudYnkNtVxbxez+/Dw3OIba3jpCNngWHkE9ADO3lZBE+nOTE1xoVZfc4TAHmhZrJyeTv
 ntEcJmCYKGwKlgwFGXe/4aBNf9ZlvjvLz+XcBzEOfiMF6lhCqVjk68btl48xGZp/S/MTs1uJFW1
 E4ma7P6ds374GzuyyttRXUcK2LCw+3cSZOP1b2vakxWtDkSL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

On the MSM8998 platform ther are no LM_3 and LM_4 blocks. Drop them from
the MSM8998 catalog.

Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 1d3e9666c741..64c94e919a69 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -156,18 +156,6 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_2,
-	}, {
-		.name = "lm_3", .id = LM_3,
-		.base = 0x47000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
-		.sblk = &msm8998_lm_sblk,
-		.pingpong = PINGPONG_NONE,
-	}, {
-		.name = "lm_4", .id = LM_4,
-		.base = 0x48000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
-		.sblk = &msm8998_lm_sblk,
-		.pingpong = PINGPONG_NONE,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,

-- 
2.39.2

