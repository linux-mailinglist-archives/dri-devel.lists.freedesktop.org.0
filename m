Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEADA97328
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 18:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A09D10E601;
	Tue, 22 Apr 2025 16:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mv+7owKN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12EC10E5E6;
 Tue, 22 Apr 2025 16:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745340965; x=1776876965;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XPyp+VSUMHj8QkQdWEbER9eupyYH904t1BLbcRP6i3s=;
 b=Mv+7owKNWjZzlWCHJ/mYOAOWuz1+Qs6+HM71q7xJojy9I0PN/kzjpMHu
 d9ES7OsLe/PjEvAoBHOz/9ub1jaGiKWQqWLuPBCtWh8aRzA7u3eC1mGaq
 kEYp0lrpBVqaf2Wlp0OwcNRd97L2m1qPyKdDpXOBBegulPfmIr5SbTInl
 A2H+6MMYVxefpSzufgfjKSR3mmBJuSwh//inQcYOoH6mXga0LZbrUBW47
 FY7/VoNR7borXLvBwqqP5/ONwCfcatABqMtByEQQugozF00P+E4XX1QTF
 BaAyjtebn6LtnBMH1atCgNl/+pS5kd1alN69aZ/cqCrBiVk1uhMNGlHVM w==;
X-CSE-ConnectionGUID: jAC87b3iTOySlje5rSTpPQ==
X-CSE-MsgGUID: nd6PH+PjRZ6eKs/uQxwBcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46613163"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="46613163"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:56:04 -0700
X-CSE-ConnectionGUID: qIZeKq8XQnmFiGUinH/b+A==
X-CSE-MsgGUID: 1hZbguTmRsqg8VfSLEWc4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136855392"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:56:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v3 0/5] Enable SVM atomics in Xe / GPU SVM
Date: Tue, 22 Apr 2025 09:57:18 -0700
Message-Id: <20250422165723.584286-1-matthew.brost@intel.com>
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
  drm/gpusvm: Introduce devmem_only flag for allocation

Matthew Brost (4):
  drm/xe: Strict migration policy for atomic SVM faults
  drm/gpusvm: Add timeslicing support to GPU SVM
  drm/xe: Timeslice GPU on atomic SVM fault
  drm/xe: Add atomic_svm_timeslice_ms debugfs entry

 drivers/gpu/drm/drm_gpusvm.c         | 14 +++++
 drivers/gpu/drm/xe/xe_debugfs.c      | 38 ++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  3 +
 drivers/gpu/drm/xe/xe_module.c       |  3 -
 drivers/gpu/drm/xe/xe_module.h       |  1 -
 drivers/gpu/drm/xe/xe_svm.c          | 93 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_svm.h          |  5 --
 include/drm/drm_gpusvm.h             |  7 +++
 9 files changed, 132 insertions(+), 33 deletions(-)

-- 
2.34.1

