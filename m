Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD52C790FDD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 04:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F017B10E27E;
	Mon,  4 Sep 2023 02:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2168B10E27B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 02:05:00 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2bcde83ce9fso15037251fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 19:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693793099; x=1694397899; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCn7+1TWey1NAyg48VCJdA+g41kuesm/Pl4ROBz08nY=;
 b=sUeH70mqnL4fYGAihVHFkaPkhu1Ui/tppRnEbCI65EVoYH+gIb60HCY6udD3Ey1p4H
 AuOWwDkQ7rvWec0pKOe2zcdfq6/K2ObDgLHZNvfkA+W7MvqJ4s0d6PualeqTWUjjIVKz
 HxgalKpwpyXcqlBgyFBcdvxJ6auLeok0DgcoK32dMQEYM6/bRyDtV6SaThA9W8LfyU1O
 v6vf7BwoaHFXHnRRj860zUZ8UdGqGJHs044/9ruHe86wNgWqddjzFtAaA2nwsj416qiy
 vydpZ2bXyvkM8/qvFmgQZ3YFpLf4rm739WZB3Oqy4B6ElcjHhL9dbvxGDQaFk+DIIpFh
 pl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693793099; x=1694397899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CCn7+1TWey1NAyg48VCJdA+g41kuesm/Pl4ROBz08nY=;
 b=g2VPNBSMeeGx3Jzj7EHe9t6trHUj0f4vLhaDiT9nyjMKD40erunvnW/AHnFgYgB0NX
 qGMYsNoukS6hmmN5BF79FBQVz+EGjIPs9rwlcXuRiXv6WnlujrctqgaJyqcrxjLvO99V
 nSfRp2tvlZcOejjeSt9N9PobDtq3yLaFF/DlRcmvG7dpG6dVCWQIPRBM/qHSUtaCPvLQ
 zWAISPKDiIsOFQH8ozq2F9lWkB/0OO91l/1qMiFvcF7vQi55LlUQE39VY5Ts5+E9J0m+
 mJWQfnZcIRTS7Z4SMLa7ggu3A70bZ2/VhPkPo2sIlbs8T2qwwpkPoYeYA2j7x9mNtzKk
 Kwrw==
X-Gm-Message-State: AOJu0Ywyv8Q+dJrbtleV+YfwfMiYZc3td8pwpKv7DBB+uasczA6FwktG
 A3FEwNq7Vu++9o9LDK6pUOCfWtugVCS688cFiPI=
X-Google-Smtp-Source: AGHT+IF36i9EswZo4RNOjRcQk+JyB3dMeWEVFibQ53tNc3oIsE2tmIGKKysdXisyKNbLEyJDlchwQQ==
X-Received: by 2002:a2e:9890:0:b0:2bc:b6ce:eab with SMTP id
 b16-20020a2e9890000000b002bcb6ce0eabmr5348791ljj.51.1693793098906; 
 Sun, 03 Sep 2023 19:04:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 19:04:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 5/8] drm/msm/dpu: enable INTF TE operations only when
 supported by HW
Date: Mon,  4 Sep 2023 05:04:51 +0300
Message-Id: <20230904020454.2945667-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
only INTF_1 and INTF_2 actually support tearing control (both are
INTF_DSI). Rather than trying to limit the DPU_INTF_TE feature bit to
those two INTF instances, check for the major && INTF type.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index dd67686f5403..95ff2f5ebbaa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -558,7 +558,10 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 	if (cfg->features & BIT(DPU_INTF_INPUT_CTRL))
 		c->ops.bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
 
-	if (cfg->features & BIT(DPU_INTF_TE)) {
+	/* INTF TE is only for DSI interfaces */
+	if (mdss_rev->core_major_ver >= 5 && cfg->type == INTF_DSI) {
+		WARN_ON(!cfg->intr_tear_rd_ptr);
+
 		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
 		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
 		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
-- 
2.39.2

