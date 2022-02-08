Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AC84ACECC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 03:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535F810E3B5;
	Tue,  8 Feb 2022 02:20:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E40910E3B5;
 Tue,  8 Feb 2022 02:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644286855; x=1675822855;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N3RzBJO56VwywwBScoMldiEqURxaR18R2o7F6QMZm7g=;
 b=NG6j4/E3PAQ+HaBK8BoCAVcjXAk86QtXDLerOODf0TUo10JCxIFyXddJ
 URrdlooUZDKD2qf5Nj/DHbvAzDxlIH2jd88kWtxMil5bbRepMwepldIED
 tYtPDIpKOFSLCBwR5Kc99dax+nGEeRlRVAjoTMKlLBcwk1FhG4lcAur8z
 Epv7O2F7O2ePKrgKz7HZ3W2F9nzGbnm0TN0i+LmIyfgTJyVlEvRx1/f1M
 whVTteV6Oa3M16R0vRJIUMo0qIFs5HTPCZMDHXFkfFXV27eMIn7DQCP/Y
 /5cdqRyTxlMYX0ZouHVA96k7bXLWfdiuQHRHDBFzTmGXQq8Igk0BLprHG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="335257337"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="335257337"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 18:20:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="677960775"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 18:20:54 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/8] Prep work for next GuC release
Date: Mon,  7 Feb 2022 18:20:46 -0800
Message-Id: <20220208022054.2143332-1-John.C.Harrison@Intel.com>
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
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 183 ++++++++++--------
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |   2 +-
 6 files changed, 112 insertions(+), 83 deletions(-)

-- 
2.25.1

