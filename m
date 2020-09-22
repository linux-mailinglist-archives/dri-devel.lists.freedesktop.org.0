Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52665274269
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 14:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D256E127;
	Tue, 22 Sep 2020 12:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971136E073;
 Tue, 22 Sep 2020 12:51:17 +0000 (UTC)
IronPort-SDR: bA/ZEaIEg9UBQkaQOjGSiT7PijXs2G6iPF59HGAJLpETVutbpIvPysCeicKlL3dqvN1P574Z2r
 w6xEi5aTWKWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="224740746"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="224740746"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 05:51:16 -0700
IronPort-SDR: OnC8aB6IQahwqkcjmYpXi7Ev6DmoiMJ5zTIkRzebLRNyFcmddFoMOA0edDYnyHfnsZCI3bkjxQ
 YYBNQBfwUbGw==
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="304931260"
Received: from ideak-desk.fi.intel.com (HELO localhost) ([10.237.68.141])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 05:51:15 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915: Add support for LTTPR non-transparent link
 training mode
Date: Tue, 22 Sep 2020 15:50:59 +0300
Message-Id: <20200922125106.30540-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the drm-core helpers and register definitions required to detect
LTTPRs and perform the link training in non-transparent mode. In i915
switch to non-transparent link training mode if any LTTPR is detected.

Cc: dri-devel@lists.freedesktop.org

Imre Deak (7):
  drm/i915: Fix DP link training pattern mask
  drm/i915: Move intel_dp_get_link_status to intel_dp_link_training.c
  drm/i915: Simplify the link training functions
  drm/i915: Factor out a helper to disable the DPCD training pattern
  drm/dp: Add LTTPR helpers
  drm/i915: Switch to LTTPR transparent mode link training
  drm/i915: Switch to LTTPR non-transparent mode link training

 drivers/gpu/drm/drm_dp_helper.c               | 179 ++++++-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   3 +-
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  38 +-
 drivers/gpu/drm/i915/display/intel_dp.h       |   2 -
 .../drm/i915/display/intel_dp_link_training.c | 492 +++++++++++++++---
 .../drm/i915/display/intel_dp_link_training.h |  10 +-
 include/drm/drm_dp_helper.h                   |  56 ++
 8 files changed, 682 insertions(+), 100 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
