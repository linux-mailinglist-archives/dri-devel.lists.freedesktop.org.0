Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856F28AB9A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 04:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE326E128;
	Mon, 12 Oct 2020 02:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4046E128;
 Mon, 12 Oct 2020 02:08:43 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id q21so1597428pgi.13;
 Sun, 11 Oct 2020 19:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dmwggOCqdZ43g+jJ6N3bGQO88ZFGrgGWMzcJMG6MFZc=;
 b=l4SG2ZYTxZKCmiVskGZCGOvLHGQhqQ81uSH7q3UFNYNrqFYs2Ua/E3wsNbMri8B1R7
 Zl8BTMpx6Zsu+Pn1TESqkoH/Vazk9PT+hclBaUQRoqcRltpEFS/siq4l0EhFk3EaN1Ln
 24FcJOuZMBJQyKo1Lu5cGft+ZIjYBa0qaIilIPzY+YKQ0pEGuSW4smOnmTG2pbpC+8JE
 bN2BnQ7dYFcwAOhUhPcFBJgsr5td4mxzFZcbUO/Tku+3NjsJTTJ7/5/DJOVxyJkq5bLW
 G9+so+U1+1/lJ8ZWgXft+NcKCjm8dGmgeo+tKleZ5jxmlXe2a0pVVdKRmtE5NlGPWyW+
 usxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dmwggOCqdZ43g+jJ6N3bGQO88ZFGrgGWMzcJMG6MFZc=;
 b=CCER9ErMue6UI6UQA73nj/Hg4d6rKlfXfBKFJuEug+EMJbohA+TY20D3NtnBc+YvDJ
 EciggfARLJkLtcxk3Xx3MlAlYC9hKb9b8kXn08d4vWXnB0jhHQzRPhefl0CD9KJGvMW4
 evcPTMtDISihf7ggVrG2gXDXWdsY7mROd9tALn00ReoysJzRS/SIUKtur0iVQ0lx3VSr
 tzcivwPkI1nVUkJ5Oj9RO/OUXxW2BfpAf3BhfNCXe/4kGxCF3R/3g/GvTi9N9c5nR/9O
 NJJs2rKzaWgqU9kkEhJJJ3vJUbTnQyXWUKssVtj9g7iLXW8orArSb2Dy+aCkmsuJ7ciU
 L8pg==
X-Gm-Message-State: AOAM532B3nDRNNr4PyDgv7uVOlHBqO+fDtLQ9ZknooJRT7IVW+e2LpuT
 c0vhPecHb8GiYzZVifbldWKua1BAdHDpXFJj
X-Google-Smtp-Source: ABdhPJzc6Fu9J+JxBCHpefhcMz1MLh+TQl5nN/I2XuTSAE9C39n+EnAcOs0namKHz9x7wpMt1N6nmw==
X-Received: by 2002:a17:90b:1111:: with SMTP id
 gi17mr17663259pjb.109.1602468522254; 
 Sun, 11 Oct 2020 19:08:42 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 p16sm19702873pfq.63.2020.10.11.19.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 19:08:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/14] drm/msm: de-struct_mutex-ification
Date: Sun, 11 Oct 2020 19:09:27 -0700
Message-Id: <20201012020958.229288-1-robdclark@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Matthias Kaehlcke <mka@chromium.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Brian Masney <masneyb@onstation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
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

Rob Clark (22):
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
  drm/msm: remove msm_gem_free_work
  drm/msm: drop struct_mutex in madvise path
  drm/msm: Drop struct_mutex in shrinker path
  drm/msm: Don't implicit-sync if only a single ring

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |   4 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |   4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |   1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c        |   1 +
 drivers/gpu/drm/msm/msm_debugfs.c         |   7 +
 drivers/gpu/drm/msm/msm_drv.c             |  21 +-
 drivers/gpu/drm/msm/msm_drv.h             |  73 ++-----
 drivers/gpu/drm/msm/msm_fbdev.c           |   1 +
 drivers/gpu/drm/msm/msm_gem.c             | 245 ++++++++++------------
 drivers/gpu/drm/msm/msm_gem.h             | 131 ++++++++++--
 drivers/gpu/drm/msm/msm_gem_shrinker.c    |  81 +++----
 drivers/gpu/drm/msm/msm_gem_submit.c      | 154 +++++++++-----
 drivers/gpu/drm/msm/msm_gpu.c             |  98 +++++----
 drivers/gpu/drm/msm/msm_gpu.h             |   5 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c      |   3 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h      |  13 +-
 18 files changed, 459 insertions(+), 396 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
