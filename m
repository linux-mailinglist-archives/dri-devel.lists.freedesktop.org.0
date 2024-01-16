Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D91B82F2FD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644FB10E536;
	Tue, 16 Jan 2024 17:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F38110E4F4;
 Tue, 16 Jan 2024 17:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705425243; x=1736961243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hN3l1AJLiXagHB2N3MbX0fLJI20TXBuzG81bOXBBJjM=;
 b=UAuejwOXNkPB32+HbbBZj9nPdzYLLo9aisJe999QpoKw5OCg+cwxl8aa
 pzdg1h4B5oLkXLXeGxRiwZBQX9Si5BYCkdkwP4uq+GlnjZ5T0OEfr6H08
 dZdePFoEPWNnHvxikIXU8mYN4kOBFIE/vS2h17jCNE9aAlZGxgOD6lAIX
 CkNYZsdDgwSQGq0BxjQB93CPMQK7KI3jJCEFUYke6wKvbsmcDnlLiLMei
 4T6GPYet+S4DQ+jxixfXQ3m4ohmZB1Fc6ref5k9HzR3govzRMMllbWIxl
 KKlPvaSsCKsmR2/qx6xTbQSHm0/v/+/Jad4rUUPRXLr0w5RBm4Hj0Ky9+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399593312"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="399593312"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:12:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="25869595"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 09:12:40 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/guc: Add GuC based register capture for error
 capture
Date: Tue, 16 Jan 2024 09:12:28 -0800
Message-Id: <20240116171237.118463-1-zhanjun.dong@intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Port GuC based register capture for error capture from i915 to Xe.

There are 3 parts in this commit:
. Prepare for capture registers
    There is a bo create at guc ads init time, that is very early
    and engine map is not ready, make it hard to calculate the
    capture buffer size, new function created for worst case size
    caluation. Other than that, this part basically follows the i915
    design.
. Process capture notification message
    Basically follows i915 design
. Sysfs command process.
    Xe switched to devcoredump, adopted command line process with
    captured list.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Zhanjun Dong (9):
  drm/xe/guc: Add register defines for GuC based register capture
  drm/xe/guc: Expose dss per group for GuC error capture
  drm/xe/guc: Update GuC ADS size for error capture
  drm/xe/guc: Add XE_LP steered register lists
  drm/xe/guc: Add capture size check in GuC log buffer
  drm/xe/guc: Check sizing of guc_capture output
  drm/xe/guc: Extract GuC error capture lists on G2H notification
  drm/xe/guc: Pre-allocate output nodes for extraction
  drm/xe/guc: Plumb GuC-capture into dev coredump

 drivers/gpu/drm/xe/Kconfig               |   11 +
 drivers/gpu/drm/xe/Makefile              |    1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |    7 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   12 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   20 +
 drivers/gpu/drm/xe/xe_gt_mcr.c           |    4 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h           |    1 +
 drivers/gpu/drm/xe/xe_gt_printk.h        |    3 +
 drivers/gpu/drm/xe/xe_gt_topology.c      |    3 -
 drivers/gpu/drm/xe/xe_guc.c              |    7 +
 drivers/gpu/drm/xe/xe_guc_ads.c          |  255 +++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c      | 1404 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h      |   35 +
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  225 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h         |   68 ++
 drivers/gpu/drm/xe/xe_guc_log.c          |  179 +++
 drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
 drivers/gpu/drm/xe/xe_guc_log_types.h    |   26 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |   22 +-
 drivers/gpu/drm/xe/xe_guc_submit.h       |    3 +
 drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c        |   73 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  106 +-
 25 files changed, 2355 insertions(+), 131 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h

-- 
2.34.1

