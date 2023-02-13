Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B77B6954A6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 00:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5A910E08F;
	Mon, 13 Feb 2023 23:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F3F10E77C;
 Mon, 13 Feb 2023 23:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676330505; x=1707866505;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JmbfEZbAIgEoO+yScYsdfJT8z9E62q1R4DTLeufGQJY=;
 b=fCgq7qyP8n5h+KK5X1EboiOH0oHosc20ykxF+aRoUAet9afCOWUWSuKp
 ocvASOK7r9rWMEyWdfxe8va1CmzjrDFVqRFzeaUlJ4DVcMcFEOBbqaFYt
 jxx78hQ9ZsoHDG0G0R8JtpjUTD13y1Ui3oMA+FEMOEuQQizih5JxthMcL
 v1jQrrggDCCqfFBXiN8Xxwi6n+oUdvxZ0XRHgHXOVP0e1Z/JR0Sieq9zP
 0KA4EtOadHRGY5/5/OTr1I9YN+sRkiVnHy5EPvU9nS4AffqoHInXdMOj7
 QVxj2zmf1PpoysQVo3YzdfiUNI/svSsbV0my/NU2z4cjGTvtHV3zyYHtc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="333161195"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="333161195"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 15:21:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="997860674"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="997860674"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.19.172])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 15:21:41 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH 0/2] Resolve barrier tasks list related issues
Date: Tue, 14 Feb 2023 00:21:26 +0100
Message-Id: <20230213232128.59217-1-janusz.krzysztofik@linux.intel.com>
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

The series consist of two patches so far submitted separately, with no
changes from original versions.  Together theses patches are beleived to
resolve issues related to intentionally racy way of deleting individual
barriers from an engine's barrier tasks list.

Note:
Again, I'm submitting this series with a request to CI for testing it
with trybot submission of the new igt@gem_barrier_race@remote-request
subtest, not yet in upstream IGT, to get comparable results from the
widest possible HW range.

Janusz Krzysztofik (2):
  drm/i915/active: Fix misuse of non-idle barriers as fence trackers
  drm/i915/active: Serialize access to barrier tasks lists

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  6 ++
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 10 ++-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |  4 ++
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  1 +
 drivers/gpu/drm/i915/gt/mock_engine.c         |  2 +
 .../drm/i915/gt/selftest_engine_heartbeat.c   |  5 ++
 drivers/gpu/drm/i915/i915_active.c            | 64 +++++++++++++------
 7 files changed, 73 insertions(+), 19 deletions(-)

-- 
2.25.1

