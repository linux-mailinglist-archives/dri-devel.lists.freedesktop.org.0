Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0130B810713
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 01:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C7A10E151;
	Wed, 13 Dec 2023 00:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEF110E151
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 00:57:31 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50bdec453c8so7486518e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 16:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702429050; x=1703033850; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iw+vqIrpMCqoLuNdswkeTR7o91xkh4BP60Z4S9vbYx0=;
 b=XFVOwCy/MdANLDzgu+5sQi3gCxBNuM2RaOaL/wOW1VFKc80BJsThW/MMZEoXrnfJ1f
 gj8RDK6YB0CnxZfbq2fo5snQ+SWui7zswdGeFFsMMPc/5A4Ac6CzebRP5BjkzhUvVr5m
 AM+F/hyq9apS2nah9gYWiTsfULsLVSXJma8FY68Nd1y/qi0ct1pXNPxXuMSiy9zEab9z
 nXtjUTGG1bt/12kKsYi94XTAOLsBPh2joFH/txbsl9/+CqiBhvgqq/cLvJw5be75nDaH
 Uz1ZcHx2IgQj0V1juN/ELlhcWF0zNH2E+G+W3oC6i5bbFbggWdmCxjy393Fuj367WBo1
 GoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702429050; x=1703033850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iw+vqIrpMCqoLuNdswkeTR7o91xkh4BP60Z4S9vbYx0=;
 b=Bu68B4r+Gljjw24QyHk6fIaJ5Mv/kr7DsdswS5zXvVTk/Q94FzDbVZyvaVsAtVcl+P
 M3T3LQeIvXZq5Ubc9Dz7QYShZowsJzCsOda8O85QlGXOr96kdVdierLu8s9qOwhi0tGX
 /SSSMdIlcRs4nAPwV1k3o9z3TkDD6+phjFTX2IbNmc7pZZ8kHPMqwfmPVYo13TJRmWlm
 5dxs5RNXAmdAb73+gKzkADtVvAu/wNyG1gQc5Do64YZyh8F3CTlHYEpikLwAoFlhhbkF
 GAcj48/J1u124ChcprKWTzdizzAVynIg98pil5w50pMqTUrnhPZHDG2rF8GVDGllSV5c
 C6iQ==
X-Gm-Message-State: AOJu0Yyuj/2bsFtlTjkPsYaeI4H21gW2ZvHnyqVL9BVL/qqQJat2x6ei
 OcftOm/hDR2RdTNp3otNL4WDvQ==
X-Google-Smtp-Source: AGHT+IG2u5rGzo5hYIj9xeOkLdMYT04GmZzKwZFkbccKkIYix0qfsOih520Fx6RMmwO2wAWBGnV2kg==
X-Received: by 2002:a05:6512:3451:b0:50c:221f:857a with SMTP id
 j17-20020a056512345100b0050c221f857amr2877687lfr.136.1702429049729; 
 Tue, 12 Dec 2023 16:57:29 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a197605000000b0050c2294c65dsm1481370lff.261.2023.12.12.16.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 16:57:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/dpu: move CSC tables to dpu_hw_util.c
Date: Wed, 13 Dec 2023 02:57:28 +0200
Message-Id: <20231213005728.53060-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Move CSC tables out of the header file to fix following kind of warnings:

In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h:8,
                 from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:5:
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:54:33: warning: ‘dpu_csc10_rgb2yuv_601l’ defined but not used [-Wunused-const-variable=]
   54 | static const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l = {
      |                                 ^~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:39:33: warning: ‘dpu_csc10_YUV2RGB_601L’ defined but not used [-Wunused-const-variable=]
   39 | static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
      |                                 ^~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:24:33: warning: ‘dpu_csc_YUV2RGB_601L’ defined but not used [-Wunused-const-variable=]
   24 | static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
      |                                 ^~~~~~~~~~~~~~~~~~~~

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 44 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 44 ++-------------------
 2 files changed, 47 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 0b05061e3e62..395fdcea28b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -561,3 +561,47 @@ bool dpu_hw_clk_force_ctrl(struct dpu_hw_blk_reg_map *c,
 
 	return clk_forced_on;
 }
+
+#define TO_S15D16(_x_)((_x_) << 7)
+
+const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
+	{
+		/* S15.16 format */
+		0x00012A00, 0x00000000, 0x00019880,
+		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
+		0x00012A00, 0x00020480, 0x00000000,
+	},
+	/* signed bias */
+	{ 0xfff0, 0xff80, 0xff80,},
+	{ 0x0, 0x0, 0x0,},
+	/* unsigned clamp */
+	{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
+	{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
+};
+
+const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
+	{
+		/* S15.16 format */
+		0x00012A00, 0x00000000, 0x00019880,
+		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
+		0x00012A00, 0x00020480, 0x00000000,
+	},
+	/* signed bias */
+	{ 0xffc0, 0xfe00, 0xfe00,},
+	{ 0x0, 0x0, 0x0,},
+	/* unsigned clamp */
+	{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
+	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
+};
+
+const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l = {
+	{
+		TO_S15D16(0x0083), TO_S15D16(0x0102), TO_S15D16(0x0032),
+		TO_S15D16(0x1fb5), TO_S15D16(0x1f6c), TO_S15D16(0x00e1),
+		TO_S15D16(0x00e1), TO_S15D16(0x1f45), TO_S15D16(0x1fdc)
+	},
+	{ 0x00, 0x00, 0x00 },
+	{ 0x0040, 0x0200, 0x0200 },
+	{ 0x000, 0x3ff, 0x000, 0x3ff, 0x000, 0x3ff },
+	{ 0x040, 0x3ac, 0x040, 0x3c0, 0x040, 0x3c0 },
+};
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index c0aaad2023da..25cc13b57756 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -21,47 +21,9 @@
 
 #define TO_S15D16(_x_)((_x_) << 7)
 
-static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
-	{
-		/* S15.16 format */
-		0x00012A00, 0x00000000, 0x00019880,
-		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
-		0x00012A00, 0x00020480, 0x00000000,
-	},
-	/* signed bias */
-	{ 0xfff0, 0xff80, 0xff80,},
-	{ 0x0, 0x0, 0x0,},
-	/* unsigned clamp */
-	{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
-	{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
-};
-
-static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
-	{
-		/* S15.16 format */
-		0x00012A00, 0x00000000, 0x00019880,
-		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
-		0x00012A00, 0x00020480, 0x00000000,
-	},
-	/* signed bias */
-	{ 0xffc0, 0xfe00, 0xfe00,},
-	{ 0x0, 0x0, 0x0,},
-	/* unsigned clamp */
-	{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
-	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
-};
-
-static const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l = {
-	{
-		TO_S15D16(0x0083), TO_S15D16(0x0102), TO_S15D16(0x0032),
-		TO_S15D16(0x1fb5), TO_S15D16(0x1f6c), TO_S15D16(0x00e1),
-		TO_S15D16(0x00e1), TO_S15D16(0x1f45), TO_S15D16(0x1fdc)
-	},
-	{ 0x00, 0x00, 0x00 },
-	{ 0x0040, 0x0200, 0x0200 },
-	{ 0x000, 0x3ff, 0x000, 0x3ff, 0x000, 0x3ff },
-	{ 0x040, 0x3ac, 0x040, 0x3c0, 0x040, 0x3c0 },
-};
+extern const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L;
+extern const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L;
+extern const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l;
 
 /*
  * This is the common struct maintained by each sub block
-- 
2.39.2

