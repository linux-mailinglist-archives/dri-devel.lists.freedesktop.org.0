Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A599B74199D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 22:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E28B10E3AE;
	Wed, 28 Jun 2023 20:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F6610E39A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 20:35:46 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so81728e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687984545; x=1690576545;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=voWmkq5A/4H6lrc7bXc4yRtm7lr6RklCvSbF7Hr43HQ=;
 b=bvwPX9iP1u0B4dVVrwoOKjAjYT9LWVkOzmGvgfrcnHnX8XfIw1kbxsUXjuS4u3dNdt
 +nc29D4mb2pNHv519QJhDSkS79ZC15A9UVGqlWZ6lPIk/C5+kvdra+ikO9sZIFoLd7Xa
 bWN1SolzqXnjhKPtjqkVFBsvlchU2UIeGNF1HEbhbaMXyAhqi3K0tJW1Z31w2zVKbf7S
 g6B14ODlxsgbHZ4UPE4uQRKynZmFJMgtkOmYx4HDPWS1ZNRj2NIM0UJ2gH05d7DtYmGH
 rektJN9Ujyob5dY0eWrXdWl5asVDrnteqpv7zplar0cE0hF9PKVbLk1B2tF4w3gZ0Rpz
 f5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984545; x=1690576545;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=voWmkq5A/4H6lrc7bXc4yRtm7lr6RklCvSbF7Hr43HQ=;
 b=P42MvZ1zDRwbAtJEEdyOpmeC0EyG7SQ5PVJdCcenXey9R112zPhqeqEkVhlKglXr4b
 dXZkX5kcsvPg75rW8LE98oO46RtjXpTfwOOXQTC05dDMZzjBSLYpX7JVPaiz/PlCTL7p
 irFOxQfNQsHbreoE+VwjubTnDiCD1JCg0CA3AGf+NazQaxc7OHlQrf9U4WbwJXWg6AFw
 k0dlsmSUYIfQEqJh34BPa25gQERRy5jyquLANqW4mxtfUzkS3xcq6Ap37KgnhPMfTxAL
 9ZHgI4LlKcPkU6JudSHRKPSDcMJ3OicvgbGKY4tiNiu2+dlJX90VaQgUXG3RaXLDUy2N
 cKEQ==
X-Gm-Message-State: AC+VfDzrbK+K4v0KU/mzbNvtGzWWJIwpvj8v30K0lIx4/CJclvVxyXUF
 zuifrcAdG4vmoKY9WplUAFXtvw==
X-Google-Smtp-Source: ACHHUZ7yYY5xB5BOCg57Wk9P4RZ0TASg4RnHuydH+NJKXLhpuzizJhVfp+DTy6qJqYFjwlPt095a1g==
X-Received: by 2002:a19:5e48:0:b0:4f6:29cf:c0dd with SMTP id
 z8-20020a195e48000000b004f629cfc0ddmr19592853lfi.8.1687984544935; 
 Wed, 28 Jun 2023 13:35:44 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 13:35:44 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 22:35:13 +0200
Subject: [PATCH 13/14] drm/msm/a6xx: Vastly increase HFI timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-13-a7f4496e0c12@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=863;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dEgcZTxCoSPqEO7GO/0ZL2tns6GDxdULpb4qFZADjmk=;
 b=/Mfvry5SQ0m/wK5vDp3W2W1GiurV0+qd9uxCmsN576pkyGMTxvesfqdFzY18kxMFp33X4ZnGe
 KT9o55q1KbuDNDwjmDjPN2PnwmAd933Lox8wZjXypTcxnhdXg3wqymD
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A7xx GMUs can be slow as molasses at times.
Increase the timeout to 1 second to match the vendor driver.

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

