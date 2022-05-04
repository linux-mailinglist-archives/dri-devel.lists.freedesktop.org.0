Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5238A51AFAC
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 22:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BE110E107;
	Wed,  4 May 2022 20:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCB010E107;
 Wed,  4 May 2022 20:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651697306; x=1683233306;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wjzLA7fLQTKn1lLXeVC95KihcNbZA4xnpseTgutqFew=;
 b=mk+GOvk7EVkJ7rBYMV2fNiJfnExVfnOwOTGQw02CQJp0adOH7U5aTmEY
 J03p5SQNucUv8gXfz1l3doqCmnPd1+XWsa79p37hd/T/oIja7rOiFJIMf
 xMMEv02r6N4ey4P/sxeSyolNYfFo5E+Oy+dUOmWfP6EZwG3VleyBo5vjO
 uDpi6sDQn6/qGGF3rCB5CgAcLw73VLlJBmztOmIoIep/0VKZtLgGhMKA7
 w/cMy0Dks/uUjJcVCEQLs1WIqPu9tcxH7D/5Ir5rsiZKPetCGCFAytgwy
 F3LFlNsXAmcm1CU3kVUe5+g0+JoIyFxpemOy8DyqyuTpeVmc4Y69bMvRC g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="267489075"
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="267489075"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 13:48:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="811292702"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 13:48:25 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/i915: Prepare for GSC-loaded HuC
Date: Wed,  4 May 2022 13:48:12 -0700
Message-Id: <20220504204816.2082588-1-daniele.ceraolospurio@intel.com>
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
Cc: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On newer platforms (starting DG2 G10 B-step and G11 A-step), ownership of
HuC loading and authentication has been moved from the GuC to the GSC, with
both actions being performed via a single PXP command.
Given that the mei code has not fully landed yet (see [1]), we can't
implement the new load mechanism, but we can start getting ready for it
by taking care of the changes required for the existing code:

- The HuC header is now different from the GuC one. This also means that
  if the FW is for GSC-loading and the HW fuse is set to legacy load (or
  vice-versa) we can't load the HuC.

- To send a PXP message to the GSC we need both MEI_GSC and MEI_PXP.

- All legacy HuC loading paths can be skipped.

Note that the HuC fw version for DG2 is still not defined, so the HuC
code will be skipped until the define is added.

v2: drop changes in auth checking for legacy paths.

[1] https://patchwork.freedesktop.org/series/102339/

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>

Daniele Ceraolo Spurio (4):
  drm/i915/huc: drop intel_huc_is_authenticated
  drm/i915/huc: Add fetch support for gsc-loaded HuC binary
  drm/i915/huc: Prepare for GSC-loaded HuC
  drm/i915/huc: Don't fail the probe if HuC init fails

 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h   |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c       | 97 +++++++++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_huc.h       |  5 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c    |  5 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c        | 22 +++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c     | 99 ++++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h     |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h |  9 ++
 8 files changed, 172 insertions(+), 68 deletions(-)

-- 
2.25.1

