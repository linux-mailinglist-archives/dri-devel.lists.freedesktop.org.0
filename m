Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF13D6A3B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 01:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162F16EA50;
	Mon, 26 Jul 2021 23:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091956EA50
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 23:34:46 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id e5so11641731pld.6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 16:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJHcf2A+v4Xg1Z8UjOIkujJQfUCL6EomQD60/Cu1nbQ=;
 b=gyFbRvsBvc3GB64q5FVHckiBc7Bagj0Tn576aP7P1xv3GzUUQkBWJlEisCbs9U1dPd
 Tk9UniFqVFVZWkkYVe1Q1ZOH/y1b0ES64cKz3YE9cpvrUvfXin7PGX5SgM/fSQmgbPjk
 IHkil3GlN09mZixx++iR0YhCsRfzIPUMLFQCMFak/xuSx+i9Wlv4yBlf/FsDIzTJQRFr
 IWRf/VAat9oNJUSf+dFtyQmcsNSIvOeN51hisgAPe/GHMdkIr6qjXRXcB4eg+5segHnv
 PsndZ2Np2QQf2USln8vIOGRHB9j7rj5TsrwX+/cjAu2Pbo8lWTKf/n3p4hHL0MYG7FFd
 vzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJHcf2A+v4Xg1Z8UjOIkujJQfUCL6EomQD60/Cu1nbQ=;
 b=jG0A8gaJNuvA3vyMXota2Mw1PPNbSr/4/DbBVvrRpX5cVmYlzAKkzV76NSxzQegnaS
 iTmtz0+FodVTzYatoWM4CaJXLnYF8UsyxRc6jcRDdyROKraKy16zKrHviMb+sj5Q6D3E
 jfVW5mFzhGjKK7W+RDb1MEmpJmSzUe75ET8GVj99MNadrqgpCfzIBy8Xol0clK49PYmc
 5ZJOmQKnqyT1hQ9hWSZiYIv2g0YftXw+Dgbdl+z/mXb3FfqE32v4YPfgGTix0zoys6i9
 0YXjCMQuntG3x+KVxO3SeQU1nf2UrEcXoVD4toa34QoAunGWufoqkvz3FDTCKqbyrRBW
 8NtA==
X-Gm-Message-State: AOAM530zdRKXYL14i62sJj0gvE0/SiXQOww4KstDjHaAR2G21najHuAd
 /6RhkjcnLIpuBzN5enQALJXzabxR3t5qbQ==
X-Google-Smtp-Source: ABdhPJwO0Aa1CWuY70s13U0aOFFS10F4rpeB45ZWiWi99YiT1whKcfqq/2IVyEdw1gBu5ZuBadW9yQ==
X-Received: by 2002:a63:b953:: with SMTP id v19mr20385890pgo.40.1627342484886; 
 Mon, 26 Jul 2021 16:34:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id k11sm1000201pgg.25.2021.07.26.16.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 16:34:43 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 0/4] dma-fence: Deadline awareness
Date: Mon, 26 Jul 2021 16:38:47 -0700
Message-Id: <20210726233854.2453899-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Matthew Brost <matthew.brost@intel.com>, Rob Clark <robdclark@chromium.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Based on discussion from a previous series[1] to add a "boost" mechanism
when, for example, vblank deadlines are missed.  Instead of a boost
callback, this approach adds a way to set a deadline on the fence, by
which the waiter would like to see the fence signalled.

I've not yet had a chance to re-work the drm/msm part of this, but
wanted to send this out as an RFC in case I don't have a chance to
finish the drm/msm part this week.

Original description:

In some cases, like double-buffered rendering, missing vblanks can
trick the GPU into running at a lower frequence, when really we
want to be running at a higher frequency to not miss the vblanks
in the first place.

This is partially inspired by a trick i915 does, but implemented
via dma-fence for a couple of reasons:

1) To continue to be able to use the atomic helpers
2) To support cases where display and gpu are different drivers

[1] https://patchwork.freedesktop.org/series/90331/

Rob Clark (4):
  dma-fence: Add deadline awareness
  drm/vblank: Add helper to get next vblank time
  drm/atomic-helper: Set fence deadline for vblank
  drm/scheduler: Add fence deadline support

 drivers/dma-buf/dma-fence.c             | 39 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_atomic_helper.c     | 36 +++++++++++++++++++++++
 drivers/gpu/drm/drm_vblank.c            | 31 ++++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_fence.c | 10 +++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  3 ++
 include/drm/drm_vblank.h                |  1 +
 include/linux/dma-fence.h               | 17 +++++++++++
 7 files changed, 137 insertions(+)

-- 
2.31.1

