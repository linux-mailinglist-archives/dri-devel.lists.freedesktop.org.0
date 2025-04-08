Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4209A7F38A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 06:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA9510E1F9;
	Tue,  8 Apr 2025 04:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZItzXi2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADBD10E113;
 Tue,  8 Apr 2025 04:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744086312; x=1775622312;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=maY77zyBJXqoChT8hJnQGcfIMrV0E2pq8QkkwKr+6Ig=;
 b=ZItzXi2D6WrddkVV0apVf+1Od6dc+za2TyLXy1wWumT2P3LvdrkNgPrT
 DH9EQGEK3QoqRxLzc+ykxaVe/2BZIkvyKL+C8XPkNDXLCEG9Fcu2g8MIY
 6jSJADrD3PXNLVVkHea9jBt/hmavxvjKuoy9JTYv4eST3n3pZAdUi1U/N
 IiA11ncySkq2aoiaNKfQYlfMdI03OgbMweb/MEmQrcAHo6+a+NLcVRQVW
 eKgiTvwntOr/K6jzQLFXDSmhaTtGAZld5+6tCSrbSIU07azFeCElBlvxO
 ku+J8R22ZGYzPWo0pvzNXRjD9bg+NK7JyEPt4736V8tZFm+gt4iFilLUL A==;
X-CSE-ConnectionGUID: mCgDIX8FRt2qvQC9ASkGPA==
X-CSE-MsgGUID: s7inR+xTQOSkoHU9HiIV2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="63043683"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="63043683"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 21:25:12 -0700
X-CSE-ConnectionGUID: J/CR2wrAT5iYm8xfV2T4Jg==
X-CSE-MsgGUID: DDfVANXpSumq+GYdQbBdHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="128479396"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa008.fm.intel.com with ESMTP; 07 Apr 2025 21:25:10 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 0/3] Rework/Correction on minimum hblank calculation
Date: Tue, 08 Apr 2025 09:40:33 +0530
Message-Id: <20250408-hblank-v1-0-4ba17aebee65@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALmh9GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNz3YyknMS8bF0TyyRjE4PE1KREY0MloOKCotS0zAqwQdGxtbUA4uf
 RYFgAAAA=
X-Change-ID: 20250407-hblank-49b340aeba31
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com, 
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
Arun R Murthy (3):
      drm/drm_dp_helper: export link symbol cycles calculation
      drm/i915/display: export function to count dsc slices
      drm/i915/audio: move min_hblank from dp_mst to audio

 drivers/gpu/drm/display/drm_dp_helper.c     | 10 ++--
 drivers/gpu/drm/i915/display/intel_audio.c  | 78 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 55 ++------------------
 drivers/gpu/drm/i915/display/intel_dp_mst.h |  3 ++
 include/drm/display/drm_dp_helper.h         |  5 ++
 5 files changed, 95 insertions(+), 56 deletions(-)
---
base-commit: c4fc93b0ec49f4b0105c142502b7d1d5de379950
change-id: 20250407-hblank-49b340aeba31

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

