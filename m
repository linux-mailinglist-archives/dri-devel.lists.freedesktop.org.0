Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673E4A4900B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 05:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490E610EBF2;
	Fri, 28 Feb 2025 04:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lle/WMy2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5132A10EBF1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:14:19 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54527a7270eso1639342e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 20:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740716058; x=1741320858; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lLWgX9Jq7cWL0p5yKqN9Wo4wrXfetoQdLwdK7I3i/GY=;
 b=lle/WMy20Q/0b7Ygx3HC7ndaeNBKFPO0UE/mrnlvyS8bGVH4lgbHV9lsdl5JMXFfvh
 DdlwRjnbKlzrt1ffqRIw1Ev6U4aMOteEoIcYZ5167zTlcgP67YwpLIM4fQeXMAj/d27a
 iErN8BGhjaoKb5jaxGye45P3zFZ6kv234qPsS+tY8TqLdoD3eQ8fWxWE8rxD/Kbxgq4J
 auzGhmhsvLtvzr5avtxbNxFgt/DQi/7RJCpR557lXCv2eF3MjDweZZSqWPYKEqKSdQ8p
 EzbM4uCZvxRaMXt+yX+Fn2eDOUBM7eksRSPY09Y/hknKb/ofcifGMUYKCepyOLdg1pgu
 A/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740716058; x=1741320858;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lLWgX9Jq7cWL0p5yKqN9Wo4wrXfetoQdLwdK7I3i/GY=;
 b=KwlrXpko5+mhAUjWPztnyzVBRyxYbru6vYq6Dc5H2uomIT4KwiBg82CxNAY2BOlkaA
 /2PEFllqxH8qtxdSfjnRP+lH2NgBmg6BwjdPcpX2qgnM4QkaSZ098LdxiKkbZh+CfMgs
 1pdAHR7P5voU9dgFffng5tBH3DE/OfEEM7XpmM+Cdnay5FJMf+WjEA/mHGU29cAPJHEK
 WUNendf9o78JlhJhzBULqb6gzsmbs7WeBlUotn/gjhXucAeg/yNXbLbAcI2xRHSPTWAt
 tNPxr+0Cji1O4Td4oMz3wXGVhFuacDe8Al/bLhik4RmvGwQNvHucs3BayE/nLOuyeU4k
 emOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGM6KasqMPLZWGKlLJEfJg6WXxrabyQnYLpymWhk/nDRXDk5QXzwXO/18FSTUJbQaWHc7Vc2AlNk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjJSz8FFYegfmylnL91G8Bf7hdjOG9RHxNdmcbUSfyKaTTI/2X
 6aw0JpvPPN4CwWkWPNPwFtWlJQF+xcw93VuU6JBK77gVAoL1oKEUfB6g8WxCodg=
X-Gm-Gg: ASbGncvt6fAx1seC+//C075AjmpX6pT2LIl0ll6dFNgLayc/d9uz4pvH2+UJLKHGfSr
 zSwwlkhYFDQMGGBKSSQycV93GIBCEOAd3CTs6AMapKLAehfLYtVuEffp7ECD9yAZ5QBZATFVY/3
 zqfJcM8z4Ihd1wTxhDpLsJcXlqg3UCMplpuYhz8ABrDJb/UQdTpjLm6tdYvhOd+JZGUcb9N8Z0K
 naDpPAdLMxoDWrFqRZa+GsHRtBuah2d4R5ihZL1Wk1HzJOVPOvA5EkYbUh0Qv1ZASn6io11qpuy
 uRkgsMADiG9WKuGXmwmlcbqJwC+r+GBkwA==
X-Google-Smtp-Source: AGHT+IFcT7s4yVONTyYgY6zAKsU9+9abRufWWlIMfQD+nj7E9gZmr9mDgSCmtquQiPUvpSCt6Cmr3g==
X-Received: by 2002:a05:6512:2827:b0:545:ece:82da with SMTP id
 2adb3069b0e04-5494c12a0a2mr667916e87.4.1740716057671; 
 Thu, 27 Feb 2025 20:14:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 20:14:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:07 +0200
Subject: [PATCH v2 3/8] drm/msm/dpu: pass master interface to CTL configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-3-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hfgy9wzGA5Q6AEJ70BD9uWOFMy1Prwe8QkTd0ByFtoY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgO7AzfWXjKQ6q1tuTp6RHJgAal/Up8SzZqq
 QYw2I3uvDyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DgAKCRCLPIo+Aiko
 1amBB/9ISmNQ/7w5UzOXxtpKcafpK0NDzRl2xZa+xPfU3WIIyQBQl7XQ1mExWV4yT53OzNbW3fl
 UjmLXTMkn815GuemnTmkSAoWOK+9irdUboUHmSwwN1TxDscP+OemA/gvyh5QDjOVL1sYu67hisQ
 BKiTgTwO3g4PvPdjW6KTjxzind9WLQzplTYYXLi7gHkfCDqtHFf0PHcWo7dyaFXjCa6yoOtBK0z
 jIsfNBrMS1d+SYmcjKvdZOAdNx80K1m/CNymtdTl16BY/6jzvCB8cpTn3QuS4ZKGNXQUfUsI0cV
 LcGdSKR7/kwjufT9P3MgiRqzFGDZ/a/jqOTmWnTbEJm7HYYw
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Active controls require setup of the master interface. Pass the selected
interface to CTL configuration.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index da9994a79ca293ec0265680c438835742102db2a..a0ba55ab3c894c200225fe48ec6214ae4135d059 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -60,6 +60,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 		return;
 
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
 	intf_cfg.stream_sel = cmd_enc->stream_sel;
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..232055473ba55998b79dd2e8c752c129bbffbff4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -298,6 +298,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	if (phys_enc->hw_cdm)
 		intf_cfg.cdm = phys_enc->hw_cdm->idx;
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);

-- 
2.39.5

