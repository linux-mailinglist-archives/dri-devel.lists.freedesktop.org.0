Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB92BC4A69
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 13:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEB710E0DD;
	Wed,  8 Oct 2025 11:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TR6ASrG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7940210E0DD;
 Wed,  8 Oct 2025 11:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759924626; x=1791460626;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gi5o7aPfG55DXLxO945f8+2DBKk54Ox84d2BWHOPqb0=;
 b=TR6ASrG8RArB2MwiGjgUy1rUsuOQn1TzdePg81OfLx/AcGoSAVRyBMR4
 soTdbSDCPBKsD4MQJfZvZ7bdaLVTOgPst6g3SnHu6qEUyalEatARnFitT
 03MfXRO7eM1s6TtMp1dwV4+raDM/rTG8LTSVtFBcS28WRGhs8I2NCsVQ0
 N4GWFaAiGS37iI6QqT91wh3yA0QIPFr6hVFthGPAylUOHJQtgED9KOwkS
 57P0LqLSlWK33Pf/Ed3Ot7gdk1StQNexm3d3ewRhdMZLj1nYcPlkziDqj
 xMzk11Gkr2ugeMrrGUtv5gFDl1KifJte1/87SZb0OavgZg91v2YKsvBZx A==;
X-CSE-ConnectionGUID: Pq+K5vUUSBKLEp8TVbfbMw==
X-CSE-MsgGUID: O4cTm/uQTpumooryBvglxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="72729437"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="72729437"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:57:05 -0700
X-CSE-ConnectionGUID: PuDKrFAHTsGuASzJDEsNuA==
X-CSE-MsgGUID: ekrU/TYvTZOrK/CHDkVWnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="180016104"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.147])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:57:01 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Adrian Larumbe <adrian.larumbe@collabora.com>,
 Simona Vetter <simona@ffwll.ch>, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH v2 0/2] Context isolation uAPI fixes
Date: Wed,  8 Oct 2025 13:56:31 +0200
Message-ID: <20251008115632.16333-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

This patch series addresses the concerns in
https://gitlab.freedesktop.org/drm/intel/-/issues/4264

Parallel work has been done on IGT to test changes in the kernel driver:
https://lists.freedesktop.org/archives/igt-dev/2022-May/041600.html

Test-with: 20220516205000.2960491-1-adrian.larumbe@collabora.com

v2:
- rebased the patches on the current upstream tree for the resend
- fixed up small typos

Adrian Larumbe (2):
  drm/i915: Change semantics of context isolation reporting to UM
  drm/i915: force getparam ioctl return bool for HAS_CONTEXT_ISOLATION

 drivers/gpu/drm/i915/gt/intel_engine_user.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_user.h |  1 +
 drivers/gpu/drm/i915/i915_getparam.c        |  2 +-
 include/uapi/drm/i915_drm.h                 |  4 ----
 4 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.45.2

