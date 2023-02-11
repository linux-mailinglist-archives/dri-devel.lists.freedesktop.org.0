Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9238F69309E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 12:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA12610E161;
	Sat, 11 Feb 2023 11:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3262910E182
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 11:52:10 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id c1so3525349edt.4
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 03:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rmt6VW0qzHeVmfsiW1rh5EIINQ5Xr+hUNmJsEmBTOOs=;
 b=EzfpwYOsuX2EE/VJNfqpGd6gfX3N3ZS3aObHcIi4JhKxtgNap2qsxZJ7nI/hBQWeO8
 SaB0NLjyYdJw9m3w4lxsp8VagGW1QSx16dWoz60m/gCm08jWxlBvsdo13QydlmhNAKED
 V8N80WYqq1DHALFRoU4/NahRAShWnQ+ibT3LGKmgiYPjJhV2iRjKkAk/ognNtVPo5KaJ
 zSlzgTN2nW+Dhwy6jO0N3Q9YYoDKhKWF38o7D24o1aF7w8XMyvu1707u4mtu1VlTuWH9
 sIW+5wx6/WfOWHqW0Ia1q73M2+U1kkeF372RfGS5n3NcJXtPelFkc91fSs2Nrb6KXiSQ
 imDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rmt6VW0qzHeVmfsiW1rh5EIINQ5Xr+hUNmJsEmBTOOs=;
 b=esAHSrFeBorHO3rUdfosdjPT8LZ7hHotg7PkA9JYLHSWrTfezDoAptJtc+WnLy/jlD
 Coo7GfhYtoEg5/B45iNDwQ3oDq307qAresp3r1Vf6SJAbsScm23HYLwE0CPzh7w17hMq
 AAk2eiV+LQYPcpTb0DL+8ByJARYzXX9BDrbhx+r4e/79eCQrdUuBK6XGF4Fg4mdTkqHx
 gf61IzZ9BzrONdY2iZvxnBGELeBhrRTWztpMT4lBijnIUdAeOtCkWkWcehHbxljo9hjN
 lwu4yNpNmLjnlDYtfOS0JTq42CqyWtvEytuvoR3aiqVZ25numHJM/n7NWRT756Hrrhdv
 IRrA==
X-Gm-Message-State: AO0yUKUz7DcZPUsExVMr8Zg0yMv3Q4LPJFePbkC0oeyuCA9YakYp7gaF
 jZdEcNzWT3ENE/9lygwlzrm+5g==
X-Google-Smtp-Source: AK7set+HItO3J1ZJhnIfUsw7yCnVjuQ5TGwGNs3uryJQQ415r1DaItG0qGXWjy+dNKjFkdvZ3HoD3g==
X-Received: by 2002:a50:935a:0:b0:4ac:b4b1:53fe with SMTP id
 n26-20020a50935a000000b004acb4b153femr3345338eda.20.1676116329827; 
 Sat, 11 Feb 2023 03:52:09 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 r10-20020a50d68a000000b004aabb714230sm3636070edi.35.2023.02.11.03.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 03:52:09 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 08/10] drm/msm/dsi: Remove custom DSI config handling
Date: Sat, 11 Feb 2023 12:51:08 +0100
Message-Id: <20230211115110.1462920-9-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
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
Cc: Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>, linux-kernel@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the only user is handled by common code, remove the option to
specify custom handlers through match data.

This is effectively a revert of commit:
5ae15e76271 ("drm/msm/dsi: Allow to specify dsi config as pdata")

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c      | 4 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 90d43628b22b..e0b911af618d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -173,10 +173,10 @@ static int dsi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
+	{ .compatible = "qcom,mdss-dsi-ctrl" },
 
 	/* Deprecated, don't use */
-	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = NULL },
+	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 8dfa69bcff77..79c33d066348 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -214,10 +214,6 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 	int ret;
 	u32 major = 0, minor = 0;
 
-	cfg_hnd = device_get_match_data(dev);
-	if (cfg_hnd)
-		return cfg_hnd;
-
 	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
 	if (IS_ERR(ahb_clk)) {
 		pr_err("%s: cannot get interface clock\n", __func__);
-- 
2.39.1

