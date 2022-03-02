Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274F4C99E7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B8810E6D0;
	Wed,  2 Mar 2022 00:33:59 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0940F10E1D5;
 Wed,  2 Mar 2022 00:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646181238; x=1677717238;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JbVPYhzmaYYdyxSADxCkR2AqersbJkO87R8zJFh7sOk=;
 b=VaLolDXTDmmP7TjQrXv2iNNPmPzDbWqXZeHRG08lnPZj+GoCjGDsHjjW
 KbhRhoU8IrFZLSpZYOIoiSXzdjJIm0zEXUZgU/XrdDx7O8ZBBHhYJF23P
 ceopbyWVt87tqmBwNqus/45YKVgNn+R7mjOU5T+nx6HqLNRbjIGa8WD4m
 AN6aLoDl6KR77VKGLjEhWdt7yBJ0Ybn/zTAH945uFODw0HNBOapVuOyT5
 AQQd3ljyf0mQCinueFLdsIzWZ66oIN8IYv2tFtgb5c8UcuRlqrdmsgjH2
 YboU1tRPL8KEy7ZhL+qxpI4X2rtnLHKMBREmXlMVPSilYk/Ka47cmik1E A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233243136"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233243136"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 16:33:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="639577364"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2022 16:33:57 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 0/8] Prep work for next GuC release
Date: Tue,  1 Mar 2022 16:33:49 -0800
Message-Id: <20220302003357.4188363-1-John.C.Harrison@Intel.com>
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

v3: Rebase to newer tree.

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

