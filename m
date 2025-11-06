Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8CDC3A1BB
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 11:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F7910E875;
	Thu,  6 Nov 2025 10:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AED+P+oB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9A710E875
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 10:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762423866; x=1793959866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wSLn6B1YZbXPH2jnB2A6Alh8mrfwN8MscKCFQbkRIUw=;
 b=AED+P+oBovG9WeXOG2Ewq1VEq/WWXfYGFoBDuuqb5Zmv7NmzBkRYRoDZ
 XwH076C1wDV0fMjdLMtYoi8D3+U9I4p+P8EsDNt3VHfLHjCf/dw2IukAp
 /tngcv0hwiVLZSgywDFPMok9ssP6klNXU5k9lsOlLF28kWNjBy5/Ba+DT
 bItiHxzZp6pXIA9tga49Y4Mzw8lq/LVEcNDxVDVpDZCd8UZ2C3d91lEl/
 5kHowT+PaPUyXiYYiFFHjJ4k/8ohZJveCZHjwbYac2JgMpnRQLC972zdW
 elKCujpip8yyDPparcvcGRNnqPp8YZsfbAGgCNWQdd8K7u/lQ/BoMg6re w==;
X-CSE-ConnectionGUID: BQM5IsqeThe4LlyP+MuNeA==
X-CSE-MsgGUID: hz6X7mD/STyOAWzeWRW7iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="81959753"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="81959753"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:11:06 -0800
X-CSE-ConnectionGUID: cFoG8ZpmR8+6cKeItBP9LA==
X-CSE-MsgGUID: DJelL/j9QDy6KnYlBW+i0A==
X-ExtLoop1: 1
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:11:04 -0800
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH 0/2] accel/ivpu: Add memory statistics support
Date: Thu,  6 Nov 2025 11:10:50 +0100
Message-ID: <20251106101052.1050348-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Add support for reporting memory usage statistics via fdinfo and correct
the memory utilization calculation to count only resident buffers via
sysfs.

Karol Wachowski (2):
  accel/ivpu: Add fdinfo support for memory statistics
  accel/ivpu: Count only resident buffers in memory utilization

 drivers/accel/ivpu/ivpu_drv.c   |  6 ++++++
 drivers/accel/ivpu/ivpu_gem.c   | 12 ++++++++++++
 drivers/accel/ivpu/ivpu_gem.h   |  5 +++++
 drivers/accel/ivpu/ivpu_sysfs.c |  3 ++-
 4 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.43.0

