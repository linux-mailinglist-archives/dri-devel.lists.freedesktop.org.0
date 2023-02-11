Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B894C693529
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1896510E414;
	Sat, 11 Feb 2023 23:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177C910E3E0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:45 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ml19so24113627ejb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8WbyKJIgDAkTSKP0Na63Y4h/aBgg8FAGD3rP0d+12KQ=;
 b=AxVQ5DpOn0azvPcrChBh7G9KXgsRJaYaX/Ed9CjYRi0D/1aZDdC4+1vlIjjYI+RVvZ
 9Cg8M3NQV0ITPfeSn+6HNpVSeUG8Om5Gql2bHIYKm2BAdH1IzNEBiea8489c94ejnl1d
 ocuN5/fqNE2GaXDMw2wVoUdXa1izHHF4DfluGjVOOeXo/zcK/659sSttjyx677lYppcF
 ip5NPWnZjbzaWzcXxMLRFsGCPwqETkgiBOGUIACSS/PCuIu53qvMRJge0wHJTIyk3MHe
 JcmPJaOVnawHh5RUQ7kubx8BABMiKFvfPh31ONbczag5SYDKjnbGR+zH3u6No2zZ+Bhf
 XZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8WbyKJIgDAkTSKP0Na63Y4h/aBgg8FAGD3rP0d+12KQ=;
 b=mkUXh/6GMvQKCwUw55XVvmZKnC0OZXpKApUvdJXXmarw8ghb0fxNF3RQHTiNJexWoA
 Tqz8Ryq/2eIHp88NejLuodvAFC7zM7XJPa8WK6tksrYKXXsUfsUjRTRvg0BHgYPl+CkX
 9fe9PRGEPk61XYU9Q1tcpnOM25ybPXgkcFdxVOTNaBXxHvvLVkY9zcWkDifVuNcSyIVG
 A5I2Sg5JmjFZFrUwl3tmpq/bzbVJViEn77ape0sSAl4n/rKaa+teaLMUpOFdSmYAu6Wz
 qZ/ubc/7Km72zjayLtG0QIprUD+kWjJnmii1XQEy9o944G4Tgx0NVS+xsrJucnjv2vFV
 uvzA==
X-Gm-Message-State: AO0yUKXbqqrdQe0zo8WTSV3QqCiT4Wg162tGClhn6VtMUyDAoap6zqia
 SshZKOACnEeRc0r77vYKajjHMQ==
X-Google-Smtp-Source: AK7set/oGeRfjLa2O028Pogw0/n/fWEuELrkJSavwxaa6YHX8OvN4qbViOvG4vpfY9hMD+xgiYTHnQ==
X-Received: by 2002:a17:906:5a9a:b0:889:58bd:86f1 with SMTP id
 l26-20020a1709065a9a00b0088958bd86f1mr20241448ejq.14.1676157224729; 
 Sat, 11 Feb 2023 15:13:44 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 37/50] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for
 sc8280xp
Date: Sun, 12 Feb 2023 01:12:46 +0200
Message-Id: <20230211231259.1308718-38-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

Theoretically since sm8150 we should be using a single CTL for the
source split case, but since we do not support it for now, fallback to
DPU_CTL_SPLIT_DISPLAY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index a3a79d908451..094876b1019b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -47,13 +47,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-- 
2.39.1

