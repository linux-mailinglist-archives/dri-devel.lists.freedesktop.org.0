Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39600939514
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 23:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D397010E310;
	Mon, 22 Jul 2024 21:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eaguog1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78DC10E31A;
 Mon, 22 Jul 2024 21:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721682420; x=1753218420;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cLNPe9dx4bBLrxya/4PwK4euVFfE/6NBva4Wj7GDAqc=;
 b=Eaguog1tN7fl8n/EN58cvKRU/ESB6g6O4wDZfuVv3wBpsiK1RPCoDciO
 U2E13vrLAsy65ZuaUCf94B/TUrJxIXYmLOaumLexMwAKViHgfkLgiDVjj
 z578V4aQAXJ8EPctc41TKsPwiAAk/4CEFuNOjeEtnTt+pwLtsGJuf7w80
 +GzbyKVbkL/WWlB7nfRE1g8LgQUbjK61ORKBClcUXEViqPRyD4YYg+Qte
 tgJhiaxevUP96CBgVqTbsRVmkfQ58HfH2cFXBaPISTFETor4WPsY9mMK6
 GijY4Cm8BQ8WLF6TXBKDWacX9JVCueuE7d70MY0yPwErHjyBFw0KNmkEZ Q==;
X-CSE-ConnectionGUID: NpCj4XCuQw280wCYp03KoA==
X-CSE-MsgGUID: utcUgPHVRD2YUPf1mhdHKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30428287"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="30428287"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:00 -0700
X-CSE-ConnectionGUID: ZHmecsDgS3euI2nR5IUSvg==
X-CSE-MsgGUID: OAAxfdpqQkmvkBkUg97pwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="51653263"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:06:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	linux-perf-users@vger.kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/7] Fix i915 pmu on bind/unbind
Date: Mon, 22 Jul 2024 14:06:41 -0700
Message-ID: <20240722210648.80892-1-lucas.demarchi@intel.com>
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

This is intended to fix the pmu integration in i915 when the device
unbinds. I don't have the hardware to test, but I belive a similar issue
occurs with any driver using perf_pmu_unregister() if they can unbind
from the device - in drm subsystem, that would be the amd driver.

Previous attempts I could find:
1) https://lore.kernel.org/lkml/20240115170120.662220-1-tvrtko.ursulin@linux.intel.com/
2) https://lore.kernel.org/all/20240213180302.47266-1-umesh.nerlige.ramappa@intel.com/

I think (2) is a no-go as it tries to do everything from the i915 side
by force-closing the fd.

I believe this series is simpler* than (1), but that could could also be
a good alternative if we want to go with that approach.

First patch is to perf. The rest is to i915 that builds on that and
moves the unregister bit by bit to be done later, after the last
reference to i915 is dropped.  Peter/Ingo, could I get your opinion on
this or if (1) would be a good alternative? Thanks.

* simpler, but see downside mentioned in patch 6

Lucas De Marchi (7):
  perf/core: Add pmu get/put
  drm/i915/pmu: Fix crash due to use-after-free
  drm/i915/pmu: Use event_to_pmu()
  drm/i915/pmu: Drop is_igp()
  drm/i915/pmu: Let resource survive unbind
  drm/i915/pmu: Lazy unregister
  drm/i915/pmu: Do not set event_init to NULL

 drivers/gpu/drm/i915/i915_pmu.c | 103 ++++++++++++++++----------------
 include/linux/perf_event.h      |   3 +
 kernel/events/core.c            |  32 ++++++++--
 3 files changed, 81 insertions(+), 57 deletions(-)

-- 
2.43.0

