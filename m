Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B24D6F4DB6
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 01:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A58110E123;
	Tue,  2 May 2023 23:39:59 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B818010E123;
 Tue,  2 May 2023 23:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683070797; x=1714606797;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P15+bT6tayxLocEgju6C2hLGN/oyVH9PLA9FlTAJ5rM=;
 b=En6iI5O0wJBW4iCIFcKLvn5zgnIZ83u3Kucnanz4d/zpIwU04UXP+lHe
 iHkdvEK/cUlJh1F6ISCiGLZcQrL8lgnaDjaqnPFVBTCnyJzspnE2DF0Lm
 9Zns8vZoQUT223dT0GeGk3SYFZNdGYt+XUls4jb0eLfthmj4t2n/AlVXU
 8mSM4FXoiJP000lhTB1uZLpgFmmL8+N/uEhnvvmpovw86R4oUSCB7Rqfw
 rqptAtZP5geIDnfnfm/rZs0JjmZQTcPNFdrDK1XEyuXDUq060FkE/KAtH
 H5hC72qKknfpsUlCvV9VecB83FW1HfGsBfIEHL7+LwFjAgkXjZUpuJ9zF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="350601509"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="350601509"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 16:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="673865807"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="673865807"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga006.jf.intel.com with ESMTP; 02 May 2023 16:39:56 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 0/6] Improvements to uc firmare management
Date: Tue,  2 May 2023 16:40:01 -0700
Message-Id: <20230502234007.1762014-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Enhance the firmware table verification code to catch more potential
errors and to generally improve the code itself.

Track patch level version even on reduced version files to allow user
notification of missing bug fixes.

Detect another immediate failure case when loading GuC firmware.

Treat more problems as fatal errors, at least for DEBUG builds.

v2: Use correct patch version number, drop redundant debug print
fail load on table validation error (review by Daniele / CI results).
v3: Fix spelling typos, use a new bool for invalid firmware tables
rather than a status enum (review feedback from Daniele).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (6):
  drm/i915/guc: Decode another GuC load failure case
  drm/i915/guc: Print status register when waiting for GuC to load
  drm/i915/uc: Track patch level versions on reduced version firmware
    files
  drm/i915/uc: Enhancements to firmware table validation
  drm/i915/uc: Reject duplicate entries in firmware table
  drm/i915/uc: Make unexpected firmware versions an error in debug
    builds

 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  12 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 227 +++++++++++-------
 5 files changed, 160 insertions(+), 84 deletions(-)

-- 
2.39.1

