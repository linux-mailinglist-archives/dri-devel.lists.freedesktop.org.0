Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77E08C8D66
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 22:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1096310EF79;
	Fri, 17 May 2024 20:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbwLsBDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FD310E028;
 Fri, 17 May 2024 20:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715978590; x=1747514590;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hAPiXQn+hSroy0iFGWgjUKfIDHtBYzwsv/uDpC1kSk4=;
 b=CbwLsBDyKkiR377DRdB5Vbxewf0xDBZKIS185pZUvEPRdI+cmiWYwZgN
 WsSgnDYbo6ZhA+Pl5BrAx/vFvalElPy2cbOEmLeb1fNAnU4zT+HjBQakT
 l1BdAImcV95HVvUBiCEKUBU7+2E8pJ6W0BJ/H49jgo/GiBknmUW2Plr5O
 +0kwmTVr+bBPZ8AQozGSzw45y/AmxnCBujeBA8VCA/mMI6VSJg7Mrg3+S
 FAgXtMjVLm1ISoFUHHfEzs0B9lo1gz8kPp4AkoJtvy4Q5wPHXdoz8ZZLs
 8l6EFRwwTfHFPszZTduQWtwRtsSB+skKz3bCWZKZK3wggzKOvXksLJxgK A==;
X-CSE-ConnectionGUID: 1ph1bl2CSOOz+q7wjTfbLg==
X-CSE-MsgGUID: mR6WYfaJRe+UucAaE6bDcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12027909"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12027909"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:43:09 -0700
X-CSE-ConnectionGUID: OlkRe8f7TDOHaGqf6fQoiw==
X-CSE-MsgGUID: YCAaraHLR6eqyQNz4NE/Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="55125232"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:43:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 0/8] drm/xe: Per client usage
Date: Fri, 17 May 2024 13:43:02 -0700
Message-ID: <20240517204310.88854-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v5 of of https://lore.kernel.org/all/20240515214258.59209-1-lucas.demarchi@intel.com

Add per-client usage statistics to xe. This ports xe to use the common
method in drm to export the usage to userspace per client (where 1
client == 1 drm fd open).

However instead of using the current format measured in nsec, this
creates a new one. The intention here is not to mix the GPU clock domain
with the CPU clock. It allows to cover a few more use cases without
extra complications.

This version is tested on an ADL-P and also checked gputop with i915 to
make sure not regressed. Last patch also contains the documentation for
the new key and sample output as requested in v1.

The pre-existent drm-cycles-<keystr> is used as is, which allows gputop
to work with xe.

This last patch still has some open discussion from v2, so we may need
to hold it a little more.

v2:
  - Create a new drm-total-cycles instead of re-using drm-engine with a
    different unit
  - Add documentation for the new interface and clarify usage of
    xe_lrc_update_timestamp()

v3:
  - Fix bugs in "drm/xe: Add helper to accumulate exec queue runtime" -
    see commit message
  - Reorder commits so the ones that are useful in other patch series
    come first

v4:
  - Fix some comments and documentation
  - Add 2 patches so we cache on the gt the mask of engines visible to
    userspace and the per-class capacity. Previously we were doing this
    during the query, but besides not being very efficient as pointed
    by Tvrtko, we were also not handling correclty reserved engines and
    engines "hidden" by e.g. ccs_mode.  So move that part to be executed
    on init and when changing the available engines.
  - Simplify the fdinfo output loop since now we have the information
    cached on gt. This also moves the read of the gpu timestamp out
    of the loop as suggested by Tvrtko and using the helpers implemented
    in the new patches.

v5:
  - Fix kernel-doc
  - Move pm_runtime_put() earlier in the function as it's not needed
    anymore after interacting with the HW.

Lucas De Marchi (6):
  drm/xe: Promote xe_hw_engine_class_to_str()
  drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
  drm/xe: Add helper to capture engine timestamp
  drm/xe: Cache data about user-visible engines
  drm/xe: Add helper to return any available hw engine
  drm/xe/client: Print runtime to fdinfo

Umesh Nerlige Ramappa (2):
  drm/xe/lrc: Add helper to capture context timestamp
  drm/xe: Add helper to accumulate exec queue runtime

 Documentation/gpu/drm-usage-stats.rst         |  21 ++-
 Documentation/gpu/xe/index.rst                |   1 +
 Documentation/gpu/xe/xe-drm-usage-stats.rst   |  10 ++
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
 drivers/gpu/drm/xe/xe_device_types.h          |   3 +
 drivers/gpu/drm/xe/xe_drm_client.c            | 121 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  37 ++++++
 drivers/gpu/drm/xe/xe_exec_queue.h            |   1 +
 drivers/gpu/drm/xe/xe_execlist.c              |   1 +
 drivers/gpu/drm/xe/xe_gt.c                    |  34 +++++
 drivers/gpu/drm/xe/xe_gt.h                    |  20 +++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c           |   1 +
 drivers/gpu/drm/xe/xe_gt_types.h              |  21 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c            |   2 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |  27 ++++
 drivers/gpu/drm/xe/xe_hw_engine.h             |   3 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  18 ---
 drivers/gpu/drm/xe/xe_lrc.c                   |  12 ++
 drivers/gpu/drm/xe/xe_lrc.h                   |  14 ++
 drivers/gpu/drm/xe/xe_lrc_types.h             |   3 +
 20 files changed, 329 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst

-- 
2.43.0

