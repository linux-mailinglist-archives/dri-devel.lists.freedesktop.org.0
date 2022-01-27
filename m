Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665A949E879
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 18:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF5910E19A;
	Thu, 27 Jan 2022 17:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED53910E19A;
 Thu, 27 Jan 2022 17:10:41 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id t32so2771506pgm.7;
 Thu, 27 Jan 2022 09:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6CDYV/P4O/r3dgztPFLJV9lZu9zFEjn3L3fRfL7MbBg=;
 b=Hk2vLuMBhTwAlb4KfBdcApLjWnZDozauE3TjJ4sb/iJXaqrO1FrsL4c3Ws4Qg/zHQa
 mhdSVaD+Ic9IGShFa+PSVgTzSHCFmYgn+1hEO/JunIX/mqEWJ9Ao2zlTJIiia4kgw8AP
 +2Os0rxdyQcQay1394o5TuMIfMnf+CFkhpyudSbLhk6Wn72mz+cGXyE9fkzSqUMi9j3Z
 p9GTZQFq3QSoI0tJEUjB7AMybt2cxsEbFExufpG2VwoLRJoSuJR4bOzZ7eBquYvhfqTn
 LSF2GpnxOyxXe2vqrrwi4uBA6bHJwmFWhFYQs9ak2ljg/SblZiV2ssf7F62H9TiYTwLt
 zD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6CDYV/P4O/r3dgztPFLJV9lZu9zFEjn3L3fRfL7MbBg=;
 b=nMNfRS0hKPavartfSgv8SsTjp1ogyMPsAl6SMyI9tZXTv4AtK89yBITIL8LYpgOULc
 GbOA09TSSKchoB3FkMhsH0P+eaLyAnuRfUFjVhnMna/VQV6YnsI9z4akYgpoJeH3jXvw
 YdzcrlQ3/hi0Iy8bJcvK+xRPCiVSriQS57YHYuH16vc+RIdYjsUxxNOU2T+06WhfmYn0
 B0eoTi2CcgS9cr8s/X9uCkezK2EZP/m7iRmA823p001F6MY2Y7QFUs4ksIfqCyomSJ3a
 pggyiPc/aGyNXs1KHrKDljcSC3AhhCk2nUmT0ymq7D9CHKK1aKx/CWntYIikbFCWa7Yp
 wicQ==
X-Gm-Message-State: AOAM533ZYJeWYvIp6hbE7H8iKjmygzhCKm7I11DKQD6CfNiIrbic+tXp
 14nAVF6pG8tMlmHNQb7BXKBkf85e/SM=
X-Google-Smtp-Source: ABdhPJzn1vEhu3bWNINfrUH4IlHRDhOyZTM5Rr6/CueuFg55HYzFq/5BYJocgMN50qBBIF+3eEgakw==
X-Received: by 2002:a05:6a00:15d0:: with SMTP id
 o16mr3722269pfu.19.1643303440786; 
 Thu, 27 Jan 2022 09:10:40 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 84sm5779217pgd.66.2022.01.27.09.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 09:10:39 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: Add tracking for faults associated with an
 address space
Date: Thu, 27 Jan 2022 09:10:37 -0800
Message-Id: <20220127171045.541341-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Currently, for GL_EXT_robustness userspace uses the global and per-
submitqueue fault counters to determine GUILTY_CONTEXT_RESET_EXT vs
INNOCENT_CONTEXT_RESET_EXT.  But that is a bit overly paranoid, in
that a fault in a different process's context (when it has it's own
isolated address space) should not hurt anything.

This is particularly annoying with CrOS and chrome's exit_on_context_lost quirk,
while running deqp in the android container, as the deqp-egl suite has
tests that intentionally trigger gpu hangs (for the purpose of testing
the robustness extension), which triggers chrome to restart, which
restarts the android container!

This new param gives userspace a way to ignore faults triggered by other
processes.

Applies on top of https://patchwork.freedesktop.org/series/98907/

Rob Clark (2):
  drm/msm/gpu: Add ctx to get_param()
  drm/msm/gpu: Add param to get address space faults

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 +++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 3 ++-
 drivers/gpu/drm/msm/msm_drv.c           | 4 +++-
 drivers/gpu/drm/msm/msm_gem.h           | 3 +++
 drivers/gpu/drm/msm/msm_gpu.c           | 1 +
 drivers/gpu/drm/msm/msm_gpu.h           | 3 ++-
 drivers/gpu/drm/msm/msm_rd.c            | 6 ++++--
 include/uapi/drm/msm_drm.h              | 3 ++-
 8 files changed, 22 insertions(+), 7 deletions(-)

-- 
2.34.1

