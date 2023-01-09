Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854096635D5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1346910E0E4;
	Mon,  9 Jan 2023 23:49:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472D610E0E4;
 Mon,  9 Jan 2023 23:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673308144; x=1704844144;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vdy2p2d6zC0KwOczP8SanW6u2/4yPWGWbzBQGWTRX5I=;
 b=ndjdicoIE+cDQxq9nQtbcFHwZmhCKQwp/jZ0QXXoTKOD8aQcNf0qpQ/y
 D9U1BqAumW7mnzrRrDX1aC8KunUudoITY4BuI0iYwZIjb/lrMdNgBD/GK
 vsKe0grIsOXe73ng60tR9FsuNfjAVNRAUr3/MnJxG+jYKJbaW+cLjlDQh
 uyjlVZkPHf25BKU8VUd/uaY8SBK6DkLjCXkmLAswVUnfbmPxzevQhLwfo
 B0rAB0ecjjGblc/lCEa99rf0NPWLsz1gvP3Cnb9XguQvZyyCtbM8q0mpE
 moPCRJ5fEegjUyKi6M5YW3XGM4tWhlF1y/JOQlnf0nJ/lp5ZLcWRFhB15 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="321713886"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; d="scan'208";a="321713886"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 15:48:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="689220143"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; d="scan'208";a="689220143"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 09 Jan 2023 15:48:57 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 0/1] Add module oriented dmesg output
Date: Mon,  9 Jan 2023 15:48:23 -0800
Message-Id: <20230109234824.1198769-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
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

When trying to analyse bug reports from CI, customers, etc. it can be
difficult to work out exactly what is happening on which GT in a
multi-GT system. So add GT oriented debug/error message wrappers. If
used instead of the drm_ equivalents, you get the same output but with
a GT# prefix on it.

This patch set updates the gt/intel_gt*.c files to use the new helpers
as a first step. The intention would be to convert all output messages
throughout the driver as long as they have access to a GT structure.

v2: Go back to using lower case names, add more wrapper sets (combined
review feedback). Also, wrap up probe injection and WARN entries.
v3: Split definitions out to separate header files. Tweak some
messages. Wrap a couple more functions. (review feedback from Jani and
Michal W).
Convert all gt/intel_gt*.c but drop the GuC/HuC/CT files as too much
bikeshedding about formatting.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (1):
  drm/i915/gt: Start adding module oriented dmesg output

 drivers/gpu/drm/i915/gt/intel_gt.c            | 96 +++++++++----------
 .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |  8 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  9 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c        |  9 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  9 +-
 drivers/gpu/drm/i915/gt/intel_gt_print.h      | 51 ++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c      |  4 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 34 ++-----
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  7 +-
 9 files changed, 129 insertions(+), 98 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_print.h

-- 
2.39.0

