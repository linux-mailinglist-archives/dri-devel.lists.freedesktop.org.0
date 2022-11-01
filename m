Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6579614707
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 10:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE4D10E34E;
	Tue,  1 Nov 2022 09:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3F910E345;
 Tue,  1 Nov 2022 09:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667295746; x=1698831746;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C8Dl5Vupa9emkqQl5IaPeibMPs8pJern5TCmcMw2AAg=;
 b=CiAvCmxoIBP0lNdP57Kqxe3eaX2g0wprniUnhRZxfVJ1jjrBRw5yWLnY
 lzzZkzfb16SgCwVNsV8QfYK7xaMPtQUGmSxOrgfhQtw1D5mRDC9n125st
 8zGVJm39moYn5Chu+1906moveTiODcEDbRm0tOoHKvB6JK2rbEJBPI1Om
 Fi+izYyevJFgbxyvSGwrDn2sqai4FiD3hpsyfqyBYbnJRyv2GD8J97+bK
 CGHQQF07SvYShv0VeYd6JR+MM4CcUQBynvpBQtZzLaWK+huzIcEYPTr3S
 J5sKKyQQLNUAkL2kTpq3kyZYfR2/Xnn7wwcOXR12GF6uWi/16TpQCVOc9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="373317402"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="373317402"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 02:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="963076256"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="963076256"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga005.fm.intel.com with ESMTP; 01 Nov 2022 02:42:23 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/6] Add DP MST DSC support to i915
Date: Tue,  1 Nov 2022 11:42:16 +0200
Message-Id: <20221101094222.22091-1-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: manasi.d.navare@intel.com, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we have only DSC support for DP SST.

Stanislav Lisovskiy (6):
  drm: Add missing DP DSC extended capability definitions.
  drm/i915: Fix intel_dp_mst_compute_link_config
  drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to separate
    function
  drm/i915: Add DSC support to MST path
  drm/i915: Extract VESA DSC bpp alignment to separate function
  drm/i915: Bpp/timeslot calculation fixes for DP MST DSC

 drivers/gpu/drm/i915/display/intel_dp.c     | 142 +++++++-----
 drivers/gpu/drm/i915/display/intel_dp.h     |  19 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 236 ++++++++++++++++++--
 include/drm/display/drm_dp.h                |   9 +-
 4 files changed, 333 insertions(+), 73 deletions(-)

-- 
2.37.3

