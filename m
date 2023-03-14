Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7406B991E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B3910E839;
	Tue, 14 Mar 2023 15:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A27510E839
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:28:50 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id by8so16411981ljb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678807730;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WABs2uqkSr8euv93L/sU63WnoiH4PZRdu/LdvY8ve98=;
 b=e4HxELOY7IfiLDgpEbVVOCpGxJQiGn7MmAADHLeIQ9dSonULA0bldiz8CgMI2737lY
 rOYV31erKzdYtlM7ceiSmc4zGlTZSeSSeyEkywbYCAfh92/Oxa7gr0GGEXdLxtwTNR2V
 ai9M1XsFH/RFvDU6O1udDwUKU5YAnpsfNSyFV0bvD/OrN0ZHX7R9UpaN/uTE7lkFnlXh
 9fJTy5GbjRFmoTRlViDpEun63yit9z8jUaQX2/CJnYEbnaw3RySP5xBWpzFUpAPX0hI7
 8Vp0HsbB95wYBXPFG+N/BlrhRc/mdCCI/fdDT98qBSu10uo7fpWu4/XOcLnq36C3O/zu
 oGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678807730;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WABs2uqkSr8euv93L/sU63WnoiH4PZRdu/LdvY8ve98=;
 b=nM30RcLLUNnt3CjCBpbjZw3WHrVaijLvXxz9gcdKbeh0xWlU7GjeKCFBSQp1wkIWW9
 NWOvM9HDBUbX1zZUR3BtoBRmPa/vTuTdvfQMv2xQRCr3hWrX4rZ0/H6sel14zmAh8GuV
 d6CYe1SjW8tjdFZTpXONpDgncfh+JHD905YobBY3fzEsQILeGiLMhF4LwfBuI8gwHQNP
 PtmWXdM1JVhUqSxyvCgw+nNqfyaqH2iFxu5qDuqGIsg3MNT1vPfPhKYTMQQbctiCDPCz
 /JDo6hBtOpzxKPaPgdBKtG+nKhQESNRxmDHDCXZgNd62LYxhpe6JGlAPofhgb0aAplhQ
 KUxQ==
X-Gm-Message-State: AO0yUKUTIiup0jnsKmgwD67gBczjXL3X0F2dFvH2935Gdy8SPbK2tvM2
 RYFazPUT+eHT/KNYg53dP1d8QQ==
X-Google-Smtp-Source: AK7set9p0iUmEJFj1wIHWX+7ggS+PnzEj2OdhTv2x6pIfkB92M1XoFxzoYiBOSMe86wKID/Dj0pPdA==
X-Received: by 2002:a2e:9911:0:b0:295:a50b:3693 with SMTP id
 v17-20020a2e9911000000b00295a50b3693mr10743151lji.44.1678807729879; 
 Tue, 14 Mar 2023 08:28:49 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 27-20020a2e165b000000b002986a977bf2sm491529ljw.90.2023.03.14.08.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:28:49 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 16:28:38 +0100
Subject: [PATCH v4 07/14] drm/msm/adreno: Disable has_cached_coherent in
 GMU wrapper configurations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v4-7-e987eb79d03f@linaro.org>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678807716; l=1374;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=BrQq/uUq7axESPCyxyyfFuley6Eq3n1FbD/qjV9Gfd4=;
 b=I4rxN89h6z/5WvdM1z4Z8cq5KsNXVn/10Wqx0Zr2wNmgPlC7+VHm5VhNifsczU7WOBF58BWKvqWC
 uCkX0n4MCwgu+b3mjjVKTvTab+06TYtgi6LYzZfedym+c58dba/a
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

A610 and A619_holi don't support the feature. Disable it to make the GPU stop
crashing after almost each and every submission - the received data on
the GPU end was simply incomplete in garbled, resulting in almost nothing
being executed properly. Extend the disablement to adreno_has_gmu_wrapper,
as none of the GMU wrapper Adrenos that don't support yet seem to feature it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index f35392c034f7..6513c6094865 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -540,7 +540,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
-	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
@@ -552,6 +551,10 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	if (config.rev.core >= 6)
+		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
+			priv->has_cached_coherent = true;
+
 	return 0;
 }
 

-- 
2.39.2

