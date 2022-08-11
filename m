Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F1458F691
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 05:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDA311B12C;
	Thu, 11 Aug 2022 03:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7E911AFEF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 03:58:48 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-10e6bdbe218so20230110fac.10
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 20:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WoGxgm6hm2DcIMIJHu37sZN3LBlheWW2cglanaquIW0=;
 b=CweOhy/8ASwAhV9xEgqiRk5gtbe4elGrTFE2sPXLee7BUSqeI+vgu28VRF8TyhL5YP
 QHsJTKS61Y+FX8C+aAyjD8ToRqHSqpJYym2xA12RI8AviJmFG512m8md9WHBKYLTrHOz
 WV9u3CABSPBsjw2HHLxITozNaZdWzM0YFTD3J3cX1LYfm05d1WZct4wqvmvYF0xLtKv3
 Vy2gfYKp5Fhrxhf5ywEbzyxZKKk5qi3DR2iy+lGuQGRyie1IQ9nVRTdhX39Pxd42BeRW
 RWklli78pvsAUOY/Yw7x5KiCqInvzobURoGISurH9FammW/l6g3u7IMZFBmEB/Dq/NZt
 6zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WoGxgm6hm2DcIMIJHu37sZN3LBlheWW2cglanaquIW0=;
 b=hiSvisyI5s2Mpg+j9QksjWKLAMMclAR1AbT5olnruM0jWetBrXbdXTE24YYmHY0IpZ
 pcFPed2yl/43lvh1tDMfrLW+2EYGHGSj3F7L3hYiphUPZxsMQS/v1WD27fkjXC/7UNiv
 HhZJ1Mx3cVs+JwT2zcZlJwqp+NM5xoT5gbQB1SxI0Lh9iBpAjBuJzzvCK+TUJVNRi93z
 ttcDxbOIz9RTSvCKv0RFrBHHsBnttkmfgpzNTF2Rh7MtBhvagS75YGM6GdIug2pG4eVv
 z9A2WwAlMgdNADNdyt6HbGMm/ufT1v9PGtBkNXU+mGd+U1WzF5qT2+MIf/PjWOnAvgni
 x9oA==
X-Gm-Message-State: ACgBeo2lKPGgCrcHKMX4aEHnTzuCd4QH2hG+i3fcGzerzp13L21loxRS
 EBAzvOgnxoEZwaTlM1ogF65SuQ==
X-Google-Smtp-Source: AA6agR4BVzYmJfl+Hk8fitZmA3UojbgYxnrzYUgkQRHIbC6+ILapSjcFMHkSG/CeGqoomENm/h0R6Q==
X-Received: by 2002:a05:6870:9613:b0:10d:cc11:62ec with SMTP id
 d19-20020a056870961300b0010dcc1162ecmr2878413oaq.9.1660190327551; 
 Wed, 10 Aug 2022 20:58:47 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 w22-20020a056808141600b00338869042fdsm891443oiv.32.2022.08.10.20.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 20:58:47 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 2/3] drm/msm/dpu: add support for MDP_TOP blackhole
Date: Wed, 10 Aug 2022 21:01:20 -0700
Message-Id: <20220811040121.3775613-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
References: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On sm8450 a register block was removed from MDP TOP. Accessing it during
snapshotting results in NoC errors / immediate reboot. Skip accessing
these registers during snapshot.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71fe4c505f5b..daf76ea908de 100644
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
index 008e1420e6e5..49e7aeebdedc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -946,8 +946,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
 				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
 
-	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
-			dpu_kms->mmio + cat->mdp[0].base, "top");
+	if (top->caps->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+		msm_disp_snapshot_add_block(disp_state, 0x380,
+					    dpu_kms->mmio + cat->mdp[0].base, "top");
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 0x3a8,
+					    dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
+	} else {
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
+					    dpu_kms->mmio + cat->mdp[0].base, "top");
+	}
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
-- 
2.35.1

