Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DAC915884
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE2E10E4BC;
	Mon, 24 Jun 2024 21:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JI5TE95j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBC310E256
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:53 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52cd8897c73so3508376e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263631; x=1719868431; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EqToHdwoMaw/kv+eoY0j/pTtTd0pz39pRc2HfSbi9b8=;
 b=JI5TE95jLnct98rC67JUj+zurvjxXqQaJyK5dSOcuBWlzDXs4fvKpSHNwOEGW+uhE/
 TGYXYZdnDdM7LDAEKwxtEYmdMebaf537r+njdlM/PL16OrhLlhz+MZ2udossvkQwMyZm
 rL3ZrK7AUtuzi+hDv+ESP5keyJaUEfSEOWbi1lFJ27MXOP0ozgTkUAnYn15FF29bU8Ue
 wEU5oUFd2YRXFsPfLR+jjIL4BYjCev6yxatRocC3bJ0Vj8WGv0iwT3PN+9C6IzYoM2Bk
 aig/F9+FYlpLNSQ3wxh5fulJHL2Ic8DSN0PyvME4uou5LCU2DfWH5H1dxpafZ+RsOTsH
 jRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263631; x=1719868431;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EqToHdwoMaw/kv+eoY0j/pTtTd0pz39pRc2HfSbi9b8=;
 b=dwtyqlKOZEEegxuzEO5GjYhwxjf7WNInG7BZP0hWrx7Wab+9T+0nIuTH8Y55BPaaE8
 VjHV/DAT36XzmhaaEA8i4dWmX33xXuy5oJuYLN8dG+KQEfsyxooFLQ08ACZHSc6cr/fW
 AT46qHDO1c3hly9F5IElIDDSnt+cnAib4FBLFb9KHlvYan3KT8qLggRsUxOYgiJ87Zwe
 AOitKkcokLRu2Je4ZprPPTlxfXHXJ2BUrntJjCYeIsywMH5xri+KVChqso//f8+i2yb8
 3eRWW/jo1cbueMa/E9OwBRTHRvIWoNpo5Cx28YiL3R8NKQjQzGpOvr0ZoNiQ3XP9k8Lq
 w1ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUvTelfP/TwvP+r/rZl6iEMnT/szfGwPsdOpAizidfQt6XmRtcRONlHae9ahL1BIeRCzPo0TA/evUwiz00dGKddjxGYtSkvv1xy8RYp3lT
X-Gm-Message-State: AOJu0YxHdEwtcdE4u6Vrq+kTSSX/Fq2nK0vamYjivm+tjiNMwY+7TSuD
 7azE1OvV2Q8tgNOodLa4Oluo4liPvWQOmjwTI6JfTbrhJESwmvgWhSWu7ucTJ/w=
X-Google-Smtp-Source: AGHT+IE2xQondEQZvECIFmiPxReGgcme3MZOLqHLKQMr4bEDKDZ+8huGlEQUTrO9SnmdfBGF1L7SYQ==
X-Received: by 2002:ac2:5dc9:0:b0:52c:dec1:4578 with SMTP id
 2adb3069b0e04-52ce1864495mr3199012e87.60.1719263631270; 
 Mon, 24 Jun 2024 14:13:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:47 +0300
Subject: [PATCH v5 07/16] drm/msm/dpu: drop extra aspace checks in dpu_formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-7-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BXjW3vQxsmZuyH1IlNRwIHSsrpZblZLTmW9M+NxSCGU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGISnjCTywn2asiMABQvbQvd1ljz/cfGpMTD
 lRXzy5D8xqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiAAKCRCLPIo+Aiko
 1dCJB/0ShsSArMHTi9IBz9sHfFnkzMWY0Ey6MPeT3/MK1ctjOSmp3OfLxxeyUA+XTznNd3FiJDz
 wXAYdLFjI0H4EtiHWcvD19PPYc7Auh4tQAW8qSTsp+/qi5PpTwCcK1HFDd54kT4ARtB65her9a/
 61qkiyldUEk4XRbX08zEvqaMkKx9hpapZviYoHx5TRfxF2SnekApor/VVDltxIHdZEziNqSOQmK
 GKRr1Y+qP1tg6MY5WiVNh6fKXV1rdqxmPf8RmXPvFDFDFMzIqhirG/bxZxOk80n9/aKVRQhQSBU
 O/C74mUeQmt+F9zvRLmY+Wx8ZsmBfZq78DPoanwgt7wKVlyg
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

The DPU driver isn't expected to be used without an IOMMU. Thus the
aspace will be always present. Not to mention that mdp4/mdp5 drivers
call msm_framebuffer_iova() without such checks, as the whole
msm_framebuffer layer is expected to support both IOMMU and IOMMU-less
configurations.

Drop these useless if (aspace) checks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 027eb5ecff08..8c2dc5b59bb0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -280,8 +280,7 @@ static int _dpu_format_populate_addrs_ubwc(
 		return -EINVAL;
 	}
 
-	if (aspace)
-		base_addr = msm_framebuffer_iova(fb, aspace, 0);
+	base_addr = msm_framebuffer_iova(fb, aspace, 0);
 	if (!base_addr) {
 		DRM_ERROR("failed to retrieve base addr\n");
 		return -EFAULT;
@@ -376,9 +375,7 @@ static int _dpu_format_populate_addrs_linear(
 
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i) {
-		if (aspace)
-			layout->plane_addr[i] =
-				msm_framebuffer_iova(fb, aspace, i);
+		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);
 		if (!layout->plane_addr[i]) {
 			DRM_ERROR("failed to retrieve base addr\n");
 			return -EFAULT;

-- 
2.39.2

