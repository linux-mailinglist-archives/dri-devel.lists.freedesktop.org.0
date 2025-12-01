Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A09C96B8F
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 11:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFD210E35D;
	Mon,  1 Dec 2025 10:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cy5mBp2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04B210E33E;
 Mon,  1 Dec 2025 10:50:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D7F1660121;
 Mon,  1 Dec 2025 10:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A21EC4CEF1;
 Mon,  1 Dec 2025 10:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764586227;
 bh=ZkDMIwjBHrScHp6fwm7KhtK8mL0tvYVTa3t+hxATh8Y=;
 h=From:To:Cc:Subject:Date:From;
 b=cy5mBp2wEMxMyGKlH3xQaBV7g+VnccD/RV/zCwoZ8jbQIVQeaCPQPsr/FzO2BmiSr
 IbEYOgUIdi3ZbKHmdMooFnqdNgGll4P46tsjchsq51fPlpDidjoGC0NVk3l+nsxcjj
 YTk+NWgNOskYRo6WSuBhDg6MvAMASPvXLzWzVJ+gzvuLbEAzs2z4e3G5SW7ziPC96p
 +wJ1mdAZl4gaEDgo1BRMrQtjB2FwRY4KmMQqFsuiMYMCNbHnexgsl3DepcbVNkS2Nk
 NnxJgWcsl8XmBsRoqmOF29V9B8r0e1aMDsc05jlRVLlns8z5mtYZpUAd9lCqhUujIx
 e3ylYefGn9DIA==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 0/6] dma-fence: Remove return code of dma_fence_signal() et al.
Date: Mon,  1 Dec 2025 11:50:04 +0100
Message-ID: <20251201105011.19386-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested this with dma_buf selftests and drm_sched tests.

Changes in v2:
  - Fix bug and don't turn the kernel into a smoking pile of ashes by
    not setting the signaled-bit…
  - Add functions (dma_fence_check_and_signal()) preserving the old
    behavior of dma_fence_signal() & Co. (Felix)
  - Use those new functions in amdkfd, xe, ttm and st-dma-fence.
  - Be a bit less aggressive and keep the git-diff smaller.
  - Add a patch using the flag-helper in Xe. (Matthew)

Barely anyone uses dma_fence_signal()'s (and similar functions') return
code. Checking it is pretty much useless anyways, because what are you
going to do if a fence was already signal it? Unsignal it and signal it
again? ;p

Removing the return code simplifies the API and makes it easier for me
to sit on top with Rust DmaFence.

Philipp Stanner (8):
  dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
  dma-buf/dma-fence: Add dma_fence_check_and_signal()
  amd/amdkfd: Use dma_fence_check_and_signal()
  drm/xe: Use dma_fence_check_and_signal_locked()
  dma-buf: Don't misuse dma_fence_signal()
  drm/ttm: Use dma_fence_check_and_signal()
  dma-buf/dma-fence: Remove return code of signaling-functions
  drm/xe: Use dma_fence_test_signaled_flag()

 drivers/dma-buf/dma-fence.c                   | 100 +++++++++++-------
 drivers/dma-buf/st-dma-fence.c                |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   6 +-
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |   2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |   9 +-
 drivers/gpu/drm/xe/xe_hw_fence.c              |   4 +-
 drivers/gpu/drm/xe/xe_pt.c                    |   3 +-
 drivers/gpu/drm/xe/xe_sched_job.c             |   2 +-
 include/linux/dma-fence.h                     |  35 ++++--
 9 files changed, 102 insertions(+), 63 deletions(-)

-- 
2.49.0

