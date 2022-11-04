Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57C4619B01
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 16:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0EA10E859;
	Fri,  4 Nov 2022 15:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56ED10E859;
 Fri,  4 Nov 2022 15:08:23 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id j12so5147268plj.5;
 Fri, 04 Nov 2022 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JMPOdF+o0zNjI5oSIE1GsSu6N/ryN9SMeyxLPWXhVBs=;
 b=RyhdIpGXQUD3R+si/9tPRnDaLMca3cbp3VLQ/v85H/ZaZ3gaR756lwv5SkgBd5x4G7
 ekwGjJryWjPw2SdQ8n/mJPge5zWihLtr2DcyFD0mttD2WyDGJfEHKqLjIxPF5sZdkYvL
 OvH9tU41qQ+8ZoC9t6FOPy4BJBJ55d3MQzq41uH4TPDvoidaLWevBZVEbiGGDCXHQxtb
 VwebHuDywesjdUf+2x7nU6Zilu676jnTUQoS+Dh8PzC+BorW4EkltFg4jsGa72pqaXRP
 VxjjFJwoSWC3956lN26S63DUxw3eJ504d7wd7tG6ASkiJGrAYlBDgBlq7QyDMVneeC3l
 xUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JMPOdF+o0zNjI5oSIE1GsSu6N/ryN9SMeyxLPWXhVBs=;
 b=Hp9MujzttEHp/vbKg+I1mcMmDcGmcoT6cPrPg4ORFZ1u4u6a58TgN24finT+CktVnL
 9ANwTtul3+THx46yVTD2+kQj8DzJWiD4hibtjuwnZ7AzqRl2kWsNHBZUaI3KbYqzKTu8
 MeZ2cxwIQUyqVi5EbuLC0FoUOhvnEiGde9NPDqlP5q9iplIQbxpvJxHQPzdx7ejiJBqU
 bv7ZGGjlJsRfC/xuUfWn3L4CJibga7g17QOGhI6uDBxx6Aj3SJdYKmrjge2u+hM4YLDA
 10F+Yth/NUphjKciZ2pjKCGFw6AYo0jw3ptwjlQhXMocz4fTViYxAbFYgwcd3iF/18vy
 ytpA==
X-Gm-Message-State: ACrzQf2bdxez31adZiWXzYgUCZEJjDkBXqPBsfOWGdIvn7LgphPUC85l
 9dVkoa+BcdOjfooAaYnwGwRyiC5UBg8=
X-Google-Smtp-Source: AMsMyM5KzINUyMORzunyuK5891yHttCtmYcq8nB9pAJbJjysO0tEd1LCg8MnTXG3THRjnogaziLMVg==
X-Received: by 2002:a17:90a:c705:b0:213:1455:1326 with SMTP id
 o5-20020a17090ac70500b0021314551326mr37110567pjt.244.1667574503114; 
 Fri, 04 Nov 2022 08:08:23 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a170902ce8200b00176acd80f69sm2805024plg.102.2022.11.04.08.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 08:08:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/msm: Improved hang detection
Date: Fri,  4 Nov 2022 08:08:37 -0700
Message-Id: <20221104150847.525173-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Try to detect when submit jobs are making forward progress and give them
a bit more time.

Rob Clark (2):
  drm/msm/adreno: Simplify read64/write64 helpers
  drm/msm: Hangcheck progress detection

 drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |  3 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       | 27 ++++------
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 58 +++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  3 +-
 drivers/gpu/drm/msm/msm_drv.c               |  1 -
 drivers/gpu/drm/msm/msm_drv.h               |  8 ++-
 drivers/gpu/drm/msm/msm_gpu.c               | 31 ++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h               | 15 +++---
 drivers/gpu/drm/msm/msm_ringbuffer.h        | 24 +++++++++
 10 files changed, 125 insertions(+), 49 deletions(-)

-- 
2.38.1

