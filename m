Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287CC4ECE2F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 22:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E8F10E76F;
	Wed, 30 Mar 2022 20:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF47A10E904;
 Wed, 30 Mar 2022 20:47:50 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id z128so18417499pgz.2;
 Wed, 30 Mar 2022 13:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yfjnQPsWSYFHa6/IEHWm+/2wuddS77YFSoX6K2k8WAs=;
 b=qC4uOR8IOWShCZwjgvJri6DARkuzz2I9SZJDZ4AvTXi1tq3hxOQJsE5l+kifQk5SWn
 u40vr1x2VFiEtk3vBCqTVqmO0p/2YSgtbYUP2g3+DyGI7yF6Pcv9GYZ8TPiMjcwBL90B
 gPHyEtrZstP5e410DG2KyJ4MSyFaYsXCQy676NuLB9m2dsG5YKSI0+UkCp2tPFMgv0n7
 u65aV4R7tkt+uRyuMygRTiS54EViRC/Fn2lir4czlzavyzwfI4JPjdtUI7Q+j8BDpEl1
 Xb2spl5hCkconGmuduSGN3E2H08Az6ON3hZPlRGUwWJaMcao369mKCR4msi7uWgQ03KN
 OovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yfjnQPsWSYFHa6/IEHWm+/2wuddS77YFSoX6K2k8WAs=;
 b=ZYblziYzW+qx7DUUMsuwpc5fDGzSc7F0WnLiYfSx6A+YTSS8TnxGTplrcRUm4Dw2ov
 7Qqdc/KjsxTecTUnWkv/fzfzSmVkzwPFPcsVZekm/TdYJr0HTyg8rpc2wYwl2ediVv7x
 7iVgeEAaIVAng68aoP65TN9+8Luk6yvEVg+B9PfBzr+IxOYWcdSgvhb/1YcxukGNKMq3
 Q21kdEufu987bkNfdyTpkcx0g2VUOTVYUOItFipD0niYDdw3dnFAVSQi6IWJpzIq99sP
 h50UwfSU4zdKiiXoBScTAsgp+lPR8bFFZqc4VQbSK4Vl04UxYZ3OIkX2OcvwuOWar4DH
 ZwEA==
X-Gm-Message-State: AOAM533JAwsTCM/WVAe1620c/dbzXbSmkKPLi8bgjDNSGBOO+R2QLYyW
 C0hqRV5QFtxKvPcVh86GiLycvgmoTu8=
X-Google-Smtp-Source: ABdhPJxdLzVjn+t+OSFNxjZRQ67GvD+fwncEqPMil8nBUspK/F9AqvVDwI9XWwz2gknTpciSuqo5oQ==
X-Received: by 2002:a63:ea0e:0:b0:37d:f227:ec57 with SMTP id
 c14-20020a63ea0e000000b0037df227ec57mr7536833pgi.441.1648673269692; 
 Wed, 30 Mar 2022 13:47:49 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 a7-20020aa79707000000b004fb17ad3aefsm19836938pfg.108.2022.03.30.13.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 13:47:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/10] drm/msm: Userspace allocated GPU addresses
Date: Wed, 30 Mar 2022 13:47:45 -0700
Message-Id: <20220330204804.660819-1-robdclark@gmail.com>
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org,
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
 drivers/gpu/drm/msm/msm_fb.c            |  16 ++-
 drivers/gpu/drm/msm/msm_fence.c         |   6 +-
 drivers/gpu/drm/msm/msm_fence.h         |   3 +
 drivers/gpu/drm/msm/msm_gem.c           | 151 ++++++++++++++----------
 drivers/gpu/drm/msm/msm_gem.h           |  47 +++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c    |  17 ++-
 drivers/gpu/drm/msm/msm_gem_vma.c       |  59 ++++++---
 drivers/gpu/drm/msm/msm_gpu.c           |   8 +-
 drivers/gpu/drm/msm/msm_gpu.h           |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c    |  12 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h    |   1 -
 include/uapi/drm/msm_drm.h              |   3 +
 18 files changed, 258 insertions(+), 131 deletions(-)

-- 
2.35.1

