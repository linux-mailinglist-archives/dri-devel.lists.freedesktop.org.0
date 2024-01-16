Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C654982F353
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101AE10E511;
	Tue, 16 Jan 2024 17:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA8410E0B6;
 Tue, 16 Jan 2024 17:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705426954; x=1736962954;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=560I5s7NMlj8uGFQQ89R209V/xuIcN1C4X7/POSmdNc=;
 b=imkqW1lgjQmXmgaofQoeLZHy4gePyWEcfDSxGY2U+6MRbkZB3bVsEPD9
 pBcnqYewCC3eYxh1p/9S7STdT0mtglYXxgoula/PpBDKzwdgBLK9nTzdi
 309TUHgo0S35Fc+on6V88nePoOFGVwzn7LOtP0IJltDjX3pQdViG0WLSu
 p2mZFBq+wz5n/i7M+AGuDiUTxWhmzltFNHLIxLdAZ5gaAGPz/vWR3A6RU
 QU44U/aA0CxnejaC3ykijLj05t9Ayg30hAnN649lwEoG5Ghj2FwaRyZJe
 1R2+uaM8Fbkk75sBf9wEXFvXkIlqaTFK4Vmx1xaKzyNMW/a9DxLoiS1BU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="13288219"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="13288219"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:42:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927555518"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="927555518"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:42:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/5] Fix 32bit build
Date: Tue, 16 Jan 2024 09:40:45 -0800
Message-Id: <20240116174050.2435923-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: thomas.hellstrom@linux.intel.com, ogabbay@kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few fixes when building xe with ARCH=i386.

Changes from v1: the first patch disabling 32b builds is already merged.
These are the real fixes to get it building again.

Lucas De Marchi (5):
  drm/xe: Use _ULL for u64 division
  drm/xe/mmio: Cast to u64 when printing
  drm/xe/display: Avoid calling readq()
  drm/xe: Fix cast on trace variable
  drm/xe: Enable 32bits build

 drivers/gpu/drm/xe/Kconfig                                 | 2 +-
 .../gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h   | 7 +++++--
 drivers/gpu/drm/xe/xe_device.c                             | 2 +-
 drivers/gpu/drm/xe/xe_mmio.c                               | 4 ++--
 drivers/gpu/drm/xe/xe_trace.h                              | 2 +-
 5 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.40.1

