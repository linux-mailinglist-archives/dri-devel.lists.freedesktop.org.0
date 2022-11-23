Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C338636D25
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 23:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF48610E64C;
	Wed, 23 Nov 2022 22:31:34 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E6610E64B;
 Wed, 23 Nov 2022 22:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669242687; x=1700778687;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4p0S7fAdbY/DpiS70ytQLqUpWFOuxarhMB4X4/2BBQo=;
 b=NtoUmnBZP/102iG3OY3RAVMIgjS1oFv49nbqNk6LkGnzwXPrGeWju9K9
 JQITYS7yEla0fXK9nVSMxvQO82fqyMCVhxS4zj4KDZWTsbNpLI0sn6bNj
 5O25X36DwdMVUiM0vcgoWz/QspVr5L2+Vsg4G3jUBYpa0KZzcI76HRArQ
 zwlF9ULQK8nWlktLQdwUMpAlJZczNYiCFhpyG+FtrJaDbokmmFECdgs5S
 RxnnLUkm18EkUddKCDASVMCXiHxj9jtZyj+xJIsxBE1G5XeWeJ398/SS7
 i5lqTXZixWEyzAIkl4E9Q7WVAjI+bnudd/8ayHKdRA9JLWfHDLLhwIlrU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="314204548"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="314204548"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 14:31:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="642012960"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="642012960"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by orsmga002.jf.intel.com with ESMTP; 23 Nov 2022 14:31:13 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/3] More GuC firmware version improvements
Date: Wed, 23 Nov 2022 14:31:05 -0800
Message-Id: <20221123223108.1696415-1-John.C.Harrison@Intel.com>
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

