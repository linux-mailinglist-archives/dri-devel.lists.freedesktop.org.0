Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6210E774C31
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 23:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B68A10E0F9;
	Tue,  8 Aug 2023 21:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F2710E3F6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 21:03:17 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b9b50be31aso94444521fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Aug 2023 14:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691528595; x=1692133395;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F8zHT0Zsqj0DMiFej1WNo9eVzZZclVqVsx7269nV/OQ=;
 b=pqR6K3CgsFQcjWft6t18Ysccvsoskmce1p14E9WnFNA41dxkcLK8Io49JTfkjHk7o5
 TbUBqMP3ZperyK3G2YGX+khvtOhISg59nw1U4Yaoj3JLLr9hF0fMdOrGsWd2XK4go4Ap
 /QhTJEhJ1CvPINBUPFIj+rySRnthLLEN0UeggyvwBZBg7YrA9p7ovInlg75GaT9D4Drt
 5XEQAHC5UKF7O4WDTCBDjfXbZ7zcoAJBJXGkMMIBtRbzpoxF8JGFL8IUp7hOHDlNaZTw
 OJEigzLKz0wqn76RtuzvibmWYKvRsRqaqePsOOjs0VSWKUH2zSVp83dVZd6TyxYOAl5o
 bW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528595; x=1692133395;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8zHT0Zsqj0DMiFej1WNo9eVzZZclVqVsx7269nV/OQ=;
 b=A2NxMZPDtbQZaMKneeBfWPjRHnJOpRdAHZzjhpqY5TUBQtxbCVAtjCqgQrkJ9zG0l8
 YfMcPpq6uu2KoaYKEQCYTuhmvDqByUuTnGa1ehElMCOPX3S63hFd0uSF822D12IPUh2p
 +YdrBW+XekjKwPxd4otqXoqp7FOh6NY6a3PLTS371Fr1FMqNf+r8eOTq/e3j9ktb7w2B
 eFD8ENuUg0XTHcZIK3CDkI5ka8h54Fyg6o3MBTOtJONEqFnkzYCMChDfDjh8qA/fBAIh
 vkkrJv52SDzhUj7UkNqbvTU7L1rt09SYs2f0GqSUpNIQOMk3X42prtvFXzAaLzytz14t
 79ag==
X-Gm-Message-State: AOJu0YysAJb/DIb9LhZemRTx0Nm0S12ADO6J1jy0l1Cn4HKunf6bQmzJ
 D2uQpgluiDPN9FDTzu5UrxCDWQ==
X-Google-Smtp-Source: AGHT+IHEk5xv0mOBDNw2eWsuftaz3iiVhy7A62TD88UdcHsAnsRdnmxXvi3j2UDwm7XRbKulViS/Ig==
X-Received: by 2002:a2e:3c10:0:b0:2b6:b6c4:6e79 with SMTP id
 j16-20020a2e3c10000000b002b6b6c46e79mr466475lja.1.1691528595593; 
 Tue, 08 Aug 2023 14:03:15 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a2eb0eb000000b002b6cc17add3sm2431483ljl.25.2023.08.08.14.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 14:03:14 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 08 Aug 2023 23:02:51 +0200
Subject: [PATCH v2 13/14] drm/msm/a6xx: Vastly increase HFI timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v2-13-1439e1b2343f@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691528566; l=1002;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QgEQhQstPekw5tfzihDoKDYHTujiIQxnO5xLgEm4zT8=;
 b=+RtC6tfWJbx8pi3yWGD9Tybj7ws14q5BakBfIVJOPco0LbYKpv9r+tu8rXNfWunG2iFFW9Vqa
 imn604AJMwSC6s98nG1DE/rv1xVICybZjdZwSf5TWaxdTiXXA06tHZL
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A7xx GMUs can be slow as molasses at times.
Increase the timeout to 1 second to match the vendor driver.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index cdb3f6e74d3e..e25ddb82a087 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -108,7 +108,7 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
 
 	/* Wait for a response */
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
-		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 5000);
+		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
 
 	if (ret) {
 		DRM_DEV_ERROR(gmu->dev,

-- 
2.41.0

