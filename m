Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF062BBA8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 12:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE1710E477;
	Wed, 16 Nov 2022 11:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7FA10E477;
 Wed, 16 Nov 2022 11:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668597956; x=1700133956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HErREVMtikJ5Oz6ko6QuQeefE7FYijMl/vhYRjXMSfw=;
 b=SFMLhbjRE/392vAerZipd1/eZOSxHqMmbl9B1CLaDv3Cgd6NfE0nK1C0
 vtGbYxMMmmm6fo/ZGxXdzdXG30wTBJWB3GbiKSd8v0cY8M+TSrW0UeVln
 3VqqAgcHPkgeHufXn4E86W+e+T08BsDigFSjyysmEPX1cXf7/YxaG5LCM
 h95erxhCAiumDKsyoyS8TEKDcrrmW+nQ6tMS0XLOrH4BwGbN0BgCI3y95
 TCaporqZK2/dFIzvRIqbayTTXcj4+8mUE+jVKEN7V1g1MZ91g4/PrI46r
 rYWsJBT9Pk84ZvkXUk3AKkzJ/3YBurAsrZ7T4Aac1/zO8yflw8BuHHL+j w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="295885144"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="295885144"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 03:25:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="670468916"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="670468916"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.12.208])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 03:25:52 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 0/3] drm/i915: Fix timeout handling when retiring requests
Date: Wed, 16 Nov 2022 12:25:29 +0100
Message-Id: <20221116112532.36253-1-janusz.krzysztofik@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes for issues discovered via code review while working on
https://gitlab.freedesktop.org/drm/intel/issues/7349.

Reworked version of a series supposed to fix the same issues, sent before
under the same subject.  Since some solutions are significantly different
than before, I'm not marking this series and individual patches as v2.

Janusz Krzysztofik (3):
  drm/i915: Fix negative remaining time after retire requests
  drm/i915: Never return 0 on timeout when retiring requests
  drm/i915: Never return 0 if request wait succeeds

 drivers/gpu/drm/i915/gt/intel_gt_requests.c | 26 ++++++++++++++++++---
 drivers/gpu/drm/i915/i915_request.c         |  2 ++
 2 files changed, 25 insertions(+), 3 deletions(-)

-- 
2.25.1

