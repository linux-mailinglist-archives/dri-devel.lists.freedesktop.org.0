Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170614EB646
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 01:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5068310E057;
	Tue, 29 Mar 2022 23:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161CA10E057;
 Tue, 29 Mar 2022 23:00:17 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id x2so18943693plm.7;
 Tue, 29 Mar 2022 16:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o8GRMi4BaOngdJPfp9V0+F4LD+JDrrKljXWdP6AfpMg=;
 b=M65jFxPlVkdE37G6xltsUGPVyQxAPAQc77jbKKmsJWdTPzFSMHnocL4rTktfNhOlEf
 JL566q6XWf6wARvbFknVfUEdIvYokyLyzycTNKQ1ChztkZqerMu476RVSjsRfA9TiHkl
 4bWhBuAQpSy+t9K/YlffBtPxPvKb4q8CndxznH45dgJX9xhjbNilZh5ujFrQ3PX6I//V
 zWni7Y1AYcbtj7AaIORQMKlvD8xw2TmPotEDVgIa9g18VFTcvr3ty7WJVkWPSdfJPTMq
 MQJcKmRZo5DnlNLPf/J+e8S6DgvRnrj1ROcHa9CHBykVRtYn9vPZokJeShJOl73xZPdl
 ePTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o8GRMi4BaOngdJPfp9V0+F4LD+JDrrKljXWdP6AfpMg=;
 b=FBq7TnP1qWmy060UTAYCiRQacrO7+0gl5qGbJoMMY3Cu0np2J4csZbUgKYjQ/sjrfi
 lpJxQmJJWBxG9DwXJYaL2xeV6kDTZA6CmkO8PzMBQr82ubyaCzQAM8hOFFv1GENj8V+1
 iwogu+nienm25H6nUzT0La60svr2/mbyBDCQFxGdv2bFO8YhLjoAEVodJ2oSd82OVcTg
 WoUw6FQjUQtoCMJvSGTJKGQeVC+pbK6U0MXUCSCt/53Cm14EPD3seNttZluwQgDnxk0P
 QCjL5KjkxdXm5aLHanw//BEefqXjkQJo4KOvEIpHT2WRibhd7ZIoTJlKbxh58O9BDRHb
 eb5g==
X-Gm-Message-State: AOAM532Q7l13A5jfU0BzACMkX9TYQ0FsMskp/jT+ECyNMeUKyXwHMAVK
 uvcXy+BzWzfggcbGrMwfOfs09ZNn1xI=
X-Google-Smtp-Source: ABdhPJzAvBrlwtlVkQ9fKjD9KB7sU16jv8DVYU8hDEq60nLNnO5WnwWatNyurWLGlMtThb3Ay5vbbQ==
X-Received: by 2002:a17:902:e748:b0:153:b484:bdf4 with SMTP id
 p8-20020a170902e74800b00153b484bdf4mr31957764plf.66.1648594815849; 
 Tue, 29 Mar 2022 16:00:15 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a056a00168a00b004f7e2a550ccsm21301092pfc.78.2022.03.29.16.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:00:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] drm/msm: Userspace allocated GPU addresses
Date: Tue, 29 Mar 2022 16:00:48 -0700
Message-Id: <20220329230105.601666-1-robdclark@gmail.com>
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
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Wang Qing <wangqing@vivo.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The first five paches are various cleanups and simplifications.  The
next two get rid of redundant vma lookups in the submit and retire
paths.  Following that, fenced vma lets us indicate a fence value
following which the vma is no longer used, which is needed because
otherwise userspace could observe the signaled fence prior to
retire_submits() finishing.  (With userspace allocated GPU addresses
userspace is tracking when a buffer is no longer used and it's vma can
be deleted.)  And finally the last patch adds the new uabi for user-
space allocated iova.

Rob Clark (9):
  drm/msm/gem: Move prototypes
  drm/msm/gpu: Drop duplicate fence counter
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

