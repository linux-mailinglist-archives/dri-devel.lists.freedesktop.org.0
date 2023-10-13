Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71DB7C867B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 15:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F36D10E607;
	Fri, 13 Oct 2023 13:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA2210E605;
 Fri, 13 Oct 2023 13:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697202848; x=1728738848;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N3mGGsdOth2TI2025hUOXWJkAR6bf5/rY24ZTrn6AYE=;
 b=jz1Nx7DPRxnkoUnNmmTPXzIKOAXXuzHVkD7Se49354Bp5C07i0FagNFm
 CSEudPO96JLttAVkPzLdE4/2fCyMFvQojDaoZNkygCIkhNGHBGHqHVvlB
 D2U7HZZkHIjglTNf7lV8xwe+WYLRVg7jhyvDn+TAN2WSZcyAqE9LXXPSJ
 FYVNBDpgN818KPkJD1Wd6LC/s+o1alXH3fUKlo9AS43hSJQk7HnAirr+2
 ty5mREbfTn6U+0nROeLBKYK24VCA0n00BMUUbcwBLXgcfX+IsmsTPb7w3
 1XnYpS5V+KOVNU7CD0QZji+4TjtAiGuQrnpiGNVX/ptH/8+iv79V1i/O0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="449370183"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="449370183"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 06:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086135996"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="1086135996"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmsmga005.fm.intel.com with SMTP; 13 Oct 2023 06:14:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Oct 2023 16:14:02 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] drm/i915: Fix LUT rounding
Date: Fri, 13 Oct 2023 16:13:58 +0300
Message-ID: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
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

The current LUT rounding is generating weird results. Adjust
it to follow the OpenGL int<->float conversion rules.

Ville Syrjälä (4):
  drm: Fix color LUT rounding
  drm/i915: Adjust LUT rounding rules
  drm/i915: s/clamp()/min()/ in i965_lut_11p6_max_pack()
  drm/i915: Fix glk+ degamma LUT conversions

 drivers/gpu/drm/i915/display/intel_color.c | 70 +++++++++++-----------
 include/drm/drm_color_mgmt.h               | 18 +++---
 2 files changed, 42 insertions(+), 46 deletions(-)

-- 
2.41.0

