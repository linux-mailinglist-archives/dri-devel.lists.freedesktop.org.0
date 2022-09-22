Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A621B5E6118
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 13:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF5910EAD2;
	Thu, 22 Sep 2022 11:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44D410EACC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:30:25 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id o2so14119709lfc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 04:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=583h6KF71HUgEtsvHt8C5CKBAKwnaZE+xGmKl57ijJU=;
 b=E8GoP/tqY9uLEMc+tulq9xPDQzcwCP/+S+MWgvUhZAnhqeQImOfBvEHy2q1TEonW8o
 FqPgyAgR+wuOOiVLKTgokDZKt5Vym/eB9MduxCahabbIqlG4+AgITrgrtQ9hD6rAGYPu
 356/O6rCQt0sdStYuOgcv0pZDC+KtfFnS6gelhcBQ6t4+mJyiagvN3z+rK2gBXAYdukl
 4+MiOZZLjqOMhJLSXQ2ZHKqe7OA0rfPow/gljAmt7OdZxs+9K2YXKkgBODuAPECTokOS
 GyQ7cPHFyPLGGgVyJjWhbwFV5Ibd5FnokeLYBJGBDn4wU62xsCVxs5Q1nXxyGKpUjxd5
 B4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=583h6KF71HUgEtsvHt8C5CKBAKwnaZE+xGmKl57ijJU=;
 b=p9Y9SXmgGpl2uD3co7moD6u1Ha8nolAJLsc+UngTjKsCfwVhuMRMl96XAcm5aGNo43
 8TGXR/1g5c5AGZ0YYxjK0cqmj8JN9oL4wzc06gt0j3BX9vigIkyBfN7XoSzgRshqPv7o
 Z6UvCiXHhLxbg1uQs3WmXFnAjCh7N4S3Tkk2WnJkCGHbOI5No8LqRk18hel+6ZTO6zV5
 BwWVaS1ZIEU6x1neJJgUeObQ2J2jVtLlTCTyaEpTkE3ksvhc4DdqYOiwzSFlUS+Z22ie
 C5BMPjOR/v2zAco83qnyH4q475rvlI9xLzzdVfT17upzybQ3dYLf/pI+nEDepqFQbTfY
 ADbQ==
X-Gm-Message-State: ACrzQf0dVZ3Bk0NsOrqdmW4/bsjIAsf5PvarsFBgV/7eNYl3N9oC1Lqw
 Xue//SUGk8iN2P4Oxxl7EKPQgQ==
X-Google-Smtp-Source: AMsMyM7/FvoCj8lHHs9X09maj/umN/CcXQani3boBysW4Q3s/DFvafrWo+nlKexuhyzWwblDO14kIQ==
X-Received: by 2002:a05:6512:150a:b0:49f:1b3d:889f with SMTP id
 bq10-20020a056512150a00b0049f1b3d889fmr1131655lfb.75.1663846221338; 
 Thu, 22 Sep 2022 04:30:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c4-20020ac25304000000b004996fbfd75esm898527lfh.71.2022.09.22.04.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 04:30:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 3/5] drm/msm/dpu: add support for MDP_TOP blackhole
Date: Thu, 22 Sep 2022 14:30:14 +0300
Message-Id: <20220922113016.355188-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
References: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On sm8450 a register block was removed from MDP TOP. Accessing it during
snapshotting results in NoC errors / immediate reboot. Skip accessing
these registers during snapshot.

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
index 5e6e2626151e..b0bb693c10ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -939,8 +939,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
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

