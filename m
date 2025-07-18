Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60516B0A3C3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD8410E987;
	Fri, 18 Jul 2025 12:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXjVPpZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396BF10E03C;
 Fri, 18 Jul 2025 12:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752840118; x=1784376118;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F+7LI07C4FQUDqnyZ/BruVxFT9uvyvwOVIbp0op1We0=;
 b=lXjVPpZRHqc8xdq9vDWFKWNDLm1ItdApSY8/8FY6ZysfFMlo6Rgi/Uqp
 8+3MGvVY0vzBBDiU6035uDvbVMeWv7g0fx6JiENG1xafgeS0R7DGV8czH
 aRBDugENTP0TF75vOgXGxWomeSQhkZpbYqvC68Cfn0M0dR/FYmGFIWmNg
 Eo1CCwvvw6E3UoH3x3xM5tuWYbxDiuyAb2ea6NnjCBlMeh4iEwopmTwPo
 O4otLJnzLQzZHyR11hW+4q2hrQKGqwteWPoP4BZ21GjwRZleLN9pPn6Lh
 pLK3m0HLhWKgwddiTAFQ1QRXD/+yX3uU+ajEmtiA9+wgPofiV6U94GbjM w==;
X-CSE-ConnectionGUID: YZMlBodhQNyr+LLt84q5Gg==
X-CSE-MsgGUID: wt1CH63cTO2NMHgdZ/FGhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54345495"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="54345495"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 05:01:57 -0700
X-CSE-ConnectionGUID: VGKNHRzcR3OK3M5NOZMEXQ==
X-CSE-MsgGUID: WYiOkCHeTHO+GNj+00oY0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="163674597"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.63])
 by orviesa005.jf.intel.com with SMTP; 18 Jul 2025 05:01:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Jul 2025 15:01:54 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/i915/dp: Implement POST_LT_ADJ_REQ
Date: Fri, 18 Jul 2025 15:01:50 +0300
Message-ID: <20250718120154.15492-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Implement the POST_LT_ADJ_REQ sequence, which is supposed
to be used to further tune the link vswing/pre-emphasis
when TPS4 is not supported.

Unfortunately I don't have any displays/dongles that support
this so I wasn't able to test anything. Imre has tested this
with a DP tester though.

v2: rebase after all the prep stuff got merged

Ville Syrjälä (4):
  drm/dp: Add definitions for POST_LT_ADJ training sequence
  drm/dp: Add POST_LT_ADJ_REQ helpers
  drm/i915/dp: Implement the POST_LT_ADJ_REQ sequence
  hax: drm/i915: Disable TPS4 support to force POST_LT_ADJ_REQ usage

 drivers/gpu/drm/display/drm_dp_helper.c       |   8 ++
 .../drm/i915/display/intel_dp_link_training.c | 131 +++++++++++++++++-
 .../drm/i915/display/intel_dp_link_training.h |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   2 +-
 include/drm/display/drm_dp.h                  |   3 +
 include/drm/display/drm_dp_helper.h           |   8 ++
 6 files changed, 150 insertions(+), 4 deletions(-)

-- 
2.49.0

