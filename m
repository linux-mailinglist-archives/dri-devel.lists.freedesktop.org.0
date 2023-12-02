Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90C6801ECC
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 22:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BB010E12F;
	Sat,  2 Dec 2023 21:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE9610E0DF
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 21:40:21 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50aabfa1b75so4692121e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 13:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553219; x=1702158019; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jxwDCoOR7ZNcOAZH2cumKGd3jy5cB2n2pA+0b3i0ZRI=;
 b=ao2WGGacNHisHUhZ99MUUJtoASTdVFy7WUZ1m/aSJ2D/cGU64NaDzpryOz1wLZsU6j
 m3HfUiw3DYWGh5UOxIyA3A/QuP7wvQb7Norh85B0kALDp6pssxjEX+lYldAmdufSeHQx
 OvMS2mGY0MYAKgCrA6Ow3xfE3Eml/hJO2DgZAIImEWSmYcXo+pflwO0BwzUvPOXDVN9k
 HS6axXJL++zA1cWwx8wEbd5dZjiq75e4gAIJnT1By9JCBswaGhlPskcF2ePuOSFgyh+X
 xzYFQnLyuHFf13TrYKITfql+Dnc13JgGiretfxwJ7iiiOouWLvOR8lwQGiJidtEAEZXm
 yzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553219; x=1702158019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jxwDCoOR7ZNcOAZH2cumKGd3jy5cB2n2pA+0b3i0ZRI=;
 b=nNtpw7lEChOGRQ8s05ToNRq7mewEHuZ9Kf38NknFCHFtc4QjdAsUrXPVG4Y6G3sRYO
 0HxY3xv42V3NjYyU0YDW2sxs5uEZOlPO/iPOByw5dN5me3rtwWserHmr0dtvH6+X5YAo
 skbfCumTh94HpPLiI86SYt9EPPII2KT5kvPUiLqVzs1QQO5gguZ/+4aS/D7/fRPsBSpq
 BarKKjVM6EdpEW86btwsdJK8MqwqLoCCAM1/6epTio6miQisSMCM73uMEzCzS1p/j5Mx
 375jS7StixS6rtYV16y46zEq/aiK3YyoL7OLgslbZtqnpDZgsneoMcZxbLMkW8RcBaTv
 l5Ww==
X-Gm-Message-State: AOJu0YyMquDQ+CiiJV+HSCpmLEZPlgG1R/GP4f0a7B3mCFFfPpdSLrqI
 nQ+qczuEBtKpYF82O10jNf3qoQ==
X-Google-Smtp-Source: AGHT+IFuywgdglJv3/9MQaAbNBR2CeJFSzfl92kTlEKKfRLv9ergZGA8nr+WaRDOeLPGnoLQJAOQ+A==
X-Received: by 2002:a19:7618:0:b0:50b:c1d4:d41b with SMTP id
 c24-20020a197618000000b0050bc1d4d41bmr1752437lff.20.1701553219094; 
 Sat, 02 Dec 2023 13:40:19 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:40:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 02/12] drm/msm/disp: add mdp_fetch_mode enum
Date: Sun,  3 Dec 2023 00:40:06 +0300
Message-Id: <20231202214016.1257621-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
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

Pull in new enum from the mesa registers. This commit should be replaced
with the registers sync with Mesa instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp_common.xml.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp_common.xml.h b/drivers/gpu/drm/msm/disp/mdp_common.xml.h
index 5220688727e4..2fa333bab3d2 100644
--- a/drivers/gpu/drm/msm/disp/mdp_common.xml.h
+++ b/drivers/gpu/drm/msm/disp/mdp_common.xml.h
@@ -107,5 +107,11 @@ enum mdp_bpc_alpha {
 	BPC8A = 3,
 };
 
+enum mdp_fetch_mode {
+	MDP_FETCH_LINEAR = 0,
+	MDP_FETCH_TILE = 1,
+	MDP_FETCH_UBWC = 2,
+};
+
 
 #endif /* MDP_COMMON_XML */
-- 
2.39.2

