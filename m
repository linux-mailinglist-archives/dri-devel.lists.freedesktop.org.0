Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F5B9E257C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA9610EA81;
	Tue,  3 Dec 2024 16:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYhVbOUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E50410EA81;
 Tue,  3 Dec 2024 16:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733241705; x=1764777705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IBt0zdjIG2M4j7yfCoXZQVIiWRGbFzvUILZeItIpcx8=;
 b=KYhVbOUkYkSJJND8814/b81FgqxNvtGXoP/p/bu484j+n36xbkYTnnIy
 rNFQYw2SLMLGyMxVm1GVEGCY20YtRzOiAs1wxBxZ//HtPtOOdp+l6NcWX
 2UCGqA0SoJ4/nf3yZ1C/ak8l++MO6kWOUN+MPEZdS9UF8yz4FiTenZ7nw
 C7khj+5uWgNWUoCT6eorAMAmcMGsUOSDTWcFtCvkGQnWstdBQNLvmbxtk
 rgi1vcqHFACnIwxnx2kMJMy6FyMxw8dpbEJb/xvTAryLIEDMV1x8m9c1B
 vuHkCwcWedtA2ZILUdpXetbisMAKgZ2fyTa/a3zc8fscq6rQo4s3i09bZ A==;
X-CSE-ConnectionGUID: tsdE0D5xSdeP7YG646NV6g==
X-CSE-MsgGUID: ftW6zSDuRU2IexoM2u3rNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37236017"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="37236017"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:45 -0800
X-CSE-ConnectionGUID: htA1bWNGTFKX8fQyqHRTpA==
X-CSE-MsgGUID: +aQVg58wSoShwfpvf5JxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="93313023"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:43 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH 0/7] drm/dp_mst: Fix a few side-band message handling issues
Date: Tue,  3 Dec 2024 18:02:16 +0200
Message-ID: <20241203160223.2926014-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
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

This patchset fixes a few issues related to MST side-band message
handling reported by IGT CI (patch 1), by a user (patch 2) and ones I
noticed during debugging (patch 4-6). 

Cc: Lyude Paul <lyude@redhat.com>

Imre Deak (7):
  drm/dp_mst: Fix resetting msg rx state after topology removal
  drm/dp_mst: Verify request type in the corresponding down message
    reply
  drm/dp_mst: Simplify error path in drm_dp_mst_handle_down_rep()
  drm/dp_mst: Fix down request message timeout handling
  drm/dp_mst: Ensure mst_primary pointer is valid in
    drm_dp_mst_handle_up_req()
  drm/dp_mst: Reset message rx state after OOM in
    drm_dp_mst_handle_up_req()
  drm/dp_mst: Use reset_msg_rx_state() instead of open coding it

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 100 ++++++++++++++----
 include/drm/display/drm_dp_mst_helper.h       |   7 ++
 2 files changed, 87 insertions(+), 20 deletions(-)

-- 
2.44.2

