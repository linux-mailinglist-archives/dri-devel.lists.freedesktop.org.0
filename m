Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C53F792D8C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 20:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E979710E329;
	Tue,  5 Sep 2023 18:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE07310E1A7;
 Tue,  5 Sep 2023 18:45:45 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2BA2D6607038;
 Tue,  5 Sep 2023 19:45:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693939544;
 bh=FGsQV/S5pRAHMoWWN5RS4+CcJHs6Hwgm/Twc6RPbmng=;
 h=From:To:Cc:Subject:Date:From;
 b=UFrmGNyFBBonyiAHIYpGo6uyKaupLNGWAvDzXYSfEu4vDwAss9agU0DoWJ5omsqsx
 RcnLFLCvGEc4HNvmnEON2/W2QxWqYaGK+1j3Xc4cMdKTqPFE6nSnSZ3nz4Iq1EqweN
 xo4Od2iEGEwoj3MKaW2ArwOAxwWnNETuROVcQeyUWd6DbO7yeMB4bip1zRdB0lYpav
 OyBRUuIGfkIIhdAg94YZbGf4j6qiNO//CSxiFS1gRZy3fEkJRX2NXaJJQ6loMva5f/
 FZ77Y40K/LC9+DrOr0dvZxfRqBejNDhh6Cir4/1lD6WdsGDv+pIxMFAZR6zkulLfrf
 DiK1Lzt/Syd/Q==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: [PATCH v3 0/8] Add fdinfo support to Panfrost
Date: Tue,  5 Sep 2023 19:45:16 +0100
Message-ID: <20230905184533.959171-1-adrian.larumbe@collabora.com>
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

v3:
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

Adrián Larumbe (8):
  drm/panfrost: Add cycle count GPU register definitions
  drm/panfrost: Enable cycle counter register upon job submission
  drm/panfrost: Enable debugfs toggling of cycle counter register
  drm/panfrost: Add fdinfo support GPU load metrics
  drm/panfrost: Add fdinfo support for memory stats
  drm/drm_file: Add DRM obj's RSS reporting function for fdinfo
  drm/panfrost: Implement generic DRM object RSS reporting function
  drm/drm-file: Show finer-grained BO sizes in drm_show_memory_stats

 drivers/gpu/drm/drm_file.c                  |  7 ++-
 drivers/gpu/drm/panfrost/Makefile           |  2 +
 drivers/gpu/drm/panfrost/panfrost_debugfs.c | 51 ++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_debugfs.h | 13 +++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c |  8 +++
 drivers/gpu/drm/panfrost/panfrost_devfreq.h |  3 +
 drivers/gpu/drm/panfrost/panfrost_device.c  |  5 ++
 drivers/gpu/drm/panfrost/panfrost_device.h  | 19 ++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c     | 65 ++++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c     | 28 +++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h     |  5 ++
 drivers/gpu/drm/panfrost/panfrost_gpu.c     | 43 ++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h     |  6 ++
 drivers/gpu/drm/panfrost/panfrost_job.c     | 37 ++++++++++++
 drivers/gpu/drm/panfrost/panfrost_job.h     |  5 ++
 drivers/gpu/drm/panfrost/panfrost_mmu.c     | 12 ++--
 drivers/gpu/drm/panfrost/panfrost_regs.h    |  5 ++
 include/drm/drm_gem.h                       |  9 +++
 18 files changed, 316 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h


base-commit: f45acf7acf75921c0409d452f0165f51a19a74fd
-- 
2.42.0

