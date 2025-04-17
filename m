Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C2A9122A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 06:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E5210EA2B;
	Thu, 17 Apr 2025 04:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQIWrDV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DE710E01F;
 Thu, 17 Apr 2025 04:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744863143; x=1776399143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I9zEvCpjMHi2YO8IOY2hVdX413juxB0ixdM/JA5o8Jw=;
 b=VQIWrDV0NA1nQN1ojot2rLl9GobifWrSIaJwpEwzndfcncuaeZaUr/gc
 6TrXMUhnbg7+SJ1ExKZuDNXs7I9AvcHgXjUstQO/fVMjpMbiW03wqVS4q
 hTKW597/ZW/pbxHg9Blf653AtsHYCkZmBEGnssbS1yxLd0JLqYKmfk1BS
 ral8l1IfI0s+xIksyzXLqR6tIev5S4c6cpiNIm8fU66jM0tSvFwK+dNZ9
 NQRitTaEMCUZ4MXgWvbiuewap2yEH65HXWe4ufy/JehB2qMglI5VXkzAX
 PCz7Vziv2GzE4VDnyISJoQCTUH58mFGmdy9iNMVtdqJJlIin4PrkBAh90 Q==;
X-CSE-ConnectionGUID: DZJwSJArQ2yf+sHH7m/36w==
X-CSE-MsgGUID: JmHpkBsASV+KXBqhGfme1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="34050104"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="34050104"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:12:23 -0700
X-CSE-ConnectionGUID: mGEqlD9mRLOQlPbIsCzr9g==
X-CSE-MsgGUID: yBExQ+3lTKGxVNpUiUCWWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131216552"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:12:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 0/5] Enable SVM atomics in Xe / GPU SVM
Date: Wed, 16 Apr 2025 21:13:35 -0700
Message-Id: <20250417041340.479973-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Minimal set of patches to enable compute UMD SVM atomics.

Collaboration with Himal.

Matt

Himal Prasad Ghimiray (1):
  drm/gpusvm: Introduce vram_only flag for VRAM allocation

Matthew Brost (4):
  drm/xe: Strict migration policy for atomic SVM faults
  drm/gpusvm: Add timeslicing support to GPU SVM
  drm/xe: Timeslice GPU on atomic SVM fault
  drm/xe: Add atomic_svm_timeslice_ms debugfs entry

 drivers/gpu/drm/drm_gpusvm.c         | 14 +++++++
 drivers/gpu/drm/xe/xe_debugfs.c      | 38 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_module.c       |  3 --
 drivers/gpu/drm/xe/xe_module.h       |  1 -
 drivers/gpu/drm/xe/xe_svm.c          | 59 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_svm.h          |  5 ---
 include/drm/drm_gpusvm.h             |  7 ++++
 9 files changed, 109 insertions(+), 22 deletions(-)

-- 
2.34.1

