Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6476C2745
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 02:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143FA10E6B0;
	Tue, 21 Mar 2023 01:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BC510E6C7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 01:18:31 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id y20so17245533lfj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679361511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=19Mh1AennFks/7EMfm7YcmHqybWalPcK9N+h2nso4NM=;
 b=E2Tm00ZfPxZRTFrHiINcrkN47RtD3K7YkBow6t5sagMcYhCs4GYZQoHGg/vR6HQmXb
 cF6B77vvj1ANdqtdDxsaEGY6T/qCd0qmn5Q6qof2HCIJ/ptt5w7d78cPC1xbNrZnYtXA
 0AWbaPfclpDzX1iKhFc6pTvwdY0oJNu8LsjHulfdaEsXWm9h8+/0KfIKKMGxC02L0Z+X
 JVg5lLBVSdnCsfSf0TTes96FsomJDvRSkUqJzZIlJSx9Q7Wtg/wj7I2UvBSnz70pTy2W
 tMsbpy1/WZ4nNFsmIFfWp9AI5Ese0gbZthX/Vr81PLI4t/+h2Q5qUkvGuxfKM+cV7MXZ
 ePEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679361511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=19Mh1AennFks/7EMfm7YcmHqybWalPcK9N+h2nso4NM=;
 b=yjoB2JpPG0J+FnTpWBs2OVLc7+2/wkIiQrrnXWuumnGbtHh75jNd9BE23I67mtlnPe
 KGpC4bfAq5wJCfXSeAWVMAEhKoZO6rciCNbBx/AiRfh/Ov+cvrbIrd7eqrCQ/OcS+71g
 98EIevxc+ervEWgMphFxODvLfw9dp5BGtuq0P42hGAjny1HDuUK0tJBsItseGnhYuZoP
 tGCb0Z1VSTj5WcZLk5Km1mq/JsXWI0i0j7JsdPlwCEJT9oW+cJtKywc7lvntpsT22FKo
 0dSNT/o6KzH/ygNpUp4/wjEtTibFREBpe/0B5I7GR0RJMDoniP87BQN3Wg+b4g7P88hF
 z/gw==
X-Gm-Message-State: AO0yUKWoqxw7AMU0KHJAQIuQ0EXC6GkZlziJq8h1M4P5tkJvSlyF8c1D
 TUpSNyOAfNDi9GgAObk012d6TA==
X-Google-Smtp-Source: AK7set+aTiuu1uL1+bgmR9So63+iQYZYtju6YL2CUqZSRgh063oiaoRPpeS4LcJfucYU8Ou4ChRZJQ==
X-Received: by 2002:ac2:53b6:0:b0:4dd:a445:e69d with SMTP id
 j22-20020ac253b6000000b004dda445e69dmr313101lfh.26.1679361510839; 
 Mon, 20 Mar 2023 18:18:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 18:18:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v2 11/13] drm/msm/dpu: add a field describing inline
 rotation to dpu_caps
Date: Tue, 21 Mar 2023 04:18:19 +0300
Message-Id: <20230321011821.635977-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
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

We need to know if the platform supports inline rotation on any of the
SSPP blocks or not. Add this information to struct dpu_caps in a form of
the boolean field has_inline_rot.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2d6944a9679a..33527ec7c938 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -489,6 +489,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
+	.has_inline_rot = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.format_list = plane_formats_yuv,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4847aae78db2..cc64fb2e815f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -400,6 +400,7 @@ struct dpu_rotation_cfg {
  * @has_dim_layer      dim layer feature status
  * @has_idle_pc        indicate if idle power collapse feature is supported
  * @has_3d_merge       indicate if 3D merge is supported
+ * @has_inline_rot     indicate if inline rotation is supported
  * @max_linewidth      max linewidth for sspp
  * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
  * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
@@ -416,6 +417,7 @@ struct dpu_caps {
 	bool has_dim_layer;
 	bool has_idle_pc;
 	bool has_3d_merge;
+	bool has_inline_rot;
 	/* SSPP limits */
 	u32 max_linewidth;
 	u32 pixel_ram_size;
-- 
2.30.2

