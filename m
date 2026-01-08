Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B576D026A3
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 12:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD3210E6EE;
	Thu,  8 Jan 2026 11:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d0FNGsEt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536D510E33C;
 Thu,  8 Jan 2026 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767872039; x=1799408039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KA8rZZEHFAhApfRp4avt4rONfw7UKHIgrmDqP6alZn4=;
 b=d0FNGsEtbgZDrcAZonSa3/xZf8PwD+kS/8QNpv/dBLnAg3gWJA1BfvSM
 ZyMccngC5Kd7a0/VbXcY9c8r3pzWilVRr2BXt7t2d5Q65dRjAwzZZu9kN
 gTJfEjrlfZy5hK5BZ8fKa84f+zE/nhCLeMKWmVQzh0aFdslIDwt1V1/fX
 rXTvlnaHeQWXRKesoGRx1iwcOiqMOyYWm20IbI7jtTVZuN8ug8CWYqwqq
 fQ4daRnACawLnwSNMMRKR3WeqKs81eX5pvJP629eoEPHSrFSQ+jhFw4cV
 QiEZb/+vaRU+PE9plmSmtaQdrldUrjNcGFC4mnaK0OcJ4kaly8g8rPC96 A==;
X-CSE-ConnectionGUID: aBrLEIuHSYCgUqAPOQhN8A==
X-CSE-MsgGUID: msH/UApdQDiZDBUdgGnRkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="71824645"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="71824645"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 03:33:59 -0800
X-CSE-ConnectionGUID: H7rqe9+8QY6oTm/1+ClEJw==
X-CSE-MsgGUID: /kj0q9CzQMG3USqSZzhbhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="208024030"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 03:33:57 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 0/2] drm/buddy: Fix BUG_ON from oversized rounded
 allocations
Date: Thu,  8 Jan 2026 17:02:28 +0530
Message-ID: <20260108113227.2101872-4-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series addresses a crash in drm_buddy allocator when allocation
requests exceed mm->max_order after rounding operations. This can occur
with non-power-of-two VRAM sizes (e.g., 10G = 8G + 2G roots) where
mm->max_order represents the largest block (8G).

The issue manifests in two scenarios:

1. CONTIGUOUS allocations: roundup_pow_of_two(9G) = 16G > 10G
2. Large min_block_size: round_up(9G, 8G) = 16G > 10G

Both cases trigger BUG_ON(order > mm->max_order) deep in the allocation
path, crashing the system on invalid user input.

The fix validates the rounded size early and handles it appropriately:
- For CONTIGUOUS-only allocations, use the existing try_harder fallback
- For other cases (non-contiguous, or contiguous+range), return -EINVAL

v2: (Matt A)
- Add Fixes, Cc stable, and Closes tags for context

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>

Sanjay Yadav (2):
  drm/buddy: Prevent BUG_ON by validating rounded allocation
  drm/tests/drm_buddy: Add tests for allocations exceeding max_order

 drivers/gpu/drm/drm_buddy.c            |  9 +++++++
 drivers/gpu/drm/tests/drm_buddy_test.c | 35 ++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

-- 
2.52.0

