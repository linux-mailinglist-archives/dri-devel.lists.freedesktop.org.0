Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5C273233E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B25B10E571;
	Thu, 15 Jun 2023 23:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD0E10E568
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:24 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f769c37d26so3435869e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871283; x=1689463283;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6a1QMmj81oXqiu8nN+luqgMSndStx7gXh0gMxhBOOQU=;
 b=bnm2oqpcOD3oUBEBY4/+9G1rwJOOkHaxxb/MKoOlS4zT4IbznR7AYXh0nexgmiF0kn
 48BtXsBNuWaURsK/FTEBnbFS0YgaiRKrqmaBxyogMz8Vqk0WWSpXlrhUMJzAJh3oC3Tj
 vNjjaDKIcaNzlJwqrN8gWI9gUOgTdBnErOuzlHmdw9qCH+lf/cpnEhM7byVE5JkW+SPq
 tXtnGauYGKhHfUc86ZTEyectBvgAxdZxR/96uSzNYzH4oIXDOvWDTS/wG+WFbZ6hWqPV
 QY3WJdWZ3wR4xzNi8c71vFo2VIyAmaqcXZikCaT5YhuDWsjTO8T4fmUDnRtE33ihgbng
 YjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871283; x=1689463283;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6a1QMmj81oXqiu8nN+luqgMSndStx7gXh0gMxhBOOQU=;
 b=TQI/iryMcTd4HduhSvbZTKH4/Q+fG/UW/uN8maYjwDfcaI1089Mbm7hJ8Co98lqPqn
 58IfdECxs17bRIMzUBvuFCuvM0IyQvNt5PwFQKpmdEY19gmWz+8zGL5CdpDS3BAGPIE6
 oKf2LJv1LaY29verSPNb1IpoepvAigS72FjkKhqPow2O8rrCwgv2cm7ORgtFnmlSSB/6
 9UNFFdi1BGpjpeBw+NjDJ1yQt2YljogfFQiposA87rgwahwlYl4rhSxdroHRrIpNn7I6
 5zFdxPf4+vj/7ES8z+1+GzdAbAtBJYfAeMa2pHhkAOdKKxmWpAwNef5ruEfN3yIlH8gH
 FlwA==
X-Gm-Message-State: AC+VfDxoNlMTTD6njJ3er+MFl4MdQVN0eshH1/OBS59ijRcRVxkcRuvT
 v1j1vASyzL1FffVmmLelK/p00Q==
X-Google-Smtp-Source: ACHHUZ4YEcCeVa8ugJonftGODrNlpJM5dJgZg94FEbXaKFQpvvxHse3N3U7BrVsY6xiGjq6JVIYaBQ==
X-Received: by 2002:a19:5f15:0:b0:4f3:92a9:aa06 with SMTP id
 t21-20020a195f15000000b004f392a9aa06mr70560lfb.48.1686871282945; 
 Thu, 15 Jun 2023 16:21:22 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:22 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:44 +0200
Subject: [PATCH v9 03/20] drm/msm/adreno: Use adreno_is_revn for A690
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-3-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871276; l=824;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zkQglxSAYJ6XB8sCRIg7Jh2Ryhgw+vFHA/mfzuc8H1A=;
 b=97c9wz7gJsAfoY56WRmkvESFippkdb670pINXb4BLBXtrNr+y4CB2brw3RN31wQvf5iaVN4AH
 DITwGzQ0X3ZBxOJeLPRD/Q42Dk0XxQhL0jDuD39KPtAKI+sfROBTHBl
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The adreno_is_revn rework came at the same time as A690 introduction
and that resulted in it not covering all cases. Fix it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9a7626c7ac4d..5a26c8a2de7c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -286,7 +286,7 @@ static inline int adreno_is_a660(const struct adreno_gpu *gpu)
 
 static inline int adreno_is_a690(const struct adreno_gpu *gpu)
 {
-	return gpu->revn == 690;
+	return adreno_is_revn(gpu, 690);
 };
 
 /* check for a615, a616, a618, a619 or any derivatives */

-- 
2.41.0

