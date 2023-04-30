Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D026F2AD1
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 22:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3E810E0EA;
	Sun, 30 Apr 2023 20:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F368E10E0AA
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 20:57:16 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4ec8148f73eso2260710e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 13:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682888235; x=1685480235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xxMIlhE+xo1ndRNL8TNhFy+W+mxe0zzz0yJ/CAW62w4=;
 b=VO/JrwDg94kbsUdw9EK5ccKxqJlrawqyw5q0ef5tpIPXaSNp03qXp3v7A1pxt9guPO
 vdg2hjQg5eTgKlvO6H8fviQRKIEdH47T6HUuje3MTVwcGMG141LyHmz1sJvWs31FNGQu
 vd4x4QeJKkiyYBAakjcorNnvPVhWfmeWxxW8UTH7V3CTtTeeiD+/VXdwQ2wOBa6Ay6Py
 ZYWmam5Zjrr0nIaaTkd4EyeRG6ltmA++AEMEXIIoDY7T1ZcPZgGVSW9rrlMP6e+ds8S9
 2YJZ77tnboxxTXCl/cIzlFSj8R+mExhpVwv8KdZBa7xOfzHU6vkRryyXxRzBSaiqSVUX
 dxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682888235; x=1685480235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xxMIlhE+xo1ndRNL8TNhFy+W+mxe0zzz0yJ/CAW62w4=;
 b=D+IGeMxgWXAUIkdTe3zjd8Bh1C4XH3l10/YuEjN2IJMnCmfnYumGCS6DkWB+VrG/J1
 cu+mMe2kspsRwOpI6Qnf4+tgCtQp+0qOO/LHsoZpS3gOkTRf/YRaJFYYOmp3mP59mptY
 /14Rg9WIcdFvRHSVKbAHsBgoRR+2Mn2IQhqLwpfxARmcHBsZA9iuPwjbPufgnuZGcwQt
 XRIILuISpldpeI8EiAiM0f3+qGxjPvTPwas0O99rJHrct0oPvSNCN//kHSHCAiAsgm6+
 9QlFpV3+QC8ycw0MT4LvIau/7066ZbU4CGcP7FZACugkANqbh+cJy3y/oBkJl+qyZJsS
 NVFw==
X-Gm-Message-State: AC+VfDxe3jXbRSeLj0+KQKejYIHphQBaOygX0KkydsOXWTwaFxCYYzOG
 LK2qkD9ubxcynSZqmx9RDKM99Q==
X-Google-Smtp-Source: ACHHUZ75oe2mpelzwjC1zNnI6eL3nDKdEoAQfJ145W+UsY93FRLEu3NU1KQH8EG2DWSdeE9Szy27OA==
X-Received: by 2002:ac2:414c:0:b0:4eb:2e5c:e0a with SMTP id
 c12-20020ac2414c000000b004eb2e5c0e0amr3503756lfi.41.1682888234872; 
 Sun, 30 Apr 2023 13:57:14 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:57:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 4/9] drm/msm/dpu: rearrange QoS setting code
Date: Sun, 30 Apr 2023 23:57:05 +0300
Message-Id: <20230430205710.3188230-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
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

Slightly rearrainge code in dpu_plane_sspp_update_pipe() to group
QoS/LUT related functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 36f6eb71fef8..4a5a58152fa8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1079,10 +1079,10 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 		pipe->sspp->ops.setup_sourceaddress(pipe, layout);
 	}
 
-	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
+		_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+
 		/* skip remaining processing on color fill */
 		return;
 	}
@@ -1123,12 +1123,14 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
+	_dpu_plane_set_qos_ctrl(plane, pipe,
+				pipe->sspp->idx != SSPP_CURSOR0 &&
+				pipe->sspp->idx != SSPP_CURSOR1,
+				DPU_PLANE_QOS_PANIC_CTRL);
 
 	if (pipe->sspp->idx == SSPP_CURSOR0 ||
-	    pipe->sspp->idx == SSPP_CURSOR1) {
-		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
+	    pipe->sspp->idx == SSPP_CURSOR1)
 		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
-	}
 
 	if (pstate->needs_qos_remap)
 		_dpu_plane_set_qos_remap(plane, pipe);
-- 
2.39.2

