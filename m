Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB21836522
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 15:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4DC10EF4A;
	Mon, 22 Jan 2024 14:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755B810EF4A;
 Mon, 22 Jan 2024 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705932631; x=1737468631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9572LtctmUngpunyibL6cmyV6ylAsRwnjQR8tLFR9ZE=;
 b=FEmTYlDvDofwW7vaapqQ1gUEXnsOlyXvN0HcQ1s3D7QjezUCQ3Wz4voi
 BmtGzZUcDoR5esh/bLH7Be7bmwW4IJbmI7Alg9ydaAw+ZRnRSjyjaymjs
 p1T7Zm77Q+BDd71RsHp+yJgFcQnISZGKvjB4zSt1sQtmDksExymC7xAyd
 4JtJjXOA0qS9WlPigWFTckqtj9Stg9ypMW5+vX5W6xwUgkyll/rN8f+DV
 ID5CmNso/kYDqmQbw4LAzrkda7xe85Y1hXUhq+CqR01w+swqGL1LL5VQO
 wvAVk600JNwO8NvijQSdjIfF15wZR6TSdfzaXlSfd+j96XQ5ANw8QaiAo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8313800"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8313800"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 06:10:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="855943752"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="855943752"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.20.214])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 06:10:23 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm/i915: Fix VMA UAF on destroy against deactivate
 race
Date: Mon, 22 Jan 2024 15:04:41 +0100
Message-ID: <20240122141007.401490-5-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Object debugging tools were sporadically reporting illegal attempts to
free a still active i915 VMA object when parking a GPU tile believed to be
idle.

[161.359441] ODEBUG: free active (active state 0) object: ffff88811643b958 object type: i915_active hint: __i915_vma_active+0x0/0x50 [i915]
[161.360082] WARNING: CPU: 5 PID: 276 at lib/debugobjects.c:514 debug_print_object+0x80/0xb0
...
[161.360304] CPU: 5 PID: 276 Comm: kworker/5:2 Not tainted 6.5.0-rc1-CI_DRM_13375-g003f860e5577+ #1
[161.360314] Hardware name: Intel Corporation Rocket Lake Client Platform/RocketLake S UDIMM 6L RVP, BIOS RKLSFWI1.R00.3173.A03.2204210138 04/21/2022
[161.360322] Workqueue: i915-unordered __intel_wakeref_put_work [i915]
[161.360592] RIP: 0010:debug_print_object+0x80/0xb0
...
[161.361347] debug_object_free+0xeb/0x110
[161.361362] i915_active_fini+0x14/0x130 [i915]
[161.361866] release_references+0xfe/0x1f0 [i915]
[161.362543] i915_vma_parked+0x1db/0x380 [i915]
[161.363129] __gt_park+0x121/0x230 [i915]
[161.363515] ____intel_wakeref_put_last+0x1f/0x70 [i915]

That has been tracked down to be happening when another thread is
deactivating the VMA inside __active_retire() helper, after the VMA's
active counter has been already decremented to 0, but before deactivation
of the VMA's object is reported to the object debugging tool.

There was an attempt to fix this issue on 2-tile Meteor Lake by acquiring
an extra wakeref for a Primary GT from i915_gem_do_execbuffer() -- see
commit f56fe3e91787 ("drm/i915: Fix a VMA UAF for multi-gt platform").
However, it occurred insufficient -- the issue was still reported by CI.
That wakeref was released on exit from i915_gem_do_execbuffer(), then
potentially before completion of the request and deactivation of its
associated VMAs.

I believe the issue was introduced by commit d93939730347 ("drm/i915:
Remove the vma refcount") which moved a call to i915_active_fini() from
a dropped i915_vma_release(), called on last put of the removed VMA kref,
to i915_vma_parked() processing path called on last put of a GT wakeref.
However, its visibility to the object debugging tool was suppressed by a
bug in i915_active that was fixed two weeks later with commit e92eb246feb9
("drm/i915/active: Fix missing debug object activation").

Fix the issue by getting a wakeref for the VMA's tile when activating it,
and putting that wakeref only after the VMA is deactivated.  However,
exclude global GTT from that processing path, otherwise the GPU never goes
idle.  Since __i915_vma_retire() may be called from atomic contexts, use
async variant of wakeref put.

Having that fixed, stop explicitly acquiring the extra GT0 wakeref from
inside i915_gem_do_execbuffer(), and also drop an extra call to
i915_active_wait(), introduced by commit 7a2280e8dcd2 ("drm/i915: Wait for
active retire before i915_active_fini()") as another insufficient fix for
this UAF race.

v4: Refresh on top of commit 5e4e06e4087e ("drm/i915: Track gt pm
    wakerefs") (Andi),
  - for more easy backporting, split out removal of former insufficient
    workarounds and move them to separate patches (Nirmoy).

Janusz Krzysztofik (3):
  drm/i915/vma: Fix UAF on destroy against retire race
  Manually revert "drm/i915: Fix a VMA UAF for multi-gt platform"
  Revert "drm/i915: Wait for active retire before i915_active_fini()"

 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 17 -----------
 drivers/gpu/drm/i915/i915_vma.c               | 28 +++++++++++++------
 drivers/gpu/drm/i915/i915_vma_types.h         |  1 +
 3 files changed, 20 insertions(+), 26 deletions(-)

-- 
2.43.0

