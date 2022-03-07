Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A24D086D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0183910E1CC;
	Mon,  7 Mar 2022 20:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A0A10E1B8;
 Mon,  7 Mar 2022 20:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646685469; x=1678221469;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7YRIyF4inKnkv3MNWNjoFoN0at5COmsLi2it4dNdW64=;
 b=Cyq/uYNqBmYxWv6VIbPe5z2zLHA+W+pcclX/zCDIdjABHsMqvm6gsEJi
 AyNInvq1pFHerZkuExT1s028MmqyihaF69jC52kjh57/tQRYookVUfdlS
 BfIsTsNTx/QVLU2dQpyGEhylopLHjTGGrDB+oy9ePp02P2F0W091BI+4o
 LLoGSOCKqYWWFt9xLMEWwQZt7QqgVoZ//5/vOpNH0hiXoU/fJzYfU45Ji
 p1W2ixUEkEkmk8/+u0LEuSGTHqDW7ws4cg/d9MD9Aitizwv6WLS9EzmSz
 +cGuTpALv+Ytv4DUx/IpjYLA+ueXz03XkUhUcoOcutEj01nBuHOWRiLkJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="235107805"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="235107805"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 12:37:48 -0800
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="509840692"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 12:37:48 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 tvrtko.ursulin@linux.intel.com
Subject: [PATCH v6 0/2] drm/mm: Add an iterator to optimally walk over holes
 suitable for an allocation
Date: Mon,  7 Mar 2022 12:21:19 -0800
Message-Id: <20220307202121.389550-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.35.1
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

The first patch is a drm core patch that replaces the for loop in
drm_mm_insert_node_in_range() with the iterator and would not
cause any functional changes. The second patch is a i915 driver
specific patch that also uses the iterator but solves a different
problem.

v2:
- Added a new patch to this series to fix a potential NULL
  dereference.
- Fixed a typo associated with the iterator introduced in the
  drm core patch.
- Added locking around the snippet in the i915 patch that
  traverses the GGTT hole nodes.

v3: (Tvrtko)
- Replaced mutex_lock with mutex_lock_interruptible_nested() in
  the i915 patch.

v4: (Tvrtko)
- Dropped the patch added in v2 as it was deemed unnecessary.

v5: (Tvrtko)
- Fixed yet another typo in the drm core patch: should have
  passed caller_mode instead of mode to the iterator.

v6: (Tvrtko)
- Fixed the checkpatch warning that warns about precedence issues.

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Christian König <christian.koenig@amd.com>

Vivek Kasireddy (2):
  drm/mm: Add an iterator to optimally walk over holes for an allocation
    (v6)
  drm/i915/gem: Don't try to map and fence large scanout buffers (v9)

 drivers/gpu/drm/drm_mm.c        |  32 ++++----
 drivers/gpu/drm/i915/i915_gem.c | 128 +++++++++++++++++++++++---------
 include/drm/drm_mm.h            |  36 +++++++++
 3 files changed, 145 insertions(+), 51 deletions(-)

-- 
2.35.1

