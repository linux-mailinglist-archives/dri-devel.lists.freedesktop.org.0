Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014B9636BFC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 22:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084ED10E632;
	Wed, 23 Nov 2022 21:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2C710E623
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 21:04:10 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so29897306lfb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 13:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5Gb3UnijTffvUZ5061n1gC+IjflOu8fq8L5Sow654E=;
 b=qIxen24U8K5h1/Axh9/h7awJyD7b5j5GQd0C+SmQxJr37O/RwifoaXm5HjdRDKOpYi
 e3JI54ejKYU/+vrMyTjcGxeeapVHQlGWBUZP4diFzXIXsGeDGv+5DJ8W8PSGMXlOwpvH
 NCA92vBFQof17kWPch2d/Ji6EhRuGEtP3ja31j/9iY6w73K3o2lYWWX+0pHJ585Y13cv
 H3FUuV1yllXOu2NNVh5vqNf4BKTGFLqed5d+A3ErX+9kZdrd/pTxqahk4lLz4sIpBiYf
 gcO6pSObNBmolNfeAbGA2IZJh9GbesbxRoWf8uaeIuWHCkpUhCFRg513kHEBoQCI1rw9
 mYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i5Gb3UnijTffvUZ5061n1gC+IjflOu8fq8L5Sow654E=;
 b=FocFl+5tZ/s4TOq5W5SJgA6e9s2AWE4sNoPldNR9OX7iPWZa63ZO8gBJdvvAjQrUiw
 DOg1/Kq4D/f7m/uCLy+v1trePDn4Hi6VwPSvAc/6aspbyoZYbt8Q3mRc6CDpsv/0MVVI
 61bBj2pvzoEzORTTY9ArnVgO5JysqZugLww5HvXrxdXgQgCAjyBp5ew9ZBaTJJT7aL5i
 KBCuL1za7SCcmbZpby7kcJkwY0aPqLPU5qkliAuP2WHqnlWzaGk+NFF9uVvbmawPWPiK
 x8u/GJZjqaqN/NFg0uhOvWSg7PhsyGQk1h5/dQmksUsAdq/VjP+mRN8rUSS/I+y4/CoR
 hmVg==
X-Gm-Message-State: ANoB5pmOCvNmd6Qd6hIRpGNWtU4R5MKHgdd2BgcsnsshaZfentyU59Fs
 Dmhjfxr/8SqrlAZn6SVsewOh7A==
X-Google-Smtp-Source: AA0mqf5jBg7VOIi+svpan2pzqx22MI42d9wHkZtnb2p51nuo9gB9boIGfF5ybyd7oJIRdB6jwawJlw==
X-Received: by 2002:a19:4f14:0:b0:4b4:b20c:4b7 with SMTP id
 d20-20020a194f14000000b004b4b20c04b7mr4503069lfb.201.1669237450335; 
 Wed, 23 Nov 2022 13:04:10 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac25f63000000b004b177293a8dsm3009913lfc.210.2022.11.23.13.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 13:04:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v5 07/10] drm/msm/dsi: add support for DSI 2.6.0
Date: Wed, 23 Nov 2022 23:04:00 +0200
Message-Id: <20221123210403.3593366-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
References: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for DSI 2.6.0 (block used on sm8450).

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 7e97c239ed48..59a4cc95a251 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -300,6 +300,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 8f04e685a74e..95957fab499d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -25,6 +25,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
 #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
 #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
+#define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.35.1

