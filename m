Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26CA700064
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 08:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD8210E4DF;
	Fri, 12 May 2023 06:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB53010E4DF;
 Fri, 12 May 2023 06:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683872931; x=1715408931;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R1MIFQUX6uKQINUybQbhHLOah/Ad4npiKVHgZk1yr5s=;
 b=jkkOJFmOFLGruE+rArx3JD0OmbYtqabeocPR0pzfTuVfGcKXCjsFVPwZ
 dELyV5J/GibnPSudWv/j+RMrQ8vSJtrfSctarcgzx/hpFpeZJaqK0ZdmZ
 ezNdpAPRteZQnfN9v0JJgehV1YzITgi2Asd3azMGQp8NyCeK0WgE7Eidx
 5/2uORPHVkY8KNrq9vndW4LWIh7qUICXxtt9GpJDU6gkFZzuc3hf+/T2i
 R6nORZWqU9QKcsS0E4oJNxKDfoAX6FlJcWG5jZaEfjzwKlBBya6wPNuKT
 T838hKdbXrWK4SCKLfkuuEqO+KFcY4aGJP5FkHHkdRfAfl9qZO4bBuvUK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="350741915"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="350741915"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="811941227"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="811941227"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:28:48 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/13] DSC misc fixes
Date: Fri, 12 May 2023 11:54:04 +0530
Message-Id: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is an attempt to address multiple issues with DSC,
scattered in separate existing series.

Patches 1-3 are DSC fixes from series to Handle BPC for HDMI2.1 PCON
https://patchwork.freedesktop.org/series/107550/

Patches 4-5 are from series DSC fixes for Bigjoiner:
https://patchwork.freedesktop.org/series/115773/

Patches 6-12 are from series to add DSC fractional BPP support:
https://patchwork.freedesktop.org/series/111391/

Patch 13 is to fix compressed bpc for MST DSC, from Stan's series :
https://patchwork.freedesktop.org/series/116179/

Ankit Nautiyal (12):
  drm/i915/dp: Consider output_format while computing dsc bpp
  drm/i915/dp_mst: Use output_format to get the final link bpp
  drm/i915/dp: Use consistent name for link bpp and compressed bpp
  drm/i915/dp: Update Bigjoiner interface bits for computing compressed
    bpp
  drm/i915/intel_cdclk: Add vdsc with bigjoiner constraints on min_cdlck
  drm/i915/dp: Remove extra logs for printing DSC info
  drm/display/dp: Fix the DP DSC Receiver cap size
  drm/i915/dp: Avoid forcing DSC BPC for MST case
  drm/i915/dp: Check min bpc DSC limits for dsc_force_bpc also
  drm/i915/dp: Avoid left shift of DSC output bpp by 4
  drm/i915/dp: Rename helpers to get DSC max pipe_bpp/output_bpp
  drm/i915/dp: Get optimal link config to have best compressed bpp

Stanislav Lisovskiy (1):
  drm/i915: Query compressed bpp properly using correct DPCD and DP Spec
    info

 drivers/gpu/drm/i915/display/intel_cdclk.c  |  49 ++-
 drivers/gpu/drm/i915/display/intel_dp.c     | 408 +++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_dp.h     |  20 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  76 ++--
 include/drm/display/drm_dp.h                |   2 +-
 5 files changed, 401 insertions(+), 154 deletions(-)

-- 
2.25.1

