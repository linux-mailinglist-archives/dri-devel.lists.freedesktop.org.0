Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2282974E4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340376F8C1;
	Fri, 23 Oct 2020 16:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1047D6F8C1;
 Fri, 23 Oct 2020 16:50:05 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id w11so1206269pll.8;
 Fri, 23 Oct 2020 09:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nBPnkSzxv9sPok1QPqQrqR3RAN+aeKw0AQbLebVLUkg=;
 b=XWd4i3YxdLK6VWhNOtDxDiaINl8/TMi05tnnJR9puUiJz/lyGwupODZ2BioSlxNWAs
 WvUKyvqWwQHs+h636Ih+DDVJYM8Dmdr4psbtqQMdRBJve8Yf1B2KrTOc5WbQVzVGIV5Q
 YBom1yXreJCyTzkwWwJYLdBwzHSbnxdCC2Vh0ES3F5gyr9fgwQk1Gy+CV/M9WHOgNe//
 SmHRT4Yrd+MReu0/5yrfi/wuUGJUqgqiN11WzCBkP3hxzO2YS+OFexsatzjKCdHGsebc
 QyOTPupwrn6DlUxEf1+QnfH5zypSUxXK6W8vJ9VYTCoO9ncFSfYuOuthfXTeFJOaQvFT
 gdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nBPnkSzxv9sPok1QPqQrqR3RAN+aeKw0AQbLebVLUkg=;
 b=t0SRmMg3/MT9Neg/NPJfIf3jryDwq/CBXBFkFp10ClCCUuR4IfC5Q3ytQhEoqVamVP
 jvzQefRqMVQ0tdAIWH980C5m8ePZPUQpZ1XCT0Ff+tCcG6EDvecdFlMyvABnT2xb8Bb+
 hKpiLCI3kndDmmud9BBR0yodmS2iIJrZOJpVhBWMHpB7qh0r3r68IpdM6ZIa7F2vdDTB
 dYll4XJw5pi9vDSq6hd1T8uqmmPGqeQgIBlbN+34sAfMdIOFSlcB86rNx+rDWqP3zCxn
 uRDStmpN+mJhXnRT3Ud8Bupg3Ae9z/tkqUDeME7T319PcINIg52uETEwZXWz7nAVRwqV
 6MDw==
X-Gm-Message-State: AOAM531oxZ1LoKI23dSAaN4I1Rx45jsFmko4gbmvvb2FsoSYTyRC2+fu
 FTXeUKuIO84bG0gCIdNrQq5KkQzltu2i9kUc
X-Google-Smtp-Source: ABdhPJyHkDmRF2Pq6NHPnw+ueoQTE8icbQuxnnOlfwxFMwu6/Tb1NJ3F9e0raXPtHEKsO3ge9RuTEA==
X-Received: by 2002:a17:902:9a84:b029:d2:9390:5e6 with SMTP id
 w4-20020a1709029a84b02900d2939005e6mr3262382plp.37.1603471803833; 
 Fri, 23 Oct 2020 09:50:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 e4sm2363441pgg.37.2020.10.23.09.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:50:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/23] drm/msm: de-struct_mutex-ification
Date: Fri, 23 Oct 2020 09:51:01 -0700
Message-Id: <20201023165136.561680-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Matthias Kaehlcke <mka@chromium.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Brian Masney <masneyb@onstation.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This doesn't remove *all* the struct_mutex, but it covers the worst
of it, ie. shrinker/madvise/free/retire.  The submit path still uses
struct_mutex, but it still needs *something* serialize a portion of
the submit path, and lock_stat mostly just shows the lock contention
there being with other submits.  And there are a few other bits of
struct_mutex usage in less critical paths (debugfs, etc).  But this
seems like a reasonable step in the right direction.

v2: teach lockdep about shrinker locking patters (danvet) and
    convert to obj->resv locking (danvet)
v3: fix get_vaddr locking for legacy userspace (relocs), devcoredump,
    and rd/hangrd
v4: couple minor review comments (krh), fix deadlock with imported
    dma-buf's (ie. from v4l2, etc)

Rob Clark (23):
  drm/msm: Fix a couple incorrect usages of get_vaddr_active()
  drm/msm/gem: Add obj->lock wrappers
  drm/msm/gem: Rename internal get_iova_locked helper
  drm/msm/gem: Move prototypes to msm_gem.h
  drm/msm/gem: Add some _locked() helpers
  drm/msm/gem: Move locking in shrinker path
  drm/msm/submit: Move copy_from_user ahead of locking bos
  drm/msm: Do rpm get sooner in the submit path
  drm/msm/gem: Switch over to obj->resv for locking
  drm/msm: Use correct drm_gem_object_put() in fail case
  drm/msm: Drop chatty trace
  drm/msm: Move update_fences()
  drm/msm: Add priv->mm_lock to protect active/inactive lists
  drm/msm: Document and rename preempt_lock
  drm/msm: Protect ring->submits with it's own lock
  drm/msm: Refcount submits
  drm/msm: Remove obj->gpu
  drm/msm: Drop struct_mutex from the retire path
  drm/msm: Drop struct_mutex in free_object() path
  drm/msm: Remove msm_gem_free_work
  drm/msm: Drop struct_mutex in madvise path
  drm/msm: Drop struct_mutex in shrinker path
  drm/msm: Don't implicit-sync if only a single ring

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |   6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |   1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c        |   1 +
 drivers/gpu/drm/msm/msm_debugfs.c         |   7 +
 drivers/gpu/drm/msm/msm_drv.c             |  21 +-
 drivers/gpu/drm/msm/msm_drv.h             |  73 +-----
 drivers/gpu/drm/msm/msm_fbdev.c           |   1 +
 drivers/gpu/drm/msm/msm_gem.c             | 271 +++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h             | 133 +++++++++--
 drivers/gpu/drm/msm/msm_gem_shrinker.c    |  81 ++-----
 drivers/gpu/drm/msm/msm_gem_submit.c      | 164 ++++++++-----
 drivers/gpu/drm/msm/msm_gpu.c             | 110 +++++----
 drivers/gpu/drm/msm/msm_gpu.h             |   5 +-
 drivers/gpu/drm/msm/msm_rd.c              |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c      |   3 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h      |  13 +-
 19 files changed, 506 insertions(+), 405 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
