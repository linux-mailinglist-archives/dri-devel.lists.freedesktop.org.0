Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50576A33337
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 00:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D952D10E1A5;
	Wed, 12 Feb 2025 23:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P32O/1CL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC68310E294;
 Wed, 12 Feb 2025 23:04:44 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-21f92258aa6so4633405ad.3; 
 Wed, 12 Feb 2025 15:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739401484; x=1740006284; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iTjaCB1N1ydBQMqBry8fjIhD2HufxSwLUhUWeWGMn4w=;
 b=P32O/1CLzG8GGo27dAisKWgEvsDc/ah7KZHqwY1pG/0lsSlBPbV30719pj+v3vHDzh
 HBRfe9rdPSmoLe8EvUBhn1s+tL5ENNandtElEkFMcXMLOu8UI/lh8wa6NL5u++oDeuvh
 vb5xp8uOj8DKkl46Ue6Sxk2Z0e0I9YEZO50eXUN1w/LYszg3d1Zl1BRvsONYwFQB8Wzq
 9C7JkyIUyBjnIghyjLmi8ZuiZ4gFV4nfKOdtHIHl1x772QRddbcF20k2q/x9g77GGXAK
 2BXLuLQbDOpDtVZQOiO2wuUFpKmCAoydknYE6oDWyD+BYVnsLJlGLqX/mLG5PUsQ/Lkr
 y8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739401484; x=1740006284;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iTjaCB1N1ydBQMqBry8fjIhD2HufxSwLUhUWeWGMn4w=;
 b=Y4x25Xo3TABKJNj6ngHLtN2skVwnJc69/++QhW9YGfyhuaMRfv5tpyCTirX9KoT4OR
 IjMkZu83E9Htqg77PzuL5MhoAivXqsdUa9TedCHHkHrSoUmzKQrflxUmdoeOXtAOCkXU
 yXpcZ/BXp3z984lCSUwR9YPJNaiMhqbyjX65S1idSuZyH/1sI21hPnmwpQKWwYkJZce9
 4+eiCPiikUtkr+yUX9Vvk0RmN0JGAuKKEgURe6xuAqFHdCYx2Mx3FheBswn9iYo9DM1O
 BzeNbuU7AnWfzKOKUJpnX8tbkYx3R79gCGM/qavS253phZ8KlNf7WgGT9968d2YCkunB
 PsYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGSEXg32VSa/UXgR0GvKPisey8U8Lf2RRjqWCOzWJww3Sxj5Oe6irXKk7CD6LtD6w93wG9DlW66+s=@lists.freedesktop.org,
 AJvYcCXONIlERrLsxpkN1kfkelQWzn1H5j33kgCV70hrT7rtdrP99ngVMJcVtHI8z5hnfCdTiAi+vI6f8ENI@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+HUcQK4tJD7kVZWWPsJ2aDPE9a3ucbI2wiRdoo9+UPlfgC4xk
 4PP8oo1V4kgZqes5AL+fa1X5g9dlG/e76TSdtre2+q8Wu+o7MQ70
X-Gm-Gg: ASbGnctDmyROlxjZW1DgvlH2bOvMZDE2w7Yb5ZVvO7hk56N40t0N1g6F2a7unbRYpRu
 Ju3xqb7EnVc4Oy2WUXLtVRNbHZp7ncdCIU3u/lE8uc0nWgAU7YvjuhzpZFmSPxoG5SGgeK+8pNn
 ajJ0uKLkQs26lYRrOwWuMMm4yN78v1b2rdrwiNO8hcX2lAYVtP9hvJ8bB332zWPJprUlqoUN37E
 h6HyQA3t8O6GlOb1CdFbFzJygI3O+W270g2WuFSftn3bOtAzDIsEJGd/pc/7TkKoHs2vr/a2/a6
 nt9eMWDlJCNBRGcX1QAuveEP
X-Google-Smtp-Source: AGHT+IGCJuRiPBEnF028173kRiuvUsRuqyiYHzbcY80Rfwz3Vr7Pl2PC2LVpfE2p9OX/RX5jivzdRQ==
X-Received: by 2002:a17:903:2b06:b0:21f:8099:72d9 with SMTP id
 d9443c01a7336-220bbb0c43emr83000825ad.27.1739401484137; 
 Wed, 12 Feb 2025 15:04:44 -0800 (PST)
Received: from [127.0.1.1] ([66.119.214.127]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d556da47sm695655ad.187.2025.02.12.15.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 15:04:43 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
Date: Wed, 12 Feb 2025 15:03:46 -0800
Subject: [PATCH v2 1/2] drm/msm/dp: Disable wide bus support for SDM845
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-sdm845_dp-v2-1-4954e51458f4@gmail.com>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
In-Reply-To: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>, 
 Tanmay Shah <tanmay@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <groeck@chromium.org>, Rob Clark <robdclark@chromium.org>, 
 "James A. MacInnes" <james.a.macinnes@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739401480; l=1781;
 i=james.a.macinnes@gmail.com; h=from:subject:message-id;
 bh=PoBx/4/qGynelh/uiB6nFH8WP+X7fpoOY2mipC9UhNY=;
 b=gJ5JFDtuCFVR/JXUlm0GmVoAyZl6jPM3zN4afSUKnfdEn71BBX5Wx/qHtZs2pnXItrHlC/VTN
 B5dhn5ObKt8B7jzkMlIM28f9raC4LFJm3yLOwZ8jW6sXVY0WcxR3NIn
X-Developer-Key: i=james.a.macinnes@gmail.com; a=ed25519;
 pk=3z+XoIMKkNT7N5GL2WOp/Lcz2ghtr7b8RBCa1usTz9U=
X-Mailman-Approved-At: Wed, 12 Feb 2025 23:13:20 +0000
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

SDM845 DPU hardware is rev 4.0.0 per hardware documents.
Original patch to enable wide_bus operation did not take into account
the SDM845 and it got carried over by accident.

- Incorrect setting caused inoperable DisplayPort.
- Corrected by separating SDM845 into its own descriptor.

Fixes: c7c412202623 ("drm/msm/dp: enable widebus on all relevant chipsets")
Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aff51bb973eb..e30cccd63910 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -126,6 +126,11 @@ static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{}
 };
 
+static const struct msm_dp_desc msm_dp_desc_sdm845[] = {
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
@@ -178,7 +183,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-edp", .data = &msm_dp_desc_sc8180x },
 	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
-	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
 	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },

-- 
2.43.0

