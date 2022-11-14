Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EF5628957
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 20:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA8510E30A;
	Mon, 14 Nov 2022 19:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A258010E10A;
 Mon, 14 Nov 2022 19:30:28 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id v28so11958127pfi.12;
 Mon, 14 Nov 2022 11:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dQ5k2V/5A62gTc5QTJzii5/7/7JddLuFSJid46RtM2M=;
 b=nxNwaZQF3x3j/8J7fd3JPVe2TA2jnQ1TY9yPid8kBPgGXiH/wqaKXKDplSO8bE6Xx7
 ux0MlDQI+3wHxJQ6DYbk6y9teN33iquwvm2t65lqkjW85pnxD+ILPrp3S53vAVlACSzp
 smGA/JiQrDN4/8ln2Piq8lWn3ktFCz5+PZje315plOQL2DA4rAKSsHzJceJkbeW6/iJC
 hJXq1g3Y58t8ULi9QLcIz2G8hnNzKntU6xXIoGgRnYtBGgc+WuU2JaMFP9RGSEUnotnk
 UNJuRz1K3lZjD00XbeLtBDtX9PKbOR3KyIr529GB2X3QeDemkNS0cSEsmAoCLOHoWK2K
 bj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dQ5k2V/5A62gTc5QTJzii5/7/7JddLuFSJid46RtM2M=;
 b=5aLkmtbj8x6fratcszEQogidPOGYgWZg4JP8Vy6WAEeCZbMSkLk+DjzERP7SCHLUsT
 zszMfqRwd22Jdjq4BZnmlhXWxbUquEwvL4qoq08+MlJa2RJyE+lBNsrBEngYmLgw2QG0
 5vWbfjcb+4pZZbhFfKlNQoZmqCn/rARpaBpTkX0NSBuWdRBLSzei9EHvQmPxAbnQyiuX
 Hi5NcQZDIKubzKOWj6oIboDcBTq0clEpqC7jmgF1KON0yslkut6dS7E8BQ2mOwIX4glE
 Y+GQs/lVEd/guHahFLeT95awJLFlXxwqxgvFe+lk3aSaDax/qbl2t1CBm/jWU1x1fURB
 zBQQ==
X-Gm-Message-State: ANoB5pnOrrv4mCtLWjeVeUJGhNMbycMo02mBb/tUKFKZiV1+J/ph2q+G
 z1KBkFz7B4E9l8O3pY7gWr4OIOuD3Fo=
X-Google-Smtp-Source: AA0mqf6DXVzjWtfbg4JRMidH3O7mZe4qw/QhB6mGJ0GThYrSgcF8XvaC+Dxn9w9hH8+JcPjIqTEshw==
X-Received: by 2002:a63:ed18:0:b0:45c:eb5a:3361 with SMTP id
 d24-20020a63ed18000000b0045ceb5a3361mr12484027pgi.346.1668454227941; 
 Mon, 14 Nov 2022 11:30:27 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 79-20020a621552000000b0056c704abca7sm7082468pfv.220.2022.11.14.11.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 11:30:27 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/2] drm/msm: Improved hang detection
Date: Mon, 14 Nov 2022 11:30:39 -0800
Message-Id: <20221114193049.1533391-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_gpu.h               | 22 +++++---
 drivers/gpu/drm/msm/msm_ringbuffer.h        | 28 ++++++++++
 10 files changed, 136 insertions(+), 49 deletions(-)

-- 
2.38.1

