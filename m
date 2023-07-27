Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFAD765DFC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D091410E612;
	Thu, 27 Jul 2023 21:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918E610E605;
 Thu, 27 Jul 2023 21:23:14 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-686b9920362so1136028b3a.1; 
 Thu, 27 Jul 2023 14:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690492993; x=1691097793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8B5Rk6QSQZWTWxcPiEa1LmusCrb40W7NxArO+Wdwlc=;
 b=FETijaWQcPoKuijdvy6VGH9gCIvpbHjIzX+8VQu0pH4QYeUT/XqTeuHahLKce5xQfA
 Buu+wxAtZJm6shHXbX1IJaE6X5OlFleB9tNqVI+7HF6ouedBPnk4FofE5mE5KGT2QOdg
 +YgsFvWjmKEPPXc/6d9/vVJyhyrKJU8iViWhoLcgEdwxoodh3ZL7YoIyGcJ6XwJNiLof
 vaapWyQcyFTldy8ACvCqTff/G9Hyhrj5JT6YSYHf9vEwYmI5KUsXJOY/60nikd4vsTNm
 fdKmh8DjyFS1esT+W1IVj1AmItG3NjlqsG9qr7478OuAs63kxj1sAR73WDeeAwWdYXkg
 I/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690492993; x=1691097793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8B5Rk6QSQZWTWxcPiEa1LmusCrb40W7NxArO+Wdwlc=;
 b=bb1++XXa8ncIdiLXDXxRJPFM/EEzoCJl9bmRMecmHFp1PNDUwCoFN8JESQ/mEL9RET
 00efZwDtXNNMLrzkCL6vkBnXiaAz6OCi7Qx1BcrAjgpIDX3gvkFk1QfJHY8EmWGeoHu9
 fHWbZrLAoPPg+l2O8/zr/VpoVr2WiANZXZa1Io/NB+RAlzola3VTn1SqMM2bHzEyKrfm
 i+dTo6mpZ6UxnK1mpjuPrAAyHxF8iuaxq0xRfrxb7c4reHm7NV2SQ2Bf/OHsi/4CQzTV
 c07fhASARcGrSox+8Yr0YleazkGqQgvY4qVbCqEVLaB2VFLSyB0RwTnaUb7aYnlOiqr7
 lnkQ==
X-Gm-Message-State: ABy/qLbKNUXzjvfnpMZDBCIswM0pp7sDtfdco1YGO90dnbneWreQC8gx
 h6AfgA3DlkSterT1zPqczJAcvdlMMIY=
X-Google-Smtp-Source: APBJJlFGPAfj6SAzSLVI+8Pw5OBMxu5rUIc/sE2/Tg1vP16GnF3CRyxe7oq7crLI45hd0fsTEmVh0A==
X-Received: by 2002:a05:6a21:35c4:b0:136:ea2d:6d6a with SMTP id
 ba4-20020a056a2135c400b00136ea2d6d6amr240137pzc.17.1690492993504; 
 Thu, 27 Jul 2023 14:23:13 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:69d1:d8aa:25be:a2b6])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a638c0e000000b0055fedbf1938sm2000967pgd.31.2023.07.27.14.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 14:23:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/13] drm/msm/adreno: Bring the a630 family together
Date: Thu, 27 Jul 2023 14:20:13 -0700
Message-ID: <20230727212208.102501-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727212208.102501-1-robdclark@gmail.com>
References: <20230727212208.102501-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

All of these are derivatives of a630.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 5deb79924897..f1bb20574018 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1617,7 +1617,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			SZ_256K - SZ_16K, 0x44000, "dcache");
 		if (ret)
 			goto err_memory;
-	} else if (adreno_is_a630(adreno_gpu) || adreno_is_a615_family(adreno_gpu)) {
+	} else if (adreno_is_a630_family(adreno_gpu)) {
 		/* HFI v1, has sptprac */
 		gmu->legacy = true;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index aa64bad25a63..fe7afac5b059 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -340,10 +340,11 @@ static inline int adreno_is_a690(const struct adreno_gpu *gpu)
 	/* The order of args is important here to handle ANY_ID correctly */
 	return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
 };
-/* check for a615, a616, a618, a619 or any derivatives */
-static inline int adreno_is_a615_family(const struct adreno_gpu *gpu)
+/* check for a615, a616, a618, a619 or any a630 derivatives */
+static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
 {
-	return adreno_is_revn(gpu, 615) ||
+	return adreno_is_revn(gpu, 630) ||
+		adreno_is_revn(gpu, 615) ||
 		adreno_is_revn(gpu, 616) ||
 		adreno_is_revn(gpu, 618) ||
 		adreno_is_revn(gpu, 619);
-- 
2.41.0

