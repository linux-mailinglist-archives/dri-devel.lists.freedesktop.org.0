Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22167A4298D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C7110E351;
	Mon, 24 Feb 2025 17:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlTWVqot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D681210E347;
 Mon, 24 Feb 2025 17:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740418010; x=1771954010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eAoQmvB1/5uFup65O8Oyst1eOy94uFJZn6f1HXRiyWo=;
 b=ZlTWVqot6y+qNldJM6pVErpaGs9iLRnRsodAzpX0U8NjCJ2zuFATyEMP
 Xh/GUy/qJCbbNQVBIvR9EWabTPhnx4M/DkqyQEMAu7zfKtcTsdDOGoRYh
 XVIz3CLVCE5ySQaJHZuH9EjmA8QTnaUKNxXWR1v0t26YYZL2aYwSrqpnD
 UVlTchndc5w1SVAy7yu4TJ4xDQS+ZmTXA5A38FntqynxVSCgNTUw0fnQ0
 Ofo3d012cvLdCT0BS/0MDbNDvF9dFpqgkxrM5cmHsEnGSGIuYwQRW7OCH
 NRzzpxV48H3KTmkjpsQSTJ95Rdzg0vgqOYH7iwsDbqEhoH0qXgPoUGD2N Q==;
X-CSE-ConnectionGUID: QzDcs2SaR7ex5JLtW2JcTQ==
X-CSE-MsgGUID: XTX2IVRsTOGS4QzQK2XsMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58601706"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58601706"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:26:50 -0800
X-CSE-ConnectionGUID: L2jYOjjYQIS8GrPNMvvdNw==
X-CSE-MsgGUID: laHDoFzuSw644Hq/mabelg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121374089"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 24 Feb 2025 09:26:47 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Feb 2025 19:26:45 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] drm/i915/dp: Implement POST_LT_ADJ_REQ
Date: Mon, 24 Feb 2025 19:26:36 +0200
Message-ID: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
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
this so I wasn't able to test anything. Hopefully CI has
something...

Ville Syrjälä (9):
  drm/dp: Add definitions for POST_LT_ADJ training sequence
  drm/dp: Add POST_LT_ADJ_REQ helpers
  drm/i915/dp: Clear DPCD training pattern before transmitting the idle
    pattern
  drm/i915/dp: Have intel_dp_get_adjust_train() tell us if anything
    changed
  drm/i915/dp: Implement the POST_LT_ADJ_REQ sequence
  drm/i915/dp: Move intel_dp_training_pattern()
  drm/i915/dp: Implement .set_idle_link_train() for everyone
  drm/i915/dp: Make .set_idle_link_train() mandatory
  hax: drm/i915: Disable TPS4 support to force POST_LT_ADJ_REQ usage

 drivers/gpu/drm/display/drm_dp_helper.c       |   8 +
 drivers/gpu/drm/i915/display/g4x_dp.c         |  33 ++-
 .../drm/i915/display/intel_dp_link_training.c | 267 +++++++++++++-----
 .../drm/i915/display/intel_dp_link_training.h |   4 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   2 +-
 include/drm/display/drm_dp.h                  |   3 +
 include/drm/display/drm_dp_helper.h           |   8 +
 7 files changed, 253 insertions(+), 72 deletions(-)

-- 
2.45.3

