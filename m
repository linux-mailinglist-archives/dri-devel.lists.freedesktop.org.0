Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673C0708B6C
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 00:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6254310E569;
	Thu, 18 May 2023 22:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF8D10E137
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 22:22:41 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2af1a7d2f6aso11486341fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 15:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684448560; x=1687040560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rTrPPkXtAjgeany9T7/bBVZNtr7AELIKsku0nhssAqM=;
 b=hrnegy+xhZZXCvWS8IxDzACL9QQIycl7nNn/3w+q/2Bs4wHgZcEckWBTTWYofZPsKj
 +/vWZD+tU5R84dlYFv1tXfDXYy43qX7M/LAbHKHKJaxDAUCVRZWgb6Y5hcK3VM08xKYt
 /DFO+r0RY0SJwOKdVcsa/jG01YmbkIBgk0pO6MKtGaeqDZr9OVrjz1JTb8Ve+RzmZ8SR
 0mz2G1UprI0hV3WL+77QGSTUs/h8ui+JfsPmd/zQuMMU05YIlZPD3c4GraQDdj5Ak93C
 jlChvfyFcKX1dju+q6zvHMlJ0QQpj4Skjhg06RY9GaQlRspyafM/ap7rDwxpi2Kflr+y
 dpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684448560; x=1687040560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rTrPPkXtAjgeany9T7/bBVZNtr7AELIKsku0nhssAqM=;
 b=Q6bJr03w4BZXcuBX4IJ1hQzdeCAexNcCNx6quPgfY8HXGb9kZrTzjfZberjoPziuWC
 i/onauS2IosOUMGScA9MqImeWDIMzYBuwO6l2GKNN8O6z9CGOnVIl+XuzKTRtXnjB/6Z
 O4eQmdRuH7cVrj/W1RddKtEE1X4VvkdHpzkweM5Muh9DWghj0Ej/XLMfVEFzhneQCBrT
 3WAeMzto0n+bE2XheAR7RKw4uoeZImKCxuMDN9GhNBSJwZTJhqsPEaJ7IitCTGkp2rIj
 SR7x52CZ/l5Mxj5P42Cu43tThA4vG93xGbwkZK+/AjuMi1tHPb8A7Fizkb94jKMHSOEd
 3fLg==
X-Gm-Message-State: AC+VfDw8Ug3357qevx1KU9pMrLQHDt87ru4dJdm1fUi4YbmkENeA7lk7
 dW3OPVfxgJrZxBn5WenoalMTSw==
X-Google-Smtp-Source: ACHHUZ59ui0p0WnjjTbb0bokt2f0LkJJN32O4pZspP0FIGlF/mZGevrtK8RK9o8Q0eMsnVvGrjaprQ==
X-Received: by 2002:a2e:9816:0:b0:2ac:80cd:6c0d with SMTP id
 a22-20020a2e9816000000b002ac80cd6c0dmr11251093ljj.19.1684448559926; 
 Thu, 18 May 2023 15:22:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o18-20020ac24352000000b004ec7c0f2178sm383860lfl.63.2023.05.18.15.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 15:22:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 0/9] drm/msm/dpu: simplify QoS/CDP programming
Date: Fri, 19 May 2023 01:22:29 +0300
Message-Id: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
 Stephen Boyd <swboyd@chromium.org>,
 Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Merge SSPP and WB code programming QoS and CDP. This allows us to drop
intermediate structures and duplicate code.

Changes since v2:
- Moved SSPP_VIG_CSC_10_OP_MODE close to other CSC10 defines (Jeykumar)

Changes since v1:
- Fixed kerneldoc for _dpu_plane_set_qos_ctrl()
- Fixed danger_safe_en programming conditions (Jeykumar)
- Simplified the code surrounding setup_cdp() calls (Jeykumar)

Dmitry Baryshkov (9):
  drm/msm/dpu: fix SSPP register definitions
  drm/msm/dpu: simplify CDP programming
  drm/msm/dpu: fix the condition for (not) applying QoS to CURSOR SSPP
  drm/msm/dpu: rearrange QoS setting code
  drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
  drm/msm/dpu: simplify qos_ctrl handling
  drm/msm/dpu: drop DPU_PLANE_QOS_PANIC_CTRL
  drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
  drm/msm/dpu: use common helper for WB and SSPP QoS setup

 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  21 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   4 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 140 +++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  52 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  32 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  48 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 165 +++++-------------
 9 files changed, 192 insertions(+), 349 deletions(-)

-- 
2.39.2

