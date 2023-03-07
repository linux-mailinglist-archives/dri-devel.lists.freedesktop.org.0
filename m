Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4806AE309
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301CD10E4C6;
	Tue,  7 Mar 2023 14:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF2010E4C6;
 Tue,  7 Mar 2023 14:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678200418; x=1709736418;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nvEpErR++49odc/U1QCjX/ZwXf5TOUMPXe1+I2YEzXE=;
 b=iKGICWdlvyD5EbVhJuIIuEZmMAeMqakD+8VLnAK1ygpc0RAeV5jnUV94
 pGmfUeeLCTUk4Xk9NkU8pvJB3DhBvwT20mofQgehF1qCun36ecHCzWj0c
 clXdR1hsUbrSej/rAU3DQ4p7uLromOk3PppAKIWSxyYPo61cucaNrgJ5B
 qxWyTVJF1BQiTLFX6WrTDbsBv6WxDaktF4G6jZ2JagLwzjWOLi8P8tePZ
 l4UVG4Xc5bpfUlxsjrKUnJCw5c/qU7DmiyztOmdMl0/jt9doBD3FWv4/k
 9erD6kswHpejv9OyTWLz5NGg24wS9xqVkJEGyjLNXkMySYlnCdNYNXiRp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400687141"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="400687141"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:46:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800414301"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="800414301"
Received: from peiwangc-mobl1.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.10])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:46:55 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/ttm: Small fixes / cleanups in prep for shrinking
Date: Tue,  7 Mar 2023 15:46:14 +0100
Message-Id: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
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

Thomas Hellström (7):
  drm/ttm: Fix a NULL pointer dereference
  drm/ttm/pool: Fix ttm_pool_alloc error path
  drm/ttm: Use the BIT macro for the TTM_TT_FLAGs
  drm/ttm: Unexport ttm_global_swapout()
  drm/ttm: Don't print error message if eviction was interrupted
  drm/ttm: Reduce the number of used allocation orders for TTM pages
  drm/ttm: Make the call to ttm_tt_populate() interruptible when
    faulting

 drivers/gpu/drm/ttm/ttm_bo.c     |  3 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c  | 13 ++++-
 drivers/gpu/drm/ttm/ttm_device.c |  3 +-
 drivers/gpu/drm/ttm/ttm_pool.c   | 95 ++++++++++++++++++--------------
 include/drm/ttm/ttm_tt.h         | 10 ++--
 5 files changed, 72 insertions(+), 52 deletions(-)

-- 
2.39.2

