Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB46263CBB4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 00:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A802810E27F;
	Tue, 29 Nov 2022 23:20:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF56710E069;
 Tue, 29 Nov 2022 23:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669764027; x=1701300027;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QM8J3vzEwAxVHRSSoN0CoZ7/XNa/PP28ZOFopYhnDAQ=;
 b=Hef0zJlsS3oSKhkcOeD/6uGssdqSnPGVTJQkVrATQCZ0HgXPmi9gU+Ah
 lzi1vcxPEbkyyLVEwDqZwRO5aJJ1Pt7TXSHHqKgb4sBDw2u9acyGlHnpc
 TnzpOhMMREtTS03FmjCfgngschovktxGltU6H6vyd4WTJtSGBXGkVdzDm
 C8JGczjyv2Q7o9T0OvxcLwIwTRP5DCur4iNS52mKCy5NJL10Lg59vW8SS
 tvzgW/0JOT69amfGKqOxoKML+UPGcp4Zo8q+0ECjpvcRPeK+Nmni5+FPo
 koH2rgRlWPotr1qxKdKOrHRRQ3fWnIRRwaczpvi9wQWF0A1JkhqKJLuQA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="295616529"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="295616529"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 15:20:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="818408126"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="818408126"
Received: from relo-linux-5.jf.intel.com ([10.165.21.143])
 by orsmga005.jf.intel.com with ESMTP; 29 Nov 2022 15:20:26 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 0/3] More GuC firmware version improvements
Date: Tue, 29 Nov 2022 15:20:28 -0800
Message-Id: <20221129232031.3401386-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
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

Start using the 'submission API version' for deciding which GuC API to
use in the submission code.

Correct version number manipulation code to support full 32bit
major/minor/patch components, except for GuC which is guaranteed to be
8bit safe.

Other minor code clean ups around version number handling.

v2: Fix some typos, better naming, an extra comment and a bunch of
refactoring of the GuC version number handling (review feedback by
Daniele)
v3: Fix function name typo (review feedback by Daniele)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/i915/uc: Rationalise delimiters in filename macros
  drm/i915/uc: More refactoring of UC version numbers
  drm/i915/guc: Use GuC submission API version number

 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  11 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  15 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 206 +++++++++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  15 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   3 +-
 6 files changed, 183 insertions(+), 73 deletions(-)

-- 
2.37.3

