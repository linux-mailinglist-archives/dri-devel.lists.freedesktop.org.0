Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CCA73CC04
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 19:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E330810E1BA;
	Sat, 24 Jun 2023 17:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C169F10E009;
 Sat, 24 Jun 2023 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687627079; x=1719163079;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fNAtJFpWgHKdR9l/7y488NYU/xBjPGHiswY+lPLtCag=;
 b=JrhtqH83pXwco3nM7kZEaZ+Q2+mjEK4jCYIutWqx6tqYRBpcttpJ9jAt
 1NSquTT9LvzYrLF9da92jkaKs/LBXx8M64la8CoraEcxyGIock9kfszdr
 lnYE3wqWH5lzQjUJB0vNiJCvzwCah3EFnlIQDSXkiEuvNGvxV1LtbYJiD
 umQxBOp3T7xxwgKMlkyn4dC0xV5kpPTckhNhCeoLUKZXjtcxoV0685bWe
 L1o1mbLb77yg7zZ3lsTJHw5ymJmEusonKLMf0liUTzrQXb8D5KfeRor9f
 zBTN8gfUbzkUMCz8U0TSyGpIGs+rbEbz4cTxsKEK2Umr7j8Nc7gDhKIur g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="340557464"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; d="scan'208";a="340557464"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2023 10:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="1045977409"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; d="scan'208";a="1045977409"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2023 10:17:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/6] Fix ctx workarounds for non-masked regs
Date: Sat, 24 Jun 2023 10:17:51 -0700
Message-Id: <20230624171757.3906095-1-lucas.demarchi@intel.com>
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

v2 of https://patchwork.freedesktop.org/series/119766/

Main change from v1 is the preparatory patch to handle GEN12_FF_MODE2.
This is a register that can't be read back since it's affected by
another workaround.

Also add some other cleanups/fixes nearby. Tested on DG2 with intel_reg
reading 0xb158 with a busy render engine. Now it's not losing the upper
bit anymore.

Also removed the Cc to stable. This will be handled separately once the
patch is merged. With graphics version 12 not being affected, this needs
to be backported only to kernel versions after DG2/MTL started to be
supported. But in that case the preparatory patch would also need to be
backported so it doesn't branch graphics version 12.

Lucas De Marchi (6):
  drm/i915/gt: Move wal_get_fw_for_rmw()
  drm/i915/gt: Clear all bits from GEN12_FF_MODE2
  drm/i915/gt: Fix context workarounds with non-masked regs
  drm/i915/gt: Drop read from GEN8_L3CNTLREG in ICL workaround
  drm/i915/gt: Enable read back on XEHP_FF_MODE2
  drm/i915/gt: Remove bogus comment on IVB_FBC_RT_BASE_UPPER

 drivers/gpu/drm/i915/gt/intel_workarounds.c | 124 ++++++++++----------
 1 file changed, 63 insertions(+), 61 deletions(-)

-- 
2.40.1

