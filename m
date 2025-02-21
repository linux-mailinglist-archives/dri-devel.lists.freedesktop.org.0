Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD88A3F86D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E340A10EAA1;
	Fri, 21 Feb 2025 15:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E+xpQIxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D7210EA9F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:11 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-abb9e81c408so38728066b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151510; x=1740756310; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bEw8TbcK6Q3ctC14U9SOir0rvTkUsaIx3mimKGEmrWk=;
 b=E+xpQIxsoho+bQ8h5zpGTS5CFDA/X1K3dxgJNiGDqtQflr1xTGf0kGo8EDMGb/5Peg
 wIoJxTG1xl2KoIgVPfpkTyMpZ/yyNAKIJKcCXLLyYOyGByfo5EY9GKn4TJr8Ea0MFABc
 WHskXcHfO6fOVaR9pEQEkRRfYtvvot7QKA4806o4JmTVcYCvcMsg8h+6DEvfHPtQdrta
 P85z2JnB6gS9BXEpOtiOg1aFblXvdlN1IWwWGIiYMTkxHZCkC5cgnMq8GjDDrKkmxVUv
 wZVZZg/xJdwDf/FMdYgfAye7diiRz1QaeKFP3FdMoIWRKC4gLeMewXAZXwBoHfUHiIWE
 tx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151510; x=1740756310;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bEw8TbcK6Q3ctC14U9SOir0rvTkUsaIx3mimKGEmrWk=;
 b=Q6vnjwWsnXWa2Q2Vy+acb+ODNvOkBjEVOMZo1y5HHaCdgSTGlQo9LbFoXWNL/AuIlW
 +K66rEET0VKDfwG7+yUrO4wmxwu3qDCxlvXZQcBhR8bzLLdqq0iP/r9t24SRPUQt80XW
 cmHuerNnmyn52J60fli+Rqc3EKhgcLtg0b33HirKvo/iercjrgyCJIDEyRzeCCDO9/90
 wghK6w+ALq6RJ7fqjccxiI6JGeb3Bet0d3ImTI5tT1ScivHF5MKVuYRjxSlQvwER20ra
 9HrvKba5O4Zt5WIo1rsxa1GPYmhDRBDuaWvJdjuiv1rzl0nZOiA0c25mgG//sywjwsv+
 mCEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyqBbUqSiDSvSzISuJFCNJbwoGf6zWQdmw+C8kFshA1469NX0A7TXlTFZkZad1pWOfzTIUvOnkmSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPWBb2JyUXo+H0nXgC17FnEgpcHHK6VgzddGVoXghJsd5VPlGU
 2j/96H1JsfeqLw3miEZrIVP4XkvxXh82p62xbg55xMOwAYVtMhNVrPeVBZStC/M=
X-Gm-Gg: ASbGncsxFk5YTqInPwwIcdPKc80yqQ2EwDBkI1c2HKEc5RhgQZc02bRJcfct44id2xU
 oShNhEr/T9YzfUrLqrjDPoewgZwVxvM6cVf4XtW3MkcSj2wYTBWu6z/Vl4ulNEMrcxm02CfgIMB
 ZxZ8VfnGHrxfQ1GvAD+pcU4B4BnWDVc3dyB+3iIC5nNrWlBtqYFg8GYjgGQwIWpdKvwAH3MnCWb
 zQWTSvFq1rlS+pnWPEdzfDaXpkfuyFtJBh16fF0W2sSY6IcZZLIOBW3jMUOzqOcpRZOeC0efM2V
 6qUoCJJxTcYpEDdYbXdehUl+zK9IkybsGFkjGo2t+ZiiYcGIA67fcKr/Fyz3KjnENjHNo2B8rAG
 u
X-Google-Smtp-Source: AGHT+IFMiyoijhhsN/r66rGa3gdxIeiogjo+gOS8owC4awJmR9PjmfqBaix2rAFdUv1+W8Bs+pHTyA==
X-Received: by 2002:a17:907:2ce2:b0:ab7:cd83:98bb with SMTP id
 a640c23a62f3a-abc09a3c1c5mr142336366b.5.1740151509961; 
 Fri, 21 Feb 2025 07:25:09 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:25:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:20 +0100
Subject: [PATCH v3 10/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 ctl_path reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-10-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ESNFAo0W8bIcHw5ZPbGGU0/A64Vmk44uaAkW3dodBRQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq16yN8kEhw7drJLPUlvodxfwFeC/r2eVwDW
 WjtMKuMWWGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iatQAKCRDBN2bmhouD
 1/+sEACGJReGDn+b3f01/aVELZif6yYJJ+SA6Yf266CzmM/U9rNv6xCkX1jnrgfNjDVdScFkSCT
 +XFtYc1C5WkoH9zVGxJ6e8nn4tVBnUQQ6JTseswL1JEW/U8tCd0JWZdiC110M2dDTt1FERCNH7/
 M6jyHhX/wgenyGMGn+vS0IrVWlGmJyqJal/7zhASirLtsF5svm5ARV4kUpjuPmM1dGaNWIli+pz
 sTgI8Cn2Pu3pf2ZODIfaoBlWGvREKN8BnTsPTmU7luLLe+dThw/9ujQBU7WRUIKEaSA8BsfoLe8
 ZFI1ZA+0J4foWj6zw3JVu9F0rgKby7wF56NgVssD5AYlydwMNYvMhAadjAanmm17MoXituoBwhE
 B1Bwe8H29yFG4uXSemzj5Mw4/VvT0IOzcK0TzuREtFjdKBmY20nLrM4ZjLVrRB/Xeaic458aPjt
 1QL86hQ8sl0ZBdFw19JRUbmIsZVBktJBc9QewRnURgDJehfrvUO5Ti4UID4l/w2G8MH7e7IzyYP
 sU7zxSLb4n393BRm1XV1KzHgRFpG52hVnOuNFcJIuEuvVpVIjZM2zo4QtzgQFzd8eEu7vY/TRM7
 +odudo4ZW8C55I/iXdluEBKSUBLFEnVYhr/fNPoLhoRmb6rVVITxo1qF3zG+C3jT0lkPwN1SK6z
 28cs2UOTVRqOM5A==
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
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 757411f8ecec2eb7096b323a99894a5d0cc37fd9..1c14770865b4b5f83a95feb35d8ca6b0c87fdb53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -644,6 +644,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 
 	dpu_hw_ctl_clear_all_blendstages(ctx);
 
+	if (ctx->ops.set_active_fetch_pipes)
+		ctx->ops.set_active_fetch_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);

-- 
2.43.0

