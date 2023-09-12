Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA08779CD08
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 12:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB2A10E3E9;
	Tue, 12 Sep 2023 10:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A5E10E3E2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 10:05:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52e64bc7c10so7068868a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 03:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694513099; x=1695117899; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gyROUKc805WACXkm3dpCwnosNcuRKavLVZ3ZrqpiPGc=;
 b=L4ZEvZhV9z007KbS0Nc721uFRajvKUmmww6UniTbpGExIAHMGEijbPbqeVNky/13yK
 CQo1nLe5UmZjFB9Bn9mN9xkSeCbVK7rVweT+gni2yRM+raHi+jKDBz5zSsEqQ2JUZf/d
 O4Szr9ifL2oCkJgcrOYySoMyafHNxzTZplyTWYGRPjbTmVSldNir7yzFrHgXnjXz4Fzq
 id3oKNzyem5BGg//3yHRqLBvLP3J5W4kFFzHKBPcnhJLw/TWhpkLB530FjsxnXWYJsr0
 yRu+vkJqgbQF7t3ctwf2pqLUXK/tyg8awE1FwvpTIo/xSDkbr/TB/69kpXI7O+mKI3mb
 eWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694513099; x=1695117899;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gyROUKc805WACXkm3dpCwnosNcuRKavLVZ3ZrqpiPGc=;
 b=bj+v0d0lenuBHg3ozD7qAkSGxoD67qmc7kJNWsVEan3hFTENMKV5z6FtXpHBpexYuK
 Bs+i+gNsRPMstH9ridxrBShobqmCoirmwN6454xY/bGqHUFVP+c9HmpN1GtU89GqsPHn
 gIPvHk/hNWoqSozEejSCjdk7WXbb2AojubwenVXI+2I7ZE98Tz6L3FQlxrW7EsIsPIn8
 tKfFLKZ7rFrGz4mwJxPuhVgRCkVlb0qNI0+hqIRRI+YtZIR4W/iDY3Xg6DI47ru3atY3
 U8ShWGatJvbuN0ThroloTBAj8vPwAYORPBas0DmeBhNNo8LxHjhJ+TuLWRcxxYLITwF+
 D9Bw==
X-Gm-Message-State: AOJu0YypiTrttheHzoIEKIdywJozbZ3ZocQw3+qcmyZnUhYpfRMbvFNW
 5CuqExXWmhGPyC5OwAgaUHhlSQ==
X-Google-Smtp-Source: AGHT+IGbovMs0Y34FfEDEXJamv1Wxp9FDtgEmCCFofjwCrZV0B4fqYBB6Tw8h56bvhWfcL99Abm3Tw==
X-Received: by 2002:a17:907:7844:b0:9a1:aea2:d18d with SMTP id
 lb4-20020a170907784400b009a1aea2d18dmr10259251ejc.48.1694513098897; 
 Tue, 12 Sep 2023 03:04:58 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a170906060300b0099ce188be7fsm6592053ejb.3.2023.09.12.03.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 03:04:58 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 12 Sep 2023 12:04:48 +0200
Subject: [PATCH v4 06/10] drm/msm/a6xx: Send ACD state to QMP at GMU resume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v4-6-8b3e402795c1@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694513085; l=3163;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ewvkXj7rjGrNTMhjUO9xqrzB84S4yQdvteDU7I0nOQk=;
 b=XAGTtQgY2PPkBKZymj4O04Lhe363VYSb9cNVhnX/N/bcK4eh9lS8l4sYOa7toyr5AOVvTRJ5D
 dVAVeR7XuL3Ck7eaScYzgU4BoJKADA1iZjEJRW6c0ML3CmslkCww+xz
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

The QMP mailbox expects to be notified of the ACD (Adaptive Clock
Distribution) state. Get a handle to the mailbox at probe time and
poke it at GMU resume.

Since we don't fully support ACD yet, hardcode the message to "val: 0"
(state = disabled).

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index c1ab48a77f45..b4a0d6b080eb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -981,11 +981,13 @@ static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	dev_pm_opp_put(gpu_opp);
 }
 
+#define GMU_ACD_STATE_MSG_LEN	36
 int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	char buf[GMU_ACD_STATE_MSG_LEN];
 	int status, ret;
 
 	if (WARN(!gmu->initialized, "The GMU is not set up yet\n"))
@@ -993,6 +995,18 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 
 	gmu->hung = false;
 
+	/* Notify AOSS about the ACD state (unimplemented for now => disable it) */
+	if (!IS_ERR(gmu->qmp)) {
+		ret = snprintf(buf, sizeof(buf),
+			       "{class: gpu, res: acd, val: %d}",
+			       0 /* Hardcode ACD to be disabled for now */);
+		WARN_ON(ret >= GMU_ACD_STATE_MSG_LEN);
+
+		ret = qmp_send(gmu->qmp, buf, sizeof(buf));
+		if (ret)
+			dev_err(gmu->dev, "failed to send GPU ACD state\n");
+	}
+
 	/* Turn on the resources */
 	pm_runtime_get_sync(gmu->dev);
 
@@ -1745,6 +1759,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto detach_cxpd;
 	}
 
+	gmu->qmp = qmp_get(gmu->dev);
+	if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu))
+		return PTR_ERR(gmu->qmp);
+
 	init_completion(&gmu->pd_gate);
 	complete_all(&gmu->pd_gate);
 	gmu->pd_nb.notifier_call = cxpd_notifier_cb;
@@ -1768,6 +1786,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	return 0;
 
+	if (!IS_ERR_OR_NULL(gmu->qmp))
+		qmp_put(gmu->qmp);
+
 detach_cxpd:
 	dev_pm_domain_detach(gmu->cxpd, false);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 236f81a43caa..592b296aab22 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -8,6 +8,7 @@
 #include <linux/iopoll.h>
 #include <linux/interrupt.h>
 #include <linux/notifier.h>
+#include <linux/soc/qcom/qcom_aoss.h>
 #include "msm_drv.h"
 #include "a6xx_hfi.h"
 
@@ -96,6 +97,8 @@ struct a6xx_gmu {
 	/* For power domain callback */
 	struct notifier_block pd_nb;
 	struct completion pd_gate;
+
+	struct qmp *qmp;
 };
 
 static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)

-- 
2.42.0

