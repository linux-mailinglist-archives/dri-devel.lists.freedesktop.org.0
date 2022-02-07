Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D004AB78A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 10:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4159C10E726;
	Mon,  7 Feb 2022 09:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F174010E6F8;
 Mon,  7 Feb 2022 09:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644226657; x=1675762657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+WjNyMOTWcU+/oGaKHLdJ9BlsLdtIhU/yeC5ZfjQ0n0=;
 b=jikDyqV7B2Dzd50npaL1InGQ0X1o0xefTWzsJxNAXOhKtS3ExguU3z/E
 Q6DXxucY3dOc09AfMk/BZ2ukRv5a3ehE2La7f4YZoA7wrvg0ZlCdiGRAz
 sSEbTwZS4p/O+oHhZ4HyYHWUjzdPOvz6W0a4GqKLSMfll7ycTNge6XO8F
 dGJ0p4YJifLlOQ3QXCVVfiHo/gFVu7jesfNgsL4rhgLdBQskLduDxsCWM
 +Cz5l3ejDT529mxtV6ES0z8sJn0hdtgqtVvqGEWrQNBrQNtruKYLK8RCe
 5oShDpSz3xakYPfu6NZCg1R4fIkjXmGGhXSmK9QgSxiOdBeM4t9cVs8Bm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="273200178"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="273200178"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:37:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="484360839"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:37:34 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [RFC 0/2] drm/i915/ttm: Evict and store of compressed object
Date: Mon,  7 Feb 2022 15:07:41 +0530
Message-Id: <20220207093743.14467-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On flat-ccs capable platform we need to evict and resore the ccs data
along with the corresponding main memory.

This ccs data can only be access through BLT engine through a special
cmd ( )

To support above requirement of flat-ccs enabled i915 platforms this
series adds new param called ccs_pages_needed to the ttm_tt_init(),
to increase the ttm_tt->num_pages of system memory when the obj has the
lmem placement possibility.

This will be on top of the flat-ccs enabling series
https://patchwork.freedesktop.org/series/95686/

For more about flat-ccs feature please have a look at
https://patchwork.freedesktop.org/patch/471777/?series=95686&rev=5

Testing of the series is WIP and looking forward for the early review on
the amendment to ttm_tt_init and the approach.

Ramalingam C (2):
  drm/i915/ttm: Add extra pages for handling ccs data
  drm/i915/migrate: Evict and restore the ccs data

 drivers/gpu/drm/drm_gem_vram_helper.c      |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  23 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c    | 283 +++++++++++----------
 drivers/gpu/drm/qxl/qxl_ttm.c              |   2 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c      |   2 +-
 drivers/gpu/drm/ttm/ttm_tt.c               |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |   2 +-
 include/drm/ttm/ttm_tt.h                   |   4 +-
 8 files changed, 191 insertions(+), 139 deletions(-)

-- 
2.20.1

