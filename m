Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CB5304BAE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 22:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC626E4AE;
	Tue, 26 Jan 2021 21:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA036E441;
 Tue, 26 Jan 2021 21:44:38 +0000 (UTC)
IronPort-SDR: 276D3R91aoDuLzhUyiJfRUdmY6V5DERd5YgwREUr52dyvOTF3Of4jZ4FUHXHl6LsynZH78bc7S
 j48Chhexu1tw==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="198770825"
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="198770825"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 13:44:36 -0800
IronPort-SDR: pxx/maiC2y8TN8v4a9MNIpLQaukuEIO7m6+F+beuK12x15k/ghwB9/i8eJB1vT2jFY5rzFHq4M
 l0e928oDl2bA==
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="362139880"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 26 Jan 2021 13:44:36 -0800
From: Brian Welty <brian.welty@intel.com>
To: Brian Welty <brian.welty@intel.com>, cgroups@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kenny Ho <Kenny.Ho@amd.com>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
Subject: [RFC PATCH 0/9] cgroup support for GPU devices 
Date: Tue, 26 Jan 2021 13:46:17 -0800
Message-Id: <20210126214626.16260-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.20.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'd like to revisit the proposal of a GPU cgroup controller for managing
GPU devices but with just a basic set of controls.  This series is based on 
the prior patch series from Kenny Ho [1].  We take Kenny's base patches
which implement the basic framework for the controller, but we propose an
alternate set of control files.  Here we've taken a subset of the controls
proposed in earlier discussion on ML here [2]. 

This series proposes a set of device memory controls (gpu.memory.current,
gpu.memory.max, and gpu.memory.total) and accounting of GPU time usage
(gpu.sched.runtime).  GPU time sharing controls are left as future work.
These are implemented within the GPU controller along with integration/usage
of the device memory controls by the i915 device driver.

As an accelerator or GPU device is similar in many respects to a CPU with
(or without) attached system memory, the basic principle here is try to
copy the semantics of existing controls from other controllers when possible
and where these controls serve the same underlying purpose.
For example, the memory.max and memory.current controls are based on
same controls from MEMCG controller.

Following with the implementation used by the existing RDMA controller,
here we introduce a general purpose drm_cgroup_try_charge and uncharge
pair of exported functions. These functions are to be used for
charging and uncharging all current and future DRM resource controls.

Patches 1 - 4 are part original work and part refactoring of the prior
work from Kenny Ho from his series for GPU / DRM controller v2 [1].

Patches 5 - 7 introduce new controls to the GPU / DRM controller for device
memory accounting and GPU time tracking.

Patch 8 introduces DRM support for associating GEM objects with a cgroup.

Patch 9 implements i915 changes to use cgroups for device memory charging
and enforcing device memory allocation limit.

[1] https://lists.freedesktop.org/archives/dri-devel/2020-February/257052.html
[2] https://lists.freedesktop.org/archives/dri-devel/2019-November/242599.html

Brian Welty (6):
  drmcg: Add skeleton seq_show and write for drmcg files
  drmcg: Add support for device memory accounting via page counter
  drmcg: Add memory.total file
  drmcg: Add initial support for tracking gpu time usage
  drm/gem: Associate GEM objects with drm cgroup
  drm/i915: Use memory cgroup for enforcing device memory limit

Kenny Ho (3):
  cgroup: Introduce cgroup for drm subsystem
  drm, cgroup: Bind drm and cgroup subsystem
  drm, cgroup: Initialize drmcg properties

 Documentation/admin-guide/cgroup-v2.rst    |  58 ++-
 Documentation/cgroup-v1/drm.rst            |   1 +
 drivers/gpu/drm/drm_drv.c                  |  11 +
 drivers/gpu/drm/drm_gem.c                  |  89 ++++
 drivers/gpu/drm/i915/gem/i915_gem_mman.c   |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c |  23 +-
 drivers/gpu/drm/i915/intel_memory_region.c |  13 +-
 drivers/gpu/drm/i915/intel_memory_region.h |   2 +-
 include/drm/drm_cgroup.h                   |  85 ++++
 include/drm/drm_device.h                   |   7 +
 include/drm/drm_gem.h                      |  17 +
 include/linux/cgroup_drm.h                 | 113 +++++
 include/linux/cgroup_subsys.h              |   4 +
 init/Kconfig                               |   5 +
 kernel/cgroup/Makefile                     |   1 +
 kernel/cgroup/drm.c                        | 533 +++++++++++++++++++++
 16 files changed, 954 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/cgroup-v1/drm.rst
 create mode 100644 include/drm/drm_cgroup.h
 create mode 100644 include/linux/cgroup_drm.h
 create mode 100644 kernel/cgroup/drm.c

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
