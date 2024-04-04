Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B6A898F99
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CAA11325E;
	Thu,  4 Apr 2024 20:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1fRZrUB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485D711325E;
 Thu,  4 Apr 2024 20:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712262821; x=1743798821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iMCxIxsnuriYwWTx8Vlt/bZxUxpvB8c5tOVCCIh9qV8=;
 b=J1fRZrUBwr9IVh4YC1iogP2F+57v9yjP6nGb+KaeNk5wdPetyo7o8uSp
 k7Y0DHn9GX7W8nmI0T2fq9SM1l2meU7Co10wNAqZN4o077qxsYFBLJgLy
 E5P1n/jyILqCVbl8GoJUDONERUNX+VbFfCeMXU/nnBTcPOT7pJLCXGbqZ
 0JfbDRIEH6XAfMLC/CLtCA48Sg9/paHptzevoJNED1wxVKQxWhkB0zv16
 3x4oRQ0SkSxrniiHaky7ovgKz0x+HMcDxp9jpY6hl5RVPEb7MZviS4pkp
 SKAX1yVT7fcWY1clKN+RHCc/RrCHFWKaQy4Yv/2nNmutuTt1/R0Wvf+/L g==;
X-CSE-ConnectionGUID: 5rm5wAQFRH6UGUFgbAVacQ==
X-CSE-MsgGUID: MuV02G3OTrqhaSOSb85iHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25019715"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25019715"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="827790577"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="827790577"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 13:33:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 23:33:36 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/12] drm/client: Use after free and debug improvements
Date: Thu,  4 Apr 2024 23:33:24 +0300
Message-ID: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

Various improvements to the drm/client code:
- Fix a use after free (fairly routinely hit by i915 CI)
- Debug print improvements
- Cleanups/etc.

Ville Syrjälä (12):
  drm/client: Fully protect modes[] with dev->mode_config.mutex
  drm/client:
    s/drm_connector_has_preferred_mode/drm_connector_preferred_mode/
  drm/client: Use drm_mode_destroy()
  drm/client: Add a FIXME around crtc->mode usage
  drm/client: Nuke outdated fastboot comment
  drm/client: Constify modes
  drm/client: Use array notation for function arguments
  drm/client: Extract drm_connector_first_mode()
  drm/client: Switch to per-device debugs
  drm/client: Use [CONNECTOR:%d:%s] formatting
  drm/client: Streamline mode selection debugs
  drm/probe-helper: Switch to per-device debugs

 drivers/gpu/drm/drm_client_modeset.c | 237 ++++++++++++++-------------
 drivers/gpu/drm/drm_probe_helper.c   |  35 ++--
 2 files changed, 137 insertions(+), 135 deletions(-)

-- 
2.43.2

