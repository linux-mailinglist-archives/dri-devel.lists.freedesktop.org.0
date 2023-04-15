Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3C26E2E09
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 02:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856D110EEE3;
	Sat, 15 Apr 2023 00:57:22 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AB910EEE1;
 Sat, 15 Apr 2023 00:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681520241; x=1713056241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4r1Rb6Hv5SpRFQ4zjuLX2Ge/nx7ANzRSIjEf8KVInPQ=;
 b=CKd7+hh1tUBel+gapKXy5DytKXe80n0tzbBItkJx46hcOuCqIF6z9xFT
 H2y1ZDgnLgNmBKf9FFDBLwoMeXjw9REktH9aZXqXWpdr+4d1JrvxQXl1j
 amfsJnExqg7kZB8hObpoRGW6kvycjYoSd1hCgfFBaCEIrMWN7wZzbFE7r
 qgsNK4UWUX62iW37breqZ9KKlzr+JhR++88fN9Un7HYPXJdEl0uTq7OTn
 Wk9Izc31a2MdA3qVR72ilj6ogfpCjeXITYH2/Xxp+mLYNCC19LzNbRiok
 bmhoE0ni7FgH0RsWznLqoMLxGnssfhQfOA5ZMU2FxPwZupKWdjbPcI1QZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="372471779"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="372471779"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 17:57:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722643198"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="722643198"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 14 Apr 2023 17:57:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/5] Improvements to uc firmare management
Date: Fri, 14 Apr 2023 17:57:01 -0700
Message-Id: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (5):
  drm/i915/guc: Decode another GuC load failure case
  drm/i915/guc: Print status register when waiting for GuC to load
  drm/i915/uc: Track patch level versions on reduced version firmware
    files
  drm/i915/uc: Split firmware table validation to a separate function
  drm/i915/uc: Reject doplicate entries in firmware table

 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  12 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 222 ++++++++++++------
 3 files changed, 159 insertions(+), 76 deletions(-)

-- 
2.39.1

