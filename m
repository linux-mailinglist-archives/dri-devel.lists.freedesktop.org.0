Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A444A805C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 09:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BE610EC15;
	Thu,  3 Feb 2022 08:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5440E10EBE0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:26:17 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id o12so4285619lfg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 00:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nyqAWn+MLtydxGLUl27Vc6FqSrdQWPLLY5cb0Wp4tL0=;
 b=E40myW0Dt62WsHZYp64vJbBGaUyByvUm0+AbpUUH+1FNbwrKE+JPrwmJSEAHrRNxSi
 v24iUSxQOSxR1cWAM8nNtgrjVcbIFxlrkPDSVAxmgALwRjRJkvLgCa+Bzsy3RgHQp4HZ
 aZtr+KM4OtBYZ/u2uA34l1JGVWV3C1aNQnA+zElc5wTLWvxWdjoBZhd59lPNhMrI6wrb
 1IkAJtJSUC/hRXqEoGx4ZK+U2F0UdamSRNBSlXLl2vlTxf63Iwuxrf3XLusmX/XZgz8T
 RE9n3Q8mHAMlSOFuTQhWcSpBNF6p5/KE6nMEBE8XhUYIxBt4x9n7Vk+NRQn8p1XzZ5HE
 m0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nyqAWn+MLtydxGLUl27Vc6FqSrdQWPLLY5cb0Wp4tL0=;
 b=n7YrZnmHpuF+b1/ZPhEDMv3n0BnTpXwASTunqPx4dihYqHFNH19QRxP6xZVp492BwJ
 XmFtPxtU6ygmpEVIVXiRlOZL0yOmn/ysWSKQ0RszLc1cMTcAzXA485o3pV+b4zpyJAfq
 HSXiCetCEuH2HZNlxvAN8dal/tu5pdGbRHpdNQISZuIodYY9e3LLIAIMcgN8qEjiCPBz
 CJiEEWNiMiVPdBoLkkNSyDFRNmW9AOBpmVRlQPaajsAMuhl9PAIhSRzx0wAIPiiLli8Z
 278QvRLkIPxU7oGGhf0vGEF9DyuttoO2yiH7adQ4ocZvuuYMG9Vnn/KBpfW0OjwhZe2b
 5i2g==
X-Gm-Message-State: AOAM531qFcwehMKTjsV8s1HTVwj/BiHOADNwnUQEln7qIWCP/UGiF/8Z
 vD93QXU480WXFeYrmoph58CLGQ==
X-Google-Smtp-Source: ABdhPJxt9wyAADoi6sO3Q9B2fKIcxZB9Lf2naVuJGw7avxWxVk+8JXcX+EWz6eHxZO0qa/71OjJBew==
X-Received: by 2002:ac2:55ad:: with SMTP id y13mr25702114lfg.38.1643876775631; 
 Thu, 03 Feb 2022 00:26:15 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n15sm4083440ljh.36.2022.02.03.00.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 00:26:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 3/7] drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
Date: Thu,  3 Feb 2022 11:26:07 +0300
Message-Id: <20220203082611.2654810-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stop caching msm_dp instance in dpu_encoder_virt since it's not used
now.

Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index e8fc029ad607..6c1a19ffae38 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -168,7 +168,6 @@ enum dpu_enc_rc_states {
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
- * @dp:				msm_dp pointer, for DP encoders
  */
 struct dpu_encoder_virt {
 	struct drm_encoder base;
@@ -207,8 +206,6 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
-
-	struct msm_dp *dp;
 };
 
 #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
@@ -2118,8 +2115,6 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-	else if (disp_info->intf_type == INTF_DP || disp_info->intf_type == INTF_EDP)
-		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
-- 
2.34.1

