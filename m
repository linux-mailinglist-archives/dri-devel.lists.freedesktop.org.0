Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29E665AF2F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BC210E2E8;
	Mon,  2 Jan 2023 10:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10EF10E2E8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:02:05 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id n1so28651798ljg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uUvNSUQPHRgkJykKaq60wHpn/k1eJNyp+U1eUmaZ3RQ=;
 b=iCYYVJ9YOn2urXXQ5oAg/nIvLhmW16eVFVswPtvi7YU1Ol8ahihnipPCpixMxuwB5k
 Dib96+ylAQwD5TvlJjvjfGBrCvwuoG/tH7K7xfLL226pY21IRFTjZYkeP0qhm/idmdz0
 +rAuYkYaIFdtYC2JFVRITVbmbsRbmWbbUlKqzZMqmY27YRwKjRIqGIeQX7IwnX7FG+Gk
 UMfVAzA9ju+x1Ow+GuL/CGvt7dEIGsPXQzuEzrMktBdJ/xgFBfMhFfKuB/wGz/NqB7zH
 fWRRpJc0W8j3jVUa8kC0BUJg1kpQ3QR/KgAh9QfmAELdtaOkRNQJlO3/zRAoLFTedp72
 jq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uUvNSUQPHRgkJykKaq60wHpn/k1eJNyp+U1eUmaZ3RQ=;
 b=FwenlJZ//QcMOCyS7EYwW2af0a+qr6Co3rHIUQFRZEevxIAp2jGYwoz14aFxxI0Mlz
 3hgpKtPgZYVxhLIO1vsHGPfIFj0AG66ATmu3Im3YucpKCL+ufMPPGnTCefMfHvzAuiMs
 JuKbSuza7ZBHJ3/RQJsgHsb7pOqYZK3RHG4668gX6sDKEu20iDKkRTdoOzIlaJsFM1vP
 4GLWcqu5Pb0mverIXSAwnp84TWB3vNJ7ubPtNifzhjdEYAqj0HY2uuFQpf1AvApKTR+B
 Gm7Gjbpu4Y33xx1zmEiEfcjO9Ca7T3NTwzxAspOyodp9hLUozyhOASt3MEbpFAlQgS2q
 Y+dQ==
X-Gm-Message-State: AFqh2kq46WumMfhfclc1SxpqiaNNZbyrOeXdKNz8GKZnJKYbfK4KDjyR
 mnK20SlFLjmlP+JULE8q1xIO7A==
X-Google-Smtp-Source: AMrXdXvfLsZkvxPPh8PFHQUMvkJ0H+nafczyfPXnm02C8MEAtMKQUqjKxuCdl2/VXh4468x7Y+mGOQ==
X-Received: by 2002:a2e:b011:0:b0:27f:e512:f2ef with SMTP id
 y17-20020a2eb011000000b0027fe512f2efmr2463676ljk.44.1672653724222; 
 Mon, 02 Jan 2023 02:02:04 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl.
 [83.9.2.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a2e9a95000000b0027fc14cdfa5sm2132001lji.42.2023.01.02.02.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 02:02:03 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH v2] drm/msm/adreno: Make adreno quirks not overwrite each other
Date: Mon,  2 Jan 2023 11:02:00 +0100
Message-Id: <20230102100201.77286-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: freedreno@lists.freedesktop.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So far the adreno quirks have all been assigned with an OR operator,
which is problematic, because they were assigned consecutive integer
values, which makes checking them with an AND operator kind of no bueno..

Switch to using BIT(n) so that only the quirks that the programmer chose
are taken into account when evaluating info->quirks & ADRENO_QUIRK_...

Fixes: 370063ee427a ("drm/msm/adreno: Add A540 support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- pick up tags
- correct the Fixes: tag

 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c85857c0a228..5eb254c9832a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -29,11 +29,9 @@ enum {
 	ADRENO_FW_MAX,
 };
 
-enum adreno_quirks {
-	ADRENO_QUIRK_TWO_PASS_USE_WFI = 1,
-	ADRENO_QUIRK_FAULT_DETECT_MASK = 2,
-	ADRENO_QUIRK_LMLOADKILL_DISABLE = 3,
-};
+#define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
+#define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
+#define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
 
 struct adreno_rev {
 	uint8_t  core;
@@ -65,7 +63,7 @@ struct adreno_info {
 	const char *name;
 	const char *fw[ADRENO_FW_MAX];
 	uint32_t gmem;
-	enum adreno_quirks quirks;
+	u64 quirks;
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	const char *zapfw;
 	u32 inactive_period;
-- 
2.39.0

