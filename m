Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5376D6D97
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 22:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFD710E210;
	Tue,  4 Apr 2023 20:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E67110E210;
 Tue,  4 Apr 2023 20:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680638851; x=1712174851;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1WOwJNrllFLYlpaiANrZvSOegglsBpvBUSsVkr968ek=;
 b=ZAQ2VU2QCauhqsoSG/KgcAxGFwG2VLK7vXso9pIQzrN4OVMB+m4Pm7vx
 vYdx0UaC9/2uodSMFeUVG9rUAv6nHc5BWDhZ4mr7LTMLivnRJBxmbm0UR
 ZDLHCYgOXLhnJ3ShrfbliTfCQz6Ls27lO9xKNN6MIVwwZIQzCxlGRaklT
 JRNLdOXg3ngrHg+eOSTIy3h6tLg2teV7+QSJkfz1STYNUmyt6wK8w3rW3
 XTACB/hhGCKwoLYy0lGHD5Qm0UvlsyloXaf6DPqlli1dja+Wayb0P4fzl
 2sVYF8pBHumLj1MFUMcDThR68n0OsxGJxrnWcRovcUd9L+pxu02urKSF9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="326324681"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="326324681"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 13:07:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="689021874"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="689021874"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.33.67])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 13:07:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND v3 0/3] drm/ttm: Small fixes / cleanups in prep for
 shrinking
Date: Tue,  4 Apr 2023 22:06:47 +0200
Message-Id: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
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
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
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

