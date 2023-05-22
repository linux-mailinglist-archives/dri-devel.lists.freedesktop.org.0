Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D95470CCCC
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 23:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B1010E396;
	Mon, 22 May 2023 21:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D5F10E18D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 21:45:31 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f3a611b3ddso5064235e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 14:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684791929; x=1687383929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MPZiyM+41u6KV41f466UiDSi20dbWDpELFpeisbXMJ4=;
 b=kwLUVb/RYRXphumuuqIPcHjZNC8S1lqilqqEA3cBLONADHlwQAYfa80jx2YNLHEQQ9
 iyQf2K9TcDaz4BW1XtGrsZuTeyn3XDi3VlELLNMosUnkFVfsjCpfLZt3diwRIEHhUElC
 8LlX2FfGZXzn91Ciiy6lzRLYdI6PoQ4jjY6Nu2rPMTb3KhvmnM7shAh5DhsTKpHyhrgA
 I8l8exLUObliXYi/S0zgG2gcVxvCqBIElpyd2VUvyYyicGLKPNIi3igQ3oqzNd5MQwv6
 HG5iY7uB/nC7OFwyghTF+zXOrSqJ2YFj8kdUA1j+4vPeGmZDgm47t0+Tqn1sBFFB8+ib
 gWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684791929; x=1687383929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MPZiyM+41u6KV41f466UiDSi20dbWDpELFpeisbXMJ4=;
 b=gyzwaquCj0FU1FKj+DXM5QELxglCRiJpfPOphR1poztNZao6loWxWf9h4ypd4RrFEl
 wTKNVQo8GaEOLlV2TW72W6s9cvLJtZ/mQRa3qz0cgNTmRk7L8PikWOw6AUkeHap8WLEM
 dQkl9/rxm8XSsIYGb4zR+fJfBv7jOyNCfnqF38CdYZDDPOVJwZJU20lQsLyFmAdJHXLz
 BJbZc/chlu8fRlGsw2FC2cUFk3vDr7bBxWFZh0WiSnMQg6FVo+vYJYl0cKXJO6zV1TYC
 DIDuW0Vicc6TRv2JXOHrXNQhU0LmhfJxQajp34sJW0VCVAO4i02LL8pLz70ttZT5iq73
 UW1A==
X-Gm-Message-State: AC+VfDyuVejRINNIqTZmSy2N5zdbQxuzYQGyOs9zs7wbitTGRJbWmXhI
 6swLFjMnp1uTVS/NFkte914upA==
X-Google-Smtp-Source: ACHHUZ7N55ew+3ZF5N/qRmIuviul0GR4XA/TKZFj9YvHhFZWy9M6af1HDlhR/8Nr8uEW7b4txVtw+g==
X-Received: by 2002:a05:6512:b0e:b0:4f3:7974:2f32 with SMTP id
 w14-20020a0565120b0e00b004f379742f32mr3940967lfu.9.1684791929333; 
 Mon, 22 May 2023 14:45:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j7-20020ac25507000000b004f2543be9dbsm1106918lfk.5.2023.05.22.14.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 14:45:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/6] drm/msm/dpu: don't set DPU_INTF_TE globally
Date: Tue, 23 May 2023 00:45:22 +0300
Message-Id: <20230522214527.190054-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using BIT(DPU_INTF_TE) in INTF_SC7180_MASK (and by extension in
INTF_SC7280_MASK) results in this bit (and corrsponding operations)
being enabled for all interfaces, even the ones which do not have TE
block. Move this bit setting to INTF_DSI_TE(), so that it is only
enabled for those INTF blocks which have TE support.

Fixes: 152c1d430992 ("drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1dee5ba2b312..162141cb5c83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -101,7 +101,6 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_TE) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
@@ -544,7 +543,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = _len, \
-	.features = _features, \
+	.features = _features | BIT(DPU_INTF_TE), \
 	.type = _type, \
 	.controller_id = _ctrl_id, \
 	.prog_fetch_lines_worst_case = _progfetch, \
-- 
2.39.2

