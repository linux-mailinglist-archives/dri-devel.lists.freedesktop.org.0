Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DAB8C6DD9
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A4410E141;
	Wed, 15 May 2024 21:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MD765yx7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCEF10E141;
 Wed, 15 May 2024 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715809379; x=1747345379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eie80tUrJWUfVQ2GNQJE2TapkRO9R+EfFJSZVA7+rEY=;
 b=MD765yx7bxOyIhM3BY8wvU5hRXtgkuquBAikPRrpuyOAhjMTGFLDPGDt
 c8H3wXnmKgyAxfXCYpe8Lf76dqaSK2JvTgOtoy+Re9LH3B6zdd++iH+YD
 hkBBZlAFwr94N9OnK3YNsHccywwXpvUNwF0111kr8nNrfuaTouQc0r3sD
 +6LZ3Mm3TqpepRB1FgHBIJl30DPEg9nff8umpmvKOPrkBGMOK+IoyjHCV
 IsXY3f2dL7xPvw5NNXWqF/bmsgzQk9CRdm4bhqqdMv8JZHhzQI0drjZGu
 TyjiLET9C2rG4UGEVK4/HFvkUAO377DUjZY1cQAt26oOh3WByoPhk9vOA A==;
X-CSE-ConnectionGUID: bz+17sBhRiiI/M6Oou+UBA==
X-CSE-MsgGUID: gnEaYT1LTP2CtWUpx7KuQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11739157"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="11739157"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:42:58 -0700
X-CSE-ConnectionGUID: YeVFijyuRtOlyB7GMg/iXA==
X-CSE-MsgGUID: 1Kqg1mhKRFKcQT3e9GrLuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35651121"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:42:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 0/8] drm/xe: Per client usage
Date: Wed, 15 May 2024 14:42:50 -0700
Message-ID: <20240515214258.59209-1-lucas.demarchi@intel.com>
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

v4 of https://lore.kernel.org/all/20240507224510.442971-1-lucas.demarchi@intel.com

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

