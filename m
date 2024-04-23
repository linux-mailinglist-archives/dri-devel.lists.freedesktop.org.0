Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E0A8AFCEB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 01:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D03611377B;
	Tue, 23 Apr 2024 23:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfMAmPS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05610113778;
 Tue, 23 Apr 2024 23:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713916585; x=1745452585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MiAy3RPERKIvBpgYzVAmKOyOF2fj9wRGPBQk7H9g1js=;
 b=cfMAmPS0dr0YS6BtH8CbWpT/U5cO3e6v6cXpy0PiY8HSJ9y5QxTjdcvc
 x08jGWW/+s6skszeT4lmLxAwULEyvSdgVKwEUOQ553vPHSvpZSZQ0j9YW
 XgrKtDW0f0OnepySSHRPNLOtuN0rVax0yxDus2O4pBZvQ2GwYDn3bKMtR
 G5Ou4vBYGnurQWexC38CqCLSWbU/zjPeXHpjSLHx1INabQCOgyRxSdGFj
 kjq3DvpRkbMLMFC6OHxjO9tGhmsEeAa4AIJer8mkVmBmLEjWxySIe3ffG
 Pp2I/SLBY8C8cuxc1ZBiPQPN099LQUqB9yxe2IYM2c2jvgRWKb0H6X3jw A==;
X-CSE-ConnectionGUID: qhAqiV29TVOP259D1cC+hw==
X-CSE-MsgGUID: SZMvPRjeRm6NfOL9ycruRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27040635"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="27040635"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:56:24 -0700
X-CSE-ConnectionGUID: WobSp0RqR86q4ThGjK39oQ==
X-CSE-MsgGUID: u5Zbn4UaTUO2OWtqvVle2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29170906"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:56:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/6] drm/xe: Per client usage
Date: Tue, 23 Apr 2024 16:56:45 -0700
Message-ID: <20240423235652.1959945-1-lucas.demarchi@intel.com>
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

Add per-client usage statistics to xe. This ports xe to use the common
method in drm to export the usage to userspace per client (where 1
client == 1 drm fd open).

However insted of using the current format measured in nsec, this
creates a new one. The intention here is not to mix the GPU clock domain
with the CPU clock. It allows to cover a few more use cases without
extra complications.

I tested this on DG2 and also checked gputop with i915 to make sure not
regressed. Last patch also contains the documentation for the new key
and sample output as requested in v1. Reproducing it partially here:

	- drm-total-cycles-<keystr>: <uint>

	Engine identifier string must be the same as the one specified in the
	drm-cycles-<keystr> tag and shall contain the total number cycles for the given
	engine.

	This is a timestamp in GPU unspecified unit that matches the update rate
	of drm-cycles-<keystr>. For drivers that implement this interface, the engine
	utilization can be calculated entirely on the GPU clock domain, without
	considering the CPU sleep time between 2 samples.

The pre-existent drm-cycles-<keystr> is used as is, which allows gputop
to work with xe.

v2:
  - Create a new drm-total-cycles instead of re-using drm-engine with a
    different unit
  - Add documentation for the new interface and clarify usage of
    xe_lrc_update_timestamp()

Test-with: https://lore.kernel.org/igt-dev/20240423234431.1959354-1-lucas.demarchi@intel.com/

Lucas De Marchi (4):
  drm/xe: Add helper to capture engine timestamp
  drm/xe: Promote xe_hw_engine_class_to_str()
  drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
  drm/xe/client: Print runtime to fdinfo

Umesh Nerlige Ramappa (2):
  drm/xe/lrc: Add helper to capture context timestamp
  drm/xe: Add helper to accumulate exec queue runtime

 Documentation/gpu/drm-usage-stats.rst         |  16 +-
 Documentation/gpu/xe/index.rst                |   1 +
 Documentation/gpu/xe/xe-drm-usage-stats.rst   |  10 ++
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
 drivers/gpu/drm/xe/xe_device_types.h          |   9 ++
 drivers/gpu/drm/xe/xe_drm_client.c            | 138 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  37 +++++
 drivers/gpu/drm/xe/xe_exec_queue.h            |   1 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |  27 ++++
 drivers/gpu/drm/xe/xe_hw_engine.h             |   3 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  18 ---
 drivers/gpu/drm/xe/xe_lrc.c                   |  11 ++
 drivers/gpu/drm/xe/xe_lrc.h                   |  14 ++
 drivers/gpu/drm/xe/xe_lrc_types.h             |   3 +
 drivers/gpu/drm/xe/xe_sched_job.c             |   2 +
 15 files changed, 270 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst

-- 
2.43.0

