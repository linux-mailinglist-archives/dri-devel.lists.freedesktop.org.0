Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF28D3EB6E9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 16:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD77E6E83C;
	Fri, 13 Aug 2021 14:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A4889AAD;
 Fri, 13 Aug 2021 14:43:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="212454800"
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="212454800"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 07:43:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="447069619"
Received: from pheino-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.189])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 07:43:49 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2 0/2] drm/i915,
 drm/ttm: Update the ttm_move_memcpy() interface
Date: Fri, 13 Aug 2021 16:43:29 +0200
Message-Id: <20210813144331.372957-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

The ttm_move_memcpy() function was intended to be able to be used async
under a fence.
We are going to utilize that as a fallback if the gpu clearing blit fails
before we set up CPU- or GPU ptes to the memory region.
But to accomplish that the bo argument to ttm_move_memcpy() needs to be
replaced.

Patch 1 reorganizes the i915 ttm move code a bit to make the change
in patch 2 smaller.
Patch 2 updates the ttm_move_memcpy() interface.

v2:
- Don't initialize memcpy iterators until they are actually needed (Patch 1).
- Added proper R-B:s and Cc:s

Thomas Hellström (2):
  drm/i915/ttm: Reorganize the ttm move code somewhat
  drm/ttm, drm/i915: Update ttm_move_memcpy for async use

 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 77 ++++++++++++++-----------
 drivers/gpu/drm/ttm/ttm_bo_util.c       | 20 +++----
 include/drm/ttm/ttm_bo_driver.h         |  2 +-
 3 files changed, 55 insertions(+), 44 deletions(-)

Cc: Christian König <christian.koenig@amd.com>
-- 
2.31.1

