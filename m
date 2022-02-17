Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17EF4BAD80
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 00:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E341C10E90A;
	Thu, 17 Feb 2022 23:52:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A35B10E17D;
 Thu, 17 Feb 2022 23:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645141929; x=1676677929;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N3RzBJO56VwywwBScoMldiEqURxaR18R2o7F6QMZm7g=;
 b=Nfehv9Bh4jxnHMJBEwiUduDgHpR0Sh/WPT7XeMPuEuGkAteQUejMwS69
 7Ncl54fsDTmWK/U9AvmJHfw175HXoZOiRaaNMhRjZH/ijVu2WsRIV41dY
 OBIr3zp7xmJODA7+p6xorkdaEJUpi1DY7DKqgpQ+8antsjZZzS38HDOEs
 FOcCv5PIXGgBgYVs8IiZp+vdVlQy8kII77bELHzNtiYek7Ly3NSTgNePp
 NWIYvKECgQ+/RGEt496fcxSOnLxNHmys92ucU3zWe3wO1mUjpgL8RWGhd
 70l6c6FeqELLoMGkqkkoWs2fUNVHNcQVT4SHKnZ/iGBicwJcm1kGH++VB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="311748990"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="311748990"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 15:52:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="545964424"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 17 Feb 2022 15:52:07 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/8] Prep work for next GuC release
Date: Thu, 17 Feb 2022 15:51:59 -0800
Message-Id: <20220217235207.930153-1-John.C.Harrison@Intel.com>
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

