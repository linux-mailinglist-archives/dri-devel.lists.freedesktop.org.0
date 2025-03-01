Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC7A4A9FB
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 10:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5504D10E167;
	Sat,  1 Mar 2025 09:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OzWJprgB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E04810E1A1
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 09:25:13 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30613802a6bso31836011fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 01:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740821112; x=1741425912; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=URwOcNjnz6PkMJ2QDjvaSLAsGLbSDP+kGsc1C7zaZt0=;
 b=OzWJprgB48RskC+QJhiQ/thQgeALx3F9ngmFSv7ECg2FtcD6eG802KlzU32DeWfDPG
 VOaLHzUzccYqbUyuTJgHZ/rANjWRZrKZtGNWWgXrlVl7YY4a4quzhpXkMUGJrehWSLVf
 iYUUmvqXk1Mf81wLzmUGlJF5aG63kVHSgnt2DdwQQAkRpa0ir8L+R0OVMC5l4jI+GTaO
 aeqS2K76EO0w1vwYY2S9d3F0DFoEH61DXJG1BO/SLUIT0Y+LBNzajuM0w4KbjTrsxTmG
 5yN0QQN2RFQvnqVTG9uZ63WgOCkgRkSCQ1WFYGFqq84xIgNq1j8POe5HHychTjV+afYU
 z6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740821112; x=1741425912;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=URwOcNjnz6PkMJ2QDjvaSLAsGLbSDP+kGsc1C7zaZt0=;
 b=pgfwFrmP/IgTq48FZTg85tnhO44KIWMbnkKeO7XVKYMFzYUygXHXkjce0WAlMbWgfY
 Cv6WPmbqVFjtLrufulRzgIjGvM3oq1OjC0ykRNiuUMUJaYhohov6tjmXpcqQ2zTUVGg7
 JrDxEJdGuqybqGNAxYsuVE7VoDpwZmpifJSZJH2wlyYlx4Irs1nKm/aHI90npmX5InZT
 Fmhea5hrWB4N7FABgK/GcAlgCJcq6I4GijQz01wZughGkL+U82lhNac36qmgjwz3kdTm
 /e+tnewxWTGk6EwsFSZOihu5IlvDYC4gtuT9m0P4ZbsRzGJoLZsNdOv5rTFMoOhn5svl
 WKGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVPaXYl4uauh2jHEPwWk6iH4/GJxsOyzfNJ48RhyuIgeFj/s0v8yUWrNdFqJSo5r52L1Xvw5ZM5Ns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBpgc//xevPxhWss1+/jch9O4wjXi90EenFD6oHjm672WXmN9B
 AdvvR/nS1o2sF5wPtkvIFMdZXPVPximYlMrA3pLf9brnWfFuqHNyIpZ27dQd52U=
X-Gm-Gg: ASbGncuXqkCavB5CvyJbVVu9Xs+t912PG8NNjVqqbzK4thAV3R5IEK8qjIfl4SQLyYY
 SjOFL0+Kn+SvV7zz7I9s60TbzGWmFSTbcxxXDFBTR5j4p6ut4JtBfAy41istiJQdh7rX3n4SOZB
 uAYqh3+tW2u8xzl8RGUzKlOV4PgYWjnaKyP4QaEJ17qLyi7oHeS5pnSEWQyCNoSS04Emp2d0w9L
 N2pwieHf938pT5bZXQWWWpXsgIaqh4mU06LrvWp/0XUWQRpH+CQ86RkhxpcANPWdPTVUa9y8qQ2
 fGJLysuUKHVpU+UFzu9akI7LjX5gUkZ43c00VPZ7iopAS7JmK2m/
X-Google-Smtp-Source: AGHT+IEh8A2sl1pAlOlMCHBvb8v6txd7ryhkeXioo/K+sIwr784pk95XMok+4SarSyMfmUmdP9cUsw==
X-Received: by 2002:a05:6512:128e:b0:545:9e4:ca91 with SMTP id
 2adb3069b0e04-5494c38072bmr2929372e87.39.1740821111736; 
 Sat, 01 Mar 2025 01:25:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494417432csm738406e87.52.2025.03.01.01.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 01:25:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 11:24:58 +0200
Subject: [PATCH v2 5/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 SDM630
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-dpu-fix-catalog-v2-5-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xfJndy0LJ6tSYaPs6OPWvlHfde8Gt+RzIdnKqXQJW2A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwtJouDh1p63euLoMf/eO1Aa1kaVi4m9jHe64K
 bORUvpxw0GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8LSaAAKCRCLPIo+Aiko
 1Q2wB/9+J8HcIzLcD4Z54mCSlyjwkQ3C2RZjJ0uAwHKstzXjx0uAq015I1fXZN787warvOm3j3L
 ig0302evj00WTzKaZrN10rzDnrgNK02AHwxv8GzoFst4YwaX6cEHT+KdUdURGSwS9ZTrJiTxTLw
 mxpz/opigMTdni3hSRSAGrPYop6rS3y8nVJ4FaFfXPptbG/RBr0iOlIfL8rgqK6DWb0bw7vYMJm
 xlMPF66WvRaTDGCudXLahAGjGqT4ggHR+p03OVjhQdOyCGRscvTvI7Q3JwqN09qFwJSKR/+y78n
 vU7sLNkNz1VHMK+BKtoWqHFza6tec6uBRWhHiKh9KtHSCX/W
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

The SDM630 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask, replacing PINGPONG_SDM845_MASK with
BIT(DPU_PINGPONG_DITHER).

Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---
Note, Konrad pointed out that vendor DT doesn't define DIPTHER support
for this platform, however I believe this is because support for this
platform predates DITHER support in the vendor kernels.
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 3aed9aa4c533f167ece7b4a5eb84fe49c4929df5..99c0f824d8f00474812bde12e7d83ba3de1834f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -115,14 +115,14 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
+		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
+		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),

-- 
2.39.5

