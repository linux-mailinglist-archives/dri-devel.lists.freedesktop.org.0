Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF4C6140ED
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 23:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB7010E212;
	Mon, 31 Oct 2022 22:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B275510E201;
 Mon, 31 Oct 2022 22:54:01 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id y4so12037820plb.2;
 Mon, 31 Oct 2022 15:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=maJKyobLPXCPnwTwIQXAL/b/lOc2Vm9xJT2P1QP/26E=;
 b=fKZqAinGAoCrUEi6BcEABxVqovgpGs/So8dMU+TGLeFSpnDEPO6yunXqKkJMHWHjJU
 OCJShEXZKbkWESkzoZdlPYimrfT+1pwXUPweFSCeO/BUH5st3dCOUcMGwuXzm+VxEljI
 LjwTyR/wpNZT/T0p/ppS9VajRAOWl4vmxpi+pVLYTkN/gRxYv06a93X4Y5e8nQ3fZsul
 roO0MEtO79mZ7MHmKbpC6E/MfbOdVe+8DzO7hOC+URdT5GZOGcysNOF7OCrX1fD0Q+ev
 AJiuU6VE17UODAEV7hC1wQ4tYtCflBQZfZ97513l7w2qi358TMlHOFvxK8Rv2zC/4sjo
 Gm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=maJKyobLPXCPnwTwIQXAL/b/lOc2Vm9xJT2P1QP/26E=;
 b=i5P6qPcljWOhjy7hGBSnpmZ8DS0W98W+kprvLkKkdcdsmf633Jws/zUUYVzPBniG8o
 ja2Db6cWnmBwnRzw5MHXgv2LAP2LWTkrS+DxKwLy1OOT0EFQcoXSQ+LocuCrFl7vOlEx
 waDt5zZQU9eW8DPorV5hFEBepZUFmm1L5mnvUnjutDrv7rbp0Z3ssNgpGXa39/MnXTW1
 CFEpi9penSjbYxkz8mjzymJ917PmDdRpZvovp0CB4pUW0BfGegWNRyD/4SLR+yW8gMfV
 fksS5nWkD68k6BahoiHeN89eP+hfq4S2tyd1zHW6CFCAmOW1AIYs7KksTQZ7t9dFlTh9
 BGQA==
X-Gm-Message-State: ACrzQf1Jol6PGO7Ev/fONhVahMd7FAIJ7INsllegqgRVjfdWLstdX90/
 Vwg+mCpC7U9VCXRjpKS4xUHjHHketo8=
X-Google-Smtp-Source: AMsMyM5c3503xFzP/Q4764SIgGLaQXB+xemTW4iyoJCATUoLaIjv2fO8ZlLZOrCryAVzvX9Y1ix+ow==
X-Received: by 2002:a17:90b:1d0f:b0:20d:1ec3:f732 with SMTP id
 on15-20020a17090b1d0f00b0020d1ec3f732mr16997862pjb.84.1667256840879; 
 Mon, 31 Oct 2022 15:54:00 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b001769e6d4fafsm4915431plb.57.2022.10.31.15.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:54:00 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: Improved hang detection
Date: Mon, 31 Oct 2022 15:54:05 -0700
Message-Id: <20221031225414.1280169-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.37.3
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
 drivers/gpu/drm/msm/msm_drv.h               |  8 ++-
 drivers/gpu/drm/msm/msm_gpu.c               | 20 ++++++-
 drivers/gpu/drm/msm/msm_gpu.h               | 17 +++---
 drivers/gpu/drm/msm/msm_ringbuffer.h        | 24 +++++++++
 9 files changed, 115 insertions(+), 49 deletions(-)

-- 
2.37.3

