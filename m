Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A71144C3A07
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 01:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3914410E1AE;
	Fri, 25 Feb 2022 00:06:25 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7815810E13C;
 Fri, 25 Feb 2022 00:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645747584; x=1677283584;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RgPVHmvJcBWZczW988FexdCL58TQFle09NGR1TDYvZI=;
 b=Cum22c9Gu14xLYrdw+Lpd2lcJVu2LFoCvk9pzS+/TwACcEislUKyONUi
 yRS61dS15oc3C5NOlNGO/62BjSB5mxY7K1ZYIHMfIl2CcZHK0q111RTvU
 NDsJNyKUfwPE0ScENn+9seW2NtW8K+w+EfI8RV4YF3YxK9f7vGdHX5eR6
 0SRLDosgmgeWXNWUyzs8a6o4yKeC4RoVOqdAL8WHNtrFXBTBzjxStWKD0
 wQYtGGLJ8fIfheT1Fm8I3Z2gkU9PNwI4dvCx/DZvpLCqBeK6rt5uN3iTn
 bH9BaBskyXDfhzL4mdUEobC5Rd/qOYP6yL4fNJcSU/tjbF9lWUGvi75Id g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277012934"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="277012934"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 16:06:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="592278952"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2022 16:06:23 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/8] Prep work for next GuC release
Date: Thu, 24 Feb 2022 16:06:15 -0800
Message-Id: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
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

The next GuC firmware release includes some significant backwards
breaking API changes. One such is that there is no longer an LRC
descriptor pool. A bunch of prep work for that change can be done in
advance - the descriptor pool was being used for things it shouldn't
really have been used for anyway.

v2: Extend commit message on 'better name' patch. Improve 'split
apart' patch to include some necessary re-arrangement that was in a
later patch and which introduced an unnecessary conditional in said
patch too. (review feedback from Daniele)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (8):
  drm/i915/guc: Do not conflate lrc_desc with GuC id for registration
  drm/i915/guc: Add an explicit 'submission_initialized' flag
  drm/i915/guc: Better name for context id limit
  drm/i915/guc: Split guc_lrc_desc_pin apart
  drm/i915/guc: Move lrc desc setup to where it is needed
  drm/i915/guc: Rename desc_idx to ctx_id
  drm/i915/guc: Drop obsolete H2G definitions
  drm/i915/guc: Fix potential invalid pointer dereferences when decoding
    G2Hs

 drivers/gpu/drm/i915/gt/intel_context.c       |   2 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   2 -
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   4 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 181 ++++++++++--------
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |   2 +-
 6 files changed, 109 insertions(+), 84 deletions(-)

-- 
2.25.1

