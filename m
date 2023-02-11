Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3AD692D45
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B7810EE9F;
	Sat, 11 Feb 2023 02:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5476F10EE73
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:29 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id c26so15414207ejz.10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBtSSJm2Q681SOzEVunP/jb9XeoFSAOX+ipDA69kELA=;
 b=sg9keBqbMjfQQcQif+oaVQK+Yp92o+f8F2PwyWq/LjwzIDi2rbjysyaNEQ+0cYu/4R
 XiYyTZm/q6pOSjdD9Nf94LYR7Sn+6fEjKXOO5fKLVRQTPvLX9jvojbGf0YbqhBHC6qc4
 Ff4DrcZxUGXAswWb7yHSO23+8JAnohre3f+maki4qcL9S2Uc6ZmK6iHllTLM0XdjcoX7
 +dDMCyAfBGIZ/CgUjmooDymdtmhSB+7WX/XUfG2LzGwubv6N2vqa6qCcXE8lTIlcOVL9
 95Zm//fX2kyvZyLNPNf/xcZFo/B0YJNDPIsYE4pHpvPBhRzDoY8n0qOR3zzunXZsbG49
 GXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBtSSJm2Q681SOzEVunP/jb9XeoFSAOX+ipDA69kELA=;
 b=h4JNX/dXDq4TXCdQ/P63zZcHZ6q4OkTFdI4uAfHxR+GIddsaRjaXvb2Yi6hB9UYGGQ
 qjqUMsj5Tp8oKBBRwnnrrgU1rHbPPsLJggT52JTArhdWaP+/r+QPo0JobQm53sxxpY6T
 E7nk0N/2ehzPDi12Bw88U/I+a5JNF+avYNSYDTr+vvciJO0T/3AvHP1yfxNQhhEmImIs
 qTA+lVJL/bceI0WQ1yFfkbbbXVkWwIguxVJxX67iylPNZWaQAQrQNoRBJOQ1gdnFibyD
 pzl3XLAxzwZBDm0Ao7574tt7mnL+jIeHEjdHlmRFDvZuIb6b7pJPvTy5eaVDz/yGabrE
 roIQ==
X-Gm-Message-State: AO0yUKWEkTgO4HdF4ReiLDlCgUhaJLgqXTNhZlPQRVk+bF14LRwPtOe9
 lid2mCJEen/H7IW1IDa4VnR37A==
X-Google-Smtp-Source: AK7set/8GT6CyKBxL1KJtK3UcufJdzrnHerTpNHB08294/NiEUeA/bAY7Ko8x4PnHY8cQxdz1IG3lw==
X-Received: by 2002:a17:907:10c6:b0:8b0:4559:38f with SMTP id
 rv6-20020a17090710c600b008b04559038fmr543652ejb.23.1676081488929; 
 Fri, 10 Feb 2023 18:11:28 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 32/43] drm/msm/dpu: enable DSPP on sc8180x
Date: Sat, 11 Feb 2023 04:10:42 +0200
Message-Id: <20230211021053.1078648-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 1787dfd1e28e..5cc5f59f07c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -91,6 +91,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.sspp = sm8150_sspp,
 	.mixer_count = ARRAY_SIZE(sm8150_lm),
 	.mixer = sm8150_lm,
+	.dspp_count = ARRAY_SIZE(sm8150_dspp),
+	.dspp = sm8150_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8150_pp),
 	.pingpong = sm8150_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-- 
2.39.1

