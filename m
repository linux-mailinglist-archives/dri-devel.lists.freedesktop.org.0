Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693ED694D40
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 17:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E2C10E62B;
	Mon, 13 Feb 2023 16:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B4010E624;
 Mon, 13 Feb 2023 16:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676306974; x=1707842974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0KbU8qx6+nttW/Z/s1Bm63rCx4oHghoLn6E6b77GuSk=;
 b=NHuJVMaGkzmMDrPQv2zwaT2f3l50Q5/k6VRJPUPd1aol9Z/2YCrOuUJb
 hXCB8jHngq50WCSXQ6qBEoJEskbHiXSkOg3+oE6QtYTRIlfxK8upoXj9H
 A8q3yB2abwnl+4CgFMp+Un5rm59jmB5fBHkvQPHwMKKYE6H4axtQ2ZQOQ
 8tifUil4L4fvDhKK6Ye7PfT2f9uLRB3CiPk3gIfhsPjEItbtObZtzKtN+
 zGlHCmynfen0pUulr7NYFyyynecevXh25TwQAnhAC+yPGRvVG/EJ+JZIh
 wLdyCOwp4y9op3bAXoaAIggBNl0SGeUITrVGBfd3RM6YSASx7rErSdIVd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393333280"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="393333280"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 08:49:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="792798265"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="792798265"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.19.172])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 08:49:29 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH 0/1] drm/i915/active: Serialize access to barrier tasks lists
Date: Mon, 13 Feb 2023 17:49:11 +0100
Message-Id: <20230213164912.51132-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test-with: <20230213095040.13457-2-janusz.krzysztofik@linux.intel.com>

New igt@gem_barrier_race@remote-request subtest, intended for triggering
list corruptions reported by perf users, also revealed issues potentially
related to engine barrier tasks lists handling.  For example, timeouts on
infinite __i915_active_wait() can be potentially caused by the list
falsely reported as empty to intel_engine_flush_barriers().

Protect sensitive users of a barrier tasks list from races with a
dedicated spinlock.

Note:
Similar to "drm/i915/active: Fix misuse of non-idle barriers as fence
trackers", I'm submitting this fix with a request to CI for testing it
with trybot submission of the new igt@gem_barrier_race@remote-request
subtest, not yet in upstream IGT, to get comparable results from the
widest possible HW range.

Janusz Krzysztofik (1):
  drm/i915/active: Serialize access to barrier tasks lists

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  6 +++
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 10 ++++-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |  4 ++
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  1 +
 drivers/gpu/drm/i915/gt/mock_engine.c         |  2 +
 .../drm/i915/gt/selftest_engine_heartbeat.c   |  5 +++
 drivers/gpu/drm/i915/i915_active.c            | 39 +++++++++++++++----
 7 files changed, 59 insertions(+), 8 deletions(-)

-- 
2.25.1

