Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3C283E173
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFBB10FD4D;
	Fri, 26 Jan 2024 18:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22ACE10FD3B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 18:27:31 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2cc9fa5e8e1so7337731fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706293589; x=1706898389; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W/0vQlu3/zRSTNUc/QWsRNBkw7wsjD404h/u9X2qZl0=;
 b=vEEiCTK98lQnqygUs3TyfoT21YnzZZbADH88CUTYGSpbhrKqq27TABcwsitSManhGk
 UgpAlfRmBqvPnWMIxJbgkFfWvJTE8ygL6NMlMJirbmuEOSVEQoDyv6LJ0d1poutMjRwk
 VmXrxezczkfK12S4rViFwXCAj8W3eDNLMC/WbSv4O7EIWtMyhgFLWyJObbTmVBBUNPFO
 EQ/s4B0D0n7LNofCXy4b8/Xintme4A6e4f57dZulB2NdoYNLOGDIsaIvq6aMRlMpk21q
 HNIMRBdLnR75qMQ4hd5i80/vS1KhfGYm4F9mBpvQCFhqswfpaWSnQa3P+Bz7A8um6HFz
 VGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706293589; x=1706898389;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/0vQlu3/zRSTNUc/QWsRNBkw7wsjD404h/u9X2qZl0=;
 b=NWFxadNGQxDOBmMtgQuzI8mZ2+kvXLWZLVtGlX3dfHYEH3xDJPnF+AJ1vUpckQytob
 WHx4KzLQo0aqXNcusMYGaeS7wCwEvQ+7PPaxtPJkjEdOtJn4HCvdbsNdvrZ0DiKKX1lg
 aCJdL3+IeDyTMbKNXHJoa8k8odpZJFsFgjgp8f1/+LI7H82BqXNEn1ZbiMQnMvEw3Z/7
 cG8lUSDJmknvm3qdr3rUbCgJiIINnXA0qU2bPY1wRKC7f7ANRjIW/vxLXSzLYbKvqD4O
 AZ4prLfJG+qNxfKkvccw3RyzvtVzRRWBt2+ZcmqN6Okr7Ocj4t+X1gxN7j5YN/h946R5
 JYmQ==
X-Gm-Message-State: AOJu0YxwOJ+rcklC+zqTSgergZ516nkB41lC9vojvPfl5NKv+b0Qou1M
 X2iDx4bE9wPanCzpAagyqmxFPUpIGcPr9x5kc8uwoiW+8YFNYktkkA0nEAY06rU=
X-Google-Smtp-Source: AGHT+IEPWX4Lz/H8/swWBAYAe0lk0wFuw6fBf2Hq+dQ3GRoiOiWAbkzoaY14FLVp7ZZ4TdxycFKtCg==
X-Received: by 2002:a2e:968f:0:b0:2cc:7df7:3649 with SMTP id
 q15-20020a2e968f000000b002cc7df73649mr130496lji.46.1706293589259; 
 Fri, 26 Jan 2024 10:26:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 10:26:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:23 +0200
Subject: [PATCH RESEND v3 04/15] drm/msm/dp: inline dp_power_(de)init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-4-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2942;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0tPYPq9OqCyaK2qdciiqePf9VS3u8McIRcRAIy4vqEY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lQIsAfKH/xrlU4ikbYWUv98SABGowk2KICx
 AtJJlyd9u+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5UAAKCRCLPIo+Aiko
 1Y25B/0TS/+5IJDY+MyW4gxKAkONHP+wLqnydxN+t6oMIT3SGOSLBWZRPUyUT3guCuXXTuM+i0D
 fRsL7UlkNZRFJ0/hlZwVwFsx+nwTDKF4yDG2YrQOCuFRQ5fDK44KGnf1ts0JZ8n36YWuwOd2dqs
 jm5djOU2r+DqjqeNmj2UYRfp/mJOTPIJPcMP4SFfGMoXayvr0QHOsQy/ipqcMqXFyfJuc1o9VUJ
 SWuD428c2AXwSXe5eKv+hvuLqF1Bll3PLkpk7YZW84RNYcAokT9FJAuiEj4EPBRpB0O/Jf4bFUi
 95pGM6M6Qljuffld8cPsSIyUKeXC7EtP+8/MhZ/1i09aUJ9h
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to cleanup of the dp_power module, inline dp_power_init()
and dp_power_deinit() functions, which are now just turning the clocks
on and off.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  4 ++--
 drivers/gpu/drm/msm/dp/dp_power.c   | 10 ----------
 drivers/gpu/drm/msm/dp/dp_power.h   | 21 ---------------------
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 67b48f0a6c83..8cd18705740f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -434,7 +434,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	dp_power_init(dp->power);
+	dp_power_clk_enable(dp->power, DP_CORE_PM, true);
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
 	dp_aux_init(dp->aux);
 	dp->core_initialized = true;
@@ -448,7 +448,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
 	dp_aux_deinit(dp->aux);
-	dp_power_deinit(dp->power);
+	dp_power_clk_enable(dp->power, DP_CORE_PM, false);
 	dp->core_initialized = false;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index b095a5b47c8b..f49e3aede308 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -152,16 +152,6 @@ int dp_power_client_init(struct dp_power *dp_power)
 	return dp_power_clk_init(power);
 }
 
-int dp_power_init(struct dp_power *dp_power)
-{
-	return dp_power_clk_enable(dp_power, DP_CORE_PM, true);
-}
-
-int dp_power_deinit(struct dp_power *dp_power)
-{
-	return dp_power_clk_enable(dp_power, DP_CORE_PM, false);
-}
-
 struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser)
 {
 	struct dp_power_private *power;
diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
index 55ada51edb57..eb836b5aa24a 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -22,27 +22,6 @@ struct dp_power {
 	bool stream_clks_on;
 };
 
-/**
- * dp_power_init() - enable power supplies for display controller
- *
- * @power: instance of power module
- * return: 0 if success or error if failure.
- *
- * This API will turn on the regulators and configures gpio's
- * aux/hpd.
- */
-int dp_power_init(struct dp_power *power);
-
-/**
- * dp_power_deinit() - turn off regulators and gpios.
- *
- * @power: instance of power module
- * return: 0 for success
- *
- * This API turns off power and regulators.
- */
-int dp_power_deinit(struct dp_power *power);
-
 /**
  * dp_power_clk_status() - display controller clocks status
  *

-- 
2.39.2

