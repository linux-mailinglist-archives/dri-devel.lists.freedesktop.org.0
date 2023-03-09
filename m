Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 147966B250F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 14:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F22C10E02F;
	Thu,  9 Mar 2023 13:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF5510E02F;
 Thu,  9 Mar 2023 13:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678367845; x=1709903845;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1WOwJNrllFLYlpaiANrZvSOegglsBpvBUSsVkr968ek=;
 b=JXZB9/f7U/qrAauz9ut/CvY+EulhFoI8HLFoMn7bwKqnUjA7omwNJ1P1
 mbKTmDe0n9YQP5GGNwFn04ZmjEdxf2aFQkViYftV26S98QD5aIRqhXB8C
 dw0bcLz58TlDJLExMRGtb7C25rKPqqvhfrSFY+bLwzMPHpMJ0AuctOsqc
 tSs5Nbnhm2E66LKZBL+TBm5/plGqyOhJ/UMubd8XhoiOzYrPfeUjgMMSl
 FeD+hUwWhliBzWdL/P6H3ReL9c6fTotxrZrxLK2mFSMlpqhIh72wBLgEy
 JrE4duShFRwb33TpvQYEz0iumBFzbLVLPAo0R9VeLI8nun2NBj2hq3stJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320270426"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="320270426"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 05:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="787551619"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="787551619"
Received: from harith2x-mobl1.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 05:17:15 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/3] drm/ttm: Small fixes / cleanups in prep for shrinking
Date: Thu,  9 Mar 2023 14:16:58 +0100
Message-Id: <20230309131701.65312-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I collected the, from my POW, uncontroversial patches from V1 of the TTM
shrinker series, some corrected after the initial patch submission, one
patch added from the Xe RFC ("drm/ttm: Don't print error message if
eviction was interrupted"). It would be nice to have these reviewed and
merged while reworking the rest.

v2:
- Simplify __ttm_pool_free().
- Fix the TTM_TT_FLAG bit numbers.
- Keep all allocation orders for TTM pages at or below PMD order

v3:
- Rename __tm_pool_free() to ttm_pool_free_range(). Document.
- Compile-fix.

Thomas Hellström (3):
  drm/ttm/pool: Fix ttm_pool_alloc error path
  drm/ttm: Reduce the number of used allocation orders for TTM pages
  drm/ttm: Make the call to ttm_tt_populate() interruptible when
    faulting

 drivers/gpu/drm/ttm/ttm_bo_vm.c |  13 +++-
 drivers/gpu/drm/ttm/ttm_pool.c  | 111 ++++++++++++++++++++------------
 2 files changed, 80 insertions(+), 44 deletions(-)

-- 
2.39.2

