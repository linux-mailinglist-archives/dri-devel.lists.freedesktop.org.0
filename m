Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48286DE73A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E31010E047;
	Tue, 11 Apr 2023 22:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3232B10E047;
 Tue, 11 Apr 2023 22:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681252175; x=1712788175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LD/p6qjIwLB8a5SKDwBosKm3wSOauZdkN6nECOoWQ/E=;
 b=USw+48dV+NoXwWCdm9r5tEawq0Ei9mwNVBjXbjC9ExsrR3ppx9GSg47q
 AziMwkpRANSMVCHHWR1hEfAF5BLpep4nqx0qqunxlIVnFVJlDcrQCxlMU
 3o1w+DHv9OYQSLWyRya5Bm1BGm5bsEKj3A3mO/gSXVeGwoMrYRnodJ982
 kKHeL/wPrKJAvxpxO2CJ0By/GmJaz+5BMFKTcTIpVnp2nK96WbosI0euI
 EOs2WgS06GdD4Ih//ukjYY6Ti6wK/LuDqagwrPqOSAOivZK80VqHu4q86
 Zyj4OdKRpPIFNnpv6BMPjifM5+zItdyWwaPocDlrZura27aXX5H/ksb9R g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="342506212"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="342506212"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 15:29:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="753296787"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="753296787"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga008.fm.intel.com with SMTP; 11 Apr 2023 15:29:32 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Apr 2023 01:29:31 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/6] drm/i915: CTM stuff mostly
Date: Wed, 12 Apr 2023 01:29:25 +0300
Message-Id: <20230411222931.15127-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Mostly some CTM stuff:
- document the uapi better
- fix CHV CSC negative coefficients
- expose CTM on ilk/snb/vlv
- a bonus gamma patch for gen3

Test-with: 20230411161555.10001-1-ville.syrjala@linux.intel.com

Ville Syrjälä (6):
  drm/uapi: Document CTM matrix better
  drm/i915: Expose crtc CTM property on ilk/snb
  drm/i915: Fix CHV CGM CSC coefficient sign handling
  drm/i915: Implement CTM property support for VLV
  drm/i915: No 10bit gamma on desktop gen3 parts
  drm/i915: Do state check for color management changes

 drivers/gpu/drm/i915/display/intel_color.c    | 216 ++++++++++++++++--
 .../drm/i915/display/intel_crtc_state_dump.c  |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   8 +
 .../drm/i915/display/intel_display_types.h    |   3 +
 .../drm/i915/display/intel_modeset_verify.c   |   2 +
 drivers/gpu/drm/i915/i915_pci.c               |   8 +-
 drivers/gpu/drm/i915/i915_reg.h               |  15 ++
 include/uapi/drm/drm_mode.h                   |   5 +
 8 files changed, 241 insertions(+), 22 deletions(-)

-- 
2.39.2

