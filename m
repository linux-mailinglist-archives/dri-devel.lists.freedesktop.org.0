Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9836C470E98
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 00:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E0B10E588;
	Fri, 10 Dec 2021 23:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0000D10E574;
 Fri, 10 Dec 2021 23:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639178650; x=1670714650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=natZGEGnozpVjzH9/ll6pqbq/c60OeZZoFD4w7E24dY=;
 b=EcRQdaAGHZrJQyGvUsNQwI/rKGorwCQ2kQf4cVkUsc11Ke5PrYLnj86b
 2mkADxYbjd2kQpiZr7oK5ZxfDe+vSCjhg4FVQG0RW0rk/l8pKTZ3R2s9V
 +jd6XQckHXVsXWPhe6rgoLZGNdrjHwHI+CvmCcP3VsiitiWtEpVEFsYQ8
 HDOK3AVYiJq2Edk1w8EZZOWoe4Oto1/bqwJQmvlXRjsSrWUx+f6QjCnKO
 0CPyyygrILMyrUXZL0Za/xqmpskHCxyXj1ThvxXJQYKOQ5J9WjN8HMs2I
 SYv504l0nIsHqoRyveQwMhQ4DhXsPdi7978XWVY8d3W1z97Ff18RSH4JG Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="218499165"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="218499165"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 15:24:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="680925811"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 15:24:08 -0800
From: ira.weiny@intel.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 0/7] DRM kmap() fixes and kmap_local_page() conversions
Date: Fri, 10 Dec 2021 15:23:57 -0800
Message-Id: <20211210232404.4098157-1-ira.weiny@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

This series starts by converting the last easy kmap() uses to
kmap_local_page().

There is one more call to kmap() wrapped in ttm_bo_kmap_ttm().  Unfortunately,
ttm_bo_kmap_ttm() is called in a number of different ways including some which
are not thread local.  I have a patch to convert that call.  However, it is not
straight forward so it is not included in this series.

The final 2 patches fix bugs found while working on the ttm_bo_kmap_ttm()
conversion.


Ira Weiny (7):
drm/i915: Replace kmap() with kmap_local_page()
drm/amd: Replace kmap() with kmap_local_page()
drm/gma: Remove calls to kmap()
drm/radeon: Replace kmap() with kmap_local_page()
drm/msm: Alter comment to use kmap_local_page()
drm/amdgpu: Ensure kunmap is called on error
drm/radeon: Ensure kunmap is called on error

drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
drivers/gpu/drm/gma500/gma_display.c | 6 ++----
drivers/gpu/drm/gma500/mmu.c | 8 ++++----
drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 4 ++--
drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 4 ++--
drivers/gpu/drm/i915/gt/shmem_utils.c | 4 ++--
drivers/gpu/drm/i915/i915_gem.c | 8 ++++----
drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
drivers/gpu/drm/radeon/radeon_uvd.c | 1 +
13 files changed, 32 insertions(+), 32 deletions(-)

--
2.31.1

