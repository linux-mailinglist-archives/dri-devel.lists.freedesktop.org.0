Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92791634ACD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068D310E49D;
	Tue, 22 Nov 2022 23:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7200B10E494
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 23:12:46 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u2so19606070ljl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 15:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OwJHxW4jh79DyZaLfMeFc6/VKMHrXvsHK7KWi5eRStk=;
 b=qh222xFhl+ZOkqvbjQ23076U5ekgT+hedOkQcehBT83wMdq1J5EgPuatwyLUGVZnya
 q4Td8aoy1GUGKjHM222+piSwacXaSymLaJdmwXIk9hqke4VQdmVAEDWxPRrwHosu+pUU
 aJS+jTP39wl1HPV+De/cMB/nYWUJeF0mglM/wmWv5NyT4o86EqhrcF+V0nUcsZgLnL4J
 IgXRW8fnV8zSJFCYiPkFKt8yakikTcpqu2LB2OeSxZFrGJxsSWwyFH+pg5W4Km/TckEe
 8OndnLOdbOKb/RsjylAIbkxnRijDheBWSom1P6B20o1kXN9DSjQpWTJtEpNrdkPmipIS
 k/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OwJHxW4jh79DyZaLfMeFc6/VKMHrXvsHK7KWi5eRStk=;
 b=W4ztypKXbBg8QAIiUuF74NtRnG0yrbRqZd6XPrtZ6LZV3JMGjd6JWorjjVDinwiGsu
 fWT0X4jUNKAIrPOOZbTgCuIXUdvAdITCAMkTEeA7wFgHyEjor0jcZZQEVAYf62JlE1aK
 Yuc7TtvkGcXTRpPlyqusxlnmGofj24WT+YznlrE7chX+aaoDpHTQHbAA26AYlfXCX7UW
 fGB8rT5BznhSt6Wo6pS9qcNGVbmB+cozb6CpUh89iZRa8WKoa4f6sn8WZXHp+5lvYPQL
 wCsDRbrctv4GJyTamD+GZnN7HFh63+8G1lhr3SPx2ZaTQIbxHfEi3vFkJwlqhPG8n7zJ
 jvyw==
X-Gm-Message-State: ANoB5pk8Exrslo+AgPdjDfwb888bbThzaYN5omPO/v6mV/mOPG13/McX
 4DNFmuG92eXzDv3FJ2ARB6a5oA==
X-Google-Smtp-Source: AA0mqf5BHnmEs6j2SeWCFuOQIcFVzdslmpMZ8ASlBa2ESfKcUJvBBZIIexOA+0oDct4gNVNxRDSNMQ==
X-Received: by 2002:a2e:8847:0:b0:279:7611:36f5 with SMTP id
 z7-20020a2e8847000000b00279761136f5mr628434ljj.134.1669158763543; 
 Tue, 22 Nov 2022 15:12:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 q18-20020ac246f2000000b00497feee98basm2617541lfo.274.2022.11.22.15.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:12:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 09/11] drm/msm/dpu: add support for MDP_TOP blackhole
Date: Wed, 23 Nov 2022 01:12:32 +0200
Message-Id: <20221122231235.3299737-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On sm8450 a register block was removed from MDP TOP. Accessing it during
snapshotting results in NoC errors / immediate reboot. Skip accessing
these registers during snapshot.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 38aa38ab1568..4730f8268f2a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -92,6 +92,7 @@ enum {
 	DPU_MDP_UBWC_1_0,
 	DPU_MDP_UBWC_1_5,
 	DPU_MDP_AUDIO_SELECT,
+	DPU_MDP_PERIPH_0_REMOVED,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f3660cd14f4f..67f2e5288b3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
 				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
 
-	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
-			dpu_kms->mmio + cat->mdp[0].base, "top");
+	if (top->caps->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+		msm_disp_snapshot_add_block(disp_state, 0x380,
+				dpu_kms->mmio + cat->mdp[0].base, "top");
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 0x3a8,
+				dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
+	} else {
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
+				dpu_kms->mmio + cat->mdp[0].base, "top");
+	}
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
-- 
2.35.1

