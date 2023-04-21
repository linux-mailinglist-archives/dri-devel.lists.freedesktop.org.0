Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CBA6EA0EC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 03:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACC810ED79;
	Fri, 21 Apr 2023 01:15:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBDC10E12F;
 Fri, 21 Apr 2023 01:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682039732; x=1713575732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k9qp9DQdk40I3k5aHXnl9SXrFlYIABawPWZ+MtZgfME=;
 b=Jhda5lXhmFWHGUympkrzBv+Tfrb0RBRgjQLr/aephrHRlECy+bedTmED
 LUDNPPEDSNTpET7UcjszpWz2csX6NAgeuHSWbUD3791l2PuBzEN6Vb2Uk
 q+6reOPftO22Wk8tV8DnbXrzRFs5N5V3EY7xO2qp8m3AFHPqJNl25MYva
 N97oOw47yocQTB54sxIGKzraA9oXlOVBXE39rD3GhXCX87EPTmmZi9kS6
 UJlyGm8Dq74e/y23KogdaRZn6oj7dJKmYcT3FKoSxTNVFLM7iWvjholQo
 aNKJnHBLdK8fP2JtA4OTEMn151TT6B68cTU4EQsjPoO/hqZbAry7Oz0cD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="343380935"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="343380935"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 18:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="692114479"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="692114479"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 20 Apr 2023 18:15:30 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/6] Improvements to uc firmare management
Date: Thu, 20 Apr 2023 18:15:19 -0700
Message-Id: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
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

Enhance the firmware table verification code to catch more potential
errors and to generally improve the code itself.

Track patch level version even on reduced version files to allow user
notification of missing bug fixes.

Detect another immediate failure case when loading GuC firmware.

Treat more problems as fatal errors, at least for DEBUG builds.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (6):
  drm/i915/guc: Decode another GuC load failure case
  drm/i915/guc: Print status register when waiting for GuC to load
  drm/i915/uc: Track patch level versions on reduced version firmware
    files
  drm/i915/uc: Enhancements to firmware table validation
  drm/i915/uc: Reject duplicate entries in firmware table
  drm/i915/uc: Make unexpected firmware versions an error in debug
    builds

 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  12 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 224 +++++++++++-------
 3 files changed, 154 insertions(+), 83 deletions(-)

-- 
2.39.1

