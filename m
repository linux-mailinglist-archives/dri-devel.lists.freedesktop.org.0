Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B129069FDF2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 22:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A95A10E449;
	Wed, 22 Feb 2023 21:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFB210E41E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 21:47:20 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id k14so10897948lfj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 13:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=39aG+iURI09iswW6gk3gC6TBwToV0heQthXAeMfwVro=;
 b=HzIPoQRPbG/dXz63sWAdJwl2JHB79lNtcfUTS1bk6pyYqiR9a92sQZ8oexO++tzYOV
 Tbk9YCRPD6MoPA4l/RV2iTQYtFRDA9eUjNuD9vyQpT59cm9obwO5UfFORpcTVfVTZVuW
 KjJv8fVNIDJArcRFG2m28RQuy4EZhxT13CiysjTbub+h0aDOd1qRTJYWm17Q/Z0cGZkT
 RCBMrM3+QjBRGlUQS+89zQlYptl1+ppeCt9IpLzXzOIo9y4UGBhyeaH5RxrgBqbokBHK
 DUk+Jpr27OC+WEvWbqlIyHOwuz3UvBY3oLUWm3+gFD6W78IP8A3m0KbGa/NSxW1wFv5x
 CdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=39aG+iURI09iswW6gk3gC6TBwToV0heQthXAeMfwVro=;
 b=zgHvLhXbmdIo6I9NUFY9ISFHM2l39UItMwtK5PbmMBpORi56IcTSInVQ351Zhho34T
 qMnjN3IfRXzUTBDnDJRjHlNtQpVSUWMJ1bugdikXigccMXyY4vuylrdTju0+KIJNzqdr
 lMwdocbDxzoTRDBsew9hkPb1Ul9zJocBjQzAYuDcgnYhaxZK8WhJivXlBbSy+zz4opT8
 XHE/G+9Wn5bph9EE93YvD/LuKq1yY2T2YcUJsp3U2Sd1CRIHb8t1j9gRq/XXzT58kcCN
 eWZmabTcfGNjdY22nGvvdKevBEi5BKQFjKcNFg3YH5f6MKTpki+a+3OodDl6VxybdVks
 AMgQ==
X-Gm-Message-State: AO0yUKXlZYi0eicnuKNS9PlsPDbwMTGbFXQatAXRkQxZ+Tmi5EnREFZC
 Wl4tRO3s4uzS1lC9gme9WQxAQLTpsCb++qsK
X-Google-Smtp-Source: AK7set+nn2KRiV4gLdb9BVSubaqkj4Yacm0rOrroDID/OutRQP5o2HwsQd0w7jcVi9x79C8aqjh0fg==
X-Received: by 2002:ac2:485a:0:b0:4dc:4c56:19ac with SMTP id
 26-20020ac2485a000000b004dc4c5619acmr3609922lfy.58.1677102438644; 
 Wed, 22 Feb 2023 13:47:18 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 c23-20020ac244b7000000b004db5081e3f7sm505126lfm.46.2023.02.22.13.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 13:47:18 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 22 Feb 2023 22:47:14 +0100
Subject: [PATCH 5/5] drm/msm/a5xx: Enable optional icc voting from OPP tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230222-konrad-longbois-next-v1-5-01021425781b@linaro.org>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677102430; l=807;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=TMGW8gjkiQwEJ0fii5rrgM+Nl4d+tDtzpTg1fjmA9zo=;
 b=o1Nbuq1XpVhn6xnmPyYkuaAq0xiZ0aski/AfFD81WLJwQsE/JusmS5elxNiSQcEnM76oc3Ers35U
 eiDijrx9C0uZlUc59nitgz2e4VYiOpcCz4G/cJuX7NgFzniXRWFC
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the dev_pm_opp_of_find_icc_paths() call to let the OPP framework
handle bus voting as part of power level setting.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index d09221f97f71..a33af0cc27b6 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1775,5 +1775,9 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
 	a5xx_preempt_init(gpu);
 
+	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return gpu;
 }

-- 
2.39.2

