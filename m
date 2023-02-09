Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B70AD690933
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 13:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9396810E9ED;
	Thu,  9 Feb 2023 12:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D1A10E9ED
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 12:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nrzzneY/RR13n1ov7hDmLaAXXqJgk6/dSsbmM+cnECs=; b=Iy3uWcrqd+sSfHaCcS3BoMWshO
 XpHpOTsEetZSfUPPjO8PDtgDL1dl0AMpqPMzp6pigjZjVw4RAOE3fgrdmlqwTIXwQ65BHgA8/wHG5
 NoPC99jRh1iK/xS+sv4eHLozBe/5bVQLQk7NpL3ZPQxN5rZbLFDgGLo35hmvYrIxqOQMk+r3YkDIx
 +o1V7yOBbwF5Mc+xpUlMThkd5nVU3HOBfFXadTD6BzTNVIxoBbQEMc7zOnKnsFMxX8V8Dze1xFDY3
 K9yh6CUczHT5jTFYRHbQ3g5oDf6FSbiQQYLcJ1ZfmvYBlSH/RnitrLbhQqEPaMM2hcKxTecbJmB0i
 G8JkFtYg==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pQ6JI-00DvU2-QF; Thu, 09 Feb 2023 13:45:57 +0100
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
Subject: [PATCH v2 0/5] drm/sched: Create wrapper to add a syncobj dependency
 to job
Date: Thu,  9 Feb 2023 09:44:43 -0300
Message-Id: <20230209124447.467867-1-mcanal@igalia.com>
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

v1 -> v2: https://lore.kernel.org/dri-devel/20230208194817.199932-1-mcanal@igalia.com/T/

- Don't initialize any local return variables if it isn't necessary (Christian König).
- Remove unused "fence" variable from msm.
- Handle the -ENOENT case in v3d (Melissa Wen).
- Add Christian's, Alyssa's, and Luben's Reviewed-by.

Best Regards,
- Maíra Canal

Maíra Canal (5):
  drm/sched: Create wrapper to add a syncobj dependency to job
  drm/lima: Use drm_sched_job_add_syncobj_dependency()
  drm/msm: Use drm_sched_job_add_syncobj_dependency()
  drm/panfrost: Use drm_sched_job_add_syncobj_dependency()
  drm/v3d: Use drm_sched_job_add_syncobj_dependency()

 drivers/gpu/drm/lima/lima_gem.c         | 12 ++--------
 drivers/gpu/drm/msm/msm_gem_submit.c    |  9 ++------
 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 ++--------
 drivers/gpu/drm/scheduler/sched_main.c  | 29 +++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_gem.c           | 22 ++++---------------
 include/drm/gpu_scheduler.h             |  6 +++++
 6 files changed, 45 insertions(+), 44 deletions(-)

-- 
2.39.1

