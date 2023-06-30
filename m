Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BB5744345
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C4710E4F6;
	Fri, 30 Jun 2023 20:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C638410E193;
 Fri, 30 Jun 2023 20:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688157331; x=1719693331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q5GP83fj5B9aWy/8l9bn3Bd0nXunP5ZzIXVBy8/6EQY=;
 b=VQezhrJnT1F8/sl/BZqO2oHaYL+3GyrCrOGlk8JPSZGONsGd/fr8wtLe
 RcRyaO6di8mf9CGDu9hc72klzUprT9tLQmXNvuMj+TD44y2iF3DdbFlth
 5VMBvGXGTQaVGGk/Ze192ra7fTxoPxDylaSTF/pJDF7FYznRhJFpFmSx/
 C5Mqdc2c7jQQuuiALtX6PxJ37/RFv29WAu45YzhDPso2SgSh5tRk6A3C/
 ftIuMoXW8LLQMgAf982ZWdEqt5IZ0eOOQurC0og8KiND5gIdhxRszoS1J
 zdkpM2wxgbTCLQE5i+3rHlS88NXkEbo1NTTr02LjP3548N4xVsD3gecfH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="393213904"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="393213904"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="807904240"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="807904240"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/7] Fix ctx workarounds for non-masked regs
Date: Fri, 30 Jun 2023 13:35:02 -0700
Message-Id: <20230630203509.1635216-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v3 of https://patchwork.freedesktop.org/series/119766/

Changes from v2:

	- Do not rmw if (clr | set) covers all bits
	- Add patch to make sure the set bits are also checked on
	  wa_*_clr_set() when clr is not a superset.

Tested on DG2 with intel_reg reading 0xb158 with a busy render engine.
Now it's not losing the upper bit anymore.

Lucas De Marchi (7):
  drm/i915/gt: Move wal_get_fw_for_rmw()
  drm/i915/gt: Clear all bits from GEN12_FF_MODE2
  drm/i915/gt: Fix context workarounds with non-masked regs
  drm/i915/gt: Drop read from GEN8_L3CNTLREG in ICL workaround
  drm/i915/gt: Enable read back on XEHP_FF_MODE2
  drm/i915/gt: Remove bogus comment on IVB_FBC_RT_BASE_UPPER
  drm/i915/gt: Also check set bits in clr_set()

 drivers/gpu/drm/i915/gt/intel_workarounds.c | 129 ++++++++++----------
 1 file changed, 66 insertions(+), 63 deletions(-)

-- 
2.40.1

