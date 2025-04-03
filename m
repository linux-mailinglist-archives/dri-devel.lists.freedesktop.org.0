Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B97DA7AE58
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 22:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C1B10EAA4;
	Thu,  3 Apr 2025 20:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvpjxCx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210A310EA5A;
 Thu,  3 Apr 2025 20:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743711955; x=1775247955;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g6lxwX3JwODMbAtpzU/jCxYqumCPW64Kgafm9156iPA=;
 b=QvpjxCx+JASJSzNF2ReHUqWlEUBwBPGTb8FnSyUYgSS690lmxhfJhz50
 B7mH0ZLvREQB9BGBz15xhjk+rP9scWQuzom/4nyZtFn3DdUJQa4zanoVk
 vmFt6wQjiSRjZhJ/9JpWcLhvSKRTQc7OrDyeYavqx6UE6b6NCFK41L3ag
 hUnBg8uJvhbniZNN7/t366NyzokmkN0P+5msaM5/6Yd4QBA/aUF/jSuId
 JrgyQc7t2rVtyA9eoOgFNKJjkCgZgzlJKwuDHweFQ3+Ng11uvuI4QvqoR
 3+iYiagwKUNr2E+mK6mPLrtPUfoKTDT6BefOtGgirJZA/HJWJSM10uCr4 A==;
X-CSE-ConnectionGUID: S8vE7iiJTNGdSbP6CO2dhw==
X-CSE-MsgGUID: Usu5o8gwRyKu7zpEORPhsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55337814"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="55337814"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:25:54 -0700
X-CSE-ConnectionGUID: QeGd+mHrQJ62x2nWsm6ZOQ==
X-CSE-MsgGUID: fwgR1FvISt+WBDPn+/yQ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="127972857"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:25:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] Large devcoredump file support
Date: Thu,  3 Apr 2025 13:27:01 -0700
Message-Id: <20250403202705.18488-1-matthew.brost@intel.com>
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

Devcoredump were truncated at 2G, remove this restriction. While here,
add support for GPU copies of BOs to increase devcoredump speed.

v2:
 - Fix build error
 - Abort printing once printer if full

Matthew Brost (4):
  drm/xe: Add devcoredump chunking
  drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
  drm/print: Add drm_printer_is_full
  drm/xe: Abort printing coredump in VM printer output if full

 drivers/gpu/drm/xe/xe_bo.c                |  15 +-
 drivers/gpu/drm/xe/xe_devcoredump.c       |  59 ++++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_hwconfig.c      |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c           | 221 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h           |   4 +
 drivers/gpu/drm/xe/xe_vm.c                |   3 +
 include/drm/drm_print.h                   |  17 ++
 8 files changed, 293 insertions(+), 30 deletions(-)

-- 
2.34.1

