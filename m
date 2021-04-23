Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F63369AB5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 21:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF456EC35;
	Fri, 23 Apr 2021 19:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEFD6EC35
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 19:12:02 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id 1so37200819qtb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 12:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kEaQvWN4Z8yVJOtNMFNTVQ5YEguXpuTG96s4DFICCJ0=;
 b=kuLS0suPNfLfL/e8JYU0ZgCsM09iPvMie9U8PBPzCHE65hayjIIyW/c4VG+rtLVCSu
 05TvT3RLM45wuNRjopgjY3Ors5GfQ3GgS4MzsYw0AROaDcmp3HGCEXLesOWJqNnwyUv/
 KNMT2zM+KPa66AQGjuCtTmcxbdAnZZFMYgSIClJJe4aldjscpatDVowDz9PfHRWwzSvK
 5ehh2Cv0Q2JZVupwoAxE/5tR84zK+L89u6vsLAHhgN95YQBxjXrULY0sjy5EImrS4d25
 9KA8QFscriXuiQggAaZlQ3YITF3zntxWUoR5StcQnymT/ycSe8fELhGgl1gqMv0AD8dM
 tXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kEaQvWN4Z8yVJOtNMFNTVQ5YEguXpuTG96s4DFICCJ0=;
 b=VKwj2BCLgfKsvtlxLhaqHq1Sy96763C+YwxDzPhmMiUs2nNL9vtMQXCBfEC0YC7rBX
 YwmC9F84fJFGXF5DWqrCCS1AyqwB1ilIhNKLXmk0E5k8jCEf0RiqNDhXdJeUch4q4IUG
 LBHT/TNjbGY+H8J9U/Smu7M6h1DpvUitfaOThzmMjOe1ZiICV/cT/YqXSouDb21MSMNX
 sAU3zgYZQAjMzElLkJcPAcje8nc7vulFaNIPqO0Llofmhuddw+JR6lzoBNYf15R5vQxy
 oU4GRFyQOA9zl2WhM7+iL2rI1lXXZ/NgUW6PWODolrdbs1+uj3Tbactp55ePj1snHFBy
 zJsg==
X-Gm-Message-State: AOAM531B4Qb9a38DGZ3EC/WS00OOrfOBoV3YpEjTEQN5DiI00KQfCTmm
 9R3rTxuiJ8wnA3gYvP2d9CZXTA==
X-Google-Smtp-Source: ABdhPJyNFE1wEhOEH03d5WveOtjIevlxoZNdPt2fGHLKPGOwI4mNzLVERkLgfGOFwAeF0imWrkJqYA==
X-Received: by 2002:ac8:7191:: with SMTP id w17mr5368523qto.199.1619205121519; 
 Fri, 23 Apr 2021 12:12:01 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id a22sm4834630qtp.80.2021.04.23.12.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 12:12:01 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/5] drm/msm: add MSM_BO_CACHED_COHERENT (and related changes)
Date: Fri, 23 Apr 2021 15:08:16 -0400
Message-Id: <20210423190833.25319-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Emil Velikov <emil.velikov@collabora.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Bernard Zhao <bernard@vivo.com>, Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Douglas Anderson <dianders@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for MSM_BO_CACHED_COHERENT, a coherent version of MSM_BO_CACHED
which is implemented by setting the IOMMU_CACHE flag.

Jonathan Marek (5):
  drm/msm: remove unnecessary mmap logic for cached BOs
  drm/msm: replace MSM_BO_UNCACHED with MSM_BO_WC for internal objects
  drm/msm: use the right pgprot when mapping BOs in the kernel
  drm/msm: add MSM_BO_CACHED_COHERENT
  drm/msm: deprecate MSM_BO_UNCACHED (map as writecombine instead)

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  4 +--
 drivers/gpu/drm/msm/adreno/a5xx_power.c     |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  4 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c  |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c          |  2 +-
 drivers/gpu/drm/msm/msm_drv.c               |  3 +-
 drivers/gpu/drm/msm/msm_drv.h               |  1 +
 drivers/gpu/drm/msm/msm_gem.c               | 34 ++++++++++-----------
 include/uapi/drm/msm_drm.h                  |  7 ++---
 12 files changed, 33 insertions(+), 31 deletions(-)

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
