Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D5097D02B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 05:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DC010E781;
	Fri, 20 Sep 2024 03:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFWT+bBc";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D6210E6FD;
 Fri, 20 Sep 2024 03:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726802408; x=1758338408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xXORSofLjo0xYcspwTjfeFEPYiBLYuR9bIfXMZL9mwk=;
 b=HFWT+bBc9FTY0roYyUPIkzwdJkkUc+PVPY2fZp/o2wgddhWdr8LzqYTu
 vE9Nyi7Ek5BmL4Iv0hmALJdsQzR75Jv37MMAUwqG0n7FWDLXzhuJjACUZ
 /DrfzQffxFzqhjj8M4e3me1H7ULlnNwqJSDwhpKlrcp9Rv3FSPRBoAx5q
 aeM5j+bvCFx+yVlUyT5yrzmypWqdxWGx06bp3C/zMumDZsDoZmAnD/ey4
 J6yzkJT3n0Vbq0oHNk3EG02c4ktuKb4eS7GWmfa261MS+DrzQyfVTc0Ik
 TTNxM8X8xCnhb0h9Vx9dT1pJEbdUAJRiA3d3rYJSN4aNMNFkvRlflOlTH Q==;
X-CSE-ConnectionGUID: fzrYXK1qTYOEQNsINCxxBQ==
X-CSE-MsgGUID: xx0NPBWWQVmtIVT0x8PmkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25269796"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25269796"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 20:20:07 -0700
X-CSE-ConnectionGUID: 4toksskxQrO0zWKfAm4+vw==
X-CSE-MsgGUID: 6z3br76vQ4aenI2J24+bTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="69746167"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2024 20:20:07 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v8 00/11] drm/xe/guc: Improve GuC log dumping and add to
 devcoredump
Date: Thu, 19 Sep 2024 20:19:55 -0700
Message-ID: <20240920032007.629624-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

There is a debug mechanism for dumping the GuC log as an ASCII hex
stream via dmesg. This is extremely useful for situations where it is
not possibe to query the log from debugfs (self tests, bugs that cause
the driver to fail to load, system hangs, etc.). However, dumping via
dmesg is not the most reliable. The dmesg buffer is limited in size,
can be rate limited and a simple hex stream is hard to parse by tools.

So add extra information to the dump to make it more robust and
parsable. This includes adding start and end tags to delimit the dump,
using longer lines to reduce the per line overhead, adding a rolling
count to check for missing lines and interleaved concurrent dumps and
adding other important information such as the GuC version number and
timestamp offset. Also, switch to using the much more compact ASCII85
encoding rather than 0x%08X hexdumping.

There are various internal error states that the CTB code can check
for. These should never happen but when they do (driver bug, firmware
bug or even hardware bug), they can be a nightmare to debug. So add in
a capture of the GuC log and CT state at the point of error and
subsequent dump from a worker thread.

Finally, include the GuC log and full CTBs in a devcoredump capture.

Note that the ultimate aim is to then provide a mechanism for
generating a devcoredump at an arbitrary point (such as dead CTB or
failed selftest) and dumping that to dmesg. There are still a few
issues with doing that, but this is all good steps along the way.

v2: Remove pm get/put as unnecessary (review feedback from Matthew B).
v3: Add firmware filename and 'wanted' version number.
v4: Use DRM level line printer wrapper from Michal W. Add 'dead CTB'
dump support. Lots of restructuring of capture vs dump for both GuC
log and CTB capture for both the dead CTB dump and for future
inclusion in devcoredump.
v5: Add missing kerneldocs and other review feedback from Michal W.
Fix printf of size_t, clean up re-arming of dead CTBs, add GuC log to
devcoredump captures.
v6: Replace hexdumps with much more compact ascii85 encoding, drop
module parameter (review feedback from Matthew B). Fix potential
use-after-free bug.
v7: Couple of bug fixes and a bunch of changes to improve
readability/parsablility of the core dump file, debugfs file and dead
CTB dmesg dump.
v8: Fix string size calculation, clean up a macro, fix some
formatting, re-work CT_DEAD capture to prevent potential leak (review
feedback by Julia F). Add more section headers, use drm_puts, use
cached variables.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (10):
  drm/xe/guc: Remove spurious line feed in debug print
  drm/xe/devcoredump: Use drm_puts and already cached local variables
  drm/xe/devcoredump: Improve section headings and add tile info
  drm/xe/devcoredump: Add ASCII85 dump helper function
  drm/xe/guc: Copy GuC log prior to dumping
  drm/xe/guc: Use a two stage dump for GuC logs and add more info
  drm/xe/guc: Dead CT helper
  drm/xe/guc: Dump entire CTB on errors
  drm/xe/guc: Add GuC log to devcoredump captures
  drm/xe/guc: Add a helper function for dumping GuC log to dmesg

Michal Wajdeczko (1):
  drm/print: Introduce drm_line_printer

 drivers/gpu/drm/drm_print.c                   |  14 +
 .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
 drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   1 +
 drivers/gpu/drm/xe/xe_devcoredump.c           | 144 +++++-
 drivers/gpu/drm/xe/xe_devcoredump.h           |   6 +
 drivers/gpu/drm/xe/xe_devcoredump_types.h     |  13 +-
 drivers/gpu/drm/xe/xe_device.c                |   1 +
 drivers/gpu/drm/xe/xe_guc.c                   |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                | 414 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_ct.h                |  10 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h          |  29 +-
 drivers/gpu/drm/xe/xe_guc_log.c               | 208 ++++++++-
 drivers/gpu/drm/xe/xe_guc_log.h               |   5 +
 drivers/gpu/drm/xe/xe_guc_log_types.h         |  27 ++
 drivers/gpu/drm/xe/xe_guc_submit.c            |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   1 -
 include/drm/drm_print.h                       |  64 +++
 17 files changed, 799 insertions(+), 143 deletions(-)

-- 
2.46.0

