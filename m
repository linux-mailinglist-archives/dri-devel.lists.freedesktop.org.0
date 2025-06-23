Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D574EAE4951
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 17:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504F810E3E7;
	Mon, 23 Jun 2025 15:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSbcqiZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9358210E030;
 Mon, 23 Jun 2025 15:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750694012; x=1782230012;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lfgWTcKpCWMUVvfu4BQwihfDgrhqcggvUnUI5XdqlF4=;
 b=CSbcqiZtwjG0PsG7DHxJWGpZm8gFAnhIrDLdW46kAp3Z5LPQ9pcdmWpM
 0bdiikanVni+OUfYf+suNL9nTUG3LHK9PRfXH0F4g3iHPlXyrLQBcja7A
 CuQi6Rqf9JUW88nm87KVpZb+m6fPVBoW2DQ9A1X31jlGXJYx9ulZ3cDsG
 GmtSn7bswHv6MqxdLO6CJeEn9LHT+rZXS9SAAB0bR4IZPuILYUlrSThpz
 cV2dnyPV7AmGOzAr8S0LWwVC8X3Thc4y37DkIS3b1uYh539xoX4eN6YGE
 NqG1LKl+Hokhjema6W8/1i2K3TRSrlwVPhKUrwJxu66twp1Gd4hGg/4H4 w==;
X-CSE-ConnectionGUID: t0uEGjMcSD2vPQD6bP8K6A==
X-CSE-MsgGUID: 98lewCBYT5KDU6xrJRsFYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52625701"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="52625701"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:53:32 -0700
X-CSE-ConnectionGUID: obtAOBl8ScCDygcfudAEmQ==
X-CSE-MsgGUID: MPxwsrpMQWSSVLJPCmsE7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="156198834"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:53:31 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2 0/3] drm/ttm,
 drm/xe: Consolidate the Buffer Object LRU walks
Date: Mon, 23 Jun 2025 17:53:10 +0200
Message-ID: <20250623155313.4901-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

This is a deferred task from the Xe bo shrinker addition.

TTM currently have two separate ways of doing buffer object LRU
walks, of which one is exposed to drivers. Both have their benefits
but we shouldn't be implementing the complex bo locking in
two different places. So implement the ttm_lru_walk_for_evict()
function in terms of the guarded iteration also exposed to drivers.

This means that when we get to implement locking using drm_exec,
we only need to do that in a single place.

Add ticketlocking support to the guarded iteration and modify
the iteration arguments.

Thomas Hellström (3):
  drm/ttm: Use a struct for the common part of struct ttm_lru_walk and
    struct ttm_bo_lru_cursor
  drm/ttm, drm/xe: Modify the struct ttm_bo_lru_walk_cursor
    initialization
  drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict() using the guarded
    LRU iteration

 drivers/gpu/drm/ttm/ttm_bo.c      |  24 ++--
 drivers/gpu/drm/ttm/ttm_bo_util.c | 202 ++++++++++++------------------
 drivers/gpu/drm/xe/xe_shrinker.c  |   8 +-
 include/drm/ttm/ttm_bo.h          |  44 ++++---
 4 files changed, 131 insertions(+), 147 deletions(-)

-- 
2.49.0

