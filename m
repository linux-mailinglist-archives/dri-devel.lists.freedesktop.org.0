Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323A24CE63F
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 18:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E692E10E42D;
	Sat,  5 Mar 2022 17:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFEF10E1EF;
 Sat,  5 Mar 2022 17:33:31 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id a5so10239627pfv.9;
 Sat, 05 Mar 2022 09:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=12jc84zVACmPZitAQSCb3aE5VlqyZHrB+UXDuxQbIOc=;
 b=OJKGYJts4lLE8sv13wBz+01+qJke1kaef4oTLqY+k4PRzNLU9gIOW/2YYRAMR5Is19
 YWW/6bQLg21aOiZ2U9RzSZS0io6k2XgufBQU7fsgymUBtvEkOVJbio6mUTZOPHjZv5mk
 yWnvftE8JsLQG1Vcu1UNu5e1PhWmQvmtCHzbc8nXGTmzj910ZIVMK1lkz5Jf0CQrlA0G
 RQ6ie8vDIYEDONm2VGnBSrDHpKWhaq+tMz87ZVoQnQK0I9vEJnM6nT2jEyfUBedFw6z9
 O1wea9/NgpRcO+0/QKorOYL5InhT1hFEWGF2Nnunn2xYpqH6xClZ9LyRpM17ALe1KNTk
 5LlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=12jc84zVACmPZitAQSCb3aE5VlqyZHrB+UXDuxQbIOc=;
 b=CPmfDs07FjwEK1MzcvO+YHIWJmKbHHzoBKSaVXry6JTTDoC9fmtq7kcYeCjdhZ4Se7
 5lN/cL45omMbka3pOK3GFxsLebUeIHGABTi86zNKE8HDWTtGpHnJiBTc7UdUW6FnLAoM
 WURC9GygR521YMKUM3+UEIIgEwGHlZ6OKDgNYFgxepA1INanSk9Rb6Iw03nMHeXEJknL
 HOXzEE60saqMaFca+DPnQ76sMkFd8ZVUJRZ3AKWKfEU0WcThAOWp1jQwTMOOPsu8aHkG
 a7rUETtHci0DVEVBPAAScMectc5NkCHgtnsg+K1Wqh/H84MgSl+45ABIb8n5Zulk7j9k
 v9XA==
X-Gm-Message-State: AOAM532cAJlsqKoC/FOTEC6H8FoHMlxbdWYY8GaZ5eECEooMvx7oYpC7
 Sgqhqgh5Cpt89e56+yTG3GVIqJGozxM=
X-Google-Smtp-Source: ABdhPJwUZoMD1qdQmW7sKJkY/P0Jf8kaI1M3DCVgtmJsxT5spI6VebPuV35teZIfIPfgdje/kVVyDw==
X-Received: by 2002:a05:6a00:180d:b0:4f6:d697:7df9 with SMTP id
 y13-20020a056a00180d00b004f6d6977df9mr3302231pfa.71.1646501610505; 
 Sat, 05 Mar 2022 09:33:30 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 l62-20020a633e41000000b0037fee1843dbsm2922838pga.25.2022.03.05.09.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Mar 2022 09:33:28 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: Fix missing ARRAY_SIZE() check
Date: Sat,  5 Mar 2022 09:34:03 -0800
Message-Id: <20220305173405.914989-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fixes: f6d62d091cfd ("drm/msm/a6xx: add support for Adreno 660 GPU")
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 02b47977b5c3..83c31b2ad865 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -683,19 +683,23 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	const u32 *regs = a6xx_protect;
-	unsigned i, count = ARRAY_SIZE(a6xx_protect), count_max = 32;
-
-	BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
-	BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
+	unsigned i, count, count_max;
 
 	if (adreno_is_a650(adreno_gpu)) {
 		regs = a650_protect;
 		count = ARRAY_SIZE(a650_protect);
 		count_max = 48;
+		BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
 	} else if (adreno_is_a660_family(adreno_gpu)) {
 		regs = a660_protect;
 		count = ARRAY_SIZE(a660_protect);
 		count_max = 48;
+		BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
+	} else {
+		regs = a6xx_protect;
+		count = ARRAY_SIZE(a6xx_protect);
+		count_max = 32;
+		BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
 	}
 
 	/*
-- 
2.35.1

