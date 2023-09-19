Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24197A6F95
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 01:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCFE10E1F6;
	Tue, 19 Sep 2023 23:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFD010E1F6;
 Tue, 19 Sep 2023 23:36:06 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 28F03660309E;
 Wed, 20 Sep 2023 00:36:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695166565;
 bh=VHKX0Y/2dECYqoWpcDB4BKzYq0v/DylhU3XvUvOf5NM=;
 h=From:To:Cc:Subject:Date:From;
 b=HyHzocnBvh+8K+W62S34JUR+mYWcPi+ePeQiEH8eOv/cjpMrd6Sun1uuSB+DxJgUO
 rhOZoQeVn3/8J8bkEQr9XCLgLO+9leGCKVkr69X5ogV+moTrM3oexxb4PahG7Dk4VY
 oumamaMol4AKKDoFP7sl69InKTMrhZcTDmE57584oz+B804Wvs8DP27kR+8yLzQjX+
 QzH4eeKJv9k88JlmbQlP7BiWMpUgfoukjNdjfKsSO3rMCDW0KmmBFQl0eVPrksElGc
 8Md3mLIWc//IZ2tMovsfG/hjtDwn7tlxDYTp1B1mEENILBKJB4DSoKXYnFsU2a2UAY
 QqhVsmy9t86lA==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: [PATCH v6 0/6] Add fdinfo support to Panfrost
Date: Wed, 20 Sep 2023 00:34:48 +0100
Message-ID: <20230919233556.1458793-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
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
Cc: linux-arm-msm@vger.kernel.org, adrian.larumbe@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 healych@amazon.com, kernel@collabora.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds fdinfo support to the Panfrost DRM driver. It will
display a series of key:value pairs under /proc/pid/fdinfo/fd for render
processes that open the Panfrost DRM file.

The pairs contain basic drm gpu engine and memory region information that
can either be cat by a privileged user or accessed with IGT's gputop
utility.

Changelog:

v1: https://lore.kernel.org/lkml/bb52b872-e41b-3894-285e-b52cfc849782@arm.com/T/

v2: https://lore.kernel.org/lkml/20230901084457.5bc1ad69@collabora.com/T/
 - Changed the way gpu cycles and engine time are calculated, using GPU
 registers and taking into account potential resets.
 - Split render engine values into fragment and vertex/tiler ones.
 - Added more fine-grained calculation of RSS size for BO's.
 - Implemente selection of drm-memory region size units
 - Removed locking of shrinker's mutex in GEM obj status function

v3: https://lore.kernel.org/lkml/20230905184533.959171-1-adrian.larumbe@collabora.com/
 - Changed fdinfo engine names to something more descriptive
 - Mentioned GPU cycle counts aren't an exact measure
 - Handled the case when job->priv might be NULL
 - Handled 32 bit overflow of cycle register
 - Kept fdinfo drm memory stats size unit display within 10k times the
   previous multiplier for more accurate BO size numbers
 - Removed special handling of Prime imported BO RSS
 - Use rss_size only for heap objects
 - Use bo->base.madv instead of specific purgeable flag
 - Fixed kernel test robot warnings

v4: https://lore.kernel.org/lkml/20230912084044.955864-1-adrian.larumbe@collabora.com/
 - Move cycle counter get and put to panfrost_job_hw_submit and
   panfrost_job_handle_{err,done} for more accuracy
 - Make sure cycle counter refs are released in reset path
 - Drop the model param for toggling cycle counting and do
   leave it down to the debugfs file
 - Don't disable cycle counter when togglint debugfs file,
   let refcounting logic handle it instead.
 - Remove fdinfo data nested structure definion and 'names' field
 - When incrementing BO RSS size in GPU MMU page fault IRQ handler, assume
  granuality of 2MiB for every successful mapping.
 - drm-file picks an fdinfo memory object size unit that doesn't lose precision.

v5: https://lore.kernel.org/lkml/20230914223928.2374933-1-adrian.larumbe@collabora.com/
 - Removed explicit initialisation of atomic variable for profiling mode,
   as it's allocated with kzalloc.
 - Pass engine utilisation structure to jobs rather than the file context, to avoid
   future misusage of the latter.
 - Remove double reading of cycle counter register and ktime in job deqeueue function,
   as the scheduler will make sure these values are read over in case of requeuing.
 - Moved putting of cycle counting refcnt into panfrost job dequeue
   function to avoid repetition.

v6:
 - Fix wrong swapped-round engine time and cycle values in fdinfo
   drm print statements.

Adrián Larumbe (6):
  drm/panfrost: Add cycle count GPU register definitions
  drm/panfrost: Add fdinfo support GPU load metrics
  drm/panfrost: Add fdinfo support for memory stats
  drm/drm_file: Add DRM obj's RSS reporting function for fdinfo
  drm/panfrost: Implement generic DRM object RSS reporting function
  drm/drm-file: Show finer-grained BO sizes in drm_show_memory_stats

 drivers/gpu/drm/drm_file.c                  | 10 +++-
 drivers/gpu/drm/panfrost/Makefile           |  2 +
 drivers/gpu/drm/panfrost/panfrost_debugfs.c | 20 +++++++
 drivers/gpu/drm/panfrost/panfrost_debugfs.h | 13 +++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c |  8 +++
 drivers/gpu/drm/panfrost/panfrost_devfreq.h |  3 ++
 drivers/gpu/drm/panfrost/panfrost_device.c  |  2 +
 drivers/gpu/drm/panfrost/panfrost_device.h  | 13 +++++
 drivers/gpu/drm/panfrost/panfrost_drv.c     | 59 ++++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c     | 29 ++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h     |  5 ++
 drivers/gpu/drm/panfrost/panfrost_gpu.c     | 41 ++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h     |  4 ++
 drivers/gpu/drm/panfrost/panfrost_job.c     | 24 +++++++++
 drivers/gpu/drm/panfrost/panfrost_job.h     |  5 ++
 drivers/gpu/drm/panfrost/panfrost_mmu.c     |  1 +
 drivers/gpu/drm/panfrost/panfrost_regs.h    |  5 ++
 include/drm/drm_gem.h                       |  9 ++++
 18 files changed, 250 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h


base-commit: f45acf7acf75921c0409d452f0165f51a19a74fd
-- 
2.42.0

