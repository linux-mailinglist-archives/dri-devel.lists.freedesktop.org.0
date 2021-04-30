Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE75B37013B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 21:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245856F5A7;
	Fri, 30 Apr 2021 19:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E896F5AC
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 19:31:12 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id i14so5586241pgk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 12:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zoyc92td/lrE+1cEtuWT2gS23XHAVp7Jh+/xM6e703E=;
 b=I7NSjPjcc21r8BP/rzm9f+bbrdMrSfdOl1GG7A81BEWaP0eiPpYbOjNGk04Ui5rJTG
 /eJftYzh6EbB1TLCDCYovgIRxImMDyaBvtXHbZGYrTi7TpyW3dhW15ajxXC6WM4+kmQI
 BD+z0XK9QOaHRLs6w0I3P6ck8mPCG4Qp1zfWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zoyc92td/lrE+1cEtuWT2gS23XHAVp7Jh+/xM6e703E=;
 b=h2+lXixQYdRVG1GG2q/lejPjckhUQNOsl7FVJu/dZSccD5hotbqym+k69R4UTbuf0H
 vcYfCl6BWykHiDiPvRRQ2UaKwDrhqg6uXP0HNiJ6sQU+a51fVbHAtK1dnmWJ5GyGN6u/
 IXjXL5uyKVMxqFugxh7ZZVG8812OnuPI3nq6747t5taZk7VxTWMxK6GcU8UbQGe1aXmX
 eqSMDxunF+KaI+C8lJF0KSheenJrw1dojEq4uvX4kA8mSUPNRNFKqhauydBib8utv1NZ
 e5KVCRT5VmD1eQd4MRpyKSBVWGgYKso4TuLZ5mRQnNrUNSAzJgYgsV4FQ5/bIEVERYuG
 aaQw==
X-Gm-Message-State: AOAM533IqFaGtNvL9dpszCnGLtgKC9FazMAf8GUmxOaWeboxxthqBZdd
 plN21ZSAtBkjvRjzNQ/u7c1QIA==
X-Google-Smtp-Source: ABdhPJw36DyEYB6yLssWTFLdRf6MVS2ZLnjGsTHpD+bVS+765gw4Cq3zqa8hvb03GUCQ6sTh+x1KJA==
X-Received: by 2002:a05:6a00:b82:b029:27f:dffe:214c with SMTP id
 g2-20020a056a000b82b029027fdffe214cmr6546945pfj.57.1619811072112; 
 Fri, 30 Apr 2021 12:31:12 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dacb:8fee:a41f:12ac])
 by smtp.gmail.com with ESMTPSA id t6sm3143500pjl.57.2021.04.30.12.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 12:31:11 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 5/6] drm/msm/disp: Use plane debug print helper
Date: Fri, 30 Apr 2021 12:31:03 -0700
Message-Id: <20210430193104.1770538-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210430193104.1770538-1-swboyd@chromium.org>
References: <20210430193104.1770538-1-swboyd@chromium.org>
MIME-Version: 1.0
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the DPU_DEBUG_PLANE() helper to print the plane number instead of
open coding it.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index f898a8f67b7f..3f5626832c9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -283,8 +283,8 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 		}
 	}
 
-	DPU_DEBUG("plane%u: pnum:%d fmt: %4.4s w:%u fl:%u\n",
-			plane->base.id, pdpu->pipe - SSPP_VIG0,
+	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s w:%u fl:%u\n",
+			pdpu->pipe - SSPP_VIG0,
 			(char *)&fmt->base.pixel_format,
 			src_width, total_fl);
 
@@ -353,8 +353,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 			(fmt) ? fmt->base.pixel_format : 0,
 			pdpu->is_rt_pipe, total_fl, qos_lut, lut_usage);
 
-	DPU_DEBUG("plane%u: pnum:%d fmt: %4.4s rt:%d fl:%u lut:0x%llx\n",
-			plane->base.id,
+	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s rt:%d fl:%u lut:0x%llx\n",
 			pdpu->pipe - SSPP_VIG0,
 			fmt ? (char *)&fmt->base.pixel_format : NULL,
 			pdpu->is_rt_pipe, total_fl, qos_lut);
@@ -406,8 +405,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 			pdpu->pipe_qos_cfg.danger_lut,
 			pdpu->pipe_qos_cfg.safe_lut);
 
-	DPU_DEBUG("plane%u: pnum:%d fmt: %4.4s mode:%d luts[0x%x, 0x%x]\n",
-		plane->base.id,
+	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s mode:%d luts[0x%x, 0x%x]\n",
 		pdpu->pipe - SSPP_VIG0,
 		fmt ? (char *)&fmt->base.pixel_format : NULL,
 		fmt ? fmt->fetch_mode : -1,
@@ -450,8 +448,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 		pdpu->pipe_qos_cfg.danger_safe_en = false;
 	}
 
-	DPU_DEBUG("plane%u: pnum:%d ds:%d vb:%d pri[0x%x, 0x%x] is_rt:%d\n",
-		plane->base.id,
+	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d vb:%d pri[0x%x, 0x%x] is_rt:%d\n",
 		pdpu->pipe - SSPP_VIG0,
 		pdpu->pipe_qos_cfg.danger_safe_en,
 		pdpu->pipe_qos_cfg.vblank_en,
@@ -506,8 +503,8 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
 	qos_params.num = pdpu->pipe_hw->idx - SSPP_VIG0;
 	qos_params.is_rt = pdpu->is_rt_pipe;
 
-	DPU_DEBUG("plane%d pipe:%d vbif:%d xin:%d rt:%d, clk_ctrl:%d\n",
-			plane->base.id, qos_params.num,
+	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d, clk_ctrl:%d\n",
+			qos_params.num,
 			qos_params.vbif_idx,
 			qos_params.xin_id, qos_params.is_rt,
 			qos_params.clk_ctrl);
-- 
https://chromeos.dev

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
