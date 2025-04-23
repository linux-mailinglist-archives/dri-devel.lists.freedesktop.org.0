Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E3A98A8E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07A610E693;
	Wed, 23 Apr 2025 13:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F82hhpVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFD410E671;
 Wed, 23 Apr 2025 13:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745413836; x=1776949836;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=g+fuh7650gSDCrvJk4QPIb9orFRAKamRsHau3x2ml0o=;
 b=F82hhpVoNIcJqnLiRhb/1Jkfz1fpRDiKFKFZzTmZIbyiLBFq0hr/YB3g
 KICBR0An9i+jz6f+UH8U0mYizVQgQRaFWGypOmr2o1FTmx6WoH4GD61ax
 T2F3iyh+69UZprttwgv5llMc82xAIUkJL86YUlAWC9q1JpYalKeaboUZf
 ElmW0F4SHI4V2m7deKZatjPzmXc+4r/UwtVYUNwDwCGUidM6NnLohja1B
 FXMYebECBxhTPUaMvTA2E/Yw9XS+Qi1gVR64FbYMwF7rymSQ0MQRzmvUj
 200O7M/V7rVb/ouajaykg5NSTfUfxmDBzKDpIU5rNbag5+bi6Lbe37qvW Q==;
X-CSE-ConnectionGUID: 8DfxgFYYSA2d0dpGXr9sPA==
X-CSE-MsgGUID: JOJm2v+CRTyRl12EkCKNDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47185223"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47185223"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 06:08:22 -0700
X-CSE-ConnectionGUID: dTTWHLiQTKW9h1+dV4flCA==
X-CSE-MsgGUID: iOWfUSj0R22vQG7dejctVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="133196369"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa009.fm.intel.com with ESMTP; 23 Apr 2025 06:08:00 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v5 0/2] Rework/Correction on minimum hblank calculation
Date: Wed, 23 Apr 2025 18:23:32 +0530
Message-Id: <20250423-hblank-v5-0-6bee618bc979@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMziCGgC/12Pyw6CMBBFf8V0TU07fQCu/A/joo9RGhEMkEZD+
 HcLCQRd3pt7zmRG0mMXsCenw0g6jKEPbZOCyg7EVaa5Iw0+ZQIMFJMsp5WtTfOgsrRCMoPWCE7
 S+NXhLbwX0eWachX6oe0+izfyuV0VxaqInDIqreF50iBqdQ7NgPXRtU8yKyLsMK42DBLGDQgsf
 ZkLzf4xucMANkwmzHqbW186WWi3w7L1PxA/8wIVF84pqRXsr0zT9AXJdlsyOQEAAA==
X-Change-ID: 20250407-hblank-49b340aeba31
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: imre.deak@intel.com, vinod.govindapillai@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Changes in v5:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v4: https://lore.kernel.org/r/20250423-hblank-v4-0-8e513cc54652@intel.com

Changes in v5:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v4: https://lore.kernel.org/r/20250422-hblank-v4-0-bdb7bd9c486c@intel.com

Changes in v3:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://lore.kernel.org/r/20250415-hblank-v2-0-1a23e9d97360@intel.com

Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250408-hblank-v1-0-4ba17aebee65@intel.com

---
Arun R Murthy (2):
      drm/display/dp: Export fn to calculate link symbol cycles
      drm/i915/display: move min_hblank from dp_mst.c to dp.c

 drivers/gpu/drm/display/drm_dp_helper.c      | 51 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_display.c | 18 +++++++
 drivers/gpu/drm/i915/display/intel_dp.c      | 76 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h      |  3 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 57 +++------------------
 include/drm/display/drm_dp_helper.h          |  2 +
 6 files changed, 138 insertions(+), 69 deletions(-)
---
base-commit: ada794bd93930fd265c2df8f38196994173e1fde
change-id: 20250407-hblank-49b340aeba31

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

