Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7CE4F6D2F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C5510E11C;
	Wed,  6 Apr 2022 21:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE5D10E08A;
 Wed,  6 Apr 2022 21:46:22 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 n6-20020a17090a670600b001caa71a9c4aso4186799pjj.1; 
 Wed, 06 Apr 2022 14:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CkfyiKrfymnOnK0EWh7i1INSgOHYBA/tWH69CgASpO0=;
 b=SWGT0CpR2h+e8t/dq9fbCqwGiZLLkh7/LSkWSszvAoyz0gM2C2Mn4NR0XNtKO3jIHO
 6MI6LH6EKtxhfhBx3V9nRKR2EKKptHiUN5tkesiycFAGO1N5BlAgoNLb/cEOvbhFG4nB
 QqZpr39h5HdBjq6KeKrcyBrFN3T6woSB/O2M3EjW4KIbcwjxnMe+QgQPuU9T53el1cpr
 T8m+53Zdl5eI67t+dtfwmYexj6zIN1okpyIan7MUost9AMd5/te5wkHHkV4xB1EKZnc5
 swZFiki4Ogxqnipn5wfa3VvG1jvboEMltJuAObAiAirDVyBmCe6bpblQfVICSp4Oja1n
 SVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CkfyiKrfymnOnK0EWh7i1INSgOHYBA/tWH69CgASpO0=;
 b=clHn++G2d8jbI4YRmKpAkA4TSOSKhKRoa3YgWMoJ9zwp82fdQC+ikKP7ohzcsQDrnc
 i/MBbIWlNnD8F/ruMkBoOTUPtngwuCj9lrrIoN0DOdVWUlvWYbitCtBepbKDonuXefra
 Dk+0Wrw19Ex+0IZiDxSfX963gmpPFTyYaTN+K1JgAiEZk1RFdb5fD0k/fKZ7NqdnQe2I
 BYe+brFnjKsjNn3yyeWLXXAQkXxZBgwBp5KflRsLWcOfVkPJ7TE7pCTrVBjexMMpzErq
 r+hDZDJFZ5k7LbfhcPw+7EMczgsJ2WP9Ie0Zh19c31PN15+18TZN0DPhjo7pemyu0qZa
 vsrQ==
X-Gm-Message-State: AOAM5319tyI0A1yVSa2WGCf7Vrsf4vQtfgPmV30D9GPMEn3Bdzlxco3J
 DTcYbkemRM2MqyabiL156vOMElrscuY=
X-Google-Smtp-Source: ABdhPJxwUPsOIMPEeUMSDmd1Dismd7EZeSiKJZLKwwpOnWoiIlPLX8vmG2SjQh+6tbo+/dcs4XrTCg==
X-Received: by 2002:a17:903:2452:b0:157:69d:744f with SMTP id
 l18-20020a170903245200b00157069d744fmr54104pls.47.1649281581862; 
 Wed, 06 Apr 2022 14:46:21 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 rm5-20020a17090b3ec500b001c7559762e9sm6536425pjb.20.2022.04.06.14.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:46:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/10] drm/msm: Userspace allocated GPU addresses
Date: Wed,  6 Apr 2022 14:46:16 -0700
Message-Id: <20220406214636.1156978-1-robdclark@gmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dmitry Osipenko <digetx@gmail.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
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
 drivers/gpu/drm/msm/msm_gem.h           |  47 +++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c    |  17 ++-
 drivers/gpu/drm/msm/msm_gem_vma.c       |  59 ++++++---
 drivers/gpu/drm/msm/msm_gpu.c           |   8 +-
 drivers/gpu/drm/msm/msm_gpu.h           |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c    |  12 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h    |   1 -
 include/uapi/drm/msm_drm.h              |   3 +
 18 files changed, 262 insertions(+), 131 deletions(-)

-- 
2.35.1

