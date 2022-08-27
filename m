Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B35A3365
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 03:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A0910EADC;
	Sat, 27 Aug 2022 01:17:01 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED5E10E98F;
 Sat, 27 Aug 2022 01:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661563018; x=1693099018;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U5wHK6cn/w1DPvN10flIV3T93gKIJNB9gDmqUf/BjK4=;
 b=aFRy5jqWp924q6CkQI4kHsvZDGduFcjYxXkLU8MkyhZr+9YbXv5YtTqT
 FHLdhYZHpuzMxPwn9kIUxfgLtg9yNkfYyTLvcjLGVcvBILRat8RqtqrSV
 a4avl1clHZIZghcY4mGeUMJwsg0SYZuYWP0ip7np5o12laydI+KhZHQJj
 KXe1SfW2VKX1Y5mgp0XIF0oXDdqZMoFRqJ4MoyO6kVYgz9n7GNwvBoQPh
 QxLg4Dl+Yos9zLIsl67uck2fiacbvSPbOqvnBi7PhFOxcMspXie4yUPJT
 9rmsRGvpoyuncAB4TqoH9ILoNAvSXuEGhtM4zzJ/jvSMLV05FsvOevTc8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="320733973"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="320733973"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 18:16:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="610741930"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 26 Aug 2022 18:16:57 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 0/3] Drop version numbers from firmware files
Date: Fri, 26 Aug 2022 18:16:59 -0700
Message-Id: <20220827011702.3465334-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Upstream direction is to include the bare minimum of version numbers
in firmware files and to replace them in the repo rather than
accumulating them. For HuC, that means going completely versionless.
For GuC, the major version needs to be kept as that indicates a break
in backwards compatibility with the KMD.

v2: Fix a bunch of issues and add better documentation (some found in
code review by Daniele, other through more thorough testing).
v3: Fix GSC HuC version field and a comment type (review feedback from
Daniele).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>


John Harrison (3):
  drm/i915/uc: Support for version reduced and multiple firmware files
  drm/i915/uc: Add patch level version number support
  drm/i915/uc: Enable version reduced firmware files for newest
    platforms

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 468 ++++++++++++------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  39 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   8 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  16 +-
 6 files changed, 358 insertions(+), 191 deletions(-)

-- 
2.37.2

