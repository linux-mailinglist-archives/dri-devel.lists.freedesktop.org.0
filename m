Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9B44CE7D1
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 00:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C6810E4C6;
	Sat,  5 Mar 2022 23:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFD510E265;
 Sat,  5 Mar 2022 23:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646524351; x=1678060351;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=guRleYKnvycKzf/AIWKtEHXzLez2uUswbIrIopZevuc=;
 b=GcdmbPmHjKMPLGZB9Hf+0fCPegoGEhuOLiYllJvBBQgoJofoPbXqLWm9
 YqMSbXHm1Mmh2pT2alW/FmtWGZI2yCB/vU/pmN087wg8YlmSzXWeXujOr
 zXx85Q09slTpcuVV6QO5p/NkQTToUuH6wFB/Ew8oPCGe+JHfUUgdVpI2C
 Gm1cdT7Coe2ACUQOJpKdhVkuuodyw/qwtrt36G5YqMaOqWi6F3WSkexwZ
 r1sYHylV24r81OwRwfcJ5P4q55tas+JgrL6LGjhyffQEBLgZpaaSTrLs1
 gENeCpVaJ5Ku5VMMn5/weXiKjzLuFISpp94L3PanU3vDlTnumHnrFh+/C Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10277"; a="251760673"
X-IronPort-AV: E=Sophos;i="5.90,158,1643702400"; d="scan'208";a="251760673"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2022 15:52:30 -0800
X-IronPort-AV: E=Sophos;i="5.90,158,1643702400"; d="scan'208";a="595134004"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2022 15:52:30 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [CI 0/2] drm/mm: Add an iterator to optimally walk over holes
 suitable for an allocation
Date: Sat,  5 Mar 2022 15:36:13 -0800
Message-Id: <20220305233615.126109-1-vivek.kasireddy@intel.com>
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

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Christian König <christian.koenig@amd.com>

Vivek Kasireddy (2):
  drm/mm: Add an iterator to optimally walk over holes for an allocation
    (v5)
  drm/i915/gem: Don't try to map and fence large scanout buffers (v9)

 drivers/gpu/drm/drm_mm.c        |  32 ++++----
 drivers/gpu/drm/i915/i915_gem.c | 128 +++++++++++++++++++++++---------
 include/drm/drm_mm.h            |  36 +++++++++
 3 files changed, 145 insertions(+), 51 deletions(-)

-- 
2.35.1

