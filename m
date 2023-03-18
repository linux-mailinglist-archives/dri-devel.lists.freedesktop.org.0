Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB726BFCC2
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 21:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1F910E0BC;
	Sat, 18 Mar 2023 20:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AE210E0BC;
 Sat, 18 Mar 2023 20:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679171815; x=1710707815;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QjoI3ShW+fVfq96GG5Yi1kPvdiimEhuuKXft6j9+wsg=;
 b=br3ATa5sD3QhedE8GnJoZGA2gLZ9zM7PByz4V7Xw8/7Wpeqr4wNKzXOB
 Ni8VojRKtGSSc8fcYAv50joz3vYz/7l3fr0EtiSzsTow6IcNgtGxFnXX2
 jjv3cJfhbMPE1MZxeH+h+CPfBeInnDL0BMpU2MNanlAuOCBx1D1LS9jyI
 EsLQI7MupdTo9MONOwgxgcGg3/J4RTIVLGx2s96wOeVg+dryuBMERj1Lh
 6eE0Ww1OaJgmzXvXBHv3D6IzFMxv1xsnd9C8e6W7ccWq3jwvhHzG/kmZe
 FL2dBEqIdfBV0uIo8THu3t3SKenNUhfQgRSQ7i+Z7BgBJTNU9sRLBKlAd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="403332519"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; d="scan'208";a="403332519"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2023 13:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="683027216"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; d="scan'208";a="683027216"
Received: from rmanole-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.34.109])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2023 13:36:51 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] Some debugfs refactoring and improvements
Date: Sat, 18 Mar 2023 21:36:13 +0100
Message-Id: <20230318203616.183765-1-andi.shyti@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

These two patches aim to enhance the multi-GT capabilities of the
debugfs.

The first patch reorganizes the file structure, while the second
patch extends the functionality of the original files in the
upper directories to operate on all tiles with a single write,
providing an or'ed value among them in the read case.

Thanks Radhakrishna and Nirmoy for your reviews.

Andi

Changelog
=========
v2 -> v3
 - Some code improvement suggested by Nirmoy in patch 2.
 - To avoid confusion GT's have been called tiles.

v1 -> v2
 - Add patch 2 for multiplexing.
 - Improve commit log in patch 1.

Andi Shyti (2):
  drm/i915/gt: Create per-gt debugfs files
  drm/i915/debugfs: Enable upper layer interfaces to act on all gt's

 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    |  4 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  5 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c |  2 ++
 drivers/gpu/drm/i915/i915_debugfs.c           | 36 ++++++++++++++++---
 5 files changed, 43 insertions(+), 6 deletions(-)

-- 
2.39.2

