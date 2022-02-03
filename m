Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4427F4A8A07
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 18:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88BD10E50F;
	Thu,  3 Feb 2022 17:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDCF10E1ED
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 17:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643909398; x=1675445398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yWCBb5BDnUZ8M1t5Kc98dfQQt6hh5FJM+UtM7zgggyo=;
 b=Vx7NBJ9t9m3/Vo0G41Oct+lUWuSs/0gqrXAvpM49RK300BX6dVaLrehh
 cbFXeiy6RDHrAaLX+UAHJQAQ0kddHfPNVycn4SdQoWjQmV1ZHnjSH9vMh
 wbZyT1NysMa83gRMb2WlLUeJaip1FIAWgjE5eD2ee9zpnqHa18gYmYQ2N
 yzptApQvpdSMXmo6SNASo348aoipdB+Puy9pqVsT+5A4PJQZDbYKd0JDB
 yq+gT0Wb/fkJBWxWF9hF2DLzUP4X1qr6b8rzibYdNC2oGCLmKBBExT9cb
 mKhHX+v6hyibPmPeR7sbD/GtkKlWev7p8J9lN16nIU3Pxe3D5Tepy4yoF Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248411950"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="248411950"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 09:29:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="676844988"
Received: from jtvanhoo-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.132.101])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 09:29:57 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: gfx-internal-devel@eclists.intel.com
Subject: [PATCH v4 0/4] Use drm_clflush* instead of clflush
Date: Thu,  3 Feb 2022 09:29:49 -0800
Message-Id: <20220203172953.371921-1-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series re-work a few i915 functions to use drm_clflush_virt_range
instead of calling clflush or clflushopt directly. This will prevent errors
when building for non-x86 architectures.

v2: s/PAGE_SIZE/sizeof(value) for Re-work intel_write_status_page and added
more patches to convert additional clflush/clflushopt to use drm_clflush*.
(Michael Cheng)

v3: Drop invalidate_csb_entries and directly invoke drm_clflush_virt_ran 

v4: Remove extra memory barriers

Michael Cheng (4):
  drm/i915/gt: Re-work intel_write_status_page
  drm/i915/gt: Drop invalidate_csb_entries
  drm/i915/gt: Re-work reset_csb
  drm/i915/: Re-work clflush_write32

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c  |  8 +++-----
 drivers/gpu/drm/i915/gt/intel_engine.h          | 13 ++++---------
 .../drm/i915/gt/intel_execlists_submission.c    | 17 +++++------------
 3 files changed, 12 insertions(+), 26 deletions(-)

-- 
2.25.1

