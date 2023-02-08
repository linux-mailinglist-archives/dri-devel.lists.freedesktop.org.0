Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D3968F848
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 20:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE7710E847;
	Wed,  8 Feb 2023 19:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0947510E846
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 19:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wmVKZPljVszsv4cXg/4CjBGJ2FceeEzt0p51TnSZWhU=; b=cbvxL8dKiLNZ9naSY4ehyY/uM7
 l9mf6+zcfOgyriRiH0c9wlkbcHXy2KXg94TIv7NAVSCCwUpwG0hWc5uTJDYIVsCCihKtD6VCWFg1v
 OF3sp0E6NqRUP1rlS63WqvRF8bRBnT6lpyhyxwbhacXR0Rpzp64BMaYAUpEDhvB4EBqt8Od5SRSn5
 F3uymSsfN+nsUVO5dewzY6LVrlXxTH5IiyaE6CPACWLdI6HAWljPlUMp/u5K6VcAwwscCNLsovRzh
 SQ98F2v6MSjOSYsvNIb3SMgQqtfh+GINXqHmTM/brWuWnTWKlyrfFLCldPpclNlWLyF4dlTn9YC7n
 hrzgCkMQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pPqQp-00DCm6-Lh; Wed, 08 Feb 2023 20:48:40 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Melissa Wen <mwen@igalia.com>
Subject: [PATCH 0/5] drm/sched: Create wrapper to add a syncobj dependency to
 job
Date: Wed,  8 Feb 2023 16:48:12 -0300
Message-Id: <20230208194817.199932-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some drivers perform the same operation to add a syncobj's fence to the sched
as a dependency: first, call drm_syncobj_find_fence() to find the fence and
then, call drm_sched_job_add_dependency(). Therefore, create a wrapper to
encapsulate those steps in one single function.

The first patch creates the wrapper for the operation and the following
patches make the drivers use the new function drm_sched_job_add_syncobj_dependency().

Best Regards,
- Maíra Canal

Maíra Canal (5):
  drm/sched: Create wrapper to add a syncobj dependency to job
  drm/lima: Use drm_sched_job_add_syncobj_dependency()
  drm/msm: Use drm_sched_job_add_syncobj_dependency()
  drm/panfrost: Use drm_sched_job_add_syncobj_dependency()
  drm/v3d: Use drm_sched_job_add_syncobj_dependency()

 drivers/gpu/drm/lima/lima_gem.c         | 12 ++--------
 drivers/gpu/drm/msm/msm_gem_submit.c    |  8 ++-----
 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 ++--------
 drivers/gpu/drm/scheduler/sched_main.c  | 29 +++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_gem.c           |  9 +-------
 include/drm/gpu_scheduler.h             |  6 +++++
 6 files changed, 42 insertions(+), 33 deletions(-)

-- 
2.39.1

