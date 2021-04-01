Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F42E350BCE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 03:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0193E6EBF6;
	Thu,  1 Apr 2021 01:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5656EBF6;
 Thu,  1 Apr 2021 01:23:54 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id x26so312996pfn.0;
 Wed, 31 Mar 2021 18:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+2jBkeo878G+FkmC1vjkk79rQNW00YDmS4BnvfJ2kYU=;
 b=nn1RaRztiuPrmeG4Y6A4+Z9aCNsh96twt7rXm6MoLkf4wFBDpEoglnIrhQ1RL3dISV
 DUtMy2J/5YiIZShK+V7U5YpTFXKMwBE1rwIITEM+0FDdpyi2d2UZacn1kDQDbW6BhtCY
 S+FZz0v5qW3QOcW2RCEuuGTbqHTfnErxOIdPaAtWw+So2UF/oHHIwFd8cewV6TxpbtZ3
 ZzZ0JxQ/8v2DUKx1Wa2oytsG42W/V2rZvQr/bzlHUcqrSstmX20gdZDBSN09kxvmHauw
 uBm1StndG68O9XG6dj6Wv4O9SLiTfO1FM6QRsRCsFsSTt06PNKMeDjEgKtq2GScf76xg
 mafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+2jBkeo878G+FkmC1vjkk79rQNW00YDmS4BnvfJ2kYU=;
 b=ru/vu3/1KCJ1goIOKpxitxLjlb7VOqW3rOHKtCVjrA6Y6hTVUfKy7GvpwFEdzzdGds
 m5AO1jXlMFGayRhWjp6jirg3EdiN8AFw32QFW/4cT3zdoMjiHYbcu3Bsq3sYZ0/LollK
 s3FbvsR0s70MTHjnEU3d3fpMfcIQAdZpBjTSjo+LaPcXJUtFE4zgmIwxGyWutDxf2XFX
 vs4Am8X8j6Py8wy69bBFebSZ/Z8NvL2IIcVGeuv23J9XJtl7MR8YobRgo2jC3rcHMIBr
 ZEzZtgLZdiIXjcR5d59kz1KUERadmpaJuUbS37rDVNTKOktlBzNFUjiJ7XXeU/UrPK0F
 YiUQ==
X-Gm-Message-State: AOAM530dvS86uftxPHhVoGY+91LWGEL8aueix4XRXvqu4qiGPy7z9hAI
 TsbCZ/1LSnf9G1JoqZejimTYl3zzo++tIA==
X-Google-Smtp-Source: ABdhPJxpmKhVqceIQWiXrGGdLvcaLXzXdCmFiC3E3r6puxs07HbTGNDN+PC6hnUY+qLrnezZ75rs9g==
X-Received: by 2002:a63:6d8a:: with SMTP id i132mr5567869pgc.82.1617240233466; 
 Wed, 31 Mar 2021 18:23:53 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id ha8sm3270796pjb.6.2021.03.31.18.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 18:23:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/msm: Shrinker (and related) fixes
Date: Wed, 31 Mar 2021 18:27:17 -0700
Message-Id: <20210401012722.527712-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331221630.488498-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

I've been spending some time looking into how things behave under high
memory pressure.  The first patch is a random cleanup I noticed along
the way.  The second improves the situation significantly when we are
getting shrinker called from many threads in parallel.  And the last
two are $debugfs/gem fixes I needed so I could monitor the state of GEM
objects (ie. how many are active/purgable/purged) while triggering high
memory pressure.

We could probably go a bit further with dropping the mm_lock in the
shrinker->scan() loop, but this is already a pretty big improvement.
The next step is probably actually to add support to unpin/evict
inactive objects.  (We are part way there since we have already de-
coupled the iova lifetime from the pages lifetime, but there are a
few sharp corners to work through.)

Rob Clark (4):
  drm/msm: Remove unused freed llist node
  drm/msm: Avoid mutex in shrinker_count()
  drm/msm: Fix debugfs deadlock
  drm/msm: Improved debugfs gem stats

 drivers/gpu/drm/msm/msm_debugfs.c      | 14 ++---
 drivers/gpu/drm/msm/msm_drv.c          |  4 ++
 drivers/gpu/drm/msm/msm_drv.h          | 15 ++++--
 drivers/gpu/drm/msm/msm_fb.c           |  3 +-
 drivers/gpu/drm/msm/msm_gem.c          | 65 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gem.h          | 72 +++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 28 ++++------
 7 files changed, 150 insertions(+), 51 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
