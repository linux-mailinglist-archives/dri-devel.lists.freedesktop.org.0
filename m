Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A536B645108
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 02:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A8A10E16D;
	Wed,  7 Dec 2022 01:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3126D10E164
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 01:22:40 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b13so15479987lfo.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 17:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5Gb3UnijTffvUZ5061n1gC+IjflOu8fq8L5Sow654E=;
 b=PIC9qUOax1lNgU52qpQYQPGzpNY6onUZwdx1GC5dBi8GZ5KIIX1IH1816QuhdOXiwx
 ha+jpxvYJTivgjLrmBQGwtztQ0B4nzzQwvBzW2zHBaqiWETCr4QO05o/5KhNpGISkdCj
 MM9AbRVI2YhmnmBSCE/m6OPmmrcn4d9O4kLiX0ZwJxKQ3tXdiVBQDkF+8MLOlNnru18O
 JxBo3V/JaW+SgMUZwxM/U5cgc5IqzGO4JkzTW6VDXGSrprceqoeqsBA/BwutQrweXM6p
 ukTzwOevaxwp8C2Utv5P1fDfM/WHRw1xPUgwMhY0FvACJTzjR7NA8S77F4zb2onc1cjp
 irog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i5Gb3UnijTffvUZ5061n1gC+IjflOu8fq8L5Sow654E=;
 b=LM4Vx7dD34iyMI+CSAfS9i9+s7k4WtmR3ltp4GjOH7i3z8CPqhbswKjt9MrvRfeTzW
 wuspS3in7b4uHBxL99yAGjAXsp8JNVQy4D8abEe2houYti5Gj76uVmKwmdWh+rr0Xjyi
 kNAb9M+hwMWS9g3hWwkoe/XpwCE5yDjVwy10n0uqPDkTO32H4HmLyuqNMTWHScmVmgS8
 /wjJV55yqKxtmp4hI8REW7Uw5qDdm5wYzmgw9AlhUBkI0umCqfCYudGhoe5WMIhrcZcy
 mAQYGpgYzFl6jgNpZEXUkVlBFttUpweUyBzjclvYwHz+H5DTenbDhO11x9kklUbaXz28
 Oz0w==
X-Gm-Message-State: ANoB5pkPL3ep013p28w0I4R9bC5p8GfhmIjgeDF+P3iaDgYbQsLjBRXb
 dvDN/36mBHeV0YbGhIFf4B0CzA==
X-Google-Smtp-Source: AA0mqf6Y5qfBgtZkDtnlFNGlVjbAh8hjm8ugydhK0fpipiipoIX5woUHt+dDaRsGdsJ8ncbiA2718g==
X-Received: by 2002:a05:6512:3b0d:b0:4b4:7cb4:f932 with SMTP id
 f13-20020a0565123b0d00b004b47cb4f932mr24777704lfv.243.1670376158245; 
 Tue, 06 Dec 2022 17:22:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:22:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 07/11] drm/msm/dsi: add support for DSI 2.6.0
Date: Wed,  7 Dec 2022 03:22:27 +0200
Message-Id: <20221207012231.112059-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
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
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
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

