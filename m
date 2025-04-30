Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8472BAA4C47
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCAA10E7CB;
	Wed, 30 Apr 2025 13:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O3J9Ij8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D9A10E7CA
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43d16a01deaso5282385e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018087; x=1746622887; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QuPmvY4YtpBzr55GIjE7Ii7onSO28ODq28OEYBnNado=;
 b=O3J9Ij8nqDJsYLW9pm9Pgn5ndG2tBKdEig+VdF7oIvkTbVTb5ydEdW4oPsRjAdib6Y
 wDMUfwN7xKQvFWGxoDL2bF9nO+R5cKAkeen+BKyAz8OKvF2rmYKJose6CkWPaLEPKQQf
 yoAXomVYNTbdSYf/QtLdjdmCDH2vNcyduZpkysKODbvCnZYU9FEiGyPsrqxA4cXFKqrU
 zMzHxZPZqXVzmcjTv6DvcHZF1jHaH30JVzzBC4U3tvxuOhb4nULL1FW2gG1Mrbqs6iMq
 Z87JQ/4kH+TrrrTAuei9A342Ly2hWuYqCo91JFWzD2SWI3LQZTzi8RB3ooeHPGJMcGee
 WLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018087; x=1746622887;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QuPmvY4YtpBzr55GIjE7Ii7onSO28ODq28OEYBnNado=;
 b=wQkv2AEaCHV1Ef7WyostJ0DMo7HCtICp7oqlwYGQQtW4DnOUIfx0eaJ1eg17nHytUL
 s0B4jdTmnfekuBEdwBOkJ0byh5q/vka6NyXMi8ekLliU5ybM/tcV+oZbk6pskT6iADA9
 Rt8U4ND2Nq+/lQ6WIE6KVpmLPmatMc4kxDy8bCXNrLlclz7JRvKkcvtcnC9qRo2A8J8S
 /ZHL46Y9A/UKPYOecLjN1Tt12xU/+bB1s67ojqZFKHqoZpKoVvBq/3TIJi74TKsSQdhd
 fz1M6bXmU/PDZ7RxOjlCFjKnvCP++/BNipS2RbKHcO/uFfxgdOnBsQKDeg1GqUOHRbwv
 /eEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzsojIQ4d6o9mnKbN4CTcDm/g6U8aJdR9MjBhZbnvhrvugLz+/bb9fo1NvHn9ZuJkw5/Vxs0nX7kM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZZTOlHUiGEvLlq1oqn9LnCLWjskESeT07pAqPFvZYATuZQaCY
 3xmuOtHgyeA2KMgop4oFYsVyEvk3h9wX2a/FyqTeu5KoLhZLVdVAelXopI+90UE=
X-Gm-Gg: ASbGncuVOlUeCpdlH8Kn+3Mjpw0EeAOo/xeHE0p6brxBRxMHUD1CCadP9nxENKj7rE1
 z7wQxVFg4V10/79pOqJC4vse/H+gCSIZuXsNNZdKA6HXj8QXaAD85AclvZ3N9b8AAGG/2+y9uXc
 Yj1k1hokz4F1xZuUIIRm2KhIv0622Bcn1FZ96wcjMg8CieAf+WUisYtAPcIYTXn8C1njruczJ3Y
 gHP0dk2Mkj247ogkuR+lxaSd9colLIXaKaw7NgU1mvc8jBG6DNwl9xq4or8VfA8pkpQ/it6OveI
 OSbVRXi7aXf3TAu0sCHUrVqqilqlu36I1/khfkp2/ShOW1MFsNVVpbPAOs8=
X-Google-Smtp-Source: AGHT+IFPVxwiNivZ++TjpjGT/qAxP8FXep/7/i0J8h9qywNJGxNKdY1zAQHo3HdDyksPAyOWHH3yvA==
X-Received: by 2002:a05:600c:c13:b0:439:930a:58a6 with SMTP id
 5b1f17b1804b1-441b2dfb921mr8737165e9.8.1746018086893; 
 Wed, 30 Apr 2025 06:01:26 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:39 +0200
Subject: [PATCH v5 09/24] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 ctl_path reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-9-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=G8kmX8Y5U2x/n9a8DLdAhPn2jAzN7EAn1Qe34LI7dH4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh792Pz0KYs8YKt7eNeX9TYrgL/EYhGrTrub+
 fTICCKbYKSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe/QAKCRDBN2bmhouD
 15LbD/9Y8AOMIcZjZBqfuPxEhFacejPrHDDKuGuPISxVw+vzdzTLLAsrUqWP8kK55wYBJSssS7D
 4nM+atPnpj1bfCPwkQUfWH8U+Ymng8bArXT6NYxHHbiW3h7aOX8FB9BvOnzUloULBfvVHgMqxr8
 V23OHZE/6cmctYtCaASrioHqKAg6Gf/4QxTsWJ2JQx9HWIVJp99FeUdUpv8hvD2+YXCGGceFALI
 ABGlmc0CbViyM+Ce/d5qUkEcyOcnT+UD1QWRCOvlXPsa+XNNxfSsI8/z/+uJM9RE5k0wjGLfm7y
 /JYuIiiSf0N9lw+p/Yf36psCUEcG0dzM/tXvELj85XmxUJv2Dx3DA4hqRf2lcN+hTmag6wfsqVh
 E4pR90DsRfPzVfmkIyDWQiKGkkFcyIFkOlwMRrNn+qpOh44eT3TIvucC7HMtzGaQoY7A6Ok7gaZ
 0hRiQRCtKoQnT2P0vddJ9dIvPoyZhQUNr1qfTrCdEz9IDo1Jub3PWXvGMmq9mxpc7D76JJb+VKC
 Y9OOKxiAaMqppw4qaFl92Qn7TicvFA4RJws2csx0KbEFWdkGIn5jK8ECY/6Rkd0l3ciWTu7zYt8
 HpUolzVlchWGRLQT3v7e+8uFviK/0phNgQeA4R/bYuNEygiBs/oXCuHJO8isv6o2rouptS0tOHW
 cLMU7b5tUW64IBg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resetting entire CTL path should also include resetting active fetch
pipes.

Fixes: e1a950eec256 ("drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 951d5dccab6faf34a519d06683514aea1ee6ef60..2ce59ba50ffa0d14eaa07e993fadf0f218390ef1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -667,6 +667,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 
 	dpu_hw_ctl_clear_all_blendstages(ctx);
 
+	if (ctx->ops.set_active_fetch_pipes)
+		ctx->ops.set_active_fetch_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);

-- 
2.45.2

