Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61BF4FC6FB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 23:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D2210E07E;
	Mon, 11 Apr 2022 21:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187EA10E0B5;
 Mon, 11 Apr 2022 21:58:11 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id k14so15384088pga.0;
 Mon, 11 Apr 2022 14:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hjX9OiCRZovNS7uWD7qtI1tuIPYpsaOZmyjT0QclAFo=;
 b=F0BkDSIuJxh7VvjREkPIPyYuDDgZFYrtitXYRDq9e3ICyFdaihszLA2XvhrMFFCLrK
 sDAfc8QQRxTGKsTaLm6UqLwG9ltH/W3wrni2xKPAaR57aOEeJpkiZj/xd5V6qowkLMz7
 9fzTAYw3bQPaOQrxIAyBMztGa67zHyd5QZ+kdX8lRhaa0t2vz7PwGsak+iu6rLvpO38B
 PN7w/N25HOnBRMuwC7ciNos+MPLB1Bxd8VMksodnlxDXIWrRluZoTvoGQHO9qAtBXoZi
 Kwwmxpxc2WhERFSdxTqrEp8uNHJ9IAnX6iEm+lWgiFG1o8/jndwNuktgmzyhv7F9guD5
 Fxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hjX9OiCRZovNS7uWD7qtI1tuIPYpsaOZmyjT0QclAFo=;
 b=FlCrdWVQ4mL2Nle1Dc72W5b2iB/rX8eEWHGBr/r00BkPvQPxMdUKxe7a5uHZq0nQ7n
 DxqOE51DrhfseSYoWJy+F1+gXi/HnxKfKe/vSiY58Xsc7DwIRdsdrzocYXX6lfz8SbuB
 UPy2Yeacx22DiBjb8vNEUeZv0IA0/Ng4JbavpZsZhnGyLPUHz2vzn/FDztbj9b+Wgm40
 SIY0ANyDU3MCTxtELngLce7wEnGjCGbig3WfI0g4/7b1v3GiUFUW0MjnyprEE6E4fzBS
 lLN6Cts2AQXEoD6EL+9VqV7HwzWVqf9tQbTtHGn+lyWMOUixVIyWlSA8bhUbcp6wKOOh
 qRkQ==
X-Gm-Message-State: AOAM5311LqQxgWVgl2irhfAJ20gXbmU5yt8DQnY4f1DNe1wYoHjS1mBN
 O8DwY9Egn/nqml68L6VW/ImKqzuiNEk=
X-Google-Smtp-Source: ABdhPJzJd1UCJJvv1QvVM06xqzDOGkc+c37rzWJj+lcOhADFhNzsU6dBpsMSxyK69YiEI2NWIzzPLQ==
X-Received: by 2002:a05:6a00:138f:b0:505:d077:33db with SMTP id
 t15-20020a056a00138f00b00505d07733dbmr1426061pfg.36.1649714289859; 
 Mon, 11 Apr 2022 14:58:09 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 j63-20020a636e42000000b003987df110edsm641375pgc.42.2022.04.11.14.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:58:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/10] drm/msm: Userspace allocated GPU addresses
Date: Mon, 11 Apr 2022 14:58:29 -0700
Message-Id: <20220411215849.297838-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wang Qing <wangqing@vivo.com>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dmitry Osipenko <digetx@gmail.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The first six paches are various cleanups and simplifications.  The
next two get rid of redundant vma lookups in the submit and retire
paths.  Following that, fenced vma lets us indicate a fence value
following which the vma is no longer used, which is needed because
otherwise userspace could observe the signaled fence prior to
retire_submits() finishing.  (With userspace allocated GPU addresses
userspace is tracking when a buffer is no longer used and it's vma can
be deleted.)  And finally the last patch adds the new uabi for user-
space allocated iova.

v2: Fix inuse check in last patch, split GEM_WARN_ON() conversion to
    separate patch, and nits
v3: Fix nested fb prepares in 06/10, return -EBUSY if trying to set
    iova on buffer that already has one in 10/10
v4: Fix race condition in 09/10

Rob Clark (10):
  drm/msm/gem: Move prototypes
  drm/msm/gpu: Drop duplicate fence counter
  drm/msm/gem: Convert some missed GEM_WARN_ON()s
  drm/msm/gem: Split out inuse helper
  drm/msm/gem: Drop PAGE_SHIFT for address space mm
  drm/msm: Drop msm_gem_iova()
  drm/msm/gem: Rework vma lookup and pin
  drm/msm/gem: Split vma lookup and pin
  drm/msm/gem: Add fenced vma unpin
  drm/msm: Add a way for userspace to allocate GPU iova

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  14 ++-
 drivers/gpu/drm/msm/msm_drv.c           |  21 ++++
 drivers/gpu/drm/msm/msm_drv.h           |  23 ----
 drivers/gpu/drm/msm/msm_fb.c            |  20 +++-
 drivers/gpu/drm/msm/msm_fence.c         |   6 +-
 drivers/gpu/drm/msm/msm_fence.h         |   3 +
 drivers/gpu/drm/msm/msm_gem.c           | 151 ++++++++++++++----------
 drivers/gpu/drm/msm/msm_gem.h           |  52 +++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c    |  32 ++---
 drivers/gpu/drm/msm/msm_gem_vma.c       |  61 +++++++---
 drivers/gpu/drm/msm/msm_gpu.c           |   8 +-
 drivers/gpu/drm/msm/msm_gpu.h           |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c    |  13 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h    |   1 -
 include/uapi/drm/msm_drm.h              |   3 +
 18 files changed, 277 insertions(+), 139 deletions(-)

-- 
2.35.1

