Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8218D768342
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 03:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBE510E24F;
	Sun, 30 Jul 2023 01:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC1F10E196
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 01:19:34 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99bcd6c0282so505384866b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690679973; x=1691284773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zhsx7GBIayg1d2EQrr5L0MXpOvxIQMLvILidhQwKLhE=;
 b=F3Nx7+e0VegjEgUw1G0wu2eDE9Z45SdjXoDyGorpWhAShwFYDNSwUe3tl+h5/EqQfc
 JP5zV8hxF/zbk87NocjF6qxNz+T1XHq8wD7VBRA4kBonRmjR2WatUM+KchVMBwTyZkq4
 po31vz9bLoxSxolEWbp95M/9yJwJMtKY6utCr+SzOQvY/EuGIRjHwh14f1qxy6AnfJtL
 YutmcIzO88LbOqK5y1IrD+JZdROp+K7BHVOwLvR6XBeDbACQXpNldILd32ZT2TjnaKbi
 ervH4kOZ3gFKunlCOE8282YdIs6eQ+yUtej8kCEqvOzK7fJ9dhUZjC3l/FPE8vmLvchG
 nEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690679973; x=1691284773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zhsx7GBIayg1d2EQrr5L0MXpOvxIQMLvILidhQwKLhE=;
 b=KECeKdc3dMz/l9eCUyOr3y4H03WubWwPiri+DiN/vIP6Pp+WeJtqGjgOuU85l+9zvP
 xg0tMWu1J5csq+3G60WU/qUWqSEw3sq2hEVNVfnUFOlSjsVicRIjuh1ks+qBmGuHVhCK
 F15LaRQOX4kK9ofsbdgMGfYKouKsvHmyiLbYptSam2gN+6Qu4zUqvPfsA1yaeQX4G4HN
 D5LnXVyzhrwcIh1nzgOuqA9iGXg0INWhqQ9qmr73Rt2+PduULSZy/qyUk6ZGD1CW44bQ
 itgZWH7HjgzHYPjfQFsgSjBq6IN5vGdTMwtt0WUSPLu0GDgv4vQOp6fGsRy8mkuZAzNL
 cqfg==
X-Gm-Message-State: ABy/qLbrthurtkStrHR6xUfOJ/JrdiMQ0m62q3ebF2FeNcaFx/UJBezH
 HfrE9/zOE34aLdR6q/k3BsKHDA==
X-Google-Smtp-Source: APBJJlEG5W+E9VP89/jmfwQVUoqTXpMGTUf5maMauxazGsh3X96NMK2ctHZzMFv3Yfu0zDVtJzFEaA==
X-Received: by 2002:a17:906:8a70:b0:993:d7c4:1a78 with SMTP id
 hy16-20020a1709068a7000b00993d7c41a78mr3475810ejc.10.1690679972753; 
 Sat, 29 Jul 2023 18:19:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:19:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 07/13] drm/msm/dpu: drop unused dpu_plane::lock
Date: Sun, 30 Jul 2023 04:19:14 +0300
Message-Id: <20230730011920.354575-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The field dpu_plane::lock was never used for protecting any kind of
data. Drop it now.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..aba5185e1d66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -78,8 +78,6 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 struct dpu_plane {
 	struct drm_plane base;
 
-	struct mutex lock;
-
 	enum dpu_sspp pipe;
 
 	uint32_t color_fill;
@@ -1186,8 +1184,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		if (pstate->r_pipe.sspp)
 			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
 
-		mutex_destroy(&pdpu->lock);
-
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
@@ -1447,8 +1443,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	/* success! finalize initialization */
 	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
 
-	mutex_init(&pdpu->lock);
-
 	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
 					pipe, plane->base.id);
 	return plane;
-- 
2.39.2

