Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36474B9EB
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 01:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F44D10E61B;
	Fri,  7 Jul 2023 23:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C6C10E61A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 23:12:59 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b703c900e3so37891701fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688771577; x=1691363577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p1naQ/0oURgoeOGRk7cLDdAN24Fuu5yXRK3xPVkECZM=;
 b=y6X17IOX3vPU+F4eOdp6bx2ef9/SqAne0XkRYRBO03aQjzK7s0PR3x3UGHSwfbGjtl
 q2YiBydiRuXwB8txqWP4ZMqLlgX85fj91ffSHGmGJs8EggF0XWPsCJD36x9/AOPv3E26
 sHbdou8U8Yd7iWNYQMveEh9eLuaBEfhdY8JipU5KIGV54SHiU/CM8v4z2TLJAa/8o9WF
 sDk6oLSXdgfKxtcP7h12rXtxQOLwZpwEcp3IzgM7MYcGQHsKksyUm3SfRIBxGveRQByI
 B7booek+P3KUukahR7HAdp5WreyG+cIe4xgk6Kj9P5bB3BNIrhLcm187yj4J1eJfcmJW
 IRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688771577; x=1691363577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p1naQ/0oURgoeOGRk7cLDdAN24Fuu5yXRK3xPVkECZM=;
 b=BYYxHbzLI8oyfH4Nu/el89MK6F+1HL54tMyliqP8OZdOl0Wwtxml5dAAXNSPs6Z1WQ
 NJJrwhUy3X6I0oZfc+KxWuwfYD84kO63VdajacxwWqquTgssnwz74KVTjaM54Regn4cX
 ewhuViu7/TwZRrDfOEP/DOpV6hSrHbP/9wKpyaraptmKX1pEef9aKp9P+avnbg/3566s
 9BDUBlnbk6y1EXW9y1bl0x85sFcptHA00wb78hS1R42btZYyjqDnF16zS7JD5GsI10ZK
 HTNs49HlHNroqVpqsXSevdB04we+mi0GymQ8Axb99uMqqfT37MgzL6JKF1CxHK69Vcd9
 4u3A==
X-Gm-Message-State: ABy/qLa1ONe217ZDh7AX6++yNISv+DSRzqvbZVcLVa2xnliY6dEE+cfM
 ncFl6gF+w8dPQh3CNJYb7UX6VA==
X-Google-Smtp-Source: APBJJlEPkmOB8pJ06nDSf1tecIVwEr4jUaDXvQK5fsIYo8WkQ8uJYngo7bBisrq6+w3GPtOF2BP7XQ==
X-Received: by 2002:a05:6512:15a6:b0:4f7:6685:2c5f with SMTP id
 bp38-20020a05651215a600b004f766852c5fmr6169202lfb.61.1688771577765; 
 Fri, 07 Jul 2023 16:12:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 16:12:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 07/13] drm/msm/dpu: drop unused dpu_plane::lock
Date: Sat,  8 Jul 2023 02:12:45 +0300
Message-Id: <20230707231251.3849701-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
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

The field dpu_plane::lock was never used for protecting any kind of
data. Drop it now.

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

