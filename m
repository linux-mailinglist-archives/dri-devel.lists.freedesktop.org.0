Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA0E634533
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C83110E455;
	Tue, 22 Nov 2022 20:09:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAB310E1D9;
 Tue, 22 Nov 2022 20:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669147764; x=1700683764;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QjhOcRyuKZxwtyPzGdapyZa/nYZN8ckwvHZ4/FbiN1g=;
 b=EzGzNoIIJ3Ziu11CevfhQyIiSCSOwGtQWH4jqpk+N1ZVdJOUtF6cqUVS
 HPUzOBInKIlR3F2yHgV3i7+Kejb2FMnMjD7Zcgw2Z1jWdVYMz7F8dwCFf
 FKbgs0XsUFqS2nxjl72aFYJi71ZQ0JECAoTX/A3MeVSH6pP9mKlnOa+w6
 oDo6ewW7jUOWmNUUPFMGHoz32JLaa2tlRr7QwNWfIoZNsSJoWBZKs/0JR
 8sROAlLOKG7uL1ux65ZBPsLRT/nuWodleKjRALAFQzpEkU63rzUL97a8r
 QwGcgegwuS7rGjFgwFhfOJYJcJINJiHzAFlGquJ+qnd5a6Qo9au8C2CPQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="301459450"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="301459450"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:09:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="783966947"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="783966947"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2022 12:09:22 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/3] More GuC firmware version improvements
Date: Tue, 22 Nov 2022 12:09:12 -0800
Message-Id: <20221122200915.680629-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/i915/uc: Rationalise delimiters in filename macros
  drm/i915/uc: More refactoring of UC version numbers
  drm/i915/guc: Use GuC submission API version number

 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  11 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  15 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 173 ++++++++++++------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  15 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   3 +-
 6 files changed, 150 insertions(+), 73 deletions(-)

-- 
2.37.3

