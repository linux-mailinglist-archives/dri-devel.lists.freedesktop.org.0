Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591EB96C4BA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 19:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD9B10E809;
	Wed,  4 Sep 2024 17:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLdNUNw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF8D10E7AA;
 Wed,  4 Sep 2024 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725469443; x=1757005443;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0NvObvb7LXWadTVjuIaSckGR1cJn0z2r9rsrcmM7ra0=;
 b=NLdNUNw+3OCm9oPbH/iwDfRkTizbDfmBwEacJOyfl081sWrkUfrlX/3M
 I5oL6XIfZAhhhLeoPzZOvou/cn+l2HPHL0TvqbH6QA4jasZ6R738MBeIX
 Q+1eCt1Lwhrh1OchmkpDjiE5TuQCJiqVXZJBka9G1aydSrlrfBNq+/kQY
 YtBXUAnrekCntbY1lqnpacoksiCRYRuSJfcS2RqgQ6jBqM3VDS1Rl6yVN
 pdp3loe6VPgXuAiDP8+XwnWpzVKTk0vx2YMn+Xa2ed9f8Z8GkvoDe3orv
 +H7mV8uXwfhFEvj+j8jjHKkwUXwiHjqv69CqJwes364vGMRnzLkHcDtwe w==;
X-CSE-ConnectionGUID: /OE4joL0QsyPycYHhSZgSw==
X-CSE-MsgGUID: wvgi/tZdRpGIcz7kCe1Ctg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27067466"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="27067466"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 10:04:02 -0700
X-CSE-ConnectionGUID: IQMc7CpGQ5iyeUv/zJ8sLw==
X-CSE-MsgGUID: AGObfcrYQl6vvF85XD0Hjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="70151014"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 10:04:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, boris.brezillon@collabora.com,
 lionel.g.landwerlin@intel.com, kenneth.w.graunke@intel.com
Subject: [PATCH 0/2] Fix extobj dma-resv slot usage in XE's exec IOCTL
Date: Wed,  4 Sep 2024 10:04:58 -0700
Message-Id: <20240904170500.3303081-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Bookkeep should be used, not write. Depends on user space beign ready so
add a per VM opt in flag to use bookkeep.

Matt

Matthew Brost (2):
  drm/xe: Add DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP
  drm/xe: Wire up DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP

 drivers/gpu/drm/xe/xe_exec.c     | 11 +++++++++--
 drivers/gpu/drm/xe/xe_vm.c       |  5 ++++-
 drivers/gpu/drm/xe/xe_vm_types.h |  5 +++--
 include/uapi/drm/xe_drm.h        |  6 ++++++
 4 files changed, 22 insertions(+), 5 deletions(-)

-- 
2.34.1

