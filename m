Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA254B5EE6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 01:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8337410E39A;
	Tue, 15 Feb 2022 00:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D110710E383;
 Tue, 15 Feb 2022 00:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644884062; x=1676420062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H7pqK1mdwtiBeTD8NETC8XVfR/V1CXdH8O5xpQ042W0=;
 b=bOCqwOR1UbPNhFOSLkaaZBsv1mmDnUMS51C1aVsIccLjv455Ty8x0OjP
 Pd5x8TCx6LOfEk+JQxXw+6QyOFFavKW2+1LF6TTeeiH4fRsckAZe4+woh
 ZZAoIX9lLLV0tzw8fsQbuPo1BrYFlZ2IvYVQidU/h2+p1MgU9EXO0Y0dW
 EYxQt9eFfCxTuw5/YTe4xzKSs0HETRdbzuXfDveYjs7xl0KEcKFsff4al
 8Ea0R8pOy9w8sOhng/Uz+ncEw9N0VMTu3GSmY5Cz5qLBBqTnz2aRQQfbN
 eNWSY1lIELRJPOJRXn/EkT++OFnbD08iMULd+d0hWCx443nlR/LcE6aRF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="230852152"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="230852152"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 16:14:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="775515244"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 16:14:22 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/mm: Add an iterator to optimally walk over holes
 suitable for an allocation
Date: Mon, 14 Feb 2022 15:56:23 -0800
Message-Id: <20220214235625.864939-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first patch is a drm core patch that replaces the for loop in
drm_mm_insert_node_in_range() with the iterator and would not
cause any functional changes. The second patch is a i915 driver
specific patch that also uses the iterator but solves a different
problem.

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Christian König <christian.koenig@amd.com>

Vivek Kasireddy (2):
  drm/mm: Add an iterator to optimally walk over holes for an allocation
    (v3)
  drm/i915/gem: Don't try to map and fence large scanout buffers (v7)

 drivers/gpu/drm/drm_mm.c        |  32 ++++-----
 drivers/gpu/drm/i915/i915_gem.c | 120 +++++++++++++++++++++++---------
 include/drm/drm_mm.h            |  36 ++++++++++
 3 files changed, 137 insertions(+), 51 deletions(-)

-- 
2.34.1

