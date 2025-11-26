Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D74C89F75
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 14:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD0410E2B1;
	Wed, 26 Nov 2025 13:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YloxW97u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B6910E137;
 Wed, 26 Nov 2025 13:20:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C390C43804;
 Wed, 26 Nov 2025 13:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A38C113D0;
 Wed, 26 Nov 2025 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764163201;
 bh=Sxi/6Q4jvM2wf7pGd7IQAsQCeNxuHVhX9VsDta4LQiA=;
 h=From:To:Cc:Subject:Date:From;
 b=YloxW97ukkemiEAEPPhT3JNEHRNsVszBesyclyxTRy/EnrWClbK0bOMKoj3DfHXYz
 qoI4/w2RckPGF92iCtRSt0iYnXyoM8Tc88E/i3SGDnoJAVqj1KaIxoqV/t0KumtfHg
 7eQHOasX20pp/F4RF8CDvu7tYubl2WDsVGsRbqWeXsn9htX/5681mjms4g1PWtPT9m
 Z0H73pNH42qhH97McsOJran19ljL/9/E989x8UdZfitpJSEVz95DcX/Dbty5lKKfmz
 D63AVLSZR/MJ4CnCHUZ4j/BSbAPPTzStWNmNcKA9dSOgRtNbeK2KIECPRkfHhReJzG
 QTlTTkRMr0uGg==
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
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 0/6] dma-fence: Remove return code of dma_fence_signal() et al.
Date: Wed, 26 Nov 2025 14:19:09 +0100
Message-ID: <20251126131914.149445-2-phasta@kernel.org>
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

Barely anyone uses dma_fence_signal()'s (and similar functions') return
code. Checking it is pretty much useless anyways, because what are you
going to do if a fence was already signal it? Unsignal it and signal it
again? ;p

Removing the return code simplifies the API and makes it easier for me
to sit on top with Rust DmaFence.

Philipp Stanner (6):
  dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
  amd/amdkfd: Ignore return code of dma_fence_signal()
  drm/gpu/xe: Ignore dma_fenc_signal() return code
  dma-buf: Don't misuse dma_fence_signal()
  drm/ttm: Remove return check of dma_fence_signal()
  dma-buf/dma-fence: Remove return code of signaling-functions

 drivers/dma-buf/dma-fence.c                   | 59 ++++++-------------
 drivers/dma-buf/st-dma-fence.c                |  7 +--
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  5 +-
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  3 +-
 drivers/gpu/drm/xe/xe_hw_fence.c              |  5 +-
 include/linux/dma-fence.h                     | 33 ++++++++---
 6 files changed, 53 insertions(+), 59 deletions(-)

-- 
2.49.0

